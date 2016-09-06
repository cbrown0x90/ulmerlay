# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="a general-purpose, web standards-based platform for parsing and rendering PDFs"
HOMEPAGE="http://mozilla.github.io/pdf.js/"
EGIT_REPO_URI="https://github.com/mozilla/pdf.js"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="net-libs/nodejs[npm] net-libs/gulp"
RDEPEND=""

src_compile() {
	npm install
	gulp generic
}

src_install() {
	insinto /usr/share/pdf.js/

	doins -r build/generic/build
	doins -r build/generic/web
}
