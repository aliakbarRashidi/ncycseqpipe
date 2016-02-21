#-------------------------------------------------
#
# Project created by QtCreator 2014-06-28T22:14:45
#
#-------------------------------------------------

QT       += core printsupport
QT       += gui
QT       += widgets

TARGET = ncycpipestats

#CONFIG   += console
#CONFIG   -= app_bundle
#/home/shepperp/Qt/5.5/gcc_64/bin/qmake ncycpipestats.pro
CONFIG  += c++11

TEMPLATE = app

SOURCES += main.cpp \
    options.cpp \
    pipemetric.cpp \
    quastmetrics.cpp \
    cgalmetrics.cpp \
    qcustomplot.cpp \
    plotlvn.cpp \
    qcpdocumentobject.cpp \
    scatterdata.cpp

HEADERS += \
    main.h \
    options.h \
    pipemetric.h \
    quastmetrics.h \
    cgalmetrics.h \
    qcustomplot.h \
    plotlvn.h \
    qcpdocumentobject.h \
    scatterdata.h

