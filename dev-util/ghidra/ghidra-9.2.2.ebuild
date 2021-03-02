EAPI=7

inherit desktop

DESCRIPTION="Ghidra is a software reverse engineering (SRE) framework"
HOMEPAGE="https://www.nsa.gov/ghidra"
DATE="20201229"
SRC_URI="https://ghidra-sre.org/ghidra_${PV}_PUBLIC_${DATE}.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="app-shells/bash"
RDEPEND="${DEPEND}
    || ( dev-java/openjdk-jre-bin
         dev-java/openjdk-jdk-bin
         dev-java/openjdk )
"

S="${WORKDIR}/ghidra_${PV}_PUBLIC"

src_install() {
    insinto /opt/ghidra
    doins -r *

    BINARIES="
        ghidraRun
        server/svrAdmin
        server/jaas_external_program.example.sh
        server/svrInstall
        server/ghidraSvr
        server/svrUninstall
        support/pythonRun
        support/launch.sh
        support/sleigh
        support/analyzeHeadless
        support/ghidraDebug
        support/convertStorage
        support/buildGhidraJar
        GPL/DemanglerGnu/os/linux64/demangler_gnu_v2_24
        GPL/DemanglerGnu/os/linux64/demangler_gnu_v2_33_1
        GPL/CabExtract/os/linux64/cabextract
        Ghidra/Features/Decompiler/os/linux64/decompile
        Ghidra/Features/Decompiler/os/linux64/sleigh
    "
    for f in ${BINARIES}; do
        fperms +x "${EPREFIX}/opt/ghidra/${f}"
    done

    dosym "${EPREFIX}/opt/ghidra/ghidraRun" "${EPREFIX}/usr/bin/ghidra"

	domenu "${FILESDIR}/ghidra.desktop"
}
