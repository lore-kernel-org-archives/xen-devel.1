From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable-smoke test] 121953: regressions - FAIL
Date: Fri, 06 Apr 2018 06:21:11 +0000
Message-ID: <osstest-121953-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7534653093563475721=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+rjf=g3=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1f4KkN-0003Y0-1N
 for xen-devel@lists.xenproject.org; Fri, 06 Apr 2018 06:21:15 +0000
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

--===============7534653093563475721==
Content-Type: text/plain

flight 121953 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/121953/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-xsm               6 xen-build                fail REGR. vs. 121876
 build-armhf                   6 xen-build                fail REGR. vs. 121876

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  18d12056ccea435dca7fcbe2085fff15bca19046
baseline version:
 xen                  451004603247205467ec34b366b4cfa3814a5d95

Last test of basis   121876  2018-04-05 10:04:25 Z    0 days
Failing since        121889  2018-04-05 13:02:10 Z    0 days    6 attempts
Testing same since   121920  2018-04-05 19:01:57 Z    0 days    4 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  George Dunlap <george.dunlap@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <julien.grall@arm.com>
  Kevin Tian <kevin.tian@intel.com>
  Wei Liu <wei.liu2@citrix.com>

jobs:
 build-arm64-xsm                                              fail    
 build-amd64                                                  pass    
 build-armhf                                                  fail    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          blocked 
 test-arm64-arm64-xl-xsm                                      blocked 
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


Not pushing.

------------------------------------------------------------
commit 18d12056ccea435dca7fcbe2085fff15bca19046
Author: Julien Grall <julien.grall@arm.com>
Date:   Wed Feb 21 13:46:25 2018 +0000

    xen/pdx: Introduce helper to convert MFN <-> PDX
    
    This will avoid use of pfn_to_pdx(mfn_x(mfn)) over the code base.
    
    Signed-off-by: Julien Grall <julien.grall@arm.com>
    Reviewed-by: Wei Liu <wei.liu2@citrix.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit cf2239a6288c7095583d3351f5024ab8c1e37f87
Author: Julien Grall <julien.grall@arm.com>
Date:   Wed Feb 21 13:46:24 2018 +0000

    xen/x86: mm: Switch x86/mm.c to use typesafe for virt_to_mfn
    
    No functional change intended.
    
    While we are here, use PFN_DOWN() rather than open coding it.
    
    Signed-off Julien Grall <julien.grall@arm.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit da588a0dbe76c52fdfd90582bf560643a1f9eb20
Author: Julien Grall <julien.grall@arm.com>
Date:   Wed Feb 21 13:46:24 2018 +0000

    xen/x86: Remove unused override of page_to_mfn/mfn_to_page
    
    A few files override page_to_mfn/mfn_to_page but actually never use
    those macros. So drop them.
    
    Signed-off-by: Julien Grall <julien.grall@arm.com>
    Acked-by: George Dunlap <george.dunlap@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit acf92c83b58e404374300397801deb80fb8d883e
Author: Wei Liu <wei.liu2@citrix.com>
Date:   Fri Mar 9 17:20:14 2018 +0000

    x86/mm: skip incrementing mfn if it is not a valid mfn
    
    In a follow-up patch, some callers will be switched to pass
    INVALID_MFN instead of zero for non-present mappings. So skip
    incrementing mfn if it is not a valid one.
    
    Signed-off-by: Wei Liu <wei.liu2@citrix.com>
    Signed-off-by: Julien Grall <julien.grall@arm.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 454efb2a31b64b98e3dd55c083ce41b87375faa6
Author: Jan Beulich <JBeulich@suse.com>
Date:   Mon Mar 19 07:40:12 2018 -0600

    x86/XPTI: reduce .text.entry
    
    This exposes less code pieces and at the same time reduces the range
    covered from slightly above 3 pages to a little below 2 of them.
    
    The code being moved is unchanged, except for the removal of trailing
    blanks, insertion of blanks between operands, and a pointless q suffix
    from "retq".
    
    A few more small pieces could be moved, but it seems better to me to
    leave them where they are to not make it overly hard to follow code
    paths.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 442b303cdaf7d774c0be8096fe5dbab68701abd3
Author: Jan Beulich <JBeulich@suse.com>
Date:   Mon Mar 19 07:39:04 2018 -0600

    x86: log XPTI enabled status
    
    At the same time also report the state of the two defined
    ARCH_CAPABILITIES MSR bits. To avoid further complicating the
    conditional around that printk(), drop it (it's a debug level one only
    anyway).
    
    Issue the main message without any XENLOG_*, and also drop XENLOG_INFO
    from the respective BTI message, to make sure they're visible at default
    log level also in release builds.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Tested-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Wei Liu <wei.liu2@citrix.com>

commit bee0732d2066691d8204e418d10110930ee4d4f8
Author: Jan Beulich <JBeulich@suse.com>
Date:   Mon Mar 19 07:37:54 2018 -0600

    x86: disable XPTI when RDCL_NO
    
    Use the respective ARCH_CAPABILITIES MSR bit, but don't expose the MSR
    to guests yet.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Tested-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>

commit c0d98b35714fb707217c9062b6518e158cd72eea
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Jan 25 15:45:37 2018 +0000

    x86/vtx: Introduce a typed union for CR access exit information
    
    This reduces code volume, and has a minor improvement on compiled size,
    probably due to the removal of several temporary variables.
    
      add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-50 (-50)
      function                                     old     new   delta
      vmx_vmexit_handler                          6881    6878      -3
      nvmx_n2_vmexit_handler                      3473    3426     -47
    
    Take the opportunity to make some style corrections, and add some
    ASSERT_UNREACHABLE()s in appropriate places.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Kevin Tian <kevin.tian@intel.com>

commit 36bc5fc631b08bcf03c6977e79f026a459d76302
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Mar 16 16:57:18 2018 +0000

    xen/public: Rename xen_domctl_createdomain.config to arch
    
    This is a tools only hypercall so fine to change.  Altering the name avoids
    having confusing code such as config->config all over the hypervisor and
    toolstack.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Julien Grall <julien.grall@arm.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>

commit 2649612686f968a52ce53d173f5c2a3088ad17dd
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Mar 9 13:03:26 2018 +0000

    tools/libxl: Don't prepare or save xc_config when soft resetting a domain
    
    xc_config is only used by xc_domain_create(), but by calling
    libxl__arch_domain_{prepare,save}_config() we clobber the real settings with
    the default settings.
    
    Move all data and calls relating to xc_domain_create() into the path which
    calls it.
    
    As far as I can tell, soft_reset has always been broken for ARM domains using
    LIBXL_GIC_VERSION_DEFAULT, which elicits a hard error out of
    libxl__arch_domain_save_config(), and only works on x86 because this function
    is a no-op.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>

commit 74fd984ae699727ae98f4fc36450ff76c8fc7ff3
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Mar 9 12:24:13 2018 +0000

    tools/libxl: Drop xc_domain_configuration_t from libxl__domain_build_state
    
    The data it stores is initialised and exclusively used within
    libxl__domain_make(), with the important details written back elsewhere by
    libxl__arch_domain_save_config().  Prepare xc_config on libxl__domain_make()'s
    stack, and drop the parameter.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>
(qemu changes not included)


--===============7534653093563475721==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7534653093563475721==--
