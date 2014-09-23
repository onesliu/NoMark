#ifndef _QYYCY_H_
#define _QYYCY_H_

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

#endif /* _QYYCY_H_ */