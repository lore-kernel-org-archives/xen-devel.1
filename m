From: osstest service owner <osstest-admin@xenproject.org>
Subject: [linux-4.9 test] 117160: regressions - FAIL
Date: Sat, 16 Dec 2017 13:45:22 +0000
Message-ID: <osstest-117160-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3117834732423480354=="
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

--===============3117834732423480354==
Content-Type: text/plain

flight 117160 linux-4.9 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/117160/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-libvirt-raw  6 xen-install              fail REGR. vs. 117119
 test-amd64-amd64-xl-qemut-ws16-amd64 16 guest-localmigrate/x10 fail REGR. vs. 117119

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 117119
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 117119
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 117119
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 117119
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 117119
 test-amd64-amd64-xl-pvhv2-amd 12 guest-start                  fail  never pass
 test-amd64-amd64-xl-pvhv2-intel 12 guest-start                 fail never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
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
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
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
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemut-win10-i386 10 windows-install         fail never pass
 test-amd64-amd64-xl-qemuu-win10-i386 10 windows-install        fail never pass
 test-amd64-amd64-xl-qemut-win10-i386 10 windows-install        fail never pass
 test-amd64-i386-xl-qemuu-win10-i386 10 windows-install         fail never pass

version targeted for testing:
 linux                c91efc7862b3f3c61cb76e926990cdbff5354b57
baseline version:
 linux                3781db07c79e7e4c5273c902f9c4718795866a1c

