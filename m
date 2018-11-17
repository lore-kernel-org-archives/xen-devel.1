From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable bisection] complete build-i386-xsm
Date: Sat, 17 Nov 2018 09:21:24 +0000
Message-ID: <E1gNwn6-0004Hh-UP@osstest.test-lab.xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8221596306728041696=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kxhy=n4=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1gNwnB-0000Fk-Pq
 for xen-devel@lists.xenproject.org; Sat, 17 Nov 2018 09:21:29 +0000
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

--===============8221596306728041696==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job build-i386-xsm
testid xen-build

Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  c66ef0fbe12b3e1e2da849dd85e5b7fe3aa81de5
  Bug not present: c49338ef287c44113476d4c6ccaad7fa2924f8c7
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/130274/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/build-i386-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/build-i386-xsm.xen-build --summary-out=tmp/130274.bisection-summary --basis-template=129426 --blessings=real,real-bisect xen-unstable build-i386-xsm xen-build
Searching for failure / basis pass:
 130063 fail [host=albana0] / 129817 ok.
Failure / basis pass flights: 130063 / 129817
(tree with no url: minios)
(tree in basispass but not in latest: ovmf)
(tree in basispass but not in latest: seabios)
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 15410d8fc8d6e63ab138a5c47427f418a43a1c56
Basis pass d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 6d8ffac1f7a782dc2c7f8df3871a294729ae36bd
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#de5b678ca4dcdfa83e322491d478d66df56c1986-de5b678ca4dcdfa83e322491d478d66df56c1986 git://xenbits.xen.org/xen.git#6d8ffac1f7a782dc2c7f8df3871a294729ae36bd-15410d8fc8d6e63ab138a5c47427f418a43a1c56
Loaded 1001 nodes in revision graph
Searching for test results:
 129738 [host=debina0]
 129817 pass d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 6d8ffac1f7a782dc2c7f8df3871a294729ae36bd
 130063 fail d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 15410d8fc8d6e63ab138a5c47427f418a43a1c56
 130225 pass d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 6d8ffac1f7a782dc2c7f8df3871a294729ae36bd
 130237 fail d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 15410d8fc8d6e63ab138a5c47427f418a43a1c56
 130239 fail d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 c66ef0fbe12b3e1e2da849dd85e5b7fe3aa81de5
 130242 pass d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 3b439f636ee9a9588203cf0aa0edfa18ccdc60b9
 130269 pass d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 c49338ef287c44113476d4c6ccaad7fa2924f8c7
 130248 pass d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 c6aae55786e138951daf25e14709895d8c166948
 130252 pass d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 c49338ef287c44113476d4c6ccaad7fa2924f8c7
 130254 fail d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 c66ef0fbe12b3e1e2da849dd85e5b7fe3aa81de5
 130274 fail d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 c66ef0fbe12b3e1e2da849dd85e5b7fe3aa81de5
 130257 pass d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 c49338ef287c44113476d4c6ccaad7fa2924f8c7
 130263 fail d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 c66ef0fbe12b3e1e2da849dd85e5b7fe3aa81de5
Searching for interesting versions
 Result found: flight 129817 (pass), for basis pass
 Result found: flight 130063 (fail), for basis failure
 Repro found: flight 130225 (pass), for basis pass
 Repro found: flight 130237 (fail), for basis failure
 0 revisions at d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 c49338ef287c44113476d4c6ccaad7fa2924f8c7
No revisions left to test, checking graph state.
 Result found: flight 130252 (pass), for last pass
 Result found: flight 130254 (fail), for first failure
 Repro found: flight 130257 (pass), for last pass
 Repro found: flight 130263 (fail), for first failure
 Repro found: flight 130269 (pass), for last pass
 Repro found: flight 130274 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  c66ef0fbe12b3e1e2da849dd85e5b7fe3aa81de5
  Bug not present: c49338ef287c44113476d4c6ccaad7fa2924f8c7
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/130274/


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

Revision graph left in /home/logs/results/bisect/xen-unstable/build-i386-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
130274: tolerable ALL FAIL

flight 130274 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/130274/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-i386-xsm                6 xen-build               fail baseline untested


jobs:
 build-i386-xsm                                               fail    


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



--===============8221596306728041696==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8221596306728041696==--
