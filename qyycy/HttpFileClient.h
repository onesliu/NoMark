// HttpFileClient.h: interface for the CHttpFileClient class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_HTTPFILECLIENT_H__62D48033_AADC_465C_B555_AE23CB43CF8A__INCLUDED_)
#define AFX_HTTPFILECLIENT_H__62D48033_AADC_465C_B555_AE23CB43CF8A__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include <afxinet.h>

#define  __BUFFER_SIZE 1024

class CHttpFileClient  
{
public:
	CHttpFileClient();
	virtual ~CHttpFileClient();

public:
    BOOL CanWebsiteVisit(CString sURI);
    BOOL Login          (CString sURI, CString szUsername, CString szPassword, CString redirectURL);
    BOOL UploadFile     (LPCTSTR szRemoteURI, LPCTSTR szLocalPath);
    BOOL DownLoadFile   (LPCTSTR szRemoteURI, LPCTSTR szLocalPath);
    BOOL DeleteFile     (LPCTSTR szRemoteURI);

    CString GetCookie();
    CString GetToken();

private:
	CString m_strCookie;
    CString m_strToken;

    CString URLEncode       (CString sIn);
    char*   UnicodeToUTF8   (const CString strSrc); 
    void    Cookie          (CHttpFile *pHttpFile);
    void    Token           (CHttpFile *pHttpFile);
    BOOL    UseHttpSendReqEx(CHttpFile* pHttpFile, LPCTSTR szLocalFile);
};

#endif // !defined(AFX_HTTPFILECLIENT_H__62D48033_AADC_465C_B555_AE23CB43CF8A__INCLUDED_)
