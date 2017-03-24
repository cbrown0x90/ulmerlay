# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils multilib qmake-utils git-r3

MY_P="${PN}-${PV/_/~}"

DESCRIPTION="Mumble is an open source, low-latency, high quality voice chat software"
HOMEPAGE="https://wiki.mumble.info"
EGIT_REPO_URI="https://github.com/mumble-voip/mumble"

LICENSE="BSD MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+alsa +dbus debug g15 libressl oss pch portaudio pulseaudio qt4 +qt5 zeroconf"
REQUIRED_USE="^^ ( qt4 qt5 ) "

RDEPEND=">=dev-libs/boost-1.41.0
	!libressl? ( >=dev-libs/openssl-1.0.0b:0 )
	libressl? ( dev-libs/libressl )
	>=dev-libs/protobuf-2.2.0:=
	>=media-libs/libsndfile-1.0.20[-minimal]
	>=media-libs/opus-1.0.1
	=media-libs/celt-0.7.0
	|| (
		(
			>=media-libs/speex-1.2.0
			media-libs/speexdsp
		)
		<media-libs/speex-1.2.0
	)
	sys-apps/lsb-release
	x11-libs/libX11
	x11-libs/libXi
	qt4? (
		dev-qt/qtcore:4[ssl]
		dev-qt/qtgui:4
		dev-qt/qtopengl:4
		dev-qt/qtsql:4[sqlite]
		dev-qt/qtsvg:4
		dev-qt/qtxmlpatterns:4
		dbus? ( dev-qt/qtdbus:4 )
	)
	qt5? (
		dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtnetwork:5
		dev-qt/qtopengl:5
		dev-qt/qtsql:5[sqlite]
		dev-qt/qtsvg:5
		dev-qt/qttranslations:5
		dev-qt/qtwidgets:5
		dev-qt/qtx11extras:5
		dev-qt/qtxml:5
		dev-qt/qtxmlpatterns:5
		dev-qt/linguist-tools:5
		dbus? ( dev-qt/qtdbus:5 )
	)
	x11-proto/inputproto
	alsa? ( media-libs/alsa-lib )
	g15? ( app-misc/g15daemon )
	portaudio? ( media-libs/portaudio )
	pulseaudio? ( media-sound/pulseaudio )
	zeroconf? ( net-dns/avahi[mdnsresponder-compat] )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

S="${WORKDIR}/${MY_P}"

src_configure() {
	local conf_add

	if has_version '<=sys-devel/gcc-4.2'; then
		conf_add="${conf_add} no-pch"
	else
		use pch || conf_add="${conf_add} no-pch"
	fi

	use alsa || conf_add="${conf_add} no-alsa"
	use dbus || conf_add="${conf_add} no-dbus"
	use debug && conf_add="${conf_add} symbols debug" || conf_add="${conf_add} release"
	use g15 || conf_add="${conf_add} no-g15"
	use oss || conf_add="${conf_add} no-oss"
	use portaudio || conf_add="${conf_add} no-portaudio"
	use pulseaudio || conf_add="${conf_add} no-pulseaudio"
	use zeroconf || conf_add="${conf_add} no-bonjour"
	conf_add="${conf_add} no-bundled-celt \
						  no-bundled-opus \
						  no-bundled-speex \
						  no-embed-qt-translations \
						  no-server \
						  no-update \
						  no-speechd"

	if use qt4; then
	export QT_SELECT=qt4
	eqmake4 "${S}/main.pro" -recursive \
		CONFIG+="${conf_add}"
		DEFINES+="PLUGIN_PATH=/usr/$(get_libdir)/mumble"
	elif use qt5; then
		export QT_SELECT=qt5
		eqmake5 "${S}/main.pro" -recursive \
			CONFIG+="${conf_add}"
			DEFINES+="PLUGIN_PATH=/usr/$(get_libdir)/mumble" || die "eqmake5 failed"
	fi
}

src_install() {
	newdoc README.Linux README
	dodoc CHANGES

	local dir
	if use debug; then
		dir=debug
	else
		dir=release
	fi

	dobin "${dir}"/mumble
	dobin scripts/mumble-overlay

	insinto /usr/share/services
	doins scripts/mumble.protocol

	domenu scripts/mumble.desktop

	insinto /usr/share/icons/hicolor/scalable/apps
	doins icons/mumble.svg

	doman man/mumble-overlay.1
	doman man/mumble.1

	insopts -o root -g root -m 0755
	insinto "/usr/$(get_libdir)/mumble"
	doins "${dir}"/libmumble.so.*
	dosym libmumble.so.${PV} /usr/$(get_libdir)/mumble/libmumble.so.1
	doins "${dir}"/plugins/lib*.so*
}

pkg_postinst() {
	echo
	elog "Visit http://mumble.sourceforge.net/ for futher configuration instructions."
	elog "Run mumble-overlay to start the OpenGL overlay (after starting mumble)."
	echo
}
