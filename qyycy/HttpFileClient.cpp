// HttpFileClient.cpp: implementation of the CHttpFileClient class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "HttpFileClient.h"
#include <afxinet.h>
#include <atlconv.h>
#include "cJSON.h"
//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CHttpFileClient::CHttpFileClient()
{

}

CHttpFileClient::~CHttpFileClient()
{

}

inline TCHAR toHex(const BYTE &x)
{
    return x > 9 ? _T('A') + x-10: _T('0') + x;
}

CString CHttpFileClient::URLEncode(CString sIn)
{
    CString sOut;
    
    const int nLen = sIn.GetLength() + 1;
    
    register LPTSTR pOutTmp = NULL;
    LPTSTR pOutBuf = NULL;
    register LPTSTR pInTmp = NULL;
    LPTSTR pInBuf =(LPTSTR)sIn.GetBuffer(nLen);
    //BYTE b = 0;
    
    //alloc out buffer
    pOutBuf = (LPTSTR)sOut.GetBuffer(nLen * 3 - 2);//new BYTE [nLen   * 3];
    
    if(pOutBuf)
    {
        pInTmp  = pInBuf;
        pOutTmp = pOutBuf;
        
        // do encoding
        while (*pInTmp)
        {
            if(isalnum(*pInTmp))
                *pOutTmp++ = *pInTmp;
            else if(isspace(*pInTmp) && ((*pInTmp!='\n') && (*pInTmp!='\r')))
                *pOutTmp++ = '+';
            else
            {
                *pOutTmp++ = '%';
                *pOutTmp++ = toHex(*pInTmp>>4);
                *pOutTmp++ = toHex(*pInTmp%16);
            }
            pInTmp++;
        }
        
        *pOutTmp = '\0';
        //sOut=pOutBuf;
        //delete [] pOutBuf;
        sOut.ReleaseBuffer();
    }
    
    sIn.ReleaseBuffer();
    
    return sOut;
}

char* CHttpFileClient::UnicodeToUTF8(const CString strSrc)
{
    int len = WideCharToMultiByte(CP_UTF8, 0, strSrc, -1, NULL, 0, NULL, NULL); // the return value include "\0"
    char* utf8Str = (char*)malloc(len);
    memset(utf8Str, 0, sizeof(utf8Str));
    WideCharToMultiByte(CP_UTF8, 0, strSrc, -1, utf8Str, len, NULL, NULL);
    
    return utf8Str;
}


CString CHttpFileClient::GetCookie()
{
    return m_strCookie;
}

CString CHttpFileClient::GetToken()
{
    return m_strToken;
}

void CHttpFileClient::Cookie(CHttpFile *pHttpFile)
{
    VERIFY(pHttpFile != NULL);

    CString strTemp;

    if ( pHttpFile->QueryInfo(HTTP_QUERY_SET_COOKIE, strTemp) )
    {
        m_strCookie.Format(_T("Cookie: %s\r\n"), strTemp);
    }
}

void CHttpFileClient::Token(CHttpFile *pHttpFile)
{
    VERIFY(pHttpFile != NULL);

    CString strLine;
    CString strTemp;

    if ( pHttpFile != NULL )
    {
        while(pHttpFile->ReadString(strLine) != NULL)
        {
            strTemp += strLine;
        }
    }
    
    cJSON *json, *json1;
    
    json = cJSON_Parse((LPSTR)(LPCTSTR)strTemp);
    if ( !json )
    {
        printf("Error before: [%s]\n",cJSON_GetErrorPtr());
    }
    else
    {
        json1 = cJSON_GetObjectItem(json, "token");
        
        if ( json1 )
        {
            USES_CONVERSION;
            m_strToken = A2T(json1->valuestring);
            //            AfxMessageBox(m_strToken);
        }
        cJSON_Delete(json);
    }
}

