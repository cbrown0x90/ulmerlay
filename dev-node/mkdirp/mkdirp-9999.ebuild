# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 npm

DESCRIPTION="Recursively mkdir, like \`mkdir -p\`, but in node.js"
EGIT_REPO_URI="https://github.com/substack/node-mkdirp.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-node/minimist"
