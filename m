From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable-smoke test] 120751: regressions - FAIL
Date: Wed, 14 Mar 2018 18:22:25 +0000
Message-ID: <osstest-120751-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4309390593923661827=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=2/qf=ge=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1ewB2s-0008Qq-6F
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 18:22:38 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============4309390593923661827==
Content-Type: text/plain

flight 120751 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/120751/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-xsm               6 xen-build                fail REGR. vs. 120679
 build-armhf                   6 xen-build                fail REGR. vs. 120679

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  29036baa23da7e82896262cbcbffdbc8faf98147
baseline version:
 xen                  eef83fd2af0d4c78afec34c199c977fc97d8a0b3

Last test of basis   120679  2018-03-13 12:06:56 Z    1 days
Failing since        120685  2018-03-13 17:01:17 Z    1 days    8 attempts
Testing same since   120751  2018-03-14 16:01:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Doug Goldstein <cardoe@cardoe.com>
  Jan Beulich <jbeulich@suse.com>
  John Thomson <git@johnthomson.fastmail.com.au>
  Michael Young <m.a.young@durham.ac.uk>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Wei Liu <wei.liu2@citrix.com>

jobs:
 build-arm64-xsm                                              fail    
 build-amd64                                                  pass    
 build-armhf                                                  fail    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          blocked 
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
commit 29036baa23da7e82896262cbcbffdbc8faf98147
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Mar 14 10:36:09 2018 +0000

    x86/entry: Trivial nonfunctional fixes
    
     * Drop unnecessary size suffixes
     * The C pseudocode refers to a trap_info object, not trap_bounce.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit dedbdcde95ce0dc3f1a51ad9c685a71570630a7d
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Mar 14 10:48:36 2018 +0000

    x86/pv: Fix guest crashes following f75b1a5247b "x86/pv: Drop int80_bounce from struct pv_vcpu"
    
    The original init_int80_direct_trap() was in fact buggy; `int $0x80` is not an
    exception.  This went unnoticed for years because int80_bounce and trap_bounce
    were separate structures, but were combined by this change.
    
    Exception handling is different to interrupt handling for PV guests.  By
    reusing trap_bounce, the following corner case can occur:
    
     * Handle a guest `int $0x80` instruction.  Latches TBF_EXCEPTION into
       trap_bounce.
     * Handle an exception, which emulates to success (such as ptwr support),
       which leaves trap_bounce unmodified.
     * The exception exit path sees TBF_EXCEPTION set and re-injects the `int
       $0x80` a second time.
    
    Drop the TBF_EXCEPTION from the int80 invocation, which matches the equivalent
    logic from the syscall/sysenter paths.
    
    Reported-by: Sander Eikelenboom <linux@eikelenboom.it>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit db0c7dde021c29c2ae0d847d70fb7b59e02ea522
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Tue Mar 13 11:13:18 2018 +0000

    libxl_qmp: Tell QEMU about live migration or snapshot
    
    Since version 2.10, QEMU will lock the disk images so a second QEMU
    instance will not try to open it. This would prevent live migration from
    working correctly. A new parameter as been added to the QMP command
    "xen-save-devices-state" in QEMU version 2.11 which allow to unlock the
    disk image for a live migration, but also keep it locked for a snapshot.
    
    QEMU commit: 5d6c599fe1d69a1bf8c5c4d3c58be2b31cd625ad
    "migration, xen: Fix block image lock issue on live migration"
    
    The extra "live" parameter can only be use if QEMU knows about it, so
    only add it if qemu is recent enough.
    
    The struct libxl__domain_suspend_state as now knowledge if the suspend
    is part of a live migration.
    
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>

commit ab73254b9ac3febe0c512e21af567fa536c20ad4
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Tue Mar 13 11:13:17 2018 +0000

    libxl: Add a version check of QEMU for QMP commands
    
    On connection to QEMU via QMP, the version of QEMU is provided, store it
    for later use.
    
    Add a function qmp_qemu_check_version that can be used to check if QEMU
    is new enough for certain fonctionnality. This will be used in a moment.
    
    As it's a static function, it is commented out until first use, which is
    in the next patch.
    
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>

