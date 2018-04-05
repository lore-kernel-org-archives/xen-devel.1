From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable-smoke test] 121889: regressions - FAIL
Date: Thu, 05 Apr 2018 15:38:42 +0000
Message-ID: <osstest-121889-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6796400278375575884=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sc4h=g2=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1f46yN-0000DV-4B
 for xen-devel@lists.xenproject.org; Thu, 05 Apr 2018 15:38:47 +0000
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

--===============6796400278375575884==
Content-Type: text/plain

flight 121889 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/121889/

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
 xen                  c0d98b35714fb707217c9062b6518e158cd72eea
baseline version:
 xen                  451004603247205467ec34b366b4cfa3814a5d95

Last test of basis   121876  2018-04-05 10:04:25 Z    0 days
Testing same since   121889  2018-04-05 13:02:10 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
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


--===============6796400278375575884==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6796400278375575884==--
