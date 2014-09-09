# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

DESCRIPTION="A desktop version of the classic 'falling sand' physics sandbox."
HOMEPAGE="http://powdertoy.co.uk/"

SRC_URI=""
EGIT_REPO_URI="https://github.com/simtr/The-Powder-Toy.git"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND="dev-vcs/git 
        media-gfx/imagemagick
        dev-util/scons"

RDEPEND="app-arch/bzip2
         >=dev-lang/lua-5.1
         media-libs/libsdl
         sci-libs/fftw:3.0
         x11-libs/libX11
         sys-libs/zlib"

IUSE="sse"

inherit multilib scons-utils toolchain-funcs git-2

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
	mkdir "${D}/usr/" || die 
	mkdir "${D}/usr/bin" || die
	if use amd64; then
	    cp "${WORKDIR}/${P}/build/powder64" "${D}/usr/bin/powder" || die
	else
		if use sse; then
			cp "${WORKDIR}/${P}/build/powder" "${D}/usr/bin/powder" || die
		else
			cp "${WORKDIR}/${P}/build/powder-legacy" "${D}/usr/bin/powder" || die
		fi
	fi

	# This is bad.
	mkdir "${D}/usr/share/" || die
	mkdir "${D}/usr/share/icons" || die
	mkdir "${D}/usr/share/icons/hicolor" || die
	mkdir "${D}/usr/share/icons/hicolor/256x256" || die
	mkdir "${D}/usr/share/icons/hicolor/256x256/apps" || die
	OLD="${PWD}"
	cd "${WORKDIR}/${P}/resources"
	convert "powder.ico" "powder.png" 
	cp "powder-0.png" "${D}/usr/share/icons/hicolor/256x256/apps/powder.png" || die
	cd "${OLD}"

	# This is literally Hitler...
	mkdir "${D}/usr/share/applications" || die
	echo '[Desktop Entry]' > "${D}/usr/share/applications/the-powder-toy.desktop"
	echo 'Name=The Powder Toy' >> "${D}/usr/share/applications/the-powder-toy.desktop"
	echo 'GenericName=Falling Sand Game' >> "${D}/usr/share/applications/the-powder-toy.desktop"
	echo 'Comment=Classic "falling sand" physics sandbox game' >> "${D}/usr/share/applications/the-powder-toy.desktop"
	echo 'Exec=powder' >> "${D}/usr/share/applications/the-powder-toy.desktop"
	echo 'Icon=powder' >> "${D}/usr/share/applications/the-powder-toy.desktop"
	echo 'Terminal=false' >> "${D}/usr/share/applications/the-powder-toy.desktop"
	echo 'Type=Application' >> "${D}/usr/share/applications/the-powder-toy.desktop"
	echo 'Categories=Game;' >> "${D}/usr/share/applications/the-powder-toy.desktop"
	echo 'StartupNotify=true' >> "${D}/usr/share/applications/the-powder-toy.desktop"
}
