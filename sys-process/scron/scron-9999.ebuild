# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-2

DESCRIPTION="Simple cron daemon"
HOMEPAGE="http://git.2f30.org/scron/"
EGIT_REPO_URI="http://git.2f30.org/scron/"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

RESTRICT="strip"

DEPEND="!sys-process/cronbase"

src_install() {
	emake DESTDIR="${D}" install
	newinitd "${FILESDIR}/init-${PV}" crond
	dodoc README
}
