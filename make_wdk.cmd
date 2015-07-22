@ECHO OFF
TITLE Windows Driver Kit 7.1.0

REM set target=i386
set target=amd64

set src=%CD%\lib\glut
set obj=%CD%

set DDK=C:\WinDDK\7600.16385.1
set MSVC=%DDK%\bin\x86\%target%

set files=%src%\glut_wglext.c^
 %src%\glut_8x13.c^
 %src%\glut_9x15.c^
 %src%\glut_bitmap.c^
 %src%\glut_bwidth.c^
 %src%\glut_cindex.c^
 %src%\glut_cmap.c^
 %src%\glut_cursor.c^
 %src%\glut_dials.c^
 %src%\glut_dstr.c^
 %src%\glut_event.c^
 %src%\glut_ext.c^
 %src%\glut_fbc.c^
 %src%\glut_fullscrn.c^
 %src%\glut_gamemode.c^
 %src%\glut_get.c^
 %src%\glut_hel10.c^
 %src%\glut_hel12.c^
 %src%\glut_hel18.c^
 %src%\glut_init.c^
 %src%\glut_input.c^
 %src%\glut_joy.c^
 %src%\glut_key.c^
 %src%\glut_keyctrl.c^
 %src%\glut_keyup.c^
 %src%\glut_mesa.c^
 %src%\glut_modifier.c^
 %src%\glut_mroman.c^
 %src%\glut_overlay.c^
 %src%\glut_roman.c^
 %src%\glut_shapes.c^
 %src%\glut_space.c^
 %src%\glut_stroke.c^
 %src%\glut_swap.c^
 %src%\glut_swidth.c^
 %src%\glut_tablet.c^
 %src%\glut_teapot.c^
 %src%\glut_tr10.c^
 %src%\glut_tr24.c^
 %src%\glut_util.c^
 %src%\glut_vidresize.c^
 %src%\glut_warp.c^
 %src%\glut_win.c^
 %src%\glut_winmisc.c^
 %src%\win32_glx.c^
 %src%\win32_menu.c^
 %src%\win32_util.c^
 %src%\win32_winproc.c^
 %src%\win32_x11.c

set includes=/I"%DDK%\inc\crt" /I"%DDK%\inc\api" /I"%src%\..\..\include"
set libs=/LIBPATH:"%DDK%\lib\crt\%target%" /LIBPATH:"%DDK%\lib\wnet\%target%"

set GLUT_DEFINES=/D "_WINDLL" /D "WIN64" /D "NDEBUG" /D "_WINDOWS" /D "_USRDLL" /D "GLUT32_EXPORTS" /U "GLUT_USE_SGI_OPENGL"
set C_FLAGS=/W3 /GL /O1 /Os /Oi /GS- /TC %GLUT_DEFINES% /MD
set output=/OUT:glut32.dll /DLL
set LINK_FLAGS=%libs% kernel32.lib user32.lib gdi32.lib winmm.lib opengl32.lib glu32.lib /NOENTRY

%MSVC%\cl.exe %includes% %C_FLAGS% %files% /link %output% %LINK_FLAGS%

pause
