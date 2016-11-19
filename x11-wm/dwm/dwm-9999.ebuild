# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit git-r3

DESCRIPTION="a dynamic window manager for X11"
HOMEPAGE="http://dwm.suckless.org/"
EGIT_REPO_URI="git://git.suckless.org/dwm"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="xinerama"

RDEPEND="x11-libs/libX11
		 media-libs/freetype
		 xinerama? ( x11-libs/libXinerama )"
DEPEND="${RDEPEND}
		xinerama? ( x11-proto/xineramaproto )"

PATCHES=( "${FILESDIR}/1-movestack-5.8.2.diff"
		  "${FILESDIR}/2-dwm-6.1-hide_vacant_tags.diff"
		  "${FILESDIR}/3-dwm-6.1-better-borders.diff"
		  "${FILESDIR}/4-dwm-6.1-attachaside-tagfix.diff"
		  "${FILESDIR}/5-dwm-20160731-statusallmons.diff"
		  "${FILESDIR}/6-removerect.diff" )

src_prepare() {
	epatch ${PATCHES[@]}

	sed -i \
		-e "s/CFLAGS = -std=c99 -pedantic -Wall -Os/CFLAGS += -std=c99 -pedantic -Wall/" \
		-e "/^LDFLAGS/{s|=|+=|g;s|-s ||g}" \
		-e "s@/usr/X11R6/include@${EPREFIX}/usr/include/X11@" \
		-e "s@/usr/X11R6/lib@${EPREFIX}/usr/lib@" \
		-e "s@-I/usr/include@@" -e "s@-L/usr/lib@@" \
		-e "s/\/freetype2/\ -I\/usr\/include\/freetype2/" \
		config.mk || die
	sed -i \
		-e '/@echo CC/d' \
		-e 's|@${CC}|$(CC)|g' \
		Makefile || die

	cp -v "${FILESDIR}/config.h" .
}

src_configure() {
	if ! use xinerama; then
		sed -i \
			-e "s/XINERAMALIBS  =/#XINERAMALIBS =/" \
			-e "s/XINERAMAFLAGS =/#XINERAMAFLAGS =/" \
			config.mk || die
	fi
}
