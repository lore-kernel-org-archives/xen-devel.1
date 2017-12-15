From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable-smoke test] 117193: trouble: broken/pass
Date: Fri, 15 Dec 2017 21:29:06 +0000
Message-ID: <osstest-117193-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5967021496608988193=="
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

--===============5967021496608988193==
Content-Type: text/plain

flight 117193 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/117193/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-xl-xsm         <job status>                 broken

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  ec320542e4f4de12305551ef5e3cd4d2ced85771
baseline version:
 xen                  c4f6ad4c5fd25cb0ccc0cdbe711db97e097f0407

Last test of basis   117152  2017-12-14 16:18:09 Z    1 days
Failing since        117157  2017-12-14 19:03:00 Z    1 days   10 attempts
Testing same since   117183  2017-12-15 13:02:36 Z    0 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Daniel De Graaf <dgdegra@tycho.nsa.gov>
  Jan Beulich <jbeulich@suse.com>
  Kevin Tian <kevin.tian@intel.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Wei Liu <wei.liu2@citrix.com>
  Yi Sun <yi.y.sun@linux.intel.com>

jobs:
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      broken  
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

broken-job test-arm64-arm64-xl-xsm broken

Not pushing.

------------------------------------------------------------
commit ec320542e4f4de12305551ef5e3cd4d2ced85771
Author: Roger Pau Monne <roger.pau@citrix.com>
Date:   Thu Nov 9 12:15:00 2017 +0100

    gcov: rename folder and header to coverage
    
    Preparatory change before adding llvm profiling support.
    No functional change.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

commit 767e6c5fd55b3f286402da466cce5944c7ed6333
Author: Roger Pau Monne <roger.pau@citrix.com>
Date:   Thu Nov 9 12:16:00 2017 +0100

    kconfig/gcov: remove gcc version choice from kconfig
    
    Use autodetect only.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 3c88e927b2d710dc7d4b5c107c46c74c1ff0e1bd
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Dec 15 11:18:06 2017 +0100

    VMX: drop bogus gpa parameter from __invept()
    
    Perhaps there once was a plan to have a flush type requiring this, but
    the current SDM has no mention of such and all callers pass zero anyway.
    
    Take the opportunity and also change involved types to uint64_t.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Kevin Tian <kevin.tian@intel.com>

commit 228ab9992ffb1d8f9d2475f2581e68b2913acb88
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Dec 15 11:17:19 2017 +0100

    domctl: improve locking during domain destruction
    
    There is no need to hold the global domctl lock across domain_kill() -
    the domain lock is fully sufficient here, and parallel cleanup after
    multiple domains performs quite a bit better this way.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 6046789dccab0c4eca836e8291d371871154289e
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Dec 15 11:16:32 2017 +0100

    x86: make _get_page_type() a proper counterpart of _put_page_type() again
    
    Drop one of the leading underscores and use bool for its "preemptible"
    parameter.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 40df03fc6ff8410b3d9aa2e7bb5163b698c39b3e
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Dec 15 11:15:54 2017 +0100

    x86: use switch() in _put_page_type()
    
    Use this to cheaply add another assertion.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 932dddc440f2a3e390b04fade513940296b7e99a
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Dec 15 11:15:16 2017 +0100

    x86: improve _put_page_type() readability
    
    By limiting the scope of rc it is more obvious that failure can be
    reported only if _put_final_page_type() failed.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citix.com>

commit 5d0f135265b8da4ee037ad25ee07f801b873bbd8
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Dec 15 11:14:31 2017 +0100

    x86: remove _PAGE_PSE check from get_page_from_l2e()
    
    With L2_DISALLOW_MASK containing _PAGE_PSE unconditionally as of commit
    56fff3e5e9 ("x86: nuke PV superpage option and code") there's no point
    anymore in separately checking for the bit.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit b13d5a4567a98870450622b1c27a60edfee0fbbc
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Dec 15 11:13:49 2017 +0100

    x86: make get_page_from_mfn() return struct page_info *
    
    Almost all users of it want it, and it calculates it anyway.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 378d31ab3e007d7a059b3e26d4062d7ac318eef4
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Dec 15 11:11:36 2017 +0100

    x86/HVM: fix hvmemul_rep_outs_set_context()
    
    There were two issues with this function: Its use of
    hvmemul_do_pio_buffer() was wrong (the function deals only with
    individual port accesses, not repeated ones, i.e. passing it
    "*reps * bytes_per_rep" does not have the intended effect). And it
    could have processed a larger set of operations in one go than was
    probably intended (limited just by the size that xmalloc() can hand
    back).
    
    By converting to proper use of hvmemul_do_pio_buffer(), no intermediate
    buffer is needed at all. As a result a preemption check is being added.
    
    Also drop unused parameters from the function.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Razvan Cojocaru <rcojocaru@bitdefender.com>
    Reviewed-by: Paul Durrant <paul.durrant@citrix.com>

