From: osstest service owner <osstest-admin@xenproject.org>
Subject: [linux-4.1 test] 117197: tolerable FAIL - PUSHED
Date: Sun, 17 Dec 2017 10:52:21 +0000
Message-ID: <osstest-117197-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3832933243454729962=="
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

--===============3832933243454729962==
Content-Type: text/plain

flight 117197 linux-4.1 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/117197/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 117118
 test-armhf-armhf-libvirt-xsm 14 saverestore-support-check    fail  like 117118
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 117118
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 117118
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 117118
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 117118
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop             fail like 117118
 test-amd64-amd64-xl-pvhv2-intel 12 guest-start                 fail never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-xl-pvhv2-amd 12 guest-start                  fail  never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-arm64-arm64-examine      8 reboot                       fail   never pass
 test-arm64-arm64-xl           7 xen-boot                     fail   never pass
 test-arm64-arm64-xl-xsm       7 xen-boot                     fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm  7 xen-boot                     fail   never pass
 test-arm64-arm64-xl-credit2   7 xen-boot                     fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-armhf-armhf-xl-xsm      13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop             fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemuu-win10-i386 10 windows-install        fail never pass
 test-amd64-amd64-xl-qemut-win10-i386 10 windows-install        fail never pass
 test-amd64-i386-xl-qemuu-win10-i386 10 windows-install         fail never pass
 test-amd64-i386-xl-qemut-win10-i386 10 windows-install         fail never pass

version targeted for testing:
 linux                0199619b21f7320482e8a2db14cf8bc974a7766a
baseline version:
 linux                c3f4bb14a264a96c2709b026dca37a4eb252a82a

