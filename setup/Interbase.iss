; �����ɡ�My Inno Setup Extensions���������Ľű��򵼳���.
; �й����������˽ű��ķ�����ο������Լ�D:\Inno Setup 2\BDEInst\�е�readme�ļ�
; ��д���ű����õ���֪ʶ����ΪʲôҪ������Щ�ļ���Ŀ����ʲô��ΪʲôҪ��ע����ļ������������޸ĵȣ���ο��й����ס�
; �������������Ź�ͬ̽�֡�lleey@163.com
; Ը�˽ű�������־ͬ�����ߵ�ѧϰ������������������ͬ�ƶ�IBӦ�ã�
[Setup]
AppName=InterBase
AppVerName=v7.1.0.131
AppPublisher=Borland
DefaultDirName={pf}\InterBase
DefaultGroupName=InterBase
OutputBaseFilename=InterBase
Uninstallable=yes
SolidCompression=yes
; ���Ҫ��NT 3.51���ϰ汾�����а�װ������������ע���б�Ϊ�����м���
; MinVersion=4,3.51
[Languages]
Name: "cn"; MessagesFile: "compiler:Language\Simple Chinese.isl"
[Dirs]
;���ð�װĿ¼���������ݿ�ϵͳ�����������Ϳͻ���������C:\windows\system\interbase7�ļ����¡������ݿ������Ӧ�ó�����
;Ŀ¼��\base���ļ����¡�
Name: {pf}\InterBase
Name: {pf}\InterBase\bin
[Files]
;==========================================================
;�������ݿ�ϵͳ�������κ��õ�IB7��Ӧ�ô˲��ֶ���һ���ġ� ||
;==========================================================
;����IB7��ϵͳ���ݿ�admin.ib���������ļ�������ʱ���ơ�ж��ʱ��ɾ����ֻ������IB7svr��������²���׸����
;�������ļ�
Source: D:\���ݿ�\IB71_Windows\win32\Server\admin.ib; DestDir: {pf}\InterBase; Flags: onlyifdoesntexist uninsneveruninstall;
Source: D:\���ݿ�\IB71_Windows\win32\Server\admin.ibk; DestDir: {pf}\InterBase; Flags: onlyifdoesntexist uninsneveruninstall;
Source: D:\���ݿ�\IB71_Windows\win32\Server\ibconfig; DestDir: {pf}\InterBase; Flags: Promptifolder;
Source: D:\���ݿ�\IB71_Windows\win32\Server\interbase.msg; DestDir: {pf}\InterBase; Flags: Promptifolder sharedfile;

Source: D:\���ݿ�\IB71_Windows\win32\Server\bin\ibguard.exe; DestDir: {pf}\InterBase\bin; Flags: sharedfile
Source: D:\���ݿ�\IB71_Windows\win32\Server\bin\ibserver.exe; DestDir: {pf}\InterBase\bin; Flags: sharedfile
Source: D:\���ݿ�\IB71_Windows\win32\Server\bin\IBReplSrvcInstall.exe; DestDir: {pf}\InterBase\bin;
Source: D:\���ݿ�\IB71_Windows\win32\Server\bin\IB_Util.dll; DestDir: {pf}\InterBase\bin;
Source: D:\���ݿ�\IB71_Windows\win32\ibinstall.dll; DestDir: {pf}\InterBase\bin;
Source: D:\���ݿ�\IB71_Windows\win32\Server\bin\instsvc.exe; DestDir: {pf}\InterBase\bin; MinVersion: 0,4.0;
;����ע�����
Source: D:\Other\NoMarkManager\setup\InterbaseService\InterbaseService.exe; DestDir: {pf}\InterBase\bin;
Source: D:\Other\NoMarkManager\setup\InterbaseService\run.bat; DestDir: {pf}\InterBase\bin;

