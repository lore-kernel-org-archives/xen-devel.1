From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-4.7-testing test] 118221: regressions - FAIL
Date: Sat, 20 Jan 2018 13:22:13 +0000
Message-ID: <osstest-118221-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7906460346368285529=="
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

--===============7906460346368285529==
Content-Type: text/plain

flight 118221 xen-4.7-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/118221/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemut-debianhvm-amd64    <job status>      broken in 118171
 test-xtf-amd64-amd64-5 49 xtf/test-hvm64-lbr-tsx-vmentry fail REGR. vs. 117937

Tests which are failing intermittently (not blocking):
 test-amd64-i386-xl-qemut-debianhvm-amd64 4 host-install(4) broken in 118171 pass in 118221
 test-xtf-amd64-amd64-3   49 xtf/test-hvm64-lbr-tsx-vmentry fail pass in 118171

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-rtds     17 guest-start.2           fail blocked in 117937
 test-xtf-amd64-amd64-4 49 xtf/test-hvm64-lbr-tsx-vmentry fail in 118171 like 117873
 test-xtf-amd64-amd64-2 49 xtf/test-hvm64-lbr-tsx-vmentry fail in 118171 like 117873
 test-armhf-armhf-xl-rtds 16 guest-start/debian.repeat fail in 118171 like 117937
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 117937
 test-armhf-armhf-libvirt-xsm 14 saverestore-support-check    fail  like 117937
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 117937
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 117937
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 117937
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 117937
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 117937
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop             fail like 117937
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop             fail like 117937
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 117937
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 117937
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-armhf-armhf-xl-xsm      13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemut-win10-i386 10 windows-install        fail never pass
 test-amd64-amd64-xl-qemuu-win10-i386 10 windows-install        fail never pass
 test-amd64-i386-xl-qemuu-win10-i386 10 windows-install         fail never pass
 test-amd64-i386-xl-qemut-win10-i386 10 windows-install         fail never pass

version targeted for testing:
 xen                  e19d0af4ee2ae9e42a85db639fd6848e72f5658b
baseline version:
 xen                  23077989038c076597be3d7852f51b80486cd157

Last test of basis   117937  2018-01-13 11:20:36 Z    7 days
Testing same since   118171  2018-01-17 16:50:01 Z    2 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Jan H. Schönherr <jschoenh@amazon.de>
  Roger Pau Monné <roger.pau@citrix.com>

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
 test-amd64-i386-xl                                           pass    
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
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-i386-rumprun-i386                                 pass    
 test-amd64-amd64-xl-qemut-win10-i386                         fail    
 test-amd64-i386-xl-qemut-win10-i386                          fail    
 test-amd64-amd64-xl-qemuu-win10-i386                         fail    
 test-amd64-i386-xl-qemuu-win10-i386                          fail    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
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
 test-armhf-armhf-xl-rtds                                     fail    
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

broken-job test-amd64-i386-xl-qemut-debianhvm-amd64 broken

Not pushing.

------------------------------------------------------------
commit e19d0af4ee2ae9e42a85db639fd6848e72f5658b
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Jan 17 17:24:59 2018 +0100

    x86: allow Meltdown band-aid to be disabled
    
    First of all we don't need it on AMD systems. Additionally allow its use
    to be controlled by command line option. For best backportability, this
    intentionally doesn't use alternative instruction patching to achieve
    the intended effect - while we likely want it, this will be later
    follow-up.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    master commit: e871e80c38547d9faefc6604532ba3e985e65873
    master date: 2018-01-16 17:50:59 +0100

commit e19517a3355acaaa2ff83018bc41e7fd044161e5
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Jan 17 17:24:12 2018 +0100

    x86: Meltdown band-aid against malicious 64-bit PV guests
    
    This is a very simplistic change limiting the amount of memory a running
    64-bit PV guest has mapped (and hence available for attacking): Only the
    mappings of stack, IDT, and TSS are being cloned from the direct map
    into per-CPU page tables. Guest controlled parts of the page tables are
    being copied into those per-CPU page tables upon entry into the guest.
    Cross-vCPU synchronization of top level page table entry changes is
    being effected by forcing other active vCPU-s of the guest into the
    hypervisor.
    
    The change to context_switch() isn't strictly necessary, but there's no
    reason to keep switching page tables once a PV guest is being scheduled
    out.
    
    This isn't providing full isolation yet, but it should be covering all
    pieces of information exposure of which would otherwise require an XSA.
    
    There is certainly much room for improvement, especially of performance,
    here - first and foremost suppressing all the negative effects on AMD
    systems. But in the interest of backportability (including to really old
    hypervisors, which may not even have alternative patching) any such is
    being left out here.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    master commit: 5784de3e2067ed73efc2fe42e62831e8ae7f46c4
    master date: 2018-01-16 17:49:03 +0100

