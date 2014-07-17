# ---------------------------------------------------------------------------
!if !$d(BCB)
BCB = $(MAKEDIR)\..
!endif

# ---------------------------------------------------------------------------
# IDE SECTION
# ---------------------------------------------------------------------------
# The following section of the project makefile is managed by the BCB IDE.
# It is recommended to use the IDE to change any of the values in this
# section.
# ---------------------------------------------------------------------------

VERSION = BCB.06.00
# ---------------------------------------------------------------------------
PROJECT = .\release\Sell.exe
OBJFILES = release\selltemp\Sell.obj release\selltemp\ChangeUnit.obj \
    release\selltemp\DbUnit.obj release\selltemp\OrderUnit.obj \
    release\selltemp\MessageBoxes.obj release\selltemp\CommonUnit.obj \
    release\selltemp\GPrinterUnit.obj release\selltemp\base_64.obj \
    release\selltemp\UserLoginUnit.obj release\selltemp\SetChangeUnit.obj \
    release\selltemp\DetailUnit.obj release\selltemp\CashSetUnit.obj \
    release\selltemp\ShowChangeUnit.obj release\selltemp\SelectUnit.obj
RESFILES = Sell.res
MAINSOURCE = Sell.cpp
RESDEPEN = $(RESFILES) ChangeUnit.dfm DbUnit.dfm OrderUnit.dfm UserLoginUnit.dfm \
    SetChangeUnit.dfm DetailUnit.dfm CashSetUnit.dfm ShowChangeUnit.dfm SelectUnit.dfm
LIBFILES = 
IDLFILES = 
IDLGENFILES = 
LIBRARIES = dbexpress.lib dsnap.lib cds.lib ibxpress.lib dbrtl.lib rtl.lib vcl.lib
PACKAGES = vcl.bpi rtl.bpi dbrtl.bpi adortl.bpi vcldb.bpi vclx.bpi bdertl.bpi \
    vcldbx.bpi ibxpress.bpi dsnap.bpi cds.bpi bdecds.bpi qrpt.bpi \
    visualclx.bpi visualdbclx.bpi dsnapcrba.bpi dsnapcon.bpi bcbsmp.bpi \
    vclie.bpi xmlrtl.bpi inet.bpi inetdbbde.bpi inetdbxpress.bpi inetdb.bpi \
    nmfast.bpi webdsnap.bpi bcbie.bpi websnap.bpi soaprtl.bpi dclocx.bpi \
    dbexpress.bpi dbxcds.bpi indy.bpi bcb2kaxserver.bpi Tee7C6.bpi \
    TeeGL7C6.bpi TeeUI7C6.bpi TeeDB7C6.bpi TeeLanguage7C6.bpi TeePro7C6.bpi \
    TeeQR7C6.bpi BSFCB6.bpi
SPARELIBS = vcl.lib rtl.lib dbrtl.lib ibxpress.lib cds.lib dsnap.lib dbexpress.lib
DEFFILE = 
OTHERFILES = 
# ---------------------------------------------------------------------------
DEBUGLIBPATH = $(BCB)\lib\debug
RELEASELIBPATH = $(BCB)\lib\release
USERDEFINES = 
SYSDEFINES = NO_STRICT
INCLUDEPATH = utility;"C:\Program Files\Borland\CBuilder6\Projects";$(BCB)\include;$(BCB)\include\vcl
LIBPATH = utility;"C:\Program Files\Borland\CBuilder6\Projects";$(BCB)\lib\obj;$(BCB)\lib
WARNINGS= -w-par
PATHCPP = .;utility;utility;utility;utility
PATHASM = .;
PATHPAS = .;
PATHRC = .;
PATHOBJ = .;$(LIBPATH)
# ---------------------------------------------------------------------------
CFLAG1 = -O2 -H=$(BCB)\lib\vcl60.csm -Hc -Vx -Ve -X- -a8 -b- -k- -vi -c -tW -tWM
IDLCFLAGS = -Iutility -I"C:\Program Files\Borland\CBuilder6\Projects" -I$(BCB)\include \
    -I$(BCB)\include\vcl -src_suffix cpp -boa
