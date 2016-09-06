# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=4
SLOT=0

DESCRIPTION="A simple tag editor for KDE"
HOMEPAGE="http://kid3.sourceforge.net/"
S=${WORKDIR}

KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	net-libs/nodejs[npm]
"
DEPEND="${RDEPEND}"

src_compile() {
	cd ${WORKDIR}
	npm install --global-style gulp-cli
}

src_install() {
	mkdir -p ${D}/usr/lib64
	cp -R ${WORKDIR}/node_modules ${D}/usr/lib64/
	mkdir -p ${D}/usr/bin/
	dosym /usr/lib64/node_modules/gulp-cli/bin/gulp.js /usr/bin/gulp
}
