@echo off
	if not exist .\release md .\release
	if not exist .\release\storetemp md .\release\storetemp
	make -f Store.mak

	if exist .\release\Store.exe (echo 模块编译完成...
	) else (echo 模块编译失败...)

	if not exist .\release\selltemp md .\release\selltemp
	make -f Sell.mak

	if exist .\release\Sell.exe (echo 模块编译完成...
	) else (echo 模块编译失败...)
	pause
@echo on