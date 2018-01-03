From: osstest service owner <osstest-admin@xenproject.org>
Subject: [linux-3.18 test] 117581: trouble:
	blocked/broken/fail/pass
Date: Wed, 03 Jan 2018 17:57:47 +0000
Message-ID: <osstest-117581-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6136215123966733413=="
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

--===============6136215123966733413==
Content-Type: text/plain

flight 117581 linux-3.18 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/117581/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemut-debianhvm-amd64    <job status>               broken
 test-amd64-amd64-rumprun-amd64    <job status>                 broken
 test-armhf-armhf-xl-rtds        <job status>                 broken
 test-amd64-i386-xl              <job status>                 broken
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm    <job status>      broken
 test-amd64-i386-rumprun-i386    <job status>                 broken
 test-amd64-i386-xl            4 host-install(4)        broken REGR. vs. 117375
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 4 host-install(4) broken REGR. vs. 117375
 test-amd64-amd64-rumprun-amd64  4 host-install(4)      broken REGR. vs. 117375
 test-amd64-i386-rumprun-i386  4 host-install(4)        broken REGR. vs. 117375
 test-amd64-amd64-xl-qemut-debianhvm-amd64 4 host-install(4) broken REGR. vs. 117375

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds      4 host-install(4)        broken REGR. vs. 117375

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 117375
 test-armhf-armhf-libvirt-xsm 14 saverestore-support-check    fail  like 117375
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 117375
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 117375
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 117375
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 117375
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 117375
 test-amd64-amd64-xl-pvhv2-intel 12 guest-start                 fail never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-xl-pvhv2-amd 12 guest-start                  fail  never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 build-arm64-pvops             6 kernel-build                 fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-xsm      13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-armhf-armhf-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemut-win10-i386 10 windows-install         fail never pass
 test-amd64-amd64-xl-qemuu-win10-i386 10 windows-install        fail never pass
 test-amd64-amd64-xl-qemut-win10-i386 10 windows-install        fail never pass
 test-amd64-i386-xl-qemuu-win10-i386 10 windows-install         fail never pass

version targeted for testing:
 linux                788ccf7552c82179135470473d9035f7c8b0b188
baseline version:
 linux                1e6e21c74c7c866db0abdfc452937724c3d80bdc

