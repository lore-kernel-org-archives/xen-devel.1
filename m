From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable bisection] complete
	test-amd64-amd64-qemuu-nested-intel
Date: Sun, 04 Mar 2018 22:47:38 +0000
Message-ID: <E1escPq-00048d-As@osstest.test-lab.xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6977174853107856226=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=auwy=f2=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1escQ4-0007nq-9t
 for xen-devel@lists.xenproject.org; Sun, 04 Mar 2018 22:47:52 +0000
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

--===============6977174853107856226==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-qemuu-nested-intel
testid debian-hvm-install/l1/l2

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  40681735502648fdc45973382a440aa38f4ec800
  Bug not present: c6527bc66b6dd7a8dadaebb1047c8e52c6c5793c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/120243/


  commit 40681735502648fdc45973382a440aa38f4ec800
  Author: Roger Pau Monné <roger.pau@citrix.com>
  Date:   Tue Feb 27 14:10:33 2018 +0100
  
      vmx/hap: optimize CR4 trapping
      
      There a bunch of bits in CR4 that should be allowed to be set directly
      by the guest without requiring Xen intervention, currently this is
      already done by passing through guest writes into the CR4 used when
      running in non-root mode, but taking an expensive vmexit in order to
      do so.
      
      xenalyze reports the following when running a PV guest in shim mode:
      
       CR_ACCESS             3885950  6.41s 17.04%  3957 cyc { 2361| 3378| 7920}
         cr4  3885940  6.41s 17.04%  3957 cyc { 2361| 3378| 7920}
         cr3        1  0.00s  0.00%  3480 cyc { 3480| 3480| 3480}
           *[  0]        1  0.00s  0.00%  3480 cyc { 3480| 3480| 3480}
         cr0        7  0.00s  0.00%  7112 cyc { 3248| 5960|17480}
         clts        2  0.00s  0.00%  4588 cyc { 3456| 5720| 5720}
      
      After this change this turns into:
      
       CR_ACCESS                  12  0.00s  0.00%  9972 cyc { 3680|11024|24032}
         cr4        2  0.00s  0.00% 17528 cyc {11024|24032|24032}
         cr3        1  0.00s  0.00%  3680 cyc { 3680| 3680| 3680}
           *[  0]        1  0.00s  0.00%  3680 cyc { 3680| 3680| 3680}
         cr0        7  0.00s  0.00%  9209 cyc { 4184| 7848|17488}
         clts        2  0.00s  0.00%  8232 cyc { 5352|11112|11112}
      
      Note that this optimized trapping is currently only applied to guests
      running with HAP on Intel hardware. If using shadow paging more CR4
      bits need to be unconditionally trapped, which makes this approach
      unlikely to yield any important performance improvements.
      
      Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Acked-by: Razvan Cojocaru <rcojocaru@bitdefender.com>
      Reviewed-by: Kevin Tian <kevin.tian@intel.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-amd64-qemuu-nested-intel.debian-hvm-install--l1--l2.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-amd64-qemuu-nested-intel.debian-hvm-install--l1--l2 --summary-out=tmp/120243.bisection-summary --basis-template=120037 --blessings=real,real-bisect xen-unstable test-amd64-amd64-qemuu-nested-intel debian-hvm-install/l1/l2
Searching for failure / basis pass:
 120120 fail [host=fiano0] / 120037 [host=elbling0] 120001 [host=baroque0] 119970 [host=godello0] 119879 [host=elbling1] 119785 [host=godello1] 119713 [host=huxelrebe1] 119651 [host=huxelrebe0] 119592 [host=baroque1] 119521 [host=italia0] 119451 [host=chardonnay1] 119358 [host=chardonnay0] 119217 ok.
