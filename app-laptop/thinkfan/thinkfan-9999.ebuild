# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=4

inherit cmake-utils readme.gentoo-r1 systemd git-r3

DESCRIPTION="simple fan control program for thinkpads"
HOMEPAGE="github.com/vmatare/thinkfan"
EGIT_REPO_URI="git://github.com/vmatare/thinkfan.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="atasmart"

DEPEND="atasmart? ( dev-libs/libatasmart )"
RDEPEND="${DEPEND}"

#rc_prepare() {
#	sed -e '/^set(CMAKE_C_FLAGS/d' \
#		-i CMakeLists.txt || die
#}

src_configure() {
	mycmakeargs+=(
		"-DCMAKE_BUILD_TYPE:STRING=Debug"
		"$(cmake-utils_use_use atasmart ATASMART)"
	)

	cmake-utils_src_configure
}
