From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable-coverity test] 120732: regressions - ALL
	FAIL
Date: Wed, 14 Mar 2018 12:05:48 +0000
Message-ID: <osstest-120732-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6339885662167901025=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=2/qf=ge=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1ew5AP-0006nE-Tq
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 12:06:01 +0000
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

--===============6339885662167901025==
Content-Type: text/plain

flight 120732 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/120732/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 coverity-amd64                7 coverity-upload          fail REGR. vs. 119558

version targeted for testing:
 xen                  eef83fd2af0d4c78afec34c199c977fc97d8a0b3
baseline version:
 xen                  24470b99c1671dca531c2cf5747eda2f8892ecbc

Last test of basis   119558  2018-02-18 09:47:32 Z   24 days
Failing since        119806  2018-02-21 09:29:16 Z   21 days    7 attempts
Testing same since   120732  2018-03-14 10:31:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alan Robinson <Alan.Robinson@ts.fujitsu.com>
  Alexandru Isaila <aisaila@bitdefender.com>
  Andre Przywara <andre.przywara@linaro.org>
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
  Jim Fehlig <jfehlig@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <julien.grall@arm.com>
  Julien Grall <julien.grall@linaro.org>
  Kevin Tian <kevin.tian@intel.com>
  Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Martin Cerveny <martin@c-home.cz>
  Meng Xu <mengxu@cis.upenn.edu>
  Olaf Hering <olaf@aepfle.de>
  Paul Semel <semelpaul@gmail.com>
  Razvan Cojocaru <rcojocaru@bitdefender.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Sergey Dyasli <sergey.dyasli@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano@aporeto.com>
  Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
  Tamas K Lengyel <tamas@tklengyel.com>
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

(No revision log; it would be 2702 lines long.)


--===============6339885662167901025==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6339885662167901025==--
