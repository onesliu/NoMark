#ifndef __TYPES_H__
#define __TYPES_H__

enum OP_TYPES
{
    TYPES_RESTOCK       = 1,    //进货
    TYPES_UPDATE_PRICE  = 2,    //调价
    TYPES_INVENTORY     = 3,    //盘点
    TYPES_LOSS          = 4,    //报损
    TYPES_PRODUCTINFO   = 5     //商品信息更新
};

#define WM_UPLOAD       (WM_USER+101)
#define WM_DOWNLOAD     (WM_USER+102)

#define QYYCY_URL_LOGIN     ("http://qy.gz.1251102575.clb.myqcloud.com/admin/index.php?route=common/login")
#define QYYCY_USERNAME      ("username=admin")
#define QYYCY_PASSWORD      ("password=!@#qwe")
#define QYYCY_URL_LOGIN_OK  ("http://qy.gz.1251102575.clb.myqcloud.com/admin/index.php?route=qingyou/login_ok")
#define QYYCY_URL_UPLOAD    ("http://qy.gz.1251102575.clb.myqcloud.com/admin/index.php?route=qingyou/cq_exchange_data/upload")
#define QYYCY_URL_DOWNLOAD  ("http://qy.gz.1251102575.clb.myqcloud.com/admin/index.php?route=qingyou/cq_exchange_data/download")

#endif __TYPES_H__