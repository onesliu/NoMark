; 这是由《My Inno Setup Extensions》程序建立的脚本向导程序.
; 有关怎样建立此脚本的方法请参考帮助以及D:\Inno Setup 2\BDEInst\中的readme文件
; 编写本脚本所用到的知识（如为什么要复制那些文件、目的是什么，为什么要对注册表文件进行那样的修改等）请参考有关文献。
; 如有疑问请来信共同探讨。lleey@163.com
; 愿此脚本对所有志同道合者的学习、开发有所帮助，共同推动IB应用！
[Setup]
AppName=InterBase
AppVerName=v7.1.0.131
AppPublisher=Borland
DefaultDirName={pf}\InterBase
DefaultGroupName=InterBase
OutputBaseFilename=InterBase
Uninstallable=yes
SolidCompression=yes
; 如果要在NT 3.51以上版本上运行安装程序则变下面的注释行变为运行行即可
; MinVersion=4,3.51
[Languages]
Name: "cn"; MessagesFile: "compiler:Language\Simple Chinese.isl"
[Dirs]
;设置安装目录。其中数据库系统包括服务器和客户机均放在C:\windows\system\interbase7文件夹下、而数据库则放在应用程序存放
;目录的\base子文件夹下。
Name: {pf}\InterBase
Name: {pf}\InterBase\bin
[Files]
;==========================================================
;复制数据库系统。对于任何用到IB7的应用此部分都是一样的。 ||
;==========================================================
;复制IB7的系统数据库admin.ib，仅当该文件不存在时复制、卸载时不删除、只适用于IB7svr组件。以下不再赘述。
;服务器文件
Source: D:\数据库\IB71_Windows\win32\Server\admin.ib; DestDir: {pf}\InterBase; Flags: onlyifdoesntexist uninsneveruninstall;
Source: D:\数据库\IB71_Windows\win32\Server\admin.ibk; DestDir: {pf}\InterBase; Flags: onlyifdoesntexist uninsneveruninstall;
Source: D:\数据库\IB71_Windows\win32\Server\ibconfig; DestDir: {pf}\InterBase; Flags: Promptifolder;
Source: D:\数据库\IB71_Windows\win32\Server\interbase.msg; DestDir: {pf}\InterBase; Flags: Promptifolder sharedfile;

Source: D:\数据库\IB71_Windows\win32\Server\bin\ibguard.exe; DestDir: {pf}\InterBase\bin; Flags: sharedfile
Source: D:\数据库\IB71_Windows\win32\Server\bin\ibserver.exe; DestDir: {pf}\InterBase\bin; Flags: sharedfile
Source: D:\数据库\IB71_Windows\win32\Server\bin\IBReplSrvcInstall.exe; DestDir: {pf}\InterBase\bin;
Source: D:\数据库\IB71_Windows\win32\Server\bin\IB_Util.dll; DestDir: {pf}\InterBase\bin;
Source: D:\数据库\IB71_Windows\win32\ibinstall.dll; DestDir: {pf}\InterBase\bin;
Source: D:\数据库\IB71_Windows\win32\Server\bin\instsvc.exe; DestDir: {pf}\InterBase\bin; MinVersion: 0,4.0;
;服务注册程序
Source: D:\Other\NoMarkManager\setup\InterbaseService\InterbaseService.exe; DestDir: {pf}\InterBase\bin;
Source: D:\Other\NoMarkManager\setup\InterbaseService\run.bat; DestDir: {pf}\InterBase\bin;

