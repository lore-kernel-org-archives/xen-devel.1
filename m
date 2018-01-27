From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable-smoke test] 118382: regressions - FAIL
Date: Sat, 27 Jan 2018 07:58:30 +0000
Message-ID: <osstest-118382-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7717678731115518203=="
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

--===============7717678731115518203==
Content-Type: text/plain

flight 118382 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/118382/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-xsm               6 xen-build                fail REGR. vs. 118363

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  b03e568ea9eb609f85a0a496c83a5f27ce18498e
baseline version:
 xen                  4c7e478d597b0346eef3a256cfd6794ac778b608

Last test of basis   118363  2018-01-26 17:01:14 Z    0 days
Testing same since   118366  2018-01-26 20:01:43 Z    0 days    5 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Christian Lindig <christian.lindig@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
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
commit b03e568ea9eb609f85a0a496c83a5f27ce18498e
Author: Stefano Stabellini <sstabellini@kernel.org>
Date:   Fri Jan 26 09:19:31 2018 -0800

    x86/boot: turn the selftests ASSERT into a warning
    
    On selftests failure, print a very visible warning instead of crashing
    over an ASSERT.
    
    Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    
    Adjust to print extra information in the case of a failure
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 510414bd5a65a239912c12482102073ca8cf7424
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Jan 26 15:59:51 2018 +0000

    x86/boot: Make the "Building Dom0" messages consistent
    
    Switch the PV message to match the wording of the PVH side, use the same
    number of ***'s, explicitly identify PV vs PVH, set the log level at INFO, and
    print the real domid (which won't be 0 in pv-shim mode).
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Wei Liu <wei.liu2@citrix.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 94450e36bfbb1cac447fb4009476e6d54bf68678
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Jan 15 10:00:51 2018 +0000

    xen: Drop DOMCTL_getmemlist and xc_get_pfn_list()
    
    c/s 4ddf474e2 "tools/xen-mceinj: Pass in GPA when injecting through
    MSR_MCI_ADDR" removed the remaining user of hypercall.
    
    It has been listed as broken, deprecated and wont-fix since XSA-74, so take
    this opportunity to remove it completely.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>

commit d933f1a53c06002351c1e36d40615e40bd4bf6af
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Jan 19 18:04:27 2018 +0000

    tools/ocaml: Drop coredump infrastructure
    
    It is unused, and uses an obsolete hypercall which has never ever functioned
    for HVM guests.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>

commit 1124a9a26f05439a3aa31eaea227285e50dc94c0
Author: Roger Pau Monne <roger.pau@citrix.com>
Date:   Fri Jan 26 15:29:10 2018 +0000

    xen/pvshim: fix GNTTABOP_query_size hypercall forwarding with SMAP
    
    Disable SMAP in the shim before bouncing the hypercall, or else L0
    will fail to get the hypercall buffer.
    
    Reported-by: Fatih Acar <fatih.acar@gandi.net>
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Wei Liu <wei.liu2@citrix.com>
(qemu changes not included)


--===============7717678731115518203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7717678731115518203==--
