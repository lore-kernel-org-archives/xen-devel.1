From: osstest service owner <osstest-admin@xenproject.org>
Subject: [linux-4.9 test] 119891: tolerable FAIL - PUSHED
Date: Fri, 23 Feb 2018 20:24:51 +0000
Message-ID: <osstest-119891-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5449323005343637869=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zfog=fr=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1epJty-0005qk-GK
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 20:25:06 +0000
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

--===============5449323005343637869==
Content-Type: text/plain

flight 119891 linux-4.9 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/119891/

Failures :-/ but no regressions.

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds     12 guest-start              fail REGR. vs. 119562

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-ws16-amd64 16 guest-localmigrate/x10 fail like 119487
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 119562
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 119562
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 119562
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 119562
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 119562
 test-amd64-amd64-xl-pvhv2-intel 12 guest-start                 fail never pass
 test-amd64-amd64-xl-pvhv2-amd 12 guest-start                  fail  never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-xsm      13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-win10-i386 10 windows-install         fail never pass
 test-amd64-amd64-xl-qemut-win10-i386 10 windows-install        fail never pass
 test-amd64-amd64-xl-qemuu-win10-i386 10 windows-install        fail never pass
 test-amd64-i386-xl-qemut-win10-i386 10 windows-install         fail never pass

version targeted for testing:
 linux                80c1c8322c331586a86e58d3f95026a1265ab396
baseline version:
 linux                3e598a7089eef1fe04d5b87cc154295302960e62

Last test of basis   119562  2018-02-18 09:51:11 Z    5 days
Testing same since   119891  2018-02-22 15:01:38 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Al Viro <viro@zeniv.linux.org.uk>
  alex chen <alex.chen@huawei.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Potapenko <glider@google.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andy Gross <andy.gross@linaro.org>
  Ard Biesheuvel <ard.biesheuvel@linaro.org>
  Arnd Bergmann <arnd@arndb.de>
  Bart Van Assche <bart.vanassche@wdc.com>
  Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
  Bjorn Andersson <bjorn.andersson@linaro.org>
  Boris Brezillon <boris.brezillon@bootlin.com>
  Chanwoo Choi <cw00.choi@samsung.com>
  Christian König <christian.koenig@amd.com>
  Corentin Labbe <clabbe.montjoie@gmail.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Dan Williams <dan.j.williams@intel.com>
  David Disseldorp <ddiss@suse.de>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  David Woodhouse <dwmw@amazon.co.uk>
  Dennis Dalessandro <dennis.dalessandro@intel.com>
  Dominik Brodowski <linux@dominikbrodowski.net>
  Doug Ledford <dledford@redhat.com>
  Eric Biggers <ebiggers@google.com>
  Ernesto A. Fernández <ernesto.mnd.fernandez@gmail.com>
  Eugene Syromiatnikov <esyr@redhat.com>
  Filippo Sironi <sironi@amazon.de>
  Gang He <ghe@suse.com>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Greg Kurz <groug@kaod.org>
  Gustavo A. R. Silva <garsilva@embeddedor.com>
  Harshad Shirwadkar <harshads@google.com>
  Heiko Carstens <heiko.carstens@de.ibm.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hugh Dickins <hughd@google.com>
  Hui Wang <hui.wang@canonical.com>
  Ingo Molnar <mingo@kernel.org>
  Jack Morgenstein <jackm@dev.mellanox.co.il>
  James Cameron <quozl@laptop.org>  # x86_64 OLPC NL3
  James Hogan <jhogan@kernel.org>
  Jan H. Schönherr <jschoenh@amazon.de>
  Jan-Marek Glogowski <glogow@fbihome.de>
  Jason Gunthorpe <jgg@mellanox.com>
  Jia Zhang <qianyue.zj@alibaba-inc.com>
  Johan Hovold <johan@kernel.org>
  Julia Lawall <Julia.Lawall@lip6.fr>
  Kailang Yang <kailang@realtek.com>
  Kalle Valo <kvalo@codeaurora.org>
  KarimAllah Ahmed <karahmed@amazon.de>
  Kees Cook <keescook@chromium.org>
  Kirill Marinushkin <k.marinushkin@gmail.com>
  Krzysztof Kozlowski <krzk@kernel.org>
  Larry Finger <Larry.Finger@lwfinger.net>
  Lassi Ylikojola <lassi.ylikojola@gmail.com>
  Leon Romanovsky <leon@kernel.org>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Liu Bo <bo.li.liu@oracle.com>
  Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin Schwidefsky <schwidefsky@de.ibm.com>
  Matthias Brugger <matthias.bgg@gmail.com>
  Mauro Carvalho Chehab <mchehab@s-opensource.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael S. Tsirkin <mst@redhat.com>
  Mike Marciniszyn <mike.marciniszyn@intel.com>
  Mike Snitzer <snitzer@redhat.com>
  Mikulas Patocka <mpatocka@redhat.com>
  Murali Karicheri <m-karicheri2@ti.com>
  MyungJoo Ham <myungjoo.ham@samsung.com>
  NeilBrown <neilb@suse.com>
  Nicholas Bellinger <nab@linux-iscsi.org>
  Nicholas Piggin <npiggin@gmail.com>
  Nicolas Pitre <nico@linaro.org>
  Nicolas Pitre <nicolas.pitre@linaro.org>
  Olof Johansson <olof@lixom.net>
  Paolo Bonzini <pbonzini@redhat.com>
  Patrice Chotard <patrice.chotard@st.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  piaojun <piaojun@huawei.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Robert Jarzmik <robert.jarzmik@free.fr>
  Rui Wang <rui.y.wang@intel.com>
  Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
  Shuah Khan <shuahkh@osg.samsung.com>
  Stefan Agner <stefan@agner.ch>
  Steffen Weber <steffen.weber@gmail.com>
  Stewart Smith <stewart@linux.vnet.ibm.com>
  Takashi Iwai <tiwai@suse.de>
  Theodore Ts'o <tytso@mit.edu>
  Thomas Gleixner <tglx@linutronix.de>
  Tobin C. Harding <me@tobin.cc>
  Viresh Kumar <viresh.kumar@linaro.org>
  Will Deacon <will.deacon@arm.com>
  Zhouyi Zhou <zhouzhouyi@gmail.com>

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
 build-amd64-rumprun                                          pass    
 build-i386-rumprun                                           pass    
 test-amd64-amd64-xl                                          pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64-xsm                pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64-xsm                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-xsm                pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-xsm                 pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
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
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-rumprun-amd64                               pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-i386-xl-qemut-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-i386-rumprun-i386                                 pass    
 test-amd64-amd64-xl-qemut-win10-i386                         fail    
 test-amd64-i386-xl-qemut-win10-i386                          fail    
 test-amd64-amd64-xl-qemuu-win10-i386                         fail    
 test-amd64-i386-xl-qemuu-win10-i386                          fail    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              fail    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
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


Pushing revision :

To xenbits.xen.org:/home/xen/git/linux-pvops.git
   3e598a7089ee..80c1c8322c33  80c1c8322c331586a86e58d3f95026a1265ab396 -> tested/linux-4.9


--===============5449323005343637869==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5449323005343637869==--
