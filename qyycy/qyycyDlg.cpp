// qyycyDlg.cpp : implementation file
//

#include "stdafx.h"
#include "qyycy.h"
#include "qyycyDlg.h"
#include <atlconv.h>
#include <stdlib.h>
#include "cJSON.h"
#include "types.h"

//#pragma  comment(lib, "json/json_vc71_libmtd.lib")
//#include "json/json.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#define TEST_LOGIN                  1
#define TEST_DOWNLOAD_CHANGEPRICE   0

#define BUF_SIZE                    1024

#define QYYCY_URL_LOGIN     (_T("http://qy.gz.1251102575.clb.myqcloud.com/admin/index.php?route=common/login"))
#define QYYCY_USERNAME      (_T("username=admin"))
#define QYYCY_PASSWORD      (_T("password=!@#qwe"))
#define QYYCY_URL_LOGIN_OK  (_T("http://qy.gz.1251102575.clb.myqcloud.com/admin/index.php?route=qingyou/login_ok"))
#define QYYCY_URL_UPLOAD    (_T("http://qy.gz.1251102575.clb.myqcloud.com/admin/index.php?route=qingyou/cq_exchange_data/upload"))
/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About

class CAboutDlg : public CDialog
{
public:
  CAboutDlg();

// Dialog Data
  //{{AFX_DATA(CAboutDlg)
  enum { IDD = IDD_ABOUTBOX };
  //}}AFX_DATA

