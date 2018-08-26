From: osstest service owner <osstest-admin@xenproject.org>
Subject: [linux-3.18 bisection] complete
 test-amd64-i386-freebsd10-amd64
Date: Sun, 26 Aug 2018 10:48:07 +0000
Message-ID: <E1ftsaV-0005kV-0o@osstest.test-lab.xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6658952307388255404=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=apot=lj=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1ftsaY-0007rQ-Iz
 for xen-devel@lists.xenproject.org; Sun, 26 Aug 2018 10:48:10 +0000
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

--===============6658952307388255404==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-freebsd10-amd64
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/126685/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/linux-3.18/test-amd64-i386-freebsd10-amd64.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/linux-3.18/test-amd64-i386-freebsd10-amd64.guest-start --summary-out=tmp/126685.bisection-summary --basis-template=126042 --blessings=real,real-bisect linux-3.18 test-amd64-i386-freebsd10-amd64 guest-start
Searching for failure / basis pass:
 126472 fail [host=huxelrebe1] / 126042 [host=pinot0] 125899 [host=baroque0] 125658 [host=debina1] 125649 [host=baroque0] 125641 ok.
Failure / basis pass flights: 126472 / 125641
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
>From git://cache:9419/git://xenbits.xen.org/xen
   1385a14bfc..a923919797  coverity-tested/smoke -> origin/coverity-tested/smoke
   b49ef5d39d..e5d6ddcd31  staging               -> origin/staging
Loaded 2002 nodes in revision graph
Searching for test results:
 125505 [host=baroque1]
 125525 [host=elbling1]
 125561 [host=debina0]
 125641 pass 7612025fbc7a5ab54bf71f48b99b0b6a15fc7b06 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a e3f667bc5f51d0aa44357a64ca134cd952679c81
 125649 [host=baroque0]
 125658 [host=debina1]
 125899 [host=baroque0]
 126042 [host=pinot0]
 126189 fail irrelevant
 126270 fail irrelevant
 126362 fail 18e6ee0440a7ab853e4ca0f1403eeef1803ed970 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 3a2b8525b883baa87fe89b3da58f5c09fa599b99
 126472 fail 18e6ee0440a7ab853e4ca0f1403eeef1803ed970 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 3a2b8525b883baa87fe89b3da58f5c09fa599b99
 126629 pass 7612025fbc7a5ab54bf71f48b99b0b6a15fc7b06 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a e3f667bc5f51d0aa44357a64ca134cd952679c81
 126642 pass 95478b56ac4fddc84ade05c4cf95a524af58d16c c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 4b60c40659b34b6577a6bc91eb4115458a0e425f
 126634 fail 18e6ee0440a7ab853e4ca0f1403eeef1803ed970 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 3a2b8525b883baa87fe89b3da58f5c09fa599b99
 126654 fail 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a a2d9a6fa1fcd2dfcfa9d1d34998156f9399a3eb2
 126646 fail 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 35851408e9738026ca418527e4dcb8aff1960a52
 126657 pass 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 83fa6552cea112a900ec7891f8c170d022fe7e20
 126636 pass dbba166b0e442d4d38ae0f244d32338c3e92d16f c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 6cf17a267a424fe62676993d429c2cf61311e0f2
 126648 fail 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 2a8a8e99feb950504559196521bc9fd63ed3a962
 126651 pass fa4bbed870c492b899cd779c05f8714c1b205e12 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 4b60c40659b34b6577a6bc91eb4115458a0e425f
 126652 pass 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 1237659523813696af4083279a7b871d407cbd48
 126658 fail 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a a2d9a6fa1fcd2dfcfa9d1d34998156f9399a3eb2
 126661 pass 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 83fa6552cea112a900ec7891f8c170d022fe7e20
 126676 fail 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a a2d9a6fa1fcd2dfcfa9d1d34998156f9399a3eb2
 126680 pass 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 83fa6552cea112a900ec7891f8c170d022fe7e20
 126685 fail 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a a2d9a6fa1fcd2dfcfa9d1d34998156f9399a3eb2
Searching for interesting versions
 Result found: flight 125641 (pass), for basis pass
 Result found: flight 126362 (fail), for basis failure
 Repro found: flight 126629 (pass), for basis pass
 Repro found: flight 126634 (fail), for basis failure
 0 revisions at 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 83fa6552cea112a900ec7891f8c170d022fe7e20
No revisions left to test, checking graph state.
 Result found: flight 126657 (pass), for last pass
 Result found: flight 126658 (fail), for first failure
 Repro found: flight 126661 (pass), for last pass
 Repro found: flight 126676 (fail), for first failure
 Repro found: flight 126680 (pass), for last pass
 Repro found: flight 126685 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  a2d9a6fa1fcd2dfcfa9d1d34998156f9399a3eb2
  Bug not present: 83fa6552cea112a900ec7891f8c170d022fe7e20
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/126685/


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
Revision graph left in /home/logs/results/bisect/linux-3.18/test-amd64-i386-freebsd10-amd64.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
126685: tolerable ALL FAIL

flight 126685 linux-3.18 real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/126685/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-freebsd10-amd64 11 guest-start          fail baseline untested


jobs:
 test-amd64-i386-freebsd10-amd64                              fail    


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



--===============6658952307388255404==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6658952307388255404==--
