From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-4.10-testing test] 120284: regressions - trouble:
	blocked/broken/fail/pass
Date: Thu, 08 Mar 2018 15:37:52 +0000
Message-ID: <osstest-120284-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5134341020215457066=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=s4cz=f6=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1etxcM-0001mp-Ee
 for xen-devel@lists.xenproject.org; Thu, 08 Mar 2018 15:38:06 +0000
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

--===============5134341020215457066==
Content-Type: text/plain

flight 120284 xen-4.10-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/120284/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                     <job status>                 broken
 build-amd64                   4 host-install(4)        broken REGR. vs. 120244
 test-armhf-armhf-xl-vhd       7 xen-boot                 fail REGR. vs. 120244

Tests which did not succeed, but are not blocking:
 test-amd64-i386-qemuu-rhel6hvm-amd  1 build-check(1)               blocked n/a
 test-xtf-amd64-amd64-1        1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-i386-rumprun-i386  1 build-check(1)               blocked  n/a
 test-amd64-i386-qemut-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-amd64-i386-xl-qemut-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-xtf-amd64-amd64-3        1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-raw        1 build-check(1)               blocked  n/a
 test-amd64-amd64-migrupgrade  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl           1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-2        1 build-check(1)               blocked  n/a
 test-amd64-amd64-pygrub       1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemut-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ws16-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-rumprun-amd64  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-rtds      1 build-check(1)               blocked  n/a
 test-amd64-i386-qemuu-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-amd64-i386-migrupgrade   1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemut-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-amd64-pair         1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 build-amd64-rumprun           1 build-check(1)               blocked  n/a
 test-amd64-amd64-i386-pvgrub  1 build-check(1)               blocked  n/a
 test-amd64-i386-qemut-rhel6hvm-amd  1 build-check(1)               blocked n/a
 test-amd64-amd64-qemuu-nested-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-intel  1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-intel  1 build-check(1)              blocked n/a
 test-amd64-amd64-xl-qemut-ws16-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-amd64-xl-pvhv2-amd  1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-i386  1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-5        1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemut-win10-i386  1 build-check(1)              blocked n/a
 test-amd64-amd64-xl-qemuu-win10-i386  1 build-check(1)             blocked n/a
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-amd64-amd64-pvgrub  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit2   1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qcow2     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-pair          1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-win10-i386  1 build-check(1)             blocked n/a
 test-xtf-amd64-amd64-4        1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-win10-i386  1 build-check(1)              blocked n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-xl            1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-amd64  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemut-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-xsm      13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  c37114cbf87932d004336c3138d4c832364979cb
baseline version:
 xen                  b6a6458b13dc6f04e17620447a760ff70b1eb4c6

