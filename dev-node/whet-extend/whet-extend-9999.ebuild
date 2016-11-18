# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 npm

DESCRIPTION="A sharped version of node.extend as port of jQuery.extend that actually works on node.js"
EGIT_REPO_URI="https://github.com/Meettya/whet.extend.git"

# NPM_MODULES has to be whet.extend not whet-extend
NPM_MODULE="whet.extend"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