commit 9b76908e6e074d7efbeafe6bad066ecc5f3c3c43
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Jan 17 17:23:37 2018 +0100

    x86/mm: Always set _PAGE_ACCESSED on L4e updates
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: bd61fe94bee0556bc2f64999a4a8315b93f90f21
    master date: 2018-01-15 13:53:16 +0000

commit 46025e3c0768670357eb5fc0ff327d6386503bc7
Author: Jan H. Schönherr <jschoenh@amazon.de>
Date:   Wed Jan 17 17:23:08 2018 +0100

    x86: Don't use potentially incorrect CPUID values for topology information
    
    Intel says for CPUID leaf 0Bh:
    
      "Software must not use EBX[15:0] to enumerate processor
       topology of the system. This value in this field
       (EBX[15:0]) is only intended for display/diagnostic
       purposes. The actual number of logical processors
       available to BIOS/OS/Applications may be different from
       the value of EBX[15:0], depending on software and platform
       hardware configurations."
    
    And yet, we're using them to derive the number cores in a package
    and the number of siblings in a core.
    
    Derive the number of siblings and cores from EAX instead, which is
    intended for that.
    
    Signed-off-by: Jan H. Schönherr <jschoenh@amazon.de>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    master commit: d51baf310e530659f73e714acf575555bdc46303
    master date: 2018-01-08 10:48:24 +0000

commit 0e6c6fc449000d97f9fa87ed1fbe23f0cf21406b
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Jan 17 17:22:34 2018 +0100

    x86/entry: Remove support for partial cpu_user_regs frames
    
    Save all GPRs on entry to Xen.
    
    The entry_int82() path is via a DPL1 gate, only usable by 32bit PV guests, so
    can get away with only saving the 32bit registers.  All other entrypoints can
    be reached from 32 or 64bit contexts.
    
    This is part of XSA-254.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Wei Liu <wei.liu2@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    master commit: f9eb74789af77e985ae653193f3622263499f674
    master date: 2018-01-05 19:57:07 +0000

commit 40c441092429c4b605cb77e758cb304146860a88
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Wed Jan 17 17:22:03 2018 +0100

    x86/upcall: inject a spurious event after setting upcall vector
    
    In case the vCPU has pending events to inject. This fixes a bug that
    happened if the guest mapped the vcpu info area using
    VCPUOP_register_vcpu_info without having setup the event channel
    upcall, and then setup the upcall vector.
    
    In this scenario the guest would not receive any upcalls, because the
    call to VCPUOP_register_vcpu_info would have marked the vCPU as having
    pending events, but the vector could not be injected because it was
    not yet setup.
    
    This has not caused issues so far because all the consumers first
    setup the vector callback and then map the vcpu info page, but there's
    no limitation that prevents doing it in the inverse order.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: 7b5b8ca7dffde866d851f0b87b994e0b13e5b867
    master date: 2018-01-04 14:29:16 +0100

commit f3b76b6c504461059623aaebfe4211e04867a115
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Jan 17 17:21:21 2018 +0100

    x86/E820: don't overrun array
    
    The bounds check needs to be done after the increment, not before, or
    else it needs to use a one lower immediate. Also use word operations
    rather than byte ones for both the increment and the compare (allowing
    E820_BIOS_MAX to be more easily bumped, should the need ever arise).
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    master commit: 0036c9dbcd8b52316aeebb475929d3a36cf5e514
    master date: 2018-01-03 11:03:56 +0100

commit 4c937e26faa2edb1d6073efdcb6d4f7d6c66b90a
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Jan 17 17:20:45 2018 +0100

    x86/IRQ: conditionally preserve access permission on map error paths
    
    Permissions that had been granted before should not be revoked when
    handling unrelated errors.
    
    Reported-by: HW42 <hw42@ipsumj.de>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    master commit: 3443e68a778572a6e082d7dfcf9ce794eca62f5f
    master date: 2018-01-03 11:03:10 +0100
(qemu changes not included)


--===============7906460346368285529==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7906460346368285529==--
