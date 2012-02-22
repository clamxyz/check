TARGETOS=WINNT
!ifdef NDEBUG
NODEBUG=1
!endif

!include <win32.mak>

!ifndef NDEBUG
ConfigurationName=Debug
CFLAGS=$(cdebug) $(cflags) /WX
LFLAGS=$(dlllflags) 
TESTLFLAGS=$(conlflags) 
SUFFIX=-d
!else
ConfigurationName=Release
CFLAGS=$(cdebug) $(cflags)
LFLAGS=$(ldebug) $(dlllflags) 
TESTLFLAGS=$(ldebug) $(conlflags) 
SUFFIX=
!endif

CFLAGS=$(CFLAGS) /Iwin32-port /wd4996 /wd4090 /wd4100 /wd4127 /FI../win32-port/config.h

OBJECTS = 	$(ConfigurationName)\check_error.obj	\
			$(ConfigurationName)\check.obj			\
			$(ConfigurationName)\check_list.obj		\
			$(ConfigurationName)\check_log.obj		\
			$(ConfigurationName)\check_msg.obj		\
			$(ConfigurationName)\check_pack.obj		\
			$(ConfigurationName)\check_print.obj	\
			$(ConfigurationName)\check_run.obj		\
			$(ConfigurationName)\check_str.obj		\
			$(ConfigurationName)\gettimeofday.obj	\
			$(ConfigurationName)\localtime_r.obj

all : $(ConfigurationName)\check$(SUFFIX).dll

clean :
	del /q $(ConfigurationName)\*

{src}.c{$(ConfigurationName)}.obj :
	$(cc) $(CFLAGS) $(cvarsdll) $< /Fo$@ /Fd$(ConfigurationName)\check$(SUFFIX).pdb
{win32-port}.c{$(ConfigurationName)}.obj :
	$(cc) $(CFLAGS) $(cvarsdll) $< /Fo$@ /Fd$(ConfigurationName)\check$(SUFFIX).pdb
{lib}.c{$(ConfigurationName)}.obj :
	$(cc) $(CFLAGS) $(cvarsdll) $< /Fo$@ /Fd$(ConfigurationName)\check$(SUFFIX).pdb

$(ConfigurationName)\check$(SUFFIX).dll : $(OBJECTS)
	$(link) $(LFLAGS) $(conlibsdll) -out:$@ $** /implib:$(ConfigurationName)\check$(SUFFIX).lib /def:check$(SUFFIX).def /PDB:$(ConfigurationName)\check$(SUFFIX).pdb

