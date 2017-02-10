# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit cmake-utils

DESCRIPTION="Simple tag editor based on Qt"
HOMEPAGE="http://kid3.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="5"
KEYWORDS="~amd64 ~x86"
IUSE="acoustid flac mp3 mp4 +taglib vorbis"

REQUIRED_USE="flac? ( vorbis )"

COMMON_DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtdbus:5
	dev-qt/qtdeclarative:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtxml:5
	dev-qt/qtmultimedia:5
	sys-libs/readline:0=
	acoustid? (
		media-libs/chromaprint
		virtual/ffmpeg
	)
	flac? (
		media-libs/flac[cxx]
		media-libs/libvorbis
	)
	mp3? ( media-libs/id3lib )
	mp4? ( media-libs/libmp4v2:0 )
	taglib? ( >=media-libs/taglib-1.9.1 )
	vorbis? (
		media-libs/libogg
		media-libs/libvorbis
	)
"
RDEPEND="${COMMON_DEPEND}
	!media-sound/kid3:4
"
DEPEND="${COMMON_DEPEND}
	dev-qt/linguist-tools:5
"

PATCHES=( "${FILESDIR}/${PN}-3.3.2-libdir.patch" )

src_configure() {
	local mycmakeargs=(
		-DWITH_PHONON=OFF
		-DWITH_QT4=OFF
		-DWITH_QT5=ON
		-DWITH_CHROMAPRINT=$(usex acoustid)
		-DWITH_FLAC=$(usex flac)
		-DWITH_ID3LIB=$(usex mp3)
		-DWITH_MP4V2=$(usex mp4)
		-DWITH_TAGLIB=$(usex taglib)
		-DWITH_VORBIS=$(usex vorbis)
	)

	mycmakeargs+=( "-DWITH_APPS=Qt" )

	cmake-utils_src_configure
}