;系统共享库
Source: D:\数据库\IB71_Windows\win32\Server\libborland_lm.dll; DestDir: {sys}; Flags: sharedfile allowunsafefiles;
Source: D:\数据库\IB71_Windows\win32\gds32.dll; DestDir: {sys}; Flags: sharedfile allowunsafefiles;
Source: D:\数据库\IB71_Windows\win32\Server\bin\ibmgr.cpl; DestDir: {sys}; Flags: sharedfile allowunsafefiles;
Source: C:\Windows\System32\msvcrt.dll; DestDir: {sys}; Flags: onlyifdoesntexist uninsneveruninstall sharedfile allowunsafefiles;
;客户端
Source: D:\数据库\IB71_Windows\win32\Client\bin\iblicense.dll; DestDir: {pf}\InterBase\bin;
Source: D:\数据库\IB71_Windows\win32\Client\bin\iblicense.exe; DestDir: {pf}\InterBase\bin;
Source: D:\数据库\IB71_Windows\win32\Client\ib_license.dat; DestDir: {pf}\InterBase;
Source: D:\数据库\IB71_Windows\win32\Client\bin\instreg.exe; DestDir: {pf}\InterBase\bin;
Source: D:\数据库\IB71_Windows\win32\Client\bin\IBConsole.exe; DestDir: {pf}\InterBase\bin;
;复制自定义函数
Source: "D:\数据库\IB71_Windows\win32\Server\udf\*.*"; DestDir: {pf}\InterBase\udf;
Source: D:\数据库\IB71_Windows\win32\Server\intl\gdsintl.dll; DestDir: {pf}\InterBase\intl;
;复制许可证
Source: D:\数据库\IB71_Windows\borland.lic; DestDir: {pf}\InterBase; Flags: Promptifolder;

[Registry]
;====================================================
;此部分是对注册表的修改，具体内容可参考相关文档说明||
;====================================================
;此行是设置IB7的版本号，务必是真实的版本号，否则会造成其他安装程序的错误判断
Root: HKLM; Subkey: Software\Borland\InterBase\CurrentVersion; ValueType: string; ValueName: Version; ValueData: {reg:HKLM\Software\Borland\InterBase\CurrentVersion, Version}; Flags: uninsdeletevalue;
Root: HKLM; Subkey: Software\Borland\InterBase\CurrentVersion; ValueType: string; ValueName: ServerDirectory; ValueData: {pf}\InterBase\bin; Flags: uninsdeletevalue;
Root: HKLM; Subkey: Software\Borland\InterBase\CurrentVersion; Flags: uninsdeletekeyifempty;
Root: HKLM; Subkey: Software\Borland\InterBase; Flags: uninsdeletekeyifempty;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 为向下兼容;
Root: HKLM; Subkey: Software\Borland\InterBase; ValueType: DWord; ValueName: UseCount; ValueData: 0;
Root: HKLM; Subkey: Software\Borland\InterBase\CurrentVersion; ValueType: DWord; ValueName: UseCount; ValueData: 0;
Root: HKLM; Subkey: Software\Borland\InterBase\CurrentVersion; ValueType: string; ValueName: DefaultMode; ValueData: -r;
Root: HKLM; Subkey: Software\Borland\InterBase\CurrentVersion; ValueType: string; ValueName: GuardianOptions; ValueData: 1;
Root: HKLM; Subkey: Software\Borland\InterBase\CurrentVersion; ValueType: string; ValueName: ServerDirectory; ValueData: {pf}\InterBase\bin\;

[Icons]
Name: "{group}\卸载"; Filename: "{app}\unins000.exe"
Name: "{group}\InterBase 管理"; Filename: "{sys}\ibmgr.cpl"
Name: "{group}\InterBase 控制台"; Filename: "{pf}\InterBase\bin\IBConsole.exe";

[Run]
Filename: {pf}\InterBase\bin\instreg.exe; Parameters: "install ""{pf}\InterBase"""; Flags: nowait runminimized
Filename: {pf}\InterBase\bin\InterbaseService.exe; Flags: runminimized; MinVersion: 0,4.0;
Filename: {pf}\InterBase\bin\run.bat; Flags: runhidden postinstall shellexec skipifsilent; Description: "设置数据库服务"; MinVersion: 0,4.0;

