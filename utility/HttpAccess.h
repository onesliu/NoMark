//---------------------------------------------------------------------------

#ifndef HttpAccessH
#define HttpAccessH

#include <vcl.h>
#include <IdHTTP.hpp>
#include <map>
//---------------------------------------------------------------------------
class THttpAccess {
public:
	__fastcall THttpAccess() {
    	http = new TIdHTTP(NULL);
        http->HandleRedirects = true;
        http->OnRedirect = OnRedirect;
        http->RecvBufferSize = 5000000;
    }
    virtual __fastcall ~THttpAccess(void) {
    	delete http;
    }

    enum {POST_URLENCODE, POST_FORMDATA, POST_JSON, POST_TEXT};

public:
	AnsiString __fastcall Get(AnsiString url);
    AnsiString __fastcall Post(AnsiString url, AnsiString values, int type = POST_URLENCODE);
    void __fastcall ClearCookies();

private:
	TIdHTTP *http;
    std::map<AnsiString,AnsiString> cookie_buffer;

    void __fastcall OnRedirect(TObject *Sender, AnsiString &dest,
          int &NumRedirect, bool &Handled);
    void __fastcall SetCookies();
};
#endif
 