Last test of basis   120244  2018-03-04 20:58:36 Z    3 days
Testing same since   120284  2018-03-06 15:09:01 Z    2 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  George Dunlap <george.dunlap@citrix.com>
  Haozhong Zhang <haozhong.zhang@intel.com>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Ross Lagerwall <ross.lagerwall@citrix.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-armhf-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  broken  
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          blocked 
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-prev                                             pass    
 build-i386-prev                                              pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 build-amd64-rumprun                                          blocked 
 build-i386-rumprun                                           pass    
 test-xtf-amd64-amd64-1                                       blocked 
 test-xtf-amd64-amd64-2                                       blocked 
 test-xtf-amd64-amd64-3                                       blocked 
 test-xtf-amd64-amd64-4                                       blocked 
 test-xtf-amd64-amd64-5                                       blocked 
 test-amd64-amd64-xl                                          blocked 
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           blocked 
 test-amd64-amd64-xl-qemut-debianhvm-amd64-xsm                pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64-xsm                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           blocked 
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-xsm                pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-xsm                 pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-libvirt-xsm                                 blocked 
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-armhf-armhf-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-armhf-armhf-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            blocked 
 test-amd64-amd64-xl-pvhv2-amd                                blocked 
 test-amd64-i386-qemut-rhel6hvm-amd                           blocked 
 test-amd64-i386-qemuu-rhel6hvm-amd                           blocked 
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    blocked 
 test-amd64-i386-xl-qemut-debianhvm-amd64                     blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    blocked 
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     blocked 
 test-amd64-i386-freebsd10-amd64                              blocked 
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         blocked 
 test-amd64-i386-xl-qemuu-ovmf-amd64                          blocked 
 test-amd64-amd64-rumprun-amd64                               blocked 
 test-amd64-amd64-xl-qemut-win7-amd64                         blocked 
 test-amd64-i386-xl-qemut-win7-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-win7-amd64                         blocked 
 test-amd64-i386-xl-qemuu-win7-amd64                          blocked 
 test-amd64-amd64-xl-qemut-ws16-amd64                         blocked 
 test-amd64-i386-xl-qemut-ws16-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-ws16-amd64                         blocked 
 test-amd64-i386-xl-qemuu-ws16-amd64                          blocked 
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit2                                  blocked 
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-i386-freebsd10-i386                               blocked 
 test-amd64-i386-rumprun-i386                                 blocked 
 test-amd64-amd64-xl-qemut-win10-i386                         blocked 
 test-amd64-i386-xl-qemut-win10-i386                          blocked 
 test-amd64-amd64-xl-qemuu-win10-i386                         blocked 
 test-amd64-i386-xl-qemuu-win10-i386                          blocked 
 test-amd64-amd64-qemuu-nested-intel                          blocked 
 test-amd64-amd64-xl-pvhv2-intel                              blocked 
 test-amd64-i386-qemut-rhel6hvm-intel                         blocked 
 test-amd64-i386-qemuu-rhel6hvm-intel                         blocked 
 test-amd64-amd64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      blocked 
 test-amd64-amd64-migrupgrade                                 blocked 
 test-amd64-i386-migrupgrade                                  blocked 
 test-amd64-amd64-xl-multivcpu                                blocked 
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        blocked 
 test-amd64-i386-pair                                         blocked 
 test-amd64-amd64-libvirt-pair                                blocked 
 test-amd64-i386-libvirt-pair                                 blocked 
 test-amd64-amd64-amd64-pvgrub                                blocked 
 test-amd64-amd64-i386-pvgrub                                 blocked 
 test-amd64-amd64-pygrub                                      blocked 
 test-amd64-amd64-xl-qcow2                                    blocked 
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       blocked 
 test-amd64-amd64-xl-rtds                                     blocked 
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-libvirt-vhd                                 blocked 
 test-armhf-armhf-xl-vhd                                      fail    


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

broken-job build-amd64 broken
broken-step build-amd64 host-install(4)

Not pushing.

------------------------------------------------------------
commit c37114cbf87932d004336c3138d4c832364979cb
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Mar 6 15:56:12 2018 +0100

    x86/HVM: don't give the wrong impression of WRMSR succeeding
    
    ... for non-existent MSRs: wrmsr_hypervisor_regs()'s comment clearly
    says that the function returns 0 for unrecognized MSRs, so
    {svm,vmx}_msr_write_intercept() should not convert this into success. We
    don't want to unconditionally fail the access though, as we can't be
    certain the list of handled MSRs is complete enough for the guest types
    we care about, so instead mirror what we do on the read paths and probe
    the MSR to decide whether to raise #GP.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
    master commit: 1f1d183d49008794b087cf043fc77f724a45af98
    master date: 2018-02-27 15:12:23 +0100

commit 5ede9f9600f7eef9e5da34bc68e445b17eb5d8db
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Mar 6 15:55:33 2018 +0100

    x86/PV: fix off-by-one in I/O bitmap limit check
    
    With everyone having their tags below agreeing that putting things the
    other way around in the comparison makes things easier to understand, do
    that rearrangement while changing the line anyway.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.apu@citrix.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    master commit: c6527bc66b6dd7a8dadaebb1047c8e52c6c5793c
    master date: 2018-02-27 14:10:00 +0100

commit 7e0796d3fe1916890e9f2de3f8c737febc1cf996
Author: George Dunlap <george.dunlap@citrix.com>
Date:   Tue Mar 6 15:54:54 2018 +0100

    grant: Release domain lock on 'map' path in cache_flush
    
    common/grant_table.c:cache_flush() grabs the rcu lock for the current
    domain, but only releases it on error paths.
    
    Note that this is not a security issue, as the preempt count is used
    exclusively for assertions at the moment.
    
    Signed-off-by: George Dunlap <george.dunlap@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: 156b29fca10fd25065fc501eb4b47cff931086f2
    master date: 2018-02-27 11:19:27 +0000

