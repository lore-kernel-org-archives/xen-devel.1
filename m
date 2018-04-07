From: Platform Team regression test user <citrix-osstest@xenproject.org>
Subject: [xen-unstable baseline-only test] 74552: trouble:
 blocked/broken/fail/pass
Date: Sat, 7 Apr 2018 12:15:54 +0100
Message-ID: <osstest-74552-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5213616876632655230=="
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

--===============5213616876632655230==
Content-Type: text/plain

This run is configured for baseline tests only.

flight 74552 xen-unstable real [real]
http://osstest.xs.citrite.net/~osstest/testlogs/logs/74552/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-xtf-amd64-amd64-1          <job status>                 broken
 build-arm64                     <job status>                 broken
 test-amd64-amd64-pair           <job status>                 broken
 test-amd64-amd64-xl-qemut-win10-i386    <job status>                 broken
 test-amd64-amd64-qemuu-nested-amd    <job status>                 broken
 test-amd64-amd64-livepatch      <job status>                 broken
 test-amd64-amd64-xl-qemuu-debianhvm-amd64    <job status>               broken
 test-amd64-amd64-xl-qemut-debianhvm-amd64-xsm    <job status>           broken
 build-arm64-xsm                 <job status>                 broken
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-xsm    <job status>           broken
 test-amd64-amd64-pygrub         <job status>                 broken
 test-amd64-amd64-xl-rtds        <job status>                 broken
 test-amd64-amd64-xl-qemut-win7-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemuu-win7-amd64    <job status>                 broken
 test-amd64-amd64-xl-credit2     <job status>                 broken
 test-amd64-amd64-migrupgrade    <job status>                 broken
 test-amd64-amd64-xl-xsm         <job status>                 broken
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm    <job status>   broken
 test-amd64-amd64-i386-pvgrub    <job status>                 broken
 test-amd64-amd64-xl-qemuu-ovmf-amd64    <job status>                 broken
 test-amd64-amd64-amd64-pvgrub    <job status>                 broken
 test-amd64-amd64-rumprun-amd64    <job status>                 broken
 build-arm64-pvops               <job status>                 broken
 test-amd64-amd64-xl-qemut-debianhvm-amd64    <job status>               broken
 test-amd64-amd64-xl-multivcpu    <job status>                 broken
 test-amd64-amd64-xl             <job status>                 broken
 test-amd64-amd64-xl-qcow2       <job status>                 broken

