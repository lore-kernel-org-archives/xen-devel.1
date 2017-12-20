From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable-smoke test] 117372: regressions - FAIL
Date: Wed, 20 Dec 2017 12:21:04 +0000
Message-ID: <osstest-117372-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4558396501712663824=="
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

--===============4558396501712663824==
Content-Type: text/plain

flight 117372 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/117372/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 117339

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-i386  1 build-check(1)         blocked n/a
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  51fc3633dfe50d0e04f438dbcd19e55beab9b9a7
baseline version:
 xen                  1b33150fe06ab9217f7f12b01bc5e607f4f55658

Last test of basis   117339  2017-12-19 15:02:59 Z    0 days
Testing same since   117372  2017-12-20 09:43:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Tim Deegan <tim@xen.org>
  Yi Sun <yi.y.sun@linux.intel.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  fail    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          blocked 
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386                     blocked 
 test-amd64-amd64-libvirt                                     blocked 


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
commit 51fc3633dfe50d0e04f438dbcd19e55beab9b9a7
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Dec 20 10:05:16 2017 +0100

    x86/shadow: ignore sh_pin() failure in one more case
    
    Following what we've already done in the XSA-250 fix, convert another
    sh_pin() caller to no longer fail the higher level operation if pinning
    fails, as pinning is a performance optimization only in those places.
    
    Suggested-by: Tim Deegan <tim@xen.org>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Tim Deegan <tim@xen.org>

commit b8c7758ce299d95e6791232809654a98472974a4
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Dec 20 10:04:48 2017 +0100

    x86/shadow: remove pointless loops over all vCPU-s
    
    The vCPU count can be had more directly.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Tim Deegan <tim@xen.org>

commit 143309a85bd8e7d1781ac45c90eef8e0be4152de
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Dec 20 10:04:16 2017 +0100

    x86/shadow: drop further 32-bit relics
    
    PV guests don't ever get shadowed in other than 4-level mode anymore;
    commit 5a3ce8f85e ("x86/shadow: drop stray name tags from
    sh_{guest_get,map}_eff_l1e()") didn't go quite fare enough (and there's
    a good chance that further cleanup opportunity exists, which I simply
    didn't notice).
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Tim Deegan <tim@xen.org>

commit 40b75c1d79e648caae24134e8e6319328be13d1b
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Dec 20 10:03:20 2017 +0100

    x86: introduce NOP9 forms
    
    Both Intel and AMD recommend an operand-size-override-prefixed long NOP
    form for covering 9 bytes, so introduce this and use it in p6_nops[] to
    allow further reducing the number of NOPs needed when covering larger
    ranges.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit d7128e735031bde3efcde2dc4e7731f723f9ba60
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Dec 20 10:02:53 2017 +0100

    x86: improve NOP use for AMD CPUs
    
    For Fam10 and later AMD recommends using the "long" NOP forms. Re-write
    the present Intel code into switch() statements and add AMD logic.
    
    Default to "long" forms (which all 64-bit CPUs are supposed to
    recognize), overriding to the K8 flavor on those few (older) CPUs.
    
    This at the same time brings us in line again in this regard with
    current Linux.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit b0e59e9eaa568580ff067a25fe4f0c333e6f6e60
Author: Yi Sun <yi.y.sun@linux.intel.com>
Date:   Tue Dec 19 02:49:00 2017 +0100

    x86: implement set value flow for MBA
    
    This patch implements set value flow for MBA including its callback
    function and domctl interface.
    
    Signed-off-by: Yi Sun <yi.y.sun@linux.intel.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 28f969df0c8fd5cea75aee308b53a8f039c4fc1c
Author: Yi Sun <yi.y.sun@linux.intel.com>
Date:   Tue Dec 19 02:49:00 2017 +0100

    x86: implement get value interface for MBA
    
    This patch implements get value domctl interface for MBA.
    
    Signed-off-by: Yi Sun <yi.y.sun@linux.intel.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit d64ac4d5f2e63f8b7e992c1194871b6d29338078
Author: Yi Sun <yi.y.sun@linux.intel.com>
Date:   Tue Dec 19 02:50:00 2017 +0100

    x86: implement get hw info flow for MBA
    
    This patch implements get HW info flow for MBA including its callback
    function and sysctl interface.
    
    Signed-off-by: Yi Sun <yi.y.sun@linux.intel.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit d02ff298f6137a2612339d45183fcfc6847c8f05
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Wed Dec 20 10:00:16 2017 +0100

    x86/dom0: remove is_pv_domain leftovers from the PV domain builder
    
    Those where added when PVHv1 was sharing the domain builder with PV.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit c2b0dd94548893cacda6e78d9125963d440ea870
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Wed Dec 20 09:59:21 2017 +0100

    x86/dom0: remove autotranslate leftovers
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)


--===============4558396501712663824==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4558396501712663824==--
