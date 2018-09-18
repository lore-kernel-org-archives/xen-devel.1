From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable bisection] complete
 test-amd64-amd64-xl-multivcpu
Date: Tue, 18 Sep 2018 06:45:42 +0000
Message-ID: <E1g29lW-0004UQ-CS@osstest.test-lab.xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8599004112118984470=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jhnc=ma=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1g29lZ-0004Yg-LL
 for xen-devel@lists.xenproject.org; Tue, 18 Sep 2018 06:45:45 +0000
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

--===============8599004112118984470==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-xl-multivcpu
testid xen-boot

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  66a9274cc3435117783cd3f07b238309d7f9c6de
  Bug not present: 391266f0120c92ce8eb5bdb4a41bd314daaf6070
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/127758/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-amd64-xl-multivcpu.xen-boot.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-amd64-xl-multivcpu.xen-boot --summary-out=tmp/127758.bisection-summary --basis-template=127541 --blessings=real,real-bisect xen-unstable test-amd64-amd64-xl-multivcpu xen-boot
Searching for failure / basis pass:
 127595 fail [host=elbling0] / 127541 [host=italia0] 127520 [host=joubertin1] 127504 [host=joubertin0] 127489 [host=debina0] 127429 [host=chardonnay0] 127407 [host=pinot1] 127369 [host=albana0] 127350 [host=godello0] 127301 [host=chardonnay1] 127280 [host=rimava1] 127266 [host=fiano0] 127232 [host=godello1] 127070 [host=huxelrebe1] 127012 [host=pinot0] 126952 [host=italia0] 126854 [host=joubertin0] 126778 ok.
Failure / basis pass flights: 127595 / 126778
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 d7c60727a3f26b7fda49c8de188dd1cec021d23a
Basis pass f4c88459f7c9320f587b839c3d24a2a9dc18a8a0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 4f080070a9809bde857851e68a3aeff0c4b9b6a6 e5d6ddcd31a6113e4a3db7a235ca78770fe8f401
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#f4c88459f7c9320f587b839c3d24a2a9dc18a8a0-7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149-9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 git://xenbits.xen.org/qemu-xen.git#4f080070a9809bde857851e68a3aeff0c4b9b6a6-de5b678ca4dcdfa83e322491d478d66df56c1986 git://xenbits.xen.org/xen.git#e5d6ddcd31a6113e4a3db7a235ca78770fe8f401-d7c60727a3f26b7fda49c8de188dd1cec021d23a
Loaded 3006 nodes in revision graph
Searching for test results:
 126854 [host=joubertin0]
 126778 pass f4c88459f7c9320f587b839c3d24a2a9dc18a8a0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 4f080070a9809bde857851e68a3aeff0c4b9b6a6 e5d6ddcd31a6113e4a3db7a235ca78770fe8f401
 126952 [host=italia0]
 127070 [host=huxelrebe1]
 127012 [host=pinot0]
 127123 []
 127232 [host=godello1]
 127266 [host=fiano0]
 127280 [host=rimava1]
 127301 [host=chardonnay1]
 127350 [host=godello0]
 127369 [host=albana0]
 127407 [host=pinot1]
 127429 [host=chardonnay0]
 127489 [host=debina0]
 127541 [host=italia0]
 127504 [host=joubertin0]
 127520 [host=joubertin1]
 127595 fail 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 d7c60727a3f26b7fda49c8de188dd1cec021d23a
 127741 pass 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 391266f0120c92ce8eb5bdb4a41bd314daaf6070
 127742 fail 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 66a9274cc3435117783cd3f07b238309d7f9c6de
 127727 pass f4c88459f7c9320f587b839c3d24a2a9dc18a8a0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 4f080070a9809bde857851e68a3aeff0c4b9b6a6 e5d6ddcd31a6113e4a3db7a235ca78770fe8f401
 127745 pass 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 391266f0120c92ce8eb5bdb4a41bd314daaf6070
 127728 fail 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 d7c60727a3f26b7fda49c8de188dd1cec021d23a
 127731 pass cfb6eca6e4bbacf92630d551a108645163a8f80d c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 da3bd8111858a1fb045a6ddc0b36d72164d9c5dd
 127733 pass 5f04d296f24b8a89c48eba775260d772834f9a6c c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 1d069e45f7c2f6b2982797dd32092b300bacafad
 127734 pass d0f2eb3a419be3ac0304fa83c6b0086ef7fc095a c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 1d069e45f7c2f6b2982797dd32092b300bacafad
 127736 pass 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 8ca88879110ecfebed6e36612ae72ef284c270cd
 127749 fail 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 66a9274cc3435117783cd3f07b238309d7f9c6de
 127738 fail 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 653abbb8144bfbff69b8bbc383f20d7dfaf03fcb
 127739 fail 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 6bf0be5af852f2317b75ab94f1d2bb045ebef452
 127754 pass 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 391266f0120c92ce8eb5bdb4a41bd314daaf6070
 127758 fail 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 66a9274cc3435117783cd3f07b238309d7f9c6de
Searching for interesting versions
 Result found: flight 126778 (pass), for basis pass
 Result found: flight 127595 (fail), for basis failure
 Repro found: flight 127727 (pass), for basis pass
 Repro found: flight 127728 (fail), for basis failure
 0 revisions at 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 391266f0120c92ce8eb5bdb4a41bd314daaf6070
No revisions left to test, checking graph state.
 Result found: flight 127741 (pass), for last pass
 Result found: flight 127742 (fail), for first failure
 Repro found: flight 127745 (pass), for last pass
 Repro found: flight 127749 (fail), for first failure
 Repro found: flight 127754 (pass), for last pass
 Repro found: flight 127758 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  66a9274cc3435117783cd3f07b238309d7f9c6de
  Bug not present: 391266f0120c92ce8eb5bdb4a41bd314daaf6070
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/127758/


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

pnmtopng: 79 colors found
Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-amd64-xl-multivcpu.xen-boot.{dot,ps,png,html,svg}.
----------------------------------------
127758: tolerable ALL FAIL

flight 127758 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/127758/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-multivcpu  7 xen-boot               fail baseline untested


jobs:
 test-amd64-amd64-xl-multivcpu                                fail    


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



--===============8599004112118984470==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8599004112118984470==--
