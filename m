From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable-smoke test] 118359: tolerable all pass -
	PUSHED
Date: Fri, 26 Jan 2018 13:38:25 +0000
Message-ID: <osstest-118359-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1694923596511491593=="
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

--===============1694923596511491593==
Content-Type: text/plain

flight 118359 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/118359/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  76dcdb75b7cc9e7e8470e711db14bbbd3ae92415
baseline version:
 xen                  2375832c7e51b67f076e6b07854c4a541cb4bdc3

Last test of basis   118326  2018-01-25 11:01:28 Z    1 days
Failing since        118327  2018-01-25 13:01:30 Z    1 days   11 attempts
Testing same since   118359  2018-01-26 12:01:28 Z    0 days    1 attempts

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
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
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


Pushing revision :

To xenbits.xen.org:/home/xen/git/xen.git
   2375832c7e..76dcdb75b7  76dcdb75b7cc9e7e8470e711db14bbbd3ae92415 -> smoke


--===============1694923596511491593==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1694923596511491593==--
