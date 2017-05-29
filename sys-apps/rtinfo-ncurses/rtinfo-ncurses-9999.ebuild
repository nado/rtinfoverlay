# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Ncurses interface for the rtinfod monitoring server"
HOMEPAGE="https://github.com/maxux/rtinfo"
EGIT_BRANCH="master"
EGIT_REPO_URI="
	https://github.com/maxux/rtinfo.git
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""

DEPEND="
	dev-libs/jansson
	sys-libs/librtinfo
	sys-libs/ncurses:*
"
RDEPEND="${DEPEND}"

src_compile() {
	emake -C rtinfo-ncurses
}

src_install() {
	emake -C rtinfo-ncurses DESTDIR="${D}" PREFIX="${EPREFIX}/usr/" install
}
