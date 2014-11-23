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
    BOOL CanWebsiteVisit(LPCTSTR sURI);
    BOOL Login          (LPCTSTR sURI, LPCTSTR szUsername, LPCTSTR szPassword, LPCTSTR redirectURL);
    BOOL UploadFile     (LPCTSTR szRemoteURI, LPCTSTR szLocalPath);
    BOOL DownLoadFile   (LPCTSTR szRemoteURI, LPCTSTR szLocalPath);
    BOOL DeleteFile     (LPCTSTR szRemoteURI);

    LPCTSTR GetCookie();
    LPCTSTR GetToken();
    LPCTSTR GetDistrictID();

private:
	CString m_strCookie;
    CString m_strToken;
    CString m_strDistrictID;

    CString URLEncode       (CString sIn);
    char*   UnicodeToUTF8   (const CString strSrc); 
    void    Cookie          (CHttpFile *pHttpFile);
    void    Token           (CHttpFile *pHttpFile);
    BOOL    UseHttpSendReqEx(CHttpFile* pHttpFile, LPCTSTR szLocalFile);
};

#endif // !defined(AFX_HTTPFILECLIENT_H__62D48033_AADC_465C_B555_AE23CB43CF8A__INCLUDED_)
