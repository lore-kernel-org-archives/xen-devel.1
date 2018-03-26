From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable-smoke test] 121297: regressions - FAIL
Date: Mon, 26 Mar 2018 15:56:57 +0000
Message-ID: <osstest-121297-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1330895677257490427=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dgdy=gq=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1f0UUX-0004RJ-8A
 for xen-devel@lists.xenproject.org; Mon, 26 Mar 2018 15:57:01 +0000
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

--===============1330895677257490427==
Content-Type: text/plain

flight 121297 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/121297/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                   6 xen-build                fail REGR. vs. 121090

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  9f5b0ce10b2895b4136c9e5c5ebd0aebac31ea98
baseline version:
 xen                  eabb83121226d5a6a5a68da3a913ac0b5bb1e0cf

Last test of basis   121090  2018-03-23 17:09:54 Z    2 days
Testing same since   121297  2018-03-26 14:01:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Roger Pau Monné <roger.pau@citrix.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  fail    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          blocked 
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
commit 9f5b0ce10b2895b4136c9e5c5ebd0aebac31ea98
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Mon Mar 26 15:17:12 2018 +0200

    vpci/msix: fix incorrect usage of bitmask
    
    The bitmask to clear the low bits of the address field should be
    ~0xffffffffull, the current mask clears both the low and the high bits
    of the address field, which is a bug.
    
    Reported-by: Coverity
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 91a8ffe3d1bc43498b76abb63d2dfb078dd5bd01
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Mon Mar 26 15:16:14 2018 +0200

    vpci/bars: fix error message
    
    Error message is incorrectly using map when it should be using
    map->map instead.
    
    Coverity ID: 1430811
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)


--===============1330895677257490427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1330895677257490427==--
