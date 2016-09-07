EAPI=5
PYTHON_COMPAT=(python2_7)

inherit git-r3 distutils-r1

DESCRIPTION="A python client library for Google Play Services OAuth"
HOMEPAGE="https://github.com/simon-weber/gpsoauth"
EGIT_REPO_URI=${HOMEPAGE}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/pycryptodomex[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]"
