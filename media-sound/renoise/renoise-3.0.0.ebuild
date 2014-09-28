# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils fdo-mime

DESCRIPTION="Complete DAW using a tracker-based approach"
HOMEPAGE="http://www.renoise.com/"

MY_ARCH=${ARCH/amd64/x86_64}
MY_PV=${PV//./_}
SRC_URI="rns_${MY_PV}_reg_${MY_ARCH}.tar.gz"
S="${WORKDIR}/rns_${MY_PV}_${MY_ARCH}"

LICENSE="renoise"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
RESTRICT="fetch strip"

DEPEND=""
RDEPEND="
	!media-sound/renoise-demo
	media-libs/alsa-lib
"

QA_PREBUILT="
	usr/share/renoise-${PV}/AudioPluginServer_x86_64
	usr/share/renoise-${PV}/AudioPluginServer_x86
	usr/bin/renoise-${PV}
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

	insinto /usr/share/mime/packages
	doins Installer/renoise.xml
	doicon -s 48 -c apps Installer/renoise.png
	doicon -s 48 -c mimetypes Installer/renoise.png
	domenu Installer/renoise.desktop
}

pkg_nofetch() {
	elog "Download ${A} from ${HOMEPAGE} and place it in ${DISTDIR}"
}

pkg_postinst() {
	fdo-mime_mime_database_update
	fdo-mime_desktop_database_update
}

pkg_postrm() {
	fdo-mime_mime_database_update
	fdo-mime_desktop_database_update
}