Last test of basis   117375  2017-12-20 09:38:49 Z   14 days
Failing since        117563  2018-01-02 17:39:00 Z    1 days    2 attempts
Testing same since   117581  2018-01-02 22:44:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaron Brown <aaron.f.brown@intel.com
  Adam Wallis <awallis@codeaurora.org>
  Alexander Duyck <alexander.h.duyck@intel.com>
  Alexey Khoroshilov <khoroshilov@ispras.ru>
  Andrew Bowers <andrewx.bowers@intel.com>
  Ard Biesheuvel <ard.biesheuvel@linaro.org>
  Arnd Bergmann <arnd@arndb.de>
  Bjorn Helgaas <bhelgaas@google.com>
  Bjørn Mork <bjorn@mork.no>
  Brian King <brking@linux.vnet.ibm.com>
  Christian Lamparter <chunkeey@gmail.com>
  Christoph Paasch <cpaasch@apple.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chunyan Zhang <chunyan.zhang@spreadtrum.com>
  Dan Murphy <dmurphy@ti.com>
  Daniel Thompson <daniel.thompson@linaro.org>
  Daniele Palmas <dnlplm@gmail.com>
  David Daney <david.daney@cavium.com>
  David S. Miller <davem@davemloft.net>
  Derek Basehore <dbasehore@chromium.org>
  Dick Kennedy <dick.kennedy@broadcom.com>
  Dmitri Epshtein <dima@marvell.com>
  Dmitry Fleytman <dmitry.fleytman@gmail.com>
  Dmitry Fleytman Dmitry Fleytman <dmitry.fleytman@gmail.com>
  Dongdong Liu <liudongdong3@huawei.com>
  Eric Dumazet <edumazet@google.com>
  Eyal Reizer <eyalr@ti.com>
  Felipe Balbi <felipe.balbi@linux.intel.com>
  Gabriele Paoloni <gabriele.paoloni@huawei.com>
  Gao Feng <fgao@ikuai8.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gregory CLEMENT <gregory.clement@free-electrons.com>
  Guenter Roeck <linux@roeck-us.net>
  Gustavo A. R. Silva <garsilva@embeddedor.com>
  Hayes Wang <hayeswang@realtek.com>
  hayeswang <hayeswang@realtek.com>
  Helge Deller <deller@gmx.de>
  Herbert Xu <herbert@gondor.apana.org.au>
  Jacob Keller <jacob.e.keller@intel.com>
  James Smart <james.smart@broadcom.com>
  Jan Glauber <jglauber@cavium.com>
  Jaroslav Kysela <perex@perex.cz>
  Jeff Kirsher <jeffrey.t.kirsher@intel.com>
  Jeffy Chen <jeffy.chen@rock-chips.com>
  Jerry Tang <jtang@suse.com>
  Jing Xia <jing.xia@spreadtrum.com>
  Jiri Kosina <jkosina@suse.cz>
  Johan Hovold <johan@kernel.org>
  Julian Wiedmann <jwi@linux.vnet.ibm.com>
  Kees Cook <keescook@chromium.org>
  Kevin Cernekee <cernekee@chromium.org>
  Krishneil Singh <krishneil.k.singh@intel.com>
  Lee Jones <lee.jones@linaro.org>
  Linus Torvalds <torvalds@linux-foundation.org>
  Liping Zhang <zlpnobody@gmail.com>
  Maarten Lankhorst <dev@mblankhorst.nl>
  Mark Brown <broonie@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Mathias Nyman <mathias.nyman@linux.intel.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michal Nazarewicz <mina86@mina86.com>
  Mohamed Ghannam <simo.ghannam@gmail.com>
  Oliver Neukum <oneukum@suse.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Bonzini <pbonzini@redhat.com>
  Peter Stein <peter@stuntstein.dk>
  Peter Ujfalusi <peter.ujfalusi@ti.com>
  PJ Waskiewicz <peter.waskiewicz.jr@intel.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
  Reizer, Eyal <eyalr@ti.com>
  Rob Herring <robh@kernel.org>
  Roger Quadros <rogerq@ti.com>
  Russell King <rmk+kernel@armlinux.org.uk>
  Sasha Levin <alexander.levin@verizon.com>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  Sebastian Reichel <sre@kernel.org>
  Sebastian Sjoholm <ssjoholm@mac.com>
  Steve Capper <steve.capper@arm.com>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Stuart Hayes <stuart.w.hayes@gmail.com>
  Takashi Iwai <tiwai@suse.de>
  Thierry Reding <thierry.reding@gmail.com>
  Thomas Gleixner <tglx@linutronix.de>
  Tobias Jordan <Tobias.Jordan@elektrobit.com>
  Tonghao Zhang <xiangxia.m.yue@gmail.com>
  Tonghao Zhang <zhangtonghao@didichuxing.com>
  Tony Lindgren <tony@atomide.com>
  Ursula Braun <ubraun@linux.vnet.ibm.com>
  Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
  Varun Prakash <varun@chelsio.com>
  Wanpeng Li <wanpeng.li@hotmail.com>
  Will Deacon <will.deacon@arm.com>
  Xin Long <lucien.xin@gmail.com>
  Yelena Krivosheev <yelena@marvell.com>

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
 build-arm64-pvops                                            fail    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 build-amd64-rumprun                                          pass    
 build-i386-rumprun                                           pass    
 test-amd64-amd64-xl                                          pass    
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           broken  
 test-amd64-amd64-xl-qemut-debianhvm-amd64-xsm                pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64-xsm                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           broken  
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-xsm                pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-xsm                 pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-armhf-armhf-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      blocked 
 test-armhf-armhf-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                fail    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    broken  
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-rumprun-amd64                               broken  
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
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     blocked 
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-i386-rumprun-i386                                 broken  
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
 test-armhf-armhf-xl-rtds                                     broken  
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

broken-job test-amd64-amd64-xl-qemut-debianhvm-amd64 broken
broken-job test-amd64-amd64-rumprun-amd64 broken
broken-job test-armhf-armhf-xl-rtds broken
broken-job test-amd64-i386-xl broken
broken-job test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm broken
broken-job test-amd64-i386-rumprun-i386 broken
broken-step test-armhf-armhf-xl-rtds host-install(4)
broken-step test-amd64-i386-xl host-install(4)
broken-step test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm host-install(4)
broken-step test-amd64-amd64-rumprun-amd64 host-install(4)
broken-step test-amd64-i386-rumprun-i386 host-install(4)
broken-step test-amd64-amd64-xl-qemut-debianhvm-amd64 host-install(4)

Not pushing.

(No revision log; it would be 1839 lines long.)


--===============6136215123966733413==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6136215123966733413==--
