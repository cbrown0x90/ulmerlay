EAPI=5
PYTHON_COMPAT=(python2_7 python3_{4,5})

inherit git-r3 distutils-r1

DESCRIPTION="A Python library for automating interaction with websites."
HOMEPAGE="https://github.com/hickford/MechanicalSoup"
EGIT_REPO_URI="https://github.com/googlei18n/fonttools"
#SRC_URI="https://pypi.python.org/packages/d6/c4/688022e14fe8b8e899b40fd8eddece9f3e35b409267220432ac5f01e52c4/fonttools-3.1.2.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""

DEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]"
