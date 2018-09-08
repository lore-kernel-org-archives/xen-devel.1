From: osstest service owner <osstest-admin@xenproject.org>
Subject: [linux-linus bisection] complete
 test-amd64-amd64-xl-qemuu-ovmf-amd64
Date: Sat, 08 Sep 2018 12:10:18 +0000
Message-ID: <E1fyc4A-0007jp-Hy@osstest.test-lab.xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2271108863153527834=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5tzk=lw=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1fyc4G-00007g-Kc
 for xen-devel@lists.xenproject.org; Sat, 08 Sep 2018 12:10:24 +0000
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

--===============2271108863153527834==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-xl-qemuu-ovmf-amd64
testid debian-hvm-install

Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  09b3907f93fe023ebca809c9f706f3d022801dce
  Bug not present: 936b77255269b3b9b5685d565550e77d5080ac81
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/127408/


  commit 09b3907f93fe023ebca809c9f706f3d022801dce
  Author: Roger Pau Monné <roger.pau@citrix.com>
  Date:   Mon Sep 3 17:54:12 2018 +0200
  
      The hvmloader binary generated when using LLVM LD doesn't work
      properly and seems to get stuck while trying to generate and load the
      ACPI tables. This is caused by the layout of the binary when linked
      with LLVM LD.
      
      LLVM LD has a different default linker script that GNU LD, and the
      resulting hvmloader binary is slightly different:
      
      LLVM LD:
      Program Headers:
        Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
        PHDR           0x000034 0x000ff034 0x000ff034 0x00060 0x00060 R   0x4
        LOAD           0x000000 0x000ff000 0x000ff000 0x38000 0x38000 RWE 0x1000
        GNU_STACK      0x000000 0x00000000 0x00000000 0x00000 0x00000 RW  0
      
      GNU LD:
      Program Headers:
        Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
        LOAD           0x000080 0x00100000 0x00100000 0x36308 0x3fd74 RWE 0x10
        GNU_STACK      0x000000 0x00000000 0x00000000 0x00000 0x00000 RW  0x4
      
      Note that in the LLVM LD case (as with GNU LD) the .text section does
      indeed have the address set to 0x100000 as requested on the command
      line:
      
      [ 1] .text             PROGBITS        00100000 001000 00dd10 00  AX  0   0 16
      
      There's however the PHDR which is not present when using GNU LD.
      
      Fix this by using a very simple linker script that generates the same
      binary regardless of whether LLVM or GNU LD is used. By using a linker
      script the usage of -Ttext can also be avoided by placing the desired
      .text load address directly in the linker script.
      
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Reviewed-by: Wei Liu <wei.liu2@citrix.com>
      Acked-by: Jan Beulich <jbeulich@suse.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/linux-linus/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/linux-linus/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install --summary-out=tmp/127408.bisection-summary --basis-template=125898 --blessings=real,real-bisect linux-linus test-amd64-amd64-xl-qemuu-ovmf-amd64 debian-hvm-install
Searching for failure / basis pass:
 127389 fail [host=baroque1] / 126310 [host=elbling0] 126202 [host=pinot1] 126069 [host=baroque0] 125921 [host=italia0] 125898 [host=albana0] 125702 [host=joubertin1] 125676 [host=albana0] 125657 [host=italia0] 125648 [host=pinot1] 125639 [host=albana1] 125585 [host=pinot0] 125551 [host=debina1] 125520 [host=joubertin0] 125501 [host=rimava1] 125401 [host=chardonnay1] 125285 ok.
