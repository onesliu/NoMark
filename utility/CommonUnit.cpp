//---------------------------------------------------------------------------

#include <vcl.h>
#include <stdio.h>
#include <stdarg.h>
#include <nb30.h>
#pragma hdrstop

#include "CommonUnit.h"
//---------------------------------------------------------------------------

#pragma package(smart_init)

bool CheckNum(const AnsiString &str)
{
        const char *p = str.c_str();
        while( *p )
        {
                if( !isdigit(*p) )
                        return false;
                p++;
        }
        return true;
}
//---------------------------------------------------------------------------

bool CheckIP( AnsiString strIP) {
    bool bR = true;
    AnsiString strT;
    int pos = 0, i = 0, j = -1;

    strIP = strIP.Trim() + ".";
    strT = strIP;

    do {
        j++;
        strT = strT.SubString(pos + 1, strT.Length() - pos);
        pos = strT.Pos(".");
    }
    while (pos != 0);

    for (i = 0, pos = 0; i < j; i++) {
        pos = strIP.Pos(".");

        if (pos == 0) {
            bR = false;
            break;
        }
        else {
            strT = strIP.SubString(1, pos - 1);

          try {
            if (strT.Length() == 0 || strT.Length() > 3 || strT.ToInt() > 255 || strT.ToInt() < 0) {
                bR = false;
                break;
            }
            else {
                strIP = strIP.SubString(pos + 1, strIP.Length() - pos);
            }
          }catch(...) {
                bR = false;
                break;
          }
        }
    }

    if (j != 4)
        bR = false;

    return bR;
}
//---------------------------------------------------------------------------

unsigned int IPtoNetInt(AnsiString strIP)
{
    unsigned int iIP = 0;

    if (!CheckIP(strIP)) return 0;

    for (int i = 0; i < 4; i++) {
        int index = strIP.LastDelimiter(".");
        iIP |= (strIP.SubString(index + 1, strIP.Length() - index).ToInt()) << ((3-i)*8);
        strIP = strIP.SubString(1, index - 1);
    }

    return iIP;
}
//---------------------------------------------------------------------------

unsigned int IPtoInt(AnsiString strIP)
{
    unsigned int iIP = 0;

    if (!CheckIP(strIP)) return 0;

    for (int i = 0; i < 4; i++) {
        int index = strIP.LastDelimiter(".");
        iIP |= (strIP.SubString(index + 1, strIP.Length() - index).ToInt()) << (i*8);
        strIP = strIP.SubString(1, index - 1);
    }

    return iIP;
}
//---------------------------------------------------------------------------

AnsiString IntToIP(unsigned int intIP)
{
    AnsiString strIP;

    strIP = IntToStr(intIP >> 24) + ".";
    strIP += IntToStr((intIP & 0x00ff0000) >> 16) + ".";
    strIP += IntToStr((intIP & 0x0000ff00) >> 8) + ".";
    strIP += IntToStr(intIP & 0x000000ff);

    return strIP;
}
//---------------------------------------------------------------------------

AnsiString MaskCreate( const AnsiString &strIP )
{
    if ( strIP == "" || !CheckIP(strIP) ) return "";

    unsigned int iIp = IPtoInt( strIP );

    if ( iIp == 0 ) return "0.0.0.0";
    if ( (iIp & 0xE0000000) == 0xE0000000 ) return "255.255.255.255";
    if ( (iIp & 0xC0000000) == 0xC0000000 ) return "255.255.255.0";
    if ( (iIp & 0x80000000) == 0x80000000 ) return "255.255.0.0";
    if ( (iIp & 0x80000000) == 0 ) return "255.0.0.0";

    return "255.255.255.255";
}
//---------------------------------------------------------------------------

AnsiString GetSubnet(AnsiString strIP, AnsiString strMask)
{
    if (!CheckIP(strIP)) return "";
    if (!CheckIP(strMask)) return "";

    int iIP = IPtoInt(strIP);
    int iMask = IPtoInt(strMask);
    return IntToIP(iIP & iMask);
}
//---------------------------------------------------------------------------

