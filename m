From: Platform Team regression test user <citrix-osstest@xenproject.org>
Subject: [linux-3.18 baseline-only test] 74619: trouble:
 blocked/broken/pass
Date: Sun, 15 Apr 2018 08:06:08 +0100
Message-ID: <osstest-74619-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1554600809754119600=="
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

--===============1554600809754119600==
Content-Type: text/plain

This run is configured for baseline tests only.

flight 74619 linux-3.18 real [real]
http://osstest.xs.citrite.net/~osstest/testlogs/logs/74619/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64                     <job status>                 broken
 build-amd64                     <job status>                 broken
 build-i386                      <job status>                 broken
 build-armhf-pvops               <job status>                 broken
 build-arm64-xsm                 <job status>                 broken
 build-i386-xsm                  <job status>                 broken
 build-amd64-xsm                 <job status>                 broken
 build-arm64-pvops               <job status>                 broken
 build-armhf-xsm                 <job status>                 broken
 build-armhf                     <job status>                 broken

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-i386-freebsd10-i386  1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-intel  1 build-check(1)              blocked n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-armhf-armhf-xl-midway    1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64-xsm  1 build-check(1)     blocked n/a
 test-amd64-i386-xl-qemut-debianhvm-amd64-xsm  1 build-check(1)     blocked n/a
 build-arm64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemut-win10-i386  1 build-check(1)              blocked n/a
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-xl-qemuu-win10-i386  1 build-check(1)              blocked n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-amd64-i386-examine       1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemut-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-amd64-xl-qemut-win10-i386  1 build-check(1)             blocked n/a
 test-amd64-i386-xl-qemut-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-amd64-i386-qemut-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-amd64-i386-freebsd10-amd64  1 build-check(1)               blocked  n/a
 test-amd64-amd64-pair         1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               blocked  n/a
 build-i386-rumprun            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-win10-i386  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-pygrub       1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-amd64-xl-qcow2     1 build-check(1)               blocked  n/a
 test-amd64-amd64-amd64-pvgrub  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-armhf-armhf-libvirt-xsm  1 build-check(1)               blocked  n/a
 build-amd64-rumprun           1 build-check(1)               blocked  n/a
 test-amd64-i386-xl            1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit2   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-xsm        1 build-check(1)               blocked  n/a
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-xsm  1 build-check(1)    blocked n/a
 test-amd64-amd64-rumprun-amd64  1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-raw        1 build-check(1)               blocked  n/a
 test-amd64-amd64-i386-pvgrub  1 build-check(1)               blocked  n/a
 test-amd64-i386-qemuu-rhel6hvm-amd  1 build-check(1)               blocked n/a
 test-amd64-amd64-xl-qemut-ws16-amd64  1 build-check(1)             blocked n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ws16-amd64  1 build-check(1)             blocked n/a
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-intel  1 build-check(1)               blocked  n/a
 test-armhf-armhf-examine      1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-i386-qemuu-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-amd64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-amd64-i386-pair          1 build-check(1)               blocked  n/a
 test-amd64-i386-rumprun-i386  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-amd  1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-xl-qemut-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-qemut-rhel6hvm-amd  1 build-check(1)               blocked n/a
 test-amd64-amd64-examine      1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-debianhvm-amd64-xsm  1 build-check(1)    blocked n/a
 test-amd64-amd64-xl-qemut-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-armhf-armhf-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-rtds      1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 build-armhf-pvops             4 host-install(4)       broken baseline untested
 build-armhf-xsm               4 host-install(4)       broken baseline untested
 build-armhf                   4 host-install(4)       broken baseline untested
 build-amd64                   4 host-install(4)       broken baseline untested
 build-i386                    4 host-install(4)       broken baseline untested
 build-i386-xsm                4 host-install(4)       broken baseline untested
 build-amd64-xsm               4 host-install(4)       broken baseline untested
 build-arm64-pvops             2 hosts-allocate               broken never pass
 build-arm64-xsm               2 hosts-allocate               broken never pass
 build-arm64                   2 hosts-allocate               broken never pass
 build-arm64-xsm               3 capture-logs                 broken never pass
 build-arm64-pvops             3 capture-logs                 broken never pass
 build-arm64                   3 capture-logs                 broken never pass

version targeted for testing:
 linux                78db2bbfa06cc39707054093fbbc5e573a643d3e
baseline version:
 linux                fb625ba7025f2e791b870f25fe4b19eb3b4c0f32

