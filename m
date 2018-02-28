From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable-smoke test] 120102: trouble: broken/pass
Date: Wed, 28 Feb 2018 21:40:20 +0000
Message-ID: <osstest-120102-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2245134217551266385=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zfhr=fw=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1er9Sl-0000a3-BV
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 21:40:35 +0000
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

--===============2245134217551266385==
Content-Type: text/plain

flight 120102 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/120102/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl             <job status>                 broken
 test-armhf-armhf-xl           4 host-install(4)        broken REGR. vs. 120098

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  85688075ccc22c12bd0fca2a2c269199938e104c
baseline version:
 xen                  cb671efbf1fae302c0ee5ebd6e23564e319babc8

Last test of basis   120098  2018-02-28 16:01:46 Z    0 days
Testing same since   120102  2018-02-28 19:01:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  George Dunlap <george.dunlap@citrix.com>
  Kevin Tian <kevin.tian@intel.com>
  Razvan Cojocaru <rcojocaru@bitdefender.com>
  Tamas K Lengyel <tamas@tklengyel.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          broken  
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386                     pass    
 test-amd64-amd64-libvirt                                     pass    


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

broken-job test-armhf-armhf-xl broken
broken-step test-armhf-armhf-xl host-install(4)

Not pushing.

------------------------------------------------------------
commit 85688075ccc22c12bd0fca2a2c269199938e104c
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Feb 21 18:10:00 2018 +0000

    x86/hvm: Constify the read side of vlapic handling
    
    This is in preparation to make hvm_x2apic_msr_read() take a const vcpu
    pointer.  One modification is to alter vlapic_get_tmcct() to not use current.
    
    This in turn needs an alteration to hvm_get_guest_time_fixed(), which is safe
    because the only mutable action it makes is to take the domain plt lock.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 62e80dff59c779cb56755b419120529e3d7eb17d
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Feb 26 14:23:03 2018 +0000

    x86/vmx: Simplfy the default cases in vmx_msr_{read,write}_intercept()
    
    The default case of vmx_msr_write_intercept() in particular is very tangled.
    
    First of all, fold long_mode_do_msr_{read,write}() into their callers.  These
    functions were split out in the past because of the 32bit build of Xen, but it
    is unclear why the cases weren't simply #ifdef'd in place.
    
    Next, invert the vmx_write_guest_msr()/is_last_branch_msr() logic to break if
    the condition is satisfied, rather than nesting if it wasn't.  This allows the
    wrmsr_hypervisor_regs() call to be un-nested with respect to the other default
    logic.
    
    No practical difference from a guests point of view.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Kevin Tian <kevin.tian@intel.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit b68c4f1ebe4f413076c4915733a61c818b7dc73a
Author: Razvan Cojocaru <rcojocaru@bitdefender.com>
Date:   Wed Feb 28 12:38:15 2018 +0200

    x86/hvm: fix domain crash when CR3 has the noflush bit set
    
    In hardware, when PCID support is enabled and the NOFLUSH bit is set
    when writing a CR3 value, the hardware will clear that that bit and
    change the CR3 without flushing the TLB. hvm_set_cr3(), however, was
    ignoring this bit; the result was that post-vm_event checks detected
    an invalid CR3 value and crashed the domain.
    
    Handle NOFLUSH in hvm_set_cr3() by:
    1. Clearing the bit
    2. Passing a "noflush" flag to lower-level cr3 setting functions to
    indicate that a flush should not be performed.
    
    Also clear X86_CR3_NOFLUSH when reporting CR3 monitored CR3 writes.
    
    This allows introspection to be used on VMs whose operating system uses
    the NOFLUSH bit.
    
    Signed-off-by: Razvan Cojocaru <rcojocaru@bitdefender.com>
    Reported-by: Bitweasil <bitweasil@cryptohaze.com>
    Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Tamas K Lengyel <tamas@tklengyel.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>
    Acked-by: George Dunlap <george.dunlap@citrix.com>
    Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
(qemu changes not included)


--===============2245134217551266385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2245134217551266385==--
