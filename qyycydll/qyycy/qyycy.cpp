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

__declspec(dllexport) void HFC_Release(HTTP_FILE_HANDLE hdl)
{
    delete (CHttpFileClient*)hdl;
    hdl = NULL;
}

__declspec(dllexport) bool HFC_CanWebsiteVisit(HTTP_FILE_HANDLE hdl, const char* url_login)
{
    BOOL result = FALSE;

    wchar_t *p_url_login = AnsiToUnicode(url_login);

    result = ((CHttpFileClient*)hdl)->CanWebsiteVisit(p_url_login);

    delete [] p_url_login;
    p_url_login = NULL;

    return result;
}

__declspec(dllexport) bool HFC_Login(HTTP_FILE_HANDLE hdl, const char* url_login,
                                                           const char* name,
                                                           const char* pwd,
                                                           const char* url_login_ok)
{
    BOOL result = FALSE;

    wchar_t *p_url_login    = AnsiToUnicode(url_login);
    wchar_t *p_name         = AnsiToUnicode(name);
    wchar_t *p_pwd          = AnsiToUnicode(pwd);
    wchar_t *p_url_login_ok = AnsiToUnicode(url_login_ok);

    result = ((CHttpFileClient*)hdl)->Login(p_url_login, p_name, p_pwd, p_url_login_ok);

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

__declspec(dllexport) bool HFC_Upload(HTTP_FILE_HANDLE hdl, 
                                      const char* url_upload, 
                                      OP_TYPES op_type, 
                                      const char* filename)
{
    BOOL result = FALSE;
    CString strURL;
    wchar_t *p_url_upload = AnsiToUnicode(url_upload);
    wchar_t *p_filename = AnsiToUnicode(filename);

    strURL.Format(_T("%s&type=%d&token=%s"), p_url_upload, op_type, ((CHttpFileClient*)hdl)->GetToken());
    result = ((CHttpFileClient*)hdl)->UploadFile(strURL, p_filename);

    delete [] p_url_upload;
    p_url_upload = NULL;

    return result;
}

__declspec(dllexport) bool HFC_Upload_Buf(HTTP_FILE_HANDLE hdl, 
                                          const char* url_upload, 
                                          OP_TYPES op_type, 
                                          const char* buf)
{
    BOOL result = FALSE;
    CFile file;
    wchar_t *p_filename = AnsiToUnicode(FILE_TEMP);
    

    if ( file.Open(p_filename, CFile::modeCreate|CFile::typeText|CFile::modeWrite) )
    {
        file.SeekToBegin();
        file.Write(buf, strlen(buf));
        file.Flush();
        file.Close();
    }
    
    result = HFC_Upload(hdl, url_upload, op_type, FILE_TEMP);

    return result;
}

__declspec(dllexport) bool HFC_Download(HTTP_FILE_HANDLE hdl, 
                                        const char* url_download, 
                                        OP_TYPES op_type, 
                                        int shop_no, 
                                        const char* filename)
{
    BOOL result = FALSE;
    CString strURL;
    wchar_t *p_url_download = AnsiToUnicode(url_download);
    wchar_t *p_filename = AnsiToUnicode(filename);

    strURL.Format(_T("%s&shopNo=%d&type=%d&token=%s"), p_url_download, shop_no, op_type, ((CHttpFileClient*)hdl)->GetToken());
    result = ((CHttpFileClient*)hdl)->DownLoadFile(strURL, p_filename);

    delete [] p_url_download;
    p_url_download = NULL;

    return result;
}

__declspec(dllexport) bool HFC_Download_Buf(HTTP_FILE_HANDLE hdl, 
                                            const char* url_download, 
                                            OP_TYPES op_type, 
                                            int shop_no, 
                                            char* buf)
{
    BOOL result = FALSE;
    CFile file;
    wchar_t *p_filename = AnsiToUnicode(FILE_TEMP);
    
    result = HFC_Download(hdl, url_download, op_type, shop_no, FILE_TEMP);

    if ( file.Open(p_filename, CFile::modeRead) )
    {
        while (1)
        {
            int ret = file.Read(buf, 100);
  
            if ( ret < 100 )
                break;
        }
    }

    return result;
}