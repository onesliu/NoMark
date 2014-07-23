//---------------------------------------------------------------------------


#pragma hdrstop
#include <vcl.h>
#include <stdio.h>
#include "Scale.h"
#include "MessageBoxes.h"
//---------------------------------------------------------------------------

#pragma package(smart_init)

#if 0
#define MY_IMPORT __declspec(dllimport)
MY_IMPORT int dhSendPluDefault();
MY_IMPORT int dhRcvRdDefault();
 #endif

#ifdef __cplusplus
extern "C" {
#endif

int  dhSendPluDefault();
int  dhRcvRdDefault();

#ifdef __cplusplus
}
#endif


bool TScale::ParseFile()
{
    AnsiString strPath = ".\\UpdatePrice.txt";
    
    TStringList *list = new TStringList();
    list->LoadFromFile(strPath);
    AnsiString r0 = list->Strings[0];
    delete list;

    return true;
}

bool TScale::SendScale()
{
	AnsiString	strMsg[]={"成功","连接失败","通讯失败","发送失败","连接断开",
		"待发送数据为空","用户手动退出","目标IP为空","通讯未全部成功，某IP出错，具体信息保存在return.txt中 .",
		"","",
		"dhpluversion.int为空或设置错误",
		"dhplupathname.ini为空或设置错误",
		"dhplupathname.ini中读取的Plu路径不对,所指向的Plu文件不存在",
		"Plu文本为空或者设置错误(如:Plu版本与Plu文本内容不一致等)",
		"","","","","",
	};
    
    int iRet = dhSendPluDefault();

    ShowInfo(strMsg[iRet*(-1)].c_str());
    
    return true;
}

bool TScale::RecvScale()
{
	AnsiString	strMsg[]={"成功","连接失败","通讯失败","发送失败","连接断开",
		"待发送数据为空","用户手动退出","目标IP为空","通讯未全部成功，某IP出错，具体信息保存在return.txt中 .",
		"","",
		"dhpluversion.int为空或设置错误",
		"dhplupathname.ini为空或设置错误",
		"dhplupathname.ini中读取的Plu路径不对,所指向的Plu文件不存在",
		"Plu文本为空或者设置错误(如:Plu版本与Plu文本内容不一致等)",
		"","","","","",
	};
    
    int iRet = dhRcvRdDefault();

    ShowInfo(strMsg[iRet*(-1)].c_str());
    
    return true;
}



