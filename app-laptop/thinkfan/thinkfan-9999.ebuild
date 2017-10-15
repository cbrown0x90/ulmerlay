# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils git-r3

DESCRIPTION="simple fan control program for thinkpads"
HOMEPAGE="github.com/vmatare/thinkfan"
EGIT_REPO_URI="https://github.com/vmatare/thinkfan.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="atasmart"

DEPEND="atasmart? ( dev-libs/libatasmart )
		dev-cpp/yaml-cpp"
RDEPEND="${DEPEND}"

src_configure() {
	mycmakeargs+=(
		"-DCMAKE_BUILD_TYPE:STRING=Debug"
		"-DUSE_ATASMART=$(usex atasmart)"
	)

	cmake-utils_src_configure
}
