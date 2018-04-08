From: Platform Team regression test user <citrix-osstest@xenproject.org>
Subject: [xen-unstable baseline-only test] 74558: regressions -
 trouble: blocked/broken/fail/pass
Date: Sun, 8 Apr 2018 14:39:18 +0100
Message-ID: <osstest-74558-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0785442059008891710=="
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

--===============0785442059008891710==
Content-Type: text/plain

This run is configured for baseline tests only.

flight 74558 xen-unstable real [real]
http://osstest.xs.citrite.net/~osstest/testlogs/logs/74558/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64                     <job status>                 broken
 test-amd64-amd64-pair           <job status>                 broken
 test-amd64-amd64-xl-qemut-win10-i386    <job status>                 broken
 test-xtf-amd64-amd64-4          <job status>                 broken
 test-xtf-amd64-amd64-3          <job status>                 broken
 test-amd64-amd64-xl-qemut-debianhvm-amd64-xsm    <job status>           broken
 build-arm64-xsm                 <job status>                 broken
 test-xtf-amd64-amd64-2          <job status>                 broken
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-xsm    <job status>           broken
 test-amd64-amd64-pygrub         <job status>                 broken
 test-amd64-amd64-xl-qemuu-win7-amd64    <job status>                 broken
 test-amd64-amd64-xl-credit2     <job status>                 broken
 test-amd64-amd64-migrupgrade    <job status>                 broken
 test-amd64-amd64-xl-xsm         <job status>                 broken
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm    <job status>   broken
 test-amd64-amd64-libvirt-xsm    <job status>                 broken
 test-amd64-amd64-xl-qemuu-ovmf-amd64    <job status>                 broken
 build-arm64-pvops               <job status>                 broken
 test-amd64-amd64-xl-qemut-debianhvm-amd64    <job status>               broken
 test-amd64-amd64-libvirt        <job status>                 broken
 test-amd64-amd64-xl             <job status>                 broken
 test-amd64-amd64-libvirt      4 host-install(4)         broken REGR. vs. 74552
 test-xtf-amd64-amd64-4        4 host-install(4)         broken REGR. vs. 74552
 test-amd64-amd64-libvirt-xsm  4 host-install(4)         broken REGR. vs. 74552
 test-xtf-amd64-amd64-3        4 host-install(4)         broken REGR. vs. 74552
 test-xtf-amd64-amd64-2        4 host-install(4)         broken REGR. vs. 74552
 test-amd64-i386-qemut-rhel6hvm-intel 10 redhat-install    fail REGR. vs. 74552

Tests which did not succeed, but are not blocking:
 build-arm64-libvirt           1 build-check(1)               blocked  n/a
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-debianhvm-amd64-xsm 4 host-install(4) broken like 74552
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 4 host-install(4) broken like 74552
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-xsm 4 host-install(4) broken like 74552
 test-amd64-amd64-xl-xsm       4 host-install(4)              broken like 74552
 test-amd64-amd64-migrupgrade  4 host-install/src_host(4)     broken like 74552
 test-amd64-amd64-migrupgrade  5 host-install/dst_host(5)     broken like 74552
 test-amd64-amd64-xl-qemuu-ovmf-amd64  4 host-install(4)      broken like 74552
 test-amd64-amd64-xl-qemuu-win7-amd64  4 host-install(4)      broken like 74552
 test-amd64-amd64-xl           4 host-install(4)              broken like 74552
 test-amd64-amd64-xl-qemut-debianhvm-amd64  4 host-install(4) broken like 74552
 test-amd64-amd64-xl-qemut-win10-i386  4 host-install(4)      broken like 74552
 test-amd64-amd64-pygrub       4 host-install(4)              broken like 74552
 test-amd64-amd64-pair         4 host-install/src_host(4)     broken like 74552
 test-amd64-amd64-pair         5 host-install/dst_host(5)     broken like 74552
 test-amd64-amd64-xl-credit2   4 host-install(4)              broken like 74552
 test-amd64-amd64-examine      5 host-install                 broken like 74552
 build-arm64-xsm               2 hosts-allocate               broken never pass
 build-arm64                   2 hosts-allocate               broken never pass
 build-arm64-xsm               3 capture-logs                 broken never pass
 build-arm64                   3 capture-logs                 broken never pass
 build-arm64-pvops             2 hosts-allocate               broken never pass
 build-arm64-pvops             3 capture-logs                 broken never pass
 test-amd64-amd64-xl-qemut-win7-amd64 16 guest-localmigrate/x10 fail blocked in 74552
 test-amd64-amd64-xl-qemuu-win10-i386 10 windows-install        fail like 74552
 test-amd64-i386-xl-qemuu-win10-i386 10 windows-install         fail like 74552
 test-armhf-armhf-libvirt     12 guest-start                  fail   like 74552
 test-armhf-armhf-libvirt-xsm 12 guest-start                  fail   like 74552
 test-armhf-armhf-xl-rtds     12 guest-start                  fail   like 74552
 test-armhf-armhf-xl          12 guest-start                  fail   like 74552
 test-armhf-armhf-xl-xsm      12 guest-start                  fail   like 74552
 test-armhf-armhf-xl-multivcpu 12 guest-start                  fail  like 74552
 test-armhf-armhf-xl-midway   12 guest-start                  fail   like 74552
 test-armhf-armhf-xl-credit2  12 guest-start                  fail   like 74552
 test-amd64-amd64-qemuu-nested-intel 14 xen-boot/l1             fail like 74552
 test-armhf-armhf-xl-vhd      10 debian-di-install            fail   like 74552
 test-armhf-armhf-libvirt-raw 10 debian-di-install            fail   like 74552
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop              fail like 74552
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop              fail like 74552
 test-amd64-amd64-examine      4 memdisk-try-append           fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-xl-pvhv2-intel 12 guest-start                 fail never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 10 windows-install         fail never pass
 test-amd64-amd64-xl-pvhv2-amd 12 guest-start                  fail  never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-i386-xl-qemut-win10-i386 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop             fail never pass

