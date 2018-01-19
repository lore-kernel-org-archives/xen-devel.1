From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable-smoke test] 118226: regressions - FAIL
Date: Fri, 19 Jan 2018 13:35:14 +0000
Message-ID: <osstest-118226-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8189168930618671913=="
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

--===============8189168930618671913==
Content-Type: text/plain

flight 118226 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/118226/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 118219

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-i386  1 build-check(1)         blocked n/a
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  66bf4ef04869548128b70d8d371ec992189a6a1c
baseline version:
 xen                  56498d2cf9d3c5f7d3d894a89f7d66ed81548e01

Last test of basis   118219  2018-01-19 01:01:22 Z    0 days
Testing same since   118226  2018-01-19 11:02:00 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  George Dunlap <george.dunlap@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <julien.grall@linaro.org>
  Paul Durrant <paul.durrant@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Tim Deegan <tim@xen.org>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  fail    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          blocked 
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386                     blocked 
 test-amd64-amd64-libvirt                                     blocked 


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
commit 66bf4ef04869548128b70d8d371ec992189a6a1c
Author: Paul Durrant <paul.durrant@citrix.com>
Date:   Fri Jan 19 11:17:30 2018 +0100

    x86/hvm: re-work viridian APIC assist code
    
    It appears there is a case where Windows enables the APIC assist
    enlightenment[1] but does not use it. This scenario is perfectly valid
    according to the documentation, but causes the state machine in Xen to
    become confused leading to a domain_crash() such as the following:
    
    (XEN) d4: VIRIDIAN GUEST_OS_ID: vendor: 1 os: 4 major: 6 minor: 1 sp: 0
          build: 1db0
    (XEN) d4: VIRIDIAN HYPERCALL: enabled: 1 pfn: 3ffff
    (XEN) d4v0: VIRIDIAN VP_ASSIST_PAGE: enabled: 1 pfn: 3fffe
    (XEN) domain_crash called from viridian.c:452
    (XEN) Domain 4 (vcpu#0) crashed on cpu#1:
    
    The following sequence of events is an example of how this can happen:
    
     - On return to guest vlapic_has_pending_irq() finds a bit set in the IRR.
     - vlapic_ack_pending_irq() calls viridian_start_apic_assist() which latches
       the vector, sets the bit in the ISR and clears it from the IRR.
     - The guest then processes the interrupt but EOIs it normally, therefore
       clearing the bit in the ISR.
     - On next return to guest vlapic_has_pending_irq() calls
       viridian_complete_apic_assist(), which discovers the assist bit still set
       in the shared page and therefore leaves the latched vector in place, but
       also finds another bit set in the IRR.
     - vlapic_ack_pending_irq() is then called but, because the ISR is was
       cleared by the EOI, another call is made to viridian_start_apic_assist()
       and this then calls domain_crash() because it finds the latched vector
       has not been cleared.
    
    Having re-visited the code I also conclude that Xen's implementation of the
    enlightenment is currently wrong and we are not properly following the
    specification.
    
    The specification says:
    
    "The hypervisor sets the No EOI required bit when it injects a virtual
     interrupt if the following conditions are satisfied:
    
     - The virtual interrupt is edge-triggered, and
     - There are no lower priority interrupts pending.
    
     If, at a later time, a lower priority interrupt is requested, the
     hypervisor clears the No EOI required such that a subsequent EOI causes
     an intercept.
     In case of nested interrupts, the EOI intercept is avoided only for the
     highest priority interrupt. This is necessary since no count is maintained
     for the number of EOIs performed by the OS. Therefore only the first EOI
     can be avoided and since the first EOI clears the No EOI Required bit,
     the next EOI generates an intercept."
    
    Thus it is quite legitimate to set the "No EOI required" bit and then
    subsequently take a higher priority interrupt without clearing the bit.
    Thus the avoided EOI will then relate to that subsequent interrupt rather
    than the highest priority interrupt when the bit was set. Hence latching
    the vector when setting the bit is not entirely useful and somewhat
    misleading.
    
    This patch re-works the APIC assist code to simply track when the "No EOI
    required" bit is set and test if it has been cleared by the guest (i.e.
    'completing' the APIC assist), thus indicating a 'missed EOI'. Missed EOIs
    need to be dealt with in two places:
    
     - In vlapic_has_pending_irq(), to avoid comparing the IRR against a stale
       ISR, and
     - In vlapic_EOI_set() because a missed EOI for a higher priority vector
       should be dealt with before the actual EOI for the lower priority
       vector.
    
    Furthermore, because the guest is at liberty to ignore the "No EOI required"
    bit (which lead the crash detailed above) vlapic_EOI_set() must also make
    sure the bit is cleared to avoid confusing the state machine.
    
    Lastly the previous code did not properly emulate an EOI if a missed EOI
    was discovered in vlapic_has_pending_irq(); it merely cleared the bit in
    the ISR. The new code instead calls vlapic_EOI_set().
    
    [1] See section 10.3.5 of Microsoft's "Hypervisor Top Level Functional
        Specification v5.0b".
    
    NOTE: The changes to the save/restore code are safe because the layout
          of struct hvm_viridian_vcpu_context is unchanged and the new
          interpretation of the (previously so named) vp_assist_vector field
          as the boolean pending flag maintains the correct semantics.
    
    Signed-off-by: Paul Durrant <paul.durrant@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 48a933ee590e2fdfa240484ebda4f76096277d7e
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Fri Jan 19 11:16:58 2018 +0100

    x86/efi: fix build with linkers that support both coff-x86-64 and pe-x86-64
    
    When using a linker that supports both formats the following error
    will be triggered:
    
    efi/buildid.o: file not recognized: File format is ambiguous
    efi/buildid.o: matching formats: coff-x86-64 pe-x86-64
    
    Solve this by specifying the efi/buildid.o format to pe-x86-64.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Doug Goldstein <cardoe@cardoe.com>

