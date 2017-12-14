From: osstest service owner <osstest-admin@xenproject.org>
Subject: [linux-4.9 test] 117119: tolerable FAIL - PUSHED
Date: Thu, 14 Dec 2017 20:04:24 +0000
Message-ID: <osstest-117119-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7166458418418589414=="
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

--===============7166458418418589414==
Content-Type: text/plain

flight 117119 linux-4.9 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/117119/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 117011
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 117011
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 117011
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 117011
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 117011
 test-amd64-amd64-xl-pvhv2-amd 12 guest-start                  fail  never pass
 test-amd64-amd64-xl-pvhv2-intel 12 guest-start                 fail never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-xsm      13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemut-win10-i386 10 windows-install         fail never pass
 test-amd64-amd64-xl-qemut-win10-i386 10 windows-install        fail never pass
 test-amd64-amd64-xl-qemuu-win10-i386 10 windows-install        fail never pass
 test-amd64-i386-xl-qemuu-win10-i386 10 windows-install         fail never pass

version targeted for testing:
 linux                3781db07c79e7e4c5273c902f9c4718795866a1c
baseline version:
 linux                284bbc782445283e9a5124666dda8010f379f179

Last test of basis   117011  2017-12-08 18:54:15 Z    6 days
Testing same since   117041  2017-12-09 21:26:02 Z    4 days    7 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Eric W. Biederman" <ebiederm@xmission.com>
  Aaro Koskinen <aaro.koskinen@iki.fi>
  Aaron Sierra <asierra@xes-inc.com>
  Adam Ford <aford173@gmail.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Al Viro <viro@ZenIV.linux.org.uk>
  Alan Stern <stern@rowland.harvard.edu>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Williamson <alex.williamson@redhat.com>
  Alexey Kardashevskiy <aik@ozlabs.ru>
  Alexey Khoroshilov <khoroshilov@ispras.ru>
  Andreas Schultz <aschultz@tpip.net>
  Andrew Morton <akpm@linux-foundation.org>
  Andrzej Hajda <a.hajda@samsung.com>
  Andy Lutomirski <luto@kernel.org>
  Angelo Dureghello <angelo@sysam.it>
  Ariel Elior <Ariel.Elior@cavium.com>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Balbir Singh <bsingharora@gmail.com>
  Bart Van Assche <bart.vanassche@sandisk.com>
  Ben Hutchings <ben@decadent.org.uk>
  Benjamin Coddington <bcodding@redhat.com>
  Bjorn Andersson <bjorn.andersson@linaro.org>
  Borislav Petkov <bp@suse.de>
  Boshi Wang <wangboshi@huawei.com>
  Bryan O'Donoghue <pure.logic@nexus-software.ie>
  Chris Wilson <chris@chris-wilson.co.uk>
  Christian Borntraeger <borntraeger@de.ibm.com>
  Christian König <christian.koenig@amd.com>
  Christoffer Dall <christoffer.dall@linaro.org>
  Colin Ian King <colin.king@canonical.com>
  Coly Li <colyli@suse.de>
  Dan Carpenter <dan.carpenter@oracle.com>
  Dan Williams <dan.j.williams@intel.com>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Daniel Vetter <daniel.vetter@intel.com>
  Dave Forster <dforster@brocade.com>
  Dave Hansen <dave.hansen@linux.intel.com>
  David Forster <dforster@brocade.com>
  David Rientjes <rientjes@google.com>
  David S. Miller <davem@davemloft.net>
  Dirk Behme <dirk.behme@de.bosch.com>
  Dominik Behr <dbehr@chromium.org>
  Doug Ledford <dledford@redhat.com>
  Eric Dumazet <edumazet@google.com>
  Eric W. Biederman <ebiederm@xmission.com>
  Fan Ning <fanning4@hisilicon.com>
  Felipe Balbi <felipe.balbi@linux.intel.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Fugang Duan <fugang.duan@nxp.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Greg Ungerer <gerg@linux-m68k.org>
  Guenter Roeck <linux@roeck-us.net>
  Guillaume Nault <g.nault@alphalink.fr>
  Gustavo A. R. Silva <garsilva@embeddedor.com>
  Gustavo Padovan <gustavo.padovan@collabora.co.uk>
  Gustavo Padovan <gustavo.padovan@collabora.com>
  Hans de Goede <hdegoede@redhat.com>
  Hans Verkuil <hans.verkuil@cisco.com>
  Hans Verkuil <hverkuil@xs4all.nl>
  Harald Welte <laforge@netfilter.org>
  Heiko Carstens <heiko.carstens@de.ibm.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Himanshu Madhani <himanshu.madhani@cavium.com>
  Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
  Horia Geantă <horia.geanta@nxp.com>
  Hua Rui <huarui.dev@gmail.com>
  Iago Abal <mail@iagoabal.eu>
  Ingo Molnar <mingo@kernel.org>
  Inki Dae <inki.dae@samsung.com>
  Ivan Vecera <cera@cera.cz>
  Jan Kara <jack@suse.cz>
  Jason Baron <jbaron@akamai.com>
  Jens Axboe <axboe@kernel.dk>
  Jibin Xu <jibin.xu@windriver.com>
  Jiri Olsa <jolsa@kernel.org>
  Johan Hovold <johan@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  John Thompson <thompa.atl@gmail.com>
  Jon Maloy <jon.maloy@ericsson.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Joonyoung Shim <jy0922.shim@samsung.com>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
  Kevin Hao <haokexin@gmail.com>
  Ladislav Michl <ladis@linux-mips.org>
  Lars-Peter Clausen <lars@metafoo.de>
  Li Rui <lirui39@hisilicon.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Luis Ressel <aranea@aixah.de>
  Lukas Wunner <lukas@wunner.de>
  M'boumba Cedric Madianga <cedric.madianga@gmail.com>
  Marc Zyngier <marc.zyngier@arm.com>
  Mark Brown <broonie@kernel.org>
  Mart van Santen <mart@greenhost.nl>
  Martin Schwidefsky <schwidefsky@de.ibm.com>
  Masakazu Mokuno <masakazu.mokuno@gmail.com>
  Masami Hiramatsu <mhiramat@kernel.org>
  Mateusz Berezecki <mateuszb@fastmail.fm>
  Mathias Nyman <mathias.nyman@linux.intel.com>
  Matt Wilson <msw@amazon.com>
  Mauro Carvalho Chehab <mchehab@s-opensource.com>
  Mel Gorman <mgorman@suse.de>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Lyle <mlyle@lyle.org>
  Michal Hocko <mhocko@suse.com>
  Michal Kalderon <Michal.Kalderon@cavium.com>
  Michal Kazior <michal.kazior@tieto.com>
  Mike Looijmans <mike.looijmans@topic.nl>
  Mimi Zohar <zohar@linux.vnet.ibm.com>
  Oliver Neukum <oneukum@suse.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Parthasarathy Bhuvaragan <parthasarathy.bhuvaragan@ericsson.com>
  Peter Ujfalusi <peter.ujfalusi@ti.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
  Quinn Tran <quinn.tran@cavium.com>
  Ram Amrani <Ram.Amrani@cavium.com>
  Rex Zhu <Rex.Zhu@amd.com>
  Reza Arbab <arbab@linux.vnet.ibm.com>
  Ross Lagerwall <ross.lagerwall@citrix.com>
  Roy Shterman <roys@lightbitslabs.com>
  Rui Hua <huarui.dev@gmail.com>
  Rui Sousa <rui.sousa@nxp.com>
  Sagi Grimberg <sagi@grimberg.me>
  Sasha Levin <alexander.levin@verizon.com>
  Sean Nyekjaer <sean.nyekjaer@prevas.dk>
  Sean Paul <seanpaul@chromium.org>
  Sebastian Ott <sebott@linux.vnet.ibm.com>
  Sebastian Sjoholm <ssjoholm@mac.com>
  Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
  Shuah Khan <shuahkh@osg.samsung.com>
  Simon Horman <horms+renesas@verge.net.au>
  Slava Shwartsman <slavash@mellanox.com>
  Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>
  Stefan Agner <stefan@agner.ch>
  Stephen Boyd <sboyd@codeaurora.org>
  Subhash Jadavani <subhashj@codeaurora.org>
  Sumit Semwal <sumit.semwal@linaro.org>
  Tariq Toukan <tariqt@mellanox.com>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Richter <tmricht@linux.vnet.ibm.com>
  Thomas-Mich Richter <tmricht@linux.vnet.ibm.com>
  Tony Lindgren <tony@atomide.com>
  Trond Myklebust <trond.myklebust@primarydata.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Varun Prakash <varun@chelsio.com>
  Vijay Viswanath <vviswana@codeaurora.org>
  Vincent <vincent.stehle@laposte.net>
  Vincent Pelletier <plr.vincent@gmail.com>
  Vincent Stehlé <vincent.stehle@laposte.net>
  Vinod Koul <vinod.koul@intel.com>
  Vitaly Kuznetsov <vkuznets@redhat.com>
  Vlad Tsyrklevich <vlad@tsyrklevich.net>
  Wang Nan <wangnan0@huawei.com>
  Wolfram Sang <wsa@the-dreams.de>
  Xiangliang Yu <Xiangliang.Yu@amd.com>
  yangdi <yangdi10@hisilicon.com>
  Ying Xue <ying.xue@windriver.com>
  Yu Chen <chenyu56@huawei.com>

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

To osstest@xenbits.xen.org:/home/xen/git/linux-pvops.git
   284bbc7..3781db0  3781db07c79e7e4c5273c902f9c4718795866a1c -> tested/linux-4.9


--===============7166458418418589414==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7166458418418589414==--
