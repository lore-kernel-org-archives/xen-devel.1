From: Platform Team regression test user <citrix-osstest@xenproject.org>
Subject: [linux-4.1 baseline-only test] 72798: trouble:
	blocked/broken
Date: Thu, 14 Dec 2017 22:36:24 +0000
Message-ID: <osstest-72798-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7932744403508948347=="
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

--===============7932744403508948347==
Content-Type: text/plain

This run is configured for baseline tests only.

flight 72798 linux-4.1 real [real]
http://osstest.xs.citrite.net/~osstest/testlogs/logs/72798/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                     <job status>                 broken
 build-i386                      <job status>                 broken
 build-armhf-pvops               <job status>                 broken
 build-i386-xsm                  <job status>                 broken
 build-amd64-xsm                 <job status>                 broken
 build-amd64-pvops               <job status>                 broken
 build-i386-pvops                <job status>                 broken
 build-armhf-xsm                 <job status>                 broken
 build-armhf                     <job status>                 broken
 build-armhf                   4 host-install(4)         broken REGR. vs. 72447
 build-armhf-pvops             4 host-install(4)         broken REGR. vs. 72447
 build-armhf-xsm               4 host-install(4)         broken REGR. vs. 72447
 build-i386-pvops              4 host-install(4)         broken REGR. vs. 72447
 build-i386                    4 host-install(4)         broken REGR. vs. 72447
 build-i386-xsm                4 host-install(4)         broken REGR. vs. 72447
 build-amd64-xsm               4 host-install(4)         broken REGR. vs. 72447
 build-amd64                   4 host-install(4)         broken REGR. vs. 72447
 build-amd64-pvops             4 host-install(4)         broken REGR. vs. 72447

Tests which did not succeed, but are not blocking:
 test-amd64-i386-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-i386-freebsd10-i386  1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-intel  1 build-check(1)              blocked n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-armhf-armhf-xl-midway    1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64-xsm  1 build-check(1)     blocked n/a
 test-amd64-i386-xl-qemut-debianhvm-amd64-xsm  1 build-check(1)     blocked n/a
 test-amd64-i386-xl-qemut-win10-i386  1 build-check(1)              blocked n/a
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-xl-qemuu-win10-i386  1 build-check(1)              blocked n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
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
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-i386-xl            1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a
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
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ws16-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-intel  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-armhf-armhf-examine      1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-i386-qemuu-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-amd64-xl           1 build-check(1)               blocked  n/a
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

version targeted for testing:
 linux                c3f4bb14a264a96c2709b026dca37a4eb252a82a
baseline version:
 linux                200d858d94b4d8ed7a287e3a3c2b860ae9e17e83

