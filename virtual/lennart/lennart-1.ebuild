# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Hardblock systemd and pulseaudio"
HOMEPAGE="http://boycottsystemd.org/"

SLOT="0"
KEYWORDS="x86 amd64"

DEPEND="
	!!sys-apps/systemd
	!!media-sound/pulseaudio
	sys-process/procps[-systemd]
	"
RDEPEND="${DEPEND}"
