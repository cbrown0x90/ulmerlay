# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{6,7,8,9} )

inherit distutils-r1

DESCRIPTION="Display information about files in different file formats and find gadgets to build rop chains for different architectures (x86/x86_64, ARM/ARM64, MIPS, PowerPC, SPARC64). For disassembly ropper uses the awesome Capstone Framework."
HOMEPAGE="https://scoding.de/ropper"
SRC_URI="https://github.com/sashs/Ropper/archive/v${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-libs/capstone-4.0.1
        >=dev-python/filebytes-0.10.0
        =dev-libs/keystone-0.9.1*"
RDEPEND="${DEPEND}"

S="${WORKDIR}/Ropper-${PV}"