Last test of basis   117118  2017-12-13 19:47:27 Z    3 days
Testing same since   117197  2017-12-15 20:20:02 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaron Brown <aaron.f.brown@intel.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Al Viro <viro@zeniv.linux.org.uk>
  Andreas Rohner <andreas.rohner@gmx.net>
  Andrew Bowers <andrewx.bowers@intel.com>
  Andrew Elble <aweits@rit.edu>
  Andrew Morton <akpm@linux-foundation.org>
  Andrey Konovalov <andreyknvl@google.com>
  Anna Schumaker <Anna.Schumaker@Netapp.com>
  Arnd Bergmann <arnd@arndb.de>
  Bart Van Assche <bart.vanassche@wdc.com>
  Bartosz Golaszewski <brgl@bgdev.pl>
  Benjamin Poirier <bpoirier@suse.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Boris Brezillon <boris.brezillon@free-electrons.com>
  Borislav Petkov <bp@suse.de>
  Brent Taylor <motobud@gmail.com>
  Brian King <brking@linux.vnet.ibm.com>
  chenjie <chenjie6@huawei.com>
  Christian Lamparter <chunkeey@googlemail.com>
  Chuck Lever <chuck.lever@oracle.com>
  Claudio Imbrenda <imbrenda@linux.vnet.ibm.com>
  Colin Ian King <colin.king@canonical.com>
  Coly Li <colyli@suse.de>
  Cong Wang <xiyou.wangcong@gmail.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Daniel Vetter <daniel.vetter@intel.com>
  David Ahern <dsahern@gmail.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Doug Ledford <dledford@redhat.com>
  Eric Biggers <ebiggers@google.com>
  Florian Westphal <fw@strlen.de>
  Gabriele Mazzotta <gabriele.mzt@gmail.com>
  guoxuenan <guoxuenan@huawei.com>
  Hans Verkuil <hans.verkuil@cisco.com>
  Heiko Carstens <heiko.carstens@de.ibm.com>
  Heiner Kallweit <hkallweit1@gmail.com>
  Helge Deller <deller@gmx.de>
  Henrik Eriksson <henrik.eriksson@axis.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hou Tao <houtao1@huawei.com>
  Huacai Chen <chenhc@lemote.com>
  Ian Kent <raven@themaw.net>
  Ingo Molnar <mingo@kernel.org>
  J. Bruce Fields <bfields@redhat.com>
  James Hogan <jhogan@kernel.org>
  Jan Kara <jack@suse.cz>
  Jeff Kirsher <jeffrey.t.kirsher@intel.com>
  Jens Axboe <axboe@kernel.dk>
  Jesse Brandeburg <jesse.brandeburg@intel.com>
  Johan Hovold <johan@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  John Crispin <john@phrozen.org>
  John David Anglin <dave.anglin@bell.net>
  Jonathan Cameron <jic23@kernel.org>
  Jonathan Liu <net147@gmail.com>
  Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
  Josef Bacik <jbacik@fb.com>
  Joshua Watt <JPEWhacker@gmail.com>
  Juergen Gross <jgross@suse.com>
  Kalle Valo <kvalo@qca.qualcomm.com>
  Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
  Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
  Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Ladi Prosek <lprosek@redhat.com>
  Laura Abbott <labbott@redhat.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Liran Alon <liran.alon@oracle.com>
  Maciej W. Rozycki <macro@mips.com>
  Mark Brown <broonie@kernel.org>
  Martin Schwidefsky <schwidefsky@de.ibm.com>
  Masami Hiramatsu <mhiramat@kernel.org>
  Masashi Honma <masashi.honma@gmail.com>
  Mathias Kresin <dev@kresin.me>
  Matt Fleming <matt@codeblueprint.co.uk>
  Mauro Carvalho Chehab <mchehab@osg.samsung.com>
  Mauro Carvalho Chehab <mchehab@s-opensource.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Lyle <mlyle@lyle.org>
  Michal Hocko <mhocko@suse.com>
  Michele Baldessari <michele@acksyn.org>
  Mike Snitzer <snitzer@redhat.com>
  Milan Stephan <milan.stephan+linux@fau.de>
  Mirko Parthey <mirko.parthey@web.de>
  Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
  Neil Dick <neil@cog.systems>
  NeilBrown <neilb@suse.com>
  Nicholas Bellinger <nab@linux-iscsi.org>
  Nick Sarnie <commendsarnex@gmail.com>
  Nishanth Menon <nm@ti.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Pan Bian <bianpan2016@163.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul E. McKenney <paulmck@linux.vnet.ibm.com>
  Peter Ujfalusi <peter.ujfalusi@ti.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Philip Derrin <philip@cog.systems>
  Radim Krčmář <rkrcmar@redhat.com>
  Rameshwar Prasad Sahu <rsahu@apm.com>
  Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
  Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
  Russell King <rmk+kernel@armlinux.org.uk>
  Ryan Hsu <ryanhsu@qca.qualcomm.com>
  Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>
  Sai Praneeth <sai.praneeth.prakhya@intel.com>
  Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
  Samuel Ortiz <sameo@linux.intel.com>
  Santosh Shilimkar <santosh.shilimkar@oracle.com>
  Sasha Levin <alexander.levin@verizon.com>
  Sean Young <sean@mess.org>
  Steffen Klassert <steffen.klassert@secunet.com>
  Stephen Boyd <sboyd@codeaurora.org>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Takashi Iwai <tiwai@suse.de>
  Tejun Heo <tj@kernel.org>
  Theodore Ts'o <tytso@mit.edu>
  Thierry Reding <treding@nvidia.com>
  Thomas Preisner <thomas.preisner+linux@fau.de>
  Tom Herbert <tom@herbertland.com>
  Trond Myklebust <trond.myklebust@primarydata.com>
  Tuomas Tynkkynen <tuomas@tuxera.com>
  Tyler Hicks <tyhicks@canonical.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Vasily Gorbik <gor@linux.vnet.ibm.com>
  Vijendar Mukunda <Vijendar.Mukunda@amd.com>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  WANG Cong <xiyou.wangcong@gmail.com>

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
 test-arm64-arm64-xl                                          fail    
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
 test-arm64-arm64-libvirt-xsm                                 fail    
 test-armhf-armhf-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      fail    
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
 test-arm64-arm64-xl-credit2                                  fail    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     fail    
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
   c3f4bb1..0199619  0199619b21f7320482e8a2db14cf8bc974a7766a -> tested/linux-4.1


--===============3832933243454729962==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3832933243454729962==--
