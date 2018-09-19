From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable bisection] complete
 test-amd64-i386-xl-qemut-debianhvm-amd64-xsm
Date: Wed, 19 Sep 2018 07:48:56 +0000
Message-ID: <E1g2XEG-0007IA-1p@osstest.test-lab.xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5512198908667904935=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fuh4=mb=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1g2XEL-00025V-As
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 07:49:01 +0000
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

--===============5512198908667904935==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-xl-qemut-debianhvm-amd64-xsm
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/127798/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-i386-xl-qemut-debianhvm-amd64-xsm.xen-boot.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-i386-xl-qemut-debianhvm-amd64-xsm.xen-boot --summary-out=tmp/127798.bisection-summary --basis-template=127541 --blessings=real,real-bisect xen-unstable test-amd64-i386-xl-qemut-debianhvm-amd64-xsm xen-boot
Searching for failure / basis pass:
 127595 fail [host=elbling0] / 127541 [host=debina1] 127520 [host=huxelrebe1] 127504 [host=italia0] 127489 [host=chardonnay1] 127429 [host=fiano0] 127407 [host=joubertin0] 127369 [host=joubertin1] 127350 [host=rimava1] 127301 [host=elbling1] 127280 [host=pinot1] 127266 [host=baroque1] 127232 [host=debina1] 127123 [host=albana0] 127070 [host=chardonnay0] 127012 ok.
Failure / basis pass flights: 127595 / 127012
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 d7c60727a3f26b7fda49c8de188dd1cec021d23a
Basis pass f4c88459f7c9320f587b839c3d24a2a9dc18a8a0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 f04955e18502035121776f6e09d83ae5a36c773c
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#f4c88459f7c9320f587b839c3d24a2a9dc18a8a0-7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149-9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 git://xenbits.xen.org/qemu-xen.git#de5b678ca4dcdfa83e322491d478d66df56c1986-de5b678ca4dcdfa83e322491d478d66df56c1986 git://xenbits.xen.org/xen.git#f04955e18502035121776f6e09d83ae5a36c773c-d7c60727a3f26b7fda49c8de188dd1cec021d23a
Loaded 2001 nodes in revision graph
Searching for test results:
 127070 [host=chardonnay0]
 127012 pass f4c88459f7c9320f587b839c3d24a2a9dc18a8a0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 f04955e18502035121776f6e09d83ae5a36c773c
 127123 [host=albana0]
 127232 [host=debina1]
 127266 [host=baroque1]
 127280 [host=pinot1]
 127301 [host=elbling1]
 127350 [host=rimava1]
 127369 [host=joubertin1]
 127407 [host=joubertin0]
 127429 [host=fiano0]
 127489 [host=chardonnay1]
 127541 [host=debina1]
 127504 [host=italia0]
 127520 [host=huxelrebe1]
 127595 fail 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 d7c60727a3f26b7fda49c8de188dd1cec021d23a
 127759 pass f4c88459f7c9320f587b839c3d24a2a9dc18a8a0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 f04955e18502035121776f6e09d83ae5a36c773c
 127775 pass 5a842ecca279f583c3fdc9a1ed8fe7a4cc348789 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 1d069e45f7c2f6b2982797dd32092b300bacafad
 127786 fail 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 7f855b514146478dfdd1f796ed5578a138164d11
 127798 fail 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 66a9274cc3435117783cd3f07b238309d7f9c6de
 127791 pass 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 391266f0120c92ce8eb5bdb4a41bd314daaf6070
 127764 fail 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 d7c60727a3f26b7fda49c8de188dd1cec021d23a
 127777 pass 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 391266f0120c92ce8eb5bdb4a41bd314daaf6070
 127769 pass bcd169a2726a789699d487cc35a606cdf94c7d85 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 da3bd8111858a1fb045a6ddc0b36d72164d9c5dd
 127780 fail 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 343eb57023c7f1f676422aab5c41fadbab1ff8dc
 127772 pass c0a8e047734ce3dcce51715108ff666829fa539e c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 1d069e45f7c2f6b2982797dd32092b300bacafad
 127794 fail 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 66a9274cc3435117783cd3f07b238309d7f9c6de
 127782 fail 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 eea4ec2b66dad87ec745778ab9f00e12ef0f2760
 127788 fail 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 66a9274cc3435117783cd3f07b238309d7f9c6de
 127796 pass 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 391266f0120c92ce8eb5bdb4a41bd314daaf6070
Searching for interesting versions
 Result found: flight 127012 (pass), for basis pass
 Result found: flight 127595 (fail), for basis failure
 Repro found: flight 127759 (pass), for basis pass
 Repro found: flight 127764 (fail), for basis failure
 0 revisions at 7fe7a0f4c5cf9e7f5b7cb67c1341cdbf62ed4c30 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 391266f0120c92ce8eb5bdb4a41bd314daaf6070
No revisions left to test, checking graph state.
 Result found: flight 127777 (pass), for last pass
 Result found: flight 127788 (fail), for first failure
 Repro found: flight 127791 (pass), for last pass
 Repro found: flight 127794 (fail), for first failure
 Repro found: flight 127796 (pass), for last pass
 Repro found: flight 127798 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  66a9274cc3435117783cd3f07b238309d7f9c6de
  Bug not present: 391266f0120c92ce8eb5bdb4a41bd314daaf6070
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/127798/


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

pnmtopng: 100 colors found
Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-i386-xl-qemut-debianhvm-amd64-xsm.xen-boot.{dot,ps,png,html,svg}.
----------------------------------------
127798: tolerable ALL FAIL

flight 127798 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/127798/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-xl-qemut-debianhvm-amd64-xsm 7 xen-boot fail baseline untested


jobs:
 test-amd64-i386-xl-qemut-debianhvm-amd64-xsm                 fail    


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



--===============5512198908667904935==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5512198908667904935==--
