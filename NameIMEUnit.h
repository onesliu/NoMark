//---------------------------------------------------------------------------

#ifndef NameIMEUnitH
#define NameIMEUnitH
#include <Classes.hpp>
#include <Controls.hpp>
#include <ExtCtrls.hpp>
#include <StdCtrls.hpp>
//---------------------------------------------------------------------------
#include <stlport/hash_map>
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TNameIME : public TForm
{
__published:	// IDE-managed Components
    TListBox *OutputArea;
    TPanel *InputArea;
    TPanel *Panel1;
    void __fastcall FormDestroy(TObject *Sender);
    void __fastcall FormKeyPress(TObject *Sender, char &Key);
private:	// User declarations
    struct eqstr
    {
        bool operator()(char* s1, char* s2) const
        {
            return strcmp(s1, s2) == 0;
        }
    };

    typedef std::hash_multimap<char *, int, std::hash<char*>, eqstr> key_map;
    typedef std::hash_map<int, AnsiString> word_map;
    typedef enum _win_type { FIRST_PAGE, NEXT_PAGE, PRIOR_PAGE } win_type;

    key_map keys;
    word_map words;
    int max_wordid;
    int list_page;
    AnsiString result;

    void __fastcall FillOutputArea( win_type page );
    int KeyStroke( const int Key );
    void SetPosition( int x, int y, int updown );
    AnsiString __fastcall SelectOutput( int index );
    void __fastcall NumberPy( AnsiString & WordPy );    //把数字转换成发音的声母
public:		// User declarations
    __fastcall TNameIME(TComponent* Owner);

    void InitIME();
    int  AddWord( const AnsiString & Word, const AnsiString & WordPy = "" );
    //Id 是单词编号，如果人工给定ID，那就必须确保ID未被分配。不能调用无ID版本函数后再调用有ID版本，反之即可。
    int  AddWord( const AnsiString & Word, const int Id, const AnsiString & WordPy = "" );
    bool DelWord( const AnsiString & Word );
    bool DelWord( const int WordId );
    bool DelKey( const int WordId );
    void ClearIME();
    bool StartIME( const int Key, int x, int y, int updown = 0 );
    AnsiString ImeResult();
};
//---------------------------------------------------------------------------
extern PACKAGE TNameIME *NameIME;
//---------------------------------------------------------------------------
#endif