Tests which did not succeed, but are not blocking:
 build-arm64-libvirt           1 build-check(1)               blocked  n/a
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-rumprun-amd64  4 host-install(4)     broken baseline untested
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 4 host-install(4) broken baseline untested
 test-amd64-amd64-xl-xsm       4 host-install(4)       broken baseline untested
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-xsm 4 host-install(4) broken baseline untested
 test-amd64-amd64-xl-qemut-debianhvm-amd64-xsm 4 host-install(4) broken baseline untested
 test-amd64-amd64-migrupgrade 4 host-install/src_host(4) broken baseline untested
 test-amd64-amd64-migrupgrade 5 host-install/dst_host(5) broken baseline untested
 test-amd64-amd64-xl-rtds      4 host-install(4)       broken baseline untested
 test-amd64-amd64-amd64-pvgrub  4 host-install(4)      broken baseline untested
 test-amd64-amd64-i386-pvgrub  4 host-install(4)       broken baseline untested
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 4 host-install(4) broken baseline untested
 test-amd64-amd64-qemuu-nested-amd  4 host-install(4)  broken baseline untested
 test-amd64-amd64-xl-qemuu-ovmf-amd64 4 host-install(4) broken baseline untested
 test-amd64-amd64-xl-qemuu-win7-amd64 4 host-install(4) broken baseline untested
 test-amd64-amd64-xl           4 host-install(4)       broken baseline untested
 test-xtf-amd64-amd64-1        4 host-install(4)       broken baseline untested
 test-amd64-amd64-xl-qcow2     4 host-install(4)       broken baseline untested
 test-amd64-amd64-xl-qemut-debianhvm-amd64 4 host-install(4) broken baseline untested
 test-amd64-amd64-livepatch    4 host-install(4)       broken baseline untested
 test-amd64-amd64-xl-qemut-win10-i386 4 host-install(4) broken baseline untested
 test-amd64-amd64-pygrub       4 host-install(4)       broken baseline untested
 test-amd64-amd64-pair      4 host-install/src_host(4) broken baseline untested
 test-amd64-amd64-pair      5 host-install/dst_host(5) broken baseline untested
 test-amd64-amd64-xl-credit2   4 host-install(4)       broken baseline untested
 test-amd64-amd64-xl-qemut-win7-amd64 4 host-install(4) broken baseline untested
 test-amd64-amd64-xl-multivcpu  4 host-install(4)      broken baseline untested
 test-amd64-amd64-examine      5 host-install          broken baseline untested
 build-arm64-xsm               2 hosts-allocate               broken never pass
 build-arm64                   2 hosts-allocate               broken never pass
 build-arm64-xsm               3 capture-logs                 broken never pass
 build-arm64                   3 capture-logs                 broken never pass
 build-arm64-pvops             2 hosts-allocate               broken never pass
 build-arm64-pvops             3 capture-logs                 broken never pass
 test-amd64-amd64-xl-qemuu-win10-i386 10 windows-install fail baseline untested
 test-amd64-i386-xl-qemuu-win10-i386 10 windows-install  fail baseline untested
 test-armhf-armhf-xl-rtds     12 guest-start             fail baseline untested
 test-armhf-armhf-xl-multivcpu 12 guest-start            fail baseline untested
 test-armhf-armhf-xl-midway   12 guest-start             fail baseline untested
 test-armhf-armhf-libvirt     12 guest-start             fail baseline untested
 test-armhf-armhf-xl-xsm      12 guest-start             fail baseline untested
 test-armhf-armhf-libvirt-xsm 12 guest-start             fail baseline untested
 test-armhf-armhf-xl          12 guest-start             fail baseline untested
 test-armhf-armhf-xl-credit2  12 guest-start             fail baseline untested
 test-amd64-amd64-qemuu-nested-intel 14 xen-boot/l1      fail baseline untested
 test-armhf-armhf-xl-vhd      10 debian-di-install       fail baseline untested
 test-armhf-armhf-libvirt-raw 10 debian-di-install       fail baseline untested
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop       fail baseline untested
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop       fail baseline untested
 test-amd64-amd64-examine      4 memdisk-try-append           fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-xl-pvhv2-intel 12 guest-start                 fail never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 10 windows-install         fail never pass
 test-amd64-amd64-xl-pvhv2-amd 12 guest-start                  fail  never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-amd64-i386-xl-qemut-win10-i386 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop             fail never pass

version targeted for testing:
 xen                  eabb83121226d5a6a5a68da3a913ac0b5bb1e0cf
baseline version:
 xen                  ec320542e4f4de12305551ef5e3cd4d2ced85771

