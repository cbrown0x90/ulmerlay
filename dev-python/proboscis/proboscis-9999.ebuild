EAPI=5
PYTHON_COMPAT=(python2_7)

inherit git-r3 distutils-r1

DESCRIPTION="An extensible music server that plays music from local disk and more"
HOMEPAGE="http://mopidy.com https://github.com/mopidy/mopidy"
EGIT_REPO_URI="https://github.com/rackerlabs/python-proboscis"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]"
