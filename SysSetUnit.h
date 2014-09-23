//---------------------------------------------------------------------------

#ifndef SysSetUnitH
#define SysSetUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <Menus.hpp>
#include <ImgList.hpp>
#include <vector>
//---------------------------------------------------------------------------
class TSysSetForm : public TForm
{
__published:	// IDE-managed Components
    TPanel *Panel1;
    TButton *Ok;
    TButton *Cancel;
    TPageControl *PageControl1;
    TTabSheet *TabSheet1;
    TGroupBox *GroupBox1;
    TLabel *Label1;
    TEdit *LowestProfit;
    TGroupBox *GroupBox2;
    TLabel *Label2;
    TLabel *Label3;
    TMemo *PrintHead;
    TMemo *PrintTail;
    TTabSheet *TabSheet2;
    TTabSheet *TabSheet3;
    TListView *AdminList;
    TLabeledEdit *AdminName;
    TLabeledEdit *AdminPwd;
    TLabeledEdit *AdminDesp;
    TButton *AddAdmin;
    TButton *DelAdmin;
    TLabel *Label4;
    TListView *UserList;
    TLabeledEdit *UserName;
    TLabeledEdit *UserSerial;
    TLabeledEdit *UserDesp;
    TButton *AddUser;
    TButton *DelUser;
    TLabel *Label5;
    TLabeledEdit *Level;
    TUpDown *LevelUpDown;
    TImageList *ImageList1;
    TTabSheet *TabSheet4;
    TLabel *Label6;
    TEdit *EditShopNo;
    TUpDown *UpDownShopNo;
    void __fastcall LowestProfitKeyPress(TObject *Sender, char &Key);
    void __fastcall AdminListSelectItem(TObject *Sender, TListItem *Item,
          bool Selected);
    void __fastcall UserListSelectItem(TObject *Sender, TListItem *Item,
          bool Selected);
    void __fastcall OkClick(TObject *Sender);
    void __fastcall AddAdminClick(TObject *Sender);
    void __fastcall DelAdminClick(TObject *Sender);
    void __fastcall AddUserClick(TObject *Sender);
    void __fastcall DelUserClick(TObject *Sender);
    void __fastcall AdminNameChange(TObject *Sender);
    void __fastcall AdminPwdChange(TObject *Sender);
    void __fastcall AdminDespChange(TObject *Sender);
    void __fastcall LevelChange(TObject *Sender);
    void __fastcall UserNameChange(TObject *Sender);
    void __fastcall UserSerialChange(TObject *Sender);
    void __fastcall UserDespChange(TObject *Sender);
    void __fastcall AdminNameKeyPress(TObject *Sender, char &Key);
    void __fastcall EditShopNoKeyPress(TObject *Sender, char &Key);
private:	// User declarations
    std::vector<int> deladmin, deluser;
public:		// User declarations
    __fastcall TSysSetForm(TComponent* Owner);

    void __fastcall SysSet();
};
//---------------------------------------------------------------------------
extern PACKAGE TSysSetForm *SysSetForm;
//---------------------------------------------------------------------------
#endif
