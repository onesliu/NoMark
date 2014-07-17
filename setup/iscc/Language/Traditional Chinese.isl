; Translation made with Translator 1.32 (http://www2.arnes.si/~sopjsimo/translator.html)
; $Translator:NL=%n:TB=%t
;
; *** Inno Setup version 4.0.5+ English messages ***
;
; To download user-contributed translations of this file, go to:
;   http://www.jrsoftware.org/is3rdparty.php
;
; Note: When translating this text, do not add periods (.) to the end of
; messages that didn't have them already, because on those messages Inno
; Setup adds the periods automatically (appending a period would result in
; two periods being displayed).
;
; $jrsoftware: issrc/Files/Default.isl,v 1.32 2003/06/18 19:24:07 jr Exp $

[LangOptions]
LanguageName=繁體中文
LanguageID=$0404
; If the language you are translating to requires special font faces or
; sizes, uncomment any of the following entries and change them accordingly.
DialogFontName=細明體
DialogFontSize=9
DialogFontStandardHeight=12
TitleFontName=細明體
;TitleFontSize=29
;WelcomeFontName=Verdana
;WelcomeFontSize=12
;CopyrightFontName=細明體
;CopyrightFontSize=9

[Messages]

; *** Application titles
SetupAppTitle=安裝
SetupWindowTitle=安裝 - %1
UninstallAppTitle=卸載
UninstallAppFullTitle=%1 卸載

; *** Misc. common
InformationTitle=訊息
ConfirmTitle=確認
ErrorTitle=錯誤

; *** SetupLdr messages
SetupLdrStartupMessage=即將安裝 %1。要繼續？
LdrCannotCreateTemp=無法創建暫存檔。安裝中斷
LdrCannotExecTemp=無法執行臨時目錄中的檔案。安裝中斷

; *** Startup error messages
LastErrorMessage=%1.%n%n錯誤 %2: %3
SetupFileMissing=安裝目錄中檔案 %1 丟失。請設法糾正此問題或者重新索取安裝程式的副本。
SetupFileCorrupt=安裝檔案已經損壞。請重新索取安裝程式的副本。
SetupFileCorruptOrWrongVer=安裝檔案已經損壞，或者版本不相容。請設法糾正此問題或者重新索取安裝程式的副本。
NotOnThisPlatform=本程式不能執行在 %1。
OnlyOnThisPlatform=本程式必須執行在 %1。
WinVersionTooLowError=本程式需要 %1 版本 %2 或更高。
WinVersionTooHighError=本程式不能安裝在 %1 版本 %2 或更高。
AdminPrivilegesRequired=您必須以管理員身份登入才能安裝本程式。
PowerUserPrivilegesRequired=您必須以管理員或已授權使用者身份登入才能安裝本程式。
SetupAppRunningError=安裝程式偵測到 %1 正在執行。%n%n請您關閉其所有進程及副本，然后按一下「確定」按鈕繼續，或按下「取消」離開安裝。
UninstallAppRunningError=卸載程式偵測到 %1 正在執行。%n%n請您關閉其所有進程及副本，然后按一下「確定」按鈕繼續，或按下「取消」離開卸載。

; *** Misc. errors
ErrorCreatingDir=安裝程式無法創建目錄 "%1"
ErrorTooManyFilesInDir=無法在目錄 "%1" 中創建檔案，其中含有檔案太多

; *** Setup common messages
ExitSetupTitle=離開安裝
ExitSetupMessage=安裝尚未完成。如果現在離開，本軟體將不被安裝。%n%n您可以稍后再執行安裝程式來完成安裝過程。%n%n是否離開安裝？
AboutSetupMenuItem=關於安裝(&A)...
AboutSetupTitle=關於安裝
AboutSetupMessage=%1 版本 %2%n%3%n%n%1 首頁︰%n%4
AboutSetupNote=

; *** Buttons
ButtonBack=< 上一步(&B)
ButtonNext=下一步(&N) >
ButtonInstall=安裝(&I)
ButtonOK=確定
ButtonCancel=取消
ButtonYes=是(&Y)
ButtonYesToAll=全部是(&A)
ButtonNo=否(&N)
ButtonNoToAll=全部u_(&O)
ButtonFinish=完成(&F)
ButtonBrowse=瀏覽(&B)...

; *** "Select Language" dialog messages
SelectLanguageTitle=選擇安裝語言
SelectLanguageLabel=選擇您喜歡的語言進行安裝︰

; *** Common wizard text
ClickNext=按一下「下一步”繼續，「取消”離開安裝。
BeveledLabel=

; *** "Welcome" wizard page
WelcomeLabel1=歡迎使用 [name] 安裝精靈
WelcomeLabel2=本程式將安裝 [name/ver] 到您的計算機中。%n%n強烈建議您在繼續安裝之前關閉其它所有正在執行的程式，以避免安裝過程刈莃能產生的相互衝突。

; *** "Password" wizard page
WizardPassword=密碼
PasswordLabel1=本安裝程式受密碼保護。
PasswordLabel3=請輸入密碼，然后按一下「下一步”繼續。密碼是一層保護功能。
PasswordEditLabel=密碼(&P)︰
IncorrectPassword=輸入的密碼無效。請重試。

; *** "License Agreement" wizard page
WizardLicense=使用許可協定
LicenseLabel=在繼續安裝之前，請閱讀下面的重要訊息。
LicenseLabel3=請仔細閱讀下面的使用許可協定。您必須在繼續安裝之前接受本協定。
LicenseAccepted=我接受本協定(&A)
LicenseNotAccepted=我不接受本協定(&D)

; *** "Information" wizard pages
WizardInfoBefore=訊息
InfoBeforeLabel=在繼續安裝之前，請先閱讀下面的重要訊息。
InfoBeforeClickLabel=準備好后，按一下「下一步”。
WizardInfoAfter=訊息
InfoAfterLabel=在安裝結束之前，請先閱讀下面的重要訊息。
InfoAfterClickLabel=在準備好后，按一下「下一步”。

; *** "User Information" wizard page
WizardUserInfo=使用者訊息
UserInfoDesc=請輸入您的信息。
UserInfoName=使用者名稱稱(&U)︰
UserInfoOrg=公司(&O)︰
UserInfoSerial=序號(&S)︰
UserInfoNameRequired=您必須輸入一個名字。

; *** "Select Destination Directory" wizard page
WizardSelectDir=選擇目的資料夾
SelectDirDesc=您準備將 [name] 安裝到哪里？
SelectDirLabel=選擇您準備將 [name] 安裝到的資料夾，然后按一下「下一步”。
DiskSpaceMBLabel=安裝本軟體至少需要 [mb] MB 磁碟空間。
ToUNCPathname=安裝程式無法將程式安裝到一個 UNC 路徑名。如果你確實需要將程式安裝到网絡上，必須先建立一個网絡磁碟機映射。
InvalidPath=您必須輸入一個含有磁碟機代號的完整路徑；例如︰%n%nC:\APP%n%n或一個 UNC 路徑形式:%n%n\\server\share
InvalidDrive=您所選擇的磁碟機或 UNC 資源分享不存在，或是不可存取的。請另外選擇。
DiskSpaceWarningTitle=磁碟可用空間不足
DiskSpaceWarning=安裝程式至少需要 %1 KB 的剩余磁碟空間，但是您選擇的磁碟機只有 %2 KB 可用。%n%n無論如何您都要繼續安裝嗎？
BadDirName32=目錄名不能含有冒號之后的任何一個字元︰%n%n%1
DirExistsTitle=目錄已存在
DirExists=目錄︰%n%n%1%n%n已存在。 您無論如何都要安裝到該目錄嗎？
DirDoesntExistTitle=目錄不存在
DirDoesntExist=目錄︰%n%n%1%n%n不存在。是否創建新目錄？

; *** "Select Components" wizard page
WizardSelectComponents=選擇元件
SelectComponentsDesc=將準備安裝哪些元件？
SelectComponentsLabel2=選擇您準備安裝的元件；清除您不想安裝的元件。準備好后按一下「下一步”繼續。
FullInstallation=完全安裝
; if possible don't translate 'Compact' as 'Minimal' (I mean 'Minimal' in your language)
CompactInstallation=典型安裝
CustomInstallation=自訂安裝
NoUninstallWarningTitle=元件已存在
NoUninstallWarning=安裝程式偵測到下列元件已經存在于您的計算機中︰%n%n%1%n%n清除這些元件會導致其不能被卸載。%n%n您無論如何都要繼續安裝嗎？
ComponentSize1=%1 KB
ComponentSize2=%1 MB
ComponentsDiskSpaceMBLabel=目前選項至少需要 [mb] MB 剩余磁碟空間。

; *** "Select Additional Tasks" wizard page
WizardSelectTasks=選擇附加工作
SelectTasksDesc=您準備執行哪些附加工作？
SelectTasksLabel2=選擇您準備在安裝 [name] 期間執行的附加任務，然后按一下「下一步”。

; *** "Select Start Menu Folder" wizard page
WizardSelectProgramGroup=選擇開始選單資料夾
SelectStartMenuFolderDesc=準備將程式的捷徑放置在哪里？
SelectStartMenuFolderLabel=選擇您需要在開始選單資料夾中創建的程式捷徑，然后按一下「下一步”。
NoIconsCheck=不創建任何圖示(&D)
MustEnterGroupName=您必須輸入一個資料夾名稱。
BadGroupName=資料夾名稱不能含有下列的任何一個字元︰%n%n%1
NoProgramGroupCheck2=不創建開始選單資料夾(&D)

; *** "Ready to Install" wizard page
WizardReady=準備安裝
ReadyLabel1=安裝程式已準備好，即將將 [name] 安裝到您的計算機中。
ReadyLabel2a=按一下「安裝”按鈕開始安裝，或按一下「上一步”返回變更剛才的設定。
ReadyLabel2b=按一下「安裝”按鈕開始安裝。
ReadyMemoUserInfo=使用者信息︰
ReadyMemoDir=目標目錄︰
ReadyMemoType=安裝類型︰
ReadyMemoComponents=選擇元件︰
ReadyMemoGroup=開始選單資料夾︰
ReadyMemoTasks=附加任務︰

; *** "Preparing to Install" wizard page
WizardPreparing=準備安裝
PreparingDesc=安裝程式已準備好安裝 [name] 到您的計算機中。
PreviousInstallNotCompleted=先前的程式安裝或刪除沒有完成。你將需要重新啟動你的計算機來完成程式安裝或刪除。在重新啟動你的計算機之后，再一次執行 [name] 的安裝程式完成安裝。
CannotContinue=安裝不能繼續。 請按一下“取消”取消安裝。

; *** "Installing" wizard page
WizardInstalling=正在安裝
InstallingLabel=正在安裝 [name] 到您的計算機中，請稍等。

; *** "Setup Completed" wizard page
FinishedHeadingLabel=完成 [name] 安裝精靈
FinishedLabelNoIcons=[name] 在你計算機中安裝完畢。
FinishedLabel=[name] 在你計算機中安裝完畢。您可以選擇已安裝好的程式圖示來啟動程式。
ClickFinish=按一下“完成”結束安裝
FinishedRestartLabel=要最后完成 [name] 的安裝，必須重新啟動計算機。是否立即重新啟動？
FinishedRestartMessage=要最后完成 [name] 的安裝，必須重新啟動計算機。%n%n是否立即重新啟動？
ShowReadmeCheck=是，我要查閱自述檔案
YesRadio=是，立即重新啟動(&Y)
NoRadio=不，我將稍后重新啟動(&N)
; used for example as 'Run MyProg.exe'
RunEntryExec=執行 %1
; used for example as 'View Readme.txt'
RunEntryShellExec=查閱 %1

; *** "Setup Needs the Next Disk" stuff
ChangeDiskTitle=需要下一張磁碟
SelectDirectory=選擇目錄
SelectDiskLabel2=請插入磁盤 %1 並按一下“確定”。%n%n除了下面所示，如果安裝檔案也能在其它檔案夾中找到，請輸入其正确路徑或按一下“瀏覽”進行選擇。
PathLabel=路徑(&P)︰
FileNotInDir2=檔案“%1” 不能在“%2” 中找到。請插入正确的磁盤或選擇另外的資料夾。
SelectDirectoryLabel=請指定下一張磁盤的位置。

; *** Installation phase messages
SetupAborted=安裝不能完成。%n%n請設法糾正此問題，然后重新執行安裝程式。
EntryAbortRetryIgnore=按一下“重試”按鈕重試，“忽略”無條件繼續，“中止”取消安裝。

; *** Installation status messages
StatusCreateDirs=正在創建目錄...
StatusExtractFiles=正在展開檔案...
StatusCreateIcons=正在創建程式圖示...
StatusCreateIniEntries=正在創建 INI 條目...
StatusCreateRegistryEntries=正在創建系統登入條目...
StatusRegisterFiles=正在進行檔案登錄...
StatusSavingUninstall=正在儲存卸載信息...
StatusRunProgram=正在結束安裝...
StatusRollback=正在收回改變...

; *** Misc. errors
ErrorInternal2=內部錯誤︰ %1
ErrorFunctionFailedNoCode=%1 失敗
ErrorFunctionFailed=%1 失敗；代碼 %2
ErrorFunctionFailedWithMessage=%1 失敗；代碼 %2.%n%3
ErrorExecutingProgram=不能執行檔案︰%n%1

; *** Registry errors
ErrorRegOpenKey=打開系統登錄主鍵出錯︰%n%1\%2
ErrorRegCreateKey=創建系統登錄主鍵出錯︰%n%1\%2
ErrorRegWriteKey=寫入系統登錄主鍵出錯︰%n%1\%2

; *** INI errors
ErrorIniEntry=創建檔案 “%1” INI 條目時出錯。

; *** File copying errors
FileAbortRetryIgnore=按一下“重試”按鈕重試，“忽略”略過此檔(不建議)，或“中止”取消安裝。
FileAbortRetryIgnore2=按一下“重試”按鈕重試，“忽略”無條件繼續(不建議)，或“中止”取消安裝。
SourceIsCorrupted=來源檔案已損壞
SourceDoesntExist=來源檔案 “%1” 不存在
ExistingFileReadOnly=已存在的檔案被標示為只讀。%n%n按一下“重試”解除其只讀屬性並重試，“忽略”略過此檔，“中止”取消安裝。
ErrorReadingExistingDest=正嘗試讀取已有檔案時出錯︰
FileExists=檔案已經存在。%n%n你是否希望安裝程式覆寫它？
ExistingFileNewer=正要安裝的檔案比現有檔案更舊。建議保留已有檔案。%n%n你是否希望保留它？
ErrorChangingAttr=正嘗試改變已有檔案屬性時出錯︰
ErrorCreatingTemp=正嘗試在目標目錄中創建檔案時出錯︰
ErrorReadingSource=正嘗試讀取來源檔案時出錯︰
ErrorCopying=正嘗試复制檔案時出錯︰
ErrorReplacingExistingFile=正嘗試置換已有檔案時出錯︰
ErrorRestartReplace=重新啟動置換失敗︰
ErrorRenamingTemp=正嘗試給目標目錄中檔案案更名時出錯︰
ErrorRegisterServer=不能登錄 DLL/OCX︰ %1
ErrorRegisterServerMissingExport=DllRegisterServer 輸出口沒有發現
ErrorRegisterTypeLib=不能登錄類庫︰ %1

; *** Post-installation errors
ErrorOpeningReadme=正嘗試打開自述檔案時出錯。
ErrorRestartingComputer=安裝程式不能重新啟動計算機。請手動進行。

; *** Uninstaller messages
UninstallNotFound=文件 “%1” 不存在。不能卸載。
UninstallOpenError=不能開啟檔案“%1”。不能卸載。
UninstallUnsupportedVer=卸載記錄文件 “%1” 的格式不能被本版本卸載程式識別。不能卸載。
UninstallUnknownEntry=卸載記錄文件中遇到不能識別的條目 (%1)
ConfirmUninstall=确認要完全刪除 %1 和它所有的部件嗎？
OnlyAdminCanUninstall=只能由有管理員權限的使用者進行卸載。
UninstallStatusLabel=正在從您的計算機中刪除 %1，請等待。
UninstalledAll=%1 已經從您的計算機中成功刪除。
UninstalledMost=%1 卸載完成。%n%n某些專案不能移除。您可以手動刪除。
UninstalledAndNeedsRestart=要完全卸載 %1， 你必須要重新啟動計算機。%n%n是否立即重新啟動？
UninstallDataCorrupted=“%1”文件受損。無法卸載

; *** Uninstallation phase messages
ConfirmDeleteSharedFileTitle=刪除分享的檔案嗎？
ConfirmDeleteSharedFile2=系統顯示下列分享的檔案可能已不再被任何程式使用。是否移除這些分享的檔案？%n%n如果某個程式仍然用到這些文件而他們卻已被刪除，這個程式可能不能正常執行。如果你不能确定，最好選擇“否”。將這些文件保留在系統中不會產生什么危害。
SharedFileNameLabel=檔案名稱︰
SharedFileLocationLabel=位置︰
WizardUninstalling=卸載狀態
StatusUninstalling=正在卸載 %1...