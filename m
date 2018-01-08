From: osstest service owner <osstest-admin@xenproject.org>
Subject: [qemu-mainline test] 117699: regressions - FAIL
Date: Mon, 08 Jan 2018 18:48:02 +0000
Message-ID: <osstest-117699-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7982818074535009402=="
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

--===============7982818074535009402==
Content-Type: text/plain

flight 117699 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/117699/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt-vhd    <job status>                 broken  in 117633
 test-amd64-amd64-libvirt-xsm    <job status>                 broken  in 117633
 test-armhf-armhf-xl-credit2 16 guest-start/debian.repeat fail REGR. vs. 117335

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-libvirt-xsm 4 host-install(4) broken in 117633 pass in 117699
 test-amd64-amd64-libvirt-vhd 4 host-install(4) broken in 117633 pass in 117699
 test-armhf-armhf-xl-xsm 5 host-ping-check-native fail in 117667 pass in 117699
 test-armhf-armhf-xl-rtds     16 guest-start/debian.repeat  fail pass in 117633
 test-amd64-i386-xl-qemuu-win10-i386  8 host-ping-check-xen fail pass in 117667

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemuu-win10-i386 10 windows-install fail in 117667 never pass
 test-armhf-armhf-libvirt-xsm 14 saverestore-support-check    fail  like 117335
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 117335
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 117335
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 117335
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 117335
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 117335
 test-amd64-amd64-xl-pvhv2-intel 12 guest-start                 fail never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-xl-pvhv2-amd 12 guest-start                  fail  never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-xsm      13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemuu-win10-i386 10 windows-install        fail never pass

version targeted for testing:
 qemuu                281f327487c9c9b1599f93c589a408bbf4a651b8
baseline version:
 qemuu                eaefea537b476cb853e2edbdc68e969ec777e4bb

Last test of basis   117335  2017-12-19 12:50:51 Z   20 days
Testing same since   117534  2018-01-02 17:34:07 Z    6 days    5 attempts

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
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-armhf-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-xsm                pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-armhf-armhf-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-armhf-armhf-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                fail    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  fail    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-xl-qemuu-win10-i386                         fail    
 test-amd64-i386-xl-qemuu-win10-i386                          fail    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              fail    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-xl-vhd                                      pass    


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

broken-job test-amd64-amd64-libvirt-vhd broken
broken-job test-amd64-amd64-libvirt-xsm broken

Not pushing.

(No revision log; it would be 2401 lines long.)


--===============7982818074535009402==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7982818074535009402==--
