#ifndef __TYPES_H__
#define __TYPES_H__

enum OP_TYPES
{
    TYPES_RESTOCK       = 1,    //����
    TYPES_UPDATE_PRICE  = 2,    //����
    TYPES_INVENTORY     = 3,    //�̵�
    TYPES_LOSS          = 4,    //����
    TYPES_PRODUCTINFO   = 5     //��Ʒ��Ϣ����
};

#define WM_UPLOAD       (WM_USER+101)
#define WM_DOWNLOAD     (WM_USER+102)

#endif __TYPES_H__