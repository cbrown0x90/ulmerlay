# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=(python2_7 python3_{4,5})

inherit git-r3 distutils-r1

DESCRIPTION="general purpose python data validator"
HOMEPAGE="https://github.com/jamesturk/validictory"
EGIT_REPO_URI=${HOMEPAGE}

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
