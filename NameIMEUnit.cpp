//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "NameIMEUnit.h"
#include "SpellUnit.hpp"
#include "MessageBoxes.h"
#include <vector>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TNameIME *NameIME;
using namespace std;
//---------------------------------------------------------------------------
__fastcall TNameIME::TNameIME(TComponent* Owner)
    : TForm(Owner)
{
    max_wordid = 0;
    list_page = 0;
    result = "";
    InputArea->Caption = "";
    OutputArea->Items->Clear();
}
//---------------------------------------------------------------------------
int TNameIME::AddWord( const AnsiString & Word, const AnsiString & WordPy )
{
    if ( Word == "" ) return -1;

    words.insert(word_map::value_type(max_wordid, Word));
    AnsiString word_py;
    if ( WordPy == "" )
        word_py = MakeSpellCode( Word, 2, 255 );
    else
        word_py = WordPy;

    NumberPy( word_py );

    char * p_key = 0;
    for ( int i = 1; i <= word_py.Length(); i++ )
    {
        p_key = strdup( word_py.SubString(1, i).c_str() );
        keys.insert(key_map::value_type(p_key, max_wordid));
    }

    return max_wordid++;
}
//---------------------------------------------------------------------------
int TNameIME::AddWord( const AnsiString & Word, const int Id, const AnsiString & WordPy )
{
    if ( Word == "" ) return -1;

    words.insert(word_map::value_type(max_wordid, Word));
    AnsiString word_py;
    if ( WordPy == "" )
        word_py = MakeSpellCode( Word, 2, 255 );
    else
        word_py = WordPy;

    NumberPy( word_py );

    char * p_key = 0;
    for ( int i = 1; i <= word_py.Length(); i++ )
    {
        p_key = strdup( word_py.SubString(1, i).c_str() );
        keys.insert(key_map::value_type(p_key, Id));
    }

    return Id;
}
//---------------------------------------------------------------------------
bool TNameIME::DelWord( const AnsiString & Word )
{
    if ( Word == "" ) return false;

    word_map::iterator itr_word;
    for ( itr_word = words.begin(); itr_word != words.end(); ++itr_word )
    {
        if ( itr_word->second == Word )
        {
            DelKey( itr_word->first );
            words.erase( itr_word );
            return true;
        }
    }

    return false;
}
//---------------------------------------------------------------------------
bool TNameIME::DelWord( const int WordId )
{
    DelKey( WordId );
    words.erase( WordId );
    return true;
}
//---------------------------------------------------------------------------
bool TNameIME::DelKey( const int WordId )
{
    if ( WordId < 0 ) return false;

    bool ret = false;
    char * pkey;

    key_map::iterator itr_key;
    for ( itr_key = keys.begin(); itr_key != keys.end(); ++itr_key )
    {
        if ( itr_key->second == WordId )
        {
            pkey = itr_key->first;
            keys.erase( itr_key );
            itr_key = keys.begin();
            free( pkey );
            ret = true;
        }
    }

    return ret;
}
//---------------------------------------------------------------------------
void TNameIME::ClearIME()
{
    max_wordid = 0;
    list_page = 0;
    result = "";
    vector<char *> ts;
    //AnsiString sss; // debug use
    for ( key_map::iterator i = keys.begin(); i != keys.end(); ++i )
    {
        ts.push_back( i->first );
        //sss += i->first + IntToStr(i->second) + " "; //debug use
    }
    keys.clear();
    for ( unsigned int i = 0; i < ts.size(); i++ )
        free( ts[i] );
    words.clear();
    InputArea->Caption = "";
    OutputArea->Items->Clear();
}
//---------------------------------------------------------------------------
int TNameIME::KeyStroke( const int Key )
{
    AnsiString input_str = InputArea->Caption;

    if ( Key == 0x08 )
    {
        if ( input_str.Length() > 0 )
            input_str = input_str.Delete( input_str.Length(), 1 );
        InputArea->Caption = input_str;
        if ( input_str == "" )
        {
            OutputArea->Items->Clear();
            return 0;
        }
        else
        {
            FillOutputArea( FIRST_PAGE );
        }
    }
    else if ( Key == 0x1B )
    {
        InputArea->Caption = "";
        OutputArea->Items->Clear();
        return 0;
    }
    else if ( Key == 0x20 || Key == 0x0D || Key == 0x0A )
    {
        result = SelectOutput( 1 );
        InputArea->Caption = "";
        OutputArea->Items->Clear();
        return 1;
    }
    else if ( Key >= 0x61 && Key <= 0x7A )
    {
        input_str += char(Key - 0x20);
        InputArea->Caption = input_str;
        FillOutputArea( FIRST_PAGE );
    }
    else if ( Key >= 0x41 && Key <= 0x5A )
    {
        input_str += char(Key);
        InputArea->Caption = input_str;
        FillOutputArea( FIRST_PAGE );
    }
    else if ( Key >= 0x30 && Key <= 0x39 )
    {
        result = SelectOutput( Key - 0x30 );
        InputArea->Caption = "";
        OutputArea->Items->Clear();
        return 1;
    }
    else if ( Key == ',' || Key == '-' )
    {
        FillOutputArea( PRIOR_PAGE );
    }
    else if ( Key == '.' || Key == '=' )
    {
        FillOutputArea( NEXT_PAGE );
    }

    return -1;
}
//---------------------------------------------------------------------------
AnsiString __fastcall TNameIME::SelectOutput( int index )
{
    AnsiString ret = "";
    
    if ( index == 0 ) index = 10;
    if ( OutputArea->Items->Count < index ) return ret;
    ret = OutputArea->Items->Strings[ index-1 ];
    return ret.SubString( 3, ret.Length() );
}
//---------------------------------------------------------------------------
void __fastcall TNameIME::FillOutputArea( win_type page )
{
    pair<key_map::const_iterator, key_map::const_iterator> p;
    key_map::const_iterator itr_key;
    int i;

    switch ( page ) {
    case FIRST_PAGE:
        list_page = 0;
        break;
    case PRIOR_PAGE:
        if ( list_page == 0 ) return;
        list_page--;
        break;
    case NEXT_PAGE:
        list_page++;
    }

    p = keys.equal_range( InputArea->Caption.c_str() );
    for ( i = 0, itr_key = p.first; i < list_page * 10; ++itr_key, ++i )
    {
        if ( itr_key == p.second )
        {
            list_page--;
            return;
        }
    }

    OutputArea->Items->Clear();

    for ( i = 1; itr_key != p.second && i <= 10; ++itr_key, ++i )
    {
        OutputArea->Items->Add( IntToStr( i%10 ) + "." + words[itr_key->second] );
    }
}
//---------------------------------------------------------------------------
AnsiString TNameIME::ImeResult()
{
    return result;
}
//---------------------------------------------------------------------------

