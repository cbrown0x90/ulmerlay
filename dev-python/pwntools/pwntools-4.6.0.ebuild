# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{6,7,8,9} )

inherit distutils-r1

DESCRIPTION="Pwntools is a CTF framework and exploit development library."
HOMEPAGE="https://github.com/Gallopsled/pwntools#readme"
SRC_URI="https://github.com/Gallopsled/pwntools/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-lang/python
		>=dev-python/paramiko-1.15.2
		>=dev-python/mako-1.0.0
		>=dev-python/pyelftools-0.2.4
		>=dev-libs/capstone-3.0.5[python]
		>=dev-python/ropgadget-5.3
		>=dev-python/pyserial-2.7
		>=dev-python/requests-2.0
		>=dev-python/pip-6.0.8
		>=dev-python/pygments-2.0
		dev-python/PySocks
		dev-python/python-dateutil
		dev-python/packaging
		>=dev-python/psutil-3.3.0
		>=dev-python/intervaltree-3.0
		dev-python/sortedcontainers
		=dev-libs/unicorn-bindings-1.0.2[python]
		>=dev-python/six-1.12.0
		dev-python/rpyc
		dev-python/colored-traceback"
