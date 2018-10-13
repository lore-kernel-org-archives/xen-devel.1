From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable bisection] complete test-xtf-amd64-amd64-4
Date: Sat, 13 Oct 2018 20:58:29 +0000
Message-ID: <E1gBQzV-0006eq-Vg@osstest.test-lab.xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1430366228271343358=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=75ja=mz=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1gBQza-0008MQ-7r
 for xen-devel@lists.xenproject.org; Sat, 13 Oct 2018 20:58:34 +0000
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

--===============1430366228271343358==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job test-xtf-amd64-amd64-4
testid xtf-fep

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Tree: xtf git://xenbits.xen.org/xtf.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  e9be34be5f9a1a6ecbf05ba9502cd705ae441476
  Bug not present: 5e04bf333b954fcfd86eda3d258dc69bcf0586a3
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/128703/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-xtf-amd64-amd64-4.xtf-fep.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-xtf-amd64-amd64-4.xtf-fep --summary-out=tmp/128703.bisection-summary --basis-template=128523 --blessings=real,real-bisect xen-unstable test-xtf-amd64-amd64-4 xtf-fep
Searching for failure / basis pass:
 128614 fail [host=elbling0] / 128523 [host=godello1] 128498 [host=huxelrebe0] 128478 [host=fiano0] 128464 [host=elbling1] 128445 [host=albana1] 128414 [host=albana0] 128354 [host=debina0] 128333 [host=pinot1] 128314 [host=chardonnay0] 128281 [host=joubertin0] 128267 [host=huxelrebe1] 128240 [host=rimava1] 128175 [host=italia0] 128118 [host=godello0] 128084 ok.
