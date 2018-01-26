From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable-smoke test] 118349: regressions - FAIL
Date: Fri, 26 Jan 2018 04:38:33 +0000
Message-ID: <osstest-118349-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2776009431242180205=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xensource.com, osstest-admin@xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============2776009431242180205==
Content-Type: text/plain

flight 118349 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/118349/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-xsm               6 xen-build                fail REGR. vs. 118326

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  bb5400b20a0c2c2dce114075b09063038ad373db
baseline version:
 xen                  2375832c7e51b67f076e6b07854c4a541cb4bdc3

Last test of basis   118326  2018-01-25 11:01:28 Z    0 days
Failing since        118327  2018-01-25 13:01:30 Z    0 days    7 attempts
Testing same since   118344  2018-01-25 20:01:07 Z    0 days    4 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Daniel De Graaf <dgdegra@tycho.nsa.gov>
  George Dunlap <george.dunlap@citrix.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Oleksandr Grytsov <oleksandr_grytsov@epam.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Ross Lagerwall <ross.lagerwall@citrix.com>
  Wei Liu <wei.liu2@citrix.com>

jobs:
 build-arm64-xsm                                              fail    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-i386                     pass    
 test-amd64-amd64-libvirt                                     pass    


------------------------------------------------------------
sg-report-flight on osstest.test-lab.xenproject.org
logs: /home/logs/logs
images: /home/logs/images

Logs, config files, etc. are available at
    http://logs.test-lab.xenproject.org/osstest/logs

Explanation of these reports, and of osstest in general, is at
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README.email;hb=master
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README;hb=master

Test harness code can be found at
    http://xenbits.xen.org/gitweb?p=osstest.git;a=summary


Not pushing.

------------------------------------------------------------
commit bb5400b20a0c2c2dce114075b09063038ad373db
Author: George Dunlap <george.dunlap@citrix.com>
Date:   Mon Jan 8 15:50:53 2018 +0000

    xl: Don't warn on using 'deprecated' mode selection
    
    We generally support old config formats indefinintely (see the disk
    format) without emitting warnings.
    
    Signed-off-by: George Dunlap <george.dunlap@citrix.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

commit 5b6b15acebfc6ef3dcb72385f328c985526a33e3
Author: Oleksandr Grytsov <oleksandr_grytsov@epam.com>
Date:   Wed Jan 24 19:19:59 2018 +0200

    libxl: move ibxl_devid_to_device_... to LIBXL_DEFINE_DEVID_TO_DEVICE
    
    Signed-off-by: Oleksandr Grytsov <oleksandr_grytsov@epam.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>

commit 32e31182ea3178ab04c8f66ee3b1465f0fc9b255
Author: Oleksandr Grytsov <oleksandr_grytsov@epam.com>
Date:   Wed Jan 24 19:19:58 2018 +0200

    libxl: move libxl__device_from_ to LIBXL_DEFINE_DEVICE_FROM_TYPE
    
    LIBXL_DEFINE_DEVICE_FROM_TYPE uses libxl__..._devtype.type to
    be assigned as device and backend type.
    
    Signed-off-by: Oleksandr Grytsov <oleksandr_grytsov@epam.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>

commit 4b3dd5439e24cc85c54cae01815bdb3e57234955
Author: Oleksandr Grytsov <oleksandr_grytsov@epam.com>
Date:   Wed Jan 24 19:19:57 2018 +0200

    libxl: use libxl__device_kind in LIBXL_DEFINE_UPDATE_DEVID
    
    Use libxl__..._devtype.type to update device id.
    
    Signed-off-by: Oleksandr Grytsov <oleksandr_grytsov@epam.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>

commit 43a858403e9d0ce8c8282e3baade4b8e29c03b54
Author: Oleksandr Grytsov <oleksandr_grytsov@epam.com>
Date:   Wed Jan 24 19:19:56 2018 +0200

    libxl: use libxl__device_kind to get device XS entry
    
    On adding to XS name of device is taken from
    libxl__device_kind enum. On getting device from XS
    the name is hardcoded. It leads to potential
    mistmatch errors. The patch is using libxl__device_kind
    everywere to have one source of device name.
    
    Signed-off-by: Oleksandr Grytsov <oleksandr_grytsov@epam.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>