commit b9aa790d3104537b191adea2442af89a77a8e532
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Mar 6 15:54:10 2018 +0100

    x86/pv: Avoid leaking other guests' MSR_TSC_AUX values into PV context
    
    If the CPU pipeline supports RDTSCP or RDPID, a guest can observe the value in
    MSR_TSC_AUX, irrespective of whether the relevant CPUID features are
    advertised/hidden.
    
    At the moment, paravirt_ctxt_switch_to() only writes to MSR_TSC_AUX if
    TSC_MODE_PVRDTSCP mode is enabled, but this is not the default mode.
    Therefore, default PV guests can read the value from a previously scheduled
    HVM vcpu, or TSC_MODE_PVRDTSCP-enabled PV guest.
    
    Alter the PV path to always write to MSR_TSC_AUX, using 0 in the common case.
    
    To amortise overhead cost, introduce wrmsr_tsc_aux() which performs a lazy
    update of the MSR, and use this function consistently across the codebase.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Wei Liu <wei.liu2@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>
    Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
    master commit: cc0e45db277922b5723a7b1d9657d6f744230cf1
    master date: 2018-02-27 10:47:23 +0000

commit 4867afbc95b9ca1a12265f0ad8e499f0189ad197
Author: Igor Druzhinin <igor.druzhinin@citrix.com>
Date:   Tue Mar 6 15:53:35 2018 +0100

    x86/nmi: start NMI watchdog on CPU0 after SMP bootstrap
    
    We're noticing a reproducible system boot hang on certain
    Skylake platforms where the BIOS is configured in legacy
    boot mode with x2APIC disabled. The system stalls immediately
    after writing the first SMP initialization sequence into APIC ICR.
    
    The cause of the problem is watchdog NMI handler execution -
    somewhere near the end of NMI handling (after it's already
    rescheduled the next NMI) it tries to access IO port 0x61
    to get the actual NMI reason on CPU0. Unfortunately, this
    port is emulated by BIOS using SMIs and this emulation for
    some reason takes more time than we expect during INIT-SIPI-SIPI
    sequence. As the result, the system is constantly moving between
    NMI and SMI handler and not making any progress.
    
    To avoid this, initialize the watchdog after SMP bootstrap on
    CPU0 and, additionally, protect the NMI handler by moving
    IO port access before NMI re-scheduling. The latter should also
    help in case of post boot CPU onlining. Although we're running
    watchdog at much lower frequency at this point, it's neveretheless
    possible we may trigger the issue anyway.
    
    Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: a44f1697968e04fcc6145e3bd51c748b57047240
    master date: 2018-02-20 10:16:56 +0100

