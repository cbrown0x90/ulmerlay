# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 npm

DESCRIPTION="JavaScript YAML parser and dumper. Very fast."
EGIT_REPO_URI="https://github.com/nodeca/js-yaml.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-node/argparse
		 dev-node/esprima"
