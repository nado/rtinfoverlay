# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MY_PV=${PV/_p/-r}

DESCRIPTION="Small library used to collect system information with low ressource usage"
HOMEPAGE="https://github.com/maxux/librtinfo"
SRC_URI="https://github.com/maxux/librtinfo/archive/${MY_PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/${PN}-${MY_PV}/linux"

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr/" LIBDIR=$(get_libdir) install
}
