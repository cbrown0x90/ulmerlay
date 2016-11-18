# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 npm

DESCRIPTION="Command line argument parser and staff"
EGIT_REPO_URI="https://github.com/lahmatiy/clap.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-node/chalk"