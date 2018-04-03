From: osstest service owner <osstest-admin@xenproject.org>
Subject: [linux-linus bisection] complete
 test-amd64-amd64-xl-pvhv2-amd
Date: Tue, 03 Apr 2018 10:19:27 +0000
Message-ID: <E1f3J2F-0006MU-Rp@osstest.test-lab.xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3481577478375325029=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3qhp=gy=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1f3J2K-0000hH-NB
 for xen-devel@lists.xenproject.org; Tue, 03 Apr 2018 10:19:32 +0000
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

--===============3481577478375325029==
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
Running cs-bisection-step --graph-out=/home/logs/results/bisect/linux-linus/test-amd64-amd64-xl-pvhv2-amd.guest-start --summary-out=tmp/121739.bisection-summary --basis-template=118324 --blessings=real,real-bisect linux-linus test-amd64-amd64-xl-pvhv2-amd guest-start
Searching for failure / basis pass:
 121679 fail [host=pinot1] / 118428 ok.
Failure / basis pass flights: 121679 / 118428
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 10b84daddbec72c6b440216a69de9a9605127f7a c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 5c3fdee026a204a59cb392e43a313ab558de9682 eabb83121226d5a6a5a68da3a913ac0b5bb1e0cf
Basis pass d8a5b80568a9cb66810e75b182018e9edb68e8ff c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 e871e80c38547d9faefc6604532ba3e985e65873
Generating revisions with ./adhoc-revtuple-generator  git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git#d8a5b80568a9cb66810e75b182018e9edb68e8ff-10b84daddbec72c6b440216a69de9a9605127f7a git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#c8ea0457495342c417c3dc033bba25148b279f60-c8ea0457495342c417c3dc033bba25148b279f60 git://xenbits.xen.org/qemu-xen.git#2b033e396f4fa0981bae1213cdacd15775655a97-5c3fdee026a204a59cb392e43a313ab558de9682 git://xenbits.xen.org/xen.git#e871e80c38547d9faefc6604532ba3e985e65873-eabb83121226d5a6a5a68da3a913ac0b5bb1e0cf
adhoc-revtuple-generator: tree discontiguous: linux-2.6
Loaded 4732 nodes in revision graph
Searching for test results:
 118112 [host=rimava1]
 118215 [host=rimava0]
 118250 pass irrelevant
 118276 [host=rimava0]
 118283 pass irrelevant
 118463 pass d8a5b80568a9cb66810e75b182018e9edb68e8ff c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 e871e80c38547d9faefc6604532ba3e985e65873
 118324 [host=pinot0]
 118445 fail irrelevant
 118362 [host=rimava0]
 118401 [host=pinot0]
 118428 pass d8a5b80568a9cb66810e75b182018e9edb68e8ff c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 e871e80c38547d9faefc6604532ba3e985e65873
 118464 fail irrelevant
 118466 fail irrelevant
 118498 fail d8a5b80568a9cb66810e75b182018e9edb68e8ff c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 4a5733771e6f33918eba07b584cccce564a67ac1
 118467 fail d8a5b80568a9cb66810e75b182018e9edb68e8ff c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 35e40550ab7544c88db548d4d34ce670870e0926
 118469 pass d8a5b80568a9cb66810e75b182018e9edb68e8ff c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 335eba772b82db70381512ae1384104810800767
 118470 pass d8a5b80568a9cb66810e75b182018e9edb68e8ff c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 62982da926a6c0eeb3f40daa2059ecbb804a69f0
 118478 pass d8a5b80568a9cb66810e75b182018e9edb68e8ff c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 e730f8e41e8537f1db9770b9464f9523c28857b9
 118538 fail irrelevant
 118482 fail d8a5b80568a9cb66810e75b182018e9edb68e8ff c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 81838c9067ab7f4b89d33f90a71225ffff9800ba
 118486 fail d8a5b80568a9cb66810e75b182018e9edb68e8ff c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 4a5733771e6f33918eba07b584cccce564a67ac1
 118489 pass d8a5b80568a9cb66810e75b182018e9edb68e8ff c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 1c2e0f9e4f263714db917eb54f8d1c2d1463ed4c
 118491 fail d8a5b80568a9cb66810e75b182018e9edb68e8ff c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 4a5733771e6f33918eba07b584cccce564a67ac1
 118492 pass d8a5b80568a9cb66810e75b182018e9edb68e8ff c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 1c2e0f9e4f263714db917eb54f8d1c2d1463ed4c
 118493 fail d8a5b80568a9cb66810e75b182018e9edb68e8ff c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 4a5733771e6f33918eba07b584cccce564a67ac1
 118494 pass d8a5b80568a9cb66810e75b182018e9edb68e8ff c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 1c2e0f9e4f263714db917eb54f8d1c2d1463ed4c
 118501 fail irrelevant
 118556 fail irrelevant
 118566 fail irrelevant
 118576 fail irrelevant
 118586 fail irrelevant
 118629 fail irrelevant
 118598 fail irrelevant
 118638 blocked irrelevant
 118672 blocked irrelevant
 118775 blocked irrelevant
 118893 fail irrelevant
 118968 fail irrelevant
 119064 fail irrelevant
 119117 fail irrelevant
 119201 fail irrelevant
 119350 fail irrelevant
 119435 fail irrelevant
 119511 fail irrelevant
 119582 fail irrelevant
 119639 fail irrelevant
 119687 fail irrelevant
 119751 fail irrelevant
 119922 fail irrelevant
 119992 fail irrelevant
 120022 fail irrelevant
 120055 fail irrelevant
 120092 fail irrelevant
 120228 fail irrelevant
 120305 fail irrelevant
 120269 fail irrelevant
 120441 fail irrelevant
 120654 fail irrelevant
 120779 fail irrelevant
 120866 fail irrelevant
 120952 fail irrelevant
 121012 fail irrelevant
 121284 fail irrelevant
 121195 fail irrelevant
 121315 fail irrelevant
 121383 fail irrelevant
 121336 fail irrelevant
 121679 fail 10b84daddbec72c6b440216a69de9a9605127f7a c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 5c3fdee026a204a59cb392e43a313ab558de9682 eabb83121226d5a6a5a68da3a913ac0b5bb1e0cf
 121736 pass d8a5b80568a9cb66810e75b182018e9edb68e8ff c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 e871e80c38547d9faefc6604532ba3e985e65873
 121739 fail 10b84daddbec72c6b440216a69de9a9605127f7a c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 5c3fdee026a204a59cb392e43a313ab558de9682 eabb83121226d5a6a5a68da3a913ac0b5bb1e0cf
Searching for interesting versions
 Result found: flight 118428 (pass), for basis pass
 Result found: flight 121679 (fail), for basis failure
 Repro found: flight 121736 (pass), for basis pass
 Repro found: flight 121739 (fail), for basis failure
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

pnmtopng: 94 colors found
Revision graph left in /home/logs/results/bisect/linux-linus/test-amd64-amd64-xl-pvhv2-amd.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
121739: tolerable ALL FAIL

flight 121739 linux-linus real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/121739/

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



--===============3481577478375325029==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3481577478375325029==--
