# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

KDE_LINGUAS="cs de es et fi fr it nl pl ru sr sr@ijekavian sr@ijekavianlatin
sr@Latn tr zh_CN zh_TW"
KDE_REQUIRED="optional"
KDE_HANDBOOK="optional"
inherit kde4-base

DESCRIPTION="A simple tag editor for KDE"
HOMEPAGE="http://kid3.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="4"
KEYWORDS="~amd64 ~x86"
IUSE="acoustid flac kde mp3 mp4 +phonon +taglib vorbis"

REQUIRED_USE="flac? ( vorbis )"

	#dev-qt/qtcore:5
	#dev-qt/qtgui:5
	#dev-qt/qtdbus:5

RDEPEND="
	dev-qt/qtmultimedia:5
	dev-qt/qtdeclarative:5
	dev-qt/qttest:5
	dev-qt/linguist-tools
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
	phonon? ( || (
		media-libs/phonon[qt4]
		dev-qt/qtphonon:4
	) )
	taglib? ( >=media-libs/taglib-1.9.1 )
	vorbis? (
		media-libs/libogg
		media-libs/libvorbis
	)
"
DEPEND="${RDEPEND}"

PATCHES=( "${FILESDIR}/${PN}-3.3.2-libdir.patch" )

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_with acoustid CHROMAPRINT)
		$(cmake-utils_use_with flac)
		$(cmake-utils_use_with mp3 ID3LIB)
		$(cmake-utils_use_with mp4 MP4V2)
		$(cmake-utils_use_with phonon)
		$(cmake-utils_use_with taglib)
		$(cmake-utils_use_with vorbis)
		"-DWITH_DBUS=OFF"
		"-DWITH_READLINE=OFF"
		"-DWITH_QT5=ON"
		"-DWITH_READLINE=OFF"
	)

	if use kde; then
		mycmakeargs+=("-DWITH_APPS=KDE;CLI")
	else
		mycmakeargs+=("-DWITH_APPS=QT")
	fi

	kde4-base_src_configure
}
