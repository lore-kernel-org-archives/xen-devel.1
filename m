From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable-smoke test] 119834: tolerable all pass -
	PUSHED
Date: Wed, 21 Feb 2018 20:21:16 +0000
Message-ID: <osstest-119834-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5576701842938186793=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=foxx=fp=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1eoatN-00045G-Tu
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2018 20:21:29 +0000
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

--===============5576701842938186793==
Content-Type: text/plain

flight 119834 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/119834/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  da3d180d101cf81d085f0c6560d70acd16c934bd
baseline version:
 xen                  23b40df6f098e3bcb2f105a4909860240976e40f

Last test of basis   119783  2018-02-21 02:39:03 Z    0 days
Testing same since   119834  2018-02-21 18:07:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Brian Woods <brian.woods@amd.com>
  Julien Grall <julien.grall@arm.com>
  Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
  Olaf Hering <olaf@aepfle.de>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>

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
   23b40df6f0..da3d180d10  da3d180d101cf81d085f0c6560d70acd16c934bd -> smoke


--===============5576701842938186793==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5576701842938186793==--
