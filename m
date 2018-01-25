From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable-smoke bisection] complete build-arm64-xsm
Date: Thu, 25 Jan 2018 21:47:39 +0000
Message-ID: <E1eepMx-0004xg-Eo@osstest.test-lab.xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1827062983574197297=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xensource.com, osstest-admin@xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============1827062983574197297==
Content-Type: text/plain

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-arm64-xsm
testid xen-build

Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  e8d461497d9e23b01f9f6aeb9ddf92ff2693a2c1
  Bug not present: 7f76b3a06aefc1f201f6bfcb593b5d0b3dc68bff
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/118345/


  commit e8d461497d9e23b01f9f6aeb9ddf92ff2693a2c1
  Author: Roger Pau Monné <roger.pau@citrix.com>
  Date:   Thu Jan 25 12:27:44 2018 +0100
  
      gcov: rename sysctl and functions
      
      Change gcov to cov (for internal interfaces) or coverage (for the
      public ones).
      
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Reviewed-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
      Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
      Acked-by: Wei Liu <wei.liu2@citrix.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build --summary-out=tmp/118345.bisection-summary --basis-template=118326 --blessings=real,real-bisect xen-unstable-smoke build-arm64-xsm xen-build
Searching for failure / basis pass:
 118339 fail [host=laxton1] / 118326 ok.
Failure / basis pass flights: 118339 / 118326
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 2b033e396f4fa0981bae1213cdacd15775655a97 5b6b15acebfc6ef3dcb72385f328c985526a33e3
Basis pass 2b033e396f4fa0981bae1213cdacd15775655a97 2375832c7e51b67f076e6b07854c4a541cb4bdc3
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen.git#2b033e396f4fa0981bae1213cdacd15775655a97-2b033e396f4fa0981bae1213cdacd15775655a97 git://xenbits.xen.org/xen.git#2375832c7e51b67f076e6b07854c4a541cb4bdc3-5b6b15acebfc6ef3dcb72385f328c985526a33e3
Loaded 1001 nodes in revision graph
Searching for test results:
 118331 fail 2b033e396f4fa0981bae1213cdacd15775655a97 5b6b15acebfc6ef3dcb72385f328c985526a33e3
 118326 pass 2b033e396f4fa0981bae1213cdacd15775655a97 2375832c7e51b67f076e6b07854c4a541cb4bdc3
 118327 fail 2b033e396f4fa0981bae1213cdacd15775655a97 5b6b15acebfc6ef3dcb72385f328c985526a33e3
 118330 pass 2b033e396f4fa0981bae1213cdacd15775655a97 2375832c7e51b67f076e6b07854c4a541cb4bdc3
 118332 fail 2b033e396f4fa0981bae1213cdacd15775655a97 5b6b15acebfc6ef3dcb72385f328c985526a33e3
 118333 fail 2b033e396f4fa0981bae1213cdacd15775655a97 e8d461497d9e23b01f9f6aeb9ddf92ff2693a2c1
 118334 pass 2b033e396f4fa0981bae1213cdacd15775655a97 642123c5123ff48d76d7ee376219ab50336636b9
 118335 pass 2b033e396f4fa0981bae1213cdacd15775655a97 af2a20e40e92da6c5383b66bc507bdb7d15ff829
 118336 pass 2b033e396f4fa0981bae1213cdacd15775655a97 7f76b3a06aefc1f201f6bfcb593b5d0b3dc68bff
 118338 fail 2b033e396f4fa0981bae1213cdacd15775655a97 e8d461497d9e23b01f9f6aeb9ddf92ff2693a2c1
 118340 pass 2b033e396f4fa0981bae1213cdacd15775655a97 7f76b3a06aefc1f201f6bfcb593b5d0b3dc68bff
 118342 fail 2b033e396f4fa0981bae1213cdacd15775655a97 e8d461497d9e23b01f9f6aeb9ddf92ff2693a2c1
 118339 fail 2b033e396f4fa0981bae1213cdacd15775655a97 5b6b15acebfc6ef3dcb72385f328c985526a33e3
 118343 pass 2b033e396f4fa0981bae1213cdacd15775655a97 7f76b3a06aefc1f201f6bfcb593b5d0b3dc68bff
 118345 fail 2b033e396f4fa0981bae1213cdacd15775655a97 e8d461497d9e23b01f9f6aeb9ddf92ff2693a2c1
Searching for interesting versions
 Result found: flight 118326 (pass), for basis pass
 Result found: flight 118327 (fail), for basis failure
 Repro found: flight 118330 (pass), for basis pass
 Repro found: flight 118331 (fail), for basis failure
 0 revisions at 2b033e396f4fa0981bae1213cdacd15775655a97 7f76b3a06aefc1f201f6bfcb593b5d0b3dc68bff
No revisions left to test, checking graph state.
 Result found: flight 118336 (pass), for last pass
 Result found: flight 118338 (fail), for first failure
 Repro found: flight 118340 (pass), for last pass
 Repro found: flight 118342 (fail), for first failure
 Repro found: flight 118343 (pass), for last pass
 Repro found: flight 118345 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  e8d461497d9e23b01f9f6aeb9ddf92ff2693a2c1
  Bug not present: 7f76b3a06aefc1f201f6bfcb593b5d0b3dc68bff
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/118345/


  commit e8d461497d9e23b01f9f6aeb9ddf92ff2693a2c1
  Author: Roger Pau Monné <roger.pau@citrix.com>
  Date:   Thu Jan 25 12:27:44 2018 +0100
  
      gcov: rename sysctl and functions
      
      Change gcov to cov (for internal interfaces) or coverage (for the
      public ones).
      
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Reviewed-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
      Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
      Acked-by: Wei Liu <wei.liu2@citrix.com>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
118345: tolerable ALL FAIL

flight 118345 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/118345/

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



--===============1827062983574197297==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1827062983574197297==--
