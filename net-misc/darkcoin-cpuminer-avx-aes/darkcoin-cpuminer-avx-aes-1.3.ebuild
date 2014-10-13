EAPI=5

inherit autotools git-r3

DESCRIPTION="Darkcoin CPU miner"
HOMEPAGE="https://www.darkcoin.io/"
EGIT_REPO_URI="https://github.com/elmad/darkcoin-cpuminer-1.3-avx-aes"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="-x86"
IUSE=""

DEPEND="
	net-misc/curl
	dev-libs/jansson
"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}
