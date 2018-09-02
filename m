From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable-smoke bisection] complete
 test-armhf-armhf-xl
Date: Sun, 02 Sep 2018 09:54:19 +0000
Message-ID: <E1fwP5H-0004GU-T1@osstest.test-lab.xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5277854433508560654=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wihl=lq=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1fwP5N-0006gv-9V
 for xen-devel@lists.xenproject.org; Sun, 02 Sep 2018 09:54:25 +0000
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

--===============5277854433508560654==
Content-Type: text/plain

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job test-armhf-armhf-xl
testid xen-boot

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  d704c2d6dc82522434bc358b6c19cbe420b3552d
  Bug not present: a903bf52335898adb2891b45c8baf2a70b912485
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/127144/


  commit d704c2d6dc82522434bc358b6c19cbe420b3552d
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Mon Mar 19 11:19:52 2018 +0000
  
      xen/gnttab: Pass max_{grant,maptrack}_frames into grant_table_create()
      
      ... rather than setting the limits up after domain_create() has completed.
      
      This removes the common gnttab infrastructure for calculating the number of
      dom0 grant frames (as the common grant table code is not an appropriate place
      for it to live), opting instead to require the dom0 construction code to pass
      a sane value in via the configuration.
      
      In practice, this now means that there is never a partially constructed grant
      table for a reference-able domain.
      
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
      Reviewed-by: Julien Grall <julien.grall@arm.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/test-armhf-armhf-xl.xen-boot.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/test-armhf-armhf-xl.xen-boot --summary-out=tmp/127144.bisection-summary --basis-template=126996 --blessings=real,real-bisect xen-unstable-smoke test-armhf-armhf-xl xen-boot
Searching for failure / basis pass:
 127136 fail [host=arndale-metrocentre] / 126996 ok.
Failure / basis pass flights: 127136 / 126996
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 50484ee133c2219a26fd98b39770187221b5e0bc c530a75c1e6a472b0eb9558310b518f0dfcd8860 de5b678ca4dcdfa83e322491d478d66df56c1986 342dcb6430d76ebd1ce229a02bad83f8881c9ac9
Basis pass 50484ee133c2219a26fd98b39770187221b5e0bc c530a75c1e6a472b0eb9558310b518f0dfcd8860 4f080070a9809bde857851e68a3aeff0c4b9b6a6 f04955e18502035121776f6e09d83ae5a36c773c
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#50484ee133c2219a26fd98b39770187221b5e0bc-50484ee133c2219a26fd98b39770187221b5e0bc git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen.git#4f080070a9809bde857851e68a3aeff0c4b9b6a6-de5b678ca4dcdfa83e322491d478d66df56c1986 git://xenbits.xen.org/xen.git#f04955e18502035121776f6e09d83ae5a36c773c-342dcb6430d76ebd1ce229a02bad83f8881c9ac9
>From git://cache:9419/git://xenbits.xen.org/xen
   b28cd21c36..f04955e185  coverity-tested/smoke -> origin/coverity-tested/smoke