  // ClassWizard generated virtual function overrides
  //{{AFX_VIRTUAL(CAboutDlg)
  protected:
  virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
  //}}AFX_VIRTUAL

// Implementation
protected:
  //{{AFX_MSG(CAboutDlg)
  //}}AFX_MSG
  DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
  //{{AFX_DATA_INIT(CAboutDlg)
  //}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
  CDialog::DoDataExchange(pDX);
  //{{AFX_DATA_MAP(CAboutDlg)
  //}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
  //{{AFX_MSG_MAP(CAboutDlg)
  //}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CQyycyDlg dialog

CQyycyDlg::CQyycyDlg(CWnd* pParent /*=NULL*/)
    : CDialog(CQyycyDlg::IDD, pParent)
{
    //{{AFX_DATA_INIT(CQyycyDlg)
        // NOTE: the ClassWizard will add member initialization here
    //}}AFX_DATA_INIT
    // Note that LoadIcon does not require a subsequent DestroyIcon in Win32
    m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
    m_pHttpConn = NULL;
    m_pHttpFile = NULL;
}

void CQyycyDlg::DoDataExchange(CDataExchange* pDX)
{
    CDialog::DoDataExchange(pDX);
    //{{AFX_DATA_MAP(CQyycyDlg)
    //}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CQyycyDlg, CDialog)
    //{{AFX_MSG_MAP(CQyycyDlg)
    ON_WM_SYSCOMMAND()
    ON_WM_PAINT()
    ON_WM_QUERYDRAGICON()
    ON_BN_CLICKED(IDC_BUTTON1, OnButton1)
    ON_MESSAGE(WM_RECV_STORE, OnRecvStore) // 自定义消息
    ON_WM_TIMER()
    //}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CQyycyDlg message handlers

BOOL CQyycyDlg::OnInitDialog()
{
    CDialog::OnInitDialog();

    // Add "About..." menu item to system menu.

    // IDM_ABOUTBOX must be in the system command range.
    ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
    ASSERT(IDM_ABOUTBOX < 0xF000);

    CMenu* pSysMenu = GetSystemMenu(FALSE);
    if (pSysMenu != NULL)
    {
        CString strAboutMenu;
        strAboutMenu.LoadString(IDS_ABOUTBOX);
        if (!strAboutMenu.IsEmpty())
        {
            pSysMenu->AppendMenu(MF_SEPARATOR);
            pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
        }
    }

      // Set the icon for this dialog.  The framework does this automatically
      //  when the application's main window is not a dialog
      SetIcon(m_hIcon, TRUE);     // Set big icon
      SetIcon(m_hIcon, FALSE);    // Set small icon

//      SetTimer(1, 1*1000, NULL);

      // TODO: Add extra initialization here
      return TRUE;  // return TRUE  unless you set the focus to a control
}

void CQyycyDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
    if ((nID & 0xFFF0) == IDM_ABOUTBOX)
    {
        CAboutDlg dlgAbout;
        dlgAbout.DoModal();
    }
    else
    {
        CDialog::OnSysCommand(nID, lParam);
    }
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CQyycyDlg::OnPaint()
{
    if (IsIconic())
    {
        CPaintDC dc(this); // device context for painting

        SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

        // Center icon in client rectangle
        int cxIcon = GetSystemMetrics(SM_CXICON);
        int cyIcon = GetSystemMetrics(SM_CYICON);
        CRect rect;
        GetClientRect(&rect);
        int x = (rect.Width() - cxIcon + 1) / 2;
        int y = (rect.Height() - cyIcon + 1) / 2;

        // Draw the icon
        dc.DrawIcon(x, y, m_hIcon);
    }
    else
    {
        CDialog::OnPaint();
    }
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CQyycyDlg::OnQueryDragIcon()
{
    return (HCURSOR) m_hIcon;
}

void CQyycyDlg::doit(char *text)
{
    cJSON *json;

    json = cJSON_Parse(text);
    if ( !json )
    {
        printf("Error before: [%s]\n",cJSON_GetErrorPtr());
    }
    else
    {
        cJSON *json1 = cJSON_GetObjectItem(json, "name");

        if (json1)
        {
            USES_CONVERSION;
            CString str = A2T(json1->valuestring);

            GetDlgItem(IDC_STATIC)->SetWindowText(str);

        }
        cJSON_Delete(json);
    }
}

void CQyycyDlg::OnTimer(UINT nIDEvent)
{
#if TEST_LOGIN > 0
    LoginPrepare(QYYCY_URL_LOGIN);
    GetCookie();
    ReleaseMem();

    Login(QYYCY_URL_LOGIN);
    GetToken();
//    doit( (LPSTR)(LPCTSTR)m_strToken);
    ReleaseMem();
    
    m_strTemp.Format(_T("%s&type=%d&token=%s"), QYYCY_URL_UPLOAD, TYPES_UPDATE_PRICE, m_strToken);
    UploadData(m_strTemp, _T("UpdatePrice.txt"));
    ReleaseMem();
#endif

    CDialog::OnTimer(nIDEvent);
}

void CQyycyDlg::OnButton1()
{
#if TEST_DOWNLOAD_CHANGEPRICE > 0
    CWnd *pWnd = CWnd::FindWindow(NULL, _T("销售客户端"));
    if ( !pWnd )
    {
        MessageBox(_T("无效窗口"));
    }
    else
    {
        pWnd->SendMessage(WM_SEND_SELL, TYPES_UPDATE_PRICE, 0);
    }
#endif

#if TEST_LOGIN > 0
    LoginPrepare(QYYCY_URL_LOGIN);
    GetCookie();
    ReleaseMem();

    Login(QYYCY_URL_LOGIN);
    GetToken();
//    doit( (LPSTR)(LPCTSTR)m_strToken);
    ReleaseMem();

    m_strTemp.Format(_T("%s&type=%d&token=%s"), QYYCY_URL_UPLOAD, TYPES_UPDATE_PRICE, m_strToken);
    UploadData(m_strTemp, _T("UpdatePrice.txt"));
    ReleaseMem();
#endif
}

void CQyycyDlg::ReleaseMem(void)
{
    if ( m_pHttpFile != NULL )
    {
        m_pHttpFile->Close();
        delete m_pHttpFile;
        m_pHttpFile = NULL;
    }

    if ( m_pHttpConn != NULL )
    {
        m_pHttpConn->Close();
        delete m_pHttpConn;
        m_pHttpConn = NULL;
    }
#if 0
    if ( m_session )
    {
        m_session.Close();
    }
#endif
}

inline TCHAR toHex(const BYTE &x)
{
    return x > 9 ? _T('A') + x-10: _T('0') + x;
}

CString CQyycyDlg::URLEncode(CString sIn)
{
    CString sOut;

    const int nLen = sIn.GetLength() + 1;

    register LPTSTR pOutTmp = NULL;
    LPTSTR pOutBuf = NULL;
    register LPTSTR pInTmp = NULL;
    LPTSTR pInBuf =(LPTSTR)sIn.GetBuffer(nLen);
    //BYTE b = 0;

    //alloc out buffer
    pOutBuf = (LPTSTR)sOut.GetBuffer(nLen   * 3 - 2);//new BYTE [nLen   * 3];

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

BOOL CQyycyDlg::CreateSession(const CString url)
{
    INTERNET_PORT   wPort = 0;
    DWORD           dwType = 0;
    DWORD           dwRet = 0;

    if ( AfxParseURL(url, dwType, m_strServer, m_strObject, wPort) == FALSE )
        return FALSE;

    m_pHttpConn = m_session.GetHttpConnection(m_strServer, (INTERNET_PORT)wPort);
    if ( m_pHttpConn == NULL )
    {
        AfxMessageBox(_T("Error! pHttpConn is NULL!"));
        return FALSE;
    }

    return TRUE;
}

BOOL CQyycyDlg::LoginPrepare(const CString url)
{
    if ( CreateSession(url) == FALSE )
        return FALSE;

    m_pHttpFile = m_pHttpConn->OpenRequest(CHttpConnection::HTTP_VERB_GET, m_strObject);
    if ( m_pHttpFile == NULL )
    {
        AfxMessageBox(_T("Error! pHttpFile is NULL!"));
        return FALSE;
    }

    if ( !m_pHttpFile->SendRequest() )
    {
        AfxMessageBox(_T("Http Get failed!"));
        return FALSE;
    }
 
    return TRUE;
}

BOOL CQyycyDlg::Login(const CString url)
{
    CString strUserinfo;
    char    *p = NULL;

    if ( CreateSession(url) == FALSE )
        return FALSE;

    m_pHttpFile = m_pHttpConn->OpenRequest(CHttpConnection::HTTP_VERB_POST, m_strObject, NULL, 0, NULL, NULL, INTERNET_FLAG_NO_CACHE_WRITE);
    if ( m_pHttpFile == NULL )
    {
        AfxMessageBox(_T("Error! pHttpFile is NULL!"));
        return FALSE;
    }

    try
    {
        m_pHttpFile->AddRequestHeaders(_T("Host: qy.gz.1251102575.clb.myqcloud.com\r\n"));
        m_pHttpFile->AddRequestHeaders(_T("Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\n"));
        m_pHttpFile->AddRequestHeaders(_T("Accept-Language: zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3\r\n"));
        m_pHttpFile->AddRequestHeaders(_T("Accept-Encoding: gzip, deflate\r\n"));
        m_pHttpFile->AddRequestHeaders(_T("Content-Type: application/x-www-form-urlencoded\r\n"));
        m_pHttpFile->AddRequestHeaders(_T("Connection: Keep-Alive\r\n"));
        m_pHttpFile->AddRequestHeaders(m_strCookie);
        strUserinfo.Format(_T("%s&%s&redirect=%s"), QYYCY_USERNAME, QYYCY_PASSWORD, URLEncode(QYYCY_URL_LOGIN_OK));
        p = UnicodeToUTF8(strUserinfo);

        if ( !m_pHttpFile->SendRequest(NULL, 0, (LPVOID)(LPCTSTR)p, strlen(p)) )
        {
            return FALSE;
        }
        free(p);
        p = NULL;
    }
    catch(CInternetException * pEx)
    {
        TCHAR sz[256] = _T("");
        pEx->GetErrorMessage(sz, 25);
        CString str;
        str.Format(_T("InternetException occur!\r\n%s"), sz);
        MessageBox(str);

        pEx->Delete();

        return FALSE;
    }

    return TRUE;
}

BOOL CQyycyDlg::UploadData(const CString url, const CString strFilePath)
{
    BOOL bResult = FALSE;

    try
    {
        if ( CreateSession(url) == FALSE )
            return FALSE;

        m_pHttpFile = m_pHttpConn->OpenRequest(CHttpConnection::HTTP_VERB_PUT, m_strObject);

        if ( m_pHttpFile == NULL )
        {
            AfxMessageBox(_T("Error! pHttpFile is NULL!"));
            return FALSE;
        }

        if ( UseHttpSendReqEx(strFilePath) )
        {
            DWORD dwStateCode = 0;
            m_pHttpFile->QueryInfoStatusCode(dwStateCode);

            if(dwStateCode == HTTP_STATUS_CREATED || dwStateCode == HTTP_STATUS_OK)
                bResult = TRUE;
        }
    }
    catch (CFileException* pEx)
    {
        pEx->Delete();
        AfxMessageBox(_T("CFileException"));
    }
    catch (CInternetException* pEx)
    {
        pEx->Delete();

        CString sError;
        sError.Format(_T("Inernet connection error : %d"), pEx->m_dwError);
        AfxMessageBox(sError);
    }

    return TRUE;
}

BOOL CQyycyDlg::UseHttpSendReqEx(LPCTSTR szLocalFile)
{
    INTERNET_BUFFERS BufferIn;
    DWORD dwTotalWritten = 0;
    BYTE  pFileBuffer[BUF_SIZE];
    DWORD dwPostSize = 0;
    CFile file;
    BOOL  bRet = FALSE;
    CString sError;

    bRet = file.Open(szLocalFile, CFile::shareDenyNone|CFile::modeRead);
    if (!bRet)
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

    if ( !m_pHttpFile->SendRequestEx(&BufferIn, NULL, HSR_INITIATE, 1) )
    {
        TRACE1( "Error on HttpSendRequestEx %d\n",GetLastError() );
        return FALSE;
    }

    file.SeekToBegin();
    do
    {
        int nActual = file.Read(pFileBuffer, BUF_SIZE);
        if (nActual <= 0) break;
        m_pHttpFile->Write(pFileBuffer, nActual);
        dwTotalWritten += nActual;
    } while (TRUE);

    if (dwTotalWritten != dwPostSize)
    {
        file.Close();
        TRACE1("\nError on InternetWriteFile %lu \n", GetLastError());
        return FALSE;
    }

    if ( !m_pHttpFile->EndRequest(0, NULL, 1) )
    {
        file.Close();
        TRACE1("\nError on HttpEndRequest %lu \n", GetLastError());
        return FALSE;
    }

    file.Close();

    return TRUE;
}

void CQyycyDlg::GetCookie()
{
    CString str;

    DWORD dwRet = m_pHttpFile->QueryInfo(HTTP_QUERY_SET_COOKIE, str);
    if (dwRet)
    {
        m_strCookie.Format(_T("Cookie: %s\r\n"), str);
    }
}

void CQyycyDlg::GetToken()
{
    CString strLine;

    if ( m_pHttpFile != NULL )
    {
        while(m_pHttpFile->ReadString(strLine) != NULL)
        {
            m_strTemp += strLine;
        }
    }

    cJSON *json, *json1;

    json = cJSON_Parse((LPSTR)(LPCTSTR)m_strTemp);
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

char* CQyycyDlg::UnicodeToUTF8(const CString strSrc)
{
    int len = WideCharToMultiByte(CP_UTF8, 0, strSrc, -1, NULL, 0, NULL, NULL); // the return value include "\0"
    char* utf8Str = (char*)malloc(len);
    memset(utf8Str, 0, sizeof(utf8Str));
    WideCharToMultiByte(CP_UTF8, 0, strSrc, -1, utf8Str, len, NULL, NULL);

    return utf8Str;
}

LRESULT CQyycyDlg::OnRecvStore(WPARAM wParam, LPARAM lParam)
{
    AfxMessageBox(_T("Receive msg!"));
    return 0;
}
