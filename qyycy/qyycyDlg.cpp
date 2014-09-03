// qyycyDlg.cpp : implementation file
//

#include "stdafx.h"
#include "qyycy.h"
#include "qyycyDlg.h"
#include <atlconv.h>
#include <stdlib.h>
//#include "cJSON.h"
#include "types.h"
#include "HttpFileClient.h"

//#pragma  comment(lib, "json/json_vc71_libmtd.lib")
//#include "json/json.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#define TEST_LOGIN                  1
#define TEST_DOWNLOAD_CHANGEPRICE   0

#define QYYCY_URL_LOGIN     (_T("http://qy.gz.1251102575.clb.myqcloud.com/admin/index.php?route=common/login"))
#define QYYCY_USERNAME      (_T("username=admin"))
#define QYYCY_PASSWORD      (_T("password=!@#qwe"))
#define QYYCY_URL_LOGIN_OK  (_T("http://qy.gz.1251102575.clb.myqcloud.com/admin/index.php?route=qingyou/login_ok"))
#define QYYCY_URL_UPLOAD    (_T("http://qy.gz.1251102575.clb.myqcloud.com/admin/index.php?route=qingyou/cq_exchange_data/upload"))
#define QYYCY_URL_DOWNLOAD  (_T("http://qy.gz.1251102575.clb.myqcloud.com/admin/index.php?route=qingyou/cq_exchange_data/download"))

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

void CQyycyDlg::OnTimer(UINT nIDEvent)
{
#if TEST_LOGIN > 0
//     LoginPrepare(QYYCY_URL_LOGIN);
//     GetCookie();
//     ReleaseMem();
//
//     Login(QYYCY_URL_LOGIN);
//     GetToken();
//     ReleaseMem();
//
//     m_strTemp.Format(_T("%s&type=%d&token=%s"), QYYCY_URL_UPLOAD, TYPES_UPDATE_PRICE, m_strToken);
//     UploadData(m_strTemp, _T("UpdatePrice.txt"));
//     ReleaseMem();
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

    CHttpFileClient hfc;
    CString strTemp;

    hfc.CanWebsiteVisit(QYYCY_URL_LOGIN);
    hfc.Login(QYYCY_URL_LOGIN, QYYCY_USERNAME, QYYCY_PASSWORD, QYYCY_URL_LOGIN_OK);

    strTemp.Format(_T("%s&type=%d&token=%s"), QYYCY_URL_UPLOAD, TYPES_UPDATE_PRICE, hfc.GetToken());
    hfc.UploadFile(strTemp, _T("UpdatePrice.txt"));

#endif
}

LRESULT CQyycyDlg::OnRecvStore(WPARAM wParam, LPARAM lParam)
{
    AfxMessageBox(_T("Receive msg!"));
    return 0;
}
