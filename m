From: osstest service owner <osstest-admin@xenproject.org>
Subject: [qemu-mainline bisection] complete
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict
Date: Mon, 21 Jan 2019 00:33:21 +0000
Message-ID: <E1glNWj-0000jV-NM@osstest.test-lab.xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7696682212450872145=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cEpO=P5=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1glNWm-0000GV-0X
 for xen-devel@lists.xenproject.org; Mon, 21 Jan 2019 00:33:24 +0000
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

--===============7696682212450872145==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict
testid debian-hvm-install

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  f459c3ae3397c6e448b03473dc1c803c048bb980
  Bug not present: 785fb75168b5fd51aa2213f113995b73052f434e
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/132222/


  commit f459c3ae3397c6e448b03473dc1c803c048bb980
  Author: Anthony PERARD <anthony.perard@citrix.com>
  Date:   Thu May 31 14:45:12 2018 +0100
  
      libxl: QEMU startup sync based on QMP
      
      This is only activated when dm_restrict=1, as explained in a previous
      patch "libxl_dm: Pre-open QMP socket for QEMU"
      
      Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
      Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
      Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict.debian-hvm-install --summary-out=tmp/132222.bisection-summary --basis-template=131842 --blessings=real,real-bisect qemu-mainline test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict debian-hvm-install
Searching for failure / basis pass:
 132081 fail [host=albana0] / 131963 [host=elbling0] 131842 [host=italia0] 131801 [host=godello0] 131788 [host=baroque0] 131743 [host=rimava1] 131734 [host=debina1] 131723 [host=godello1] 131712 ok.