Last test of basis    74583  2018-04-12 21:50:32 Z    2 days
Testing same since    74619  2018-04-15 05:19:59 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Pieter \"PoroCYon\" Sluys" <pcy@national.shitposting.agency>
  A Sun <as1033x@comcast.net>
  Aaron Brown <aaron.f.brown@intel.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Alan Stern <stern@rowland.harvard.edu>
  Alexander Potapenko <glider@google.com>
  Alexandre Belloni <alexandre.belloni@free-electrons.com>
  Andrea della Porta <sfaragnaus@gmail.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrey Konovalov <andreyknvl@google.com>
  Andy Gospodarek <andy@greyhouse.net>
  Antony Antony <antony@phenome.org>
  Anup Patel <anup.patel@broadcom.com>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Aurelien Aptel <aaptel@suse.com>
  Bart Van Assche <bart.vanassche@sandisk.com>
  Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
  Bob Moore <robert.moore@intel.com>
  Borislav Petkov <bp@suse.de>
  Chad Dupuis <chad.dupuis@cavium.com>
  Chandan Tagore <tagore.chandan@gmail.com>
  Chenbo Feng <fengc@google.com>
  chenxiang <chenxiang66@hisilicon.com>
  Chris Wilson <chris@chris-wilson.co.uk>
  Christian Lamparter <chunkeey@googlemail.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chuck Lever <chuck.lever@oracle.com>
  Colin Ian King <colin.king@canonical.com>
  Craig Dillabaugh <cdillaba@mojatatu.com>
  Cyrill Gorcunov <gorcunov@openvz.org>
  Dan Carpenter <dan.carpenter@oracle.com>
  Dan Williams <dan.j.williams@intel.com>
  David Ahern <dsahern@gmail.com>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Davidlohr Bueso <dbueso@suse.de>
  Dmitry Monakhov <dmonakhov@openvz.org>
  Eric Dumazet <edumazet@google.com>
  Eryu Guan <eguan@redhat.com>
  Fabio Estevam <fabio.estevam@nxp.com>
  Felipe Balbi <felipe.balbi@linux.intel.com>
  Firo Yang <firogm@gmail.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Greg Hackmann <ghackmann@google.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Grygorii Strashko <grygorii.strashko@ti.com>
  Gustavo A. R. Silva <garsilva@embeddedor.com>
  Hangbin Liu <liuhangbin@gmail.com>
  Hans Verkuil <hans.verkuil@cisco.com>
  Heiko Carstens <heiko.carstens@de.ibm.com>
  Heiner Kallweit <hkallweit1@gmail.com>
  Ian Abbott <abbotti@mev.co.uk>
  Ihar Hrachyshka <ihrachys@redhat.com>
  Ilya Dryomov <idryomov@gmail.com>
  Ingo Molnar <mingo@kernel.org>
  Ivan Mikhaylov <ivan@de.ibm.com>
  J. Bruce Fields <bfields@redhat.com>
  Jacek Anaszewski <jacek.anaszewski@gmail.com>
  Jacob Keller <jacob.e.keller@intel.com>
  Jag Raman <jag.raman@oracle.com>
  Jagannathan Raman <jag.raman@oracle.com>
  Jamal Hadi Salim <jhs@mojatatu.com>
  Jan H. Schönherr <jschoenh@amazon.de>
  Jani Nikula <jani.nikula@intel.com>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jason Wang <jasowang@redhat.com>
  Jason Yan <yanaijie@huawei.com>
  Jeff Kirsher <jeffrey.t.kirsher@intel.com>
  Jens Axboe <axboe@fb.com>
  Jens Axboe <axboe@kernel.dk>
  Jeremy Kerr <jk@ozlabs.org>
  Jia-Ju Bai <baijiaju1990@163.com>
  Jiri Olsa <jolsa@kernel.org>
  Jisheng Zhang <jszhang@marvell.com>
  Johannes Berg <johannes.berg@intel.com>
  Jonathan Cameron <jic23@kernel.org>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kalle Valo <kvalo@codeaurora.org>
  Kalle Valo <kvalo@qca.qualcomm.com>
  Kees Cook <keescook@chromium.org>
  Kirill Tkhai <ktkhai@virtuozzo.com>
  Lin Zhang <xiaolou4617@gmail.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  linzhang <xiaolou4617@gmail.com>
  Liping Zhang <zlpnobody@gmail.com>
  Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>
  Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
  Lorenzo Bianconi <lorenzo.bianconi@st.com>
  Luca Coelho <luciano.coelho@intel.com>
  Lv Zheng <lv.zheng@intel.com>
  Mahesh Bandewar <maheshb@google.com>
  Marcel Holtmann <marcel@holtmann.org>
  Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
  Marcin Nowakowski <marcin.nowakowski@imgtec.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin Schwidefsky <schwidefsky@de.ibm.com>
  Masahiro Yamada <yamada.masahiro@socionext.com>
  Maurizio Lombardi <mlombard@redhat.com>
  Mauro Carvalho Chehab <mchehab@s-opensource.com>
  Mel Gorman <mgorman@suse.de>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Lyle <mlyle@lyle.org>
  Michael Neuling <mikey@neuling.org>
  Michael S. Tsirkin <mst@redhat.com>
  Michael Schmitz <schmitzmic@gmail.com>
  Mikhail Sennikovskii <mikhail.sennikovskii@profitbricks.com>
  Miklos Szeredi <mszeredi@redhat.com>
  Milian Wolff <milian.wolff@kdab.com>
  Mintz, Yuval <Yuval.Mintz@cavium.com>
  Namhyung Kim <namhyung@kernel.org>
  Nathan Chancellor <natechancellor@gmail.com>
  Neil Horman <nhorman@tuxdriver.com>
  Nicholas Bellinger <nab@linux-iscsi.org>
  Nithin Nayak Sujir <nsujir@tintri.com>
  Nithin Sujir <nsujir@tintri.com>
  Or Gerlitz <ogerlitz@mellanox.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Pan Bian <bianpan2016@163.com>
  Paolo Abeni <pabeni@redhat.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul Mackerras <paulus@ozlabs.org>
  Pavel Shilovsky <pshilov@microsoft.com>
  Peter Chen <peter.chen@nxp.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Pieter \"PoroCYon\" Sluys <pcy@national.shitposting.agency>
  Rabin Vincent <rabinv@axis.com>
  Rafael David Tinoco <rafael.tinoco@canonical.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Ralf Baechle <ralf@linux-mips.org>
  Robert Jarzmik <robert.jarzmik@free.fr>
  Roman Kapl <roman.kapl@sysgo.com>
  Roman Pen <roman.penyaev@profitbricks.com>
  Roopa Prabhu <roopa@cumulusnetworks.com>
  Russell King <rmk+kernel@armlinux.org.uk>
  Sasha Levin <alexander.levin@microsoft.com>
  Sean Young <sean@mess.org>
  Sedat Dilek <sedat.dilek@gmail.com>
  Sekhar Nori <nsekhar@ti.com>
  Shawn Guo <shawnguo@kernel.org>
  Stefan Wahren <stefan.wahren@i2se.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Steffen Klassert <steffen.klassert@secunet.com>
  Steve French <smfrench@gmail.com>
  Suman Anna <s-anna@ti.com>
  Szymon Janc <szymon.janc@codecoup.pl>
  Talat Batheesh <talatb@mellanox.com>
  Tang Junhui <tang.junhui@zte.com.cn>
  Tariq Toukan <tariqt@mellanox.com>
  Tejun Heo <tj@kernel.org>
  Theodore Ts'o <tytso@mit.edu>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  Tin Huynh <tnhuynh@apm.com>
  Tomi Valkeinen <tomi.valkeinen@ti.com>
  Tony Lindgren <tony@atomide.com>
  Trond Myklebust <trond.myklebust@primarydata.com>
  Vaibhav Jain <vaibhav@linux.vnet.ibm.com>
  Vinod Koul <vinod.koul@intel.com>
  Will Deacon <will.deacon@arm.com>
  Xin Long <lucien.xin@gmail.com>
  Yuval Mintz <Yuval.Mintz@cavium.com>

