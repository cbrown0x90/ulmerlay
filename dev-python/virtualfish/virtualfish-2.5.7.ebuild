# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{7..12} )
inherit distutils-r1

DESCRIPTION="Fish shell tool for managing Python virtual environments"
HOMEPAGE="https://github.com/justinmayer/virtualfish"
SRC_URI="https://github.com/justinmayer/${PN}/releases/download/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-python/pkgconfig
		dev-python/psutil
		dev-python/virtualenv
		dev-python/packaging"
RDEPEND="${DEPEND}"
