# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit font git-r3

DESCRIPTION="Color and Black-and-White Noto Emoji fonts by Google"
HOMEPAGE="http://www.google.com/get/noto/
	https://github.com/googlei18n/noto-emoji"
EGIT_REPO_URI="https://github.com/googlei18n/noto-emoji"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND=""

FONT_SUFFIX="ttf"
FONT_S=${S}

src_compile() {

		fontfile="${WORKDIR}/${P}/fonts/NotoEmoji-Regular.ttf"
		newname=$(basename "${WORKDIR}/${P}/fonts/NotoEmoji-Regular.ttf")
		newname=${newname/"${P}"/"NotoEmoji.ttf"}
		cp "${fontfile}" "${FONT_S}/${newname}"
}
