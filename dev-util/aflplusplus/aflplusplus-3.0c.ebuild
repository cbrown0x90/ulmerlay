# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7,8,9} )
inherit toolchain-funcs flag-o-matic python-single-r1

DESCRIPTION="A fork of AFL, the popular compile-time instrumentation fuzzer"
HOMEPAGE="https://github.com/AFLplusplus/AFLplusplus"
SRC_URI="https://github.com/AFLplusplus/AFLplusplus/archive/${PV}.tar.gz"
S="${WORKDIR}/AFLplusplus-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
# Tests involve heavy use of LD_PRELOAD in some cases
# This isn't compatible with sandbox
RESTRICT="test"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
    ${PYTHON_DEPS}
    sys-devel/llvm:*
"
DEPEND="
    ${RDEPEND}
    test? ( dev-util/cmocka )
"

src_compile() {
    emake CC="$(tc-getCC)" \
        CFLAGS_FLTO="" \
        PREFIX="${EPREFIX}/usr" \
        HELPER_PATH="${EPREFIX}/usr/$(get_libdir)/afl" \
        DOC_PATH="${EPREFIX}/usr/share/doc/${PF}" \
        MAN_PATH="${EPREFIX}/usr/share/man/man8" \
        distrib
}

src_install() {
    emake DESTDIR="${D}" \
        PREFIX="${EPREFIX}/usr" \
        HELPER_PATH="${EPREFIX}/usr/$(get_libdir)/afl" \
        DOC_PATH="${EPREFIX}/usr/share/doc/${PF}" \
        MAN_PATH="${EPREFIX}/usr/share/man/man8" \
        install
}