version targeted for testing:
 xen                  451004603247205467ec34b366b4cfa3814a5d95
baseline version:
 xen                  eabb83121226d5a6a5a68da3a913ac0b5bb1e0cf

Last test of basis    74552  2018-04-06 11:27:52 Z    2 days
Testing same since    74558  2018-04-07 18:31:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alexandru Isaila <aisaila@bitdefender.com>
  Andre Przywara <andre.przywara@linaro.org>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Andrii Anisov <andrii_anisov@epam.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Boris Ostrovsky <boris.ostrovsky@oracle.com>
  Daniel De Graaf <dgdegra@tycho.nsa.gov>
  Daniel De Graaf <dgegra@tycho.nsa.gov>
  Doug Goldstein <cardoe@cardoe.com>
  George Dunlap <george.dunlap@citrix.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <julien.grall@arm.com>
  Maran Wilson <maran.wilson@oracle.com>
  Olaf Hering <olaf@aepfle.de>
  Paul Durrant <paul.durrant@citrix.com>
  Petre Pircalabu <ppircalabu@bitdefender.com>
  Razvan Cojocaru <rcojocaru@bitdefender.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Sergey Dyasli <sergey.dyasli@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano@aporeto.com>
  Tamas K Lengyel <tamas@tklengyel.com>
  Wei Liu <wei.liu2@citrix.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              broken  
 build-armhf-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  broken  
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          blocked 
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-prev                                             pass    
 build-i386-prev                                              pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            broken  
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 build-amd64-rumprun                                          pass    
 build-i386-rumprun                                           pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       broken  
 test-xtf-amd64-amd64-3                                       broken  
 test-xtf-amd64-amd64-4                                       broken  
 test-xtf-amd64-amd64-5                                       pass    
 test-amd64-amd64-xl                                          broken  
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          fail    
 test-amd64-i386-xl                                           pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64-xsm                broken  
 test-amd64-i386-xl-qemut-debianhvm-amd64-xsm                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-xsm                broken  
 test-amd64-i386-xl-qemuu-debianhvm-amd64-xsm                 pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        broken  
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-libvirt-xsm                                 broken  
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-armhf-armhf-libvirt-xsm                                 fail    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      broken  
 test-arm64-arm64-xl-xsm                                      blocked 
 test-armhf-armhf-xl-xsm                                      fail    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                fail    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    broken  
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         broken  
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-rumprun-amd64                               pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-i386-xl-qemut-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         broken  
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-amd64-amd64-xl-credit2                                  broken  
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  fail    
 test-amd64-amd64-examine                                     fail    
 test-arm64-arm64-examine                                     blocked 
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-i386-rumprun-i386                                 pass    
 test-amd64-amd64-xl-qemut-win10-i386                         broken  
 test-amd64-i386-xl-qemut-win10-i386                          fail    
 test-amd64-amd64-xl-qemuu-win10-i386                         fail    
 test-amd64-i386-xl-qemuu-win10-i386                          fail    
 test-amd64-amd64-qemuu-nested-intel                          fail    
 test-amd64-amd64-xl-pvhv2-intel                              fail    
 test-amd64-i386-qemut-rhel6hvm-intel                         fail    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-libvirt                                     broken  
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-armhf-armhf-xl-midway                                   fail    
 test-amd64-amd64-migrupgrade                                 broken  
 test-amd64-i386-migrupgrade                                  pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        broken  
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-pygrub                                      broken  
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-xl-vhd                                      fail    