jobs:
 build-amd64-xsm                                              broken  
 build-arm64-xsm                                              broken  
 build-armhf-xsm                                              broken  
 build-i386-xsm                                               broken  
 build-amd64                                                  broken  
 build-arm64                                                  broken  
 build-armhf                                                  broken  
 build-i386                                                   broken  
 build-amd64-libvirt                                          blocked 
 build-arm64-libvirt                                          blocked 
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            broken  
 build-armhf-pvops                                            broken  
 build-i386-pvops                                             pass    
 build-amd64-rumprun                                          blocked 
 build-i386-rumprun                                           blocked 
 test-amd64-amd64-xl                                          blocked 
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          blocked 
 test-amd64-i386-xl                                           blocked 
 test-amd64-amd64-xl-qemut-debianhvm-amd64-xsm                blocked 
 test-amd64-i386-xl-qemut-debianhvm-amd64-xsm                 blocked 
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           blocked 
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-xsm                blocked 
 test-amd64-i386-xl-qemuu-debianhvm-amd64-xsm                 blocked 
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        blocked 
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         blocked 
 test-amd64-amd64-libvirt-xsm                                 blocked 
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-armhf-armhf-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  blocked 
 test-amd64-amd64-xl-xsm                                      blocked 
 test-arm64-arm64-xl-xsm                                      blocked 
 test-armhf-armhf-xl-xsm                                      blocked 
 test-amd64-i386-xl-xsm                                       blocked 
 test-amd64-amd64-qemuu-nested-amd                            blocked 
 test-amd64-amd64-xl-pvhv2-amd                                blocked 
 test-amd64-i386-qemut-rhel6hvm-amd                           blocked 
 test-amd64-i386-qemuu-rhel6hvm-amd                           blocked 
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    blocked 
 test-amd64-i386-xl-qemut-debianhvm-amd64                     blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    blocked 
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     blocked 
 test-amd64-i386-freebsd10-amd64                              blocked 
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         blocked 
 test-amd64-i386-xl-qemuu-ovmf-amd64                          blocked 
 test-amd64-amd64-rumprun-amd64                               blocked 
 test-amd64-amd64-xl-qemut-win7-amd64                         blocked 
 test-amd64-i386-xl-qemut-win7-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-win7-amd64                         blocked 
 test-amd64-i386-xl-qemuu-win7-amd64                          blocked 
 test-amd64-amd64-xl-qemut-ws16-amd64                         blocked 
 test-amd64-i386-xl-qemut-ws16-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-ws16-amd64                         blocked 
 test-amd64-i386-xl-qemuu-ws16-amd64                          blocked 
 test-amd64-amd64-xl-credit2                                  blocked 
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  blocked 
 test-amd64-amd64-examine                                     blocked 
 test-arm64-arm64-examine                                     blocked 
 test-armhf-armhf-examine                                     blocked 
 test-amd64-i386-examine                                      blocked 
 test-amd64-i386-freebsd10-i386                               blocked 
 test-amd64-i386-rumprun-i386                                 blocked 
 test-amd64-amd64-xl-qemut-win10-i386                         blocked 
 test-amd64-i386-xl-qemut-win10-i386                          blocked 
 test-amd64-amd64-xl-qemuu-win10-i386                         blocked 
 test-amd64-i386-xl-qemuu-win10-i386                          blocked 
 test-amd64-amd64-qemuu-nested-intel                          blocked 
 test-amd64-amd64-xl-pvhv2-intel                              blocked 
 test-amd64-i386-qemut-rhel6hvm-intel                         blocked 
 test-amd64-i386-qemuu-rhel6hvm-intel                         blocked 
 test-amd64-amd64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      blocked 
 test-armhf-armhf-xl-midway                                   blocked 
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
sg-report-flight on osstest.xs.citrite.net
logs: /home/osstest/logs
images: /home/osstest/images