Failure / basis pass flights: 120120 / 119217
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 19c04ca5b239e6e2277a5b381d1e79482ab9bbc5 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 85688075ccc22c12bd0fca2a2c269199938e104c
Basis pass 7f3bd8db99746a60bcae1ec4059a4756d19b63c2 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 27196d4cc917d91b5b5daee50173565139ca9c9d
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#7f3bd8db99746a60bcae1ec4059a4756d19b63c2-19c04ca5b239e6e2277a5b381d1e79482ab9bbc5 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#c8ea0457495342c417c3dc033bba25148b279f60-c8ea0457495342c417c3dc033bba25148b279f60 git://xenbits.xen.org/qemu-xen.git#2b033e396f4fa0981bae1213cdacd15775655a97-2b033e396f4fa0981bae1213cdacd15775655a97 git://xenbits.xen.org/xen.git#27196d4cc917d91b5b5daee50173565139ca9c9d-85688075ccc22c12bd0fca2a2c269199938e104c
Loaded 2001 nodes in revision graph
Searching for test results:
 119217 pass 7f3bd8db99746a60bcae1ec4059a4756d19b63c2 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 27196d4cc917d91b5b5daee50173565139ca9c9d
 119358 [host=chardonnay0]
 119451 [host=chardonnay1]
 119521 [host=italia0]
 119592 [host=baroque1]
 119651 [host=huxelrebe0]
 119713 [host=huxelrebe1]
 119785 [host=godello1]
 119970 [host=godello0]
 119879 [host=elbling1]
 120001 [host=baroque0]
 120076 fail irrelevant
 120037 [host=elbling0]
 120161 pass 7f3bd8db99746a60bcae1ec4059a4756d19b63c2 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 27196d4cc917d91b5b5daee50173565139ca9c9d
 120180 pass b7dc0f532107ec150ccaf381d926c07f6c3fa30d c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 da3d180d101cf81d085f0c6560d70acd16c934bd
 120176 fail irrelevant
 120120 fail 19c04ca5b239e6e2277a5b381d1e79482ab9bbc5 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 85688075ccc22c12bd0fca2a2c269199938e104c
 120183 pass 90ca269463c55e99e3e91c667a821c6303f207ec c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 da3d180d101cf81d085f0c6560d70acd16c934bd
 120186 fail 19c04ca5b239e6e2277a5b381d1e79482ab9bbc5 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 85688075ccc22c12bd0fca2a2c269199938e104c
 120192 pass d947e0d510a328d30c399c99a41be558e35a4390 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 a823a5280f25ad19a751dd9a41044f556471e61a
 120198 pass e4f0069c647e94d8070fc6f6ae1d753d14684c14 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 a823a5280f25ad19a751dd9a41044f556471e61a
 120203 pass 19c04ca5b239e6e2277a5b381d1e79482ab9bbc5 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 16f878bf69ae0ef0dbb7e8c7cc59a86702c7885f
 120206 pass 19c04ca5b239e6e2277a5b381d1e79482ab9bbc5 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 9d2f8f9c65d4da35437f50ed9e812a2c5ab313e2
 120210 fail 19c04ca5b239e6e2277a5b381d1e79482ab9bbc5 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 dc96c65ed6d7ffd4c95487373df708d97443cf77
 120212 pass 19c04ca5b239e6e2277a5b381d1e79482ab9bbc5 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 d05f1eb3741b85ef37d92d2971528aab2fe64820
 120216 fail 19c04ca5b239e6e2277a5b381d1e79482ab9bbc5 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 40681735502648fdc45973382a440aa38f4ec800
 120237 pass 19c04ca5b239e6e2277a5b381d1e79482ab9bbc5 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 c6527bc66b6dd7a8dadaebb1047c8e52c6c5793c
 120218 pass 19c04ca5b239e6e2277a5b381d1e79482ab9bbc5 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 c6527bc66b6dd7a8dadaebb1047c8e52c6c5793c
 120243 fail 19c04ca5b239e6e2277a5b381d1e79482ab9bbc5 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 40681735502648fdc45973382a440aa38f4ec800
 120222 fail 19c04ca5b239e6e2277a5b381d1e79482ab9bbc5 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 40681735502648fdc45973382a440aa38f4ec800
 120225 pass 19c04ca5b239e6e2277a5b381d1e79482ab9bbc5 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 c6527bc66b6dd7a8dadaebb1047c8e52c6c5793c
 120231 fail 19c04ca5b239e6e2277a5b381d1e79482ab9bbc5 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 40681735502648fdc45973382a440aa38f4ec800
