# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Small library used to collect system information with low ressource usage"
HOMEPAGE="https://github.com/maxux/librtinfo"

EGIT_BRANCH="master"
EGIT_REPO_URI="
	https://github.com/maxux/librtinfo.git
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""

S="${WORKDIR}/${P}/linux"

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr/" LIBDIR=$(get_libdir) install
}