Failure / basis pass flights: 127389 / 125285
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest a12ed06ba2d3fa60e08e7449fe0c1715de401395 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 a6c501603ca886458b055477532abadfbc9d3606
Basis pass 30b06abfb92bfd5f9b63ea6a2ffb0bd905d1a6da c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a e3f667bc5f51d0aa44357a64ca134cd952679c81
Generating revisions with ./adhoc-revtuple-generator  git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git#30b06abfb92bfd5f9b63ea6a2ffb0bd905d1a6da-a12ed06ba2d3fa60e08e7449fe0c1715de401395 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#c8ea0457495342c417c3dc033bba25148b279f60-9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 git://xenbits.xen.org/qemu-xen.git#43139135a8938de44f66333831d3a8655d07663a-de5b678ca4dcdfa83e322491d478d66df56c1986 git://xenbits.xen.org/xen.git#e3f667bc5f51d0aa44357a64ca134cd952679c81-a6c501603ca886458b055477532abadfbc9d3606
adhoc-revtuple-generator: tree discontiguous: linux-2.6
adhoc-revtuple-generator: tree discontiguous: qemu-xen
Loaded 2006 nodes in revision graph
Searching for test results:
 125167 [host=elbling0]
 125242 [host=albana0]
 125285 pass 30b06abfb92bfd5f9b63ea6a2ffb0bd905d1a6da c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a e3f667bc5f51d0aa44357a64ca134cd952679c81
 125401 [host=chardonnay1]
 125501 [host=rimava1]
 125551 [host=debina1]
 125520 [host=joubertin0]
 125585 [host=pinot0]
 125648 [host=pinot1]
 125639 [host=albana1]
 125657 [host=italia0]
 125676 [host=albana0]
 125702 [host=joubertin1]
 125898 [host=albana0]
 125921 [host=italia0]
 126069 [host=baroque0]
 126202 [host=pinot1]
 126310 [host=elbling0]
 126412 fail irrelevant
 126550 fail irrelevant
 126682 fail irrelevant
 126888 fail irrelevant
 126978 fail irrelevant
 127038 fail irrelevant
 127108 fail irrelevant
 127148 fail irrelevant
 127193 fail irrelevant
 127221 fail irrelevant
 127256 fail irrelevant
 127284 fail irrelevant
 127315 fail irrelevant
 127344 fail irrelevant
 127381 pass 30b06abfb92bfd5f9b63ea6a2ffb0bd905d1a6da c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a e3f667bc5f51d0aa44357a64ca134cd952679c81
 127382 fail irrelevant
 127364 fail irrelevant
 127383 pass 30b06abfb92bfd5f9b63ea6a2ffb0bd905d1a6da c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 80cdb33cb7a96c3355b35ec620f1798fe3be1048
 127385 fail irrelevant
 127388 blocked 30b06abfb92bfd5f9b63ea6a2ffb0bd905d1a6da c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 43139135a8938de44f66333831d3a8655d07663a 629856eae2a7f766f1f024a06ad3abf1fd4b9d37
 127391 pass 30b06abfb92bfd5f9b63ea6a2ffb0bd905d1a6da c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 7fbaf06d2de7f1c44bb41396acdbfb94f74e1cf9
 127392 pass 30b06abfb92bfd5f9b63ea6a2ffb0bd905d1a6da c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 3ac0b20bc375cfe78eb01528f2a18ac305eff6ab
 127393 pass 30b06abfb92bfd5f9b63ea6a2ffb0bd905d1a6da c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 5f3d3a880b74a67f283281e493be87871ca4f555
 127394 fail 30b06abfb92bfd5f9b63ea6a2ffb0bd905d1a6da c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 a9a2a761f75126d908612c64fabe6adde2b6d2b9
 127395 pass 30b06abfb92bfd5f9b63ea6a2ffb0bd905d1a6da c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 3f2002614af51dfd507168a1696658bac91155ce
 127397 fail 30b06abfb92bfd5f9b63ea6a2ffb0bd905d1a6da c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 09b3907f93fe023ebca809c9f706f3d022801dce
 127398 pass 30b06abfb92bfd5f9b63ea6a2ffb0bd905d1a6da c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 936b77255269b3b9b5685d565550e77d5080ac81
 127389 fail a12ed06ba2d3fa60e08e7449fe0c1715de401395 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 a6c501603ca886458b055477532abadfbc9d3606
 127399 fail 30b06abfb92bfd5f9b63ea6a2ffb0bd905d1a6da c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 09b3907f93fe023ebca809c9f706f3d022801dce
 127400 pass 30b06abfb92bfd5f9b63ea6a2ffb0bd905d1a6da c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a e3f667bc5f51d0aa44357a64ca134cd952679c81
 127402 fail a12ed06ba2d3fa60e08e7449fe0c1715de401395 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 a6c501603ca886458b055477532abadfbc9d3606
 127404 pass 30b06abfb92bfd5f9b63ea6a2ffb0bd905d1a6da c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 936b77255269b3b9b5685d565550e77d5080ac81
 127405 fail 30b06abfb92bfd5f9b63ea6a2ffb0bd905d1a6da c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 09b3907f93fe023ebca809c9f706f3d022801dce
 127406 pass 30b06abfb92bfd5f9b63ea6a2ffb0bd905d1a6da c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 936b77255269b3b9b5685d565550e77d5080ac81
 127408 fail 30b06abfb92bfd5f9b63ea6a2ffb0bd905d1a6da c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 09b3907f93fe023ebca809c9f706f3d022801dce
