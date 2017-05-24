# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )
inherit distutils-r1 git-r3

DESCRIPTION="Python client for Neovim"
HOMEPAGE="https://github.com/neovim/python-client"
EGIT_REPO_URI="https://github.com/neovim/python-client.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=dev-python/msgpack-0.4.0[${PYTHON_USEDEP}]
	virtual/python-greenlet[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/trollius[${PYTHON_USEDEP}]' python{2_7,3_3})
"

RDEPEND="
	${DEPEND}
	>=app-editors/neovim-0.1.3
"

S="${WORKDIR}/neovim-python-client-${PV}"
