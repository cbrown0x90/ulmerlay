EAPI=5
PYTHON_COMPAT=(python2_7)

inherit git-r3 distutils-r1

DESCRIPTION="A Python library for automating interaction with websites."
HOMEPAGE="https://github.com/hickford/MechanicalSoup"
EGIT_REPO_URI=${HOMEPAGE}

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/beautifulsoup[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]"
