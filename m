From: osstest service owner <osstest-admin@xenproject.org>
Subject: [linux-3.18 bisection] complete
 test-amd64-amd64-xl-shadow
Date: Fri, 24 Aug 2018 00:58:43 +0000
Message-ID: <E1ft0R1-0000Ei-7L@osstest.test-lab.xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0374497539495821531=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kind=lh=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1ft0R6-000391-17
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 00:58:48 +0000
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

--===============0374497539495821531==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-xl-shadow
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/126505/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/linux-3.18/test-amd64-amd64-xl-shadow.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/linux-3.18/test-amd64-amd64-xl-shadow.guest-start --summary-out=tmp/126505.bisection-summary --basis-template=126042 --blessings=real,real-bisect linux-3.18 test-amd64-amd64-xl-shadow guest-start
Searching for failure / basis pass:
 126362 fail [host=baroque0] / 126042 [host=albana1] 125899 [host=albana0] 125658 [host=elbling1] 125649 [host=fiano1] 125641 ok.
Failure / basis pass flights: 126362 / 125641
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 18e6ee0440a7ab853e4ca0f1403eeef1803ed970 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 3a2b8525b883baa87fe89b3da58f5c09fa599b99
Basis pass 7612025fbc7a5ab54bf71f48b99b0b6a15fc7b06 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a e3f667bc5f51d0aa44357a64ca134cd952679c81
Generating revisions with ./adhoc-revtuple-generator  git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git#7612025fbc7a5ab54bf71f48b99b0b6a15fc7b06-18e6ee0440a7ab853e4ca0f1403eeef1803ed970 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#c8ea0457495342c417c3dc033bba25148b279f60-c8ea0457495342c417c3dc033bba25148b279f60 git://xenbits.xen.org/qemu-xen.git#43139135a8938de44f66333831d3a8655d07663a-4f080070a9809bde857851e68a3aeff0c4b9b6a6 git://xenbits.xen.org/xen.git#e3f667bc5f51d0aa44357a64ca134cd952679c81-3a2b8525b883baa87fe89b3da58f5c09fa599b99
adhoc-revtuple-generator: tree discontiguous: qemu-xen
Loaded 2002 nodes in revision graph
Searching for test results:
 125505 [host=albana0]
 125525 [host=rimava1]
 125561 [host=godello0]
 125641 pass 7612025fbc7a5ab54bf71f48b99b0b6a15fc7b06 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a e3f667bc5f51d0aa44357a64ca134cd952679c81
 125649 [host=fiano1]
 125658 [host=elbling1]
 125899 [host=albana0]
 126042 [host=albana1]
 126189 fail irrelevant
 126270 fail irrelevant
 126460 pass dbba166b0e442d4d38ae0f244d32338c3e92d16f c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a a2ae81893ab7d5231052d96b84f70b5deb54a8ec
 126463 pass 1b2c23459c3335ee9e0dd2cd2e2856d0201852e5 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 4b60c40659b34b6577a6bc91eb4115458a0e425f
 126455 pass 7612025fbc7a5ab54bf71f48b99b0b6a15fc7b06 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a e3f667bc5f51d0aa44357a64ca134cd952679c81
 126458 fail irrelevant
 126362 fail 18e6ee0440a7ab853e4ca0f1403eeef1803ed970 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 3a2b8525b883baa87fe89b3da58f5c09fa599b99
 126496 pass 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 83fa6552cea112a900ec7891f8c170d022fe7e20
 126500 fail 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a a2d9a6fa1fcd2dfcfa9d1d34998156f9399a3eb2
 126474 fail 18e6ee0440a7ab853e4ca0f1403eeef1803ed970 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 3a2b8525b883baa87fe89b3da58f5c09fa599b99
 126477 fail 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a aa67b97ed34279c43a43d9ca46727b5746caa92e
 126501 pass 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 83fa6552cea112a900ec7891f8c170d022fe7e20
 126483 pass f42178c0f2f09d6e87b0a35dff3c8484eeaaa197 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 4b60c40659b34b6577a6bc91eb4115458a0e425f
 126486 fail 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 9a5c16a3e75778c8a094ca87784d93b74676f46c
 126489 pass 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 4b60c40659b34b6577a6bc91eb4115458a0e425f
 126491 pass 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 83fa6552cea112a900ec7891f8c170d022fe7e20
 126495 fail 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a a2d9a6fa1fcd2dfcfa9d1d34998156f9399a3eb2
 126505 fail 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a a2d9a6fa1fcd2dfcfa9d1d34998156f9399a3eb2
Searching for interesting versions
 Result found: flight 125641 (pass), for basis pass
 Result found: flight 126362 (fail), for basis failure
 Repro found: flight 126455 (pass), for basis pass
 Repro found: flight 126474 (fail), for basis failure
 0 revisions at 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 83fa6552cea112a900ec7891f8c170d022fe7e20
No revisions left to test, checking graph state.
 Result found: flight 126491 (pass), for last pass
 Result found: flight 126495 (fail), for first failure
 Repro found: flight 126496 (pass), for last pass
 Repro found: flight 126500 (fail), for first failure
 Repro found: flight 126501 (pass), for last pass
 Repro found: flight 126505 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  a2d9a6fa1fcd2dfcfa9d1d34998156f9399a3eb2
  Bug not present: 83fa6552cea112a900ec7891f8c170d022fe7e20
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/126505/


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

pnmtopng: 129 colors found
Revision graph left in /home/logs/results/bisect/linux-3.18/test-amd64-amd64-xl-shadow.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
126505: tolerable ALL FAIL

flight 126505 linux-3.18 real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/126505/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-shadow   12 guest-start             fail baseline untested


jobs:
 test-amd64-amd64-xl-shadow                                   fail    


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



--===============0374497539495821531==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0374497539495821531==--
