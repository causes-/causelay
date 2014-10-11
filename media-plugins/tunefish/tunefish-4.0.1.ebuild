# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="VST synthesizer"
HOMEPAGE="http://www.tunefish-synth.com/"

SRC_URI="
	amd64? ( http://www.tunefish-synth.com/downloads/${PN}-v${PV}-linux64-vst24.tar.gz )
	x86? ( http://www.tunefish-synth.com/downloads/${PN}-v${PV}-linux32-vst24.tar.gz )
"

SLOT="0"
KEYWORDS="-* ~x86 ~amd64"

DEPEND=""
RDEPEND=""

S=${WORKDIR}

src_install() {
	insinto /usr/lib/vst/
	doins -r *
}
