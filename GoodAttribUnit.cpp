//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "GoodAttribUnit.h"
#include "MessageBoxes.h"
#include "CommonUnit.h"
#include "DbUnit.h"
#include "ImcomingUnit.h"
#include "GoodsFrameUnit.h"
#include "StorageUnit.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TGoodAttribForm *GoodAttribForm;
//---------------------------------------------------------------------------
__fastcall TGoodAttribForm::TGoodAttribForm(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TGoodAttribForm::OkClick(TObject *Sender)
{
    if ( m_opType == TYPES_NULL )
    {
        try
        {
            pDS->Edit();

            pDS->FieldByName("name")->Value = GoodsName->Text;
            pDS->FieldByName("goodcode")->Value = GoodsCode->Text;

            pDS->Post();

            ModalResult = mrOk;
        }
        catch(...)
        {
            pDS->Cancel();
            ShowError("商品属性输入错误");
        }
    }
    else if ( m_opType == TYPES_GOODSINFO )
    {
        if ( (GoodsName->Text).Trim().IsEmpty() )
        {
            ShowMessage("请填写商品名称！");
            return;
        }
        if ( (GoodsDesp->Text).Trim().IsEmpty() )
        {
            ShowMessage("请填写商品描述！");
            return;
        }

        try
        {
//            AnsiString Info("The fields are: ");
//            for(int i = 0; i < pDS->FieldCount; i++)
//                Info = Info + pDS->Fields->Fields[i]->FieldName + ", ";
//            ShowMessage(Info);

            q->Close();
            q->SQL->Text = "select max(idx) as max_idx from t_goods";
            q->Open();
            int maxidx = q->FieldByName("max_idx")->AsInteger;

            pDS->Append();

            pDS->FieldByName("idx")->Value        = maxidx + 1;
            pDS->FieldByName("typeidx")->Value    = GoodsAttr->Text;
            pDS->FieldByName("barcode")->Value    = GoodsBarcode->Text;
            pDS->FieldByName("name")->Value       = GoodsName->Text;
            pDS->FieldByName("goodcode")->Value   = GoodsCode->Text;
            pDS->FieldByName("goodnumber")->Value = GoodsNumber->Text;
            pDS->FieldByName("cost")->Value       = GoodsCost->Text;
            pDS->FieldByName("labelprice")->Value = GoodsSellPrice->Text;
            pDS->FieldByName("desp")->Value       = GoodsDesp->Text;
            pDS->FieldByName("goodtype")->Value   = GoodsType->ItemIndex;
            pDS->FieldByName("added")->Value      = 0;  
            
            pDS->Post();

            ModalResult = mrOk;
        }
        catch(...)
        {
            pDS->Cancel();
            ShowError("商品属性输入错误");
        }
    }
}
//---------------------------------------------------------------------------

bool __fastcall TGoodAttribForm::SetGoodItem(TDataSet *pds, OP_TYPES op_type)
{
    if ( pds == 0 ) return false;

    pDS = pds;

    try
    {
        m_opType = op_type;

        GoodsName->Text = pDS->FieldByName("name")->Value;
        GoodsAttr->Text = pDS->FieldByName("typeidx")->Value;
        GoodsBarcode->Text = pDS->FieldByName("barcode")->Value;
        GoodsCode->Text = pDS->FieldByName("goodcode")->Value;
        GoodsNumber->Text = pDS->FieldByName("goodnumber")->Value;
        GoodsCost->Text = pDS->FieldByName("cost")->Value;
        GoodsSellPrice->Text = pDS->FieldByName("labelprice")->Value;
        GoodsLowestPrice->Text = pDS->FieldByName("lowestprice")->Value;
        GoodsDesp->Text = pDS->FieldByName("desp")->Value;
        GoodsType->ItemIndex = pDS->FieldByName("g_goodtype")->Value;
    }
    catch(...)
    {
        ShowError( "错误的物品条目" );
    }

    if ( ShowModal() == mrOk ) return true;
    return false;
}
//---------------------------------------------------------------------------

bool __fastcall TGoodAttribForm::InsertGoods(TDataSet *pds, OP_TYPES op_type)
{
    if ( pds == 0 ) return false;
    
    pDS = pds;

    try
    {
        m_opType = op_type;

        GoodsName->Text = "";
        GoodsAttr->Text = StorageForm->GoodsFrame1->GetGoodsCatagory();
        GoodsBarcode->Text = IncomingForm->GenerateBarCode();
        GoodsCode->Text = "1";
        GoodsNumber->Text = "100";
        GoodsCost->Text = "1.0";
        GoodsSellPrice->Text = "1.0";
        GoodsLowestPrice->Text = "1.0";
        GoodsDesp->Text = "添加描述";
    }
    catch(...)
    {
        ShowError( "错误的物品条目" );
    }

    if ( ShowModal() == mrOk ) return true;

    return false;
}


