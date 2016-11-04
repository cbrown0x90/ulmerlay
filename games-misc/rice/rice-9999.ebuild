# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3

DESCRIPTION="rsync for cloud storage"
HOMEPAGE="rclone.org"
EGIT_REPO_URI="https://github.com/janbrennen/rice"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE="hackertyper 256color 3spooky pipes hackexe"
REQUIRED_USE="|| ( hackertyper 256color 3spooky pipes hackexe ) "

RDEPEND="3spooky? ( || ( dev-lang/lua dev-lang/luajit ) )"

src_prepare() {
	if use 3spooky; then
		if command -v lua; then
			sed -i '1s/^/#!\/usr\/bin\/lua\n/' "${WORKDIR}/${P}/3spooky.lua"
		else
			sed -i '1s/^/#!\/usr\/bin\/luajit\n/' "${WORKDIR}/${P}/3spooky.lua"
		fi
	fi
}

src_compile() {
	gcc ${CFLAGS} -lpthread -o hack.exe hack.exe.c
}

src_install() {
	if use hackertyper; then
		dobin "${WORKDIR}/${P}/hackertyper.sh"
	fi

	if use 256color; then
		dobin "${WORKDIR}/${P}/256color.pl"
	fi

	if use 3spooky; then
		dobin "${WORKDIR}/${P}/3spooky.lua"
	fi

	if use pipes; then
		dobin "${WORKDIR}/${P}/pipes.sh"
	fi

	if use hackexe; then
		dobin "${WORKDIR}/${P}/hack.exe"
	fi
}
