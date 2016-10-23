# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit qmake-utils git-r3

DESCRIPTION="Simple graphics painting program"
HOMEPAGE="https://github.com/Gr1N/EasyPaint"
EGIT_REPO_URI="${HOMEPAGE}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="dev-qt/qtcore:5
		 dev-qt/qtgui:5
		 dev-qt/qtwidgets:5
		 dev-qt/qtprintsupport:5"
DEPEND="${RDEPEND}"

src_configure() {
	lrelease sources/easypaint.pro
	eqmake5 sources
}

src_install() {
	emake sources INSTALL_ROOT="${D}" install
}
