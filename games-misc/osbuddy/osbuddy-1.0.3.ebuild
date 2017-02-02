# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
SLOT=0

DESCRIPTION="Launcher for the OldSchool RuneScape toolkit"
HOMEPAGE="https://rsbuddy.com/osbuddy"
SRC_URI="http://cdn.rsbuddy.com/live/f/loader/OSBuddy.jar"
KEYWORDS="~amd64"

LICENSE="BSD"

S=${WORKDIR}

src_install() {
	insinto "/usr/share/osbuddy"
	doins "${DISTDIR}/OSBuddy.jar"
	dobin "${FILESDIR}/osbuddy"
}
