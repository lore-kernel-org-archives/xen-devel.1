From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable-smoke bisection] complete build-amd64
Date: Mon, 12 Nov 2018 23:38:37 +0000
Message-ID: <E1gMLmv-0002Kh-3D@osstest.test-lab.xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6267586759308246288=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qidy=nx=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1gMLn0-0006mP-Dm
 for xen-devel@lists.xenproject.org; Mon, 12 Nov 2018 23:38:42 +0000
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

--===============6267586759308246288==
Content-Type: text/plain

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-amd64
testid xen-build

Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  c66ef0fbe12b3e1e2da849dd85e5b7fe3aa81de5
  Bug not present: c49338ef287c44113476d4c6ccaad7fa2924f8c7
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/129888/


  commit c66ef0fbe12b3e1e2da849dd85e5b7fe3aa81de5
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Thu Jul 19 16:50:03 2018 +0100
  
      libx86: Split x86_cpuid_policy_fill_native() out of calculate_raw_policy()
      
      This will shortly be wanted by the userspace emulator harnesses as well.
      
      Consolidate the cpuid{,_count}_leaf() helpers beside the structure definition,
      rather than having them scattered throughout Xen.
      
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
      Acked-by: Jan Beulich <jbeulich@suse.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-amd64.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build --summary-out=tmp/129888.bisection-summary --basis-template=129852 --blessings=real,real-bisect xen-unstable-smoke build-amd64 xen-build
Searching for failure / basis pass:
 129861 fail [host=albana1] / 129852 [host=godello1] 129846 [host=huxelrebe1] 129836 [host=godello0] 129727 [host=godello0] 129713 [host=huxelrebe1] 129702 ok.
Failure / basis pass flights: 129861 / 129702
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 011319e9ce110c70a3d52f2ea05e5eeb538c9e9e
Basis pass d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 55877a806f2fe7293779edb3a33ca6256edebed8
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#de5b678ca4dcdfa83e322491d478d66df56c1986-de5b678ca4dcdfa83e322491d478d66df56c1986 git://xenbits.xen.org/xen.git#55877a806f2fe7293779edb3a33ca6256edebed8-011319e9ce110c70a3d52f2ea05e5eeb538c9e9e
Loaded 1001 nodes in revision graph
Searching for test results:
 129713 [host=huxelrebe1]
 129702 pass d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 55877a806f2fe7293779edb3a33ca6256edebed8
 129727 [host=godello0]
 129852 [host=godello1]
 129846 [host=huxelrebe1]
 129836 [host=godello0]
 129871 pass d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 3b97ba8fe9a39b02de24e502ef4f80b75276f2cc
 129879 pass d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 c49338ef287c44113476d4c6ccaad7fa2924f8c7
 129867 pass d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 55877a806f2fe7293779edb3a33ca6256edebed8
 129886 fail d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 c66ef0fbe12b3e1e2da849dd85e5b7fe3aa81de5
 129873 pass d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 96f6ee15ad7ca96472779fc5c083b4149495c584
 129861 fail d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 011319e9ce110c70a3d52f2ea05e5eeb538c9e9e
 129869 fail d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 011319e9ce110c70a3d52f2ea05e5eeb538c9e9e
 129874 pass d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 c6aae55786e138951daf25e14709895d8c166948
 129877 fail d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 c66ef0fbe12b3e1e2da849dd85e5b7fe3aa81de5
 129880 fail d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 c66ef0fbe12b3e1e2da849dd85e5b7fe3aa81de5
 129884 pass d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 c49338ef287c44113476d4c6ccaad7fa2924f8c7
 129887 pass d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 c49338ef287c44113476d4c6ccaad7fa2924f8c7
 129888 fail d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 c66ef0fbe12b3e1e2da849dd85e5b7fe3aa81de5
Searching for interesting versions
 Result found: flight 129702 (pass), for basis pass
 Result found: flight 129861 (fail), for basis failure
 Repro found: flight 129867 (pass), for basis pass
 Repro found: flight 129869 (fail), for basis failure
 0 revisions at d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 c49338ef287c44113476d4c6ccaad7fa2924f8c7
No revisions left to test, checking graph state.
 Result found: flight 129879 (pass), for last pass
 Result found: flight 129880 (fail), for first failure
 Repro found: flight 129884 (pass), for last pass
 Repro found: flight 129886 (fail), for first failure
 Repro found: flight 129887 (pass), for last pass
 Repro found: flight 129888 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  c66ef0fbe12b3e1e2da849dd85e5b7fe3aa81de5
  Bug not present: c49338ef287c44113476d4c6ccaad7fa2924f8c7
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/129888/


  commit c66ef0fbe12b3e1e2da849dd85e5b7fe3aa81de5
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Thu Jul 19 16:50:03 2018 +0100
  
      libx86: Split x86_cpuid_policy_fill_native() out of calculate_raw_policy()
      
      This will shortly be wanted by the userspace emulator harnesses as well.
      
      Consolidate the cpuid{,_count}_leaf() helpers beside the structure definition,
      rather than having them scattered throughout Xen.
      
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
      Acked-by: Jan Beulich <jbeulich@suse.com>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
129888: tolerable ALL FAIL

flight 129888 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/129888/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-amd64                   6 xen-build               fail baseline untested


jobs:
 build-amd64                                                  fail    


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



--===============6267586759308246288==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6267586759308246288==--
