// qyycy.h : main header file for the QYYCY DLL
//

#if !defined(AFX_QYYCY_H__BF75378E_4814_458F_B222_6ADEBEB6A5B6__INCLUDED_)
#define AFX_QYYCY_H__BF75378E_4814_458F_B222_6ADEBEB6A5B6__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CQyycyApp
// See qyycy.cpp for the implementation of this class
//

class CQyycyApp : public CWinApp
{
public:
	CQyycyApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CQyycyApp)
	//}}AFX_VIRTUAL

	//{{AFX_MSG(CQyycyApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#ifdef __cplusplus
extern "C" {
#endif

typedef void* HTTP_FILE_HANDLE;

__declspec(dllexport) HTTP_FILE_HANDLE HFC_Init();
__declspec(dllexport) void HFC_Release(HTTP_FILE_HANDLE hdl);
__declspec(dllexport) bool HFC_CanWebsiteVisit(HTTP_FILE_HANDLE hdl, const char* url_login);
__declspec(dllexport) bool HFC_Login(HTTP_FILE_HANDLE hdl, const char* url_login,
                                                           const char* name,
                                                           const char* pwd,
                                                           const char* url_login_ok);
__declspec(dllexport) bool HFC_Upload(HTTP_FILE_HANDLE hdl, const char* url_upload);
__declspec(dllexport) bool HFC_Download(HTTP_FILE_HANDLE hdl, const char* url_download, int shop_no);

#ifdef __cplusplus
} /* extern "C" */
#endif

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_QYYCY_H__BF75378E_4814_458F_B222_6ADEBEB6A5B6__INCLUDED_)
