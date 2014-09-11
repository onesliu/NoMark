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

#endif __TYPES_H__