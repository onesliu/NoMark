//---------------------------------------------------------------------------

#include <vcl.h>
#include <stdio.h>
#pragma hdrstop

#include "ImcomingUnit.h"
#include "DbUnit.h"
#include "CommonUnit.h"
#include "MessageBoxes.h"
#include "SelectUnit.h"
#include "qyycy.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TIncomingForm *IncomingForm;
//---------------------------------------------------------------------------
__fastcall TIncomingForm::TIncomingForm(TComponent* Owner)
    : TForm(Owner)
{
    pCurGood = 0;
}
//---------------------------------------------------------------------------

AnsiString TIncomingForm::GenerateBarCode()
{
    int maxbar = 0;
    q2->SQL->Text = "select max(barcode) as maxbar from t_goods where barcode like '2%'";
    q2->Open();
    if ( !q2->FieldByName("maxbar")->IsNull )
        maxbar = q2->FieldByName("maxbar")->AsString.SubString(3, 5).ToInt();
    q2->Close();

    return AnsiString().sprintf( "20%05d00000", maxbar+1 );
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::FreshList()
{
    if ( IncomingIdx <= 0 ) return;

    TListItem *pItem;

    q->SQL->Text = "select g.idx,g.name,g.goodcode,g.goodnumber,g.cost,g.labelprice,\
    g.lowestprice,g.barcode,il.name as listname,il.desp \
    from t_incoming_list il left outer join t_incoming_goods ig on il.idx=ig.listidx \
    left outer join t_goods g on ig.goodidx=g.idx \
    where il.idx = " + IntToStr(IncomingIdx);
    q->Open();
    for ( q->First(); !q->Eof; q->Next() )
    {
        pItem = BuyList->Items->Add();
        pItem->Caption = q->FieldByName("name")->AsString;
        pItem->SubItems->Add( q->FieldByName("barcode")->AsString );
        pItem->SubItems->Add( q->FieldByName("goodnumber")->AsString );
        pItem->SubItems->Add( MoneyStr(q->FieldByName("cost")->AsFloat) );
        pItem->SubItems->Add( MoneyStr(q->FieldByName("labelprice")->AsFloat) );
        pItem->SubItems->Add( MoneyStr(q->FieldByName("lowestprice")->AsFloat) );
        pItem->SubItems->Add( q->FieldByName("goodcode")->AsString );

        pItem->Data = (void*)q->FieldByName("idx")->AsInteger;
    }
    q->First();
    ListName->Text = q->FieldByName("listname")->AsString;
    ListDesp->Text = q->FieldByName("desp")->AsString;
    q->Close();
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::ClearAttrib()
{
    GoodName->Text = "";
    GoodCode->Text = "";
    Cost->Text = "";
    Number->Text = "";
    BarCode->Text = "";
    SellPrice->Text = "";
    SellPrice->Visible = true;
    Label6->Visible = true;
    today = Now();
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::ClearAll()
{
    ClearAttrib();
    ListName->Text = "";
    ListDesp->Text = "";

    BuyList->Clear();
    EnableAttrib( false );
}
//---------------------------------------------------------------------------
int __fastcall TIncomingForm::CheckComplete(TListItem *pCurGood) {

    if ( pCurGood->Caption.Length() <=0 ||
         pCurGood->SubItems->Strings[0].Length() <= 0 ||
         pCurGood->SubItems->Strings[1].Length() <= 0 ||
         pCurGood->SubItems->Strings[2].Length() <= 0 ||
         pCurGood->SubItems->Strings[3].Length() <= 0 ||
         pCurGood->SubItems->Strings[4].Length() <= 0 )
    {
        return 0; // not complete
    }

    return 1; // complete
}

int __fastcall TIncomingForm::CheckCurComplete()
{
    if ( pCurGood != 0 )
    {
		if (CheckComplete(pCurGood) == 0) {
            BuyList->Enabled = false;
            AddGood->Enabled = false;
		}
		else {
			BuyList->Enabled = true;
            AddGood->Enabled = true;
		}
    }

    BuyList->Enabled = true;
    AddGood->Enabled = true;
    return -1; // no current good
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::AddGoodExecute(TObject *Sender)
{
    int cur_complete = CheckCurComplete();

    if ( cur_complete == 0 )
    {
        ShowError("当前商品信息输入不完整, 请输入完整后再增加新商品");
        return;
    }

    SumAll();

    pCurGood = BuyList->Items->Add();
    pCurGood->Data = 0;
    pCurGood->SubItems->Text = "\r\n\r\n\r\n\r\n\r\n\r\n\r\n";
    pCurGood->Selected = true;
    pCurGood->MakeVisible( false );
    ClearAttrib();
    pCurGood->SubItems->Strings[6] = today.FormatString( "yyyy-mm-dd hh:nn:ss" );

    BarCode->Text = GenerateBarCode();

    GoodName->SetFocus();
    BuyList->Enabled = false;
    AddGood->Enabled = false;
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::SumAll()
{
    int i;
    double tc, n, tn;
    TListItem * pItem;

    tn = 0;
    tc = 0.00;
    for ( i = 0; i < BuyList->Items->Count; i++ )
    {
        pItem = BuyList->Items->Item[i];
        n = pItem->SubItems->Strings[1].ToDouble();
        tn += n;
        tc += n * pItem->SubItems->Strings[2].ToDouble();
    }

    tnumber->Caption = tn;
    tcost->Caption = AnsiString().sprintf( "%.2f", tc );
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::GoodNameChange(TObject *Sender)
{
    if ( pCurGood )
        pCurGood->Caption = GoodName->Text;
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::GoodCodeChange(TObject *Sender)
{
    if ( pCurGood )
        pCurGood->SubItems->Strings[4] = GoodCode->Text;
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::CostChange(TObject *Sender)
{
    if ( pCurGood )
        pCurGood->SubItems->Strings[2] = Cost->Text;

    if ( CheckCurComplete() == 1 ) SumAll();
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::NumberChange(TObject *Sender)
{
    if ( pCurGood )
        pCurGood->SubItems->Strings[1] = Number->Text;

    if ( CheckCurComplete() == 1 ) SumAll();
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::BarCodeChange(TObject *Sender)
{
    if ( pCurGood )
        pCurGood->SubItems->Strings[0] = BarCode->Text;
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::SellPriceChange(TObject *Sender)
{
    if ( pCurGood )
        pCurGood->SubItems->Strings[3] = SellPrice->Text;

    if ( CheckCurComplete() == 1 ) SumAll();
}
//---------------------------------------------------------------------------


bool __fastcall TIncomingForm::NewIncoming( int idx, int goodtype )
{
    IncomingIdx = idx;
    ClearAll();
    pCurGood = 0;
    today = Now();

    dGoodType = goodtype;
    if (dGoodType == 0) {
        GoodType->Caption = "计件商品";
        Label4->Caption = "数量";
        Label21->Caption = "个";
        ListDesp->Text = "已包装商品进货";
    }
    else {
        GoodType->Caption = "计重商品";
        Label4->Caption = "重量";
        Label21->Caption = "公斤";
        ListDesp->Text = "生鲜散装商品进货";
    }

    if ( IncomingIdx <= 0 )
    {
        ListDate->Caption = today.FormatString( "yyyy-mm-dd" );
        ListName->Text = ListDate->Caption + " 进货单";

        CalcType->ItemIndex = 0;
        CalcPercent->Text = 40;

        Label22->Visible = true;
        GoodType->Visible = true;

        AddGood->Enabled = true;
        DelGood->Enabled = true;
        ImportText->Enabled = true;
        Ok->Enabled = true;
        Cancel->Caption = "不保存进货单";
        BuyList->OnSelectItem = BuyListSelectItem;
        Cancel->OnClick = CancelClick;

        DelGood->Enabled = false;
        if ( pCurGood ) DelGood->Enabled = true;

        CalcType->Enabled = true;
        CalcPercent->Enabled = true;

        tnumber->Caption = 0;
        tcost->Caption = 0;
    }
    else
    {
        FreshList();

        AddGood->Enabled = false;
        DelGood->Enabled = false;
        ImportText->Enabled = false;
        Ok->Enabled = false;
        Cancel->Caption = "退出查看";
        BuyList->OnSelectItem = 0;
        Cancel->OnClick = Cancel2Click;

        CalcType->Enabled = false;
        CalcPercent->Enabled = false;

        Label22->Visible = false;
        GoodType->Visible = false;

        SumAll();
    }

    if ( ShowModal() == mrOk ) return true;
    return false;
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::BuyListSelectItem(TObject *Sender,
      TListItem *Item, bool Selected)
{
    if ( Selected ) {
        pCurGood = Item;
        FillAttrib();
        if ((int)pCurGood->Data == -1) {
            SellPrice->Visible = false;
            Label6->Visible = false;
        }
        else {
            SellPrice->Visible = true;
            Label6->Visible = true;
        }
    }
    DelGood->Enabled = Selected;
    EnableAttrib( Selected );
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::EnableAttrib( bool e )
{
    GoodName->Enabled = e;
    GoodCode->Enabled = e;
    Cost->Enabled = e;
    Number->Enabled = e;
    BarCode->Enabled = e;
    SellPrice->Enabled = e;
    Label2->Enabled = e;
    Label3->Enabled = e;
    Label4->Enabled = e;
    Label5->Enabled = e;
    Label6->Enabled = e;
    Label7->Enabled = e;
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::FillAttrib()
{
    GoodName->Text = pCurGood->Caption;
    BarCode->Text = pCurGood->SubItems->Strings[0];
    Number->Text = pCurGood->SubItems->Strings[1];
    Cost->Text = pCurGood->SubItems->Strings[2];
    SellPrice->Text = pCurGood->SubItems->Strings[3];
    GoodCode->Text = pCurGood->SubItems->Strings[4];
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::CostKeyPress(TObject *Sender, char &Key)
{
    if ( (Key < '0' || Key > '9') && Key != 8 && Key != 0x0D && Key != '.' ) Abort();
    if ( Key == 0x0D )
    {
        TEdit * pEdit = (TEdit *)Sender;
        try {
            pEdit->Text = MoneyStr(pEdit->Text.ToDouble());
        } catch(...) {
            ShowError("金额输入不正确，请更改");
            pEdit->SetFocus();
        }
    }
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::NumberKeyPress(TObject *Sender, char &Key)
{
    if ( (Key < '0' || Key > '9') && Key != 8 && Key != '.' && Key != 0x0D ) Abort();
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::KeyPressMove(TObject *Sender, char Key)
{
    TWinControl * pControl;
    TList * list;

    if ( Key == 0x0D || Key == 40 || Key == 38 )
    {
        pControl = (TWinControl*)Sender;
        list = new TList();
        GroupBox2->GetTabOrderList( list );

        switch ( Key ) {
        case 0x0D: ;
        case 40:
            for ( int i = 1; i < list->Count; i++ )
            {
                if ( pControl == list->Items[i-1] ) {
                    TWinControl *pc = (TWinControl *)(list->Items[i]);
                    if (pc->Visible && pc->Enabled)
                        pc->SetFocus();
                }
            }
            break;
        case 38:
            for ( int i = list->Count - 1; i > 0; i-- )
            {
                if (pControl == list->Items[i] ) {
                    TWinControl *pc = (TWinControl *)(list->Items[i-1]);
                    if (pc->Visible && pc->Enabled)
                        pc->SetFocus();
                }
            }
            break;
        }

        delete list;
    }
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::DelGoodExecute(TObject *Sender)
{
    if ( ShowYesNo( "是否删除当前物品" ) == true )
    {
        int idx = pCurGood->Index;
        TListItem *pItem = 0;
        if ( idx > 0 ) pItem = BuyList->Items->Item[idx-1];

        pCurGood->Delete();
        pCurGood = pItem;
        if ( pCurGood ) pCurGood->Selected = true;
        CheckCurComplete();
    }
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::OkClick(TObject *Sender)
{
    if ( BuyList->Items->Count <= 0 )
    {
        ShowError( "进货单为空" );
        return;
    }

    if ( ShowYesNo("进货单准备过帐，确定吗?") == false ) return;

    if ( UpdateToDb() )
        ModalResult = mrOk;
}
//---------------------------------------------------------------------------

bool __fastcall TIncomingForm::UpdateToDb()
{
    int i;
    TListItem * pItem;
    AnsiString sql;
    double totalcost, totalnumber;
    int goodidx, max_in, max_g;

    AnsiString Goodname, GoodCode, GoodBar;
    double GoodNumber;
    double GoodCost, GoodPrice;

    // check completion
    for ( i = 0; i < BuyList->Items->Count; i++ )
    {
        pItem = BuyList->Items->Item[i];
        if ( CheckComplete(pItem) == 0 )
        {
			ShowWarning( "进货单填写不完整" );
			pItem->Selected = true;
			GoodName->SetFocus();
			return false;
        }
    }

    totalcost = 0.0;
    totalnumber = 0;
    for ( i = 0; i < BuyList->Items->Count; i++ )
    {
        totalcost += BuyList->Items->Item[i]->SubItems->Strings[2].ToDouble() *
            BuyList->Items->Item[i]->SubItems->Strings[1].ToDouble();
        totalnumber += BuyList->Items->Item[i]->SubItems->Strings[1].ToDouble();
    }

    try {

    q->Close();
    q->SQL->Text = "select MAX(idx) as mid from t_incoming_list";
    q->Open();
    max_in = q->FieldByName("mid")->AsInteger + 1;
    q->Close();

    q->SQL->Text = "select MAX(idx) as mid from t_goods";
    q->Open();
    max_g = q->FieldByName("mid")->AsInteger + 1;
    q->Close();

    if (d->trans->InTransaction) d->trans->Commit();
    d->trans->AutoStopAction = saNone;

    if ( IncomingIdx <= 0 )
    {
        ExecSQL( "set generator t_incoming_list_gen to " + IntToStr(max_in-1) );
        ExecSQL( "set generator t_goods_gen to " + IntToStr(max_g-1) );

        // insert incoming list
        sql.sprintf( "insert into t_incoming_list(incomingdate, name, desp, totalcost, totalnumber) \
        values('%s', '%s', '%s', %.2f, %.2f)", ListDate->Caption, ListName->Text,
        ListDesp->Text, totalcost, totalnumber );
        ExecSQL( sql );

        // insert new goods
        for ( i = 0; i < BuyList->Items->Count; i++ )
        {
            pItem = BuyList->Items->Item[i];
            Goodname = pItem->Caption;
            GoodBar = pItem->SubItems->Strings[0];
            GoodNumber = pItem->SubItems->Strings[1].ToDouble();
            GoodCost = pItem->SubItems->Strings[2].ToDouble();
            GoodPrice = pItem->SubItems->Strings[3].ToDouble();
            GoodCode = pItem->SubItems->Strings[4];

            sql.sprintf("select idx from t_goods where barcode='%s'", GoodBar);
            q->SQL->Text = sql;
            q->Open();
            if ( q->RecordCount > 0 )
				goodidx = q->FieldByName("idx")->AsInteger;
			else
				goodidx = max_g;
			q->Close();

			if (goodidx == max_g) {
	            sql.sprintf( "insert into t_goods( barcode, name, goodcode, cost, goodnumber, \
	            labelprice, labelprinted, goodtype ) values('%s', '%s', '%s', \
	            %.2f, %.2f, %.2f, %d, %d)", GoodBar, Goodname, GoodCode, GoodCost, GoodNumber,
	            GoodPrice, (int)GoodNumber, dGoodType );

				max_g++;
			}
			else {
	            sql.sprintf( "update t_goods set goodnumber=goodnumber+%.2f, cost=(goodnumber*cost+%.2f*%.2f)/(goodnumber+%.2f) where barcode='%s'",
					GoodNumber, GoodCost, GoodNumber, GoodNumber, GoodBar); //成本加权平均计算
			}
			ExecSQL( sql );

            sql.sprintf( "insert into t_incoming_goods(goodidx, listidx, goodnumber, cost) \
            values( %d, %d, %.2f, %.2f )", goodidx, max_in, GoodNumber, GoodCost );
            ExecSQL( sql );
        }
    }

    d->trans->Commit();
    d->trans->AutoStopAction = saCommit;

    } catch (...)
    {
        d->trans->Rollback();
        d->trans->AutoStopAction = saCommit;
        ShowError("入库出错!进货单输入有误!");
        return false;
    }

    return true;
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::SellPriceEnter(TObject *Sender)
{
    if ( Cost->Text != "" && SellPrice->Text == "" )
    {
        if ( CalcType->ItemIndex == 0 )
        {
            SellPrice->Text = MoneyStr(Cost->Text.ToDouble()/(1-CalcPercent->Text.ToDouble()/100));
        }
    }
    SellPrice->SelectAll();
}
//---------------------------------------------------------------------------


void __fastcall TIncomingForm::GoodNameKeyDown(TObject *Sender, WORD &Key,
      TShiftState Shift)
{
    KeyPressMove( Sender, Key );
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::GoodCodeEnter(TObject *Sender)
{
    if ( GoodCode->Text == "" )
    {
        GoodCode->Text = "无";
    }
    GoodCode->SelectAll();
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::CostEnter(TObject *Sender)
{
    /*
    if ( Cost->Text == "" )
        Cost->Text = "0";
    */
    if ( SellPrice->Text != "" && Cost->Text == "" )
    {
        if ( CalcType->ItemIndex == 1 )
        {
            Cost->Text = MoneyStr(SellPrice->Text.ToDouble() * CalcPercent->Text.ToInt() / 100);
        }
    }

    Cost->SelectAll();

    if ( CheckCurComplete() == 1 ) SumAll();
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::NumberEnter(TObject *Sender)
{
    if ( Number->Text == "" )
        Number->Text = "0";
    Number->SelectAll();
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::ExportTextExecute(TObject *Sender)
{
    FILE * fp;

    if ( BuyList->Items->Count <= 0 ) return;

    if ( FileSaveDialog->Execute() == false ) return;

    fp = fopen( FileSaveDialog->FileName.c_str(), "w" );
    if ( !fp ) {
        ShowError("文件打开错误,可能其它程序正在使用该文件");
        return;
    }
    Janitor g_fp( fclose, fp );

    for ( int i = 0; i < BuyList->Items->Count; i++ )
    {
        fprintf( fp, "%s,%s,%s,%s,%s,%s\n",
        BuyList->Items->Item[i]->Caption.c_str(),
        BuyList->Items->Item[i]->SubItems->Strings[0].c_str(),
        BuyList->Items->Item[i]->SubItems->Strings[1].c_str(),
        BuyList->Items->Item[i]->SubItems->Strings[2].c_str(),
        BuyList->Items->Item[i]->SubItems->Strings[3].c_str(),
        BuyList->Items->Item[i]->SubItems->Strings[4].c_str()
        );
    }

    ShowInfo( "导出完毕." );
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::ImportTextExecute(TObject *Sender)
{
    FILE * fp;
    char sline[1024];
    TListItem *pItem;
    AnsiString sLine;

    if ( FileOpenDialog->Execute() == false ) return;

    fp = fopen( FileOpenDialog->FileName.c_str(), "r" );
    if ( !fp ) {
        ShowError("文件打开错误,可能其它程序正在使用该文件");
        return;
    }
    Janitor g_fp( fclose, fp );

    TStringList * pSplits = new TStringList();
    while ( fgets( sline, 1024, fp ) )
    {
        sLine = sline;
        ReplaceStr( sLine, "\r", "" );
        ReplaceStr( sLine, "\n", "" );
        SplitByChar( sLine, ",", pSplits );
        if ( pSplits->Count != 7 )
        {
            ShowError("导入文件格式错误");
            goto end;
        }
        else
        {
            pItem = BuyList->Items->Add();
            pItem->Caption = pSplits->Strings[0];
            pItem->SubItems->Add( pSplits->Strings[1] );
            pItem->SubItems->Add( pSplits->Strings[2] );
            pItem->SubItems->Add( pSplits->Strings[3] );
            pItem->SubItems->Add( pSplits->Strings[4] );
            pItem->SubItems->Add( pSplits->Strings[5] );
            pItem->SubItems->Add( pSplits->Strings[6] );
            pItem->SubItems->Add( Now().FormatString( "yyyy-mm-dd hh:nn:ss" ) );
            pItem->Data = 0;
        }
    }

    BuyList->Enabled = true;
end:
    delete pSplits;
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::SelectGood(TObject *Sender) {

    TEdit * pEdit = (TEdit *)Sender;
    GoodDao gdao;
    AnsiString bar = SelectForm->SelectGood( pEdit->Text, NULL, &gdao );
    if (bar == "") {
        pEdit->SetFocus();
        pEdit->SelectAll();
    }
    else if (bar != pEdit->Text) {
        GoodName->Text = gdao.name;
        GoodCode->Text = gdao.model;
        BarCode->Text = bar;
        SellPrice->Text = gdao.price;

        SellPrice->Visible = false;
        Label6->Visible = false;
        Cost->SetFocus();
        Cost->SelectAll();

        pCurGood->Data = (void*)-1;
    }
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::GoodNameKeyPress(TObject *Sender, char &Key)
{
    if ( Key == '\'' || Key == '\"' ) Abort();
    if ( Key == 0x0D ) SelectGood(Sender);
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::BarCodeExit(TObject *Sender)
{
    /*
    AnsiString sql;
    bool has = false;

    q->Close();
    sql.sprintf("select count(*) as cnt from t_goods where barcode='%s'", BarCode->Text);
    q->SQL->Text = sql;
    q->Open();
    if ( q->FieldByName("cnt")->AsInteger != 0 )
        has = true;
    q->Close();

    if ( has ) {
        ShowError("该条码商品已存在，请重新输入");
        return;
    }
    */
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::SellPriceExit(TObject *Sender)
{
    if ( CheckCurComplete() == 1 ) SumAll();
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::CancelClick(TObject *Sender)
{
    if ( ShowYesNo("真的不保存该进货单吗？") == true )
        ModalResult = mrCancel;
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::Cancel2Click(TObject *Sender)
{
    ModalResult = mrCancel;
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::CalcTypeChange(TObject *Sender)
{
    if ( CalcType->ItemIndex == 0 )
    {
        Cost->TabOrder = 3;
        SellPrice->TabOrder = 4;
        if ( CalcPercent->Text != "" && CalcPercent->Text.ToInt() < 100 )
            CalcPercent->Text = 40;
    }
    else
    {
        Cost->TabOrder = 4;
        SellPrice->TabOrder = 3;
        if ( CalcPercent->Text != "" && CalcPercent->Text.ToInt() > 100 )
            CalcPercent->Text = 45;
    }
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::CalcLowPriceKeyPress(TObject *Sender,
      char &Key)
{
    if ( (Key < '0' || Key > '9') && Key != 0x08 && Key != 0x0D ) Abort();
}
//---------------------------------------------------------------------------

void __fastcall TIncomingForm::CalcLowPriceExit(TObject *Sender)
{
    TEdit *pEdit = (TEdit*)Sender;
    if ( pEdit->Text == "" || pEdit->Text.ToInt() == 0 )
    {
        CalcPercent->Text = 40;
    }
}
//---------------------------------------------------------------------------


void __fastcall TIncomingForm::BarCodeKeyPress(TObject *Sender, char &Key)
{
    NumberKeyPress(Sender, Key);    
    if ( Key == 0x0D ) SelectGood(Sender);
}
//---------------------------------------------------------------------------

