From: osstest service owner <osstest-admin@xenproject.org>
Subject: [qemu-mainline test] 117534: trouble:
	blocked/broken/pass
Date: Wed, 03 Jan 2018 05:36:37 +0000
Message-ID: <osstest-117534-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1570202908778057994=="
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

--===============1570202908778057994==
Content-Type: text/plain

flight 117534 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/117534/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-xsm                 <job status>                 broken
 build-armhf-xsm                 <job status>                 broken
 build-armhf-pvops               <job status>                 broken
 build-i386-pvops                <job status>                 broken
 build-armhf                     <job status>                 broken
 build-amd64                     <job status>                 broken
 build-amd64-xsm               4 host-install(4)        broken REGR. vs. 117335
 build-i386-pvops              4 host-install(4)        broken REGR. vs. 117335
 build-armhf                   4 host-install(4)        broken REGR. vs. 117335
 build-amd64                   4 host-install(4)        broken REGR. vs. 117335
 build-armhf-pvops             4 host-install(4)        broken REGR. vs. 117335
 build-armhf-xsm               4 host-install(4)        broken REGR. vs. 117335

Tests which did not succeed, but are not blocking:
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-amd64-pvgrub  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qcow2     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-raw        1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-win10-i386  1 build-check(1)             blocked n/a
 test-amd64-amd64-pygrub       1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-xl-rtds      1 build-check(1)               blocked  n/a
 test-amd64-i386-qemuu-rhel6hvm-intel  1 build-check(1)             blocked n/a
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)              blocked n/a
 test-armhf-armhf-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-pair         1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ws16-amd64  1 build-check(1)             blocked n/a
 test-armhf-armhf-xl-cubietruck  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-intel  1 build-check(1)              blocked n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-arndale   1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-intel  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-xsm        1 build-check(1)               blocked  n/a
 test-amd64-i386-xl            1 build-check(1)               blocked  n/a
 test-amd64-i386-qemuu-rhel6hvm-amd  1 build-check(1)               blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-freebsd10-i386  1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-win10-i386  1 build-check(1)              blocked n/a
 test-amd64-amd64-xl-credit2   1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-pair          1 build-check(1)               blocked  n/a
 test-amd64-amd64-i386-pvgrub  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-xsm  1 build-check(1)    blocked n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64-xsm  1 build-check(1)     blocked n/a
 test-amd64-amd64-xl-qemuu-win7-amd64  1 build-check(1)             blocked n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-amd64  1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-amd64-xl-pvhv2-amd  1 build-check(1)               blocked  n/a
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass

version targeted for testing:
 qemuu                281f327487c9c9b1599f93c589a408bbf4a651b8
baseline version:
 qemuu                eaefea537b476cb853e2edbdc68e969ec777e4bb

Last test of basis   117335  2017-12-19 12:50:51 Z   14 days
Testing same since   117534  2018-01-02 17:34:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alex Bennée <alex.bennee@linaro.org>
  Aurelien Jarno <aurelien@aurel32.net>
  Chen Hanxiao <chenhanxiao@gmail.com>
  Cornelia Huck <cohuck@redhat.com>
  Daniel Henrique Barboza <danielhb@linux.vnet.ibm.com>
  Daniel P. Berrange <berrange@redhat.com>
  David Hildenbrand <david@redhat.com>
  Doug Gale <doug16k@gmail.com>
  Dr. David Alan Gilbert <dgilbert@redhat.com>
  Evgeny Yakovlev <eyakovlev@virtuozzo.com>
  Fam Zheng <famz@redhat.com>
  Jeff Cody <jcody@redhat.com>
  John Snow <jsnow@redhat.com>
  Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
  Laurent Vivier <laurent@vivier.eu>
  linzhecheng <linzhecheng@huawei.com>
  Mao Zhongyi <maozy.fnst@cn.fujitsu.com>
  Marc-André Lureau <marcandre.lureau@redhat.com>
  Mark Kanda <mark.kanda@oracle.com>
  Markus Armbruster <armbru@redhat.com>
  Namhyung Kim <namhyung@gmail.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Peter Lieven <pl@kamp.de>
  Peter Maydell <peter.maydell@linaro.org>
  Peter Xu <peterx@redhat.com>
  Philippe Mathieu-Daudé <f4bug@amsat.org>
  Richard Henderson <rth@twiddle.net>
  Roman Kagan <rkagan@virtuozzo.com>
  Samuel Thibault <samuel.thibault@ens-lyon.org>
  Stefan Berger <stefanb@linux.vnet.ibm.com>
  Stefan Hajnoczi <stefanha@redhat.com>
  Stefan Weil <sw@weilnetz.de>
  Thomas Huth <thuth@redhat.com>
  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
  Yang Zhong <yang.zhong@intel.com>