commit 97207ddd3b2bbbf6e723d8c5f2a93592a1cf5d81
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Jan 19 11:16:10 2018 +0100

    x86/shadow: widen reference count
    
    Utilize as many of the bits available in the union as possible, without
    (just to be on the safe side) colliding with any of the bits outside of
    PGT_type_mask.
    
    Note that the first and last hunks of the xen/include/asm-x86/mm.h
    change are merely code motion.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Tim Deegan <tim@xen.org>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 7867181b2ad63f0d2f1ba97598e577538b83882f
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Jan 19 11:14:42 2018 +0100

    x86/PoD: correctly handle non-order-0 decrease-reservation requests
    
    p2m_pod_decrease_reservation() at the moment only returns a boolean
    value: true for "nothing more to do", false for "something more to do".
    If it returns false, decrease_reservation() will loop over the entire
    range, calling guest_remove_page() for each page.
    
    Unfortunately, in the case p2m_pod_decrease_reservation() succeeds
    partially, some of the memory in the range will be not-present; at which
    point guest_remove_page() will return an error, and the entire operation
    will fail.
    
    Fix this by:
    1. Having p2m_pod_decrease_reservation() return exactly the number of
       gpfn pages it has handled (i.e., replaced with 'not present').
    2. Making guest_remove_page() return -ENOENT in the case that the gpfn
       in question was already empty (and in no other cases).
    3. When looping over guest_remove_page(), expect the number of -ENOENT
       failures to be no larger than the number of pages
       p2m_pod_decrease_reservation() removed.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Signed-off-by: George Dunlap <george.dunlap@citrix.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Julien Grall <julien.grall@linaro.org>

commit 75c47ae9b63483ac404ea7e4a28cb5fb1d989ef8
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Jan 19 11:09:55 2018 +0100

    x86/HVM: make explicit that hvm_print_line() does output only
    
    On input "c" being 0xff should already have the effect of bailing early
    (due to the isprint()), but let's rather make this explicit. Also
    convert the BUG_ON() to an ASSERT() (nothing fatal happens in the
    function if this is violated), at the same time extending what is being
    checked.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
(qemu changes not included)


--===============8189168930618671913==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8189168930618671913==--
