# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 npm

DESCRIPTION="CSS minifier with structural optimizations"
EGIT_REPO_URI="https://github.com/css/csso.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-node/clap
		 dev-node/source-map"