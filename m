From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable test] 117520: trouble: blocked/broken
Date: Tue, 02 Jan 2018 16:56:33 +0000
Message-ID: <osstest-117520-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8133611394280655710=="
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

--===============8133611394280655710==
Content-Type: text/plain

flight 117520 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/117520/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf-pvops               <none executed>              broken
 test-armhf-armhf-xl-credit2     <none executed>              broken
 test-amd64-amd64-rumprun-amd64    <none executed>              broken
 build-armhf-libvirt             <none executed>              broken
 test-amd64-amd64-xl-qemuu-ovmf-amd64    <none executed>              broken
 test-amd64-i386-pair            <none executed>              broken
 test-amd64-i386-xl-qemut-ws16-amd64    <none executed>              broken
 test-amd64-i386-xl-qemut-debianhvm-amd64    <none executed>             broken
 test-xtf-amd64-amd64-3          <none executed>              broken
 test-arm64-arm64-xl-credit2     <none executed>              broken
 test-xtf-amd64-amd64-4          <none executed>              broken
 test-amd64-i386-xl-qemuu-win7-amd64    <none executed>              broken
 test-amd64-i386-examine         <none executed>              broken
 test-armhf-armhf-xl-xsm         <none executed>              broken
 test-amd64-amd64-i386-pvgrub    <none executed>              broken
 test-amd64-amd64-qemuu-nested-intel    <none executed>              broken
 build-arm64-pvops               <none executed>              broken
 test-amd64-amd64-qemuu-nested-amd    <none executed>              broken
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm    <none executed> broken
 build-amd64-libvirt             <none executed>              broken
 build-arm64                     <none executed>              broken
 test-amd64-i386-xl-qemuu-win10-i386    <none executed>              broken
 test-armhf-armhf-xl             <none executed>              broken
 test-amd64-i386-xl-qemut-debianhvm-amd64-xsm    <none executed>         broken
 build-i386-xsm                  <none executed>              broken
 test-amd64-amd64-xl-qemuu-win7-amd64    <none executed>              broken
 build-i386-prev                 <none executed>              broken
 build-amd64-rumprun             <none executed>              broken
 build-i386-libvirt              <none executed>              broken
 test-amd64-i386-xl-xsm          <none executed>              broken
 build-amd64-pvops               <none executed>              broken
 build-i386-rumprun              <none executed>              broken
 build-amd64-xsm                 <none executed>              broken
 test-amd64-amd64-xl-xsm         <none executed>              broken
 build-armhf                     <none executed>              broken
 test-amd64-i386-xl-qemuu-ws16-amd64    <none executed>              broken
 test-amd64-amd64-xl-multivcpu    <none executed>              broken
 test-amd64-i386-xl-raw          <none executed>              broken
 test-amd64-i386-xl-qemuu-debianhvm-amd64-xsm    <none executed>         broken
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm   <none executed> broken
 test-xtf-amd64-amd64-2          <none executed>              broken
 test-amd64-amd64-libvirt-vhd    <none executed>              broken
 test-armhf-armhf-examine        <none executed>              broken
 test-amd64-amd64-libvirt-xsm    <none executed>              broken
 test-amd64-i386-xl-qemut-win10-i386    <none executed>              broken
 test-amd64-i386-migrupgrade     <none executed>              broken
 test-amd64-i386-freebsd10-amd64    <none executed>              broken
 build-amd64-xtf                 <none executed>              broken
 test-amd64-amd64-pair           <none executed>              broken
 test-amd64-amd64-pygrub         <none executed>              broken
 test-amd64-i386-xl-qemuu-debianhvm-amd64    <none executed>             broken
 test-amd64-i386-freebsd10-i386    <none executed>              broken
 test-amd64-amd64-xl-qemuu-debianhvm-amd64    <none executed>            broken
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm    <none executed>   broken
 test-armhf-armhf-xl-rtds        <none executed>              broken
 test-amd64-i386-livepatch       <none executed>              broken
 test-amd64-amd64-xl-qemuu-ws16-amd64    <none executed>              broken
 test-amd64-i386-xl              <none executed>              broken
 test-amd64-amd64-xl-qemut-win7-amd64    <none executed>              broken
 test-amd64-amd64-xl-qemut-debianhvm-amd64-xsm    <none executed>        broken
 test-amd64-i386-qemuu-rhel6hvm-amd    <none executed>              broken
 test-amd64-i386-xl-qemuu-ovmf-amd64    <none executed>              broken
 build-arm64-libvirt             <none executed>              broken
 build-armhf-xsm                 <none executed>              broken
 test-armhf-armhf-xl-vhd         <none executed>              broken
 build-i386-pvops                <none executed>              broken
 test-arm64-arm64-examine        <none executed>              broken
 test-amd64-i386-qemut-rhel6hvm-intel    <none executed>              broken
 test-amd64-amd64-xl-qemuu-win10-i386    <none executed>              broken
 test-amd64-amd64-migrupgrade    <none executed>              broken
 test-amd64-amd64-xl-pvhv2-intel    <none executed>              broken
 test-amd64-i386-xl-qemut-win7-amd64    <none executed>              broken
 test-arm64-arm64-xl             <none executed>              broken
 test-amd64-amd64-xl-qcow2       <none executed>              broken
 test-armhf-armhf-xl-multivcpu    <none executed>              broken
 test-amd64-amd64-xl             <none executed>              broken
 test-amd64-amd64-xl-qemut-win10-i386    <none executed>              broken
 build-arm64-xsm                 <none executed>              broken
 test-amd64-amd64-libvirt        <none executed>              broken
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-xsm    <none executed>        broken
 build-amd64-prev                <none executed>              broken
 test-amd64-i386-qemuu-rhel6hvm-intel    <none executed>              broken
 test-arm64-arm64-xl-xsm         <none executed>              broken
 build-i386                      <none executed>              broken
 test-armhf-armhf-xl-cubietruck    <none executed>              broken
 test-amd64-amd64-xl-rtds        <none executed>              broken
 test-amd64-amd64-xl-credit2     <none executed>              broken
 test-amd64-amd64-amd64-pvgrub    <none executed>              broken
 test-amd64-amd64-xl-pvhv2-amd    <none executed>              broken
 test-amd64-amd64-examine        <none executed>              broken
 test-amd64-amd64-libvirt-pair    <none executed>              broken
 test-amd64-amd64-livepatch      <none executed>              broken
 test-armhf-armhf-xl-arndale     <none executed>              broken
 build-amd64                     <none executed>              broken
 test-xtf-amd64-amd64-1          <none executed>              broken
 test-amd64-i386-qemut-rhel6hvm-amd    <none executed>              broken
 test-amd64-amd64-xl-qemut-debianhvm-amd64    <none executed>            broken
 test-amd64-amd64-xl-qemut-ws16-amd64    <none executed>              broken
 test-xtf-amd64-amd64-5          <none executed>              broken

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-i386-rumprun-i386  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a

