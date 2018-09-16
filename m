From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable bisection] complete test-xtf-amd64-amd64-1
Date: Sun, 16 Sep 2018 10:56:47 +0000
Message-ID: <E1g1UjP-0004y2-8K@osstest.test-lab.xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6440891635917635835=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rl7q=l6=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1g1UjS-0002gP-Cw
 for xen-devel@lists.xenproject.org; Sun, 16 Sep 2018 10:56:50 +0000
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

--===============6440891635917635835==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job test-xtf-amd64-amd64-1
testid xen-boot

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Tree: xtf git://xenbits.xen.org/xtf.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  66a9274cc3435117783cd3f07b238309d7f9c6de
  Bug not present: 391266f0120c92ce8eb5bdb4a41bd314daaf6070
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/127683/


  commit 66a9274cc3435117783cd3f07b238309d7f9c6de
  Author: Roger Pau Monné <roger.pau@citrix.com>
  Date:   Fri Sep 7 11:08:00 2018 +0200
  
      iommu: make iommu_inclusive_mapping a suboption of dom0-iommu
      
      Introduce a new dom0-iommu=map-inclusive generic option that
      supersedes iommu_inclusive_mapping. The previous behavior is preserved
      and the option should only be enabled by default on Intel hardware.
      
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Reviewed-by: Paul Durrant <paul.durrant@citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: Kevin Tian <kevin.tian@intel.com>
      Acked-by: Julien Grall <julien.grall@arm.com>
      Acked-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-xtf-amd64-amd64-1.xen-boot.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-xtf-amd64-amd64-1.xen-boot --summary-out=tmp/127683.bisection-summary --basis-template=127541 --blessings=real,real-bisect xen-unstable test-xtf-amd64-amd64-1 xen-boot
Searching for failure / basis pass:
 127595 fail [host=elbling0] / 127541 [host=joubertin0] 127520 [host=elbling1] 127504 [host=pinot1] 127489 [host=baroque0] 127429 [host=albana0] 127407 [host=pinot0] 127369 [host=rimava1] 127350 [host=baroque1] 127301 [host=chardonnay0] 127280 [host=italia0] 127266 [host=godello1] 127232 [host=godello0] 127070 [host=fiano0] 127012 [host=huxelrebe1] 126952 [host=albana1] 126854 [host=pinot1] 126778 [host=elbling1] 126683 [host=baroque0] 126564 [host=albana0] 126443 [host=joubertin1] 126346 [host=rimava1] 126266 [host=godello1] 126012 [host=debina1] 125912 [host=chardonnay0] 125691 [host=godello0] 125667 [host=pinot1] 125652 [host=rimava1] 125645 [host=italia0] 125609 [host=joubertin0] 125573 [host=debina0] 125533 ok.
