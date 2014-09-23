// qyycyDlg.cpp : implementation file
//

#include "stdafx.h"
#include "qyycy.h"
#include "qyycyDlg.h"
#include <stdlib.h>
#include "types.h"
#include "HttpFileClient.h"
#include "DialogModifyShopNo.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#define TEST_LOGIN                  1
#define TEST_UPLOAD_CHANGEPRICE     1
#define TEST_DOWNLOAD_CHANGEPRICE   1

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
		// No message handlers
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

    m_nShopNo = -1;
}

void CQyycyDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CQyycyDlg)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CQyycyDlg, CDialog)
	//{{AFX_MSG_MAP(CQyycyDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_WM_TIMER()
    ON_MESSAGE(WM_UPLOAD, OnUploadData)  
	ON_BN_CLICKED(IDC_BTN_UPLOAD_DATA, OnBtnUploadData)
	ON_BN_CLICKED(IDC_BTN_DOWNLOAD_DATA, OnBtnDownloadData)
	ON_BN_CLICKED(IDC_BTN_MODIFY_SHOP_NO, OnBtnModifyShopNo)
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
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
//     SetTimer(1, 1*1000, NULL);
    
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
    // TODO: Add your message handler code here and/or call default
    
    CDialog::OnTimer(nIDEvent);
}


// Receive message from POS software
LRESULT CQyycyDlg::OnUploadData(WPARAM wParam, LPARAM lParam)
{
#if TEST_LOGIN > 0
    CHttpFileClient hfc;
    CString strURL;
    
    hfc.CanWebsiteVisit(QYYCY_URL_LOGIN);
    hfc.Login(QYYCY_URL_LOGIN, QYYCY_USERNAME, QYYCY_PASSWORD, QYYCY_URL_LOGIN_OK);
#endif
    
#if TEST_UPLOAD_CHANGEPRICE > 0
    strURL.Format(_T("%s&type=%d&token=%s"), QYYCY_URL_UPLOAD, TYPES_UPDATE_PRICE, hfc.GetToken());
    hfc.UploadFile(strURL, _T("upload_change_price.txt"));
#endif	

    return 0;
}

void CQyycyDlg::OnBtnUploadData() 
{
#if TEST_LOGIN > 0
    CHttpFileClient hfc;
    CString strURL;
    
    hfc.CanWebsiteVisit(QYYCY_URL_LOGIN);
    hfc.Login(QYYCY_URL_LOGIN, QYYCY_USERNAME, QYYCY_PASSWORD, QYYCY_URL_LOGIN_OK);
#endif
    
#if TEST_UPLOAD_CHANGEPRICE > 0
    strURL.Format(_T("%s&type=%d&token=%s"), QYYCY_URL_UPLOAD, TYPES_UPDATE_PRICE, hfc.GetToken());
    hfc.UploadFile(strURL, _T("upload_change_price.txt"));
#endif	
}

void CQyycyDlg::OnBtnDownloadData() 
{ 
    if ( m_nShopNo < 0 )
        GetDlgItem(IDC_BTN_DOWNLOAD_DATA)->EnableWindow(FALSE);

#if TEST_LOGIN > 0
    CHttpFileClient hfc;
    CString strURL;

    hfc.CanWebsiteVisit(QYYCY_URL_LOGIN);
    hfc.Login(QYYCY_URL_LOGIN, QYYCY_USERNAME, QYYCY_PASSWORD, QYYCY_URL_LOGIN_OK);
#endif
    
#if TEST_DOWNLOAD_CHANGEPRICE > 0
    strURL.Format(_T("%s&shopNo=%d&type=%d&token=%s"), QYYCY_URL_DOWNLOAD, m_nShopNo, TYPES_UPDATE_PRICE, hfc.GetToken());
    hfc.DownLoadFile(strURL, _T("download_change_price.txt"));

    CWnd *pWnd = CWnd::FindWindow(NULL, _T("销售客户端"));
    if ( !pWnd )
    {
        AfxMessageBox(_T("Can not find window 销售客户端!"));
        return;
    }
    else
    {
        pWnd->SendMessage(WM_DOWNLOAD, TYPES_UPDATE_PRICE, 0);
    }
#endif	
}

void CQyycyDlg::OnBtnModifyShopNo() 
{
	CDialogModifyShopNo dlg;

    dlg.DoModal();
    m_nShopNo = dlg.m_editShopNo;
    
    CString str;
    str.Format(_T("店号：%d"), m_nShopNo);
    GetDlgItem(IDC_DLG_QYYCY_STATIC_SHOPNO)->SetWindowText(str);
    GetDlgItem(IDC_BTN_DOWNLOAD_DATA)->EnableWindow(TRUE);
}
