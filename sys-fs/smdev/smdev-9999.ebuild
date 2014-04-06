# Distributed under the terms of the GNU General Public License v2

EAPI="4"

inherit git-2
EGIT_REPO_URI="http://git.2f30.org/smdev/"

DESCRIPTION="suckless mdev"
HOMEPAGE="http://git.2f30.org/smdev/"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

RDEPEND=""

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/" install
}
