# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Small daemon used to monitor linux system with low ressource usage"
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
"
RDEPEND="${DEPEND}"

src_compile() {
	emake -C rtinfod
}

src_install() {
	emake -C rtinfod DESTDIR="${D}" PREFIX="${EPREFIX}/usr/" OPENRC=YES install
}
