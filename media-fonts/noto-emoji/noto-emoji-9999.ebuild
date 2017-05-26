# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit font git-r3 python-utils-r1

DESCRIPTION="Color Noto Emoji fonts by Google"
HOMEPAGE="http://www.google.com/get/noto/
	https://github.com/googlei18n/noto-emoji"
EGIT_REPO_URI="https://github.com/googlei18n/noto-emoji"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="|| ( app-arch/zopfli media-gfx/optipng )
		dev-python/nototools
		dev-python/fonttools[python_targets_python2_7]
		media-gfx/imagemagick[png]
		x11-libs/cairo"

PYTHON="/usr/bin/python2.7"

src_prepare() {
	epatch "${FILESDIR}/revert-quiet.diff"
	sed -i 's/python/python2/g' "${WORKDIR}/${P}/Makefile"
	sed -i 's/python/python2/g' "${WORKDIR}/${P}/"*.py
}

src_install() {
	mkdir -p "${D}/usr/share/fonts/noto-emoji/"
	cp "${WORKDIR}/${P}/NotoColorEmoji.ttf" "${D}/usr/share/fonts/noto-emoji/"
}
