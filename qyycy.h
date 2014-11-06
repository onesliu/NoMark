#ifndef _QYYCY_H_
#define _QYYCY_H_

#ifdef __cplusplus
extern "C" {
#endif

enum OP_TYPES
{
    TYPES_NULL          = 0,
    TYPES_GOODSINFO     = 1,    //商品信息更新
    TYPES_UPDATE_PRICE  = 2,    //调价
    TYPES_RESTOCK       = 3,    //进货
    TYPES_INVENTORY     = 4,    //盘点
    TYPES_LOSS          = 5     //报损
};

#define QYYCY_URL_LOGIN             ("http://qy.gz.1251102575.clb.myqcloud.com/admin/index.php?route=common/login")
#define QYYCY_USERNAME              ("admin")
#define QYYCY_PASSWORD              ("!@#qwe")
#define QYYCY_URL_LOGIN_OK          ("http://qy.gz.1251102575.clb.myqcloud.com/admin/index.php?route=qingyou/login_ok")
#define QYYCY_URL_UPLOAD            ("http://qy.gz.1251102575.clb.myqcloud.com/admin/index.php?route=qingyou/cq_exchange_data/upload")
#define QYYCY_URL_DOWNLOAD          ("http://qy.gz.1251102575.clb.myqcloud.com/admin/index.php?route=qingyou/cq_exchange_data/download")
#define QYYCY_URL_DOWNLOAD_ORDERS   ("http://qy.gz.1251102575.clb.myqcloud.com/admin/index.php?route=qingyou/order_query&districtid=1")

#define FILE_UPLOAD_CHANGE_PRICE    (".\\data\\upload_change_price.txt")
#define FILE_DOWNLOAD_CHANGE_PRICE  (".\\data\\download_change_price.txt")
#define FILE_UPLOAD_GOODS_INFO      (".\\data\\upload_goods_info.txt")
#define FILE_DOWNLOAD_GOODS_INFO    (".\\data\\download_goods_info.txt")
#define FILE_TEMP                   (".\\data\\temp.txt")
#define FILE_ORDER_QUERY            (".\\data\\order_query.json")

typedef void* HTTP_FILE_HANDLE;

typedef struct _LOGIN_S_
{
    const char * name;
    const char * pwd;
} LOGIN_S;

typedef struct _DATA_     // if you want to upload, we use only one parameter, the another parameter must be NULL. 
{
    const char * filename;       
    const char * buf;
} DATA_S;

typedef struct _HFC_DATA_S_ 
{
    HTTP_FILE_HANDLE    hdl;
    const char*         url;           // url to visit
    const char*         url_login_ok;  // redirect url
    LOGIN_S             login; 
    OP_TYPES            type;
    int                 shopNo;
    DATA_S              data;
} HFC_DATA_S;

__declspec(dllexport) HTTP_FILE_HANDLE HFC_Init();
__declspec(dllexport) void HFC_Release          (HFC_DATA_S * hfc);
__declspec(dllexport) bool HFC_CanWebsiteVisit  (HFC_DATA_S * hfc);
__declspec(dllexport) bool HFC_Login            (HFC_DATA_S * hfc);
__declspec(dllexport) bool HFC_Upload           (HFC_DATA_S * hfc);
__declspec(dllexport) bool HFC_Download         (HFC_DATA_S * hfc);

#ifdef __cplusplus
} /* extern "C" */
#endif

#endif /* _QYYCY_H_ */