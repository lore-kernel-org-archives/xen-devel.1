From: osstest service owner <osstest-admin@xenproject.org>
Subject: [linux-4.9 test] 121052: regressions - FAIL
Date: Sat, 24 Mar 2018 02:32:15 +0000
Message-ID: <osstest-121052-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8449053810570931753=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gnrh=go=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1ezYyk-0002NU-2D
 for xen-devel@lists.xenproject.org; Sat, 24 Mar 2018 02:32:22 +0000
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

--===============8449053810570931753==
Content-Type: text/plain

flight 121052 linux-4.9 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/121052/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-arndale   5 host-ping-check-native   fail REGR. vs. 120913

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds    16 guest-start/debian.repeat fail REGR. vs. 120913

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 120913
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 120913
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 120913
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 120913
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 120913
 test-amd64-amd64-xl-pvhv2-intel 12 guest-start                 fail never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-xl-pvhv2-amd 12 guest-start                  fail  never pass
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-xsm      13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemut-win10-i386 10 windows-install        fail never pass
 test-amd64-amd64-xl-qemuu-win10-i386 10 windows-install        fail never pass
 test-amd64-i386-xl-qemuu-win10-i386 10 windows-install         fail never pass
 test-amd64-i386-xl-qemut-win10-i386 10 windows-install         fail never pass

version targeted for testing:
 linux                a779add58a837fbd5156e0fab0aca5e3b53754ef
baseline version:
 linux                46e076f0dad02f5c445a5c27adbd3f06147e33ed

