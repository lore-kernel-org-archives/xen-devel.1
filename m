From: osstest service owner <osstest-admin@xenproject.org>
Subject: [ovmf test] 120426: all pass - PUSHED
Date: Mon, 12 Mar 2018 11:51:07 +0000
Message-ID: <osstest-120426-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8409593392154285333=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=e8xk=gc=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1evLz2-0005xM-Vg
 for xen-devel@lists.xenproject.org; Mon, 12 Mar 2018 11:51:17 +0000
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

--===============8409593392154285333==
Content-Type: text/plain

flight 120426 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/120426/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7548947d040edfa915dbc05513b3eed074422daa
baseline version:
 ovmf                 7878f706e7eb8f29f66961d20eaa3e97dac22b00

Last test of basis   120373  2018-03-09 17:11:07 Z    2 days
Testing same since   120426  2018-03-11 01:05:07 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Brijesh Singh <brijesh.singh@amd.com>
  Laszlo Ersek <lersek@redhat.com>
  Marc-André Lureau <marcandre.lureau@redhat.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    


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

To xenbits.xen.org:/home/xen/git/osstest/ovmf.git
   7878f706e7..7548947d04  7548947d040edfa915dbc05513b3eed074422daa -> xen-tested-master


--===============8409593392154285333==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8409593392154285333==--