BOOL CHttpFileClient::CanWebsiteVisit(CString sURI)
{
    CHttpConnection     * pHttpConn = NULL;
    CHttpFile           * pHttpFile = NULL;
    CInternetSession    session;

    BOOL                bResult = FALSE;
    BOOL                bRetVal = FALSE;
    DWORD               dwType = 0;
    DWORD               dwStateCode = 0;
    INTERNET_PORT       wPort = 0;
    CString             strServer = _T("");
    CString             strObject = _T("");
    const int           nTimeOut = 5000;
    
    try
    {
        bResult = AfxParseURL(sURI, dwType, strServer, strObject, wPort);
        if ( !bResult )
            return FALSE;
        
        session.SetOption(INTERNET_OPTION_CONNECT_TIMEOUT, nTimeOut);
        session.SetOption(INTERNET_OPTION_CONNECT_RETRIES, 1);
        
        pHttpConn = session.GetHttpConnection(strServer, wPort);
        VERIFY(pHttpConn != NULL);

        pHttpFile = pHttpConn->OpenRequest(CHttpConnection::HTTP_VERB_GET, strObject);
        VERIFY(pHttpFile != NULL);

        if ( pHttpFile->SendRequest() )
        {
            pHttpFile->QueryInfoStatusCode(dwStateCode);
            
            if ( dwStateCode == HTTP_STATUS_CREATED || dwStateCode == HTTP_STATUS_OK )
                bRetVal = TRUE;
        }
    }
    catch (CInternetException* e)
    {
        e->Delete();
    }
    catch (...)
    {
    }

    Cookie(pHttpFile);
    
    if ( pHttpFile )
    {
        pHttpFile->Close();
        delete pHttpFile;
        pHttpFile = NULL;
    }
    if ( pHttpConn )
    {
        pHttpConn->Close();
        delete pHttpConn;
        pHttpConn = NULL;
    } 
    session.Close();
    
    return bRetVal;
}

BOOL CHttpFileClient::Login(CString sURI, CString szUsername, CString szPassword, CString redirectURL)
{
    CHttpConnection     * pHttpConn = NULL;
    CHttpFile           * pHttpFile = NULL;
    CInternetSession    session;

    BOOL                bResult = FALSE;
    BOOL                bRetVal = FALSE;
    DWORD               dwType = 0;
    DWORD               dwStateCode = 0;
    INTERNET_PORT       wPort = 0;
    CString             strServer = _T("");
    CString             strObject = _T("");
    const int           nTimeOut = 5000;
    CString             strUserinfo;
    char                * p = NULL;

    try
    {
        bResult = AfxParseURL(sURI, dwType, strServer, strObject, wPort);
        if ( !bResult )
            return FALSE;
        
        session.SetOption(INTERNET_OPTION_CONNECT_TIMEOUT, nTimeOut);
        session.SetOption(INTERNET_OPTION_CONNECT_RETRIES, 1);
        
        pHttpConn = session.GetHttpConnection(strServer, wPort);
        VERIFY(pHttpConn != NULL);

        pHttpFile = pHttpConn->OpenRequest(CHttpConnection::HTTP_VERB_POST, strObject);
        VERIFY(pHttpFile != NULL);

        pHttpFile->AddRequestHeaders(_T("Host: qy.gz.1251102575.clb.myqcloud.com\r\n"));
        pHttpFile->AddRequestHeaders(_T("Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\n"));
        pHttpFile->AddRequestHeaders(_T("Accept-Language: zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3\r\n"));
        pHttpFile->AddRequestHeaders(_T("Accept-Encoding: gzip, deflate\r\n"));
        pHttpFile->AddRequestHeaders(_T("Content-Type: application/x-www-form-urlencoded\r\n"));
        pHttpFile->AddRequestHeaders(_T("Connection: Keep-Alive\r\n"));
        pHttpFile->AddRequestHeaders(m_strCookie);
        strUserinfo.Format(_T("%s&%s&redirect=%s"), szUsername, szPassword, URLEncode(redirectURL));
        p = UnicodeToUTF8(strUserinfo);

        if ( !pHttpFile->SendRequest(NULL, 0, (LPVOID)(LPCTSTR)p, strlen(p)) )
        {
            return FALSE;
        }

        free(p);
        p = NULL;
    }
    catch (CFileException* e)
    {
        e->Delete();
        AfxMessageBox(_T("CFileException"));
    }
    catch (CInternetException* e)
    {   
        CString sError;
        sError.Format(_T("Inernet connection error : %d"), e->m_dwError);
        e->Delete();
        AfxMessageBox(sError);
    }

    Token(pHttpFile);

    if ( pHttpFile )
    {
        pHttpFile->Close();
        delete pHttpFile;
        pHttpFile = NULL;
    }
    if ( pHttpConn )
    {
        pHttpConn->Close();
        delete pHttpConn;
        pHttpConn = NULL;
    } 
    session.Close();

    return TRUE;
}

