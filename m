From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable-smoke test] 120126: regressions - FAIL
Date: Thu, 01 Mar 2018 17:55:34 +0000
Message-ID: <osstest-120126-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2031271618262508756=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=1os/=fx=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1erSQi-0000L1-Ei
 for xen-devel@lists.xenproject.org; Thu, 01 Mar 2018 17:55:44 +0000
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

--===============2031271618262508756==
Content-Type: text/plain

flight 120126 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/120126/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl           7 xen-boot                 fail REGR. vs. 120107

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  301e96ea1f1b115481204826953f4d341774c0a8
baseline version:
 xen                  85688075ccc22c12bd0fca2a2c269199938e104c

Last test of basis   120107  2018-03-01 00:02:11 Z    0 days
Testing same since   120126  2018-03-01 15:01:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Roger Pau Monné <roger.pau@citrix.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          fail    
 test-arm64-arm64-xl-xsm                                      pass    
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
commit 301e96ea1f1b115481204826953f4d341774c0a8
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Mar 1 15:14:29 2018 +0100

    x86/PV: convert page table emulation code from paddr_t to intpte_t
    
    It's dealing with PTEs after all.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 3f9b01d651c1f5466b59d85ac05fa85e4a4c6b54
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Mar 1 15:11:45 2018 +0100

    x86emul: make all FPU emulation use the stub
    
    While this means quite some reduction of (source) code, the main
    purpose is to no longer have exceptions raised from other than stubs.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 93de8da382480ab78e83e3bfc05cebb5e5865fe3
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Thu Mar 1 15:11:07 2018 +0100

    ignores: update .hgignore
    
    To add the shim build output and build directory.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

commit cfbdaeb2e4b47e47521ade90729ba751eb47f4d1
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Thu Mar 1 15:10:54 2018 +0100

    ignores: update list of git ignored files
    
    Add the shim build symbol file and remove the xen-shim binary (which
    is no longer created).
    
    Reported-by: Olaf Hering <olaf@aepfle.de>
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

commit 4c45567d3e5a296af2ff8032cd3108f195b5eb44
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Mar 1 15:10:15 2018 +0100

    firmware/shim: better filtering of intermediate files during Xen tree setup
    
    I have no idea what *.1 is meant to cover. Instead also exclude
    preprocessed and non-source assembly files.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Wei Liu <wei.liu2@citrix.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit 3f4bc4cc2f521c572fdc4a30dd1434ef8ecd559c
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Mar 1 15:10:02 2018 +0100

    firmware/shim: better filtering of dependency files during Xen tree setup
    
    I have no idea what *.d1 is supposed to refer to - we only have .*.d
    and .*.d2 files (note also the leading dot). Also switch to passing
    -name instead of -path to find - that's a requirement for .*.d et al to
    work, but would probably have been better from the beginning.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Wei Liu <wei.liu2@citrix.com>

commit f593747666677c4c1e2e250329c64956b732e61f
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Mar 1 15:09:38 2018 +0100

    libxc: really tolerate empty PV records
    
    Commit 119ee4d773 ("tools/libxc: Tolerate specific zero-content records
    in migration v2 streams") meant tolerate those, but failed to set rc
    accordingly.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Wei Liu <wei.liu2@citrix.com>
(qemu changes not included)


--===============2031271618262508756==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2031271618262508756==--
