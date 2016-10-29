# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Virtual package to require matlab dependencies"
HOMEPAGE=""
LICENSE=""

SLOT="0"
KEYWORDS="amd64"

RDEPEND="dev-java/oracle-jre-bin:1.7[javafx]
		x11-libs/cairo[glib]"