BOOL CHttpFileClient::UploadFile(LPCTSTR szRemoteURI, LPCTSTR szLocalPath)
{
    if ( szRemoteURI == NULL || szLocalPath == NULL )
        return FALSE;
    
    BOOL    bResult = FALSE;
    DWORD   dwType = 0;
    CString strServer = _T("");
    CString strObject = _T("");
    
    INTERNET_PORT   wPort = 0;
    DWORD           dwPostSize = 0;
    const int       nTimeOut  = 5000;
    
    CHttpConnection* pHttpConn = NULL;
    CHttpFile*       pHttpFile = NULL;
    CInternetSession session;
    
    bResult = AfxParseURL(szRemoteURI, dwType, strServer, strObject, wPort);
    if ( !bResult )
        return FALSE;
    
    bResult = FALSE;
    
    try
    {
        session.SetOption(INTERNET_OPTION_CONNECT_TIMEOUT, nTimeOut);
        session.SetOption(INTERNET_OPTION_CONNECT_RETRIES, 1);       
        
        pHttpConn = session.GetHttpConnection(strServer, wPort, NULL, NULL);
        VERIFY(pHttpConn != NULL);
        
        pHttpFile = pHttpConn->OpenRequest(CHttpConnection::HTTP_VERB_PUT, strObject);
        VERIFY(pHttpFile != NULL);
        
        if ( UseHttpSendReqEx(pHttpFile, szLocalPath) )
        {
            DWORD dwStateCode = 0;
            pHttpFile->QueryInfoStatusCode(dwStateCode);
            
            if ( dwStateCode == HTTP_STATUS_CREATED || dwStateCode == HTTP_STATUS_OK )
                bResult = TRUE;
        }
    }
    catch (CFileException* e)
    {
        e->Delete();
        AfxMessageBox(_T("CFileException"));
    }
    catch (CInternetException* e)
    {   
        CString sError;
        sError.Format(_T("Inernet connection error : %d"), e->m_dwError);
        e->Delete();
        AfxMessageBox(sError);
    }
    
    if ( pHttpFile )
    {
        pHttpFile->Close();
        delete pHttpFile;
        pHttpFile = NULL;
    }
    if ( pHttpConn )
    {
        pHttpConn->Close();
        delete pHttpConn;
        pHttpConn = NULL;
    }
    session.Close();
    
    return bResult;
}

BOOL CHttpFileClient::DownLoadFile(LPCTSTR szRemoteURI, LPCTSTR szLocalPath)
{
    if ( szRemoteURI == NULL || szLocalPath == NULL )
        return FALSE;
    
    CInternetSession session;
    CHttpConnection * pHttpConn = NULL;
    CHttpFile       * pHttpFile = NULL;
    CString         strServer   = _T("");
    CString         strObject   = _T("");
    INTERNET_PORT   wPort       = 0;
    DWORD           dwType      = 0;
    
    HANDLE hFile = NULL;
    TCHAR  pszBuffer[__BUFFER_SIZE];
    DWORD  dwFileSize = 0;
    
    const int nTimeOut = 2000;
    session.SetOption(INTERNET_OPTION_CONNECT_TIMEOUT, nTimeOut);
    session.SetOption(INTERNET_OPTION_CONNECT_RETRIES, 1);       
    
    BOOL bResult = FALSE;
    
    try
    {
        bResult = AfxParseURL(szRemoteURI, dwType, strServer, strObject, wPort);
        if ( !bResult )
            return FALSE;

        pHttpConn = session.GetHttpConnection(strServer, wPort, NULL, NULL);
        VERIFY(pHttpConn != NULL);

        pHttpFile = pHttpConn->OpenRequest(CHttpConnection::HTTP_VERB_GET, strObject);
        VERIFY(pHttpFile != NULL);
        
        if ( !pHttpFile->SendRequest() )
            goto _err_handler;
        
        DWORD dwStateCode;
        pHttpFile->QueryInfoStatusCode(dwStateCode);
        if ( dwStateCode != HTTP_STATUS_OK )
            goto _err_handler;
        
        hFile = CreateFile(szLocalPath, GENERIC_WRITE, FILE_SHARE_WRITE, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL); 
        if ( hFile == INVALID_HANDLE_VALUE )
            goto _err_handler;
        
        BOOL bRet = pHttpFile->QueryInfo(HTTP_QUERY_CONTENT_LENGTH, dwFileSize);
        if ( !bRet )
            goto _err_handler;
        
        DWORD dwWrite = 0, dwTotalWrite = 0;
        UINT nRead = 0;       
        do
        {
            nRead = pHttpFile->Read(pszBuffer, __BUFFER_SIZE);
            if (nRead <= 0) 
                break;

            WriteFile(hFile, pszBuffer, nRead, &dwWrite, NULL);
            if (nRead =! dwWrite)
                break;

            dwTotalWrite += dwWrite;
        } while (TRUE);
        
        if ( dwTotalWrite != dwFileSize )
            goto _err_handler;
        
        bResult = TRUE;
    }
    catch (CFileException* e)
    {
        e->Delete();
        AfxMessageBox(_T("CFileException"));
    }
    catch (CInternetException* e)
    {
        CString sError;
        sError.Format(_T("Inernet connection error : %d"), e->m_dwError);
        e->Delete();
        AfxMessageBox(sError);
    }

_err_handler:
    if ( pHttpFile )
    {
        pHttpFile->Close();
        delete pHttpFile;
        pHttpFile = NULL;
    }
    if ( pHttpConn )
    {
        pHttpConn->Close();
        delete pHttpConn;
        pHttpConn = NULL;
    }
    session.Close();
    
    if (hFile) 
        CloseHandle(hFile);
    
    return bResult;
}

