#-------------------------------------------------
#
# Project created by Maikel Llamaret Heredia 2019-08-08T12:27:54
#
#-------------------------------------------------

QT       += core gui network opengl multimedia qml widgets quick quickwidgets multimediawidgets
DEFINES += QT_DISABLE_DEPRECATED_UP_TO=0x050F00
#DEFINES += QT_DEPRECATED_WARNINGS

QMAKE_CFLAGS_RELEASE += -flto
QMAKE_CXXFLAGS_RELEASE += -flto
QMAKE_LFLAGS_RELEASE += -flto
CONFIG += ltcg

TARGET = ffmpeg-video-audio-converter
TEMPLATE = app

SOURCES += main.cpp \
    ui/helpffmpeg-video-audio-converterdialog.cpp \
    ui/progressbar.cpp \
    ui/mainwindow.cpp \
    ui/convertlist.cpp \
    ui/conversionparameterdialog.cpp \
    ui/addtaskwizard.cpp \
    ui/aboutffmpegdialog.cpp \
    ui/optionsdialog.cpp \
    ui/aboutdialog.cpp \
    ui/poweroffdialog.cpp \
    ui/rangeselector.cpp \
    ui/timerangeedit.cpp \
    converter/presets.cpp \
    converter/mediaprobe.cpp \
    converter/mediaconverter.cpp \
    converter/ffmpeginterface.cpp \
    converter/converterinterface.cpp \
    converter/conversionparameters.cpp \
    services/paths.cpp \
    services/extensions.cpp \
    services/filepathoperations.cpp \
    services/notification.cpp \
    services/notificationservice.cpp \
    services/notificationservice-qt.cpp \
    services/notificationservice-notifysend.cpp \
    services/powermanagement-dummy.cpp \
    converter/audiofilter.cpp \
    converter/exepath.cpp \
    services/versioncompare.cpp \
    services/updatechecker.cpp \
    services/httpdownloader.cpp \
    services/updateinfoparser.cpp \
    services/constants.cpp \
    services/xmllookuptable.cpp \
    ui/updatedialog.cpp \
    services/settingtimer.cpp \
    services/abstractpreviewer.cpp \
    ui/previewdialog.cpp \
    ui/interactivecuttingdialog.cpp \
    ui/mediaplayerwidget.cpp \
    ui/rangewidgetbinder.cpp

HEADERS  += \
    ui/helpffmpeg-video-audio-converterdialog.h \
    ui/progressbar.h \
    ui/mainwindow.h \
    ui/convertlist.h \
    ui/conversionparameterdialog.h \
    ui/addtaskwizard.h \
    ui/aboutffmpegdialog.h \
    ui/optionsdialog.h \
    ui/aboutdialog.h \
    ui/poweroffdialog.h \
    ui/rangeselector.h \
    ui/timerangeedit.h \
    converter/presets.h \
    converter/mediaprobe.h \
    converter/mediaconverter.h \
    converter/ffmpeginterface.h \
    converter/converterinterface.h \
    converter/conversionparameters.h \
    services/paths.h \
    services/extensions.h \
    services/filepathoperations.h \
    version.h \
    services/notification.h \
    services/notificationservice.h \
    services/notificationservice-qt.h \
    services/notificationservice-notifysend.h \
    services/powermanagement.h \
    converter/audiofilter.h \
    converter/exepath.h \
    extra-translations.h \
    services/versioncompare.h \
    services/updatechecker.h \
    services/httpdownloader.h \
    services/updateinfoparser.h \
    services/constants.h \
    services/xmllookuptable.h \
    ui/updatedialog.h \
    services/settingtimer.h \
    services/abstractpreviewer.h \
    ui/previewdialog.h \
    ui/interactivecuttingdialog.h \
    ui/mediaplayerwidget.h \
    ui/rangewidgetbinder.h

FORMS    += \
    ui/conversionparameterdialog.ui \
    ui/addtaskwizard.ui \
    ui/helpffmpeg-video-audio-converterdialog.ui \
    ui/mainwindow.ui \
    ui/aboutffmpegdialog.ui \
    ui/optionsdialog.ui \
    ui/aboutdialog.ui \
    ui/poweroffdialog.ui \
    ui/updatedialog.ui \
    ui/previewdialog.ui \
    ui/interactivecuttingdialog.ui \
    ui/mediaplayerwidget.ui

