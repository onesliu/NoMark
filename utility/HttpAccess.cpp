//---------------------------------------------------------------------------


#pragma hdrstop

#include "HttpAccess.h"
#include "CommonUnit.h"
#include <map>
//---------------------------------------------------------------------------

#pragma package(smart_init)

AnsiString __fastcall THttpAccess::Get(AnsiString url)
{
	try {
	http->Request->AcceptEncoding = "gzip, deflate";
    http->Request->Connection = "Keep-Alive";
    http->Request->AcceptEncoding = "identity";
    SetCookies();
    return http->Get(url);

    } catch(...) {
    	return "";
    }
}

AnsiString __fastcall THttpAccess::Post(AnsiString url, AnsiString values, int type)
{
	AnsiString ret;
    TStringStream * res = new TStringStream("");
    TStringList * val = new TStringList();

	try {

	http->Request->AcceptEncoding = "gzip, deflate";
    http->Request->Connection = "Keep-Alive";
    http->Request->AcceptEncoding = "identity";
    switch(type) {
    case POST_URLENCODE:
	    http->Request->ContentType = "application/x-www-form-urlencoded";
        break;
    case POST_FORMDATA:
    	http->Request->ContentType = "multipart/form-data";
        break;
    case POST_JSON:
    	http->Request->ContentType = "application/json";
        break;
    case POST_TEXT:
    	http->Request->ContentType = "text/xml";
        break;
    }
    
    SetCookies();
    val->Text = values;
    http->Post(url, val, (TStream*)res);
    ret = res->DataString;

    } catch(...) {
    	ret = "";
	}

    delete res;
   	delete val;
    return ret;
}

void __fastcall THttpAccess::ClearCookies()
{
	cookie_buffer.clear();
}

void __fastcall THttpAccess::OnRedirect(TObject *Sender, AnsiString &dest,
          int &NumRedirect, bool &Handled)
{
	try {

	http->Request->AcceptEncoding = "gzip, deflate";
    http->Request->Connection = "Keep-Alive";
    http->Request->AcceptEncoding = "identity";
    SetCookies();
    http->Get(dest);

    } catch (...) {
    	Handled = false;
        return;
    }

    Handled = true;
}

void __fastcall THttpAccess::SetCookies()
{
 	using namespace std;

    AnsiString cookie;
    if (http->Response->ExtraHeaders->IndexOfName("Set-cookie") == -1)
    	return;
        
    cookie = http->Response->ExtraHeaders->Values["Set-cookie"];

	TStringList * cs = new TStringList();
	SplitByChar(cookie, ";", cs);
	for(int j = 0; j < cs->Count; j++) {
		TStringList * kv = new TStringList();
		SplitByChar(cs->Strings[j], "=", kv);
		if (kv->Count == 2)
			cookie_buffer[kv->Strings[0]] = kv->Strings[1];
		else
			cookie_buffer[kv->Strings[0]] = "";
        delete kv;
	}
    delete cs;

    if (cookie_buffer.size() == 0) return;
    
    map<AnsiString,AnsiString>::iterator itr;
    cookie = "";
    for(itr = cookie_buffer.begin(); itr!=cookie_buffer.end(); ++itr) {
   		if (itr->second.Length() <= 0)
        	cookie += itr->first;
        else
        	cookie += itr->first + "=" + itr->second;
        cookie += ";";
    }
    if (cookie.Length() > 0) {
	    cookie.SetLength(cookie.Length()-1);
    	http->Request->ExtraHeaders->Values["Cookie"] = cookie;
	}
}

