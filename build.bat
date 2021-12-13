@echo off
goto start
:end
echo Build returned error %ERRORLEVEL%
REM pause
exit
:start
echo Compiling...
as -o tumble.o tumble.asm
echo.
if ERRORLEVEL 1 goto end

echo linking...
ld -o tumble.out tumble.o -Ttext 0x7c00
objcopy -O binary -j .text tumble.out tumble.bin
echo.
if ERRORLEVEL 1 goto end


imagefs c tumble.img 720
imagefs b tumble.img tumble.bin
echo.
if ERRORLEVEL 1 goto end
REM pause