Searching for interesting versions
 Result found: flight 125285 (pass), for basis pass
 Result found: flight 127389 (fail), for basis failure
 Repro found: flight 127400 (pass), for basis pass
 Repro found: flight 127402 (fail), for basis failure
 0 revisions at 30b06abfb92bfd5f9b63ea6a2ffb0bd905d1a6da c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 936b77255269b3b9b5685d565550e77d5080ac81
No revisions left to test, checking graph state.
 Result found: flight 127398 (pass), for last pass
 Result found: flight 127399 (fail), for first failure
 Repro found: flight 127404 (pass), for last pass
 Repro found: flight 127405 (fail), for first failure
 Repro found: flight 127406 (pass), for last pass
 Repro found: flight 127408 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  09b3907f93fe023ebca809c9f706f3d022801dce
  Bug not present: 936b77255269b3b9b5685d565550e77d5080ac81
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/127408/


  commit 09b3907f93fe023ebca809c9f706f3d022801dce
  Author: Roger Pau Monné <roger.pau@citrix.com>
  Date:   Mon Sep 3 17:54:12 2018 +0200
  
      The hvmloader binary generated when using LLVM LD doesn't work
      properly and seems to get stuck while trying to generate and load the
      ACPI tables. This is caused by the layout of the binary when linked
      with LLVM LD.
      
      LLVM LD has a different default linker script that GNU LD, and the
      resulting hvmloader binary is slightly different:
      
      LLVM LD:
      Program Headers:
        Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
        PHDR           0x000034 0x000ff034 0x000ff034 0x00060 0x00060 R   0x4
        LOAD           0x000000 0x000ff000 0x000ff000 0x38000 0x38000 RWE 0x1000
        GNU_STACK      0x000000 0x00000000 0x00000000 0x00000 0x00000 RW  0
      
      GNU LD:
      Program Headers:
        Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
        LOAD           0x000080 0x00100000 0x00100000 0x36308 0x3fd74 RWE 0x10
        GNU_STACK      0x000000 0x00000000 0x00000000 0x00000 0x00000 RW  0x4
      
      Note that in the LLVM LD case (as with GNU LD) the .text section does
      indeed have the address set to 0x100000 as requested on the command
      line:
      
      [ 1] .text             PROGBITS        00100000 001000 00dd10 00  AX  0   0 16
      
      There's however the PHDR which is not present when using GNU LD.
      
      Fix this by using a very simple linker script that generates the same
      binary regardless of whether LLVM or GNU LD is used. By using a linker
      script the usage of -Ttext can also be avoided by placing the desired
      .text load address directly in the linker script.
      
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Reviewed-by: Wei Liu <wei.liu2@citrix.com>
      Acked-by: Jan Beulich <jbeulich@suse.com>

pnmtopng: 138 colors found
Revision graph left in /home/logs/results/bisect/linux-linus/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
127408: tolerable ALL FAIL

flight 127408 linux-linus real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/127408/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-ovmf-amd64 10 debian-hvm-install fail baseline untested


jobs:
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    


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



--===============2271108863153527834==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2271108863153527834==--
