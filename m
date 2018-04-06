From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable-smoke bisection] complete build-arm64-xsm
Date: Fri, 06 Apr 2018 01:15:22 +0000
Message-ID: <E1f4FyM-0002tQ-Qb@osstest.test-lab.xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7942317739920437445=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+rjf=g3=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1f4FyQ-0006VJ-UY
 for xen-devel@lists.xenproject.org; Fri, 06 Apr 2018 01:15:26 +0000
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

--===============7942317739920437445==
Content-Type: text/plain

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-arm64-xsm
testid xen-build

Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  74fd984ae699727ae98f4fc36450ff76c8fc7ff3
  Bug not present: 451004603247205467ec34b366b4cfa3814a5d95
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/121945/


  commit 74fd984ae699727ae98f4fc36450ff76c8fc7ff3
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Fri Mar 9 12:24:13 2018 +0000
  
      tools/libxl: Drop xc_domain_configuration_t from libxl__domain_build_state
      
      The data it stores is initialised and exclusively used within
      libxl__domain_make(), with the important details written back elsewhere by
      libxl__arch_domain_save_config().  Prepare xc_config on libxl__domain_make()'s
      stack, and drop the parameter.
      
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
      Acked-by: Wei Liu <wei.liu2@citrix.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build --summary-out=tmp/121945.bisection-summary --basis-template=121876 --blessings=real,real-bisect xen-unstable-smoke build-arm64-xsm xen-build
Searching for failure / basis pass:
 121936 fail [host=laxton1] / 121876 ok.
Failure / basis pass flights: 121936 / 121876
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 5c3fdee026a204a59cb392e43a313ab558de9682 18d12056ccea435dca7fcbe2085fff15bca19046
Basis pass 5c3fdee026a204a59cb392e43a313ab558de9682 451004603247205467ec34b366b4cfa3814a5d95
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen.git#5c3fdee026a204a59cb392e43a313ab558de9682-5c3fdee026a204a59cb392e43a313ab558de9682 git://xenbits.xen.org/xen.git#451004603247205467ec34b366b4cfa3814a5d95-18d12056ccea435dca7fcbe2085fff15bca19046
Loaded 1001 nodes in revision graph
Searching for test results:
 121876 pass 5c3fdee026a204a59cb392e43a313ab558de9682 451004603247205467ec34b366b4cfa3814a5d95
 121889 fail 5c3fdee026a204a59cb392e43a313ab558de9682 c0d98b35714fb707217c9062b6518e158cd72eea
 121931 fail 5c3fdee026a204a59cb392e43a313ab558de9682 18d12056ccea435dca7fcbe2085fff15bca19046
 121902 pass 5c3fdee026a204a59cb392e43a313ab558de9682 451004603247205467ec34b366b4cfa3814a5d95
 121938 fail 5c3fdee026a204a59cb392e43a313ab558de9682 74fd984ae699727ae98f4fc36450ff76c8fc7ff3
 121909 fail 5c3fdee026a204a59cb392e43a313ab558de9682 c0d98b35714fb707217c9062b6518e158cd72eea
 121905 fail 5c3fdee026a204a59cb392e43a313ab558de9682 c0d98b35714fb707217c9062b6518e158cd72eea
 121915 fail 5c3fdee026a204a59cb392e43a313ab558de9682 2649612686f968a52ce53d173f5c2a3088ad17dd
 121923 fail 5c3fdee026a204a59cb392e43a313ab558de9682 74fd984ae699727ae98f4fc36450ff76c8fc7ff3
 121920 fail 5c3fdee026a204a59cb392e43a313ab558de9682 18d12056ccea435dca7fcbe2085fff15bca19046
 121925 pass 5c3fdee026a204a59cb392e43a313ab558de9682 451004603247205467ec34b366b4cfa3814a5d95
 121936 fail 5c3fdee026a204a59cb392e43a313ab558de9682 18d12056ccea435dca7fcbe2085fff15bca19046
 121939 pass 5c3fdee026a204a59cb392e43a313ab558de9682 451004603247205467ec34b366b4cfa3814a5d95
 121945 fail 5c3fdee026a204a59cb392e43a313ab558de9682 74fd984ae699727ae98f4fc36450ff76c8fc7ff3
Searching for interesting versions
 Result found: flight 121876 (pass), for basis pass
 Result found: flight 121920 (fail), for basis failure
 Repro found: flight 121925 (pass), for basis pass
 Repro found: flight 121931 (fail), for basis failure
 0 revisions at 5c3fdee026a204a59cb392e43a313ab558de9682 451004603247205467ec34b366b4cfa3814a5d95
No revisions left to test, checking graph state.
 Result found: flight 121876 (pass), for last pass
 Result found: flight 121923 (fail), for first failure
 Repro found: flight 121925 (pass), for last pass
 Repro found: flight 121938 (fail), for first failure
 Repro found: flight 121939 (pass), for last pass
 Repro found: flight 121945 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  74fd984ae699727ae98f4fc36450ff76c8fc7ff3
  Bug not present: 451004603247205467ec34b366b4cfa3814a5d95
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/121945/


  commit 74fd984ae699727ae98f4fc36450ff76c8fc7ff3
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Fri Mar 9 12:24:13 2018 +0000
  
      tools/libxl: Drop xc_domain_configuration_t from libxl__domain_build_state
      
      The data it stores is initialised and exclusively used within
      libxl__domain_make(), with the important details written back elsewhere by
      libxl__arch_domain_save_config().  Prepare xc_config on libxl__domain_make()'s
      stack, and drop the parameter.
      
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
      Acked-by: Wei Liu <wei.liu2@citrix.com>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
121945: tolerable ALL FAIL

flight 121945 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/121945/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-arm64-xsm               6 xen-build               fail baseline untested


jobs:
 build-arm64-xsm                                              fail    


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



--===============7942317739920437445==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7942317739920437445==--
