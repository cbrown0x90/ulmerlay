# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
SLOT=0

DESCRIPTION="All-in-one voice and text chat for gamers that's free and secure."
HOMEPAGE="https://discordapp.com/"
SRC_URI="https://discordapp.com/api/download?platform=linux&format=tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"

LICENSE="BSD"

RDEPEND="sys-libs/libcxx"
S=${WORKDIR}

src_install() {
	cd "${WORKDIR}/Discord"
	mkdir -p ${D}/opt/discord
	cp -rp * ${D}/opt/discord
	dosym /opt/discord/Discord /usr/bin/Discord
}
