#if !defined(AFX_DIALOGMODIFYSHOPNO_H__2C2FEB8C_B8BC_495D_88F9_23EB054DAB64__INCLUDED_)
#define AFX_DIALOGMODIFYSHOPNO_H__2C2FEB8C_B8BC_495D_88F9_23EB054DAB64__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// DialogModifyShopNo.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CDialogModifyShopNo dialog

class CDialogModifyShopNo : public CDialog
{
// Construction
public:
	CDialogModifyShopNo(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDialogModifyShopNo)
	enum { IDD = IDD_DLG_MODIFY_SHOP_NO };
	int		m_editShopNo;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDialogModifyShopNo)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDialogModifyShopNo)
	virtual BOOL OnInitDialog();
	virtual void OnOK();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DIALOGMODIFYSHOPNO_H__2C2FEB8C_B8BC_495D_88F9_23EB054DAB64__INCLUDED_)