Loaded 2006 nodes in revision graph
Searching for test results:
 127054 [host=arndale-bluewater]
 127047 [host=arndale-bluewater]
 126996 pass 50484ee133c2219a26fd98b39770187221b5e0bc c530a75c1e6a472b0eb9558310b518f0dfcd8860 4f080070a9809bde857851e68a3aeff0c4b9b6a6 f04955e18502035121776f6e09d83ae5a36c773c
 127052 fail 50484ee133c2219a26fd98b39770187221b5e0bc c530a75c1e6a472b0eb9558310b518f0dfcd8860 de5b678ca4dcdfa83e322491d478d66df56c1986 342dcb6430d76ebd1ce229a02bad83f8881c9ac9
 127066 fail 50484ee133c2219a26fd98b39770187221b5e0bc c530a75c1e6a472b0eb9558310b518f0dfcd8860 de5b678ca4dcdfa83e322491d478d66df56c1986 342dcb6430d76ebd1ce229a02bad83f8881c9ac9
 127042 fail 50484ee133c2219a26fd98b39770187221b5e0bc c530a75c1e6a472b0eb9558310b518f0dfcd8860 de5b678ca4dcdfa83e322491d478d66df56c1986 61649709421a5a7c1a9fbb45cd8ff15a299bf6ee
 127059 [host=arndale-westfield]
 127046 pass 50484ee133c2219a26fd98b39770187221b5e0bc c530a75c1e6a472b0eb9558310b518f0dfcd8860 4f080070a9809bde857851e68a3aeff0c4b9b6a6 f04955e18502035121776f6e09d83ae5a36c773c
 127063 fail 50484ee133c2219a26fd98b39770187221b5e0bc c530a75c1e6a472b0eb9558310b518f0dfcd8860 de5b678ca4dcdfa83e322491d478d66df56c1986 342dcb6430d76ebd1ce229a02bad83f8881c9ac9
 127061 pass 50484ee133c2219a26fd98b39770187221b5e0bc c530a75c1e6a472b0eb9558310b518f0dfcd8860 4f080070a9809bde857851e68a3aeff0c4b9b6a6 f04955e18502035121776f6e09d83ae5a36c773c
 127073 fail 50484ee133c2219a26fd98b39770187221b5e0bc c530a75c1e6a472b0eb9558310b518f0dfcd8860 de5b678ca4dcdfa83e322491d478d66df56c1986 342dcb6430d76ebd1ce229a02bad83f8881c9ac9
 127077 fail 50484ee133c2219a26fd98b39770187221b5e0bc c530a75c1e6a472b0eb9558310b518f0dfcd8860 de5b678ca4dcdfa83e322491d478d66df56c1986 ae8b8bc599ce2c1fc42f00a30d5e35a48c3e970c
 127079 [host=cubietruck-braque]
 127082 pass 50484ee133c2219a26fd98b39770187221b5e0bc c530a75c1e6a472b0eb9558310b518f0dfcd8860 de5b678ca4dcdfa83e322491d478d66df56c1986 f04955e18502035121776f6e09d83ae5a36c773c
 127110 [host=arndale-lakeside]
 127085 fail 50484ee133c2219a26fd98b39770187221b5e0bc c530a75c1e6a472b0eb9558310b518f0dfcd8860 de5b678ca4dcdfa83e322491d478d66df56c1986 342dcb6430d76ebd1ce229a02bad83f8881c9ac9
 127112 [host=cubietruck-gleizes]
 127115 [host=arndale-lakeside]
 127088 [host=cubietruck-braque]
 127130 [host=arndale-bluewater]
 127091 fail 50484ee133c2219a26fd98b39770187221b5e0bc c530a75c1e6a472b0eb9558310b518f0dfcd8860 de5b678ca4dcdfa83e322491d478d66df56c1986 342dcb6430d76ebd1ce229a02bad83f8881c9ac9
 127096 pass 50484ee133c2219a26fd98b39770187221b5e0bc c530a75c1e6a472b0eb9558310b518f0dfcd8860 de5b678ca4dcdfa83e322491d478d66df56c1986 a903bf52335898adb2891b45c8baf2a70b912485
 127098 fail 50484ee133c2219a26fd98b39770187221b5e0bc c530a75c1e6a472b0eb9558310b518f0dfcd8860 de5b678ca4dcdfa83e322491d478d66df56c1986 342dcb6430d76ebd1ce229a02bad83f8881c9ac9
 127117 [host=cubietruck-gleizes]
 127100 fail 50484ee133c2219a26fd98b39770187221b5e0bc c530a75c1e6a472b0eb9558310b518f0dfcd8860 de5b678ca4dcdfa83e322491d478d66df56c1986 d704c2d6dc82522434bc358b6c19cbe420b3552d
 127144 fail 50484ee133c2219a26fd98b39770187221b5e0bc c530a75c1e6a472b0eb9558310b518f0dfcd8860 de5b678ca4dcdfa83e322491d478d66df56c1986 d704c2d6dc82522434bc358b6c19cbe420b3552d
 127106 pass 50484ee133c2219a26fd98b39770187221b5e0bc c530a75c1e6a472b0eb9558310b518f0dfcd8860 de5b678ca4dcdfa83e322491d478d66df56c1986 a903bf52335898adb2891b45c8baf2a70b912485
 127104 [host=arndale-lakeside]
 127109 fail 50484ee133c2219a26fd98b39770187221b5e0bc c530a75c1e6a472b0eb9558310b518f0dfcd8860 de5b678ca4dcdfa83e322491d478d66df56c1986 d704c2d6dc82522434bc358b6c19cbe420b3552d
 127118 fail 50484ee133c2219a26fd98b39770187221b5e0bc c530a75c1e6a472b0eb9558310b518f0dfcd8860 de5b678ca4dcdfa83e322491d478d66df56c1986 342dcb6430d76ebd1ce229a02bad83f8881c9ac9
 127131 [host=cubietruck-braque]
 127139 [host=arndale-bluewater]
 127126 [host=cubietruck-braque]
 127122 [host=cubietruck-gleizes]
 127136 fail 50484ee133c2219a26fd98b39770187221b5e0bc c530a75c1e6a472b0eb9558310b518f0dfcd8860 de5b678ca4dcdfa83e322491d478d66df56c1986 342dcb6430d76ebd1ce229a02bad83f8881c9ac9
 127140 [host=arndale-bluewater]
 127142 pass 50484ee133c2219a26fd98b39770187221b5e0bc c530a75c1e6a472b0eb9558310b518f0dfcd8860 de5b678ca4dcdfa83e322491d478d66df56c1986 a903bf52335898adb2891b45c8baf2a70b912485