commit 8439e8b6c13f0c11ee30dba8d209e8800537c1d5
Author: Yi Sun <yi.y.sun@linux.intel.com>
Date:   Fri Oct 20 10:50:00 2017 +0200

    x86: implement data structure and CPU init flow for MBA
    
    This patch implements main data structures of MBA.
    
    Like CAT features, MBA HW info has cos_max which means the max thrtl
    register number, and thrtl_max which means the max throttle value
    (delay value). It also has a flag to represent if the throttle
    value is linear or non-linear.
    
    One thrtl register of MBA stores a throttle value for one or more
    domains. The throttle value means the delay applied to traffic between
    L2 cache and next cache level.
    
    This patch also implements init flow for MBA and register stub
    callback functions.
    
    Signed-off-by: Yi Sun <yi.y.sun@linux.intel.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit d7714b2b7bac8d9ea1698793c9d040ee04c61201
Author: Yi Sun <yi.y.sun@linux.intel.com>
Date:   Fri Oct 20 10:50:00 2017 +0200

    x86: a few optimizations to psr codes
    
    This patch refines psr codes:
    1. Change type of 'cat_init_feature' to 'bool' to remove the pointless
       returning of error code.
    2. Move printk in 'cat_init_feature' to reduce a return path.
    3. Define a local variable 'feat_mask' in 'psr_cpu_init' to reduce calling of
       'cpuid_count_leaf()'.
    4. Change 'PSR_INFO_IDX_CAT_FLAG' to 'PSR_INFO_IDX_CAT_FLAGS'.
    
    Signed-off-by: Yi Sun <yi.y.sun@linux.intel.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit d6c683d846c2018934c52bb59fcd2d6980ebb6c4
Author: Yi Sun <yi.y.sun@linux.intel.com>
Date:   Fri Oct 20 10:50:00 2017 +0200

    x86: rename 'cbm_type' to 'psr_type' to make it general
    
    This patch renames 'cbm_type' to 'psr_type' to generalize it.
    Then, we can reuse this for all psr allocation features.
    
    Signed-off-by: Yi Sun <yi.y.sun@linux.intel.com>
    Reviewed-by: Wei Liu <wei.liu2@citrix.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit a58cad2d36d515ee2fa5f163a001e682b6247f55
Author: Yi Sun <yi.y.sun@linux.intel.com>
Date:   Tue Oct 24 11:33:00 2017 +0200

    Rename PSR sysctl/domctl interfaces and xsm policy to make them be general
    
    This patch renames PSR sysctl/domctl interfaces and related xsm policy to
    make them be general for all resource allocation features but not only
    for CAT. Then, we can resuse the interfaces for all allocation features.
    
    Basically, it changes 'psr_cat_op' to 'psr_alloc', and remove 'CAT_' from some
    macros. E.g.:
    1. psr_cat_op -> psr_alloc
    2. XEN_DOMCTL_psr_cat_op -> XEN_DOMCTL_psr_alloc
    3. XEN_SYSCTL_psr_cat_op -> XEN_SYSCTL_psr_alloc
    4. XEN_DOMCTL_PSR_CAT_SET_L3_CBM -> XEN_DOMCTL_PSR_SET_L3_CBM
    5. XEN_SYSCTL_PSR_CAT_get_l3_info -> XEN_SYSCTL_PSR_get_l3_info
    
    Signed-off-by: Yi Sun <yi.y.sun@linux.intel.com>
    Reviewed-by: Wei Liu <wei.liu2@citrix.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Daniel De Graaf <dgdegra@tycho.nsa.gov>

commit 0062b96961c42eff0aa0ff3b00c26e484718c8fd
Author: Yi Sun <yi.y.sun@linux.intel.com>
Date:   Fri Oct 20 10:50:00 2017 +0200

    docs: create Memory Bandwidth Allocation (MBA) feature document
    
    This patch creates MBA feature document in doc/features/. It describes
    key points to implement MBA which is described in details in Intel SDM
    "Introduction to Memory Bandwidth Allocation".
    
    Signed-off-by: Yi Sun <yi.y.sun@linux.intel.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit 896ee3980e72866b602e743396751384de301fb0
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Dec 6 17:46:20 2017 +0000

    x86/vmx: Don't use hvm_inject_hw_exception() in long_mode_do_msr_write()
    
    Since c/s 49de10f3c1718 "x86/hvm: Don't raise #GP behind the emulators back
    for MSR accesses", returning X86EMUL_EXCEPTION has pushed the exception
    generation to the top of the call tree.
    
    Using hvm_inject_hw_exception() and returning X86EMUL_EXCEPTION causes a
    double #GP injection, which combines to #DF.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Kevin Tian <kevin.tian@intel.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit d630832f9f9c2ef80b04a2c7d7f08581a18df2b3
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Oct 23 10:49:33 2017 +0100

    x86/efer: Make {read,write}_efer() into inline helpers
    
    There is no need for the overhead of a call to a separate translation unit.
    While moving the implementation, update them to use uint64_t over u64
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit fe66b42da63b820ae75dd9dd2987b32f0631ec4e
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Dec 1 13:16:12 2017 +0000

    x86/domctl: Avoid redundant zeroing in XEN_DOMCTL_get_vcpu_msrs
    
    Zero the msr structure once at initialisation time, and avoid re-zeroing the
    reserved field every time the structure is used.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)


--===============5967021496608988193==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5967021496608988193==--
