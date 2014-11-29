//---------------------------------------------------------------------------

#ifndef HttpAccessH
#define HttpAccessH

#include <vcl.h>
#include <IdHTTP.hpp>
#include <map>
//---------------------------------------------------------------------------
class THttpAccess {
public:
	THttpAccess() {
    	http = new TIdHTTP(NULL);
        http->HandleRedirects = true;
        http->OnRedirect = OnRedirect;
        http->RecvBufferSize = 5000000;
    }
    virtual ~THttpAccess() {
    	delete http;
    }

public:
	AnsiString __fastcall Get(AnsiString url);
    AnsiString __fastcall Post(AnsiString url, AnsiString values);
    void __fastcall ClearCookies();
    
private:
	TIdHTTP *http;
    std::map<AnsiString,AnsiString> cookie_buffer;

    void __fastcall OnRedirect(TObject *Sender, AnsiString &dest,
          int &NumRedirect, bool &Handled);
    void __fastcall SetCookies();
};
#endif
 