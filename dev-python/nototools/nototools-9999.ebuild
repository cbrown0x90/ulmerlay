EAPI=5
PYTHON_COMPAT=(python2_7)

inherit git-r3 distutils-r1

DESCRIPTION="A Python library for automating interaction with websites."
HOMEPAGE="https://github.com/hickford/MechanicalSoup"
EGIT_REPO_URI="https://github.com/googlei18n/nototools"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	dev-python/fonttools[${PYTHON_USEDEP}]"

DEPEND="
	${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"
