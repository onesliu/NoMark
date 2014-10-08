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

enum OP_TYPES
{
    TYPES_GOODSINFO     = 1,    //商品信息更新
    TYPES_UPDATE_PRICE  = 2,    //调价
    TYPES_RESTOCK       = 3,    //进货
    TYPES_INVENTORY     = 4,    //盘点
    TYPES_LOSS          = 5,    //报损
    TYPES_NULL,
};

#define QYYCY_URL_LOGIN     ("http://qy.gz.1251102575.clb.myqcloud.com/admin/index.php?route=common/login")
#define QYYCY_USERNAME      ("username=admin")
#define QYYCY_PASSWORD      ("password=!@#qwe")
#define QYYCY_URL_LOGIN_OK  ("http://qy.gz.1251102575.clb.myqcloud.com/admin/index.php?route=qingyou/login_ok")
#define QYYCY_URL_UPLOAD    ("http://qy.gz.1251102575.clb.myqcloud.com/admin/index.php?route=qingyou/cq_exchange_data/upload")
#define QYYCY_URL_DOWNLOAD  ("http://qy.gz.1251102575.clb.myqcloud.com/admin/index.php?route=qingyou/cq_exchange_data/download")

#define FILE_UPLOAD_CHANGE_PRICE    ("data\\upload_change_price.txt")
#define FILE_DOWNLOAD_CHANGE_PRICE  ("data\\download_change_price.txt")
#define FILE_UPLOAD_GOODS_INFO      ("data\\upload_goods_info.txt") 
#define FILE_DOWNLOAD_GOODS_INFO    ("data\\download_goods_info.txt")

typedef void* HTTP_FILE_HANDLE;

__declspec(dllexport) HTTP_FILE_HANDLE HFC_Init();

__declspec(dllexport) void HFC_Release(HTTP_FILE_HANDLE hdl);

__declspec(dllexport) bool HFC_CanWebsiteVisit(HTTP_FILE_HANDLE hdl, 
                                               const char* url_login);

__declspec(dllexport) bool HFC_Login(HTTP_FILE_HANDLE hdl, 
                                     const char* url_login,
                                     const char* name,
                                     const char* pwd,
                                     const char* url_login_ok);

__declspec(dllexport) bool HFC_Upload(HTTP_FILE_HANDLE hdl, 
                                      const char* url_upload, 
                                      OP_TYPES op_type, 
                                      const char* filename);

__declspec(dllexport) bool HFC_Download(HTTP_FILE_HANDLE hdl, 
                                        const char* url_download, 
                                        OP_TYPES op_type, 
                                        int shop_no, 
                                        const char* filename);

#ifdef __cplusplus
} /* extern "C" */
#endif

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_QYYCY_H__BF75378E_4814_458F_B222_6ADEBEB6A5B6__INCLUDED_)
