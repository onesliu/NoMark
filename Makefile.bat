@echo off
	if not exist .\release md .\release
	if not exist .\release\storetemp md .\release\storetemp
	make -f Store.mak

	if exist .\release\Store.exe (echo ģ��������...
	) else (echo ģ�����ʧ��...)

	if not exist .\release\selltemp md .\release\selltemp
	make -f Sell.mak

	if exist .\release\Sell.exe (echo ģ��������...
	) else (echo ģ�����ʧ��...)
	pause
@echo on