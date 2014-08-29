# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-r3

DESCRIPTION="Scan wlan AP's with nice output"
HOMEPAGE="https://github.com/defer-/iwscan"
EGIT_REPO_URI="https://github.com/defer-/iwscan"

SLOT="0"
KEYWORDS=""

RDEPEND="
	virtual/awk
	net-wireless/iw
"