version targeted for testing:
 xen                  1b33150fe06ab9217f7f12b01bc5e607f4f55658
baseline version:
 xen                  ec320542e4f4de12305551ef5e3cd4d2ced85771

Last test of basis   117311  2017-12-19 02:35:18 Z   14 days
Testing same since   117365  2017-12-20 07:31:12 Z   13 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ian Jackson <Ian.Jackson@eu.citrix.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>

jobs:
 build-amd64-xsm                                              broken  
 build-arm64-xsm                                              broken  
 build-armhf-xsm                                              broken  
 build-i386-xsm                                               broken  
 build-amd64-xtf                                              broken  
 build-amd64                                                  broken  
 build-arm64                                                  broken  
 build-armhf                                                  broken  
 build-i386                                                   broken  
 build-amd64-libvirt                                          broken  
 build-arm64-libvirt                                          broken  
 build-armhf-libvirt                                          broken  
 build-i386-libvirt                                           broken  
 build-amd64-prev                                             broken  
 build-i386-prev                                              broken  
 build-amd64-pvops                                            broken  
 build-arm64-pvops                                            broken  
 build-armhf-pvops                                            broken  
 build-i386-pvops                                             broken  
 build-amd64-rumprun                                          broken  
 build-i386-rumprun                                           broken  
 test-xtf-amd64-amd64-1                                       broken  
 test-xtf-amd64-amd64-2                                       broken  
 test-xtf-amd64-amd64-3                                       broken  
 test-xtf-amd64-amd64-4                                       broken  
 test-xtf-amd64-amd64-5                                       broken  
 test-amd64-amd64-xl                                          broken  
 test-arm64-arm64-xl                                          broken  
 test-armhf-armhf-xl                                          broken  
 test-amd64-i386-xl                                           broken  
 test-amd64-amd64-xl-qemut-debianhvm-amd64-xsm                broken  
 test-amd64-i386-xl-qemut-debianhvm-amd64-xsm                 broken  
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           broken  
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-xsm                broken  
 test-amd64-i386-xl-qemuu-debianhvm-amd64-xsm                 broken  
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        broken  
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         broken  
 test-amd64-amd64-libvirt-xsm                                 broken  
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-armhf-armhf-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  blocked 
 test-amd64-amd64-xl-xsm                                      broken  
 test-arm64-arm64-xl-xsm                                      broken  
 test-armhf-armhf-xl-xsm                                      broken  
 test-amd64-i386-xl-xsm                                       broken  
 test-amd64-amd64-qemuu-nested-amd                            broken  
 test-amd64-amd64-xl-pvhv2-amd                                broken  
 test-amd64-i386-qemut-rhel6hvm-amd                           broken  
 test-amd64-i386-qemuu-rhel6hvm-amd                           broken  
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    broken  
 test-amd64-i386-xl-qemut-debianhvm-amd64                     broken  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    broken  
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     broken  
 test-amd64-i386-freebsd10-amd64                              broken  
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         broken  
 test-amd64-i386-xl-qemuu-ovmf-amd64                          broken  
 test-amd64-amd64-rumprun-amd64                               broken  
 test-amd64-amd64-xl-qemut-win7-amd64                         broken  
 test-amd64-i386-xl-qemut-win7-amd64                          broken  
 test-amd64-amd64-xl-qemuu-win7-amd64                         broken  
 test-amd64-i386-xl-qemuu-win7-amd64                          broken  
 test-amd64-amd64-xl-qemut-ws16-amd64                         broken  
 test-amd64-i386-xl-qemut-ws16-amd64                          broken  
 test-amd64-amd64-xl-qemuu-ws16-amd64                         broken  
 test-amd64-i386-xl-qemuu-ws16-amd64                          broken  
 test-armhf-armhf-xl-arndale                                  broken  
 test-amd64-amd64-xl-credit2                                  broken  
 test-arm64-arm64-xl-credit2                                  broken  
 test-armhf-armhf-xl-credit2                                  broken  
 test-armhf-armhf-xl-cubietruck                               broken  
 test-amd64-amd64-examine                                     broken  
 test-arm64-arm64-examine                                     broken  
 test-armhf-armhf-examine                                     broken  
 test-amd64-i386-examine                                      broken  
 test-amd64-i386-freebsd10-i386                               broken  
 test-amd64-i386-rumprun-i386                                 blocked 
 test-amd64-amd64-xl-qemut-win10-i386                         broken  
 test-amd64-i386-xl-qemut-win10-i386                          broken  
 test-amd64-amd64-xl-qemuu-win10-i386                         broken  
 test-amd64-i386-xl-qemuu-win10-i386                          broken  
 test-amd64-amd64-qemuu-nested-intel                          broken  
 test-amd64-amd64-xl-pvhv2-intel                              broken  
 test-amd64-i386-qemut-rhel6hvm-intel                         broken  
 test-amd64-i386-qemuu-rhel6hvm-intel                         broken  
 test-amd64-amd64-libvirt                                     broken  
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      blocked 
 test-amd64-amd64-livepatch                                   broken  
 test-amd64-i386-livepatch                                    broken  
 test-amd64-amd64-migrupgrade                                 broken  
 test-amd64-i386-migrupgrade                                  broken  
 test-amd64-amd64-xl-multivcpu                                broken  
 test-armhf-armhf-xl-multivcpu                                broken  
 test-amd64-amd64-pair                                        broken  
 test-amd64-i386-pair                                         broken  
 test-amd64-amd64-libvirt-pair                                broken  
 test-amd64-i386-libvirt-pair                                 blocked 
 test-amd64-amd64-amd64-pvgrub                                broken  
 test-amd64-amd64-i386-pvgrub                                 broken  
 test-amd64-amd64-pygrub                                      broken  
 test-amd64-amd64-xl-qcow2                                    broken  
 test-armhf-armhf-libvirt-raw                                 blocked 
 test-amd64-i386-xl-raw                                       broken  
 test-amd64-amd64-xl-rtds                                     broken  
 test-armhf-armhf-xl-rtds                                     broken  
 test-amd64-amd64-libvirt-vhd                                 broken  
 test-armhf-armhf-xl-vhd                                      broken  


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

