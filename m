From: osstest service owner <osstest-admin@xenproject.org>
Subject: [linux-4.9 test] 118151: trouble: broken/fail/pass
Date: Thu, 18 Jan 2018 07:31:23 +0000
Message-ID: <osstest-118151-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8016958731431991317=="
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

--===============8016958731431991317==
Content-Type: text/plain

flight 118151 linux-4.9 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/118151/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-rtds        <job status>                 broken

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds      4 host-install(4)        broken REGR. vs. 117765
 test-amd64-amd64-rumprun-amd64 17 rumprun-demo-xenstorels/xenstorels.repeat fail REGR. vs. 117765

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 117765
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 117765
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 117765
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 117765
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 117765
 test-amd64-amd64-xl-pvhv2-intel 12 guest-start                 fail never pass
 test-amd64-amd64-xl-pvhv2-amd 12 guest-start                  fail  never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-xsm      13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemuu-win10-i386 10 windows-install        fail never pass
 test-amd64-amd64-xl-qemut-win10-i386 10 windows-install        fail never pass
 test-amd64-i386-xl-qemuu-win10-i386 10 windows-install         fail never pass
 test-amd64-i386-xl-qemut-win10-i386 10 windows-install         fail never pass

version targeted for testing:
 linux                b8cf9ff79d63a3ac5567bd7cbb9445bfed193f4d
baseline version:
 linux                7bbc6ca4887794cc44b41412a35bdfbe0cbd1c50

Last test of basis   117765  2018-01-10 08:50:09 Z    7 days
Testing same since   118151  2018-01-17 09:29:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaron Brown <aaron.f.brown@intel.com>
  Abdul Lateef Attar <abdul-lateef.attar@hpe.com>
  Alex Smith <alex@alex-smith.me.uk>
  Alexei Starovoitov <ast@fb.com>
  Alexei Starovoitov <ast@kernel.org>
  Andi Kleen <ak@linux.intel.com>
  Andrew Honig <ahonig@google.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrey Ryabinin <aryabinin@virtuozzo.com>
  Andrii Vladyka <tulup@mail.ru>
  Andy Lutomirski <luto@kernel.org>
  Arjan van de Ven <arjan@linux.intel.com>
  Arnaud Patard <arnaud.patard@rtp-net.org>
  Bart Van Assche <bart.vanassche@wdc.com>
  Ben Hutchings <ben.hutchings@codethink.co.uk>
  Ben Seri <ben@armis.com>
  Benjamin Poirier <bpoirier@suse.com>
  Borislav Petkov <bp@suse.de>
  Christian Hesse <list@eworm.de>
  Christian Holl <cyborgx1@gmail.com>
  Cong Wang <xiyou.wangcong@gmail.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Dan Streetman <dan.streetman@canonical.com>
  Dan Streetman <ddstreet@ieee.org>
  Daniel Borkmann <daniel@iogearbox.net>
  Darren Hart (VMware) <dvhart@infradead.org>
  Dave Hansen <dave.hansen@linux.intel.com>
  David Decotigny <decot@googlers.com>
  David S. Miller <davem@davemloft.net>
  David Spinadel <david.spinadel@intel.com>
  David Woodhouse <dwmw@amazon.co.ku>
  David Woodhouse <dwmw@amazon.co.uk>
  Diego Elio Pettenò <flameeyes@flameeyes.eu>
  Eli Cooper <elicooper@gmx.com>
  Eric Biggers <ebiggers@google.com>
  Eric Dumazet <edumazet@google.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Hans de Goede <hdegoede@redhat.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Icenowy Zheng <icenowy@aosc.io>
  Ido Schimmel <idosch@mellanox.com>
  Ilya Dryomov <idryomov@gmail.com>
  Ingo Molnar <mingo@kernel.org>
  James Hogan <james.hogan@mips.com>
  Jason Gunthorpe <jgg@mellanox.com>
  Jeff Kirsher <jeffrey.t.kirsher@intel.com>
  Jerome Brunet <jbrunet@baylibre.com>
  Jia Zhang <qianyue.zj@alibaba-inc.com>
  Jim Mattson <jmattson@google.com>
  Jiri Kosina <jkosina@suse.cz>
  Jiri Pirko <jiri@mellanox.com>
  Johan Hovold <johan@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  John Fastabend <john.fastabend@gmail.com>
  Jonathan McDowell <noodles@earth.li>
  Josh Poimboeuf <jpoimboe@redhat.com>
  Kalle Valo <kvalo@qca.qualcomm.com>
  Lepton Wu <ytht.net@gmail.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Maciej W. Rozycki <macro@mips.com>
  Manikanta Pubbisetty <mpubbise@qti.qualcomm.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marc Zyngier <marc.zyngier@arm.com>
  Mike Maloney <maloney@google.com>
  Mike Snitzer <snitzer@redhat.com>
  Mohamed Ghannam <simo.ghannam@gmail.com>
  Nicholas Bellinger <nab@linux-iscsi.org>
  Oliver Neukum <oneukum@suse.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Pavel Tatashin <pasha.tatashin@oracle.com>
  Pete Zaitcev <zaitcev@redhat.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Ralf Baechle <ralf@linux-mips.org>
  Razvan Ghitulete <rga@amazon.de>
  Roi Dayan <roid@mellanox.com>
  Santosh Shilimkar <santosh.shilimkar@oracle.com>
  Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
  Shuah Khan <shuahkh@osg.samsung.com>
  Stefan Agner <stefan@agner.ch>
  Stephen Hemminger <stephen@networkplumber.org>
  Sunil V L <sunil.vl@hpe.com>
  Suren Baghdasaryan <surenb@google.com>
  Takashi Iwai <tiwai@suse.de>
  Thomas Gleixner <tglx@linutronix.de>
  Tom Lendacky <thomas.lendacky@amd.com>
  Tony Luck <tony.luck@intel.com>
  Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
  Vikas C Sajjan <vikas.cha.sajjan@hpe.com>
  Viktor Slavkovic <viktors@google.com>
  Vlastimil Babka <vbabka@suse.cz>
  Wanpeng Li <wanpeng.li@hotmail.com>
  Wolfgang Grandegger <wg@grandegger.com>

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
 test-amd64-amd64-rumprun-amd64                               fail    
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

broken-job test-armhf-armhf-xl-rtds broken
broken-step test-armhf-armhf-xl-rtds host-install(4)

Not pushing.

(No revision log; it would be 2795 lines long.)


--===============8016958731431991317==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8016958731431991317==--