AnsiString MaskConvert(AnsiString Mask)
{
    int iMask = 0;

    if ( Mask != "" && CheckIP(Mask) ) {
        int iIP = IPtoInt(Mask);
        for (int i = 0; i < 32; i++)
            if (((0x00000001 << i) & iIP) == 0)
                iMask += 1;
        return "/" + IntToStr(32-iMask);
    }

    return "";
}
//---------------------------------------------------------------------------

AnsiString MaskToMask( int mask )
{
    unsigned int ret;

    if ( mask > 32 || mask < 0 ) return "";

    if ( mask == 0 ) return "0.0.0.0";

    ret = 0;
    for ( int i = 0; i < mask; i++ )
    {
        ret = ( ret << 1 ) + 1;
    }

    ret <<= 32 - mask;

    return IntToIP( ret );
}

//---------------------------------------------------------------------------
void SplitByChar(AnsiString s, AnsiString c, TStringList *items)
{
    int start = 0;
    int i;

    if ( !items ) return;
    items->Clear(); 

    for (i = 1; i <= s.Length(); i++)
        if (s.IsDelimiter(c, i)) {
                items->Add(s.SubString(start + 1, i - start - 1));
                start = i;
        }

    // get remain string
    if ( i == s.Length()+1 && start < i )
    {
        items->Add(s.SubString( start + 1, i - start - 1));
    }
}

void GetVersionInfo(TStringList *Versions)
{
    const AnsiString VersionLocal = "\\StringFileInfo\\080403A8\\";
    const int VersionNum = 10;
    const AnsiString VersionName[VersionNum] = {
        "CompanyName", "FileDescription", "FileVersion",
        "InternalName", "LegalCopyright", "LegalTradeMarks",
        "OriginalFileName", "ProductName", "ProductVersion",
        "Comments"};

    AnsiString FileName;
    DWORD n, Len, i;
    char * Buf = NULL;
    char * Value;

    FileName = Application->ExeName;
    n = GetFileVersionInfoSize(FileName.c_str(), &n);
    if (n > 0) {
        Buf = (char *)malloc(n);
        GetFileVersionInfo(FileName.c_str(), 0, n, Buf);

        Versions->Clear();
        for (int i = 0; i < VersionNum; i++) {
            if (VerQueryValue(Buf, (VersionLocal + VersionName[i]).c_str(), (void **)&Value, (PUINT)&Len))
                Versions->Add(Value);
            else
                Versions->Add("");
        }

        free(Buf);
    }
}
//---------------------------------------------------------------------------

bool CheckIdentify(AnsiString str)
{
    for ( int i = 0; i < str.Length(); i++ )
    {
        if ( (str.c_str()[i] < '0' || str.c_str()[i] > '9') &&
             (str.c_str()[i] < 'a' || str.c_str()[i] > 'z') &&
             (str.c_str()[i] < 'A' || str.c_str()[i] > 'Z') &&
             str.c_str()[i] != '-' && str.c_str()[i] != '_' )
        {
            return false;
        }
    }

    return true;
}
//---------------------------------------------------------------------------

void ReplaceStr( AnsiString &src, AnsiString berep, AnsiString req )
{
    int i_pos = 0;
    AnsiString strTmp( src );
    i_pos = strTmp.AnsiPos( berep );
    src = "";
    while( i_pos != 0 )
    {
        src += strTmp.SubString( 1, i_pos-1 ) + req;
        strTmp.Delete( 1, i_pos );
        i_pos = strTmp.AnsiPos( berep );
    }

    if ( strTmp.Length() != 0 )
        src += strTmp;
}
//---------------------------------------------------------------------------

/*-------------------------------------------------------------------------------------
 *  Return      >=0     Readed buffer length
                -1      Failed
 */
