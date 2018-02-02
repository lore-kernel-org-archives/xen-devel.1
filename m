From: osstest service owner <osstest-admin@xenproject.org>
Subject: [linux-linus bisection] complete
	test-amd64-amd64-xl-pvhv2-intel
Date: Fri, 02 Feb 2018 07:49:11 +0000
Message-ID: <E1ehW5v-0008IH-U5@osstest.test-lab.xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1859548799333933468=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=pa9u=e4=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1ehW65-0002ln-EH
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2018 07:49:21 +0000
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

--===============1859548799333933468==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-xl-pvhv2-intel
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/118533/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/linux-linus/test-amd64-amd64-xl-pvhv2-intel.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/linux-linus/test-amd64-amd64-xl-pvhv2-intel.guest-start --summary-out=tmp/118533.bisection-summary --basis-template=118324 --blessings=real,real-bisect linux-linus test-amd64-amd64-xl-pvhv2-intel guest-start
Searching for failure / basis pass:
 118464 fail [host=baroque1] / 118428 [host=italia0] 118401 [host=godello1] 118362 [host=baroque0] 118324 [host=italia1] 118283 [host=chardonnay1] 118276 [host=huxelrebe0] 118250 [host=godello0] 118215 [host=elbling1] 118112 ok.
Failure / basis pass flights: 118464 / 118112
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 13ddd1667e7f01071cdf120132238ffca004a88e c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 4c7e478d597b0346eef3a256cfd6794ac778b608
Basis pass 41aa5e5d712ba3a5f4fac0bbd6d976d70f9aed06 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 2d70b54e055635ff60526b6949156504b6194b7c
Generating revisions with ./adhoc-revtuple-generator  git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git#41aa5e5d712ba3a5f4fac0bbd6d976d70f9aed06-13ddd1667e7f01071cdf120132238ffca004a88e git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#c8ea0457495342c417c3dc033bba25148b279f60-c8ea0457495342c417c3dc033bba25148b279f60 git://xenbits.xen.org/qemu-xen.git#2b033e396f4fa0981bae1213cdacd15775655a97-2b033e396f4fa0981bae1213cdacd15775655a97 git://xenbits.xen.org/xen.git#2d70b54e055635ff60526b6949156504b6194b7c-4c7e478d597b0346eef3a256cfd6794ac778b608
Loaded 193877 nodes in revision graph
Searching for test results:
 118112 pass 41aa5e5d712ba3a5f4fac0bbd6d976d70f9aed06 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 2d70b54e055635ff60526b6949156504b6194b7c
 118215 [host=elbling1]
 118250 [host=godello0]
 118276 [host=huxelrebe0]
 118283 [host=chardonnay1]
 118324 [host=italia1]
 118445 fail 0a4b6e2f80aad46fb55a5cf7b1664c0aef030ee0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 4c7e478d597b0346eef3a256cfd6794ac778b608
 118362 [host=baroque0]
 118401 [host=godello1]
 118428 [host=italia0]
 118464 fail 13ddd1667e7f01071cdf120132238ffca004a88e c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 4c7e478d597b0346eef3a256cfd6794ac778b608
 118513 pass 41aa5e5d712ba3a5f4fac0bbd6d976d70f9aed06 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 daed6261fd1294bce3e103228c2f34732ef29a9e
 118516 pass 5a717843177c96ca3fe4565187de395afdb28092 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 e730f8e41e8537f1db9770b9464f9523c28857b9
 118499 pass 41aa5e5d712ba3a5f4fac0bbd6d976d70f9aed06 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 2d70b54e055635ff60526b6949156504b6194b7c
 118530 fail ad9294dbc227cbc8e173b3b963e7dd9af5314f77 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 4a5733771e6f33918eba07b584cccce564a67ac1
 118517 fail ad9294dbc227cbc8e173b3b963e7dd9af5314f77 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 9d35a9db36365a2d969cdb1af43921b708a8bb3e
 118500 fail 13ddd1667e7f01071cdf120132238ffca004a88e c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 4c7e478d597b0346eef3a256cfd6794ac778b608
 118503 fail db218549e65d1da181b2bfd3c362f58ffc12cf97 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 4c7e478d597b0346eef3a256cfd6794ac778b608
 118531 pass ad9294dbc227cbc8e173b3b963e7dd9af5314f77 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 1c2e0f9e4f263714db917eb54f8d1c2d1463ed4c
 118504 fail 1fe280a056dff50774bd59c3e61187cf8c0ccf10 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 1252e2823117346e1aad0c5f17cc76200194f808
 118518 fail ad9294dbc227cbc8e173b3b963e7dd9af5314f77 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 aeb318351a77c8556025fced110ce387e4dfb93e
 118506 fail e5571240236c5652f3e079b1d5866716a7ad819c c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 1252e2823117346e1aad0c5f17cc76200194f808
 118533 fail ad9294dbc227cbc8e173b3b963e7dd9af5314f77 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 4a5733771e6f33918eba07b584cccce564a67ac1
 118507 fail 69d08dcbbe34347cbc044629cf6f25d062593dfe c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 a5e7ce9560b408dbdc2f7fb8a58f6209601cc054
 118521 fail ad9294dbc227cbc8e173b3b963e7dd9af5314f77 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 4a5733771e6f33918eba07b584cccce564a67ac1
 118508 fail 100d39af5048aecb00522a128ec264781ba7ecfa c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 a5e7ce9560b408dbdc2f7fb8a58f6209601cc054
 118522 pass ad9294dbc227cbc8e173b3b963e7dd9af5314f77 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 e730f8e41e8537f1db9770b9464f9523c28857b9
 118511 fail a0dca10fce42ae82651edbe682b1c637a8ecd365 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 5e0e28d9cee41eab41e5f11489d93247c0a4a789
 118512 fail 591ff9ea51cec683e4cb378a3469228ba1d69010 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 56498d2cf9d3c5f7d3d894a89f7d66ed81548e01
 118523 pass ad9294dbc227cbc8e173b3b963e7dd9af5314f77 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 1c2e0f9e4f263714db917eb54f8d1c2d1463ed4c
 118525 fail ad9294dbc227cbc8e173b3b963e7dd9af5314f77 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 4a5733771e6f33918eba07b584cccce564a67ac1
 118526 pass ad9294dbc227cbc8e173b3b963e7dd9af5314f77 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 1c2e0f9e4f263714db917eb54f8d1c2d1463ed4c
