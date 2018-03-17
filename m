From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable test] 120767: regressions - FAIL
Date: Sat, 17 Mar 2018 04:03:19 +0000
Message-ID: <osstest-120767-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4426084918169636299=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=tpbh=gh=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1ex345-0003Xi-QF
 for xen-devel@lists.xenproject.org; Sat, 17 Mar 2018 04:03:29 +0000
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

--===============4426084918169636299==
Content-Type: text/plain

flight 120767 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/120767/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-livepatch     7 xen-boot                 fail REGR. vs. 120037
 test-amd64-i386-xl-qemuu-debianhvm-amd64  7 xen-boot     fail REGR. vs. 120037
 test-amd64-i386-xl-qemuu-ovmf-amd64  7 xen-boot          fail REGR. vs. 120037
 test-amd64-i386-migrupgrade  11 xen-boot/dst_host        fail REGR. vs. 120037
 test-amd64-i386-libvirt       7 xen-boot                 fail REGR. vs. 120037
 test-amd64-i386-xl-qemut-debianhvm-amd64  7 xen-boot     fail REGR. vs. 120037
 test-amd64-i386-xl-qemuu-win7-amd64  7 xen-boot          fail REGR. vs. 120037
 test-amd64-i386-freebsd10-amd64  7 xen-boot              fail REGR. vs. 120037
 test-amd64-i386-xl-qemut-debianhvm-amd64-xsm  7 xen-boot fail REGR. vs. 120037
 test-amd64-i386-rumprun-i386  7 xen-boot                 fail REGR. vs. 120037
 test-amd64-i386-libvirt-xsm   7 xen-boot                 fail REGR. vs. 120037
 test-amd64-i386-examine       8 reboot                   fail REGR. vs. 120037
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 7 xen-boot fail REGR. vs. 120037
 test-amd64-i386-xl-xsm        7 xen-boot                 fail REGR. vs. 120037
 test-amd64-i386-xl-qemuu-ws16-amd64  7 xen-boot          fail REGR. vs. 120037
 test-amd64-i386-libvirt-pair 10 xen-boot/src_host        fail REGR. vs. 120037
 test-amd64-i386-libvirt-pair 11 xen-boot/dst_host        fail REGR. vs. 120037
 test-amd64-i386-xl-qemut-ws16-amd64  7 xen-boot          fail REGR. vs. 120037
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 7 xen-boot fail REGR. vs. 120037
 test-amd64-i386-xl            7 xen-boot                 fail REGR. vs. 120037
 test-amd64-i386-qemut-rhel6hvm-intel  7 xen-boot         fail REGR. vs. 120037
 test-amd64-i386-qemuu-rhel6hvm-intel  7 xen-boot         fail REGR. vs. 120037
 test-amd64-i386-xl-raw        7 xen-boot                 fail REGR. vs. 120037
 test-amd64-i386-xl-qemut-win10-i386  7 xen-boot          fail REGR. vs. 120037
 test-amd64-i386-xl-qemuu-debianhvm-amd64-xsm  7 xen-boot fail REGR. vs. 120037
 test-amd64-i386-qemuu-rhel6hvm-amd  7 xen-boot           fail REGR. vs. 120037
 test-amd64-i386-xl-qemut-win7-amd64  7 xen-boot          fail REGR. vs. 120037
 test-amd64-i386-qemut-rhel6hvm-amd  7 xen-boot           fail REGR. vs. 120037
 test-amd64-i386-freebsd10-i386  7 xen-boot               fail REGR. vs. 120037
 test-amd64-i386-pair         10 xen-boot/src_host        fail REGR. vs. 120037
 test-amd64-i386-pair         11 xen-boot/dst_host        fail REGR. vs. 120037
 test-amd64-i386-xl-qemuu-win10-i386  7 xen-boot          fail REGR. vs. 120037
 test-amd64-amd64-i386-pvgrub 10 debian-di-install        fail REGR. vs. 120037

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 120001
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 120037
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 120037
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 120037
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 120037
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 120037
 test-armhf-armhf-libvirt-xsm 14 saverestore-support-check    fail  like 120037
 test-amd64-amd64-xl-pvhv2-intel 12 guest-start                 fail never pass
 test-amd64-amd64-xl-pvhv2-amd 12 guest-start                  fail  never pass
 test-amd64-i386-xl-pvshim     7 xen-boot                     fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-xsm      13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-xl-qemut-win10-i386 10 windows-install        fail never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-amd64-amd64-xl-qemuu-win10-i386 10 windows-install        fail never pass

version targeted for testing:
 xen                  eef83fd2af0d4c78afec34c199c977fc97d8a0b3
baseline version:
 xen                  a823a5280f25ad19a751dd9a41044f556471e61a

Last test of basis   120037  2018-02-26 13:16:29 Z   18 days
Failing since        120076  2018-02-27 20:33:32 Z   17 days    9 attempts
Testing same since   120767  2018-03-14 22:11:07 Z    2 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alexandru Isaila <aisaila@bitdefender.com>
  Andre Przywara <andre.przywara@linaro.org>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Dario Faggioli <dfaggioli@suse.com>
  George Dunlap <george.dunlap@citrix.com>
  Ian Jackson <Ian.Jackson@eu.citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Jim Fehlig <jfehlig@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <julien.grall@arm.com>
  Julien Grall <julien.grall@linaro.org>
  Kevin Tian <kevin.tian@intel.com>
  Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Martin Cerveny <martin@c-home.cz>
  Meng Xu <mengxu@cis.upenn.edu>
  Olaf Hering <olaf@aepfle.de>
  Paul Semel <semelpaul@gmail.com>
  Razvan Cojocaru <rcojocaru@bitdefender.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Sergey Dyasli <sergey.dyasli@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano@aporeto.com>
  Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
  Tamas K Lengyel <tamas@tklengyel.com>
  Wei Liu <wei.liu2@citrix.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-armhf-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-prev                                             pass    
 build-i386-prev                                              pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 build-amd64-rumprun                                          pass    
 build-i386-rumprun                                           pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    
 test-amd64-amd64-xl                                          pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           fail    
 test-amd64-amd64-xl-qemut-debianhvm-amd64-xsm                pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64-xsm                 fail    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-xsm                pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-xsm                 fail    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         fail    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-armhf-armhf-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  fail    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-armhf-armhf-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       fail    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                fail    
 test-amd64-i386-qemut-rhel6hvm-amd                           fail    
 test-amd64-i386-qemuu-rhel6hvm-amd                           fail    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     fail    
 test-amd64-i386-freebsd10-amd64                              fail    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    
 test-amd64-amd64-rumprun-amd64                               pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-i386-xl-qemut-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      fail    
 test-amd64-i386-freebsd10-i386                               fail    
 test-amd64-i386-rumprun-i386                                 fail    
 test-amd64-amd64-xl-qemut-win10-i386                         fail    
 test-amd64-i386-xl-qemut-win10-i386                          fail    
 test-amd64-amd64-xl-qemuu-win10-i386                         fail    
 test-amd64-i386-xl-qemuu-win10-i386                          fail    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              fail    
 test-amd64-i386-qemut-rhel6hvm-intel                         fail    
 test-amd64-i386-qemuu-rhel6hvm-intel                         fail    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      fail    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    fail    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  fail    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         fail    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 fail    
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 fail    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       fail    
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


Not pushing.

(No revision log; it would be 2293 lines long.)


--===============4426084918169636299==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4426084918169636299==--
