// qyycyDlg.h : header file
//

#if !defined(AFX_QYYCYDLG_H__51C6A481_0BD4_446D_8003_FFC9A81D3EAE__INCLUDED_)
#define AFX_QYYCYDLG_H__51C6A481_0BD4_446D_8003_FFC9A81D3EAE__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CQyycyDlg dialog

class CQyycyDlg : public CDialog
{
// Construction
public:
	CQyycyDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CQyycyDlg)
	enum { IDD = IDD_QYYCY_DIALOG };
		// NOTE: the ClassWizard will add data members here
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
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnTimer(UINT nIDEvent);
    afx_msg LRESULT OnUploadData(WPARAM wParam, LPARAM lParam);
	afx_msg void OnBtnUploadData();
	afx_msg void OnBtnDownloadData();
	afx_msg void OnBtnModifyShopNo();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

private:
    int m_nShopNo;
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_QYYCYDLG_H__51C6A481_0BD4_446D_8003_FFC9A81D3EAE__INCLUDED_)
