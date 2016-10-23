# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
# pypy fails tests; pypy3 fails even running tests
PYTHON_COMPAT=( python2_7 python3_{4,5} )

inherit distutils-r1

MY_PV=${PV/_beta2/-beta-2}

DESCRIPTION="Google's Protocol Buffers - official Python bindings"
HOMEPAGE="https://github.com/google/protobuf/ https://developers.google.com/protocol-buffers/"
SRC_URI="https://github.com/google/protobuf/archive/v${MY_PV}.tar.gz -> protobuf-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0/10"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc64 ~sh ~sparc ~x86 ~amd64-linux ~arm-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""

# Protobuf is only a build-time dep, but depend on the exact same version
# (excluding revision), since we are using the same tarball.
# In case of using the (linked) cpp implementation we should be fine with the same subslot.
RDEPEND="${PYTHON_DEPS}
	!<dev-libs/protobuf-3[python(-)]"
DEPEND="${RDEPEND}
	=dev-libs/protobuf-3.0.0_beta2
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]"
S="${WORKDIR}/protobuf-${MY_PV}/python"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
PATCHES=( "${FILESDIR}/protobuf-${PV}-link-against-installed-lib.patch" )

python_test() {
	distutils_install_for_testing
	esetup.py test
}