Failure / basis pass flights: 127595 / 125533
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Tree: xtf git://xenbits.xen.org/xtf.git
Latest 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 d7c60727a3f26b7fda49c8de188dd1cec021d23a 089f9be25f4bb445f68241ba05ab4e17786e21a7
Basis pass 1e92e813554a93741666e9f378a83d70405b9076 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 61bdddb82151fbf51c58f6ebc1b4a687942c45a8 f3702a5d29e94814991988bf8747341e18a2e8f5
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#1e92e813554a93741666e9f378a83d70405b9076-7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#c8ea0457495342c417c3dc033bba25148b279f60-9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 git://xenbits.xen.org/qemu-xen.git#43139135a8938de44f66333831d3a8655d07663a-de5b678ca4dcdfa83e322491d478d66df56c1986 git://xenbits.xen.org/xen.git#61bdddb82151fbf51c58f6ebc1b4a687942c45a8-d7c60727a3f26b7fda49c8de188dd1cec021d23a git://xenbits.xen.org/xtf.git#f3702a5d29e94814991988bf8747341e18a2e8f5-089f9be25f4bb445f68241ba05ab4e17786e21a7
adhoc-revtuple-generator: tree discontiguous: linux-pvops
adhoc-revtuple-generator: tree discontiguous: qemu-xen
>From git://cache:9419/git://xenbits.xen.org/xen
   1dfb8e6e09..558408cab9  coverity-tested/smoke -> origin/coverity-tested/smoke
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Loaded 1446 nodes in revision graph
Searching for test results:
 125533 pass 1e92e813554a93741666e9f378a83d70405b9076 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 61bdddb82151fbf51c58f6ebc1b4a687942c45a8 f3702a5d29e94814991988bf8747341e18a2e8f5
 125609 [host=joubertin0]
 125573 [host=debina0]
 125645 [host=italia0]
 125652 [host=rimava1]
 125667 [host=pinot1]
 125691 [host=godello0]
 125912 [host=chardonnay0]
 126012 [host=debina1]
 126346 [host=rimava1]
 126266 [host=godello1]
 126443 [host=joubertin1]
 126564 [host=albana0]
 126683 [host=baroque0]
 126854 [host=pinot1]
 126778 [host=elbling1]
 126952 [host=albana1]
 127070 [host=fiano0]
 127012 [host=huxelrebe1]
 127123 []
 127232 [host=godello0]
 127266 [host=godello1]
 127280 [host=italia0]
 127301 [host=chardonnay0]
 127350 [host=baroque1]
 127369 [host=rimava1]
 127407 [host=pinot0]
 127429 [host=albana0]
 127489 [host=baroque0]
 127541 [host=joubertin0]
 127504 [host=pinot1]
 127520 [host=elbling1]
 127595 fail 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 d7c60727a3f26b7fda49c8de188dd1cec021d23a 089f9be25f4bb445f68241ba05ab4e17786e21a7
 127651 fail 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 d7c60727a3f26b7fda49c8de188dd1cec021d23a 089f9be25f4bb445f68241ba05ab4e17786e21a7
 127653 pass 1e92e813554a93741666e9f378a83d70405b9076 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 7e6a733405b4f4221da51b6c4e5a735b8e64ede8 f3702a5d29e94814991988bf8747341e18a2e8f5
 127683 fail 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 66a9274cc3435117783cd3f07b238309d7f9c6de 089f9be25f4bb445f68241ba05ab4e17786e21a7
 127664 pass 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 391266f0120c92ce8eb5bdb4a41bd314daaf6070 089f9be25f4bb445f68241ba05ab4e17786e21a7
 127654 pass 1e92e813554a93741666e9f378a83d70405b9076 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 3f2002614af51dfd507168a1696658bac91155ce f3702a5d29e94814991988bf8747341e18a2e8f5
 127656 pass 1e92e813554a93741666e9f378a83d70405b9076 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 6069dd65d67e846b37aa03c48d22ceaf1afd211a 089f9be25f4bb445f68241ba05ab4e17786e21a7
 127670 pass 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 391266f0120c92ce8eb5bdb4a41bd314daaf6070 089f9be25f4bb445f68241ba05ab4e17786e21a7
 127658 fail 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 6bf0be5af852f2317b75ab94f1d2bb045ebef452 089f9be25f4bb445f68241ba05ab4e17786e21a7
 127621 pass 1e92e813554a93741666e9f378a83d70405b9076 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 61bdddb82151fbf51c58f6ebc1b4a687942c45a8 f3702a5d29e94814991988bf8747341e18a2e8f5
 127660 pass 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 66b245d9eaebfef710148d410ae97a2eaedc3170 089f9be25f4bb445f68241ba05ab4e17786e21a7
 127661 pass 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 1dfb8e6e0948912d1fd96d6ed9034527c5c74f31 089f9be25f4bb445f68241ba05ab4e17786e21a7
 127668 fail 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 66a9274cc3435117783cd3f07b238309d7f9c6de 089f9be25f4bb445f68241ba05ab4e17786e21a7
 127673 fail 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 66a9274cc3435117783cd3f07b238309d7f9c6de 089f9be25f4bb445f68241ba05ab4e17786e21a7
 127676 pass 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 391266f0120c92ce8eb5bdb4a41bd314daaf6070 089f9be25f4bb445f68241ba05ab4e17786e21a7
Searching for interesting versions
 Result found: flight 125533 (pass), for basis pass
 Result found: flight 127595 (fail), for basis failure
 Repro found: flight 127621 (pass), for basis pass
 Repro found: flight 127651 (fail), for basis failure
 0 revisions at 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 391266f0120c92ce8eb5bdb4a41bd314daaf6070 089f9be25f4bb445f68241ba05ab4e17786e21a7
No revisions left to test, checking graph state.
 Result found: flight 127664 (pass), for last pass
 Result found: flight 127668 (fail), for first failure
 Repro found: flight 127670 (pass), for last pass
 Repro found: flight 127673 (fail), for first failure
 Repro found: flight 127676 (pass), for last pass
 Repro found: flight 127683 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  66a9274cc3435117783cd3f07b238309d7f9c6de
  Bug not present: 391266f0120c92ce8eb5bdb4a41bd314daaf6070
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/127683/


  commit 66a9274cc3435117783cd3f07b238309d7f9c6de
  Author: Roger Pau Monné <roger.pau@citrix.com>
  Date:   Fri Sep 7 11:08:00 2018 +0200
  
      iommu: make iommu_inclusive_mapping a suboption of dom0-iommu
      
      Introduce a new dom0-iommu=map-inclusive generic option that
      supersedes iommu_inclusive_mapping. The previous behavior is preserved
      and the option should only be enabled by default on Intel hardware.
      
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Reviewed-by: Paul Durrant <paul.durrant@citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: Kevin Tian <kevin.tian@intel.com>
      Acked-by: Julien Grall <julien.grall@arm.com>
      Acked-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>

pnmtopng: 137 colors found
Revision graph left in /home/logs/results/bisect/xen-unstable/test-xtf-amd64-amd64-1.xen-boot.{dot,ps,png,html,svg}.
----------------------------------------
127683: tolerable ALL FAIL

flight 127683 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/127683/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-xtf-amd64-amd64-1        7 xen-boot                fail baseline untested


jobs:
 test-xtf-amd64-amd64-1                                       fail    


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



--===============6440891635917635835==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6440891635917635835==--