BOOL CHttpFileClient::DeleteFile(LPCTSTR szRemoteURI)
{
    if ( szRemoteURI == NULL )
        return FALSE;
    
    CInternetSession session;
    CHttpConnection * pHttpConn = NULL;
    CHttpFile       * pHttpFile = NULL;
    CString         strServer   = _T("");
    CString         strObject   = _T("");
    INTERNET_PORT   wPort       = 0;
    DWORD           dwType      = 0;
    
    const int nTimeOut = 2000;
    session.SetOption(INTERNET_OPTION_CONNECT_TIMEOUT, nTimeOut);
    session.SetOption(INTERNET_OPTION_CONNECT_RETRIES, 1);       
    
    BOOL bResult = FALSE;
    
    try
    {
        bResult = AfxParseURL(szRemoteURI, dwType, strServer, strObject, wPort);
        if ( !bResult )
            return FALSE;

        pHttpConn = session.GetHttpConnection(strServer, wPort, NULL, NULL);
        VERIFY(pHttpConn != NULL);
        
        pHttpFile = pHttpConn->OpenRequest(CHttpConnection::HTTP_VERB_DELETE, strObject);
        VERIFY(pHttpFile != NULL);

        if( !pHttpFile->SendRequest() )
            goto _err_handler;
        
        DWORD dwStateCode;
        pHttpFile->QueryInfoStatusCode(dwStateCode);
        if ( dwStateCode != HTTP_STATUS_OK )
            goto _err_handler;
        
        bResult = TRUE;
    }
    catch (CFileException* e)
    {
        e->Delete();
        AfxMessageBox(_T("CFileException"));
    }
    catch (CInternetException* e)
    {
        CString sError;
        sError.Format(_T("Inernet connection error : %d"), e->m_dwError);
        e->Delete();
        AfxMessageBox(sError);
    }
    
_err_handler:
    if ( pHttpFile )
    {
        pHttpFile->Close();
        delete pHttpFile;
        pHttpFile = NULL;
    }
    if ( pHttpConn )
    {
        pHttpConn->Close();
        delete pHttpConn;
        pHttpConn = NULL;
    }
    session.Close();
    
    return bResult;
}

BOOL CHttpFileClient::UseHttpSendReqEx(CHttpFile* pHttpFile, LPCTSTR szLocalFile)
{
    if ( pHttpFile == NULL || szLocalFile == NULL )
        return FALSE;
    
    INTERNET_BUFFERS    BufferIn;
    DWORD               dwTotalWritten = 0;
    BYTE                pFileBuffer[__BUFFER_SIZE];
    DWORD               dwPostSize = 0;
    CFile               file;
    BOOL                bRet = FALSE;
    
    bRet = file.Open(szLocalFile, CFile::shareDenyNone | CFile::modeRead);
    if ( !bRet )
        return FALSE;

    dwPostSize = (DWORD)file.GetLength();
    if (dwPostSize >= 0x80000000)
        return FALSE;

    memset(&BufferIn, 0, sizeof(BufferIn));
    BufferIn.dwStructSize    = sizeof( INTERNET_BUFFERS ); // Must be set or error will occur
    BufferIn.Next            = NULL;
    BufferIn.lpcszHeader     = NULL;
    BufferIn.dwHeadersLength = 0;
    BufferIn.dwHeadersTotal  = 0;
    BufferIn.lpvBuffer       = NULL;               
    BufferIn.dwBufferLength  = 0;
    BufferIn.dwBufferTotal   = dwPostSize; // This is the only member used other than dwStructSize
    BufferIn.dwOffsetLow     = 0;
    BufferIn.dwOffsetHigh    = 0;
    
    if( !pHttpFile->SendRequestEx(&BufferIn, NULL, HSR_INITIATE, 1) )
    {
        TRACE1("Error on HttpSendRequestEx %d\n", GetLastError());
        return FALSE;
    }
    
    file.SeekToBegin();
    do
    {
        int nActual = file.Read(pFileBuffer, __BUFFER_SIZE);
        if (nActual <= 0) break;
        pHttpFile->Write(pFileBuffer, nActual);
        dwTotalWritten += nActual;
    } while (TRUE);
    
    if ( dwTotalWritten != dwPostSize )
    {
        file.Close();
        TRACE1("\nError on InternetWriteFile %lu \n", GetLastError());
        return FALSE;
    }
    
    if ( !pHttpFile->EndRequest(0, NULL, 1) )
    {
        file.Close();
        TRACE1("Error on HttpEndRequest %lu \n", GetLastError());
        return FALSE;
    }
    
    file.Close();
    
    return TRUE;
}