jobs:
 build-amd64-xsm                                              broken  
 build-arm64-xsm                                              pass    
 build-armhf-xsm                                              broken  
 build-i386-xsm                                               pass    
 build-amd64                                                  broken  
 build-arm64                                                  pass    
 build-armhf                                                  broken  
 build-i386                                                   pass    
 build-amd64-libvirt                                          blocked 
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            broken  
 build-i386-pvops                                             broken  
 test-amd64-amd64-xl                                          blocked 
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          blocked 
 test-amd64-i386-xl                                           blocked 
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           blocked 
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-xsm                blocked 
 test-amd64-i386-xl-qemuu-debianhvm-amd64-xsm                 blocked 
 test-amd64-amd64-libvirt-xsm                                 blocked 
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-armhf-armhf-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  blocked 
 test-amd64-amd64-xl-xsm                                      blocked 
 test-arm64-arm64-xl-xsm                                      pass    
 test-armhf-armhf-xl-xsm                                      blocked 
 test-amd64-i386-xl-xsm                                       blocked 
 test-amd64-amd64-qemuu-nested-amd                            blocked 
 test-amd64-amd64-xl-pvhv2-amd                                blocked 
 test-amd64-i386-qemuu-rhel6hvm-amd                           blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    blocked 
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     blocked 
 test-amd64-i386-freebsd10-amd64                              blocked 
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         blocked 
 test-amd64-i386-xl-qemuu-ovmf-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-win7-amd64                         blocked 
 test-amd64-i386-xl-qemuu-win7-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-ws16-amd64                         blocked 
 test-amd64-i386-xl-qemuu-ws16-amd64                          blocked 
 test-armhf-armhf-xl-arndale                                  blocked 
 test-amd64-amd64-xl-credit2                                  blocked 
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  blocked 
 test-armhf-armhf-xl-cubietruck                               blocked 
 test-amd64-i386-freebsd10-i386                               blocked 
 test-amd64-amd64-xl-qemuu-win10-i386                         blocked 
 test-amd64-i386-xl-qemuu-win10-i386                          blocked 
 test-amd64-amd64-qemuu-nested-intel                          blocked 
 test-amd64-amd64-xl-pvhv2-intel                              blocked 
 test-amd64-i386-qemuu-rhel6hvm-intel                         blocked 
 test-amd64-amd64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      blocked 
 test-amd64-amd64-xl-multivcpu                                blocked 
 test-armhf-armhf-xl-multivcpu                                blocked 
 test-amd64-amd64-pair                                        blocked 
 test-amd64-i386-pair                                         blocked 
 test-amd64-amd64-libvirt-pair                                blocked 
 test-amd64-i386-libvirt-pair                                 blocked 
 test-amd64-amd64-amd64-pvgrub                                blocked 
 test-amd64-amd64-i386-pvgrub                                 blocked 
 test-amd64-amd64-pygrub                                      blocked 
 test-amd64-amd64-xl-qcow2                                    blocked 
 test-armhf-armhf-libvirt-raw                                 blocked 
 test-amd64-i386-xl-raw                                       blocked 
 test-amd64-amd64-xl-rtds                                     blocked 
 test-armhf-armhf-xl-rtds                                     blocked 
 test-amd64-amd64-libvirt-vhd                                 blocked 
 test-armhf-armhf-xl-vhd                                      blocked 


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

broken-job build-amd64-xsm broken
broken-job build-armhf-xsm broken
broken-job build-armhf-pvops broken
broken-job build-i386-pvops broken
broken-job build-armhf broken
broken-job build-amd64 broken
broken-step build-amd64-xsm host-install(4)
broken-step build-i386-pvops host-install(4)
broken-step build-armhf host-install(4)
broken-step build-amd64 host-install(4)
broken-step build-armhf-pvops host-install(4)
broken-step build-armhf-xsm host-install(4)

Not pushing.

(No revision log; it would be 2401 lines long.)


--===============1570202908778057994==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1570202908778057994==--