commit 8155476765a5bdecea1534b46562cf28e0113a9a
Author: Wei Liu <wei.liu2@citrix.com>
Date:   Wed Jan 24 20:26:26 2018 +0000

    x86: fix GET_STACK_END
    
    AIUI the purpose of having the .if directive is to make GET_STACK_END
    work with any general purpose registers. The code as-is would produce
    the wrong result for r8. Fix it.
    
    Signed-off-by: Wei Liu <wei.liu2@citrix.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 6d53d4ce621ee80e732152a545a55ab6762a830b
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Thu Jan 25 12:30:01 2018 +0100

    coverage: introduce generic file
    
    It will contain the generic implementation of sysctl_cov_op, which
    will be shared between all the coverage implementations.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>

commit e6c271a6625277117aece29a061fd522f02a5588
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Thu Jan 25 12:28:47 2018 +0100

    gcov: introduce hooks for the sysctl
    
    So that other implementations of the sysctl can be added.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>

commit e8d461497d9e23b01f9f6aeb9ddf92ff2693a2c1
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Thu Jan 25 12:27:44 2018 +0100

    gcov: rename sysctl and functions
    
    Change gcov to cov (for internal interfaces) or coverage (for the
    public ones).
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>

commit 7f76b3a06aefc1f201f6bfcb593b5d0b3dc68bff
Author: Ross Lagerwall <ross.lagerwall@citrix.com>
Date:   Thu Jan 25 12:26:55 2018 +0100

    x86/domctl: remove XEN_DOMCTL_pin_mem_cacheattr
    
    Remove the implementation of XEN_DOMCTL_pin_mem_cacheattr since it has
    been replaced by a dmop. Change xc_domain_pin_memory_cacheattr() so
    that it is only defined when XC_WANT_COMPAT_DEVICEMODEL_API is set and
    have it call the new dmop.  Leave the definitions of
    XEN_DOMCTL_MEM_CACHEATTR_* since they are still used by QEMU.
    
    Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
    Reviewed-by: Paul Durrant <paul.durrant@citrix.com>
    Acked-by: Daniel De Graaf <dgdegra@tycho.nsa.gov>
    Reviewed-by: Wei Liu <wei.liu2@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit af2a20e40e92da6c5383b66bc507bdb7d15ff829
Author: Ross Lagerwall <ross.lagerwall@citrix.com>
Date:   Thu Jan 25 12:26:36 2018 +0100

    libxendevicemodel: provide xendevicemodel_pin_memory_cacheattr
    
    Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
    Reviewed-by: Paul Durrant <paul.durrant@citrix.com>

commit 704538a4741173f4d339650700be681b85722785
Author: Ross Lagerwall <ross.lagerwall@citrix.com>
Date:   Thu Jan 25 12:26:23 2018 +0100

    libxendevicemodel: provide xendevicemodel_relocate_memory
    
    Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
    Reviewed-by: Paul Durrant <paul.durrant@citrix.com>

commit 642123c5123ff48d76d7ee376219ab50336636b9
Author: Ross Lagerwall <ross.lagerwall@citrix.com>
Date:   Thu Jan 25 12:25:22 2018 +0100

    x86/hvm: provide XEN_DMOP_pin_memory_cacheattr
    
    Provide XEN_DMOP_pin_memory_cacheattr to allow a deprivileged QEMU to
    pin the caching type of RAM after moving the VRAM. It is equivalent to
    XEN_DOMCTL_pin_memory_cacheattr.
    
    Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
    Reviewed-by: Paul Durrant <paul.durrant@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 6606cf3e2af0962b12a8802d9a5bf2cef6eaf005
Author: Ross Lagerwall <ross.lagerwall@citrix.com>
Date:   Thu Jan 25 12:24:14 2018 +0100

    x86/hvm: provide XEN_DMOP_relocate_memory
    
    Provide XEN_DMOP_relocate_memory, a limited version of
    XENMEM_add_to_physmap to allow a deprivileged QEMU to move VRAM when a
    guest programs its BAR. It is equivalent to XENMEM_add_to_physmap with
    space == XENMAPSPACE_gmfn_range.
    
    Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
    Reviewed-by: Paul Durrant <paul.durrant@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 34ae3fce896c7225c27b10c438f5b9a6af773669
Author: Ross Lagerwall <ross.lagerwall@citrix.com>
Date:   Thu Jan 25 12:23:35 2018 +0100

    mm: make xenmem_add_to_physmap global
    
    Make it global in preparation to be called by a new dmop.
    
    Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
    Reviewed-by: Paul Durrant <paul.durrant@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>
(qemu changes not included)


--===============2776009431242180205==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2776009431242180205==--
