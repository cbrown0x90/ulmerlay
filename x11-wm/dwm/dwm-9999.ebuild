# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit git-r3 savedconfig eutils

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
		  "${FILESDIR}/3-dwm-6.1-attachaside-tagfix.diff"
		  "${FILESDIR}/4-dwm-20160731-statusallmons.diff"
		  "${FILESDIR}/5-removerect.diff"
		  "${FILESDIR}/6-dwm-noborder-20170207-bb3bd6f.diff"
		  "${FILESDIR}/7-dwm-statuscolors.diff"
		  "${FILESDIR}/8-strip-utf8.diff")

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

	restore_config config.h
}

src_configure() {
	if ! use xinerama; then
		sed -i \
			-e "s/XINERAMALIBS  =/#XINERAMALIBS =/" \
			-e "s/XINERAMAFLAGS =/#XINERAMAFLAGS =/" \
			config.mk || die
	fi
}

pkg_postinst() {
	einfo "This ebuild has support for user defined configs"
	einfo "Please read this ebuild for more details and re-emerge as needed"
	einfo "if you want to add or remove functionality for ${PN}"
	if ! has_version x11-misc/dmenu; then
		elog "Installing ${PN} without x11-misc/dmenu"
		einfo "To have a menu you can install x11-misc/dmenu"
	fi
	einfo "You can custom status bar with a script in HOME/.dwm/dwmrc"
	einfo "the ouput is redirected to the standard input of dwm"
	einfo "Since dwm-5.4, status info in the bar must be set like this:"
	einfo "xsetroot -name \"\`date\` \`uptime | sed 's/.*,//'\`\""
}
