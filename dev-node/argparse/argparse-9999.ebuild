# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 npm

DESCRIPTION="CLI arguments parser for node.js. JS port of python's argparse module"
EGIT_REPO_URI="https://github.com/nodeca/argparse"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-node/sprintf-js"
