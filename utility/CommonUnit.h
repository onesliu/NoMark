
#ifndef CommonUnitH
#define CommonUnitH

//---------------------------------------------------------------------------
bool CheckNum(const AnsiString &str);
bool CheckIP( AnsiString strIP);
unsigned int IPtoInt(AnsiString strIP);
unsigned int IPtoNetInt(AnsiString strIP);
AnsiString IntToIP(unsigned int intIP);
AnsiString GetSubnet(AnsiString strIP, AnsiString strMask);
AnsiString MaskConvert(AnsiString Mask);
AnsiString MaskCreate( const AnsiString &strIP);
AnsiString MaskToMask( int mask );
void SplitByChar(AnsiString s, AnsiString c, TStringList *items);
void GetVersionInfo(TStringList *Versions);
bool CheckIdentify(AnsiString str);
void ReplaceStr( AnsiString &src, AnsiString berep, AnsiString req );
int ReadFileToBuffer( const char *filename, char *buf, unsigned int maxlen );
bool CheckEnglish( const AnsiString &str );
int WriteBufferToFile( const char *filename, const char *buf, unsigned int buflen );
char * GetNetCardMacAddr();
template <typename T> void del( T* p ) { if ( p ) {delete p; p = 0; } }
AnsiString MoneyStr( double m );
AnsiString WeightStr( double m );
int RoundToInt( double d );
AnsiString UTF8toGBK(AnsiString str);
AnsiString FormatCurrency(double val);
#endif
