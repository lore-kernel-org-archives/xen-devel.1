From: osstest service owner <osstest-admin@xenproject.org>
Subject: [ovmf test] 120230: all pass - PUSHED
Date: Mon, 05 Mar 2018 03:38:00 +0000
Message-ID: <osstest-120230-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6066291569889974348=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=h1ef=f3=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1esgx5-00028a-1I
 for xen-devel@lists.xenproject.org; Mon, 05 Mar 2018 03:38:15 +0000
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

--===============6066291569889974348==
Content-Type: text/plain

flight 120230 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/120230/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b77e1a240e0aa222b249817eb47149febf142eeb
baseline version:
 ovmf                 2157bc9c8b8be30ada11fe2e64454157d3ae528f

Last test of basis   120113  2018-03-01 02:36:47 Z    4 days
Failing since        120165  2018-03-02 17:19:56 Z    2 days    2 attempts
Testing same since   120230  2018-03-04 12:11:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ard.biesheuvel@linaro.org>
  Bob Feng <bob.c.feng@intel.com>
  BobCF <bob.c.feng@intel.com>
  Dandan Bi <dandan.bi@intel.com>
  Felix Polyudov <felixp@ami.com>
  Feng, Bob C <bob.c.feng@intel.com>
  Feng, YunhuaX </o=Intel/ou=Exchange Administrative Group (FYDIBOHF23SPDLT)/cn=Recipients/cn=Feng, YunhuaX4e1>
  Fu Siyuan <siyuan.fu@intel.com>
  Hao Wu <hao.a.wu@intel.com>
  Jiaxin Wu <jiaxin.wu@intel.com>
  Jiewen Yao <jiewen.yao@intel.com>
  Laszlo Ersek <lersek@redhat.com>
  Liming Gao <liming.gao@intel.com>
  Marc-André Lureau <marcandre.lureau@redhat.com>
  Ruiyu Ni <ruiyu.ni@intel.com>
  Star Zeng <star.zeng@intel.com>
  Wu Jiaxin <jiaxin.wu@intel.com>
  Yonghong Zhu <yonghong.zhu@intel.com>
  Yunhua Feng <yunhuax.feng@intel.com>

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
   2157bc9c8b..b77e1a240e  b77e1a240e0aa222b249817eb47149febf142eeb -> xen-tested-master


--===============6066291569889974348==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6066291569889974348==--
