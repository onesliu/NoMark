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
	AnsiString	strMsg[]={"�ɹ�","����ʧ��","ͨѶʧ��","����ʧ��","���ӶϿ�",
		"����������Ϊ��","�û��ֶ��˳�","Ŀ��IPΪ��","ͨѶδȫ���ɹ���ĳIP����������Ϣ������return.txt�� .",
		"","",
		"dhpluversion.intΪ�ջ����ô���",
		"dhplupathname.iniΪ�ջ����ô���",
		"dhplupathname.ini�ж�ȡ��Plu·������,��ָ���Plu�ļ�������",
		"Plu�ı�Ϊ�ջ������ô���(��:Plu�汾��Plu�ı����ݲ�һ�µ�)",
		"","","","","",
	};
    
    int iRet = dhSendPluDefault();

    ShowInfo(strMsg[iRet*(-1)].c_str());
    
    return true;
}

bool TScale::RecvScale()
{
	AnsiString	strMsg[]={"�ɹ�","����ʧ��","ͨѶʧ��","����ʧ��","���ӶϿ�",
		"����������Ϊ��","�û��ֶ��˳�","Ŀ��IPΪ��","ͨѶδȫ���ɹ���ĳIP����������Ϣ������return.txt�� .",
		"","",
		"dhpluversion.intΪ�ջ����ô���",
		"dhplupathname.iniΪ�ջ����ô���",
		"dhplupathname.ini�ж�ȡ��Plu·������,��ָ���Plu�ļ�������",
		"Plu�ı�Ϊ�ջ������ô���(��:Plu�汾��Plu�ı����ݲ�һ�µ�)",
		"","","","","",
	};
    
    int iRet = dhRcvRdDefault();

    ShowInfo(strMsg[iRet*(-1)].c_str());
    
    return true;
}



