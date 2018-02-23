From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable test] 119879: regressions - FAIL
Date: Fri, 23 Feb 2018 15:28:22 +0000
Message-ID: <osstest-119879-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9031484805483599998=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zfog=fr=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1epFGz-0003C4-Ss
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 15:28:33 +0000
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

--===============9031484805483599998==
Content-Type: text/plain

flight 119879 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/119879/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl            6 xen-install              fail REGR. vs. 119713

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt-xsm 14 saverestore-support-check    fail  like 119713
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 119713
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 119713
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 119713
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop             fail like 119713
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 119713
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 119713
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 119713
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 119713
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 119713
 test-amd64-amd64-xl-pvhv2-intel 12 guest-start                 fail never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-pvhv2-amd 12 guest-start                  fail  never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-xsm      13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemuu-win10-i386 10 windows-install         fail never pass
 test-amd64-amd64-xl-qemuu-win10-i386 10 windows-install        fail never pass
 test-amd64-amd64-xl-qemut-win10-i386 10 windows-install        fail never pass
 test-amd64-i386-xl-qemut-win10-i386 10 windows-install         fail never pass

version targeted for testing:
 xen                  da3d180d101cf81d085f0c6560d70acd16c934bd
baseline version:
 xen                  8f9ccfe93570ecae18d9cc224931787d0bca9c66

Last test of basis   119713  2018-02-20 07:56:20 Z    3 days
Failing since        119785  2018-02-21 02:46:06 Z    2 days    2 attempts
Testing same since   119879  2018-02-22 11:44:10 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alexandru Isaila <aisaila@bitdefender.com>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Brian Woods <brian.woods@amd.com>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <julien.grall@arm.com>
  Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
  Olaf Hering <olaf@aepfle.de>
  Razvan Cojocaru <rcojocaru@bitdefender.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Sergey Dyasli <sergey.dyasli@citrix.com>

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
 test-amd64-i386-xl-qemut-debianhvm-amd64-xsm                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-xsm                pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-xsm                 pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-armhf-armhf-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-armhf-armhf-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                fail    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
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
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-i386-rumprun-i386                                 pass    
 test-amd64-amd64-xl-qemut-win10-i386                         fail    
 test-amd64-i386-xl-qemut-win10-i386                          fail    
 test-amd64-amd64-xl-qemuu-win10-i386                         fail    
 test-amd64-i386-xl-qemuu-win10-i386                          fail    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              fail    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-amd64-pvgrub                                pass    
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


Not pushing.

------------------------------------------------------------
commit da3d180d101cf81d085f0c6560d70acd16c934bd
Author: Brian Woods <brian.woods@amd.com>
Date:   Tue Feb 20 16:27:02 2018 -0600

    x86/svm: add EFER SVME support for VGIF/VLOAD
    
    Only enable virtual VMLOAD/SAVE and VGIF if the guest EFER.SVME is set.
    
    Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Brian Woods <brian.woods@amd.com>
    Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>

commit 6364c2fcdabdeba4e3ec52c682fa6b0797fc2fdc
Author: Olaf Hering <olaf@aepfle.de>
Date:   Wed Feb 21 14:44:58 2018 +0100

    sysctl: correct comment in xen_sysctl_pcitopoinfo
    
    Refer to correct member of struct xen_sysctl_pcitopoinfo in comment.
    
    Fixes: commit 61319fbfd9 ("sysctl: add sysctl interface for querying PCI topology")
    
    Signed-off-by: Olaf Hering <olaf@aepfle.de>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 7de0a8bc2f708fecdd1193617d2f91bd4b048d22
Author: Julien Grall <julien.grall@arm.com>
Date:   Wed Feb 21 14:02:44 2018 +0000

    xen/tmem: Convert the file common/tmem_xen.c to use typesafe MFN
    
    The file common/tmem_xen.c is now converted to use typesafe. This is
    requiring to override the macro page_to_mfn to make it work with mfn_t.
    
    Note that all variables converted to mfn_t havem there initial value,
    when set, switch from 0 to INVALID_MFN. This is fine because the initial
    values was always overriden before used.
    
    Also add a couple of missing newlines suggested by Andrew in the code.
    
    Signed-off-by: Julien Grall <julien.grall@arm.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

