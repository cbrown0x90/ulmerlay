# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit font git-r3

DESCRIPTION="A color emoji SVGinOT font using EmojiOne Unicode 9.0 emoji"
HOMEPAGE="https://github.com/eosrei/emojione-color-font.git"
EGIT_REPO_URI="${HOMEPAGE}"

LICENSE="|| ( MIT CC-BY-4.0 )"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="media-gfx/potrace
		media-gfx/inkscape
		dev-python/fonttools[python_targets_python2_7]
		media-gfx/fontforge[python_single_target_python2_7,python_targets_python2_7]
		media-gfx/imagemagick[png]
		dev-python/pyyaml[python_targets_python2_7]
		media-gfx/svgo"

src_prepare() {
	git clone https://github.com/eosrei/scfbuild.git "${WORKDIR}/${P}/SCFBuild"
}

src_install() {
	mkdir -p "${D}/usr/share/fonts/EmojiOne/"
	cp "${WORKDIR}/${P}/build/EmojiOneColor-SVGinOT.ttf" "${D}/usr/share/fonts/EmojiOne/"
}
