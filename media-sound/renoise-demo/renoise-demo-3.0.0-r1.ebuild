# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils fdo-mime

DESCRIPTION="Complete DAW using a tracker-based approach"
HOMEPAGE="http://www.renoise.com/"

MY_ARCH=${ARCH/amd64/x86_64}
MY_PV=${PV//./_}
SRC_URI="http://files.renoise.com/demo/Renoise_${MY_PV}_Demo_${MY_ARCH}.tar.bz2"
S="${WORKDIR}/Renoise_3_0_0_Demo_${MY_ARCH}"

LICENSE="renoise"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE="-icons"
RESTRICT="mirror strip"

DEPEND=""
RDEPEND="
	!media-sound/renoise
	media-libs/alsa-lib
"

QA_PREBUILT="
	usr/share/renoise-3.0.0/AudioPluginServer_x86_64
	usr/share/renoise-3.0.0/AudioPluginServer_x86
	usr/bin/renoise-3.0.0
"

src_prepare() {
	epatch "${FILESDIR}/rns_3_0_0-desktop.patch"
}

src_install() {
	insinto /usr/share/renoise-${PV}
	doins -r Resources/*
	newbin renoise renoise-${PV}
	dosym /usr/bin/renoise-${PV} /usr/bin/renoise
	doman Installer/renoise.1.gz
	doman Installer/renoise-pattern-effects.5.gz

	if use icons ; then
		insinto /usr/share/mime/packages
		doins Installer/renoise.xml
		doicon -s 48 -c apps Installer/renoise.png
		doicon -s 48 -c mimetypes Installer/renoise.png
		doicon -s 48 -c mimetypes Installer/renoise.png
		domenu Installer/renoise.desktop
	fi
}

pkg_postinst() {
	fdo-mime_mime_database_update
	fdo-mime_desktop_database_update
}

pkg_postrm() {
	fdo-mime_mime_database_update
	fdo-mime_desktop_database_update
}
