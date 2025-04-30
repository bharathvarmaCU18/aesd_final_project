SUMMARY = "Simple Qt5 Hello World Application for testing purpose"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

DEPENDS += "qtbase qtmultimedia"

RDEPENDS:${PN} = "qtbase-plugins"
# Add font dependencies
DEPENDS += "qtbase fontconfig"
RDEPENDS_${PN} += "ttf-dejavu-sans ttf-dejavu-sans-mono ttf-dejavu-common"

SRC_URI = "file://main.cpp \
           file://qt-hello-world.pro \
           file://qt-setup.sh"

S = "${WORKDIR}"

inherit qmake5

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${B}/qt-hello-world ${D}${bindir}
    install -d ${D}${datadir}/${BPN}/fonts
    install -m 0755 ${WORKDIR}/qt-setup.sh ${D}${bindir}/
}

FILES_${PN} += "${datadir}/${BPN}/fonts/*"

