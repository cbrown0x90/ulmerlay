# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} )
inherit multilib distutils-r1

DESCRIPTION="Unicorn bindings"
HOMEPAGE="http://www.unicorn-engine.org"
SRC_URI="https://github.com/unicorn-engine/unicorn/archive/1.0.2-rc3.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+python"

RDEPEND="~dev-util/unicorn-${PV}"

DEPEND="${RDEPEND}
	virtual/pkgconfig
	python? ( dev-python/setuptools[${PYTHON_USEDEP}] )
	"

S="${WORKDIR}/unicorn-1.0.2-rc3"/bindings

pkg_setup() {
	python_setup
}

src_prepare(){
	#do not compile C extensions
	export LIBUNICORN_PATH=1

	sed -i -e '/const_generator.py dotnet/d' Makefile
	#fix python2 install
	sed -i "s|python setup.py install|python2 setup.py install|" python/Makefile || die
	eapply_user
}

src_compile(){
	einfo "Nothing to compile"
}

src_install(){
	if use python; then
		myinstall_python() {
			emake -C python DESTDIR="${D}" install3
			python_optimize
		}
		python_foreach_impl myinstall_python
	fi
}
