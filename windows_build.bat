@echo off
set DEST_DIR=.\windows_release

:: Save version string to variable %VERSION%
for /f "delims=" %%v in ('sh get-version.sh') do @set VERSION=%%v

pushd src
lrelease ffmpeg-video-audio-converter.pro
qmake
mingw32-make release
popd

:: Create output directory if it does not exist.
if not exist "%DEST_DIR%" mkdir "%DEST_DIR%"
if not exist "%DEST_DIR%\tools" mkdir "%DEST_DIR%\tools"
if not exist "%DEST_DIR%\translations" mkdir "%DEST_DIR%\translations"

:: Copy the final executable to the output directory.
copy ".\release\ffmpeg-video-audio-converter.exe" "%DEST_DIR%"

:: Copy data files to the output directory.
copy ".\presets.xml" "%DEST_DIR%"
sed "s/\(<CheckUpdateOnStartup [^>]*>\)[\t ]*false/\1true/" ".\constants.xml" > "%DEST_DIR%/constants.xml"
copy ".\translations\*.qm" "%DEST_DIR%\translations"
copy "COPYING.txt" "%DEST_DIR%\license.txt"
copy "CHANGELOG.txt" "%DEST_DIR%\changelog.txt"
sed "s/@ffmpeg-video-audio-converter_VERSION@/%VERSION%/" "ffmpeg-video-audio-converter.nsi.in" > "%DEST_DIR%\ffmpeg-video-audio-converter.nsi"
unix2dos "%DEST_DIR%\license.txt"
unix2dos "%DEST_DIR%\changelog.txt"

@echo Files have been copied to %DEST_DIR%