------------------------------------------------------------
sg-report-flight on osstest.xs.citrite.net
logs: /home/osstest/logs
images: /home/osstest/images

Logs, config files, etc. are available at
    http://osstest.xs.citrite.net/~osstest/testlogs/logs

Test harness code can be found at
    http://xenbits.xensource.com/gitweb?p=osstest.git;a=summary

broken-job build-arm64 broken
broken-job test-amd64-amd64-pair broken
broken-job test-amd64-amd64-xl-qemut-win10-i386 broken
broken-job test-xtf-amd64-amd64-4 broken
broken-job test-xtf-amd64-amd64-3 broken
broken-job test-amd64-amd64-xl-qemut-debianhvm-amd64-xsm broken
broken-job build-arm64-xsm broken
broken-job test-xtf-amd64-amd64-2 broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64-xsm broken
broken-job test-amd64-amd64-pygrub broken
broken-job test-amd64-amd64-xl-qemuu-win7-amd64 broken
broken-job test-amd64-amd64-xl-credit2 broken
broken-job test-amd64-amd64-migrupgrade broken
broken-job test-amd64-amd64-xl-xsm broken
broken-job test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm broken
broken-job test-amd64-amd64-libvirt-xsm broken
broken-job test-amd64-amd64-xl-qemuu-ovmf-amd64 broken
broken-job build-arm64-pvops broken
broken-job test-amd64-amd64-xl-qemut-debianhvm-amd64 broken
broken-job test-amd64-amd64-libvirt broken
broken-job test-amd64-amd64-xl broken
broken-step build-arm64-xsm hosts-allocate
broken-step build-arm64 hosts-allocate
broken-step build-arm64-xsm capture-logs
broken-step build-arm64 capture-logs
broken-step build-arm64-pvops hosts-allocate
broken-step build-arm64-pvops capture-logs
broken-step test-amd64-amd64-xl-qemut-debianhvm-amd64-xsm host-install(4)
broken-step test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm host-install(4)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-amd64-xsm host-install(4)
broken-step test-amd64-amd64-xl-xsm host-install(4)
broken-step test-amd64-amd64-migrupgrade host-install/src_host(4)
broken-step test-amd64-amd64-migrupgrade host-install/dst_host(5)
broken-step test-amd64-amd64-libvirt host-install(4)
broken-step test-amd64-amd64-xl-qemuu-ovmf-amd64 host-install(4)
broken-step test-amd64-amd64-xl-qemuu-win7-amd64 host-install(4)
broken-step test-amd64-amd64-xl host-install(4)
broken-step test-amd64-amd64-xl-qemut-debianhvm-amd64 host-install(4)
broken-step test-amd64-amd64-xl-qemut-win10-i386 host-install(4)
broken-step test-amd64-amd64-pygrub host-install(4)
broken-step test-amd64-amd64-pair host-install/src_host(4)
broken-step test-xtf-amd64-amd64-4 host-install(4)
broken-step test-amd64-amd64-pair host-install/dst_host(5)
broken-step test-amd64-amd64-xl-credit2 host-install(4)
broken-step test-amd64-amd64-examine host-install
broken-step test-amd64-amd64-libvirt-xsm host-install(4)
broken-step test-xtf-amd64-amd64-3 host-install(4)
broken-step test-xtf-amd64-amd64-2 host-install(4)

Push not applicable.

(No revision log; it would be 1330 lines long.)


--===============0785442059008891710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0785442059008891710==--