Logs, config files, etc. are available at
    http://osstest.xs.citrite.net/~osstest/testlogs/logs

Test harness code can be found at
    http://xenbits.xensource.com/gitweb?p=osstest.git;a=summary

broken-job build-arm64 broken
broken-job build-amd64 broken
broken-job build-i386 broken
broken-job build-armhf-pvops broken
broken-job build-arm64-xsm broken
broken-job build-i386-xsm broken
broken-job build-amd64-xsm broken
broken-job build-arm64-pvops broken
broken-job build-armhf-xsm broken
broken-job build-armhf broken
broken-step build-arm64-pvops hosts-allocate
broken-step build-arm64-xsm hosts-allocate
broken-step build-arm64 hosts-allocate
broken-step build-arm64-xsm capture-logs
broken-step build-arm64-pvops capture-logs
broken-step build-arm64 capture-logs
broken-step build-armhf-pvops host-install(4)
broken-step build-armhf-xsm host-install(4)
broken-step build-armhf host-install(4)
broken-step build-amd64 host-install(4)
broken-step build-i386 host-install(4)
broken-step build-i386-xsm host-install(4)
broken-step build-amd64-xsm host-install(4)

Push not applicable.

(No revision log; it would be 3956 lines long.)


--===============1554600809754119600==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1554600809754119600==--