Failure / basis pass flights: 128614 / 128084
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Tree: xtf git://xenbits.xen.org/xtf.git
Latest e6abbe80c8838e9c0bdb51835e6218008fa49386 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 162fc8295f31240dc3670190a91e9bbc03b0d7be 089f9be25f4bb445f68241ba05ab4e17786e21a7
Basis pass 1244bbb3e92135d247e2dddfa6fe5e3e171a9635 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 940185b2f6f343251c2b83bd96e599398cea51ec 089f9be25f4bb445f68241ba05ab4e17786e21a7
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#1244bbb3e92135d247e2dddfa6fe5e3e171a9635-e6abbe80c8838e9c0bdb51835e6218008fa49386 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149-9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 git://xenbits.xen.org/qemu-xen.git#de5b678ca4dcdfa83e322491d478d66df56c1986-de5b678ca4dcdfa83e322491d478d66df56c1986 git://xenbits.xen.org/xen.git#940185b2f6f343251c2b83bd96e599398cea51ec-162fc8295f31240dc3670190a91e9bbc03b0d7be git://xenbits.xen.org/xtf.git#089f9be25f4bb445f68241ba05ab4e17786e21a7-089f9be25f4bb445f68241ba05ab4e17786e21a7
Loaded 2001 nodes in revision graph
Searching for test results:
 127956 [host=elbling1]
 127966 [host=fiano0]
 127997 [host=godello1]
 128084 pass 1244bbb3e92135d247e2dddfa6fe5e3e171a9635 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 940185b2f6f343251c2b83bd96e599398cea51ec 089f9be25f4bb445f68241ba05ab4e17786e21a7
 128033 [host=baroque0]
 128118 [host=godello0]
 128175 [host=italia0]
 128240 [host=rimava1]
 128267 [host=huxelrebe1]
 128281 [host=joubertin0]
 128314 [host=chardonnay0]
 128333 [host=pinot1]
 128354 [host=debina0]
 128414 [host=albana0]
 128445 [host=albana1]
 128523 [host=godello1]
 128478 [host=fiano0]
 128464 [host=elbling1]
 128498 [host=huxelrebe0]
 128614 fail e6abbe80c8838e9c0bdb51835e6218008fa49386 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 162fc8295f31240dc3670190a91e9bbc03b0d7be 089f9be25f4bb445f68241ba05ab4e17786e21a7
 128676 pass 1244bbb3e92135d247e2dddfa6fe5e3e171a9635 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 940185b2f6f343251c2b83bd96e599398cea51ec 089f9be25f4bb445f68241ba05ab4e17786e21a7
 128679 fail e6abbe80c8838e9c0bdb51835e6218008fa49386 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 162fc8295f31240dc3670190a91e9bbc03b0d7be 089f9be25f4bb445f68241ba05ab4e17786e21a7
 128682 pass 0e5cdbac030358fea3b757d033c8fda29138b866 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 edb4724e36256c495a6aa3cf1a12722efe271f9d 089f9be25f4bb445f68241ba05ab4e17786e21a7
 128684 pass 85222eb56f2a5a92fdf1cf95cfd8ea57cc3864ff c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 359970fd8b781fac2ddcbc84dd5b890075fa08ef 089f9be25f4bb445f68241ba05ab4e17786e21a7
 128686 pass d3ddd8e16cab439c0abbf08a33a6a0465c8e67da c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 359970fd8b781fac2ddcbc84dd5b890075fa08ef 089f9be25f4bb445f68241ba05ab4e17786e21a7
 128687 pass e6abbe80c8838e9c0bdb51835e6218008fa49386 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 cc6e309c6e4368a1094b5e7593cf8cf5803ed709 089f9be25f4bb445f68241ba05ab4e17786e21a7
 128690 pass e6abbe80c8838e9c0bdb51835e6218008fa49386 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 0d34bca5e6040f9874e6a69c45c7908239f024b9 089f9be25f4bb445f68241ba05ab4e17786e21a7
 128692 pass e6abbe80c8838e9c0bdb51835e6218008fa49386 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 a696f4e63ca51693736a6cf7b911522287238653 089f9be25f4bb445f68241ba05ab4e17786e21a7
 128693 pass e6abbe80c8838e9c0bdb51835e6218008fa49386 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 5e04bf333b954fcfd86eda3d258dc69bcf0586a3 089f9be25f4bb445f68241ba05ab4e17786e21a7
 128695 fail e6abbe80c8838e9c0bdb51835e6218008fa49386 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 cd395b1d69a773556d2af206b4ecbf56b33057ea 089f9be25f4bb445f68241ba05ab4e17786e21a7
 128697 fail e6abbe80c8838e9c0bdb51835e6218008fa49386 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 e9be34be5f9a1a6ecbf05ba9502cd705ae441476 089f9be25f4bb445f68241ba05ab4e17786e21a7
 128699 pass e6abbe80c8838e9c0bdb51835e6218008fa49386 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 5e04bf333b954fcfd86eda3d258dc69bcf0586a3 089f9be25f4bb445f68241ba05ab4e17786e21a7
 128700 fail e6abbe80c8838e9c0bdb51835e6218008fa49386 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 e9be34be5f9a1a6ecbf05ba9502cd705ae441476 089f9be25f4bb445f68241ba05ab4e17786e21a7
 128701 pass e6abbe80c8838e9c0bdb51835e6218008fa49386 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 5e04bf333b954fcfd86eda3d258dc69bcf0586a3 089f9be25f4bb445f68241ba05ab4e17786e21a7
 128703 fail e6abbe80c8838e9c0bdb51835e6218008fa49386 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 e9be34be5f9a1a6ecbf05ba9502cd705ae441476 089f9be25f4bb445f68241ba05ab4e17786e21a7
Searching for interesting versions
 Result found: flight 128084 (pass), for basis pass
 Result found: flight 128614 (fail), for basis failure
 Repro found: flight 128676 (pass), for basis pass
 Repro found: flight 128679 (fail), for basis failure
 0 revisions at e6abbe80c8838e9c0bdb51835e6218008fa49386 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 5e04bf333b954fcfd86eda3d258dc69bcf0586a3 089f9be25f4bb445f68241ba05ab4e17786e21a7
No revisions left to test, checking graph state.
 Result found: flight 128693 (pass), for last pass
 Result found: flight 128697 (fail), for first failure
 Repro found: flight 128699 (pass), for last pass
 Repro found: flight 128700 (fail), for first failure
 Repro found: flight 128701 (pass), for last pass
 Repro found: flight 128703 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  e9be34be5f9a1a6ecbf05ba9502cd705ae441476
  Bug not present: 5e04bf333b954fcfd86eda3d258dc69bcf0586a3
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/128703/


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

pnmtopng: 70 colors found
Revision graph left in /home/logs/results/bisect/xen-unstable/test-xtf-amd64-amd64-4.xtf-fep.{dot,ps,png,html,svg}.
----------------------------------------
128703: tolerable truncated

flight 128703 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/128703/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-xtf-amd64-amd64-4       11 xtf-fep                 fail baseline untested


jobs:
 test-xtf-amd64-amd64-4                                       truncated


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



--===============1430366228271343358==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1430366228271343358==--
