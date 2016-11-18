# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 npm

DESCRIPTION="Check if a string has ANSI escape codes"
EGIT_REPO_URI="https://github.com/chalk/has-ansi"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-node/ansi-regex"
