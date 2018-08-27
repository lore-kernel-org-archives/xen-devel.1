From: osstest service owner <osstest-admin@xenproject.org>
Subject: [linux-3.18 bisection] complete
 test-amd64-amd64-xl-credit2
Date: Mon, 27 Aug 2018 04:40:46 +0000
Message-ID: <E1fu9KY-0006pI-Ra@osstest.test-lab.xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1850624353830604504=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=oxzl=lk=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1fu9Kc-0007Id-Ai
 for xen-devel@lists.xenproject.org; Mon, 27 Aug 2018 04:40:50 +0000
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

--===============1850624353830604504==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-xl-credit2
testid guest-start

Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  a2d9a6fa1fcd2dfcfa9d1d34998156f9399a3eb2
  Bug not present: 83fa6552cea112a900ec7891f8c170d022fe7e20
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/126748/


  commit a2d9a6fa1fcd2dfcfa9d1d34998156f9399a3eb2
  Author: Paul Durrant <paul.durrant@citrix.com>
  Date:   Thu Aug 9 10:59:41 2018 +0100
  
      tools/libxenctrl: use new xenforeignmemory API to seed grant table
      
      A previous patch added support for priv-mapping guest resources directly
      (rather than having to foreign-map, which requires P2M modification for
      HVM guests).
      
      This patch makes use of the new API to seed the guest grant table unless
      the underlying infrastructure (i.e. privcmd) doesn't support it, in which
      case the old scheme is used.
      
      NOTE: The call to xc_dom_gnttab_hvm_seed() in hvm_build_set_params() was
            actually unnecessary, as the grant table has already been seeded
            by a prior call to xc_dom_gnttab_init() made by libxl__build_dom().
      
      Signed-off-by: Paul Durrant <paul.durrant@citrix.com>
      Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
      Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
      Acked-by: Wei Liu <wei.liu2@citrix.com>
      Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/linux-3.18/test-amd64-amd64-xl-credit2.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/linux-3.18/test-amd64-amd64-xl-credit2.guest-start --summary-out=tmp/126748.bisection-summary --basis-template=126042 --blessings=real,real-bisect linux-3.18 test-amd64-amd64-xl-credit2 guest-start
Searching for failure / basis pass:
 126583 fail [host=huxelrebe1] / 126042 [host=chardonnay0] 125899 [host=pinot1] 125658 [host=debina0] 125649 [host=chardonnay1] 125641 [host=joubertin0] 125561 [host=albana1] 125525 [host=debina1] 125505 [host=godello0] 125138 [host=debina0] 125043 [host=debina1] 124945 [host=albana0] 124897 [host=godello0] 124855 [host=huxelrebe0] 124173 [host=albana0] 123837 [host=huxelrebe0] 123803 [host=albana1] 123683 [host=chardonnay1] 123594 [host=godello1] 123480 ok.
