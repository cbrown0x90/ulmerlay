# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=(python2_7 python3_{4,5,6})

inherit git-r3 distutils-r1

DESCRIPTION="A Fish wrapper for Ian Bicking's virtualenv, based loosely on Doug Hellman's virtualenvwrapper for Bash."
HOMEPAGE="https://virtualfish.readthedocs.io/en/latest/"
EGIT_REPO_URI="https://github.com/adambrenecki/virtualfish"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
