# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 npm

DESCRIPTION="Terminal string styling done right"
EGIT_REPO_URI="https://github.com/chalk/chalk.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-node/ansi-styles
		 dev-node/escape-string-regexp
		 dev-node/has-ansi
		 dev-node/strip-ansi
		 dev-node/supports-color"