commit 3deb58f832884387e4da4d737fdf9d31e637817a
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Mar 6 15:52:51 2018 +0100

    x86/srat: fix end calculation in nodes_cover_memory()
    
    Along the lines of commit 7226486767 ("x86/srat: fix the end pfn check
    in valid_numa_range()") nodes_cover_memory() also doesn't consistently
    use "end": It's set to an inclusive value initially, but then compared
    to the exclusive "end" field of struct node and also possibly set to
    nodes[j].start, making it exclusive too. Change the initialization to
    make the variable consistently exclusive.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    master commit: fdbed42649eb064e7c6d1bae2bdd4f46e7b2a160
    master date: 2018-02-15 18:17:32 +0100

commit 3376822f15be49606dcbe94482349b16e618ee41
Author: Ross Lagerwall <ross.lagerwall@citrix.com>
Date:   Tue Mar 6 15:52:20 2018 +0100

    x86/hvm/dmop: only copy what is needed to/from the guest
    
    dm_op() fails with -EFAULT if the struct xen_dm_op given by the guest is
    smaller than Xen's struct xen_dm_op. This is a problem because DMOP is
    meant to be a stable ABI but it breaks whenever the size of struct
    xen_dm_op changes.
    
    To fix this, change how the copying to and from the guest is done. When
    copying from the guest, first copy the header and inspect the op. Then,
    only copy the correct amount needed for that op. When copying to the
    guest, don't copy the header. Rather, copy only the correct amount
    needed for that particular op.
    
    So now the dm_op() will fail if the guest does not supply enough bytes
    for the specific op. It will not fail if the guest supplies too many
    bytes for the specific op, but Xen will not copy the extra bytes.
    
    Remove some now unused macros and helper functions.
    
    Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
    Reviewed-by: Paul Durrant <paul.durrant@citrix.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    master commit: 85cb15dfe4d13b9b8b0f39a9cb257525c0b74c60
    master date: 2018-02-15 18:16:17 +0100

commit 37dd90787e45456440cbb05ea380ae8e9198aa08
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Mar 6 15:51:33 2018 +0100

    x86/entry: Use 32bit xors rater than 64bit xors for clearing GPRs
    
    Intel's Silvermont/Knights Landing architecture treats them as full ALU
    operations, rather than zeroing idoms.
    
    No functional change, and no change in code volume (only changing the bit
    selection in the REX prefix).
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    master commit: eb1d3a3f04b85d596862a4c9dcf796e67ab4dc09
    master date: 2018-02-15 11:08:27 +0000

commit 296705818c03f8ec29effd19e94a3add893854b2
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Mar 6 15:50:56 2018 +0100

    x86/emul: Fix the decoding of segment overrides in 64bit mode
    
    Explicit segment overides other than %fs and %gs are documented as ignored by
    both Intel and AMD.
    
    In practice, this means that:
    
     * Explicit uses of %ss don't actually yield #SS[0] for non-canonical
       memory references.
     * Explicit uses of %{e,c,d}s don't override %rbp/%rsp-based memory references
       to yield #GP[0] for non-canonical memory references.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: b7dce29d9faf3597d009c853ed1fcbed9f7a7f68
    master date: 2018-02-15 11:08:27 +0000

commit 0857b09aae3f9d3898dd561d19583ffa1127044b
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Mar 6 15:50:14 2018 +0100

    x86/spec_ctrl: Fix several bugs in SPEC_CTRL_ENTRY_FROM_INTR_IST
    
    DO_OVERWRITE_RSB clobbers %rax, meaning in practice that the bti_ist_info
    field gets zeroed.  Older versions of this code had the DO_OVERWRITE_RSB
    register selectable, so reintroduce this ability and use it to cause the
    INTR_IST path to use %rdx instead.
    
    The use of %dl for the %cs.rpl check means that when an IST interrupt hits
    Xen, we try to load 1 into the high 32 bits of MSR_SPEC_CTRL, suffering a #GP
    fault instead.
    
    Also, drop an unused label which was a copy/paste mistake.
    
    Reported-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
    Reported-by: Zhenzhong Duan <zhenzhong.duan@oracle.com>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Wei Liu <wei.liu2@citrix.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    master commit: a2b08fbed388f18235fda5ba1655c1483ef3e215
    master date: 2018-02-14 13:22:15 +0000

commit 4195d40e31c76d4ecf68ab31b3d20a0207eb6b1e
Author: Haozhong Zhang <haozhong.zhang@intel.com>
Date:   Tue Mar 6 15:49:33 2018 +0100

    x86/srat: fix the end pfn check in valid_numa_range()
    
    ... and fix the coding style on fly.
    
    valid_numa_range(..., epfn << PAGE_SHIFT, ...) and its only caller
    memory_add(..., epfn, pxm) interpret epfn inconsistently. The former
    interprets epfn as the last pfn, while the latter interprets it as the
    last pfn plus one. Fix this inconsistency in valid_numa_range(), since
    most of other places use the latter interpretation.
    
    Signed-off-by: Haozhong Zhang <haozhong.zhang@intel.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    master commit: 722648676751fda39086f54d961640f88174360b
    master date: 2018-02-12 11:08:33 +0000

commit ab62fc3171b560a64fc3156d42776672943228f0
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Mar 6 15:48:31 2018 +0100

    x86: reduce Meltdown band-aid IPI overhead
    
    In case we can detect single-threaded guest processes (by checking
    whether we can account for all root page table uses locally on the vCPU
    that's running), there's no point in issuing a sync IPI upon an L4 entry
    update, as no other vCPU of the guest will have that page table loaded.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: George Dunlap <george.dunlap@citrix.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    master commit: a22320e32dca0918ed23799583f470afe4c24330
    master date: 2018-02-07 16:31:41 +0100

commit 0e10f2858643c61e1e55f37c4b86d430c690ee89
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Mar 6 15:47:55 2018 +0100

    x86/NMI: invert condition in nmi_show_execution_state()
    
    We want to decode the symbol when _not_ in guest mode.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    master commit: 309e0509b7363a895362fcbeac823562c3e18def
    master date: 2018-02-06 17:29:59 +0100

commit a05fc8e5be7fe6a079857279c973a8ebfad2e31d
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Mar 6 15:46:56 2018 +0100

    x86/emul: Fix the emulation of invlpga
    
    The instruction requires EFER.SVME set to be usable in the first place.
    
    Furthermore, the emulation doesn't handle ASIDs, so avoid giving the
    impression that they work.  Permit ASID 0 which is reserved for non-root
    mode (in which case the instruction is identical to invlpg), but raise #UD for
    any other ASID.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: a91b2ec337a45d5d98e5a4387aa6563bc5cdc4c9
    master date: 2018-02-05 18:17:22 +0000
(qemu changes not included)


--===============5134341020215457066==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5134341020215457066==--
