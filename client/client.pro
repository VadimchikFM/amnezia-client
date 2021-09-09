QT += widgets core gui network xml remoteobjects quick

TARGET = AmneziaVPN
TEMPLATE = app
#CONFIG += console

DEFINES += QT_DEPRECATED_WARNINGS

include("3rd/QtSsh/src/ssh/qssh.pri")
include("3rd/QtSsh/src/botan/botan.pri")
!android:!ios:include("3rd/SingleApplication/singleapplication.pri")
include("3rd/QRCodeGenerator/QRCodeGenerator.pri")

HEADERS  += \
    ../ipc/ipc.h \
   configurators/cloak_configurator.h \
   configurators/shadowsocks_configurator.h \
   configurators/ssh_configurator.h \
   configurators/vpn_configurator.h \
   configurators/wireguard_configurator.h \
    containers/containers_defs.h \
    core/defs.h \
    core/errorstrings.h \
    core/ipcclient.h \
    configurators/openvpn_configurator.h \
   core/scripts_registry.h \
   core/server_defs.h \
    core/servercontroller.h \
    debug.h \
    defines.h \
    managementserver.h \
   protocols/openvpnovercloakprotocol.h \
   protocols/protocols_defs.h \
    protocols/shadowsocksvpnprotocol.h \
   protocols/wireguardprotocol.h \
    settings.h \
    ui/models/all_containers_model.h \
    ui/pages.h \
    ui/pages_logic/AppSettingsLogic.h \
    ui/pages_logic/GeneralSettingsLogic.h \
    ui/pages_logic/NetworkSettingsLogic.h \
   ui/pages_logic/NewServerConfiguringLogic.h \
   ui/pages_logic/NewServerProtocolsLogic.h \
    ui/pages_logic/PageLogicBase.h \
    ui/pages_logic/ServerContainersLogic.h \
    ui/pages_logic/ServerListLogic.h \
    ui/pages_logic/ServerSettingsLogic.h \
    ui/pages_logic/ShareConnectionLogic.h \
    ui/pages_logic/SitesLogic.h \
    ui/pages_logic/StartPageLogic.h \
    ui/pages_logic/VpnLogic.h \
    ui/pages_logic/WizardLogic.h \
   ui/pages_logic/protocols/CloakLogic.h \
   ui/pages_logic/protocols/OpenVpnLogic.h \
   ui/pages_logic/protocols/ShadowSocksLogic.h \
    ui/property_helper.h \
    ui/models/servers_model.h \
    ui/uilogic.h \
   ui/qautostart.h \
   ui/models/sites_model.h \
    utils.h \
    vpnconnection.h \
    protocols/vpnprotocol.h \
    protocols/openvpnprotocol.h \

SOURCES  += \
   configurators/cloak_configurator.cpp \
   configurators/shadowsocks_configurator.cpp \
   configurators/ssh_configurator.cpp \
   configurators/vpn_configurator.cpp \
   configurators/wireguard_configurator.cpp \
    containers/containers_defs.cpp \
   core/errorstrings.cpp \
    core/ipcclient.cpp \
    configurators/openvpn_configurator.cpp \
   core/scripts_registry.cpp \
   core/server_defs.cpp \
    core/servercontroller.cpp \
    debug.cpp \
    main.cpp \
    managementserver.cpp \
   protocols/openvpnovercloakprotocol.cpp \
   protocols/protocols_defs.cpp \
    protocols/shadowsocksvpnprotocol.cpp \
   protocols/wireguardprotocol.cpp \
    settings.cpp \
    ui/models/all_containers_model.cpp \
    ui/pages_logic/AppSettingsLogic.cpp \
    ui/pages_logic/GeneralSettingsLogic.cpp \
    ui/pages_logic/NetworkSettingsLogic.cpp \
   ui/pages_logic/NewServerConfiguringLogic.cpp \
   ui/pages_logic/NewServerProtocolsLogic.cpp \
    ui/pages_logic/PageLogicBase.cpp \
    ui/pages_logic/ServerContainersLogic.cpp \
    ui/pages_logic/ServerListLogic.cpp \
    ui/pages_logic/ServerSettingsLogic.cpp \
    ui/pages_logic/ShareConnectionLogic.cpp \
    ui/pages_logic/SitesLogic.cpp \
    ui/pages_logic/StartPageLogic.cpp \
    ui/pages_logic/VpnLogic.cpp \
    ui/pages_logic/WizardLogic.cpp \
   ui/pages_logic/protocols/CloakLogic.cpp \
   ui/pages_logic/protocols/OpenVpnLogic.cpp \
   ui/pages_logic/protocols/ShadowSocksLogic.cpp \
    ui/models/servers_model.cpp \
    ui/uilogic.cpp \
   ui/qautostart.cpp \
   ui/models/sites_model.cpp \
    utils.cpp \
    vpnconnection.cpp \
    protocols/vpnprotocol.cpp \
    protocols/openvpnprotocol.cpp \

FORMS    += \
   ui/server_widget.ui

RESOURCES += \
    resources.qrc

TRANSLATIONS = \
    translations/amneziavpn_ru.ts

#CONFIG(release, debug|release) {
#    DESTDIR = $$PWD/../../AmneziaVPN-build/client/release
#    MOC_DIR = $$DESTDIR
#    OBJECTS_DIR = $$DESTDIR
#    RCC_DIR = $$DESTDIR
#}

win32 {
    OTHER_FILES += platform_win/vpnclient.rc
    RC_FILE = platform_win/vpnclient.rc

    HEADERS += \
       ui/framelesswindow.h \

    SOURCES += \
       ui/framelesswindow.cpp

    VERSION = 1.0.0.0
    QMAKE_TARGET_COMPANY = "AmneziaVPN"
    QMAKE_TARGET_PRODUCT = "AmneziaVPN"



    LIBS += \
        -luser32 \
        -lrasapi32 \
        -lshlwapi \
        -liphlpapi \
        -lws2_32 \
        -liphlpapi \
        -lgdi32

}

macx {
    ICON   = $$PWD/images/app.icns

    HEADERS  += ui/macos_util.h
    SOURCES  += ui/macos_util.mm

    LIBS += -framework Cocoa -framework ApplicationServices -framework CoreServices -framework Foundation -framework AppKit
}

REPC_REPLICA += ../ipc/ipcinterface.rep

DISTFILES += \
   android/AndroidManifest.xml

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
