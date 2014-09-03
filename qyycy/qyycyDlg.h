// qyycyDlg.h : header file
//
//{{AFX_INCLUDES()

//}}AFX_INCLUDES
#include <afxinet.h>

#if !defined(AFX_QYYCYDLG_H__CEA5C212_8873_45B8_A4A6_76ECBDD4ACCE__INCLUDED_)
#define AFX_QYYCYDLG_H__CEA5C212_8873_45B8_A4A6_76ECBDD4ACCE__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CQyycyDlg dialog

class CQyycyDlg : public CDialog
{
// Construction
public:

void doit(char *text);
    CString m_strServer;
    CString m_strObject;
	CString m_strCookie;
    CString m_strTemp;
    CString m_strToken;
	CInternetSession m_session;
    CHttpConnection *m_pHttpConn;
    CHttpFile       *m_pHttpFile;

    BOOL CreateSession  (const CString url);
    BOOL Login          (const CString url);
	BOOL LoginPrepare   (const CString url);
    BOOL UploadData     (const CString url, const CString strFilePath);
    BOOL UseHttpSendReqEx(LPCTSTR szLocalFile);

    void ReleaseMem(void);
    void GetCookie();
    void GetToken();
    char* UnicodeToUTF8(const CString strSrc);
	CString URLEncode(CString sIn);
	
	CQyycyDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CQyycyDlg)
	enum { IDD = IDD_QYYCY_DIALOG };
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CQyycyDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CQyycyDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();//WM_RECV_STORE
	afx_msg void OnButton1();
    afx_msg LRESULT OnRecvStore(WPARAM wParam, LPARAM lParam);
	afx_msg void OnTimer(UINT nIDEvent);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_QYYCYDLG_H__CEA5C212_8873_45B8_A4A6_76ECBDD4ACCE__INCLUDED_)
