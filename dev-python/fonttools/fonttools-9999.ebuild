# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=(python2_7 python3_{4,5})

inherit git-r3 distutils-r1

DESCRIPTION="Library for manipulating TrueType, OpenType, AFM and Type1 fonts"
HOMEPAGE="https://groups.google.com/d/forum/fonttools"
EGIT_REPO_URI="https://github.com/googlei18n/fonttools"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-python/numpy[${PYTHON_USEDEP}]"

DEPEND="${RDEPEND}"
