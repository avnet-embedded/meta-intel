FILESEXTRAPATHS_prepend_intel-x86-common := "${THISDIR}/${PN}:"

SRC_URI_append = " file://0001-ioctl.c-Fix-build-with-linux-4.13.patch"

python() {
    # When we add more kernels for linux-intel, we may have to add a Version check
    if (d.getVar("PREFERRED_PROVIDER_virtual/kernel") == "linux-intel"):
        src_uri = d.getVar("SRC_URI")
        d.setVar("SRC_URI", src_uri +
             " file://0001-zc-Force-4.10-get_user_pages_remote-API.patch")
}