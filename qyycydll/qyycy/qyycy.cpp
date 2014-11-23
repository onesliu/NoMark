// qyycy.cpp : Defines the initialization routines for the DLL.
//

#include "stdafx.h"
#include "qyycy.h"
#include "HttpFileClient.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

//
//	Note!
//
//		If this DLL is dynamically linked against the MFC
//		DLLs, any functions exported from this DLL which
//		call into MFC must have the AFX_MANAGE_STATE macro
//		added at the very beginning of the function.
//
//		For example:
//
//		extern "C" BOOL PASCAL EXPORT ExportedFunction()
//		{
//			AFX_MANAGE_STATE(AfxGetStaticModuleState());
//			// normal function body here
//		}
//
//		It is very important that this macro appear in each
//		function, prior to any calls into MFC.  This means that
//		it must appear as the first statement within the
//		function, even before any object variable declarations
//		as their constructors may generate calls into the MFC
//		DLL.
//
//		Please see MFC Technical Notes 33 and 58 for additional
//		details.
//

/////////////////////////////////////////////////////////////////////////////
// CQyycyApp

BEGIN_MESSAGE_MAP(CQyycyApp, CWinApp)
	//{{AFX_MSG_MAP(CQyycyApp)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CQyycyApp construction

CQyycyApp::CQyycyApp()
{
	// TODO: add construction code here,
	// Place all significant initialization in InitInstance
}

/////////////////////////////////////////////////////////////////////////////
// The one and only CQyycyApp object

CQyycyApp theApp;

wchar_t* AnsiToUnicode(const char* szStr)
{
    int nLen = MultiByteToWideChar(CP_ACP, MB_PRECOMPOSED, szStr, -1, NULL, 0);
    if (nLen == 0)
    {
        return NULL;
    }
    wchar_t* pResult = new wchar_t[nLen];
    MultiByteToWideChar(CP_ACP, MB_PRECOMPOSED, szStr, -1, pResult, nLen);
    return pResult;
}

__declspec(dllexport) HTTP_FILE_HANDLE HFC_Init()
{
    CHttpFileClient * http_file_client = new CHttpFileClient();
    return http_file_client;
}

__declspec(dllexport) void HFC_Release(HFC_DATA_S * hfc)
{
    if ( hfc == NULL || hfc->hdl == NULL ) 
        return;
    
    delete (CHttpFileClient*)(hfc->hdl);
    hfc->hdl = NULL;
}

__declspec(dllexport) bool HFC_CanWebsiteVisit(HFC_DATA_S * hfc)
{
    if ( hfc == NULL || hfc->hdl == NULL || hfc->url == NULL ) 
        return FALSE;
    
    BOOL result = FALSE;
    
    wchar_t *p_url_login = AnsiToUnicode(hfc->url);
    
    result = ((CHttpFileClient*)(hfc->hdl))->CanWebsiteVisit(p_url_login);

    delete [] p_url_login;
    p_url_login = NULL;
    
    return result;
}

__declspec(dllexport) bool HFC_Login(HFC_DATA_S * hfc)
{
    if ( hfc == NULL || hfc->hdl == NULL || hfc->url == NULL || hfc->login.name == NULL || 
         hfc->login.pwd == NULL || hfc->url_login_ok == NULL ) 
    {
        return FALSE;
    }
    
    BOOL result = FALSE;
    
    wchar_t *p_url_login    = AnsiToUnicode(hfc->url);
    wchar_t *p_name         = AnsiToUnicode(hfc->login.name);
    wchar_t *p_pwd          = AnsiToUnicode(hfc->login.pwd);
    wchar_t *p_url_login_ok = AnsiToUnicode(hfc->url_login_ok);
    
    result = ((CHttpFileClient*)(hfc->hdl))->Login(p_url_login, p_name, p_pwd, p_url_login_ok);
    
    delete [] p_url_login;
    p_url_login = NULL;
    delete [] p_name;
    p_name = NULL;
    delete [] p_pwd;
    p_pwd = NULL;
    delete [] p_url_login_ok;
    p_url_login_ok = NULL;
    
    return result;
}

__declspec(dllexport) bool HFC_Upload(HFC_DATA_S * hfc)
{
    if ( hfc == NULL || hfc->hdl == NULL || hfc->url == NULL ) 
    {
        return FALSE;
    }

    if ( (hfc->data.filename == NULL && hfc->data.buf == NULL) || 
         (hfc->data.filename != NULL && hfc->data.buf != NULL) )
    {
        return FALSE;
    }

    BOOL result = FALSE;
    CString strURL;
    wchar_t *p_url_upload = AnsiToUnicode(hfc->url);
    wchar_t *p_filename = NULL;

    if ( hfc->data.buf != NULL )
    {
        CFile file;
        p_filename = AnsiToUnicode(FILE_TEMP);
        
        if ( file.Open(p_filename, CFile::modeCreate|CFile::typeText|CFile::modeWrite) )
        {
            file.SeekToBegin();
            file.Write(hfc->data.buf, strlen(hfc->data.buf));
            file.Flush();
            file.Close();
        }           
    }
    else if ( hfc->data.filename != NULL )
    {
        p_filename = AnsiToUnicode(hfc->data.filename);
    }

    if ( hfc->type != TYPES_NULL )
    {
        strURL.Format(_T("%s&token=%s&type=%d"), 
                        p_url_upload,     
                        ((CHttpFileClient*)(hfc->hdl))->GetToken(),
                        hfc->type);
    }

    result = ((CHttpFileClient*)(hfc->hdl))->UploadFile(strURL, p_filename);
    
    delete [] p_url_upload;
    p_url_upload = NULL;
    delete [] p_filename;
    p_filename = NULL;
    
    return result;
}

__declspec(dllexport) bool HFC_Download(HFC_DATA_S * hfc)
{
    if ( hfc == NULL || hfc->hdl == NULL || hfc->url == NULL ) 
        return FALSE;
  
    BOOL result = FALSE;
    CString strURL;
    wchar_t *p_url_download = AnsiToUnicode(hfc->url);
    wchar_t *p_filename = NULL;

    if ( hfc->data.buf != NULL )
    {
        p_filename = AnsiToUnicode(FILE_TEMP);     
    }
    else if ( hfc->data.filename != NULL )
    {
        p_filename = AnsiToUnicode(hfc->data.filename);
    }

    if ( hfc->type == TYPES_GOODSINFO || 
         hfc->type == TYPES_UPDATE_PRICE )
    {
        strURL.Format(_T("%s&token=%s&shopNo=%d&type=%d"), 
                        p_url_download, 
                        ((CHttpFileClient*)(hfc->hdl))->GetToken(),
                        hfc->shopNo, 
                        hfc->type);
    }
    else if ( hfc->type == TYPES_DOWNLOAD_ORDER || 
              hfc->type == TYPES_BALANCE )
    {
        strURL.Format(_T("%s&token=%s"), p_url_download, ((CHttpFileClient*)(hfc->hdl))->GetToken());
    }

    result = ((CHttpFileClient*)(hfc->hdl))->DownLoadFile(strURL, p_filename);
    
    delete [] p_url_download;
    p_url_download = NULL;
    delete [] p_filename;
    p_filename = NULL;
    
    return result;
}
