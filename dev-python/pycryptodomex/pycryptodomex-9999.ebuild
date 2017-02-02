# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=(python2_7 python3_{4,5})

inherit git-r3 distutils-r1

DESCRIPTION="https://www.pycryptodome.org"
HOMEPAGE="A self-contained cryptographic library for Python"
EGIT_REPO_URI="https://github.com/Legrandin/pycryptodome"

LICENSE="|| ( public-domain BSD )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-libs/gmp"

src_prepare() {
	touch .separate_namespace
}
