# Distributed under the terms of the GNU General Public License v2

EAPI="4"

inherit git-2
EGIT_REPO_URI="https://github.com/defer-/ccwm"

DESCRIPTION="Simple frontend for scanning and connecting to access points"
HOMEPAGE="http://github.com/defer-/ccwm"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""

RDEPEND="
	net-wireless/iw
	net-wireless/wpa_supplicant
	net-misc/dhcpcd
	sys-apps/iproute2
"
