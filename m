From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable-smoke test] 122117: regressions - FAIL
Date: Mon, 09 Apr 2018 02:57:25 +0000
Message-ID: <osstest-122117-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5718113995688803956=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lcev=g6=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1f5Mzq-0002fK-IT
 for xen-devel@lists.xenproject.org; Mon, 09 Apr 2018 02:57:30 +0000
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

--===============5718113995688803956==
Content-Type: text/plain

flight 122117 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/122117/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-xsm               6 xen-build                fail REGR. vs. 121876
 build-armhf                   6 xen-build                fail REGR. vs. 121876

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  e62e140daa393c89342f7ca19906e303ebedf8db
baseline version:
 xen                  451004603247205467ec34b366b4cfa3814a5d95

Last test of basis   121876  2018-04-05 10:04:25 Z    3 days
Failing since        121889  2018-04-05 13:02:10 Z    3 days   32 attempts
Testing same since   122036  2018-04-07 15:01:18 Z    1 days   14 attempts

------------------------------------------------------------
People who touched revisions under test:
  Amit Singh Tomar <amittomer25@gmail.com>
  Andre Przywara <andre.przywara@arm.com>
  Andre Pzywara <andre.przywara@arm.com>
  Andrew Cooper <andrew.cooper3@citrix.com>
  George Dunlap <george.dunlap@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <julien.grall@arm.com>
  Kevin Tian <kevin.tian@intel.com>
  Marcello Seri <marcello.seri@citrix.com>
  Marcus of Wetware Labs <marcus@wetwa.re>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Petre Eftime <epetre@amazon.com>
  Razvan Cojocaru <rcojocaru@bitdefender.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Tim Deegan <tim@xen.org>
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

(No revision log; it would be 712 lines long.)


--===============5718113995688803956==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5718113995688803956==--
