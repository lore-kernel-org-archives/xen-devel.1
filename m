From: osstest service owner <osstest-admin@xenproject.org>
Subject: [libvirt test] 121339: regressions - FAIL
Date: Fri, 30 Mar 2018 15:27:06 +0000
Message-ID: <osstest-121339-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0595602862394534194=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wykb=gu=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1f1vvr-0006OB-Kx
 for xen-devel@lists.xenproject.org; Fri, 30 Mar 2018 15:27:11 +0000
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

--===============0595602862394534194==
Content-Type: text/plain

flight 121339 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/121339/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-libvirt-xsm 16 guest-start/debian.repeat fail REGR. vs. 121310

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 121310
 test-armhf-armhf-libvirt-xsm 14 saverestore-support-check    fail  like 121310
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 121310
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt     14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-qcow2 12 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-qcow2 13 saverestore-support-check    fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass

version targeted for testing:
 libvirt              17f223d1aa82286ed7e4e7ff06330721e5759e59
baseline version:
 libvirt              5bb07527c11a6123e044a5dfc48bdeccee144994

Last test of basis   121310  2018-03-27 06:52:42 Z    3 days
Testing same since   121339  2018-03-29 04:26:05 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Daniel P. Berrangé <berrange@redhat.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-armhf-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-armhf-armhf-libvirt-xsm                                 fail    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-libvirt                                     pass    
 test-arm64-arm64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-arm64-arm64-libvirt-qcow2                               pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    


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
commit 17f223d1aa82286ed7e4e7ff06330721e5759e59
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Wed Mar 28 16:11:53 2018 +0100

    remote: remove outdated comment about Solaris
    
    When removing a conditional in:
    
      commit da1ade7a52e040192c5e9396c15ec9225a0a2c48
      Author: Daniel P. Berrangé <berrange@redhat.com>
      Date:   Fri Mar 23 10:50:59 2018 +0000
    
        remote: remove some __sun conditionals
    
    the corresponding comment was mistakenly left behind.
    
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>


--===============0595602862394534194==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0595602862394534194==--
