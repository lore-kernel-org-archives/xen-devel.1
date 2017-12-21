From: osstest service owner <osstest-admin@xenproject.org>
Subject: [linux-4.9 test] 117374: regressions - FAIL
Date: Thu, 21 Dec 2017 11:18:04 +0000
Message-ID: <osstest-117374-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2453800268716801594=="
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

--===============2453800268716801594==
Content-Type: text/plain

flight 117374 linux-4.9 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/117374/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-debianhvm-amd64 15 guest-saverestore.2 fail REGR. vs. 117255
 test-armhf-armhf-xl-credit2 16 guest-start/debian.repeat fail REGR. vs. 117255

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 117255
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 117255
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 117255
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 117255
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 117255
 test-amd64-amd64-xl-pvhv2-amd 12 guest-start                  fail  never pass
 test-amd64-amd64-xl-pvhv2-intel 12 guest-start                 fail never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-xsm      13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemut-win10-i386 10 windows-install        fail never pass
 test-amd64-i386-xl-qemut-win10-i386 10 windows-install         fail never pass
 test-amd64-amd64-xl-qemuu-win10-i386 10 windows-install        fail never pass
 test-amd64-i386-xl-qemuu-win10-i386 10 windows-install         fail never pass

version targeted for testing:
 linux                b632d710149f1a638ffa6e999cfbd9ee9fbdada6
baseline version:
 linux                ee52d08d2e09539154f397c8a412c68189c4d6a0

