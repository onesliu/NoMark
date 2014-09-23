// qyycy.h : main header file for the QYYCY application
//

#if !defined(AFX_QYYCY_H__712527F2_EEF5_4AD2_A758_2AFED258BEEF__INCLUDED_)
#define AFX_QYYCY_H__712527F2_EEF5_4AD2_A758_2AFED258BEEF__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CQyycyApp:
// See qyycy.cpp for the implementation of this class
//

class CQyycyApp : public CWinApp
{
public:
	CQyycyApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CQyycyApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CQyycyApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_QYYCY_H__712527F2_EEF5_4AD2_A758_2AFED258BEEF__INCLUDED_)