Failure / basis pass flights: 132081 / 131712
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 8979da2558a4993989542e1d2db23b426b148ae9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 a8d2b0685681e2f291faaa501efbbd76875f8ec8 93a62c544e20ba9e141e411bbaae3d65259d13a3
Basis pass d2dd9f1593dc4d5ceb5cf4a973ed2c6e3a49d799 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 1b3e80082bcd9b760113bbc023496cd22efad2dc 7b6e05c50fc39466fcc685fb6d4216f99af58743
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#d2dd9f1593dc4d5ceb5cf4a973ed2c6e3a49d799-8979da2558a4993989542e1d2db23b426b148ae9 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://git.qemu.org/qemu.git#1b3e80082bcd9b760113bbc023496cd22efad2dc-a8d2b0685681e2f291faaa501efbbd76875f8ec8 git://xenbits.xen.org/xen.git#7b6e05c50fc39466fcc685fb6d4216f99af58743-93a62c544e20ba9e141e411bbaae3d65259d13a3
Loaded 7590 nodes in revision graph
Searching for test results:
 131734 [host=debina1]
 131723 [host=godello1]
 131712 pass d2dd9f1593dc4d5ceb5cf4a973ed2c6e3a49d799 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 1b3e80082bcd9b760113bbc023496cd22efad2dc 7b6e05c50fc39466fcc685fb6d4216f99af58743
 131743 [host=rimava1]
 131788 [host=baroque0]
 131801 [host=godello0]
 131842 [host=italia0]
 131980 fail 9c07fc259396fb5a26713755f92f60eb477ed567 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 4b9f0b0f7c84eea2dfb0d5be3e0254bc91319dbc 93a62c544e20ba9e141e411bbaae3d65259d13a3
 131963 [host=elbling0]
 132082 fail irrelevant
 132055 pass d2dd9f1593dc4d5ceb5cf4a973ed2c6e3a49d799 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 1b3e80082bcd9b760113bbc023496cd22efad2dc 7b6e05c50fc39466fcc685fb6d4216f99af58743
 132032 fail irrelevant
 132079 fail 9c07fc259396fb5a26713755f92f60eb477ed567 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 f3b604e31d8450e42b93cb9042341c8b267cc22c 93a62c544e20ba9e141e411bbaae3d65259d13a3
 132072 fail 9c07fc259396fb5a26713755f92f60eb477ed567 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 4b9f0b0f7c84eea2dfb0d5be3e0254bc91319dbc 93a62c544e20ba9e141e411bbaae3d65259d13a3
 132076 fail 9c07fc259396fb5a26713755f92f60eb477ed567 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 89bd861c2b470e3fb45596945509079c72af3ac2 93a62c544e20ba9e141e411bbaae3d65259d13a3
 132081 fail 8979da2558a4993989542e1d2db23b426b148ae9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 a8d2b0685681e2f291faaa501efbbd76875f8ec8 93a62c544e20ba9e141e411bbaae3d65259d13a3
 132090 fail 24737fa6bcf1d7ffb71ceb78d7a7c275cb7e1d13 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 27df21ca3886fff4dd3d70e515517667963a52f1 93a62c544e20ba9e141e411bbaae3d65259d13a3
 132101 fail 24737fa6bcf1d7ffb71ceb78d7a7c275cb7e1d13 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 e53f7796fbe71a5c7c24ffebf04b4aa9a759da36 1bce5f9baf0f4a4e50722f32b44afe4fdefc6b35
 132106 pass 24737fa6bcf1d7ffb71ceb78d7a7c275cb7e1d13 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 b7744b861bcce6909a39a58b6bba6b0fb175fc4e 808cff4c2af66afd61973451aeb7e708732abf90
 132110 pass 24737fa6bcf1d7ffb71ceb78d7a7c275cb7e1d13 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 823dcd58ea58c7e983cc301ab2c1c55c4c8f4c18 808cff4c2af66afd61973451aeb7e708732abf90
 132113 pass d2dd9f1593dc4d5ceb5cf4a973ed2c6e3a49d799 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 3a8eb78e6c135422017888380db091793039b6dd 808cff4c2af66afd61973451aeb7e708732abf90
 132140 pass d2dd9f1593dc4d5ceb5cf4a973ed2c6e3a49d799 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 19bcc4bc3213e78c303ad480a7a578f62258252d a5b0eb363694e7e15405f0b3fc5fb6fab79df1db
 132115 pass 24737fa6bcf1d7ffb71ceb78d7a7c275cb7e1d13 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 a311f891abf3833c1e4c5a62a6e5b0f1b81f22c3 808cff4c2af66afd61973451aeb7e708732abf90
 132145 pass 95b4b711444a4414bccfc0b1fe3c5096675ab8f7 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 e59dbbac0364344a3ad84c3497a98c56003d3fb8 808cff4c2af66afd61973451aeb7e708732abf90
 132119 pass d2dd9f1593dc4d5ceb5cf4a973ed2c6e3a49d799 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 ac89de40ef5d4eb1704aa830342a5371413a81dc 525ef6584f85222d34b24f8043fd2760da49995d
 132163 pass d2dd9f1593dc4d5ceb5cf4a973ed2c6e3a49d799 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 1b3e80082bcd9b760113bbc023496cd22efad2dc 7b6e05c50fc39466fcc685fb6d4216f99af58743
 132123 pass d2dd9f1593dc4d5ceb5cf4a973ed2c6e3a49d799 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 31ed41889e6e13699871040fe089a2884dca46cb a5b0eb363694e7e15405f0b3fc5fb6fab79df1db
 132148 pass 7f3901d80c6a688c28638f5cb53ab0d12506cc42 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 e59dbbac0364344a3ad84c3497a98c56003d3fb8 808cff4c2af66afd61973451aeb7e708732abf90
 132175 fail 24737fa6bcf1d7ffb71ceb78d7a7c275cb7e1d13 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 e53f7796fbe71a5c7c24ffebf04b4aa9a759da36 f459c3ae3397c6e448b03473dc1c803c048bb980
 132127 pass d2dd9f1593dc4d5ceb5cf4a973ed2c6e3a49d799 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 21a43af0f18335af4abb1959aa28ee9d159a2d43 525ef6584f85222d34b24f8043fd2760da49995d
 132135 pass 24737fa6bcf1d7ffb71ceb78d7a7c275cb7e1d13 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 d769f0dfeeaa1554a38fedb16bb20a4b0ecf793c a67ce55a3e511104e0212bfbafda5215c74e07c7
 132152 pass cb2520535f6de543038a909746bee607e2138164 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 e59dbbac0364344a3ad84c3497a98c56003d3fb8 808cff4c2af66afd61973451aeb7e708732abf90
 132202 pass 24737fa6bcf1d7ffb71ceb78d7a7c275cb7e1d13 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 e53f7796fbe71a5c7c24ffebf04b4aa9a759da36 785fb75168b5fd51aa2213f113995b73052f434e
 132156 pass 24737fa6bcf1d7ffb71ceb78d7a7c275cb7e1d13 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 e53f7796fbe71a5c7c24ffebf04b4aa9a759da36 0778f1a499a5d398feeb53332efa48073b998172
 132167 fail 8979da2558a4993989542e1d2db23b426b148ae9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 a8d2b0685681e2f291faaa501efbbd76875f8ec8 93a62c544e20ba9e141e411bbaae3d65259d13a3
 132188 pass 24737fa6bcf1d7ffb71ceb78d7a7c275cb7e1d13 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 e53f7796fbe71a5c7c24ffebf04b4aa9a759da36 77b595836bfd97711afae9b1bb2548e33e87b042
 132182 pass 24737fa6bcf1d7ffb71ceb78d7a7c275cb7e1d13 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 e53f7796fbe71a5c7c24ffebf04b4aa9a759da36 15c63d33eab32b1d23bb78a7e3a9eaf62f5226f2
 132192 pass 24737fa6bcf1d7ffb71ceb78d7a7c275cb7e1d13 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 e53f7796fbe71a5c7c24ffebf04b4aa9a759da36 785fb75168b5fd51aa2213f113995b73052f434e
 132197 fail 24737fa6bcf1d7ffb71ceb78d7a7c275cb7e1d13 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 e53f7796fbe71a5c7c24ffebf04b4aa9a759da36 f459c3ae3397c6e448b03473dc1c803c048bb980
 132208 fail 24737fa6bcf1d7ffb71ceb78d7a7c275cb7e1d13 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 e53f7796fbe71a5c7c24ffebf04b4aa9a759da36 f459c3ae3397c6e448b03473dc1c803c048bb980
 132215 pass 24737fa6bcf1d7ffb71ceb78d7a7c275cb7e1d13 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 e53f7796fbe71a5c7c24ffebf04b4aa9a759da36 785fb75168b5fd51aa2213f113995b73052f434e
 132222 fail 24737fa6bcf1d7ffb71ceb78d7a7c275cb7e1d13 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 e53f7796fbe71a5c7c24ffebf04b4aa9a759da36 f459c3ae3397c6e448b03473dc1c803c048bb980