broken-job build-armhf-pvops broken
broken-job test-armhf-armhf-xl-credit2 broken
broken-job test-amd64-amd64-rumprun-amd64 broken
broken-job build-armhf-libvirt broken
broken-job test-amd64-amd64-xl-qemuu-ovmf-amd64 broken
broken-job test-amd64-i386-pair broken
broken-job test-amd64-i386-xl-qemut-ws16-amd64 broken
broken-job test-amd64-i386-xl-qemut-debianhvm-amd64 broken
broken-job test-xtf-amd64-amd64-3 broken
broken-job test-arm64-arm64-xl-credit2 broken
broken-job test-xtf-amd64-amd64-4 broken
broken-job test-amd64-i386-xl-qemuu-win7-amd64 broken
broken-job test-amd64-i386-examine broken
broken-job test-armhf-armhf-xl-xsm broken
broken-job test-amd64-amd64-i386-pvgrub broken
broken-job test-amd64-amd64-qemuu-nested-intel broken
broken-job build-arm64-pvops broken
broken-job test-amd64-amd64-qemuu-nested-amd broken
broken-job test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm broken
broken-job build-amd64-libvirt broken
broken-job build-arm64 broken
broken-job test-amd64-i386-xl-qemuu-win10-i386 broken
broken-job test-armhf-armhf-xl broken
broken-job test-amd64-i386-xl-qemut-debianhvm-amd64-xsm broken
broken-job build-i386-xsm broken
broken-job test-amd64-amd64-xl-qemuu-win7-amd64 broken
broken-job build-i386-prev broken
broken-job build-amd64-rumprun broken
broken-job build-i386-libvirt broken
broken-job test-amd64-i386-xl-xsm broken
broken-job build-amd64-pvops broken
broken-job build-i386-rumprun broken
broken-job build-amd64-xsm broken
broken-job test-amd64-amd64-xl-xsm broken
broken-job build-armhf broken
broken-job test-amd64-i386-xl-qemuu-ws16-amd64 broken
broken-job test-amd64-amd64-xl-multivcpu broken
broken-job test-amd64-i386-xl-raw broken
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64-xsm broken
broken-job test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm broken
broken-job test-xtf-amd64-amd64-2 broken
broken-job test-amd64-amd64-libvirt-vhd broken
broken-job test-armhf-armhf-examine broken
broken-job test-amd64-amd64-libvirt-xsm broken
broken-job test-amd64-i386-xl-qemut-win10-i386 broken
broken-job test-amd64-i386-migrupgrade broken
broken-job test-amd64-i386-freebsd10-amd64 broken
broken-job build-amd64-xtf broken
broken-job test-amd64-amd64-pair broken
broken-job test-amd64-amd64-pygrub broken
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64 broken
broken-job test-amd64-i386-freebsd10-i386 broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64 broken
broken-job test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm broken
broken-job test-armhf-armhf-xl-rtds broken
broken-job test-amd64-i386-livepatch broken
broken-job test-amd64-amd64-xl-qemuu-ws16-amd64 broken
broken-job test-amd64-i386-xl broken
broken-job test-amd64-amd64-xl-qemut-win7-amd64 broken
broken-job test-amd64-amd64-xl-qemut-debianhvm-amd64-xsm broken
broken-job test-amd64-i386-qemuu-rhel6hvm-amd broken
broken-job test-amd64-i386-xl-qemuu-ovmf-amd64 broken
broken-job build-arm64-libvirt broken
broken-job build-armhf-xsm broken
broken-job test-armhf-armhf-xl-vhd broken
broken-job build-i386-pvops broken
broken-job test-arm64-arm64-examine broken
broken-job test-amd64-i386-qemut-rhel6hvm-intel broken
broken-job test-amd64-amd64-xl-qemuu-win10-i386 broken
broken-job test-amd64-amd64-migrupgrade broken
broken-job test-amd64-amd64-xl-pvhv2-intel broken
broken-job test-amd64-i386-xl-qemut-win7-amd64 broken
broken-job test-arm64-arm64-xl broken
broken-job test-amd64-amd64-xl-qcow2 broken
broken-job test-armhf-armhf-xl-multivcpu broken
broken-job test-amd64-amd64-xl broken
broken-job test-amd64-amd64-xl-qemut-win10-i386 broken
broken-job build-arm64-xsm broken
broken-job test-amd64-amd64-libvirt broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64-xsm broken
broken-job build-amd64-prev broken
broken-job test-amd64-i386-qemuu-rhel6hvm-intel broken
broken-job test-arm64-arm64-xl-xsm broken
broken-job build-i386 broken
broken-job test-armhf-armhf-xl-cubietruck broken
broken-job test-amd64-amd64-xl-rtds broken
broken-job test-amd64-amd64-xl-credit2 broken
broken-job test-amd64-amd64-amd64-pvgrub broken
broken-job test-amd64-amd64-xl-pvhv2-amd broken
broken-job test-amd64-amd64-examine broken
broken-job test-amd64-amd64-libvirt-pair broken
broken-job test-amd64-amd64-livepatch broken
broken-job test-armhf-armhf-xl-arndale broken
broken-job build-amd64 broken
broken-job test-xtf-amd64-amd64-1 broken
broken-job test-amd64-i386-qemut-rhel6hvm-amd broken
broken-job test-amd64-amd64-xl-qemut-debianhvm-amd64 broken
broken-job test-amd64-amd64-xl-qemut-ws16-amd64 broken
broken-job test-xtf-amd64-amd64-5 broken

Not pushing.

------------------------------------------------------------
commit 1b33150fe06ab9217f7f12b01bc5e607f4f55658
Author: Roger Pau Monne <roger.pau@citrix.com>
Date:   Tue Dec 19 14:17:52 2017 +0000

    libxl/pvh: force PVH guests to use the xenstore shutdown
    
    PVH guests are all required to support the xenstore-based shutdown
    signalling, since there is no other way for a PVH guest to be
    requested to shut down.
    
    For HVM guests we check whether the guest has installed a PV-on-HVM
    interrupt callback; that does not make sense for PVH guests.
    
    So for PVH guests, take the PV path: assume that all PVH guests have
    suitable xenstore drivers.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
    Signed-off-by: Ian Jackson <Ian.Jackson@eu.citrix.com>
(qemu changes not included)


--===============8133611394280655710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8133611394280655710==--