Last test of basis   117119  2017-12-13 21:24:53 Z    2 days
Testing same since   117160  2017-12-14 20:22:07 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alex Deucher <alexander.deucher@amd.com>
  Alex Williamson <alex.williamson@redhat.com>
  Alexey Kardashevskiy <aik@ozlabs.ru>
  Alexey Kodanev <alexey.kodanev@oracle.com>
  Andre Przywara <andre.przywara@arm.com>
  Andrew Banman <abanman@hpe.com>
  Andrew Honig <ahonig@google.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andy Lutomirski <luto@kernel.org>
  Anna Schumaker <Anna.Schumaker@Netapp.com>
  Ard Biesheuvel <ard.biesheuvel@linaro.org>
  Arend van Spriel <arend.vanspriel@broadcom.com>
  Arvind Yadav <arvind.yadav.cs@gmail.com>
  Ben Hutchings <ben.hutchings@codethink.co.uk>
  Blomme, Maarten <Maarten.Blomme@flir.com>
  Borislav Petkov <bp@suse.de>
  Chris Brandt <chris.brandt@renesas.com>
  Christian Borntraeger <borntraeger@de.ibm.com>
  Christoffer Dall <christoffer.dall@linaro.org>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Christophe Leroy <christophe.leroy@c-s.fr>
  Chuck Lever <chuck.lever@oracle.com>
  Cong Wang <xiyou.wangcong@gmail.com>
  Daniel Drake <drake@endlessm.com>
  Daniel Thompson <daniel.thompson@linaro.org>
  Darrick J. Wong <darrick.wong@oracle.com>
  Dave Hansen <dave.hansen@linux.intel.com>
  Dave Martin <Dave.Martin@arm.com>
  Dave Young <dyoung@redhat.com>
  David Daney <david.daney@cavium.com>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dick Kennedy <dick.kennedy@broadcom.com>
  Dmitry Safonov <dsafonov@virtuozzo.com>
  Doug Ledford <dledford@redhat.com>
  Eric Biggers <ebiggers@google.com>
  Eric Dumazet <edumazet@google.com>
  Fabian Grünbichler <f.gruenbichler@proxmox.com>
  Felipe Balbi <felipe.balbi@linux.intel.com>
  Florian Westphal <fw@strlen.de>
  Franck Demathieu <fdemathieu@gmail.com>
  Gavin Shan <gwshan@linux.vnet.ibm.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Hannes Frederic Sowa <hannes@stressinduktion.org>
  Heiko Carstens <heiko.carstens@de.ibm.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Himanshu Madhani <himanshu.madhani@cavium.com>
  Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
  Huacai Chen <chenhc@lemote.com>
  Ingo Molnar <mingo@kernel.org>
  Inki Dae <inki.dae@samsung.com>
  Jack Wang <jinpu.wang@profitbricks.com>
  Jaejoong Kim <climbbb.kim@gmail.com>
  James Smart <james.smart@broadcom.com>
  James Smart <jsmart2021@gmail.com>
  Jan Kara <jack@suse.cz>
  Janosch Frank <frankja@linux.vnet.ibm.com>
  Jason Baron <jbaron@akamai.com>
  Jason Wessel <jason.wessel@windriver.com>
  Jeff Mahoney <jeffm@suse.com>
  Jens Axboe <axboe@fb.com>
  Jens Axboe <axboe@kernel.dk>
  Jessica Yu <jeyu@redhat.com>
  Jim Mattson <jmattson@google.com>
  Jim Qu <Jim.Qu@amd.com>
  Jimmy Assarsson <jimmyassarsson@gmail.com>
  Jiri Kosina <jkosina@suse.cz>
  Joe Perches <joe@perches.com>
  Johan Hovold <johan@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  Johannes Thumshirn <jthumshirn@suse.de>
  John Keeping <john@metanate.com>
  Julia Lawall <Julia.Lawall@lip6.fr>
  Jérémy Lefaure <jeremy.lefaure@lse.epita.fr>
  K. Y. Srinivasan <kys@microsoft.com>
  Kalle Valo <kvalo@codeaurora.org>
  Kees Cook <keescook@chromium.org>
  Kim Phillips <kim.phillips@arm.com>
  Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
  Kristina Martsenko <kristina.martsenko@arm.com>
  Krzysztof Kozlowski <krzk@kernel.org>
  Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Ladislav Michl <ladis@linux-mips.org>
  Lai Jiangshan <jiangshanlai@gmail.com>
  Laurent Caumont <lcaumont2@gmail.com>
  Leon Romanovsky <leon@kernel.org>
  LEROY Christophe <christophe.leroy@c-s.fr>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Long Li <longli@microsoft.com>
  Maarten Blomme <Maarten.Blomme@flir.com>
  Majd Dibbiny <majd@mellanox.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marc Zyngier <marc.zyngier@arm.com>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Mark Bloch <markb@mellanox.com>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin Kelly <mkelly@xevo.com>
  Martin Schwidefsky <schwidefsky@de.ibm.com>
  Masahiro Yamada <yamada.masahiro@socionext.com>
  Mauro Carvalho Chehab <mchehab@s-opensource.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Ellerman <mpe@ellerman.id.au> (powerpc)
  Michael S. Tsirkin <mst@redhat.com>
  Michal Hocko <mhocko@suse.com>
  Michal Schmidt <mschmidt@redhat.com>
  Mike Travis <mike.travis@hpe.com>
  Minchan Kim <minchan@kernel.org>
  Ming Lei <ming.lei@redhat.com>
  Ming Lei <tom.leiming@gmail.com>
  Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
  Neil Horman <nhorman@tuxdriver.com>
  Nicholas Piggin <npiggin@gmail.com>
  Nick Desaulniers <ndesaulniers@google.com>
  Oliver Stäbler <oliver.staebler@bytesatwork.ch>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Pan Bian <bianpan2016@163.com>
  Paul E. McKenney <paulmck@linux.vnet.ibm.com>
  Paul Mackerras <paulus@ozlabs.org>
  Paul Meyer <Paul.Meyer@microsoft.com>
  Pavel Tatashin <pasha.tatashin@oracle.com>
  Pawel Moll <pawel.moll@arm.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Petr Cvek <petr.cvek@tul.cz>
  Phil Reid <preid@electromag.com.au>
  Radim Krčmář <rkrcmar@redhat.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Randy Dunlap <rdunlap@infradead.org>
  Raz Manor <Raz.Manor@valens.com>
  Rob Herring <robh@kernel.org>
  Robb Glasser <rglasser@google.com>
  Robert Jarzmik <robert.jarzmik@free.fr>
  Robin Murphy <robin.murphy@arm.com>
  Roger Quadros <rogerq@ti.com>
  Russell King <rmk+kernel@armlinux.org.uk>
  Sachin Sant <sachinp@linux.vnet.ibm.com>
  Sasha Levin <alexander.levin@verizon.com>
  Scott Branden <scott.branden@broadcom.com>
  Sean Young <sean@mess.org>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
  Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
  Shile Zhang <shile.zhang@nokia.com>
  Simon Horman <horms+renesas@verge.net.au>
  Sowmini Varadhan <sowmini.varadhan@oracle.com>
  Steffen Klassert <steffen.klassert@secunet.com>
  Stephen Bates <sbates@raithlin.com>
  Stephen Boyd <sboyd@codeaurora.org>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Takashi Iwai <tiwai@suse.de>
  Tejun Heo <tj@kernel.org>
  Thomas Falcon <tlfalcon@linux.vnet.ibm.com>
  Thomas Gleixner <tglx@linutronix.de>
  Tony Lindgren <tony@atomide.com>
  Trond Myklebust <trond.myklebust@primarydata.com>
  Vlastimil Babka <vbabka@suse.cz>
  WANG Cong <xiyou.wangcong@gmail.com>
  Wanpeng Li <wanpeng.li@hotmail.com>
  weiping zhang <zhangweiping@didichuxing.com>
  weiping zhang <zwp10758@gmail.com>
  Will Deacon <will.deacon@arm.com>
  William Breathitt Gray <vilhelm.gray@gmail.com>
  Wolfram Sang <wsa@the-dreams.de>
  Xin Long <lucien.xin@gmail.com>
  Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

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
 test-armhf-armhf-libvirt-raw                                 fail    
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

(No revision log; it would be 4329 lines long.)


--===============3117834732423480354==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3117834732423480354==--
