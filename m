From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable-coverity test] 120008: regressions - ALL
	FAIL
Date: Sun, 25 Feb 2018 10:55:01 +0000
Message-ID: <osstest-120008-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5179774701123382592=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=/c0b=ft=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1eptxb-0004Ld-0B
 for xen-devel@lists.xenproject.org; Sun, 25 Feb 2018 10:55:15 +0000
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

--===============5179774701123382592==
Content-Type: text/plain

flight 120008 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/120008/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 coverity-amd64                7 coverity-upload          fail REGR. vs. 119558

version targeted for testing:
 xen                  a823a5280f25ad19a751dd9a41044f556471e61a
baseline version:
 xen                  24470b99c1671dca531c2cf5747eda2f8892ecbc

Last test of basis   119558  2018-02-18 09:47:32 Z    7 days
Failing since        119806  2018-02-21 09:29:16 Z    4 days    2 attempts
Testing same since   120008  2018-02-25 09:34:47 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alan Robinson <Alan.Robinson@ts.fujitsu.com>
  Alexandru Isaila <aisaila@bitdefender.com>
  Andrew Cooper <andrew.cooper3@citix.com>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Brian Woods <brian.woods@amd.com>
  Dario Faggioli <dfaggioli@suse.com>
  Doug Goldstein <cardoe@cardoe.com>
  George Dunlap <george.dunlap@citrix.com>
  Haozhong Zhang <haozhong.zhang@intel.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <julien.grall@arm.com>
  Kevin Tian <kevin.tian@intel.com>
  Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
  Olaf Hering <olaf@aepfle.de>
  Razvan Cojocaru <rcojocaru@bitdefender.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Sergey Dyasli <sergey.dyasli@citrix.com>
  Wei Liu <wei.liu2@citrix.com>

jobs:
 coverity-amd64                                               fail    


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


Not pushing.

(No revision log; it would be 409 lines long.)


--===============5179774701123382592==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5179774701123382592==--