Last test of basis    72447  2017-11-14 09:21:30 Z   30 days
Testing same since    72798  2017-12-14 16:49:02 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Eric W. Biederman" <ebiederm@xmission.com>
  "HUANG Weller (CM/ESW12-CN)" <Weller.Huang@cn.bosch.com>
  Aaron Brown <aaron.f.brown@intel.com>
  Aaron Sierra <asierra@xes-inc.com>
  Adam Wallis <awallis@codeaurora.org>
  Akinobu Mita <akinobu.mita@gmail.com>
  Al Viro <viro@zeniv.linux.org.uk>
  Alan Stern <stern@rowland.harvard.edu>
  Alex Chen <alex.chen@huawei.com>
  Alexander Boyko <alexander.boyko@seagate.com>
  Alexander Duyck <alexander.h.duyck@intel.com>
  Alexander Potapenko <glider@google.com>
  Alexei Starovoitov <ast@kernel.org>
  Alexey Khoroshilov <khoroshilov@ispras.ru>
  Alison Schofield <amsfield22@gmail.com>
  Andrei Vagin <avagin@openvz.org>
  Andrew Bowers <andrewx.bowers@intel.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrey Konovalov <andreyknvl@google.com>
  Andrey Ryabinin <aryabinin@virtuozzo.com>
  Andrii Anisov <andrii_anisov@epam.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Arnd Bergmann <arnd@arndb.de>
  Arvind Yadav <arvind.yadav.cs@gmail.com>
  Ashish Samant <ashish.samant@oracle.com>
  Bart Van Assche <bart.vanassche@sandisk.com>
  Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
  Bernhard Rosenkraenzer <Bernhard.Rosenkranzer@linaro.org>
  Bilal Amarni <bilal.amarni@gmail.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Bjørn Mork <bjorn@mork.no>
  Boris Ostrovsky <boris.ostrovsky@oracle.com>
  Borislav Petkov <bp@suse.de>
  Brian Norris <computersforpeace@gmail.com>
  Carlo Caione <carlo@endlessm.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Changwei Ge <ge.changwei@h3c.com>
  Chanwoo Choi <cw00.choi@samsung.com>
  Chi-hsien Lin <Chi-Hsien.Lin@cypress.com>
  Chris Brandt <chris.brandt@renesas.com>
  Chris J Arges <christopherarges@gmail.com>
  Cong Wang <xiyou.wangcong@gmail.com>
  Corey Minyard <cminyard@mvista.com>
  Craig Gallek <kraig@google.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Darren Hart (VMware) <dvhart@infradead.org>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  Dick Kennedy <dick.kennedy@broadcom.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Doug Ledford <dledford@redhat.com>
  Douglas Fischer <douglas.fischer@outlook.com>
  Emil Tantilov <emil.s.tantilov@intel.com>
  Erez Shitrit <erezsh@mellanox.com>
  Eric Biggers <ebiggers@google.com>
  Eric Dumazet <edumazet@google.com>
  Eric W. Biederman <ebiederm@xmission.com>
  Felipe Balbi <felipe.balbi@linux.intel.com>
  Fengguang Wu <fengguang.wu@intel.com>
  Feras Daoud <ferasda@mellanox.com>
  frank zago <fzago@cray.com>
  Galo Navarro <anglorvaroa@gmail.com>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Gilad Ben-Yossef <gilad@benyossef.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guillaume Nault <g.nault@alphalink.fr>
  Gustavo A. R. Silva <garsilva@embeddedor.com>
  Hangbin Liu <liuhangbin@gmail.com>
  Hannu Lounento <hannu.lounento@ge.com>
  Hans Verkuil <hans.verkuil@cisco.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Huacai Chen <chenhc@lemote.com>
  Ilya Dryomov <idryomov@gmail.com>
  Jacob Keller <jacob.e.keller@intel.com>
  Jaewon Kim <jaewon31.kim@samsung.com>
  James Hogan <jhogan@kernel.org>
  James Morris <james.l.morris@oracle.com>
  James Shen <jcs@datera.io>
  James Simmons <jsimmons@infradead.org>
  James Smart <james.smart@broadcom.com>
  Jan Beulich <jbeulich@suse.com>
  Jan Harkes <jaharkes@cs.cmu.edu>
  Jan Kara <jack@suse.cz>
  Jann Horn <jannh@google.com>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jason Cooper <jason@lakedaemon.net>
  Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
  Javier Martinez Canillas <javier@osg.samsung.com>
  Jeff Kirsher <jeffrey.t.kirsher@intel.com>
  Jiang Yi <jiangyilism@gmail.com>
  Johan Hovold <johan@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  Jonas Gorski <jonas.gorski@gmail.com>
  Jonathan Cameron <jic23@kernel.org>
  Jordan Crouse <jcrouse@codeaurora.org>
  Juergen Gross <jgross@suse.com>
  Julian Anastasov <ja@ssi.bg>
  Julian Wiedmann <jwi@linux.vnet.ibm.com>
  Julien Gomes <julien@arista.com>
  Justin Maggard <jmaggard01@gmail.com>
  Kalle Valo <kvalo@codeaurora.org>
  Kasin Li <donglil@codeaurora.org>
  Kees Cook <keescook@chromium.org>
  Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
  Konrad Rzeszutek Wilk <konrad@kernel.org>
  Krishneil Singh <krishneil.k.singh@intel.com>
  Larry Finger <Larry.Finger@lwfinger.net>
  Lars-Peter Clausen <lars@metafoo.de>
  Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Lee Jones <lee.jones@linaro.org>
  Leon Romanovsky <leon@kernel.org>
  Li Zhong <zhong@linux.vnet.ibm.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Luis R. Rodriguez <mcgrof@kernel.org>
  Lukas Wunner <lukas@wunner.de>
  Maciej W. Rozycki <macro@linux-mips.org>
  Magnus Öberg <magnus.oberg@westermo.se>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
  Marcin Nowakowski <marcin.nowakowski@imgtec.com>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin Schwidefsky <schwidefsky@de.ibm.com>
  Matija Glavinic Pecotic <matija.glavinic-pecotic.ext@nokia.com>
  Matt Redfearn <matt.redfearn@imgtec.com>
  Matwey V. Kornilov <matwey@sai.msu.ru>
  Mauro Carvalho Chehab <mchehab@osg.samsung.com>
  Mauro Carvalho Chehab <mchehab@s-opensource.com>
  Michael Hennerich <michael.hennerich@analog.com>
  Michal Hocko <mhocko@suse.com>
  Mimi Zohar <zohar@linux.vnet.ibm.com>
  Neal Cardwell <ncardwell@google.com>
  Neil Horman <nhorman@tuxdriver.com>
  Ngai-Mint Kwan <ngai-mint.kwan@intel.com>
  Nicholas Bellinger <nab@linux-iscsi.org>
  Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Noralf Trønnes <noralf@tronnes.org>
  Oleh Kravchenko <oleg@kaa.org.ua>
  Oleksandr Dmytryshyn <oleksandr.dmytryshyn@globallogic.com>
  Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
  Paolo Abeni <pabeni@redhat.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul Burton <paul.burton@imgtec.com>
  Paul Burton <paul.burton@mips.com>
  Paul Mackerras <paulus@ozlabs.org>
  Peter Senna Tschudin <peter.senna@collabora.com>
  Radim Krčmář <rkrcmar@redhat.com>
  Ralf Baechle <ralf@linux-mips.org>
  Randy Dunlap <rdunlap@infradead.org>
  Ricard Wanderlof <ricard.wanderlof@axis.com>
  Ricard Wanderlof <ricardw@axis.com>
  Richard Schütz <rschuetz@uni-koblenz.de>
  Rob Clark <robdclark@gmail.com>
  Rob Millner <rlm@daterainc.com>
  Robert Jarzmik <robert.jarzmik@free.fr>
  Roberto Sassu <roberto.sassu@huawei.com>
  Roger Quadros <rogerq@ti.com>
  Ronnie Sahlberg <lsahlber@redhat.com>
  Russell King <rmk+kernel@armlinux.org.uk>
  Sasha Levin <alexander.levin@verizon.com>
  Sean Young <sean@mess.org>
  Shuah Khan <shuahkh@osg.samsung.com>
  Simon Horman <horms@verge.net.au>
  Stefan Haberland <sth@linux.vnet.ibm.com>
  Stefano Stabellini <stefano.stabellini@eu.citrix.com>
  Steffen Klassert <steffen.klassert@secunet.com>
  Steve French <smfrench@gmail.com>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  Sudip Mukherjee <sudipm.mukherjee@gmail.com>
  Sylwester Nawrocki <s.nawrocki@samsung.com>
  Takashi Iwai <tiwai@suse.de>
  Tejun Heo <tj@kernel.org>
  Theodore Ts'o <tytso@mit.edu>
  Thomas Gleixner <tglx@linutronix.de>
  Todd Fujinaka <todd.fujinaka@intel.com>
  Tony Lindgren <tony@atomide.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vincent Abriou <vincent.abriou@st.com>
  Vinod Koul <vinod.koul@intel.com>
  Vivien Didelot <vivien.didelot@savoirfairelinux.com>
  Volodymyr Bendiuga <volodymyr.bendiuga@gmail.com>
  Wei Zhou <chouryzhou@gmail.com>
  Weilong Chen <chenweilong@huawei.com>
  Will Deacon <will.deacon@arm.com>
  William wu <wulf@rock-chips.com>
  Wolfram Sang <wsa@the-dreams.de>
  Wright Feng <wright.feng@cypress.com>
  Xin Long <lucien.xin@gmail.com>
  Yang Sheng <yang.sheng@intel.com>
  Ye Yin <hustcat@gmail.com>
  Yuchung Cheng <ycheng@google.com>