Searching for interesting versions
 Result found: flight 119217 (pass), for basis pass
 Result found: flight 120120 (fail), for basis failure
 Repro found: flight 120161 (pass), for basis pass
 Repro found: flight 120186 (fail), for basis failure
 0 revisions at 19c04ca5b239e6e2277a5b381d1e79482ab9bbc5 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 c6527bc66b6dd7a8dadaebb1047c8e52c6c5793c
No revisions left to test, checking graph state.
 Result found: flight 120218 (pass), for last pass
 Result found: flight 120222 (fail), for first failure
 Repro found: flight 120225 (pass), for last pass
 Repro found: flight 120231 (fail), for first failure
 Repro found: flight 120237 (pass), for last pass
 Repro found: flight 120243 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  40681735502648fdc45973382a440aa38f4ec800
  Bug not present: c6527bc66b6dd7a8dadaebb1047c8e52c6c5793c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/120243/


  commit 40681735502648fdc45973382a440aa38f4ec800
  Author: Roger Pau Monné <roger.pau@citrix.com>
  Date:   Tue Feb 27 14:10:33 2018 +0100
  
      vmx/hap: optimize CR4 trapping
      
      There a bunch of bits in CR4 that should be allowed to be set directly
      by the guest without requiring Xen intervention, currently this is
      already done by passing through guest writes into the CR4 used when
      running in non-root mode, but taking an expensive vmexit in order to
      do so.
      
      xenalyze reports the following when running a PV guest in shim mode:
      
       CR_ACCESS             3885950  6.41s 17.04%  3957 cyc { 2361| 3378| 7920}
         cr4  3885940  6.41s 17.04%  3957 cyc { 2361| 3378| 7920}
         cr3        1  0.00s  0.00%  3480 cyc { 3480| 3480| 3480}
           *[  0]        1  0.00s  0.00%  3480 cyc { 3480| 3480| 3480}
         cr0        7  0.00s  0.00%  7112 cyc { 3248| 5960|17480}
         clts        2  0.00s  0.00%  4588 cyc { 3456| 5720| 5720}
      
      After this change this turns into:
      
       CR_ACCESS                  12  0.00s  0.00%  9972 cyc { 3680|11024|24032}
         cr4        2  0.00s  0.00% 17528 cyc {11024|24032|24032}
         cr3        1  0.00s  0.00%  3680 cyc { 3680| 3680| 3680}
           *[  0]        1  0.00s  0.00%  3680 cyc { 3680| 3680| 3680}
         cr0        7  0.00s  0.00%  9209 cyc { 4184| 7848|17488}
         clts        2  0.00s  0.00%  8232 cyc { 5352|11112|11112}
      
      Note that this optimized trapping is currently only applied to guests
      running with HAP on Intel hardware. If using shadow paging more CR4
      bits need to be unconditionally trapped, which makes this approach
      unlikely to yield any important performance improvements.
      
      Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Acked-by: Razvan Cojocaru <rcojocaru@bitdefender.com>
      Reviewed-by: Kevin Tian <kevin.tian@intel.com>

pnmtopng: 93 colors found
Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-amd64-qemuu-nested-intel.debian-hvm-install--l1--l2.{dot,ps,png,html,svg}.
----------------------------------------
120243: tolerable ALL FAIL

flight 120243 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/120243/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-qemuu-nested-intel 17 debian-hvm-install/l1/l2 fail baseline untested


jobs:
 test-amd64-amd64-qemuu-nested-intel                          fail    


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



--===============6977174853107856226==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6977174853107856226==--
