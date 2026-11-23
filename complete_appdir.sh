#!/bin/bash 

# pass the tools to the image
TOOLS="ffmpeg ffplay ffprobe mplayer sox"
for s in `echo "$TOOLS" | xargs` ; do
    echo "Installing media tools: $s"
    cp -v /usr/bin/$s AppDir/usr/bin
done

# copy all the icons
mkdir -p AppDir/usr/share/icons/hicolor
RES=`cd icons && ls | grep ffmpeg-video-audio-converter_| cut -d "_" -f 2 | cut -d "." -f 1`
for r in `echo $RES | xargs` ; do
    target="AppDir/usr/share/icons/hicolor/$r/apps"
    mkdir -p "$target"
    cp -v icons/ffmpeg-video-audio-converter_$r.png "$target/ffmpeg-video-audio-converter.png"
done