Searching for interesting versions
 Result found: flight 126996 (pass), for basis pass
 Result found: flight 127052 (fail), for basis failure
 Repro found: flight 127061 (pass), for basis pass
 Repro found: flight 127063 (fail), for basis failure
 0 revisions at 50484ee133c2219a26fd98b39770187221b5e0bc c530a75c1e6a472b0eb9558310b518f0dfcd8860 de5b678ca4dcdfa83e322491d478d66df56c1986 a903bf52335898adb2891b45c8baf2a70b912485
No revisions left to test, checking graph state.
 Result found: flight 127096 (pass), for last pass
 Result found: flight 127100 (fail), for first failure
 Repro found: flight 127106 (pass), for last pass
 Repro found: flight 127109 (fail), for first failure
 Repro found: flight 127142 (pass), for last pass
 Repro found: flight 127144 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  d704c2d6dc82522434bc358b6c19cbe420b3552d
  Bug not present: a903bf52335898adb2891b45c8baf2a70b912485
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/127144/


  commit d704c2d6dc82522434bc358b6c19cbe420b3552d
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Mon Mar 19 11:19:52 2018 +0000
  
      xen/gnttab: Pass max_{grant,maptrack}_frames into grant_table_create()
      
      ... rather than setting the limits up after domain_create() has completed.
      
      This removes the common gnttab infrastructure for calculating the number of
      dom0 grant frames (as the common grant table code is not an appropriate place
      for it to live), opting instead to require the dom0 construction code to pass
      a sane value in via the configuration.
      
      In practice, this now means that there is never a partially constructed grant
      table for a reference-able domain.
      
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
      Reviewed-by: Julien Grall <julien.grall@arm.com>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/test-armhf-armhf-xl.xen-boot.{dot,ps,png,html,svg}.
----------------------------------------
127144: tolerable ALL FAIL

flight 127144 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/127144/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-armhf-armhf-xl           7 xen-boot                fail baseline untested


jobs:
 test-armhf-armhf-xl                                          fail    


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



--===============5277854433508560654==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5277854433508560654==--