Failure / basis pass flights: 126583 / 123480
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 18e6ee0440a7ab853e4ca0f1403eeef1803ed970 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 3a2b8525b883baa87fe89b3da58f5c09fa599b99
Basis pass b0b357c20ca6171b8ac698351f5202402b7ad7d5 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a fc5805daef091240cd5fc06634a8bcdb2f3bb843
Generating revisions with ./adhoc-revtuple-generator  git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git#b0b357c20ca6171b8ac698351f5202402b7ad7d5-18e6ee0440a7ab853e4ca0f1403eeef1803ed970 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#c8ea0457495342c417c3dc033bba25148b279f60-c8ea0457495342c417c3dc033bba25148b279f60 git://xenbits.xen.org/qemu-xen.git#43139135a8938de44f66333831d3a8655d07663a-4f080070a9809bde857851e68a3aeff0c4b9b6a6 git://xenbits.xen.org/xen.git#fc5805daef091240cd5fc06634a8bcdb2f3bb843-3a2b8525b883baa87fe89b3da58f5c09fa599b99
adhoc-revtuple-generator: tree discontiguous: qemu-xen
Loaded 2108 nodes in revision graph
Searching for test results:
 123480 pass b0b357c20ca6171b8ac698351f5202402b7ad7d5 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a fc5805daef091240cd5fc06634a8bcdb2f3bb843
 123594 [host=godello1]
 123683 [host=chardonnay1]
 123837 [host=huxelrebe0]
 123803 [host=albana1]
 124173 [host=albana0]
 124855 [host=huxelrebe0]
 124897 [host=godello0]
 124945 [host=albana0]
 125043 [host=debina1]
 125138 [host=debina0]
 125505 [host=godello0]
 125525 [host=debina1]
 125561 [host=albana1]
 125641 [host=joubertin0]
 125649 [host=chardonnay1]
 125658 [host=debina0]
 125899 [host=pinot1]
 126042 [host=chardonnay0]
 126189 fail irrelevant
 126270 fail irrelevant
 126362 fail 18e6ee0440a7ab853e4ca0f1403eeef1803ed970 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 3a2b8525b883baa87fe89b3da58f5c09fa599b99
 126472 fail 18e6ee0440a7ab853e4ca0f1403eeef1803ed970 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 3a2b8525b883baa87fe89b3da58f5c09fa599b99
 126583 fail 18e6ee0440a7ab853e4ca0f1403eeef1803ed970 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 3a2b8525b883baa87fe89b3da58f5c09fa599b99
 126738 fail 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a a2d9a6fa1fcd2dfcfa9d1d34998156f9399a3eb2
 126721 pass a64e47ee1fa0d9fd506ad84fedba380381965ae5 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 4b60c40659b34b6577a6bc91eb4115458a0e425f
 126708 pass dbba166b0e442d4d38ae0f244d32338c3e92d16f c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 75ac495dc9d6aa3d6240bfab1adbdc0d0f8bc403
 126726 fail 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a a2d9a6fa1fcd2dfcfa9d1d34998156f9399a3eb2
 126693 pass b0b357c20ca6171b8ac698351f5202402b7ad7d5 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a fc5805daef091240cd5fc06634a8bcdb2f3bb843
 126713 pass bf35cb47cc9265a482410b492ba9646aea408e8c c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 4b60c40659b34b6577a6bc91eb4115458a0e425f
 126697 fail 18e6ee0440a7ab853e4ca0f1403eeef1803ed970 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 3a2b8525b883baa87fe89b3da58f5c09fa599b99
 126727 pass fed22131f5b2740acbf184910133179b558aecc0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 4b60c40659b34b6577a6bc91eb4115458a0e425f
 126741 pass 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 83fa6552cea112a900ec7891f8c170d022fe7e20
 126699 pass e903eb4a70bb4a8601df2a693db9eb3ea97fd632 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a f5f4c68733c9ed7d795ec79445a00053de7a94ae
 126731 pass 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a b6f43c14cef3af8477a9eca4efab87dd150a2885
 126718 fail 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 3bd36952dab60290f33d6791070b57920e10754b
 126744 fail 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a a2d9a6fa1fcd2dfcfa9d1d34998156f9399a3eb2
 126734 pass 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 1237659523813696af4083279a7b871d407cbd48
 126736 pass 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 83fa6552cea112a900ec7891f8c170d022fe7e20
 126746 pass 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 83fa6552cea112a900ec7891f8c170d022fe7e20
 126748 fail 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a a2d9a6fa1fcd2dfcfa9d1d34998156f9399a3eb2
Searching for interesting versions
 Result found: flight 123480 (pass), for basis pass
 Result found: flight 126362 (fail), for basis failure
 Repro found: flight 126693 (pass), for basis pass
 Repro found: flight 126697 (fail), for basis failure
 0 revisions at 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 83fa6552cea112a900ec7891f8c170d022fe7e20
No revisions left to test, checking graph state.
 Result found: flight 126736 (pass), for last pass
 Result found: flight 126738 (fail), for first failure
 Repro found: flight 126741 (pass), for last pass
 Repro found: flight 126744 (fail), for first failure
 Repro found: flight 126746 (pass), for last pass
 Repro found: flight 126748 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  a2d9a6fa1fcd2dfcfa9d1d34998156f9399a3eb2
  Bug not present: 83fa6552cea112a900ec7891f8c170d022fe7e20
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/126748/


  commit a2d9a6fa1fcd2dfcfa9d1d34998156f9399a3eb2
  Author: Paul Durrant <paul.durrant@citrix.com>
  Date:   Thu Aug 9 10:59:41 2018 +0100
  
      tools/libxenctrl: use new xenforeignmemory API to seed grant table
      
      A previous patch added support for priv-mapping guest resources directly
      (rather than having to foreign-map, which requires P2M modification for
      HVM guests).
      
      This patch makes use of the new API to seed the guest grant table unless
      the underlying infrastructure (i.e. privcmd) doesn't support it, in which
      case the old scheme is used.
      
      NOTE: The call to xc_dom_gnttab_hvm_seed() in hvm_build_set_params() was
            actually unnecessary, as the grant table has already been seeded
            by a prior call to xc_dom_gnttab_init() made by libxl__build_dom().
      
      Signed-off-by: Paul Durrant <paul.durrant@citrix.com>
      Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
      Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
      Acked-by: Wei Liu <wei.liu2@citrix.com>
      Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

dot: graph is too large for cairo-renderer bitmaps. Scaling by 0.895812 to fit
pnmtopng: 79 colors found
Revision graph left in /home/logs/results/bisect/linux-3.18/test-amd64-amd64-xl-credit2.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
126748: tolerable ALL FAIL

flight 126748 linux-3.18 real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/126748/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-credit2  12 guest-start             fail baseline untested


jobs:
 test-amd64-amd64-xl-credit2                                  fail    


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



--===============1850624353830604504==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1850624353830604504==--
