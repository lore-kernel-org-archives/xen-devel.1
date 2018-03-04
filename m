From: osstest service owner <osstest-admin@xenproject.org>
Subject: [qemu-mainline test] 120146: regressions - trouble:
	blocked/broken/fail/pass
Date: Sun, 04 Mar 2018 13:29:36 +0000
Message-ID: <osstest-120146-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4309021869439176896=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=auwy=f2=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1esTi2-0001UV-GH
 for xen-devel@lists.xenproject.org; Sun, 04 Mar 2018 13:29:50 +0000
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

--===============4309021869439176896==
Content-Type: text/plain

flight 120146 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/120146/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-xsm    <job status>           broken
 test-amd64-amd64-xl-credit2     <job status>                 broken
 test-amd64-i386-qemuu-rhel6hvm-amd    <job status>                 broken
 test-amd64-amd64-amd64-pvgrub    <job status>                 broken
 test-amd64-amd64-libvirt-xsm    <job status>                 broken
 test-amd64-i386-xl-qemuu-debianhvm-amd64-xsm    <job status>            broken
 test-amd64-i386-xl-qemuu-debianhvm-amd64-xsm 4 host-install(4) broken REGR. vs. 120095
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-xsm 4 host-install(4) broken REGR. vs. 120095
 test-amd64-amd64-xl-credit2   4 host-install(4)        broken REGR. vs. 120095
 test-amd64-amd64-amd64-pvgrub  4 host-install(4)       broken REGR. vs. 120095
 test-amd64-amd64-libvirt-xsm  4 host-install(4)        broken REGR. vs. 120095
 test-amd64-i386-qemuu-rhel6hvm-amd  4 host-install(4)  broken REGR. vs. 120095
 build-i386-libvirt            6 libvirt-build            fail REGR. vs. 120095

Tests which did not succeed, but are not blocking:
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-xsm 14 saverestore-support-check    fail  like 120095
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 120095
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 120095
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 120095
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 120095
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 120095
 test-amd64-amd64-xl-pvhv2-intel 12 guest-start                 fail never pass
 test-amd64-amd64-xl-pvhv2-amd 12 guest-start                  fail  never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-xsm      13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-win10-i386 10 windows-install         fail never pass
 test-amd64-amd64-xl-qemuu-win10-i386 10 windows-install        fail never pass

version targeted for testing:
 qemuu                427cbc7e4136a061628cb4315cc8182ea36d772f
baseline version:
 qemuu                6697439794f72b3501ee16bb95d16854f9981421

Last test of basis   120095  2018-02-28 13:46:33 Z    3 days
Testing same since   120146  2018-03-02 10:10:57 Z    2 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alex Bennée <alex.bennee@linaro.org>
  Alistair Francis <alistair.francis@xilinx.com>
  Alistair Francis <alistair@alistair23.me>
  Christian Borntraeger <borntraeger@de.ibm.com>
  Collin L. Walling <walling@linux.vnet.ibm.com>
  Corey Minyard <cminyard@mvista.com>
  Cornelia Huck <cohuck@redhat.com>
  David Hildenbrand <david@redhat.com>
  Dr. David Alan Gilbert <dgilbert@redhat.com>
  Fam Zheng <famz@redhat.com>
  Francisco Iglesias <frasse.iglesias@gmail.com>
  Gonglei <arei.gonglei@huawei.com>
  Greg Kurz <groug@kaod.org>
  Halil Pasic <pasic@linux.vnet.ibm.com>
  Jan Kiszka <jan.kiszka@siemens.com>
  Janosch Frank <frankja@linux.vnet.ibm.com>
  Jay Zhou <jianjay.zhou@huawei.com>
  Jia He <hejianet@gmail.com>
  Jia He <jia.he@hxt-semitech.com>
  Kashyap Chamarthy <kchamart@redhat.com>
  Linus Walleij <linus.walleij@linaro.org>
  linzhecheng <linzhecheng@huawei.com>
  Longpeng(Mike) <longpeng2@huawei.com>
  Luiz Capitulino <lcapitulino@redhat.com>
  Marc-André Lureau <marcandre.lureau@redhat.com>
  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
  Matthew Rosato <mjrosato@linux.vnet.ibm.com>
  Michael S. Tsirkin <mst@redhat.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Peter Maydell <peter.maydell@linaro.org>
  Stefan Berger <stefanb@linux.vnet.ibm.com>
  Thomas Huth <thuth@redhat.com>
  Tomáš Golembiovský <tgolembi@redhat.com>
  Viktor Mihajlovski <mihajlov@linux.vnet.ibm.com>

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
 build-i386-libvirt                                           fail    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-xsm                broken  
 test-amd64-i386-xl-qemuu-debianhvm-amd64-xsm                 broken  
 test-amd64-amd64-libvirt-xsm                                 broken  
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-armhf-armhf-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  blocked 
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-armhf-armhf-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                fail    
 test-amd64-i386-qemuu-rhel6hvm-amd                           broken  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit2                                  broken  
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-xl-qemuu-win10-i386                         fail    
 test-amd64-i386-xl-qemuu-win10-i386                          fail    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              fail    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      blocked 
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 blocked 
 test-amd64-amd64-amd64-pvgrub                                broken  
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-xl-vhd                                      pass    


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

broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64-xsm broken
broken-job test-amd64-amd64-xl-credit2 broken
broken-job test-amd64-i386-qemuu-rhel6hvm-amd broken
broken-job test-amd64-amd64-amd64-pvgrub broken
broken-job test-amd64-amd64-libvirt-xsm broken
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64-xsm broken
broken-step test-amd64-i386-xl-qemuu-debianhvm-amd64-xsm host-install(4)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-amd64-xsm host-install(4)
broken-step test-amd64-amd64-xl-credit2 host-install(4)
broken-step test-amd64-amd64-amd64-pvgrub host-install(4)
broken-step test-amd64-amd64-libvirt-xsm host-install(4)
broken-step test-amd64-i386-qemuu-rhel6hvm-amd host-install(4)

Not pushing.

(No revision log; it would be 1814 lines long.)


--===============4309021869439176896==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4309021869439176896==--