PFLAGS = -N2.\release\selltemp -N0.\release\selltemp -$Y- -$L- -$D- -$A8 -v -JPHNE -M
RFLAGS = 
AFLAGS = /mx /w2 /zn
LFLAGS = -I.\release\selltemp -D"" -aa -Tpe -x -Gn
# ---------------------------------------------------------------------------
ALLOBJ = c0w32.obj sysinit.obj $(OBJFILES)
ALLRES = $(RESFILES)
ALLLIB = $(LIBFILES) $(LIBRARIES) import32.lib cp32mt.lib
# ---------------------------------------------------------------------------
!ifdef IDEOPTIONS

[Version Info]
IncludeVerInfo=0
AutoIncBuild=0
MajorVer=1
MinorVer=0
Release=0
Build=0
Debug=0
PreRelease=0
Special=0
Private=0
DLL=0

[Version Info Keys]
CompanyName=
FileDescription=
FileVersion=1.0.0.0
InternalName=
LegalCopyright=
LegalTrademarks=
OriginalFilename=
ProductName=
ProductVersion=1.0.0.0
Comments=

[Debugging]
DebugSourceDirs=$(BCB)\source\vcl

!endif





# ---------------------------------------------------------------------------
# MAKE SECTION
# ---------------------------------------------------------------------------
# This section of the project file is not used by the BCB IDE.  It is for
# the benefit of building from the command-line using the MAKE utility.
# ---------------------------------------------------------------------------

.autodepend
# ---------------------------------------------------------------------------
!if "$(USERDEFINES)" != ""
AUSERDEFINES = -d$(USERDEFINES:;= -d)
!else
AUSERDEFINES =
!endif

!if !$d(BCC32)
BCC32 = bcc32
!endif

!if !$d(CPP32)
CPP32 = cpp32
!endif

!if !$d(DCC32)
DCC32 = dcc32
!endif

!if !$d(TASM32)
TASM32 = tasm32
!endif

!if !$d(LINKER)
LINKER = ilink32
!endif

!if !$d(BRCC32)
BRCC32 = brcc32
!endif


# ---------------------------------------------------------------------------
!if $d(PATHCPP)
.PATH.CPP = $(PATHCPP)
.PATH.C   = $(PATHCPP)
!endif

!if $d(PATHPAS)
.PATH.PAS = $(PATHPAS)
!endif

!if $d(PATHASM)
.PATH.ASM = $(PATHASM)
!endif

!if $d(PATHRC)
.PATH.RC  = $(PATHRC)
!endif

!if $d(PATHOBJ)
.PATH.OBJ  = $(PATHOBJ)
!endif
# ---------------------------------------------------------------------------
$(PROJECT): $(OTHERFILES) $(IDLGENFILES) $(OBJFILES) $(RESDEPEN) $(DEFFILE)
    $(BCB)\BIN\$(LINKER) @&&!
    $(LFLAGS) -L$(LIBPATH) +
    $(ALLOBJ), +
    $(PROJECT),, +
    $(ALLLIB), +
    $(DEFFILE), +
    $(ALLRES)
!
# ---------------------------------------------------------------------------
.pas.hpp:
    $(BCB)\BIN\$(DCC32) $(PFLAGS) -U$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -O$(INCLUDEPATH) --BCB {$< }

.pas.obj:
    $(BCB)\BIN\$(DCC32) $(PFLAGS) -U$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -O$(INCLUDEPATH) --BCB {$< }

.cpp.obj:
    $(BCB)\BIN\$(BCC32) $(CFLAG1) $(WARNINGS) -I$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -n$(@D) {$< }

.c.obj:
    $(BCB)\BIN\$(BCC32) $(CFLAG1) $(WARNINGS) -I$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -n$(@D) {$< }

.c.i:
    $(BCB)\BIN\$(CPP32) $(CFLAG1) $(WARNINGS) -I$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -n. {$< }

.cpp.i:
    $(BCB)\BIN\$(CPP32) $(CFLAG1) $(WARNINGS) -I$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -n. {$< }

.asm.obj:
    $(BCB)\BIN\$(TASM32) $(AFLAGS) -i$(INCLUDEPATH:;= -i) $(AUSERDEFINES) -d$(SYSDEFINES:;= -d) $<, $@

.rc.res:
    $(BCB)\BIN\$(BRCC32) $(RFLAGS) -I$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -fo$@ $<



# ---------------------------------------------------------------------------