Last test of basis   120913  2018-03-18 11:32:38 Z    5 days
Testing same since   121052  2018-03-22 08:44:51 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Eric W. Biederman" <ebiederm@xmission.com>
  Aaron Salter <aaron.k.salter@intel.com>
  Adiel Aloni <adiel.aloni@intel.com>
  Akinobu Mita <akinobu.mita@gmail.com>
  Al Cooper <alcooperx@gmail.com>
  Al Viro <viro@zeniv.linux.org.uk>
  Alan Stern <stern@rowland.harvard.edu>
  Aleksandar Markovic <aleksandar.markovic@imgtec.com>
  Aleksandar Markovic <aleksandar.markovic@imgtech.com>
  Aleksey Makarov <aleksey.makarov@cavium.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Williamson <alex.williamson@redhat.com>
  Alexander Duyck <alexander.h.duyck@intel.com>
  Alexander Potapenko <glider@google.com>
  Alexander Sergeyev <sergeev917@gmail.com>
  Alexey Kardashevskiy <aik@ozlabs.ru>
  Andreas Pape <apape@phoenixcontact.com>
  Andrei Vagin <avagin@openvz.org>
  Andrew Bowers <andrewx.bowers@intel.com>
  Andrew F. Davis <afd@ti.com>
  Andrew Lunn <andrew@lunn.ch>
  Andrey Rusalin <arusalin@dev.rtsoft.ru>
  Andrey Vagin <avagin@openvz.org>
  Andy Lutomirski <luto@kernel.org>
  Andy Whitcroft <apw@canonical.com>
  Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
  Anton Blanchard <anton@samba.org>
  Anton Sviridenko <anton@corp.bluecherry.net>
  Ard Biesheuvel <ard.biesheuvel@linaro.org>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Arvind Yadav <arvind.yadav.cs@gmail.com>
  Axel Lin <axel.lin@ingics.com>
  Bart Van Assche <bart.vanassche@wdc.com>
  Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
  Baruch Siach <baruch@tkos.co.il>
  Ben Greear <greearb@candelatech.com>
  Benjamin Tissoires <benjamin.tissoires@redhat.com>
  Bill Kuzeja <william.kuzeja@stratus.com>
  Bjorn Andersson <bjorn.andersson@linaro.org>
  Bjorn Helgaas <bhelgaas@google.com>
  Boris Brezillon <boris.brezillon@free-electrons.com>
  Borislav Petkov <bp@suse.de>
  Brian King <brking@linux.vnet.ibm.com>
  Changbin Du <changbin.du@intel.com>
  Chen-Yu Tsai <wens@csie.org>
  Chris Brandt <chris.brandt@renesas.com>
  Chris Clayton <chris2553@googlemail.com>
  Chris Wilson <chris@chris-wilson.co.uk>
  Christian König <christian.koenig@amd.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Christopher James Halse Rogers <christopher.halse.rogers@canonical.com>
  cjacob <cjacob@caviumnetworks.com>
  Colin Ian King <colin.king@canonical.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  David Carrillo-Cisneros <davidcc@google.com>
  David Daney <david.daney@cavium.com>
  David Engraf <david.engraf@sysgo.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Davide Caratti <dcaratti@redhat.com>
  Davidlohr Bueso <dave@stgolabs.net>
  Davidlohr Bueso <dbueso@suse.de>
  Dean Jenkins <Dean_Jenkins@mentor.com>
  Dedy Lansky <qca_dlansky@qca.qualcomm.com>
  Dennis Dalessandro <dennis.dalessandro@intel.com>
  Dmitry Safonov <dsafonov@virtuozzo.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Dmitry Vyukov <dvyukov@google.com>
  Doug Ledford <dledford@redhat.com>
  Douglas Gilbert <dgilbert@interlog.com>
  Easwar Hariharan <easwar.hariharan@intel.com>
  Emmanuel Grumbach <emmanuel.grumbach@intel.com>
  Eric Dumazet <edumazet@google.com>
  Eric W. Biederman <ebiederm@xmission.com>
  Felipe Balbi <felipe.balbi@linux.intel.com>
  Felix Kuehling <Felix.Kuehling@amd.com>
  Felix Manlunas <felix.manlunas@cavium.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Fugang Duan <B38611@freescale.com>
  Fugang Duan <fugang.duan@nxp.com>
  Gabriel Krisman Bertazi <krisman@collabora.co.uk>
  Ganapathi Bhat <gbhat@marvell.com>
  Gao Feng <fgao@ikuai8.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Gerd Hoffmann <kraxel@redhat.com>
  Greg KH <gregkh@linuxfoundation.org>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guennadi Liakhovetski <g.liakhovetski@gmx.de>
  Guenter Roeck <linux@roeck-us.net>
  H. Nikolaus Schaller <hns@goldelico.com>
  Hamad Kadmany <qca_hkadmany@qca.qualcomm.com>
  Hannes Reinecke <hare@suse.com>
  Hannes Reinecke <hare@suse.de>
  Hans de Goede <hdegoede@redhat.com>
  Hans van Kranenburg <hans.van.kranenburg@mendix.com>
  Hans Verkuil <hans.verkuil@cisco.com>
  Heiko Carstens <heiko.carstens@de.ibm.com>
  Helge Deller <deller@gmx.de>
  Himanshu Madhani <himanshu.madhani@cavium.com>
  Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
  Hou Tao <houtao1@huawei.com>
  Ian Kent <raven@themaw.net>
  Ingo Molnar <mingo@kernel.org>
  Iyappan Subramanian <isubramanian@apm.com>
  Jaegeuk Kim <jaegeuk@kernel.org>
  Jagdish Gediya <jagdish.gediya@nxp.com>
  James Morris <james.l.morris@oracle.com>
  Jan Kara <jack@suse.cz>
  Jani Nikula <jani.nikula@intel.com>
  Janusz Krzysztofik <jmkrzyszt@gmail.com>
  Jason L Tibbitts III <tibbs@math.uh.edu>
  Jason Ozolins <jason.ozolins@hpe.com>
  Javier Martinez Canillas <javier@osg.samsung.com>
  Jayachandran C <jnair@caviumnetworks.com>
  Jeff Kirsher <jeffrey.t.kirsher@intel.com>
  Jeffy Chen <jeffy.chen@rock-chips.com>
  Jens Axboe <axboe@fb.com>
  Jeremy Linton <jeremy.linton@arm.com>
  Jerome Brunet <jbrunet@baylibre.com>
  Jiada Wang <jiada_wang@mentor.com>
  Jim Mattson <jmattson@google.com>
  Jin Yao <yao.jin@linux.intel.com>
  Jiri Kosina <jkosina@suse.cz>
  Jiri Olsa <jolsa@kernel.org>
  Jiri Olsa <jolsa@redhat.com>
  Jitendra Bhivare <jitendra.bhivare@broadcom.com>
  Joerg Roedel <jroedel@suse.de>
  Johan Hovold <johan@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  Johannes Thumshirn <jthumshirn@suse.de>
  John David Anglin <dave.anglin@bell.net>
  John Johansen <john.johansen@canonical.com>
  John Stultz <john.stultz@linaro.org>
  John Youn <johnyoun@synopsys.com>
  Jon Mason <jon.mason@broadcom.com>
  Jonas Jensen <jonas.jensen@gmail.com>
  Josh Poimboeuf <jpoimboe@redhat.com>
  Jukka Rissanen <jukka.rissanen@linux.intel.com>
  Julien BOIBESSOT <julien.boibessot@armadeus.com>
  K. Y. Srinivasan <kys@microsoft.com>
  Kalle Valo <kvalo@codeaurora.org>
  Kalle Valo <kvalo@qca.qualcomm.com>
  Kees Cook <keescook@chromium.org>
  Kefeng Wang <wangkefeng.wang@huawei.com>
  Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
  Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
  Krishneil Singh <krishneil.k.singh@intel.com>
  Krzysztof Kozlowski <krzk@kernel.org>
  Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Laxman Dewangan <ldewangan@nvidia.com>
  Lee Jones <lee.jones@linaro.org>
  Leonid Yegoshin <leonid.yegoshin@imgtec.com>
  Li Dongyang <dongyang.li@anu.edu.au>
  Liam Beguin <lbeguin@tycoint.com>
  Lihong Yang <lihong.yang@intel.com>
  Limin Zhu <liminzhu@marvell.com>
  Linus Walleij <linus.walleij@linaro.org>
  lipeng <lipeng321@huawei.com>
  Long Li <longli@microsoft.com>
  Lorenzo Colitti <lorenzo@google.com>
  Lubomir Rintel <lkundrak@v3.sk>
  Luca Coelho <luciano.coelho@intel.com>
  Lucas Stach <l.stach@pengutronix.de>
  Luis R. Rodriguez <mcgrof@kernel.org>
  Mahesh Bandewar <maheshb@google.com>
  Manikanta Pubbisetty <mpubbise@qti.qualcomm.com>
  Manish Jaggi <mjaggi@cavium.com>
  Manish Jaggi <mjaggi@caviumnetworks.com>
  Marc Zyngier <marc.zyngier@arm.com>
  Marcel Holtmann <marcel@holtmann.org>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin Schwidefsky <schwidefsky@de.ibm.com>
  Masami Hiramatsu <mhiramat@kernel.org>
  Mathieu Poirier <mathieu.poirier@linaro.org>
  Matthias Kaehlcke <mka@chromium.org>
  Mauricio Faria de Oliveira <mauricfo@linux.vnet.ibm.com>
  Mauro Carvalho Chehab <mchehab@s-opensource.com>
  Maxime Ripard <maxime.ripard@free-electrons.com>
  Maya Erez <qca_merez@qca.qualcomm.com>
  Michael Chan <michael.chan@broadcom.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Hennerich <michael.hennerich@analog.com>
  Michael Scott <michael.scott@linaro.org>
  Michael Turquette <mturquette@baylibre.com>
  Michal Kalderon <Michal.Kalderon@cavium.com>
  Michel Dänzer <michel.daenzer@amd.com>
  Mike Leach <mike.leach@linaro.org>
  Mimi Zohar <zohar@linux.vnet.ibm.com>
  Mintz, Yuval <Yuval.Mintz@cavium.com>
  Miodrag Dinic <miodrag.dinic@imgtech.com>
  Miquel Raynal <miquel.raynal@free-electrons.com>
  Mitch Williams <mitch.a.williams@intel.com>
  Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
  Nate Watterson <nwatters@codeaurora.org>
  Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
  NeilBrown <neilb@suse.com>
  Nicolai Hähnle <nicolai.haehnle@amd.com>
  Nik Unger <njunger@uwaterloo.ca>
  Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Nikolay Borisov <nborisov@suse.com>
  Oded Gabbay <oded.gabbay@gmail.com>
  Oliver Neukum <oneukum@suse.com>
  Olof Johansson <olof@lixom.net>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul E. McKenney <paulmck@linux.vnet.ibm.com>
  Paul Moore <paul@paul-moore.com>
  Pavel Machek <pavel@ucw.cz>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Petr Mladek <pmladek@suse.com>
  Phil Turnbull <phil.turnbull@oracle.com>
  Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
  Prarit Bhargava <prarit@redhat.com>
  Quan Nguyen <qnguyen@apm.com>
  Radim Krčmář <rkrcmar@redhat.com>
  Rajendra Nayak <rnayak@codeaurora.org>
  Ralf Baechle <ralf@linux-mips.org>
  Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
  Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
  Rob Herring <robh@kernel.org>
  Salil <salil.mehta@huawei.com>
  Salil Mehta <salil.mehta@huawei.com>
  Samuel Ortiz <sameo@linux.intel.com>
  Samuel Pitoiset <samuel.pitoiset@gmail.com>
  Samuel Thibault <samuel.thibault@ens-lyon.org>
  Sasha Levin <alexander.levin@microsoft.com>
  Satanand Burla <satananda.burla@cavium.com>
  Satish Kharat <satishkh@cisco.com>
  Sean Paul <seanpaul@chromium.org>
  Sebastian Reichel <sebastian.reichel@collabora.co.uk>
  SeongJae Park <sj38.park@gmail.com>
  Sesidhar Baddela <sebaddel@cisco.com>
  Shaohua Li <shli@fb.com>
  Shikhar Dogra <shidogra@cisco.com>
  Shuah Khan <shuahkh@osg.samsung.com>
  Simon Horman <horms+renesas@verge.net.au>
  Simon Shields <simon@lineageos.org>
  Simon Wunderlich <sw@simonwunderlich.de>
  Sinclair Yeh <syeh@vmware.com>
  Srinath Mannam <srinath.mannam@broadcom.com>
  Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  Stefan Schmidt <stefan@osg.samsung.com>
  Stefan Wahren <stefan.wahren@i2se.com>
  Steffen Klassert <steffen.klassert@secunet.com>
  Stephane Eranian <eranian@google.com>
  Stephen Boyd <sboyd@codeaurora.org>
  Stephen Hemminger <stephen@networkplumber.org>
  Stephen Hemminger <sthemmin@microsoft.com>
  Steve Lin <steven.lin1@broadcom.com>
  Subhransu S. Prusty <subhransu.s.prusty@intel.com>
  Sunil Goutham <sgoutham@cavium.com>
  Sven Eckelmann <sven@narfation.org>
  Sylvain Lemieux <slemieux@tycoint.com>
  Taeung Song <treeze.taeung@gmail.com>
  Takashi Iwai <tiwai@suse.de>
  Takashi Sakamoto <o-takashi@sakamocchi.jp>
  Tejun Heo <tj@kernel.org>
  Thierry Reding <thierry.reding@gmail.com>
  Thierry Reding <treding@nvidia.com>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thinh Nguyen <thinhn@synopsys.com>
  Thomas Bogendoerfer <tbogendoerfer@suse.de>
  Thomas Gleixner <tglx@linutronix.de>
  Thor Thayer <thor.thayer@linux.intel.com>
  Tobias Jordan <Tobias.Jordan@elektrobit.com>
  Tobias Klauser <tklauser@distanz.ch>
  Tom Hromatka <tom.hromatka@oracle.com>
  Tomasz Kramkowski <tk@the-tk.com>
  Tommi Rantala <tommi.t.rantala@nokia.com>
  Tony Lindgren <tony@atomide.com>
  Tony Luck <tony.luck@intel.com>
  Toshi Kani <toshi.kani@hpe.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Valtteri Heikkilä <rnd@nic.fi>
  Varsha Rao <rvarsha016@gmail.com>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Vincent Stehlé <vincent.stehle@laposte.net>
  Vinod Koul <vinod.koul@intel.com>
  Wei Yongjun <weiyongjun1@huawei.com>
  Wendy Xiong <wenxiong@linux.vnet.ibm.com>
  Will Deacon <will.deacon@arm.com>
  Xingyu Chen <xingyu.chen@amlogic.com>
  Xinming Hu <huxm@marvell.com>
  Xose Vazquez Perez <xose.vazquez@gmail.com>
  Xunlei Pang <xlpang@redhat.com>
  Yao Jin <yao.jin@linux.intel.com>
  Yazen Ghannam <Yazen.Ghannam@amd.com>
  Yixun Lan <yixun.lan@amlogic.com>
  Yong Zhao <yong.zhao@amd.com>
  Yuval Mintz <Yuval.Mintz@cavium.com>
  Yuyang Du <yuyang.du@intel.com>
  Zhilong Liu <zlliu@suse.com>

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
 test-armhf-armhf-xl-arndale                                  fail    
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
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
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


Not pushing.

(No revision log; it would be 7291 lines long.)


--===============8449053810570931753==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8449053810570931753==--
