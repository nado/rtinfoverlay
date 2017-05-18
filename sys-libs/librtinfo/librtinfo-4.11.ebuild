# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Small library used to collect system (linux) information for monitoring with low ressource usage"
HOMEPAGE="https://github.com/maxux/librtinfo"
SRC_URI="https://github.com/maxux/librtinfo/archive/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/${P}/linux"

PATCHES=(
	"${FILESDIR}"/librtinfo-4.11-config.patch
	"${FILESDIR}"/librtinfo-4.11-makefile.patch
)

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr/" LIBDIR=$(get_libdir) install
}