Last test of basis   117255  2017-12-17 21:46:37 Z    3 days
Testing same since   117374  2017-12-20 09:38:50 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Yan, Zheng" <zyan@redhat.com>
  Abhijith Das <adas@redhat.com>
  Adam Wallis <awallis@codeaurora.org>
  Alan Stern <stern@rowland.harvard.edu>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Vesker <valex@mellanox.com>
  Alex Williamson <alex.williamson@redhat.com>
  Alexander Duyck <alexander.h.duyck@intel.com>
  Alexander Potapenko <glider@google.com>
  Alexander Shishkin <alexander.shishkin@linux.intel.com>
  Alexandre Belloni <alexandre.belloni@free-electrons.com>
  Amit K Bag <amit.k.bag@intel.com>
  Andrea Arcangeli <aarcange@redhat.com>
  Andreas Gruenbacher <agruenba@redhat.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Anna Schumaker <Anna.Schumaker@Netapp.com>
  Ard Biesheuvel <ard.biesheuvel@linaro.org>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Bart Van Assche <bart.vanassche@wdc.com>
  Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
  Bartosz Golaszewski <brgl@bgdev.pl>
  Bert Kenward <bkenward@solarflare.com>
  Bin Liu <b-liu@ti.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Bob Peterson <rpeterso@redhat.com>
  Brian Foster <bfoster@redhat.com>
  Chandan Rajendra <chandan@linux.vnet.ibm.com>
  Changbin Du <changbin.du@intel.com>
  Chaotian Jing <chaotian.jing@mediatek.com>
  Chen Zhong <chen.zhong@mediatek.com>
  Chris Mason <clm@fb.com>
  Christian König <christian.koenig@amd.com>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Christophe Leroy <christophe.leroy@c-s.fr>
  Chunfeng Yun <chunfeng.yun@mediatek.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Dan Williams <dan.j.williams@intel.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Bristot de Oliveira <bristot@redhat.com>
  Daniel Drake <drake@endlessm.com>
  Daniel Jurgens <danielj@mellanox.com>
  Daniel Lezcano <daniel.lezcano@linaro.org>
  Darrick J. Wong <darrick.wong@oracle.com>
  Dave Airlie <airlied@redhat.com>
  Dave Chinner <dchinner@redhat.com>
  David Ahern <dsa@cumulusnetworks.com>
  David Howells <dhowells@redhat.com>
  David Kozub <zub@linux.fjfi.cvut.cz>
  David Lechner <david@lechnology.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dennis Dalessandro <dennis.dalessandro@intel.com>
  Dexuan Cui <decui@microsoft.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Dmitry Vyukov <dvyukov@google.com>
  Don Brace <don.brace@microsemi.com>
  Dou Liyang <douly.fnst@cn.fujitsu.com>
  Doug Berger <opendmb@gmail.com>
  Doug Ledford <dledford@redhat.com>
  Douglas Gilbert <dgilbert@interlog.com>
  Eduardo Valentin <edubezval@gmail.com>
  Eric Biggers <ebiggers@google.com>
  Eryu Guan <eguan@redhat.com>
  Felipe Balbi <felipe.balbi@linux.intel.com>
  Florian Westphal <fw@strlen.de>
  Gao Feng <gfree.wind@vip.163.com>
  Gary R Hook <gary.hook@amd.com>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guillaume Nault <g.nault@alphalink.fr>
  Guneshwor Singh <guneshwor.o.singh@intel.com>
  Guoqing Jiang <gqjiang@suse.com>
  Hannes Reinecke <hare@suse.de>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
  Ilan Peer <ilan.peer@intel.com>
  Ilya Dryomov <idryomov@gmail.com>
  Ingo Molnar <mingo@kernel.org>
  J. Bruce Fields <bfields@redhat.com>
  Jack Morgenstein <jackm@dev.mellanox.co.il>
  Jan Kara <jack@suse.cz>
  Javier Martinez Canillas <javier@osg.samsung.com>
  Jens Axboe <axboe@fb.com>
  Jens Axboe <axboe@kernel.dk>
  Jia-Ju Bai <baijiaju1990@163.com>
  Jiang Yi <jiangyilism@gmail.com>
  Jiri Kosina <jkosina@suse.cz>
  Jiri Pirko <jiri@mellanox.com>
  Jiri Slaby <jslaby@suse.cz>
  Johan Hovold <johan@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  Julian Anastasov <ja@ssi.bg>
  K. Y. Srinivasan <kys@microsoft.com>
  Kalle Valo <kvalo@codeaurora.org>
  Kalle Valo <kvalo@qca.qualcomm.com>
  Keerthy <j-keerthy@ti.com>
  Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
  Kurt Garloff <garloff@suse.de>
  KUWAZAWA Takuya <albatross0@gmail.com>
  Ladislav Michl <ladis@linux-mips.org>
  Lee Jones <lee.jones@linaro.org>
  Leo Yan <leo.yan@linaro.org>
  Leon Romanovsky <leon@kernel.org>
  Liang Chen <liangchen.linux@gmail.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Liu Bo <bo.li.liu@oracle.com>
  Luca Coelho <luciano.coelho@intel.com>
  Marc Dionne <marc.dionne@auristor.com>
  Marc Zyngier <marc.zyngier@arm.com>
  Marcel Holtmann <marcel@holtmann.org>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin Kaiser <martin@kaiser.cx>
  Martin Wilck <mwilck@suse.de>
  Mathias Nyman <mathias.nyman@linux.intel.com>
  Matteo Croce <mcroce@redhat.com>
  Matthias Brugger <matthias.bgg@gmail.com>
  Matthias Kaehlcke <mka@chromium.org>
  Miaoqing Pan <miaoqing@codeaurora.org>
  Michael Chan <michael.chan@broadcom.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael S. Tsirkin <mst@redhat.com>
  Michael Turquette <mturquette@baylibre.com>
  Michał Mirosław <mirq-linux@rere.qmqm.pl>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Mike Christie <mchristi@redhat.com>
  Mintz, Yuval <Yuval.Mintz@cavium.com>
  NeilBrown <neilb@suse.com>
  Nicholas Bellinger <nab@linux-iscsi.org>
  Nick Desaulniers <ndesaulniers@google.com>
  nixiaoming <nixiaoming@huawei.com>
  Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
  Olga Kornievskaia <kolga@netapp.com>
  Oliver Neukum <oneukum@suse.com>
  Osama Khan <osama.khan@ericsson.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
  Parav Pandit <parav@mellanox.com>
  Patel Jay P <jay.p.patel@intel.com>
  Paul Blakey <paulb@mellanox.com>
  Peter De Schrijver <pdeschrijver@nvidia.com>
  Peter Jones <pjones@redhat.com>
  Peter Ujfalusi <peter.ujfalusi@ti.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Philipp Zabel <p.zabel@pengutronix.de>
  Qiang <zhengqiang10@huawei.com>
  Qiang Zheng <zhengqiang10@huawei.com>
  Radim Krčmář <rkrcmar@redhat.com>
  Raju Rangoju <rajur@chelsio.com>
  Ram Amrani <Ram.Amrani@cavium.com>
  Robert Baronescu <robert.baronescu@nxp.com>
  Robert Shearman <rshearma@brocade.com>
  Robert Stonehouse <rstonehouse@solarflare.com>
  Saeed Mahameed <saeedm@mellanox.com>
  Sagi Grimberg <sagi@grimberg.me>
  Sara Sharon <sara.sharon@intel.com>
  Sasha Levin <alexander.levin@verizon.com>
  Scott Mayhew <smayhew@redhat.com>
  Sean Hefty <sean.hefty@intel.com>
  Sean Wang <sean.wang@mediatek.com>
  Shaohua Li <shli@fb.com>
  Shriya <shriyak@linux.vnet.ibm.com>
  Shuah Khan <shuahkh@osg.samsung.com>
  Stafford Horne <shorne@gmail.com>
  Stephen Boyd <sboyd@codeaurora.org>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Steven Rostedt <rostedt@goodmis.org>
  Sukumar Ghorai <sukumar.ghorai@intel.com>
  Suzuki K Poulose <suzuki.poulose@arm.com>
  Sébastien Szymanski <sebastien.szymanski@armadeus.com>
  Tahsin Erdogan <tahsin@google.com>
  Taku Izumi <izumi.taku@jp.fujitsu.com>
  tang.junhui <tang.junhui@zte.com.cn>
  tangwenji <tang.wenji@zte.com.cn>
  Tariq Toukan <tariqt@mellanox.com>
  Theodore Ts'o <tytso@mit.edu>
  Thierry Reding <treding@nvidia.com>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  Tina Ruchandani <ruchandani.tina@gmail.com>
  Tomi Valkeinen <tomi.valkeinen@ti.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Vinod Koul <vinod.koul@intel.com>
  Vitaly Kuznetsov <vkuznets@redhat.com>
  Vlad Yasevich <vyasevich@gmail.com>
  Vladislav Yasevich <vyasevic@redhat.com>
  Wanpeng Li <wanpeng.li@hotmail.com>
  weiping zhang <zhangweiping@didichuxing.com>
  Will Deacon <will.deacon@arm.com>
  William A. Kennington III <wak@google.com>
  Xiaolong Ye <xiaolong.ye@intel.com>
  Yan, Zheng <zyan@redhat.com>
  Yong Mao <yong.mao@mediatek.com>
  Yuval Mintz <Yuval.Mintz@cavium.com>
  Zygo Blaxell <ce3g8jdj@umail.furryterror.org>

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
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     fail    
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
 test-armhf-armhf-xl-credit2                                  fail    
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


Not pushing.

(No revision log; it would be 5142 lines long.)


--===============2453800268716801594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2453800268716801594==--