RESOURCES += \
    images.qrc \
    qml.qrc \
    translator.qrc

TRANSLATIONS += \
    translations/ffmpeg-video-audio-converter_es.ts \
    translations/ffmpeg-video-audio-converter_ar.ts \
    translations/ffmpeg-video-audio-converter_cs_CZ.ts \
    translations/ffmpeg-video-audio-converter_hu.ts \
    translations/ffmpeg-video-audio-converter_fr.ts \
    translations/ffmpeg-video-audio-converter_gl.ts \
    translations/ffmpeg-video-audio-converter_de.ts \
    translations/ffmpeg-video-audio-converter_id.ts \
    translations/ffmpeg-video-audio-converter_it.ts \
    translations/ffmpeg-video-audio-converter_pt.ts \
    translations/ffmpeg-video-audio-converter_ja.ts \
    translations/ffmpeg-video-audio-converter_ru.ts \
    translations/ffmpeg-video-audio-converter_ru_RU.ts \
    translations/ffmpeg-video-audio-converter_ro.ts \
    translations/ffmpeg-video-audio-converter_pl.ts \
    translations/ffmpeg-video-audio-converter_tr.ts \
    translations/ffmpeg-video-audio-converter_sv.ts \
    translations/ffmpeg-video-audio-converter_vi.ts \
    translations/ffmpeg-video-audio-converter_zh_CN.ts \
    translations/ffmpeg-video-audio-converter_new.ts

INCLUDEPATH += .

unix {
    # If DATA_PATH is set, ffmpeg-video-audio-converter searches data in DATA_PATH
    # Otherwise, it uses the executable path as data path.
    DEFINES += DATA_PATH=$(DATA_PATH)
    libnotify {
        # Linux desktop notification
        HEADERS += \
            services/notificationservice-libnotify.h
        SOURCES += \
            services/notificationservice-libnotify.cpp
        # pkgconfig
        CONFIG += link_pkgconfig
        PKGCONFIG = libnotify
        DEFINES += USE_LIBNOTIFY
    }
    # Shutdown
    QT += dbus
    SOURCES -= services/powermanagement-dummy.cpp
    SOURCES += services/powermanagement-linux.cpp
    # Install
    target.path = /usr/bin/
    icon.path = /usr/share/icons/hicolor/scalable/apps/
    icon.files += icons/ffmpeg-video-audio-converter.svg
    
    man.path = /usr/share/man/man1
    man.files += man/ffmpeg-video-audio-converter.1.gz
    
    appdata.path = /usr/share/metainfo
    appdata.files += metainfo/ffmpeg-video-audio-converter.appdata.xml
    
    desktop.path = /usr/share/applications/
    desktop.files += ffmpeg-video-audio-converter.desktop
    
    INSTALLS += target icon desktop man appdata
}

win32 {
    # If TOOLS_IN_DATA_PATH is set, ffmpeg-video-audio-converter searches for FFmpeg executables
    # in <datapath>/tools/ instead of PATH.
    DEFINES += TOOLS_IN_DATA_PATH
    # Application Icon
    RC_FILE = appicon.rc
    # Shutdown
    LIBS += -lpowrprof
    SOURCES -= services/powermanagement-dummy.cpp
    SOURCES += services/powermanagement-w32.cpp
}

os2 {
    # Application Icon
    DEFINES += TOOLS_IN_DATA_PATH
    RC_FILE = appicon_os2.rc
    # Shutdown not yet implemented on OS/2 Warp
    # When it is done, uncomment following lines and do proper modifications
    #LIBS +=
    SOURCES -= services/powermanagement-dummy.cpp
    SOURCES += services/powermanagement-macos.cpp
}

# This string is shown in the about box.
DEFINES += VERSION_ID_STRING=$(VERSION_ID_STRING)

# External Short Blocking Operation Timeout
DEFINES += OPERATION_TIMEOUT=30000
DEFINES += DEFAULT_THREAD_COUNT=1

OTHER_FILES +=