commit 07f141bfa6c748bdec0fc17aeb9fc20f9c939323
Author: Roger Pau Monne <roger.pau@citrix.com>
Date:   Tue Feb 20 14:10:12 2018 +0000

    build: filter out command line assembler arguments
    
    If the assembler is not used. This happens when using cc -E or cc -S
    for example. GCC will just ignore the -Wa,... when the assembler is
    not called, but clang will complain loudly and fail.
    
    Also enable passing -Wa,-I$(BASEDIR)/include to clang now that it's
    safe to do so.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit e82c185e4ca8940ca18a9aa01024e3e8609e546c
Author: Roger Pau Monne <roger.pau@citrix.com>
Date:   Tue Feb 20 14:10:11 2018 +0000

    build: do not hardcode AFLAGS for as-insn tests
    
    Hardcoding as-insn to use AFLAGS is not correct. For once the test is
    performed using a C file with inline assembly, and secondly the flags
    used can be passed by the caller together with the CC.
    
    Fix as-insn-check to pass the flags given as parameter to the test.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    [Fix usage comments as they are changing]
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 23b40df6f098e3bcb2f105a4909860240976e40f
Author: Julien Grall <julien.grall@arm.com>
Date:   Fri Feb 16 14:59:56 2018 +0000

    xen/arm: vgic: Make sure the number of SPIs is a multiple of 32
    
    The vGIC relies on having a pending_irq available for every IRQs
    described in the ranks. As each rank describes 32 interrupts, we need to
    make sure the number of SPIs is a multiple of 32.
    
    Reported-by: Jeff Kubascik <Jeff.Kubascik@dornerworks.com>
    Signed-off-by: Julien Grall <julien.grall@arm.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Cc: Jarvis Roach <Jarvis.Roach@dornerworks.com>

commit 454ae490487659a51d71adc77aa02892d0725235
Author: Alexandru Isaila <aisaila@bitdefender.com>
Date:   Mon Feb 19 15:07:06 2018 +0200

    asm-x86/monitor: Add MONITOR_EVENT_INTERRUPT to common capabilities
    
    Signed-off-by: Alexandru Isaila <aisaila@bitdefender.com>
    Acked-by: Razvan Cojocaru <rcojocaru@bitdefender.com>

commit 197fbdb501257fdbbe0cfed35e3a99ef5b166107
Author: Sergey Dyasli <sergey.dyasli@citrix.com>
Date:   Mon Feb 19 11:29:26 2018 +0000

    x86/msr: add Raw and Host domain policies
    
    Raw policy contains the actual values from H/W MSRs. Add PLATFORM_INFO
    msr to the policy during probe_cpuid_faulting().
    
    Host policy may have certain features disabled if Xen decides not
    to use them. For now, make Host policy equal to Raw policy with
    cpuid_faulting availability dependent on X86_FEATURE_CPUID_FAULTING.
    
    Finally, derive HVM/PV max domain policies from the Host policy.
    
    Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit a44f1697968e04fcc6145e3bd51c748b57047240
Author: Igor Druzhinin <igor.druzhinin@citrix.com>
Date:   Tue Feb 20 10:16:56 2018 +0100

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

commit 682b13c259e531f6848f535032c256ec8fcaca71
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Feb 20 10:10:59 2018 +0100

    shim: allow building of just the shim with build-ID-incapable linker
    
    The ELF note the shim build inserts causes mkelf32 to choke on the
    second program header. However, the output of mkelf32 isn't really
    needed when building inside tools/firmware/ - an attempt to build it is
    made solely because of a wrong dependency.
    
    Further changes to the make logic will be needed to also allow building
    a shim-enabled "normal" xen with such a linker (as it looks the --notes
    option will need passing not just when the linker support build ID
    generation).
    
    Also drop a stray variable setting from the x86 Makefile.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Wei Liu <wei.liu2@citrix.com>
(qemu changes not included)


--===============9031484805483599998==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9031484805483599998==--
