From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable-smoke test] 117565: tolerable all pass -
	PUSHED
Date: Tue, 02 Jan 2018 20:13:09 +0000
Message-ID: <osstest-117565-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6410136658549550102=="
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

--===============6410136658549550102==
Content-Type: text/plain

flight 117565 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/117565/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  971d299c04df379734d10c44d637433e9e564f36
baseline version:
 xen                  1b33150fe06ab9217f7f12b01bc5e607f4f55658

Last test of basis   117339  2017-12-19 15:02:59 Z   14 days
Failing since        117372  2017-12-20 09:43:28 Z   13 days    2 attempts
Testing same since   117565  2018-01-02 18:02:18 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adrian Hunter <adrian.hunter@intel.com>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Andrew Morton <akpm@linux-foundation.org>
  David Woodhouse <David.Woodhouse@intel.com>
  Jan Beulich <jbeulich@suse.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Michel Lespinasse <walken@google.com>
  Peter Zijlstra <a.p.zijlstra@chello.nl>
  Praveen Kumar <kpraveen.lkml@gmail.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stephen Rothwell <sfr@canb.auug.org.au>
  Tim Deegan <tim@xen.org>
  Wolfram Strepp <wstrepp@gmx.de>
  Yi Sun <yi.y.sun@linux.intel.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386                     pass    
 test-amd64-amd64-libvirt                                     pass    


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


Pushing revision :

To xenbits.xen.org:/home/xen/git/xen.git
   1b33150fe0..971d299c04  971d299c04df379734d10c44d637433e9e564f36 -> smoke


--===============6410136658549550102==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6410136658549550102==--
