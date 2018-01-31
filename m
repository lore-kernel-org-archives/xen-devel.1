From: osstest service owner <osstest-admin@xenproject.org>
Subject: [linux-linus bisection] complete
	test-amd64-amd64-xl-pvhv2-amd
Date: Wed, 31 Jan 2018 21:13:54 +0000
Message-ID: <E1egzha-00069x-Af@osstest.test-lab.xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2071727226472193394=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=emza=e2=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1egzho-00075j-36
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2018 21:14:08 +0000
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

--===============2071727226472193394==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-xl-pvhv2-amd
testid guest-start

Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  4a5733771e6f33918eba07b584cccce564a67ac1
  Bug not present: 1c2e0f9e4f263714db917eb54f8d1c2d1463ed4c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/118498/


  commit 4a5733771e6f33918eba07b584cccce564a67ac1
  Author: Juergen Gross <jgross@suse.com>
  Date:   Fri Dec 1 15:14:07 2017 +0100
  
      libxl: put RSDP for PVH guest near 4GB
      
      Instead of locating the RSDP table below 1MB put it just below 4GB
      like the rest of the ACPI tables in case of PVH guests. This will
      avoid punching more holes than necessary into the memory map.
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Acked-by: Wei Liu <wei.liu2@citrix.com>
      Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/linux-linus/test-amd64-amd64-xl-pvhv2-amd.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/linux-linus/test-amd64-amd64-xl-pvhv2-amd.guest-start --summary-out=tmp/118498.bisection-summary --basis-template=118324 --blessings=real,real-bisect linux-linus test-amd64-amd64-xl-pvhv2-amd guest-start
Searching for failure / basis pass:
 118445 fail [host=pinot1] / 118428 ok.
Failure / basis pass flights: 118445 / 118428
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 0a4b6e2f80aad46fb55a5cf7b1664c0aef030ee0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 4c7e478d597b0346eef3a256cfd6794ac778b608
Basis pass d8a5b80568a9cb66810e75b182018e9edb68e8ff c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 e871e80c38547d9faefc6604532ba3e985e65873
Generating revisions with ./adhoc-revtuple-generator  git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git#d8a5b80568a9cb66810e75b182018e9edb68e8ff-0a4b6e2f80aad46fb55a5cf7b1664c0aef030ee0 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#c8ea0457495342c417c3dc033bba25148b279f60-c8ea0457495342c417c3dc033bba25148b279f60 git://xenbits.xen.org/qemu-xen.git#2b033e396f4fa0981bae1213cdacd15775655a97-2b033e396f4fa0981bae1213cdacd15775655a97 git://xenbits.xen.org/xen.git#e871e80c38547d9faefc6604532ba3e985e65873-4c7e478d597b0346eef3a256cfd6794ac778b608
>From git://cache:9419/git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6
   0be600a5add7..e1c70f32386c  master     -> origin/master
Loaded 178959 nodes in revision graph
Searching for test results:
 118463 pass d8a5b80568a9cb66810e75b182018e9edb68e8ff c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 e871e80c38547d9faefc6604532ba3e985e65873
 118445 fail 0a4b6e2f80aad46fb55a5cf7b1664c0aef030ee0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 4c7e478d597b0346eef3a256cfd6794ac778b608
 118428 pass d8a5b80568a9cb66810e75b182018e9edb68e8ff c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 e871e80c38547d9faefc6604532ba3e985e65873
 118466 fail 0a4b6e2f80aad46fb55a5cf7b1664c0aef030ee0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 4c7e478d597b0346eef3a256cfd6794ac778b608
 118498 fail d8a5b80568a9cb66810e75b182018e9edb68e8ff c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 4a5733771e6f33918eba07b584cccce564a67ac1
 118467 fail d8a5b80568a9cb66810e75b182018e9edb68e8ff c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 35e40550ab7544c88db548d4d34ce670870e0926
 118469 pass d8a5b80568a9cb66810e75b182018e9edb68e8ff c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 335eba772b82db70381512ae1384104810800767
 118470 pass d8a5b80568a9cb66810e75b182018e9edb68e8ff c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 62982da926a6c0eeb3f40daa2059ecbb804a69f0
 118478 pass d8a5b80568a9cb66810e75b182018e9edb68e8ff c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 e730f8e41e8537f1db9770b9464f9523c28857b9
 118482 fail d8a5b80568a9cb66810e75b182018e9edb68e8ff c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 81838c9067ab7f4b89d33f90a71225ffff9800ba
 118486 fail d8a5b80568a9cb66810e75b182018e9edb68e8ff c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 4a5733771e6f33918eba07b584cccce564a67ac1
 118489 pass d8a5b80568a9cb66810e75b182018e9edb68e8ff c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 1c2e0f9e4f263714db917eb54f8d1c2d1463ed4c
 118491 fail d8a5b80568a9cb66810e75b182018e9edb68e8ff c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 4a5733771e6f33918eba07b584cccce564a67ac1
 118492 pass d8a5b80568a9cb66810e75b182018e9edb68e8ff c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 1c2e0f9e4f263714db917eb54f8d1c2d1463ed4c
 118493 fail d8a5b80568a9cb66810e75b182018e9edb68e8ff c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 4a5733771e6f33918eba07b584cccce564a67ac1
 118494 pass d8a5b80568a9cb66810e75b182018e9edb68e8ff c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 1c2e0f9e4f263714db917eb54f8d1c2d1463ed4c
Searching for interesting versions
 Result found: flight 118428 (pass), for basis pass
 Result found: flight 118445 (fail), for basis failure
 Repro found: flight 118463 (pass), for basis pass
 Repro found: flight 118466 (fail), for basis failure
 0 revisions at d8a5b80568a9cb66810e75b182018e9edb68e8ff c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 1c2e0f9e4f263714db917eb54f8d1c2d1463ed4c
No revisions left to test, checking graph state.
 Result found: flight 118489 (pass), for last pass
 Result found: flight 118491 (fail), for first failure
 Repro found: flight 118492 (pass), for last pass
 Repro found: flight 118493 (fail), for first failure
 Repro found: flight 118494 (pass), for last pass
 Repro found: flight 118498 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  4a5733771e6f33918eba07b584cccce564a67ac1
  Bug not present: 1c2e0f9e4f263714db917eb54f8d1c2d1463ed4c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/118498/


  commit 4a5733771e6f33918eba07b584cccce564a67ac1
  Author: Juergen Gross <jgross@suse.com>
  Date:   Fri Dec 1 15:14:07 2017 +0100
  
      libxl: put RSDP for PVH guest near 4GB
      
      Instead of locating the RSDP table below 1MB put it just below 4GB
      like the rest of the ACPI tables in case of PVH guests. This will
      avoid punching more holes than necessary into the memory map.
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Acked-by: Wei Liu <wei.liu2@citrix.com>
      Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

pnmtopng: 247 colors found
Revision graph left in /home/logs/results/bisect/linux-linus/test-amd64-amd64-xl-pvhv2-amd.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
118498: tolerable ALL FAIL

flight 118498 linux-linus real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/118498/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-pvhv2-amd 12 guest-start            fail baseline untested


jobs:
 test-amd64-amd64-xl-pvhv2-amd                                fail    


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



--===============2071727226472193394==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2071727226472193394==--
