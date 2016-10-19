# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit font git-r3

DESCRIPTION="Color Noto Emoji fonts by Google"
HOMEPAGE="http://www.google.com/get/noto/
	https://github.com/googlei18n/noto-emoji"
EGIT_REPO_URI="https://github.com/googlei18n/noto-emoji"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="|| ( app-arch/zopfli media-gfx/optipng )
		dev-python/nototools
		=dev-python/fonttools-9999[python_targets_python2_7]
		media-gfx/imagemagick[png]
		x11-libs/cairo"
RDEPEND=""

src_prepare() {
	sed -i 's/python/python2.7/g' ${WORKDIR}/${P}/Makefile
	sed -i 's/python/python2.7/g' ${WORKDIR}/${P}/*.py
}

src_install() {
	mkdir -p ${D}/usr/share/fonts/noto-emoji/
	cp ${WORKDIR}/${P}/NotoColorEmoji.ttf ${D}/usr/share/fonts/noto-emoji/
}
