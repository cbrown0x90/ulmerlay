EAPI=5
PYTHON_COMPAT=(python2_7)

inherit git-r3 distutils-r1

DESCRIPTION="https://www.pycryptodome.org"
HOMEPAGE="A self-contained cryptographic library for Python"
EGIT_REPO_URI="https://github.com/Legrandin/pycryptodome"

LICENSE="public-domain","bsd"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
DEPEND=""

src_prepare() {
	epatch "${FILESDIR}"/remove-tests.diff
	touch .separate_namespace
}