int ReadFileToBuffer( const char *filename, char *buf, unsigned int maxlen )
{
    FILE *fp = NULL;

    memset( buf, 0, maxlen );

    fp = fopen( filename, "rb" );
    if( !fp ) return -1;

    maxlen = fread( buf, maxlen, 1, fp );
    fclose( fp );

    return maxlen;
}

/*-------------------------------------------------------------------------------------
 *  Return      0       Success
                -1      Failed
 */
int WriteBufferToFile( const char *filename, const char *buf, unsigned int buflen )
{
    FILE *fp;
    fp = fopen( filename ,"wb" );
    if( !fp ) return -1;

    fwrite( buf, buflen, 1, fp );
    fclose(fp);

    return 0;
}

//-------------------------------------------------------------------------------------

bool CheckEnglish( const AnsiString &str )
{
    for ( int i = 1; i <= str.Length(); i++ )
    {
        if ( (str[i] & 0x80) ) return false;
    }

    return true;
}

typedef struct _ASTAT_{
    ADAPTER_STATUS adapt;
    NAME_BUFFER NameBuff[ 30 ];
}ASTAT, *PASTAT;

static char sz_mac[64];

char * GetNetCardMacAddr()
{
    ASTAT Adapter;
    NCB Ncb;
    UCHAR uRetCode;
    LANA_ENUM lenum;
    int i;

    sprintf( sz_mac, "00-00-00-00-00-00\0" );
    memset( &Ncb, 0, sizeof(Ncb) );
    Ncb.ncb_command = NCBENUM;
    Ncb.ncb_buffer = (UCHAR *)&lenum;
    Ncb.ncb_length = sizeof(lenum);
    uRetCode = Netbios( &Ncb );
    if( lenum.length == 0 )
    {
        return sz_mac;
    }

    for( i = 0; i < lenum.length; i++ ) {
        memset( &Ncb, 0, sizeof(Ncb) );
        Ncb.ncb_command = NCBRESET;
        Ncb.ncb_lana_num = lenum.lana[i];

        uRetCode = Netbios( &Ncb );

        memset( &Ncb, 0, sizeof (Ncb) );
        Ncb.ncb_command = NCBASTAT;
        Ncb.ncb_lana_num = lenum.lana[i];

        strcpy( (char*)Ncb.ncb_callname,  "*               " );
        Ncb.ncb_buffer = (unsigned char *) &Adapter;
        Ncb.ncb_length = sizeof(Adapter);

        uRetCode = Netbios( &Ncb );
        if( uRetCode == 0 ) {
            sprintf( sz_mac,
                "%02X-%02X-%02X-%02X-%02X-%02X\0",
                Adapter.adapt.adapter_address[0],
                Adapter.adapt.adapter_address[1],
                Adapter.adapt.adapter_address[2],
                Adapter.adapt.adapter_address[3],
                Adapter.adapt.adapter_address[4],
                Adapter.adapt.adapter_address[5]
            );
        }
    }

    return sz_mac;
}

AnsiString MoneyStr( double m )
{
    return AnsiString().sprintf("%.2f", m);
}

AnsiString WeightStr( double m )
{
    return AnsiString().sprintf("%.3f", m);
}


int RoundToInt( double d )
{
    double t = d - int(d);
    if ( t >= 0.5 )
        return int(d) + 1;

    return int(d);
}

AnsiString UTF8toGBK(AnsiString str)
{
    int len = strlen(str.c_str())+1;

    char * outch = new char[sizeof(WCHAR)*len];
    WCHAR * wChar = new WCHAR[len];
    memset(wChar, 0, sizeof(WCHAR)*len);
    MultiByteToWideChar(CP_UTF8, 0, str.c_str(), len, wChar, len);
    WideCharToMultiByte(CP_ACP, 0, wChar, len, outch, len, 0, 0);

    AnsiString ret = outch;
    delete [] wChar;
    delete [] outch;

    return ret;
}

