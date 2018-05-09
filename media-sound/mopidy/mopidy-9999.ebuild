# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=(python2_7)

inherit git-r3 distutils-r1

DESCRIPTION="An extensible music server that plays music from local disk and more"
HOMEPAGE="http://mopidy.com https://github.com/mopidy/mopidy"
EGIT_REPO_URI="https://github.com/mopidy/mopidy"
EGIT_BRANCH="master"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/pykka[${PYTHON_USEDEP}]
	>=dev-python/gst-python-1.2.3:1.0[${PYTHON_USEDEP}]
	dev-python/pygobject[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	>=media-plugins/gst-plugins-meta-1.0-r2:1.0[http,mp3]
	www-servers/tornado[${PYTHON_USEDEP}]"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]"

PATCHES=(
	"${FILESDIR}/${PN}-remove-data.patch"
)
#src_compile() {
#	python3 setup.py build
#}
#
#src_install() {
#	local args=( "${@}" )
#
#	# enable compilation for the install phase.
#	local -x PYTHONDONTWRITEBYTECODE=
#
#	# python likes to compile any module it sees, which triggers sandbox
#	# failures if some packages haven't compiled their modules yet.
#	addpredict "${EPREFIX}/usr/$(get_libdir)/${EPYTHON}"
#	addpredict /usr/lib/portage/pym
#	addpredict /usr/local # bug 498232
#
#	if [[ ! ${DISTUTILS_SINGLE_IMPL} ]]; then
#		# user may override --install-scripts
#		# note: this is poor but distutils argv parsing is dumb
#		local mydistutilsargs=( "${mydistutilsargs[@]}" )
#		local scriptdir=${EPREFIX}/usr/bin
#
#		# construct a list of mydistutilsargs[0] args[0] args[1]...
#		local arg arg_vars
#		[[ ${mydistutilsargs[@]} ]] && eval arg_vars+=(
#			'mydistutilsargs['{0..$(( ${#mydistutilsargs[@]} - 1 ))}']'
#		)
#		[[ ${args[@]} ]] && eval arg_vars+=(
#			'args['{0..$(( ${#args[@]} - 1 ))}']'
#		)
#
#		set -- "${arg_vars[@]}"
#		while [[ ${@} ]]; do
#			local arg_var=${1}
#			shift
#			local a=${!arg_var}
#
#			case "${a}" in
#				--install-scripts=*)
#					scriptdir=${a#--install-scripts=}
#					unset "${arg_var}"
#					;;
#				--install-scripts)
#					scriptdir=${!1}
#					unset "${arg_var}" "${1}"
#					shift
#					;;
#			esac
#		done
#	fi
#
#	local root=${D%/}/_${EPYTHON}
#	[[ ${DISTUTILS_SINGLE_IMPL} ]] && root=${D%/}
#
#	esetup.py install --root="${root}" "${args[@]}"
#
#	local forbidden_package_names=( examples test tests )
#	local p
#	#for p in "${forbidden_package_names[@]}"; do
#	#	if [[ -d ${root}$(python_get_sitedir)/${p} ]]; then
#	#		die "Package installs '${p}' package which is forbidden and likely a bug in the build system."
#	#	fi
#	#done
#	#if [[ -d ${root}/usr/$(get_libdir)/pypy/share ]]; then
#	#	local cmd=die
#	#	[[ ${EAPI} == [45] ]] && cmd=eqawarn
#	#	"${cmd}" "Package installs 'share' in PyPy prefix, see bug #465546."
#	#fi
#
#	if [[ ! ${DISTUTILS_SINGLE_IMPL} ]]; then
#		#_distutils-r1_wrap_scripts "${root}" "${scriptdir}"
#		multibuild_merge_root "${root}" "${D%/}"
#	fi
#}
