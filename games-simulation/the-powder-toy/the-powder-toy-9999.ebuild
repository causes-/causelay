# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit multilib scons-utils toolchain-funcs git-r3

DESCRIPTION="physics sandbox game"
HOMEPAGE="http://powdertoy.co.uk/"
EGIT_REPO_URI="https://github.com/simtr/The-Powder-Toy"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

RDEPEND="
	app-arch/bzip2
	>=dev-lang/lua-5.1
	media-libs/libsdl
	sci-libs/fftw:3.0
	x11-libs/libX11
	sys-libs/zlib
"
DEPEND="
	dev-vcs/git
	media-gfx/imagemagick
	dev-util/scons
"

IUSE="sse"

src_configure() {
	if use amd64; then
		myesconsargs=(--64bit)
	fi
	
	if use sse; then
		myesconsargs=(${myesconsargs} -j2 --sse --sse2 --sse3 --lin --release CC="$(tc-getCC)")
	else
		myesconsargs=(${myesconargs} -j2 --lin --release CC="$(tc-getCC)")
	fi
}

src_compile() {
	escons
}

src_install() {
	mkdir -p "${D}/usr/bin" || die

	if use amd64; then
	    cp "${WORKDIR}/${P}/build/powder64" "${D}/usr/bin/powder" || die
	else
		if use sse; then
			cp "${WORKDIR}/${P}/build/powder" "${D}/usr/bin/powder" || die
		else
			cp "${WORKDIR}/${P}/build/powder-legacy" "${D}/usr/bin/powder" || die
		fi
	fi

	mkdir -p "${D}/usr/share/icons/hicolor/256x256/apps" || die
	OLD="${PWD}"
	cd "${WORKDIR}/${P}/resources"
	convert "powder.ico" "powder.png" 
	cp "powder-0.png" "${D}/usr/share/icons/hicolor/256x256/apps/powder.png" || die
	cd "${OLD}"

	domenu ${FILESDIR}/the-powder-toy.desktop
}
