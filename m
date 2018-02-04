From: osstest service owner <osstest-admin@xenproject.org>
Subject: [linux-4.9 test] 118552: tolerable FAIL - PUSHED
Date: Sun, 04 Feb 2018 10:10:41 +0000
Message-ID: <osstest-118552-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8656537178750941556=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zcqd=e6=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1eiHGE-00047w-OR
 for xen-devel@lists.xenproject.org; Sun, 04 Feb 2018 10:10:58 +0000
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

--===============8656537178750941556==
Content-Type: text/plain

flight 118552 linux-4.9 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/118552/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 118520
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 118520
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 118520
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 118520
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 118520
 test-amd64-amd64-xl-pvhv2-intel 12 guest-start                 fail never pass
 test-amd64-amd64-xl-pvhv2-amd 12 guest-start                  fail  never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-xsm      13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemuu-win10-i386 10 windows-install        fail never pass
 test-amd64-amd64-xl-qemut-win10-i386 10 windows-install        fail never pass
 test-amd64-i386-xl-qemuu-win10-i386 10 windows-install         fail never pass
 test-amd64-i386-xl-qemut-win10-i386 10 windows-install         fail never pass

version targeted for testing:
 linux                331b057d4f3ccf2290e6e651b5728db81e9249c6
baseline version:
 linux                6c6f924f9c6294944ee6efb1bbd8cdb853582e50

Last test of basis   118520  2018-02-01 22:20:45 Z    2 days
Testing same since   118552  2018-02-03 16:18:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaron Armstrong Skomra <aaron.skomra@wacom.com>
  Aaron Armstrong Skomra <skomra@gmail.com>
  Aaron Brown <aaron.f.brown@intel.com>
  Abhishek Goel <huntbag@linux.vnet.ibm.com>
  Alban Bedel <albeu@free.fr>
  Alex Deucher <alexander.deucher@amd.com>
  Alexandre TORGUE <alexandre.torgue@st.com>
  Amit Pundir <amit.pundir@linaro.org>
  Andrew Elble <aweits@rit.edu>
  Andrew Morton <akpm@linux-foundation.org>
  Andrey Gusakov <andrey.gusakov@cogentembedded.com>
  Andrzej Hajda <a.hajda@samsung.com>
  Anna Schumaker <Anna.Schumaker@Netapp.com>
  Ard Biesheuvel <ard.biesheuvel@linaro.org>
  Benjamin Herrenschmidt <benh@kernel.crashing.org>
  Boris Brezillon <boris.brezillon@free-electrons.com>
  Carlos Maiolino <cmaiolino@redhat.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Christian König <christian.koenig@amd.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
  Colin Ian King <colin.king@canonical.com>
  Darrick J. Wong <darrick.wong@oracle.com>
  Dave Chinner <dchinner@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dmitry Eremin <Dmitry.Eremin@intel.com>
  Dmitry Vyukov <dvyukov@google.com>
  Doug Ledford <dledford@redhat.com>
  Eduardo Otubo <otubo@redhat.com>
  Emmanuel Grumbach <emmanuel.grumbach@intel.com>
  Eric Anholt <eric@anholt.net>
  Fabio Estevam <fabio.estevam@nxp.com>
  Felipe Balbi <felipe.balbi@linux.intel.com>
  Felix Kuehling <Felix.Kuehling@amd.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Fugang Duan <fugang.duan@nxp.com>
  Gaurav Kohli <gkohli@codeaurora.org>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Guilherme G. Piccoli <gpiccoli@linux.vnet.ibm.com>
  Gustavo A. R. Silva <garsilva@embeddedor.com>
  Hans de Goede <hdegoede@redhat.com>
  Hauke Mehrtens <hauke@hauke-m.de>
  Hemant Kumar <hemantk@codeaurora.org>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hiroyuki Yamamoto <hyamamo@allied-telesis.co.jp>
  Icenowy Zheng <icenowy@aosc.io>
  J. Bruce Fields <bfields@redhat.com>
  James Hogan <jhogan@kernel.org>
  Jan Kara <jack@suse.cz>
  Jeff Kirsher <jeffrey.t.kirsher@intel.com>
  Jeff Layton <jlayton@redhat.com>
  Jens Axboe <axboe@kernel.dk>
  Jesse Chan <jc@linux.com>
  Jia-Ju Bai <baijiaju1990@gmail.com>
  Jiri Kosina <jkosina@suse.cz>
  Joel Stanley <joel@jms.id.au>
  Johan Hovold <johan@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  Jon Mason <jon.mason@broadcom.com>
  Josef Bacik <jbacik@fb.com>
  Juergen Gross <jgross@suse.com>
  Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
  Larry Finger <Larry.Finger@lwfinger.net>
  Leon Romanovsky <leon@kernel.org>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Liran Alon <liran.alon@oracle.com>
  Lubomir Rintel <lkundrak@v3.sk>
  Luca Coelho <luciano.coelho@intel.com>
  Lyude Paul <lyude@redhat.com>
  Mark Brown <broonie@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Masahiro Yamada <yamada.masahiro@socionext.com>
  Mauro Carvalho Chehab <mchehab@s-opensource.com>
  Max Gurtovoy <maxg@mellanox.com>
  Max Schulze <max.schulze@posteo.de>
  Michael Lyle <mlyle@lyle.org>
  Michal Hocko <mhocko@suse.com>
  Nikita Leshenko <nikita.leshchenko@oracle.com>
  Oded Gabbay <oded.gabbay@gmail.com>
  OKAMOTO Yoshiaki <yokamoto@allied-telesis.co.jp>
  Oliver Neukum <oneukum@suse.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Patrice Chotard <patrice.chotard@st.com>
  Pedro Fonseca <pfonseca@cs.washington.edu>
  Philipp Zabel <p.zabel@pengutronix.de>
  Pravin B Shelar <pshelar@ovn.org>
  Radim Krčmář <rkrcmar@redhat.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Randy Dunlap <rdunlap@infradead.org>
  Robert Lippert <rlippert@google.com>
  Robert Lippert <roblip@gmail.com>
  Sasha Levin <alexander.levin@microsoft.com>
  Sebastian Reichel <sebastian.reichel@collabora.co.uk>
  shaoyun liu <shaoyun.liu@amd.com>
  shaoyunl <Shaoyun.Liu@amd.com>
  Shuah Khan <shuahkh@osg.samsung.com>
  Stefan Agner <stefan@agner.ch>
  Stefan Schake <stschake@gmail.com>
  Stefan Wahren <stefan.wahren@i2se.com>
  Stephan Mueller <smueller@chronox.de>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Thomas Meyer <thomas@m3y3r.de>
  Tomi Valkeinen <tomi.valkeinen@ti.com>
  Trond Myklebust <trond.myklebust@primarydata.com>
  Vasily Averin <vvs@virtuozzo.com>
  Viresh Kumar <viresh.kumar@linaro.org>
  Wanpeng Li <kernellwp@gmail.com>
  Wanpeng Li <wanpeng.li@hotmail.com>
  Yisheng Xie <xieyisheng1@huawei.com>
  Yoshiaki Okamoto <yokamoto@allied-telesis.co.jp>
  zhangliping <zhangliping02@baidu.com>

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
 test-armhf-armhf-xl-rtds                                     pass    
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
   6c6f924f9c62..331b057d4f3c  331b057d4f3ccf2290e6e651b5728db81e9249c6 -> tested/linux-4.9


--===============8656537178750941556==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8656537178750941556==--
