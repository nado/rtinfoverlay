# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Client for the rtinfod monitoring server with low ressource usage"
HOMEPAGE="https://github.com/maxux/rtinfo"
EGIT_BRANCH="master"
EGIT_REPO_URI="
	https://github.com/maxux/rtinfo.git
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""

DEPEND="
	sys-libs/librtinfo
"
RDEPEND="${DEPEND}"

src_compile() {
	emake -C rtinfo-client
}

src_install() {
	emake -C rtinfo-client DESTDIR="${D}" PREFIX="${EPREFIX}/usr/" OPENRC=YES install
}