Searching for interesting versions
 Result found: flight 118112 (pass), for basis pass
 Result found: flight 118464 (fail), for basis failure
 Repro found: flight 118499 (pass), for basis pass
 Repro found: flight 118500 (fail), for basis failure
 0 revisions at ad9294dbc227cbc8e173b3b963e7dd9af5314f77 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 2b033e396f4fa0981bae1213cdacd15775655a97 1c2e0f9e4f263714db917eb54f8d1c2d1463ed4c
No revisions left to test, checking graph state.
 Result found: flight 118523 (pass), for last pass
 Result found: flight 118525 (fail), for first failure
 Repro found: flight 118526 (pass), for last pass
 Repro found: flight 118530 (fail), for first failure
 Repro found: flight 118531 (pass), for last pass
 Repro found: flight 118533 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  4a5733771e6f33918eba07b584cccce564a67ac1
  Bug not present: 1c2e0f9e4f263714db917eb54f8d1c2d1463ed4c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/118533/


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

pnmtopng: 232 colors found
Revision graph left in /home/logs/results/bisect/linux-linus/test-amd64-amd64-xl-pvhv2-intel.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
118533: tolerable ALL FAIL

flight 118533 linux-linus real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/118533/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-pvhv2-intel 12 guest-start          fail baseline untested


jobs:
 test-amd64-amd64-xl-pvhv2-intel                              fail    


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



--===============1859548799333933468==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1859548799333933468==--
