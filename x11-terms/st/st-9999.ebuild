# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit git-r3

DESCRIPTION="simple terminal implementation for X"
HOMEPAGE="http://st.suckless.org/"
EGIT_REPO_URI="git://git.suckless.org/st"
SRC_URI="http://raw.githubusercontent.com/free-city-of-ulm/suckless-builds/master/st/config.h"

LICENSE="MIT-with-advertising"
SLOT="0"
KEYWORDS="~amd64 ~hppa ~x86"

RDEPEND=">=sys-libs/ncurses-6.0:0=
	media-libs/fontconfig
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXft"

DEPEND="${RDEPEND}
	virtual/pkgconfig
	x11-proto/xextproto
	x11-proto/xproto"

PATCHES=( "${FILESDIR}/1-st-scrollback.diff"
		  "${FILESDIR}/2-st-scrollback-mouse.diff"
		  "${FILESDIR}/3-scroll-no-mod.patch"
		  "${FILESDIR}/4-alpha.patch" )

src_prepare() {
	cp -Lv "${DISTDIR}/config.h" .
	epatch ${PATCHES[@]}
}
