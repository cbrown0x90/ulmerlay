# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit  git-r3

DESCRIPTION="simple terminal implementation for X"
HOMEPAGE="http://st.suckless.org/"
EGIT_REPO_URI="git://git.suckless.org/st"

LICENSE="MIT-with-advertising"
SLOT="0"
KEYWORDS="~amd64 ~hppa ~x86"
IUSE="savedconfig"

RDEPEND="
	>=sys-libs/ncurses-6.0:0=
	media-libs/fontconfig
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXft
"
DEPEND="
	${RDEPEND}
	virtual/pkgconfig
	x11-proto/xextproto
	x11-proto/xproto
"

src_prepare() {
	eapply_user
	epatch ${FILESDIR}/patches/*
	cp -Lv ${FILESDIR}/config.h ${WORKDIR}/${P}/config.h
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}"/usr install

	#dodoc TODO

	#make_desktop_entry ${PN} simpleterm utilities-terminal 'System;TerminalEmulator;' ''

	#save_config config.h
}
