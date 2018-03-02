From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-4.9-testing test] 120105: regressions - FAIL
Date: Fri, 02 Mar 2018 15:18:23 +0000
Message-ID: <osstest-120105-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2281553854145565098=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=v++t=fy=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1ermSG-0006iF-Aw
 for xen-devel@lists.xenproject.org; Fri, 02 Mar 2018 15:18:40 +0000
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

--===============2281553854145565098==
Content-Type: text/plain

flight 120105 xen-4.9-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/120105/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-qemut-rhel6hvm-amd 12 guest-start/redhat.repeat fail REGR. vs. 120000
 test-amd64-i386-xl-qemut-ws16-amd64 16 guest-localmigrate/x10 fail REGR. vs. 120000

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop      fail blocked in 120000
 test-amd64-i386-xl-qemuu-ws16-amd64 16 guest-localmigrate/x10 fail like 119954
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 120000
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 120000
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 120000
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 120000
 test-armhf-armhf-xl-rtds     16 guest-start/debian.repeat    fail  like 120000
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 120000
 test-xtf-amd64-amd64-1       52 xtf/test-hvm64-memop-seg     fail   never pass
 test-xtf-amd64-amd64-2       52 xtf/test-hvm64-memop-seg     fail   never pass
 test-xtf-amd64-amd64-4       52 xtf/test-hvm64-memop-seg     fail   never pass
 test-xtf-amd64-amd64-5       52 xtf/test-hvm64-memop-seg     fail   never pass
 test-xtf-amd64-amd64-3       52 xtf/test-hvm64-memop-seg     fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-xsm      13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemut-win10-i386 10 windows-install        fail never pass
 test-amd64-i386-xl-qemut-win10-i386 10 windows-install         fail never pass
 test-amd64-i386-xl-qemuu-win10-i386 10 windows-install         fail never pass
 test-amd64-amd64-xl-qemuu-win10-i386 10 windows-install        fail never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  dc3efc2d2bcfe1613cd9c26c31a5180da26c7c68
baseline version:
 xen                  88fbabc49158b0b858248fa124ef590c5df7782f

Last test of basis   120000  2018-02-24 21:12:43 Z    5 days
Failing since        120063  2018-02-27 13:55:23 Z    3 days    2 attempts
Testing same since   120105  2018-02-28 21:31:45 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>

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
 test-amd64-i386-qemut-rhel6hvm-amd                           fail    
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


Not pushing.

------------------------------------------------------------
commit dc3efc2d2bcfe1613cd9c26c31a5180da26c7c68
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Nov 16 21:10:00 2017 +0000

    tools/libxc: Fix restoration of PV MSRs after migrate
    
    There are two bugs in process_vcpu_msrs() which clearly demonstrate that I
    didn't test this bit of Migration v2 very well when writing it...
    
    vcpu->msrsz is always expected to be a multiple of xen_domctl_vcpu_msr_t
    records in a spec-compliant stream, so the modulo yields 0 for the msr_count,
    rather than the actual number sent in the stream.
    
    Passing 0 for the msr_count causes the hypercall to exit early, and hides the
    fact that the guest handle is inserted into the wrong field in the domctl
    union.
    
    The reason that these bugs have gone unnoticed for so long is that the only
    MSRs passed like this for PV guests are the AMD DBGEXT MSRs, which only exist
    in fairly modern hardware, and whose use doesn't appear to be implemented in
    any contemporary PV guests.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Wei Liu <wei.liu2@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Release-acked-by: Julien Grall <julien.grall@linaro.org>
    (cherry picked from commit f1a0a8c3fe2fb37c77ec1fe43618feef412427b5)

commit 395cb3f9b4e31040564a2ca801a292e2cfa76818
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Feb 27 14:24:51 2018 +0100

    x86/hvm: Disallow the creation of HVM domains without Local APIC emulation
    
    There are multiple problems, not necesserily limited to:
    
     * Guests which configure event channels via hvmop_set_evtchn_upcall_vector(),
       or which hit %cr8 emulation will cause Xen to fall over a NULL vlapic->regs
       pointer.
    
     * On Intel hardware, disabling the TPR_SHADOW execution control without
       reenabling CR8_{LOAD,STORE} interception means that the guests %cr8
       accesses interact with the real TPR.  Amongst other things, setting the
       real TPR to 0xf blocks even IPIs from interrupting this CPU.
    
     * On hardware which sets up the use of Interrupt Posting, including
       IOMMU-Posting, guests run without the appropriate non-root configuration,
       which at a minimum will result in dropped interrupts.
    
    Whether no-LAPIC mode is of any use at all remains to be seen.
    
    This is XSA-256.
    
    Reported-by: Ian Jackson <ian.jackson@eu.citrix.com>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: 0aa6158b674c5d083b75ac8fcd1e7ae92d0c39ae
    master date: 2018-02-27 14:08:36 +0100

commit e9bff96bd7c931c2f231ca4202a0d0878e22673f
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Feb 27 14:24:00 2018 +0100

    gnttab: don't blindly free status pages upon version change
    
    There may still be active mappings, which would trigger the respective
    BUG_ON(). Split the loop into one dealing with the page attributes and
    the second (when the first fully passed) freeing the pages. Return an
    error if any pages still have pending references.
    
    This is part of XSA-255.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    master commit: 38bfcc165dda5f4284d7c218b91df9e144ddd88d
    master date: 2018-02-27 14:07:12 +0100

commit 8f42f0a4f9e0c721cec5d0dbb3dd9d3affdf479f
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Feb 27 14:23:32 2018 +0100

    gnttab/ARM: don't corrupt shared GFN array
    
    ... by writing status GFNs to it. Introduce a second array instead.
    Also implement gnttab_status_gmfn() properly now that the information is
    suitably being tracked.
    
    While touching it anyway, remove a misguided (but luckily benign) upper
    bound check from gnttab_shared_gmfn(): We should never access beyond the
    bounds of that array.
    
    This is part of XSA-255.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    master commit: 9d2f8f9c65d4da35437f50ed9e812a2c5ab313e2
    master date: 2018-02-27 14:04:44 +0100

commit aafb8ac8b5071588d651096fb2a882680c24251a
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Feb 27 14:22:48 2018 +0100

    memory: don't implicitly unpin for decrease-reservation
    
    It very likely was a mistake (copy-and-paste from domain cleanup code)
    to implicitly unpin here: The caller should really unpin itself before
    (or after, if they so wish) requesting the page to be removed.
    
    This is XSA-252.
    
    Reported-by: Jann Horn <jannh@google.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    master commit: d798a0952903db9d8ee0a580e03f214d2b49b7d7
    master date: 2018-02-27 14:03:27 +0100
(qemu changes not included)


--===============2281553854145565098==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2281553854145565098==--