Searching for interesting versions
 Result found: flight 131712 (pass), for basis pass
 Result found: flight 132081 (fail), for basis failure
 Repro found: flight 132163 (pass), for basis pass
 Repro found: flight 132167 (fail), for basis failure
 0 revisions at 24737fa6bcf1d7ffb71ceb78d7a7c275cb7e1d13 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 e53f7796fbe71a5c7c24ffebf04b4aa9a759da36 785fb75168b5fd51aa2213f113995b73052f434e
No revisions left to test, checking graph state.
 Result found: flight 132192 (pass), for last pass
 Result found: flight 132197 (fail), for first failure
 Repro found: flight 132202 (pass), for last pass
 Repro found: flight 132208 (fail), for first failure
 Repro found: flight 132215 (pass), for last pass
 Repro found: flight 132222 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  f459c3ae3397c6e448b03473dc1c803c048bb980
  Bug not present: 785fb75168b5fd51aa2213f113995b73052f434e
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/132222/


  commit f459c3ae3397c6e448b03473dc1c803c048bb980
  Author: Anthony PERARD <anthony.perard@citrix.com>
  Date:   Thu May 31 14:45:12 2018 +0100
  
      libxl: QEMU startup sync based on QMP
      
      This is only activated when dm_restrict=1, as explained in a previous
      patch "libxl_dm: Pre-open QMP socket for QEMU"
      
      Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
      Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
      Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

pnmtopng: 213 colors found
Revision graph left in /home/logs/results/bisect/qemu-mainline/test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
132222: tolerable ALL FAIL

flight 132222 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/132222/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 10 debian-hvm-install fail baseline untested


jobs:
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    


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



--===============7696682212450872145==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7696682212450872145==--
