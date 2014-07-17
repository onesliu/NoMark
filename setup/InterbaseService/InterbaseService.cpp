//---------------------------------------------------------------------------
#include <stdio.h>
#include <vcl.h>
#pragma hdrstop

//---------------------------------------------------------------------------

#pragma argsused
int main(int argc, char* argv[])
{
    AnsiString dir = GetCurrentDir();
    AnsiString ibserver = dir + "\\ibserver.exe";
    AnsiString ibguard = dir + "\\ibguard.exe";

    if ( FileExists(ibserver) == false ) {
        printf("%s does not exists!\n", ibserver.c_str());
        return -1;
    }

    if ( FileExists(ibguard) == false ) {
        printf("%s does not exists!\n", ibguard.c_str());
        return -1;
    }

    ibserver = "\"" + ibserver + "\"";
    ibguard = "\"" + ibguard + "\"";

    SC_HANDLE scManager, scHandle;
    scManager = OpenSCManager(NULL, NULL, SC_MANAGER_ALL_ACCESS);
    if ( scManager == NULL ) {
        printf("Can not open Service Database\n");
        return -1;
    }

    scHandle = OpenService(scManager, "InterBaseServer", SERVICE_ALL_ACCESS);
    if ( scHandle == NULL )
    {
        scHandle = CreateService(scManager, "InterBaseServer", "InterBase Server", SERVICE_ALL_ACCESS,
            SERVICE_WIN32_OWN_PROCESS|SERVICE_INTERACTIVE_PROCESS, SERVICE_DEMAND_START, SERVICE_ERROR_NORMAL,
            ibserver.c_str(), NULL, NULL, NULL, NULL, NULL);
        if ( scHandle == 0 ) {
            printf("Can not install InterBaseServer from %s", ibserver.c_str());
            return -1;
        }
        printf("InterBaseServer installed!\n");
    }
    else
    {
        if ( ChangeServiceConfig(scHandle, SERVICE_WIN32_OWN_PROCESS|SERVICE_INTERACTIVE_PROCESS,
            SERVICE_DEMAND_START, SERVICE_ERROR_NORMAL, ibserver.c_str(), NULL, NULL, NULL, NULL, NULL,
            "InterBase Server") == FALSE )
        {
            printf("Can not change InterBaseServer from %s", ibserver.c_str());
            return -1;
        }
        printf("InterBaseServer changed!\n");
    }

    scHandle = OpenService(scManager, "InterBaseGuardian", SERVICE_ALL_ACCESS);
    if ( scHandle == NULL )
    {
        scHandle = CreateService(scManager, "InterBaseGuardian", "InterBase Guardian", SERVICE_ALL_ACCESS,
            SERVICE_WIN32_OWN_PROCESS|SERVICE_INTERACTIVE_PROCESS, SERVICE_AUTO_START, SERVICE_ERROR_NORMAL,
            ibguard.c_str(), NULL, NULL, NULL, NULL, NULL);
        if ( scHandle == 0 ) {
            printf("Can not install InterBaseGuardian from %s", ibguard.c_str());
            return -1;
        }
        printf("InterBaseGuardian installed!\n");
    }
    else
    {
        if ( ChangeServiceConfig(scHandle, SERVICE_WIN32_OWN_PROCESS|SERVICE_INTERACTIVE_PROCESS,
            SERVICE_AUTO_START, SERVICE_ERROR_NORMAL, ibguard.c_str(), NULL, NULL, NULL, NULL, NULL,
            "InterBase Guardian") == FALSE )
        {
            printf("Can not change InterBaseGuardian from %s", ibguard.c_str());
            return -1;
        }
        printf("InterBaseGuardian changed!\n");
    }

    ENUM_SERVICE_STATUS srv[1024];
    DWORD a,b,c = 0;
    BOOL B;
    B = EnumServicesStatus( scManager, SERVICE_WIN32, SERVICE_STATE_ALL,
        srv, sizeof(srv), &a, &b, &c );

    if ( B == 0 ) {
        c = GetLastError();

        switch (c) {
        case ERROR_MORE_DATA: printf("ERROR_MORE_DATA"); break;
        case ERROR_INVALID_PARAMETER: printf("ERROR_INVALID_PARAMETER") ; break;
        case ERROR_INVALID_HANDLE:  printf("ERROR_INVALID_HANDLE"); break;
        case ERROR_ACCESS_DENIED:   printf("ERROR_ACCESS_DENIED"); break;
        }
    }
    else {
        for ( DWORD i = 0; i < b; i++ )
        {
            if (AnsiString(srv[i].lpServiceName) == "InterBaseServer" ||
                AnsiString(srv[i].lpServiceName) == "InterBaseGuardian") {
                printf("[%s] [%s] ", srv[i].lpServiceName, srv[i].lpDisplayName );
                switch (srv[i].ServiceStatus.dwCurrentState) {
                case SERVICE_RUNNING: printf("running\n"); break;
                case SERVICE_STOPPED: printf("stoped\n"); break;
                default: printf("unknown\n"); break;
                }
            }
        }
    }

    CloseServiceHandle(scManager);
    return 0;
}
//---------------------------------------------------------------------------
 