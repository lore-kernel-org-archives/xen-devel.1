From: osstest service owner <osstest-admin@xenproject.org>
Subject: [linux-linus bisection] complete
 test-amd64-amd64-qemuu-nested-intel
Date: Thu, 06 Sep 2018 08:17:22 +0000
Message-ID: <E1fxpTe-00079X-Pa@osstest.test-lab.xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8024350806135472761=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pzil=lu=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1fxpTi-000175-CC
 for xen-devel@lists.xenproject.org; Thu, 06 Sep 2018 08:17:26 +0000
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

--===============8024350806135472761==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-qemuu-nested-intel
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/127333/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/linux-linus/test-amd64-amd64-qemuu-nested-intel.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/linux-linus/test-amd64-amd64-qemuu-nested-intel.debian-hvm-install --summary-out=tmp/127333.bisection-summary --basis-template=125898 --blessings=real,real-bisect linux-linus test-amd64-amd64-qemuu-nested-intel debian-hvm-install
Searching for failure / basis pass:
 127284 fail [host=debina1] / 126310 [host=godello1] 126202 [host=baroque1] 126069 [host=albana1] 125921 [host=huxelrebe1] 125898 [host=chardonnay1] 125702 [host=albana1] 125676 [host=huxelrebe1] 125657 [host=godello1] 125648 [host=baroque1] 125639 [host=elbling1] 125585 [host=chardonnay1] 125551 [host=italia0] 125520 [host=debina0] 125501 ok.
Failure / basis pass flights: 127284 / 125501
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 28619527b8a712590c93d0a9e24b4425b9376a8c c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 9f3fd3d339b42a632ccc1c5fff218d1d19a69f01
Basis pass 45ae4df9220701071ffec057d4b0071943022ab3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a e3f667bc5f51d0aa44357a64ca134cd952679c81
Generating revisions with ./adhoc-revtuple-generator  git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git#45ae4df9220701071ffec057d4b0071943022ab3-28619527b8a712590c93d0a9e24b4425b9376a8c git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#c8ea0457495342c417c3dc033bba25148b279f60-9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 git://xenbits.xen.org/qemu-xen.git#43139135a8938de44f66333831d3a8655d07663a-de5b678ca4dcdfa83e322491d478d66df56c1986 git://xenbits.xen.org/xen.git#e3f667bc5f51d0aa44357a64ca134cd952679c81-9f3fd3d339b42a632ccc1c5fff218d1d19a69f01
adhoc-revtuple-generator: tree discontiguous: linux-2.6
adhoc-revtuple-generator: tree discontiguous: qemu-xen
Loaded 2006 nodes in revision graph
Searching for test results:
 125167 [host=godello1]
 125242 [host=huxelrebe1]
 125285 [host=albana0]
 125401 [host=godello0]
 125501 pass 45ae4df9220701071ffec057d4b0071943022ab3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a e3f667bc5f51d0aa44357a64ca134cd952679c81
 125551 [host=italia0]
 125520 [host=debina0]
 125585 [host=chardonnay1]
 125648 [host=baroque1]
 125639 [host=elbling1]
 125657 [host=godello1]
 125676 [host=huxelrebe1]
 125702 [host=albana1]
 125898 [host=chardonnay1]
 125921 [host=huxelrebe1]
 126069 [host=albana1]
 126202 [host=baroque1]
 126310 [host=godello1]
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
 127309 fail irrelevant
 127284 fail 28619527b8a712590c93d0a9e24b4425b9376a8c c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 9f3fd3d339b42a632ccc1c5fff218d1d19a69f01
 127310 pass 45ae4df9220701071ffec057d4b0071943022ab3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 6832addfb2832dac63d67a4131b7de00c01ee094
 127328 fail 45ae4df9220701071ffec057d4b0071943022ab3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 09b3907f93fe023ebca809c9f706f3d022801dce
 127330 pass 45ae4df9220701071ffec057d4b0071943022ab3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 936b77255269b3b9b5685d565550e77d5080ac81
 127311 fail 28619527b8a712590c93d0a9e24b4425b9376a8c c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 9f3fd3d339b42a632ccc1c5fff218d1d19a69f01
 127331 fail 45ae4df9220701071ffec057d4b0071943022ab3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 09b3907f93fe023ebca809c9f706f3d022801dce
 127332 pass 45ae4df9220701071ffec057d4b0071943022ab3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 936b77255269b3b9b5685d565550e77d5080ac81
 127333 fail 45ae4df9220701071ffec057d4b0071943022ab3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 09b3907f93fe023ebca809c9f706f3d022801dce
 127316 pass 45ae4df9220701071ffec057d4b0071943022ab3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a 4038f580aa4558f6b4ce66424e6cc2ebc5367d52
 127319 pass 45ae4df9220701071ffec057d4b0071943022ab3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 053d91d3926c9f0afb54cf52c782482a1087bab3
 127320 blocked 45ae4df9220701071ffec057d4b0071943022ab3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 ae8b8bc599ce2c1fc42f00a30d5e35a48c3e970c
 127306 pass 45ae4df9220701071ffec057d4b0071943022ab3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 43139135a8938de44f66333831d3a8655d07663a e3f667bc5f51d0aa44357a64ca134cd952679c81
 127321 pass 45ae4df9220701071ffec057d4b0071943022ab3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 aed19fb5370df48527fba82c88c6b7411776283a
 127323 pass 45ae4df9220701071ffec057d4b0071943022ab3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 16bbf8e7b39b50457bb2f6547f166bd54d50e4cd
 127324 fail 45ae4df9220701071ffec057d4b0071943022ab3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 1f0598a1beb6bbaa838dec4f321af543d3b96c7a
 127325 pass 45ae4df9220701071ffec057d4b0071943022ab3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 936b77255269b3b9b5685d565550e77d5080ac81
Searching for interesting versions
 Result found: flight 125501 (pass), for basis pass
 Result found: flight 127284 (fail), for basis failure
 Repro found: flight 127306 (pass), for basis pass
 Repro found: flight 127311 (fail), for basis failure
 0 revisions at 45ae4df9220701071ffec057d4b0071943022ab3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 936b77255269b3b9b5685d565550e77d5080ac81
No revisions left to test, checking graph state.
 Result found: flight 127325 (pass), for last pass
 Result found: flight 127328 (fail), for first failure
 Repro found: flight 127330 (pass), for last pass
 Repro found: flight 127331 (fail), for first failure
 Repro found: flight 127332 (pass), for last pass
 Repro found: flight 127333 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  09b3907f93fe023ebca809c9f706f3d022801dce
  Bug not present: 936b77255269b3b9b5685d565550e77d5080ac81
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/127333/


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

pnmtopng: 144 colors found
Revision graph left in /home/logs/results/bisect/linux-linus/test-amd64-amd64-qemuu-nested-intel.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
127333: tolerable ALL FAIL

flight 127333 linux-linus real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/127333/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-qemuu-nested-intel 10 debian-hvm-install fail baseline untested


jobs:
 test-amd64-amd64-qemuu-nested-intel                          fail    


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



--===============8024350806135472761==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8024350806135472761==--
