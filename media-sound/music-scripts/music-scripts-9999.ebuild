# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3

DESCRIPTION="For processing .cue lossless rips"
HOMEPAGE="https://github.com/free-city-of-ulm/music-scripts"
EGIT_REPO_URI=${HOMEPAGE}

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="app-cdr/cuetools
		 media-sound/shntool
		 media-video/ffmpeg[vorbis]
		 media-libs/flac"

src_install() {
	dobin "${S}/flac-to-ogg"
	dobin "${S}/split-cue"
}
