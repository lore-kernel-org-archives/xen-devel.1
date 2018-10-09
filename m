From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable-smoke bisection] complete build-arm64-xsm
Date: Tue, 09 Oct 2018 21:55:56 +0000
Message-ID: <E1g9zyu-0000C0-AZ@osstest.test-lab.xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6527795027486416257=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=w4ff=mv=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1g9zyy-0002fH-2q
 for xen-devel@lists.xenproject.org; Tue, 09 Oct 2018 21:56:00 +0000
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

--===============6527795027486416257==
Content-Type: text/plain

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-arm64-xsm
testid xen-build

Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  e9be34be5f9a1a6ecbf05ba9502cd705ae441476
  Bug not present: 5e04bf333b954fcfd86eda3d258dc69bcf0586a3
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/128549/


  commit e9be34be5f9a1a6ecbf05ba9502cd705ae441476
  Author: Roger Pau Monné <roger.pau@citrix.com>
  Date:   Tue Oct 9 16:27:13 2018 +0200
  
      x86/vtd: fix iommu_share_p2m_table
      
      Commit 2916951c1 "mm / iommu: include need_iommu() test in
      iommu_use_hap_pt()" changed the check in iommu_share_p2m_table to use
      need_iommu(d) (as part of iommu_use_hap_pt) instead of iommu_enabled,
      which broke the check because at the point in domain construction
      where iommu_share_p2m_table is called need_iommu(d) will always return
      false.
      
      Fix this by reverting to the previous logic.
      
      While there turn the hap_enabled check into an ASSERT, since the only
      caller of iommu_share_p2m_table already performs the hap_enabled check
      before calling the function.
      
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Reviewed-by: Paul Durrant <paul.durrant@citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build --summary-out=tmp/128549.bisection-summary --basis-template=128513 --blessings=real,real-bisect xen-unstable-smoke build-arm64-xsm xen-build
Searching for failure / basis pass:
 128540 fail [host=laxton1] / 128513 ok.
Failure / basis pass flights: 128540 / 128513
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest de5b678ca4dcdfa83e322491d478d66df56c1986 cd395b1d69a773556d2af206b4ecbf56b33057ea
Basis pass de5b678ca4dcdfa83e322491d478d66df56c1986 85b00385827e4e061b2ff38b549c03d0f1e66b6a
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen.git#de5b678ca4dcdfa83e322491d478d66df56c1986-de5b678ca4dcdfa83e322491d478d66df56c1986 git://xenbits.xen.org/xen.git#85b00385827e4e061b2ff38b549c03d0f1e66b6a-cd395b1d69a773556d2af206b4ecbf56b33057ea
Loaded 1001 nodes in revision graph
Searching for test results:
 128536 fail de5b678ca4dcdfa83e322491d478d66df56c1986 cd395b1d69a773556d2af206b4ecbf56b33057ea
 128547 pass de5b678ca4dcdfa83e322491d478d66df56c1986 5e04bf333b954fcfd86eda3d258dc69bcf0586a3
 128513 pass de5b678ca4dcdfa83e322491d478d66df56c1986 85b00385827e4e061b2ff38b549c03d0f1e66b6a
 128538 pass de5b678ca4dcdfa83e322491d478d66df56c1986 27225bbb6d148f6d373a4a89b0dc3f3f5bf4d193
 128527 fail de5b678ca4dcdfa83e322491d478d66df56c1986 cd395b1d69a773556d2af206b4ecbf56b33057ea
 128540 fail de5b678ca4dcdfa83e322491d478d66df56c1986 cd395b1d69a773556d2af206b4ecbf56b33057ea
 128544 pass de5b678ca4dcdfa83e322491d478d66df56c1986 5e04bf333b954fcfd86eda3d258dc69bcf0586a3
 128534 fail de5b678ca4dcdfa83e322491d478d66df56c1986 cd395b1d69a773556d2af206b4ecbf56b33057ea
 128539 pass de5b678ca4dcdfa83e322491d478d66df56c1986 5e04bf333b954fcfd86eda3d258dc69bcf0586a3
 128529 pass de5b678ca4dcdfa83e322491d478d66df56c1986 85b00385827e4e061b2ff38b549c03d0f1e66b6a
 128545 fail de5b678ca4dcdfa83e322491d478d66df56c1986 e9be34be5f9a1a6ecbf05ba9502cd705ae441476
 128541 fail de5b678ca4dcdfa83e322491d478d66df56c1986 e9be34be5f9a1a6ecbf05ba9502cd705ae441476
 128549 fail de5b678ca4dcdfa83e322491d478d66df56c1986 e9be34be5f9a1a6ecbf05ba9502cd705ae441476
Searching for interesting versions
 Result found: flight 128513 (pass), for basis pass
 Result found: flight 128527 (fail), for basis failure
 Repro found: flight 128529 (pass), for basis pass
 Repro found: flight 128534 (fail), for basis failure
 0 revisions at de5b678ca4dcdfa83e322491d478d66df56c1986 5e04bf333b954fcfd86eda3d258dc69bcf0586a3
No revisions left to test, checking graph state.
 Result found: flight 128539 (pass), for last pass
 Result found: flight 128541 (fail), for first failure
 Repro found: flight 128544 (pass), for last pass
 Repro found: flight 128545 (fail), for first failure
 Repro found: flight 128547 (pass), for last pass
 Repro found: flight 128549 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  e9be34be5f9a1a6ecbf05ba9502cd705ae441476
  Bug not present: 5e04bf333b954fcfd86eda3d258dc69bcf0586a3
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/128549/


  commit e9be34be5f9a1a6ecbf05ba9502cd705ae441476
  Author: Roger Pau Monné <roger.pau@citrix.com>
  Date:   Tue Oct 9 16:27:13 2018 +0200
  
      x86/vtd: fix iommu_share_p2m_table
      
      Commit 2916951c1 "mm / iommu: include need_iommu() test in
      iommu_use_hap_pt()" changed the check in iommu_share_p2m_table to use
      need_iommu(d) (as part of iommu_use_hap_pt) instead of iommu_enabled,
      which broke the check because at the point in domain construction
      where iommu_share_p2m_table is called need_iommu(d) will always return
      false.
      
      Fix this by reverting to the previous logic.
      
      While there turn the hap_enabled check into an ASSERT, since the only
      caller of iommu_share_p2m_table already performs the hap_enabled check
      before calling the function.
      
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Reviewed-by: Paul Durrant <paul.durrant@citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
128549: tolerable ALL FAIL

flight 128549 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/128549/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-arm64-xsm               6 xen-build               fail baseline untested


jobs:
 build-arm64-xsm                                              fail    


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



--===============6527795027486416257==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6527795027486416257==--