;ϵͳ�����
Source: D:\���ݿ�\IB71_Windows\win32\Server\libborland_lm.dll; DestDir: {sys}; Flags: sharedfile allowunsafefiles;
Source: D:\���ݿ�\IB71_Windows\win32\gds32.dll; DestDir: {sys}; Flags: sharedfile allowunsafefiles;
Source: D:\���ݿ�\IB71_Windows\win32\Server\bin\ibmgr.cpl; DestDir: {sys}; Flags: sharedfile allowunsafefiles;
Source: C:\Windows\System32\msvcrt.dll; DestDir: {sys}; Flags: onlyifdoesntexist uninsneveruninstall sharedfile allowunsafefiles;
;�ͻ���
Source: D:\���ݿ�\IB71_Windows\win32\Client\bin\iblicense.dll; DestDir: {pf}\InterBase\bin;
Source: D:\���ݿ�\IB71_Windows\win32\Client\bin\iblicense.exe; DestDir: {pf}\InterBase\bin;
Source: D:\���ݿ�\IB71_Windows\win32\Client\ib_license.dat; DestDir: {pf}\InterBase;
Source: D:\���ݿ�\IB71_Windows\win32\Client\bin\instreg.exe; DestDir: {pf}\InterBase\bin;
Source: D:\���ݿ�\IB71_Windows\win32\Client\bin\IBConsole.exe; DestDir: {pf}\InterBase\bin;
;�����Զ��庯��
Source: "D:\���ݿ�\IB71_Windows\win32\Server\udf\*.*"; DestDir: {pf}\InterBase\udf;
Source: D:\���ݿ�\IB71_Windows\win32\Server\intl\gdsintl.dll; DestDir: {pf}\InterBase\intl;
;�������֤
Source: D:\���ݿ�\IB71_Windows\borland.lic; DestDir: {pf}\InterBase; Flags: Promptifolder;

[Registry]
;====================================================
;�˲����Ƕ�ע�����޸ģ��������ݿɲο�����ĵ�˵��||
;====================================================
;����������IB7�İ汾�ţ��������ʵ�İ汾�ţ���������������װ����Ĵ����ж�
Root: HKLM; Subkey: Software\Borland\InterBase\CurrentVersion; ValueType: string; ValueName: Version; ValueData: {reg:HKLM\Software\Borland\InterBase\CurrentVersion, Version}; Flags: uninsdeletevalue;
Root: HKLM; Subkey: Software\Borland\InterBase\CurrentVersion; ValueType: string; ValueName: ServerDirectory; ValueData: {pf}\InterBase\bin; Flags: uninsdeletevalue;
Root: HKLM; Subkey: Software\Borland\InterBase\CurrentVersion; Flags: uninsdeletekeyifempty;
Root: HKLM; Subkey: Software\Borland\InterBase; Flags: uninsdeletekeyifempty;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Ϊ���¼���;
Root: HKLM; Subkey: Software\Borland\InterBase; ValueType: DWord; ValueName: UseCount; ValueData: 0;
Root: HKLM; Subkey: Software\Borland\InterBase\CurrentVersion; ValueType: DWord; ValueName: UseCount; ValueData: 0;
Root: HKLM; Subkey: Software\Borland\InterBase\CurrentVersion; ValueType: string; ValueName: DefaultMode; ValueData: -r;
Root: HKLM; Subkey: Software\Borland\InterBase\CurrentVersion; ValueType: string; ValueName: GuardianOptions; ValueData: 1;
Root: HKLM; Subkey: Software\Borland\InterBase\CurrentVersion; ValueType: string; ValueName: ServerDirectory; ValueData: {pf}\InterBase\bin\;

[Icons]
Name: "{group}\ж��"; Filename: "{app}\unins000.exe"
Name: "{group}\InterBase ����"; Filename: "{sys}\ibmgr.cpl"
Name: "{group}\InterBase ����̨"; Filename: "{pf}\InterBase\bin\IBConsole.exe";

[Run]
Filename: {pf}\InterBase\bin\instreg.exe; Parameters: "install ""{pf}\InterBase"""; Flags: nowait runminimized
Filename: {pf}\InterBase\bin\InterbaseService.exe; Flags: runminimized; MinVersion: 0,4.0;
Filename: {pf}\InterBase\bin\run.bat; Flags: runhidden postinstall shellexec skipifsilent; Description: "�������ݿ����"; MinVersion: 0,4.0;