commit 93de1d0b3462f20da819fb4f296be8bd3271f885
Author: Wei Liu <wei.liu2@citrix.com>
Date:   Wed Mar 14 11:02:31 2018 +0000

    gitignore: ignore wrappers.c link for fuzzer
    
    At the same time reorder the entries alphabetically.
    
    Signed-off-by: Wei Liu <wei.liu2@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 82bc81c17d9397aad3f9386a60316cc1088a643f
Author: Roger Pau Monne <roger.pau@citrix.com>
Date:   Wed Mar 14 11:09:24 2018 +0000

    xl: remove apic option for PVH guests
    
    XSA-256 forces the local APIC to always be enabled for PVH guests, so
    ignore any apic option for PVH guests. Update the documentation
    accordingly.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>

commit 87554421b9ffcebe0a89ba9a927bccc0c7bed7f3
Author: John Thomson <git@johnthomson.fastmail.com.au>
Date:   Wed Mar 14 18:21:24 2018 +1000

    tools: xenalyze.c fix format-truncation
    
    With gcc optimization enabled by:
    tools: detect appropriate debug optimization level
    b43501451733193b265de30fd79a764363a2a473
    
    -Wformat-truncation throws warnings
    
    gcc version 7.3.0
    
    xenalyze.c: In function 'find_symbol':
    xenalyze.c:382:36: error: 'snprintf' output may be truncated before the last format character [-Werror=format-truncation=]
         snprintf(name, 128, "(%s +%llx)",
                                        ^
    xenalyze.c:382:5: note: 'snprintf' output between 6 and 144 bytes into a destination of size 128
         snprintf(name, 128, "(%s +%llx)",
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                  lastname, offset);
                  ~~~~~~~~~~~~~~~~~
    cc1: all warnings being treated as errors
    
    Signed-off-by: John Thomson <git@johnthomson.fastmail.com.au>
    Reviewed-by: George Dunlap <george.dunlap@citrix.com>

commit a7313da7f7767984172873adf645eff9bd667bda
Author: Doug Goldstein <cardoe@cardoe.com>
Date:   Tue Mar 13 11:25:29 2018 -0500

    tools/xl: fix uninitialized variable in xl_vdispl
    
    The code added in 7a48622a78a0b452e8afa55b8442c958abd226a7 could use rc
    uninitialized in main_vdisplattach().
    
    Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>

commit 9f3b40e8fe083e0d6d184c105f96ad9b9617f038
Author: Michael Young <m.a.young@durham.ac.uk>
Date:   Mon Mar 12 18:49:29 2018 +0000

    make xen ocaml safe-strings compliant
    
    Xen built with ocaml 4.06 gives errors such as
    Error: This expression has type bytes but an expression was
            expected of type string
    as Byte and safe-strings which were introduced in 4.02 are the
    default in 4.06.
    This patch which is partly by Richard W.M. Jones of Red Hat
    from https://bugzilla.redhat.com/show_bug.cgi?id=1526703
    fixes these issues.
    
    Signed-off-by: Michael Young <m.a.young@durham.ac.uk>
    Reviewed-by: Christian Lindig<christian.lindig@citrix.com>

commit b43501451733193b265de30fd79a764363a2a473
Author: Doug Goldstein <cardoe@cardoe.com>
Date:   Mon Mar 12 23:06:51 2018 -0500

    tools: detect appropriate debug optimization level
    
    When building debug use -Og as the optimization level if its available,
    otherwise retain the use of -O0. -Og has been added by GCC to enable all
    optimizations that to not affect debugging while retaining full
    debugability.
    
    Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>
(qemu changes not included)


--===============4309390593923661827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4309390593923661827==--
