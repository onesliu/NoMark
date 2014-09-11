// DialogModifyShopNo.cpp : implementation file
//

#include "stdafx.h"
#include "qyycy.h"
#include "DialogModifyShopNo.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDialogModifyShopNo dialog


CDialogModifyShopNo::CDialogModifyShopNo(CWnd* pParent /*=NULL*/)
	: CDialog(CDialogModifyShopNo::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDialogModifyShopNo)
	m_editShopNo = 0;
	//}}AFX_DATA_INIT
}


void CDialogModifyShopNo::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDialogModifyShopNo)
	DDX_Text(pDX, IDC_EDIT_SHOP_NO, m_editShopNo);
	DDV_MinMaxInt(pDX, m_editShopNo, 0, 999);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDialogModifyShopNo, CDialog)
	//{{AFX_MSG_MAP(CDialogModifyShopNo)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDialogModifyShopNo message handlers
