From: osstest service owner <osstest-admin@xenproject.org>
Subject: [linux-4.9 test] 120047: tolerable FAIL - PUSHED
Date: Wed, 28 Feb 2018 02:14:09 +0000
Message-ID: <osstest-120047-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7421788844164932747=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zfhr=fw=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1eqrGC-0002qq-Nr
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 02:14:24 +0000
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

--===============7421788844164932747==
Content-Type: text/plain

flight 120047 linux-4.9 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/120047/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 119891
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 119891
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 119891
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 119891
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 119891
 test-amd64-amd64-xl-pvhv2-intel 12 guest-start                 fail never pass
 test-amd64-amd64-xl-pvhv2-amd 12 guest-start                  fail  never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-xsm      13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemut-win10-i386 10 windows-install        fail never pass
 test-amd64-amd64-xl-qemuu-win10-i386 10 windows-install        fail never pass
 test-amd64-i386-xl-qemuu-win10-i386 10 windows-install         fail never pass
 test-amd64-i386-xl-qemut-win10-i386 10 windows-install         fail never pass

version targeted for testing:
 linux                19c04ca5b239e6e2277a5b381d1e79482ab9bbc5
baseline version:
 linux                80c1c8322c331586a86e58d3f95026a1265ab396

Last test of basis   119891  2018-02-22 15:01:38 Z    5 days
Testing same since   120011  2018-02-25 10:47:07 Z    2 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adam Ford <aford173@gmail.com>
  Al Viro <viro@zeniv.linux.org.uk>
  Alexandru Ardelean <alexandru.ardelean@analog.com>
  Aliaksei Karaliou <akaraliou.dev@gmail.com>
  Anand Moon <linux.amoon@gmail.com>
  Andre Przywara <andre.przywara@arm.com>
  Andreas Platschek <andreas.platschek@opentech.at>
  Andrew Morton <akpm@linux-foundation.org>
  Andrey Ryabinin <aryabinin@virtuozzo.com>
  Andrey Utkin <andrey.utkin@corp.bluecherry.net>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Andy Shevchenko <andy.shevchenko@gmail.com>
  Ard Biesheuvel <ard.biesheuvel@linaro.org>
  Arend van Spriel <arend.vanspriel@broadcom.com>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Augusto Mecking Caringi <augustocaringi@gmail.com>
  Balamuruhan S <bala24@linux.vnet.ibm.com>
  Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
  Ben Hutchings <ben@decadent.org.uk>
  Ben Skeggs <bskeggs@redhat.com>
  Bin Liu <b-liu@ti.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Bjorn Helgaas <helgaas@kernel.org>
  Boris Ostrovsky <boris.ostrovsky@oracle.com>
  Borislav Petkov <bp@suse.de>
  Branislav Radocaj <branislav@radocaj.org>
  Cai Li <cai.li@spreadtrum.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Chen-Yu Tsai <wens@csie.org>
  Chris Wilson <chris@chris-wilson.co.uk>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Christophe Leroy <christophe.leroy@c-s.fr>
  Chunfeng Yun <chunfeng.yun@mediatek.com>
  Chunyan Zhang <chunyan.zhang@spreadtrum.com>
  Claudiu Manoil <claudiu.manoil@nxp.com>
  Cong Wang <xiyou.wangcong@gmail.com>
  Daniel Jurgens <danielj@mellanox.com>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Darren Hart (VMware) <dvhart@infradead.org>
  Dave Jiang <dave.jiang@intel.com>
  Dave Young <dyoung@redhat.com>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Dmitry Vyukov <dvyukov@google.com>
  Douglas Gilbert <dgilbert@interlog.com>
  Eric Biggers <ebiggers3@gmail.com>
  Eric Biggers <ebiggers@google.com>
  Eric Dumazet <edumazet@google.com>
  Felipe Balbi <felipe.balbi@linux.intel.com>
  Florian Westphal <fw@strlen.de>
  Gao Feng <gfree.wind@vip.163.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Greg Ungerer <gerg@linux-m68k.org>
  Gustavo A. R. Silva <garsilva@embeddedor.com>
  Hans Verkuil <hans.verkuil@cisco.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hugh Dickins <hughd@google.com>
  Ilya Dryomov <idryomov@gmail.com>
  Ingo Molnar <mingo@kernel.org>
  Inki Dae <inki.dae@samsung.com>
  Jack Wang <jinpu.wang@profitbricks.com>
  Jan Beulich <jbeulich@suse.com>
  Jan Dakinevich <jan.dakinevich@gmail.com>
  Jan Kara <jack@suse.cz>
  Jason Gunthorpe <jgg@mellanox.com>
  Jason Wang <jasowang@redhat.com>
  Jens Axboe <axboe@kernel.dk>
  Jia-Ju Bai <baijiaju1990@163.com>
  Jiri Olsa <jolsa@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Jonathan Corbet <corbet@lwn.net>
  Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
  Josh Poimboeuf <jpoimboe@redhat.com>
  Jun Nie <jun.nie@linaro.org>
  Jérémy Lefaure <jeremy.lefaure@lse.epita.fr>
  Kalle Valo <kvalo@codeaurora.org>
  Kamil Konieczny <k.konieczny@partner.samsung.com>
  Karol Herbst <kherbst@redhat.com>
  Keerthy <j-keerthy@ti.com>
  Kefeng Wang <wangkefeng.wang@huawei.com>
  Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
  Ladi Prosek <lprosek@redhat.com>
  Laura Abbott <labbott@redhat.com>
  Leon Romanovsky <leon@kernel.org>
  LEROY Christophe <christophe.leroy@c-s.fr>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Ludovic Desroches <ludovic.desroches@microchip.com>
  Lyude <lyude@redhat.com>
  Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
  Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin Schwidefsky <schwidefsky@de.ibm.com>
  Mauro Carvalho Chehab <mchehab@s-opensource.com>
  Maxime Ripard <maxime.ripard@free-electrons.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael S. Tsirkin <mst@redhat.com>
  Michal Hocko <mhocko@suse.com>
  Moni Shoua <monis@mellanox.com>
  Mukesh Kacker <mukesh.kacker@oracle.com>
  Mustafa Ismail <mustafa.ismail@intel.com>
  Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
  Neil Armstrong <narmstrong@baylibre.com>
  Nicholas Piggin <npiggin@gmail.com>
  Nikolay Borisov <nborisov@suse.com>
  Nogah Frankel <nogahf@mellanox.com>
  Olof Johansson <olof@lixom.net>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Pali Rohár <pali.rohar@gmail.com>
  Paolo Abeni <pabeni@redhat.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul Moore <paul@paul-moore.com>
  Pekka Paalanen <ppaalanen@gmail.com>
  Peter Ujfalusi <peter.ujfalusi@ti.com>
  Radim Krčmář <rkrcmar@redhat.com>
  Randy Dunlap <rdunlap@infradead.org>
  Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
  Russell King <rmk+kernel@armlinux.org.uk>
  Santosh Shilimkar <santosh.shilimkar@oracle.com>
  Sasha Levin <alexander.levin@microsoft.com>
  Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
  Shaohui Xie <Shaohui.Xie@nxp.com>
  Shawn Guo <shawn.guo@linaro.org>
  Shiraz Saleem <shiraz.saleem@intel.com>
  Shuah Khan <shuahkh@osg.samsung.com>
  Sowmini Varadhan <sowmini.varadhan@oracle.com>
  Stefan Haberland <sth@linux.vnet.ibm.com>
  Stefan Potyra <Stefan.Potyra@elektrobit.com>
  Steffen Klassert <steffen.klassert@secunet.com>
  Stephen Boyd <sboyd@codeaurora.org>
  Stephen Smalley <sds@tycho.nsa.gov>
  Tai Nguyen <ttnguyen@apm.com>
  Takashi Iwai <tiwai@suse.de>
  Takuo Koguchi <takuo.koguchi.sw@hitachi.com>
  Takuo Koguchi <takuo.koguchi@gmail.com>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Thomas Gleixner <tglx@linutronix.de>
  Tobias Jordan <Tobias.Jordan@elektrobit.com>
  Tobias Regnery <tobias.regnery@gmail.com>
  Tom Herbert <tom@quantonium.net>
  Tony Lindgren <tony@atomide.com>
  Vincent Pelletier <plr.vincent@gmail.com>
  Vinod Koul <vinod.koul@intel.com>
  Vlastimil Babka <vbabka@suse.cz>
  Wanpeng Li <wanpeng.li@hotmail.com>
  Will Deacon <will.deacon@arm.com>
  Willem de Bruijn <willemb@google.com>
  Xin Long <lucien.xin@gmail.com>
  Yangbo Lu <Yangbo.lu@nxp.com>
  Zhang Rui <rui.zhang@intel.com>
  Zumeng Chen <zumeng.chen@gmail.com>

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
   80c1c8322c33..19c04ca5b239  19c04ca5b239e6e2277a5b381d1e79482ab9bbc5 -> tested/linux-4.9


--===============7421788844164932747==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7421788844164932747==--
