EAPI=5

inherit autotools git-r3

DESCRIPTION="Darkcoin CPU miner"
HOMEPAGE="https://www.darkcoin.io/"
EGIT_REPO_URI="https://github.com/ig0tik3d/darkcoin-cpuminer-1.2c"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="-x86"
IUSE=""

DEPEND="
	net-misc/curl
	dev-libs/jansson
	!net-misc/cpuminer
	!net-misc/darkcoin-cpuminer-avx-aes
"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}