Last test of basis    72976  2017-12-18 00:21:58 Z  110 days
Testing same since    74552  2018-04-06 11:27:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Acked-by: Razvan Cojocaru <rcojocaru@bitdefender.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Alan Robinson <Alan.Robinson@ts.fujitsu.com>
  Alexandru Isaila <aisaila@bitdefender.com>
  Amit Singh Tomar <amittomer25@gmail.com>
  Andre Przywara <andre.przywara@arm.com>
  Andre Przywara <andre.przywara@linaro.org>
  Andrew Cooper <andrew.cooper3@citix.com>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Andrew Cooper <andrew.cooper@citrix.com>
  Andrew Morton <akpm@linux-foundation.org>
  Anthony Liguori <aliguori@amazon.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Bob Moore <robert.moore@intel.com>
  Boris Ostrovsky <boris.ostrovsky@oracle.com>
  Brian Woods <brian.woods@amd.com>
  Christian Lindig <christian.lindig@citrix.com>
  Daniel De Graaf <dgdegra@tycho.nsa.gov>
  Daniel Kiper <daniel.kiper@oracle.com>
  Dario Faggioli <dfaggioli@suse.com>
  David E. Box <david.e.box@linux.intel.com>
  David Scott <dave@recoil.org>
  David Woodhouse <David.Woodhouse@intel.com>
  Doug Goldstein <cardoe@cardoe.com>
  George Dunlap <george.dunlap@citrix.com>
  Haozhong Zhang <haozhong.zhang@intel.com>
  Ian Jackson <Ian.Jackson@eu.citrix.com>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Jan H. Schönherr <jschoenh@amazon.de>
  Jim Fehlig <jfehlig@suse.com>
  Joe Jin <joe.jin@oracle.com>
  John Thomson <git@johnthomson.fastmail.com.au>
  Jon Ludlam <jonathan.ludlam@citrix.com>
  Jonathan Ludlam <jonathan.ludlam@citrix.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <julien.grall@arm.com>
  Julien Grall <julien.grall@linaro.org>
  Kevin Tian <kevin.tian@intel.com>
  Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
  Len Brown <len.brown@intel.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Liran Alon <liran.alon@oracle.com>
  Lv Zheng <lv.zheng@intel.com>
  Marc Zyngier <marc.zyngier@arm.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Martin Cerveny <martin@c-home.cz>
  Meng Xu <mengxu@cis.upenn.edu>
  Michael Young <m.a.young@durham.ac.uk>
  Michel Lespinasse <walken@google.com>
  Olaf Hering <olaf@aepfle.de>
  Oleksandr Grytsov <oleksandr_grytsov@epam.com>
  Paul Durrant <paul.durrant@citrix.com>
  Paul Semel <semelpaul@gmail.com>
  Peter Zijlstra <a.p.zijlstra@chello.nl>
  Praveen Kumar <kpraveen.lkml@gmail.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Razvan Cojocaru <rcojocaru@bitdefender.com>
  Rik van Riel <riel@redhat.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Ross Lagerwall <ross.lagerwall@citrix.com>
  Sameer Goel <sameer.goel@linaro.org>
  Sergey Dyasli <sergey.dyasli@citrix.com>
  Simon Gaiser <simon@invisiblethingslab.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano@aporeto.com>
  Stephen Rothwell <sfr@canb.auug.org.au>
  Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
  Tamas K Lengyel <tamas@tklengyel.com>
  Tim Deegan <tim@xen.org>
  Uwe Dannowski <uwed@amazon.de>
  Wei Liu <wei.liu2@citrix.com>
  Wei Yang <weiyang@linux.vnet.ibm.com>
  Wolfram Strepp <wstrepp@gmx.de>
  Yi Sun <yi.y.sun@linux.intel.com>
  Zhongze Liu <blackskygg@gmail.com>

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
 test-xtf-amd64-amd64-1                                       broken  
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
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
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-armhf-armhf-libvirt-xsm                                 fail    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      broken  
 test-arm64-arm64-xl-xsm                                      blocked 
 test-armhf-armhf-xl-xsm                                      fail    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            broken  
 test-amd64-amd64-xl-pvhv2-amd                                fail    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    broken  
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    broken  
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         broken  
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-rumprun-amd64                               broken  
 test-amd64-amd64-xl-qemut-win7-amd64                         broken  
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
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-livepatch                                   broken  
 test-amd64-i386-livepatch                                    pass    
 test-armhf-armhf-xl-midway                                   fail    
 test-amd64-amd64-migrupgrade                                 broken  
 test-amd64-i386-migrupgrade                                  pass    
 test-amd64-amd64-xl-multivcpu                                broken  
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        broken  
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-amd64-pvgrub                                broken  
 test-amd64-amd64-i386-pvgrub                                 broken  
 test-amd64-amd64-pygrub                                      broken  
 test-amd64-amd64-xl-qcow2                                    broken  
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     broken  
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

