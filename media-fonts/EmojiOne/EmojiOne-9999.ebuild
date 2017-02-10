# Copyright 1999-2017 Gentoo Foundation
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
IUSE="build"

DEPEND="build? ( media-gfx/potrace
		media-gfx/inkscape
		dev-python/fonttools[python_targets_python2_7]
		media-gfx/fontforge[python_single_target_python2_7,python_targets_python2_7]
		media-gfx/imagemagick[png]
		dev-python/pyyaml[python_targets_python2_7]
		media-gfx/svgo )"
RDEPEND="media-fonts/ttf-bitstream-vera[X?]"

src_prepare() {
	if use build ; then
		git clone https://github.com/eosrei/scfbuild.git "${WORKDIR}/${P}/SCFBuild"
	else
		wget https://github.com/eosrei/emojione-color-font/releases
		grep < releases -o "/eosrei/emojione-color-font/releases/download/v[0-9].[0-9]/EmojiOneColor-SVGinOT-Linux-[0-9]*\.[0-9]*.tar.gz" | head -1 | wget --base=http://github.com -i - -O EmojiOne.tar.gz
		mkdir EmojiOne-TTF && tar xf EmojiOne.tar.gz -C EmojiOne-TTF --strip-components 1
	fi
}

src_compile() {
	if use build ; then
		emake
	fi
}

src_install() {
	insinto /usr/share/fonts/EmojiOne/
	if use build ; then
		doins "${WORKDIR}/${P}/build/EmojiOneColor-SVGinOT.ttf"
	else
		doins "${WORKDIR}/${P}/${PN}-TTF/EmojiOneColor-SVGinOT.ttf"
	fi
}
