# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="dyndns client written by the dy.fi admins"
HOMEPAGE="http://www.dy.fi/page/clients"
SRC_URI="http://www.dy.fi/files/dyfi-update-pl-1.2.0.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin dyfi-update.pl
	newinitd "${FILESDIR}/init-${PV}" dyfi-update
	dodoc README
	insinto /etc/
	doins dyfi-update.conf
}