jobs:
 build-amd64-xsm                                              broken  
 build-armhf-xsm                                              broken  
 build-i386-xsm                                               broken  
 build-amd64                                                  broken  
 build-armhf                                                  broken  
 build-i386                                                   broken  
 build-amd64-libvirt                                          blocked 
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            broken  
 build-armhf-pvops                                            broken  
 build-i386-pvops                                             broken  
 build-amd64-rumprun                                          blocked 
 build-i386-rumprun                                           blocked 
 test-amd64-amd64-xl                                          blocked 
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
 test-armhf-armhf-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  blocked 
 test-amd64-amd64-xl-xsm                                      blocked 
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
 test-armhf-armhf-xl-credit2                                  blocked 
 test-amd64-amd64-examine                                     blocked 
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
 test-amd64-i386-libvirt-qcow2                                blocked 
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

broken-job build-amd64 broken
broken-job build-i386 broken
broken-job build-armhf-pvops broken
broken-job build-i386-xsm broken
broken-job build-amd64-xsm broken
broken-job build-amd64-pvops broken
broken-job build-i386-pvops broken
broken-job build-armhf-xsm broken
broken-job build-armhf broken
broken-step build-armhf host-install(4)
broken-step build-armhf-pvops host-install(4)
broken-step build-armhf-xsm host-install(4)
broken-step build-i386-pvops host-install(4)
broken-step build-i386 host-install(4)
broken-step build-i386-xsm host-install(4)
broken-step build-amd64-xsm host-install(4)
broken-step build-amd64 host-install(4)
broken-step build-amd64-pvops host-install(4)

Push not applicable.

(No revision log; it would be 4189 lines long.)


--===============7932744403508948347==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7932744403508948347==--
