# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python2_7 python3_{4,5} )

inherit git-r3 distutils-r1

DESCRIPTION="An unofficial client library for Google Music"
HOMEPAGE="https://unofficial-google-music-api.readthedocs.io"
EGIT_REPO_URI="https://github.com/simon-weber/gmusicapi"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/decorator[${PYTHON_USEDEP}]
	media-libs/mutagen[${PYTHON_USEDEP}]
	dev-python/validictory[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/proboscis[${PYTHON_USEDEP}]
	dev-python/oauth2client[${PYTHON_USEDEP}]
	dev-python/mock[${PYTHON_USEDEP}]
	dev-python/appdirs[${PYTHON_USEDEP}]
	dev-python/gpsoauth[${PYTHON_USEDEP}]
	dev-python/mechanicalsoup[${PYTHON_USEDEP}]
	dev-python/pyopenssl[${PYTHON_USEDEP}]
	dev-python/ndg-httpsclient[${PYTHON_USEDEP}]
	dev-python/pyasn1[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/future[${PYTHON_USEDEP}]
	=dev-python/protobuf-python-3.0.0_beta2[${PYTHON_USEDEP}]"

DEPEND="
	${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"
