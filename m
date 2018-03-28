From: osstest service owner <osstest-admin@xenproject.org>
Subject: [linux-3.18 test] 121303: regressions - FAIL
Date: Wed, 28 Mar 2018 02:30:57 +0000
Message-ID: <osstest-121303-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9151602895835365640=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=u9ej=gs=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1f10rf-0006mc-8c
 for xen-devel@lists.xenproject.org; Wed, 28 Mar 2018 02:31:03 +0000
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

--===============9151602895835365640==
Content-Type: text/plain

flight 121303 linux-3.18 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/121303/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf-libvirt             <job status>                 broken  in 121268
 build-armhf-libvirt           6 libvirt-build            fail REGR. vs. 121099
 build-armhf-libvirt          5 host-build-prep fail in 121268 REGR. vs. 121099

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qemut-debianhvm-amd64-xsm 16 guest-localmigrate/x10 fail pass in 121268

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 121099
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 121099
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 121099
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 121099
 test-amd64-amd64-xl-pvhv2-intel 12 guest-start                 fail never pass
 test-amd64-amd64-xl-pvhv2-amd 12 guest-start                  fail  never pass
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 build-arm64-pvops             6 kernel-build                 fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-xsm      13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-win10-i386 10 windows-install         fail never pass
 test-amd64-i386-xl-qemut-win10-i386 10 windows-install         fail never pass
 test-amd64-amd64-xl-qemuu-win10-i386 10 windows-install        fail never pass
 test-amd64-amd64-xl-qemut-win10-i386 10 windows-install        fail never pass

version targeted for testing:
 linux                9764536dc592144beee43c987fef45d2e91ca55c
baseline version:
 linux                44ec71c0cd728e8cbd346e135eef9b43b03654ab

Last test of basis   121099  2018-03-23 23:27:33 Z    4 days
Testing same since   121268  2018-03-25 10:19:05 Z    2 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaron Brown <aaron.f.brown@intel.com>
  Alexandre Belloni <alexandre.belloni@free-electrons.com>
  Alexey Kardashevskiy <aik@ozlabs.ru>
  Alexey Khoroshilov <khoroshilov@ispras.ru>
  Anthony Brandon <anthony@amarulasolutions.com>
  Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
  Bernd Faust <berndfaust@gmail.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Corey Minyard <cminyard@mvista.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Drake <drake@endlessm.com>
  Darren Hart (VMware) <dvhart@infradead.org>
  David Ahern <dsa@cumulusnetworks.com>
  David Gibson <david@gibson.dropbear.id.au>
  David S. Miller <davem@davemloft.net>
  Dick Kennedy <dick.kennedy@broadcom.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Doug Ledford <dledford@redhat.com>
  Edgar Cherkasov <echerkasov@dev.rtsoft.ru>
  Emmanuel Grumbach <emmanuel.grumbach@intel.com>
  Erez Shitrit <erezsh@mellanox.com>
  Eric Dumazet <edumazet@google.com>
  Feras Daoud <ferasda@mellanox.com>
  Filipe Manana <fdmanana@suse.com>
  Finn Thain <fthain@telegraphics.com.au>
  Florian Fainelli <f.fainelli@gmail.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Hannes Frederic Sowa <hannes@stressinduktion.org>
  Hans de Goede <hdegoede@redhat.com>
  Jacob Keller <jacob.e.keller@intel.com>
  James Smart <james.smart@broadcom.com>
  James Smart <jsmart2021@gmail.com>
  Jasmin J <jasmin@anw.at>
  Jasmin jessich <jasmin@anw.at>
  Jason Gunthorpe <jgg@mellanox.com>
  Jeff Kirsher <jeffrey.t.kirsher@intel.com>
  Johannes Berg <johannes.berg@intel.com>
  Kalle Valo <kvalo@codeaurora.org>
  Kalle Valo <kvalo@qca.qualcomm.com>
  Keerthy <j-keerthy@ti.com>
  Kishon Vijay Abraham I <kishon@ti.com>
  Lee Jones <lee.jones@linaro.org>
  Leon Romanovsky <leon@kernel.org>
  Leon Romanovsky <leonro@mellanox.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Luca Coelho <luciano.coelho@intel.com>
  Maksim Salau <maksim.salau@gmail.com>
  Marc Zyngier <marc.zyngier@arm.com>
  Marek Vasut <marex@denx.de>
  Mark Brown <broonie@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin Kepplinger <martin.kepplinger@ginzinger.com>
  Mauro Carvalho Chehab <mchehab@s-opensource.com>
  Michael Brunner <Michael.Brunner@kontron.com>
  Michael Trimarchi <michael@amarulasolutions.com>
  Mikhail Paulyshka <me@mixaill.tk>
  Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
  Pan Bian <bianpan2016@163.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Parav Pandit <parav@mellanox.com>
  Paul Mackerras <paulus@ozlabs.org>
  Peter Ujfalusi <peter.ujfalusi@ti.com>
  Prakash Kamliya <pkamliya@codeaurora.org>
  Ralph Metzler <rjkm@metzlerbros.de>
  Rob Clark <robdclark@gmail.com>
  Robert Lippert <rlippert@google.com>
  Robert Lippert <roblip@gmail.com>
  Ron Economos <w6rz@comcast.net>
  Santeri Toivonen <santeri.toivonen@vatsul.com>
  Sasha Levin <alexander.levin@microsoft.com>
  Sasha Neftin <sasha.neftin@intel.com>
  Scott Wood <swood@redhat.com>
  Sebastian Reichel <sebastian.reichel@collabora.co.uk>
  Sebastian Reichel <sre@kernel.org>
  Sergei Trofimovich <slyfox@gentoo.org>
  Sergej Sawazki <sergej@taudac.com>
  Shaohua Li <shli@fb.com>
  Sharat Masetty <smasetty@codeaurora.org>
  Stephen Boyd <sboyd@codeaurora.org>
  Steve French <smfrench@gmail.com>
  Takashi Iwai <tiwai@suse.de>
  Thomas Gleixner <tglx@linutronix.de>
  Tomi Valkeinen <tomi.valkeinen@ti.com>
  Tony Lindgren <tony@atomide.com>
  Tony Luck <tony.luck@intel.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Viktor Krasnov <vkrasnov@dev.rtsoft.ru>
  Viresh Kumar <viresh.kumar@linaro.org>
  Wolfram Sang <wsa@the-dreams.de>
  Yuchung Cheng <ycheng@google.com>
  Émeric MASCHINO <emeric.maschino@gmail.com>

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
 build-armhf-libvirt                                          fail    
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
 test-amd64-i386-xl                                           pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64-xsm                fail    
 test-amd64-i386-xl-qemut-debianhvm-amd64-xsm                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-xsm                pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-xsm                 pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-armhf-armhf-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      blocked 
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
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     blocked 
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
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 blocked 
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

broken-job build-armhf-libvirt broken

Not pushing.

(No revision log; it would be 1453 lines long.)


--===============9151602895835365640==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9151602895835365640==--
