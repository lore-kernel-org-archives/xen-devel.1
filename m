From: osstest service owner <osstest-admin@xenproject.org>
Subject: [linux-3.18 bisection] complete
 test-amd64-i386-qemuu-rhel6hvm-intel
Date: Tue, 28 Aug 2018 21:53:39 +0000
Message-ID: <E1fulvf-00019T-Gb@osstest.test-lab.xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6771338600972279598=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ad41=ll=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1fulvh-0005CE-Q9
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 21:53:41 +0000
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

--===============6771338600972279598==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-qemuu-rhel6hvm-intel
testid redhat-install

Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  a2d9a6fa1fcd2dfcfa9d1d34998156f9399a3eb2
  Bug not present: 83fa6552cea112a900ec7891f8c170d022fe7e20
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/126891/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/linux-3.18/test-amd64-i386-qemuu-rhel6hvm-intel.redhat-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/linux-3.18/test-amd64-i386-qemuu-rhel6hvm-intel.redhat-install --summary-out=tmp/126891.bisection-summary --basis-template=126042 --blessings=real,real-bisect linux-3.18 test-amd64-i386-qemuu-rhel6hvm-intel redhat-install
Searching for failure / basis pass:
 126711 fail [host=debina1] / 126042 [host=huxelrebe1] 125899 [host=baroque1] 125658 [host=italia0] 125649 [host=albana1] 125641 [host=huxelrebe1] 125561 [host=elbling1] 125525 ok.
Failure / basis pass flights: 126711 / 125525
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 18e6ee0440a7ab853e4ca0f1403eeef1803ed970 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 4f080070a9809bde857851e68a3aeff0c4b9b6a6 a923919797c39d51ea0b808ea691bed20fe8e072
Basis pass 7612025fbc7a5ab54bf71f48b99b0b6a15fc7b06 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a e3f667bc5f51d0aa44357a64ca134cd952679c81
Generating revisions with ./adhoc-revtuple-generator  git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git#7612025fbc7a5ab54bf71f48b99b0b6a15fc7b06-18e6ee0440a7ab853e4ca0f1403eeef1803ed970 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#c8ea0457495342c417c3dc033bba25148b279f60-9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 git://xenbits.xen.org/qemu-xen.git#43139135a8938de44f66333831d3a8655d07663a-4f080070a9809bde857851e68a3aeff0c4b9b6a6 git://xenbits.xen.org/xen.git#e3f667bc5f51d0aa44357a64ca134cd952679c81-a923919797c39d51ea0b808ea691bed20fe8e072
adhoc-revtuple-generator: tree discontiguous: qemu-xen
Loaded 3005 nodes in revision graph
Searching for test results:
 125505 [host=fiano1]
 125525 pass 7612025fbc7a5ab54bf71f48b99b0b6a15fc7b06 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a e3f667bc5f51d0aa44357a64ca134cd952679c81
 125561 [host=elbling1]
 125641 [host=huxelrebe1]
 125649 [host=albana1]
 125658 [host=italia0]
 125899 [host=baroque1]
 126042 [host=huxelrebe1]
 126189 fail irrelevant
 126270 fail irrelevant
 126362 fail 18e6ee0440a7ab853e4ca0f1403eeef1803ed970 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 3a2b8525b883baa87fe89b3da58f5c09fa599b99
 126472 fail 18e6ee0440a7ab853e4ca0f1403eeef1803ed970 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 3a2b8525b883baa87fe89b3da58f5c09fa599b99
 126583 fail 18e6ee0440a7ab853e4ca0f1403eeef1803ed970 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 3a2b8525b883baa87fe89b3da58f5c09fa599b99
 126711 fail 18e6ee0440a7ab853e4ca0f1403eeef1803ed970 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 4f080070a9809bde857851e68a3aeff0c4b9b6a6 a923919797c39d51ea0b808ea691bed20fe8e072
 126832 pass 7612025fbc7a5ab54bf71f48b99b0b6a15fc7b06 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a e3f667bc5f51d0aa44357a64ca134cd952679c81
 126849 fail 18e6ee0440a7ab853e4ca0f1403eeef1803ed970 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 4f080070a9809bde857851e68a3aeff0c4b9b6a6 a923919797c39d51ea0b808ea691bed20fe8e072
 126860 pass 95478b56ac4fddc84ade05c4cf95a524af58d16c c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 4b60c40659b34b6577a6bc91eb4115458a0e425f
 126857 pass dbba166b0e442d4d38ae0f244d32338c3e92d16f c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 6cf17a267a424fe62676993d429c2cf61311e0f2
 126862 fail 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 35851408e9738026ca418527e4dcb8aff1960a52
 126864 fail 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 2a8a8e99feb950504559196521bc9fd63ed3a962
 126865 pass fa4bbed870c492b899cd779c05f8714c1b205e12 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 4b60c40659b34b6577a6bc91eb4115458a0e425f
 126868 pass 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 1237659523813696af4083279a7b871d407cbd48
 126873 fail 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a a2d9a6fa1fcd2dfcfa9d1d34998156f9399a3eb2
 126877 pass 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 83fa6552cea112a900ec7891f8c170d022fe7e20
 126880 fail 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a a2d9a6fa1fcd2dfcfa9d1d34998156f9399a3eb2
 126883 pass 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 83fa6552cea112a900ec7891f8c170d022fe7e20
 126886 fail 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a a2d9a6fa1fcd2dfcfa9d1d34998156f9399a3eb2
 126889 pass 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 83fa6552cea112a900ec7891f8c170d022fe7e20
 126891 fail 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a a2d9a6fa1fcd2dfcfa9d1d34998156f9399a3eb2
Searching for interesting versions
 Result found: flight 125525 (pass), for basis pass
 Result found: flight 126711 (fail), for basis failure
 Repro found: flight 126832 (pass), for basis pass
 Repro found: flight 126849 (fail), for basis failure
 0 revisions at 830f9674e76d08d04585e53fc200ae8af99966e7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 83fa6552cea112a900ec7891f8c170d022fe7e20
No revisions left to test, checking graph state.
 Result found: flight 126877 (pass), for last pass
 Result found: flight 126880 (fail), for first failure
 Repro found: flight 126883 (pass), for last pass
 Repro found: flight 126886 (fail), for first failure
 Repro found: flight 126889 (pass), for last pass
 Repro found: flight 126891 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  a2d9a6fa1fcd2dfcfa9d1d34998156f9399a3eb2
  Bug not present: 83fa6552cea112a900ec7891f8c170d022fe7e20
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/126891/


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

pnmtopng: 116 colors found
Revision graph left in /home/logs/results/bisect/linux-3.18/test-amd64-i386-qemuu-rhel6hvm-intel.redhat-install.{dot,ps,png,html,svg}.
----------------------------------------
126891: tolerable ALL FAIL

flight 126891 linux-3.18 real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/126891/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-qemuu-rhel6hvm-intel 10 redhat-install  fail baseline untested


jobs:
 test-amd64-i386-qemuu-rhel6hvm-intel                         fail    


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



--===============6771338600972279598==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6771338600972279598==--
