# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Small library used to monitor linux system with low ressource usage"
HOMEPAGE="https://github.com/maxux/rtinfo"
EGIT_BRANCH="master"
EGIT_REPO_URI="
	https://github.com/maxux/rtinfo.git
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="server client ncurses"
REQUIRED_USE=" || ( server client ncurses )"

DEPEND="
	sys-libs/librtinfo
	server? ( dev-libs/jansson )
	ncurses? (
		dev-libs/jansson
		sys-libs/ncurses:*
	)
"
RDEPEND="${DEPEND}"

src_compile() {
	if use server; then
		emake -C rtinfod
	fi

	if use client; then
		emake -C rtinfo-client
	fi

	if use ncurses; then
		emake -C rtinfo-ncurses
	fi
}

src_install() {
	if use server; then
		emake -C rtinfod DESTDIR="${D}" PREFIX="${EPREFIX}/usr/" OPENRC=YES install
	fi

	if use client; then
		emake -C rtinfo-client DESTDIR="${D}" PREFIX="${EPREFIX}/usr/" OPENRC=YES install
	fi

	if use ncurses; then
		emake -C rtinfo-ncurses DESTDIR="${D}" PREFIX="${EPREFIX}/usr/" install
	fi
}