void __fastcall TNameIME::FormDestroy(TObject *Sender)
{
    ClearIME();
}
//---------------------------------------------------------------------------
void TNameIME::SetPosition( int x, int y, int updown )
{
    if ( updown == 0 ) // up, x,y is left bottom point
    {
        Left = x;
        Top = y;
    }

    if ( updown == 1 ) // down, x,y is left top point
    {
        Left = x;
        Top = y - Height;
    }
}
//---------------------------------------------------------------------------
// updown : 0: up; 1: down
bool TNameIME::StartIME( const int Key, int x, int y, int updown )
{
    list_page = 0;
    result = "";
    InputArea->Caption = "";
    OutputArea->Items->Clear();
    SetPosition( x, y, updown );
    if ( KeyStroke( Key ) != -1 ) return false;
    if ( InputArea->Caption == "" ) return false;
    if ( ShowModal() == mrOk ) return true;
    return false;
}
//---------------------------------------------------------------------------

void __fastcall TNameIME::FormKeyPress(TObject *Sender, char &Key)
{
    int ret = KeyStroke( Key );
    if ( ret == 0 )
        ModalResult = mrCancel;
    if ( ret == 1 )
        ModalResult = mrOk;
}
//---------------------------------------------------------------------------
void __fastcall TNameIME::NumberPy( AnsiString & WordPy )
{
    for ( int i = 1; i <= WordPy.Length(); i++ )
    {
        switch ( WordPy[i] ) {
        case '0': WordPy[i] = 'L'; break;
        case '1': WordPy[i] = 'Y'; break;
        case '2': WordPy[i] = 'E'; break;
        case '3': WordPy[i] = 'S'; break;
        case '4': WordPy[i] = 'S'; break;
        case '5': WordPy[i] = 'W'; break;
        case '6': WordPy[i] = 'L'; break;
        case '7': WordPy[i] = 'Q'; break;
        case '8': WordPy[i] = 'B'; break;
        case '9': WordPy[i] = 'J'; break;
        }
    }
}
//---------------------------------------------------------------------------

