# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=(python2_7 python3_{4,5})

inherit git-r3 distutils-r1

DESCRIPTION="Proboscis brings TestNG features to Python"
HOMEPAGE="http://packages.python.org/proboscis/"
EGIT_REPO_URI="https://github.com/rackerlabs/python-proboscis"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
