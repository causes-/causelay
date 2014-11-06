# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-r3

DESCRIPTION="a minimalistic audio player"
HOMEPAGE="https://github.com/ap0calypse/whistle/"
EGIT_REPO_URI="https://github.com/ap0calypse/whistle/"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

RDEPEND="
	sys-libs/ncurses
	dev-perl/Curses-UI
	dev-perl/MP3-Info
	dev-perl/File-MimeInfo
	dev-perl/ogg-vorbis-header
	dev-perl/Audio-FLAC-Header
	media-video/mplayer
"
DEPEND="${RDEPEND}"

src_install() {
	dobin whistle
	dodoc README.md
}
