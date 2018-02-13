From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable-smoke test] 119108: regressions - FAIL
Date: Tue, 13 Feb 2018 21:58:06 +0000
Message-ID: <osstest-119108-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1025570533381607986=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=sc7k=fh=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1eliah-0007sP-7L
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2018 21:58:19 +0000
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

--===============1025570533381607986==
Content-Type: text/plain

flight 119108 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/119108/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 119098

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-debianhvm-i386  1 build-check(1)         blocked n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  e139d34a1c4b7775d5855458a325e0e4176bdf7e
baseline version:
 xen                  3f491d6873be9caa77f02ad8d98f174f0152b819

Last test of basis   119098  2018-02-13 17:01:30 Z    0 days
Testing same since   119108  2018-02-13 20:01:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>

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
commit e139d34a1c4b7775d5855458a325e0e4176bdf7e
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Feb 13 18:19:33 2018 +0100

    firmware/shim: correctly handle errors during Xen tree setup
    
    "set -e" on a separate Makefile line is meaningless. Glue together all
    the lines that this is supposed to cover.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Wei Liu <wei.liu2@citrix.com>
(qemu changes not included)


--===============1025570533381607986==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1025570533381607986==--