broken-job test-xtf-amd64-amd64-1 broken
broken-job build-arm64 broken
broken-job test-amd64-amd64-pair broken
broken-job test-amd64-amd64-xl-qemut-win10-i386 broken
broken-job test-amd64-amd64-qemuu-nested-amd broken
broken-job test-amd64-amd64-livepatch broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64 broken
broken-job test-amd64-amd64-xl-qemut-debianhvm-amd64-xsm broken
broken-job build-arm64-xsm broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64-xsm broken
broken-job test-amd64-amd64-pygrub broken
broken-job test-amd64-amd64-xl-rtds broken
broken-job test-amd64-amd64-xl-qemut-win7-amd64 broken
broken-job test-amd64-amd64-xl-qemuu-win7-amd64 broken
broken-job test-amd64-amd64-xl-credit2 broken
broken-job test-amd64-amd64-migrupgrade broken
broken-job test-amd64-amd64-xl-xsm broken
broken-job test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm broken
broken-job test-amd64-amd64-i386-pvgrub broken
broken-job test-amd64-amd64-xl-qemuu-ovmf-amd64 broken
broken-job test-amd64-amd64-amd64-pvgrub broken
broken-job test-amd64-amd64-rumprun-amd64 broken
broken-job build-arm64-pvops broken
broken-job test-amd64-amd64-xl-qemut-debianhvm-amd64 broken
broken-job test-amd64-amd64-xl-multivcpu broken
broken-job test-amd64-amd64-xl broken
broken-job test-amd64-amd64-xl-qcow2 broken
broken-step build-arm64-xsm hosts-allocate
broken-step build-arm64 hosts-allocate
broken-step build-arm64-xsm capture-logs
broken-step build-arm64 capture-logs
broken-step build-arm64-pvops hosts-allocate
broken-step build-arm64-pvops capture-logs
broken-step test-amd64-amd64-rumprun-amd64 host-install(4)
broken-step test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm host-install(4)
broken-step test-amd64-amd64-xl-xsm host-install(4)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-amd64-xsm host-install(4)
broken-step test-amd64-amd64-xl-qemut-debianhvm-amd64-xsm host-install(4)
broken-step test-amd64-amd64-migrupgrade host-install/src_host(4)
broken-step test-amd64-amd64-migrupgrade host-install/dst_host(5)
broken-step test-amd64-amd64-xl-rtds host-install(4)
broken-step test-amd64-amd64-amd64-pvgrub host-install(4)
broken-step test-amd64-amd64-i386-pvgrub host-install(4)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-amd64 host-install(4)
broken-step test-amd64-amd64-qemuu-nested-amd host-install(4)
broken-step test-amd64-amd64-xl-qemuu-ovmf-amd64 host-install(4)
broken-step test-amd64-amd64-xl-qemuu-win7-amd64 host-install(4)
broken-step test-amd64-amd64-xl host-install(4)
broken-step test-xtf-amd64-amd64-1 host-install(4)
broken-step test-amd64-amd64-xl-qcow2 host-install(4)
broken-step test-amd64-amd64-xl-qemut-debianhvm-amd64 host-install(4)
broken-step test-amd64-amd64-livepatch host-install(4)
broken-step test-amd64-amd64-xl-qemut-win10-i386 host-install(4)
broken-step test-amd64-amd64-pygrub host-install(4)
broken-step test-amd64-amd64-pair host-install/src_host(4)
broken-step test-amd64-amd64-pair host-install/dst_host(5)
broken-step test-amd64-amd64-xl-credit2 host-install(4)
broken-step test-amd64-amd64-xl-qemut-win7-amd64 host-install(4)
broken-step test-amd64-amd64-xl-multivcpu host-install(4)
broken-step test-amd64-amd64-examine host-install

Push not applicable.

(No revision log; it would be 9985 lines long.)


--===============5213616876632655230==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5213616876632655230==--
