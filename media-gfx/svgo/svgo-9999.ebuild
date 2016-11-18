# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 npm

DESCRIPTION="Nodejs-based tool for optimizing SVG vector graphics files."
EGIT_REPO_URI="https://github.com/svg/svgo"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-node/colors
		 dev-node/coa
		 dev-node/csso
		 dev-node/js-yaml
		 dev-node/mkdirp
		 dev-node/sax
		 dev-node/whet-extend"
