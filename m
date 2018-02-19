From: osstest service owner <osstest-admin@xenproject.org>
Subject: [linux-4.9 test] 119562: tolerable FAIL - PUSHED
Date: Mon, 19 Feb 2018 03:16:08 +0000
Message-ID: <osstest-119562-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0803500032261214625=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wehf=fn=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1enbwE-0001h4-KS
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2018 03:16:22 +0000
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

--===============0803500032261214625==
Content-Type: text/plain

flight 119562 linux-4.9 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/119562/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-credit2 16 guest-start/debian.repeat fail in 119487 pass in 119562
 test-amd64-amd64-xl-qemut-ws16-amd64 16 guest-localmigrate/x10 fail in 119487 pass in 119562
 test-armhf-armhf-libvirt-xsm  6 xen-install                fail pass in 119487

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-rtds     17 guest-start.2           fail blocked in 119074
 test-armhf-armhf-xl-rtds 16 guest-start/debian.repeat fail in 119487 like 119074
 test-armhf-armhf-libvirt-xsm 13 migrate-support-check fail in 119487 never pass
 test-armhf-armhf-libvirt-xsm 14 saverestore-support-check fail in 119487 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 119074
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 119074
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 119074
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 119074
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 119074
 test-amd64-amd64-xl-pvhv2-intel 12 guest-start                 fail never pass
 test-amd64-amd64-xl-pvhv2-amd 12 guest-start                  fail  never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-armhf-armhf-xl-xsm      13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-xsm      14 saverestore-support-check    fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemut-win10-i386 10 windows-install        fail never pass
 test-amd64-i386-xl-qemuu-win10-i386 10 windows-install         fail never pass
 test-amd64-amd64-xl-qemuu-win10-i386 10 windows-install        fail never pass
 test-amd64-i386-xl-qemut-win10-i386 10 windows-install         fail never pass

version targeted for testing:
 linux                3e598a7089eef1fe04d5b87cc154295302960e62
baseline version:
 linux                7f3bd8db99746a60bcae1ec4059a4756d19b63c2

Last test of basis   119074  2018-02-13 12:04:22 Z    5 days
Testing same since   119487  2018-02-17 13:05:43 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Eric W. Biederman" <ebiederm@xmission.com>
  Adam Wallis <awallis@codeaurora.org>
  Al Viro <viro@zeniv.linux.org.uk>
  Amir Goldstein <amir73il@gmail.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrey Konovalov <andreyknvl@google.com>
  Andrey Ryabinin <aryabinin@virtuozzo.com>
  Ard Biesheuvel <ard.biesheuvel@linaro.org>
  Arnd Bergmann <arnd@arndb.de>
  Arvind Yadav <arvind.yadav.cs@gmail.com>
  Aurelien Aptel <aaptel@suse.com>
  Bart Van Assche <bart.vanassche@wdc.com>
  Benjamin Gaignard <benjamin.gaignard@st.com>
  Boris Brezillon <boris.brezillon@free-electrons.com>
  Borislav Petkov <bp@suse.de>
  Bradley Bolen <bradleybolen@gmail.com>
  Brian Norris <briannorris@chromium.org>
  Catalin Marinas <catalin.marinas@arm.com>
  Christoffer Dall <christoffer.dall@linaro.org>
  Cong Wang <xiyou.wangcong@gmail.com>
  Dan Williams <dan.j.williams@intel.com>
  Daniel Lezcano <daniel.lezcano@linaro.org>
  Daniel Mentz <danielmentz@google.com>
  Daniel N Pettersson <danielnp@axis.com>
  David Daney <david.daney@cavium.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Eric Biggers <ebiggers@google.com>
  Eric W. Biederman <ebiederm@xmission.com>
  Felipe Balbi <felipe.balbi@linux.intel.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Hans de Goede <hdegoede@redhat.com>
  Hans Verkuil <hans.verkuil@cisco.com>
  Hans Verkuil <hansverk@cisco.com>
  Heiko Carstens <heiko.carstens@de.ibm.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Horia Geantă <horia.geanta@nxp.com>
  Hugh Dickins <hughd@google.com>
  Imre Deak <imre.deak@intel.com>
  Ingo Molnar <mingo@kernel.org>
  Ivan Vecera <ivecera@redhat.com>
  J. Bruce Fields <bfields@redhat.com>
  James Hogan <jhogan@kernel.org>
  James Morse <james.morse@arm.com>
  Jens Axboe <axboe@kernel.dk>
  Jiri Kosina <jkosina@suse.cz>
  Joe Lawrence <joe.lawrence@redhat.com>
  John Keeping <john@metanate.com>
  Julia Cartwright <julia@ni.com>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kamal Dasu <kdasu.kdev@gmail.com>
  Kees Cook <keescook@chromium.org>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Liran Alon <liran.alon@oracle.com>
  Malcolm Priestley <tvboxspy@gmail.com>
  Marc Zyngier <marc.zyngier@arm.com>
  Marcel Holtmann <marcel@holtmann.org>
  Mark Brown <broonie@kernel.org>
  Martin Kaiser <martin@kaiser.cx>
  Matt Turner <mattst88@gmail.com>
  Matthew Wilcox <mawilcox@microsoft.com>
  Mauro Carvalho Chehab <mchehab@osg.samsung.com>
  Mauro Carvalho Chehab <mchehab@s-opensource.com>
  Max Filippov <jcmvbkbc@gmail.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michal Suchanek <msuchanek@suse.de>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Miklos Szeredi <mszeredi@redhat.com>
  Mikulas Patocka <mpatocka@redhat.com>
  Miquel Raynal <miquel.raynal@free-electrons.com>
  Mohamed Ghannam <simo.ghannam@gmail.com>
  Nikolay Borisov <nborisov@suse.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Petr Cvek <petr.cvek@tul.cz>
  Radim Krčmář <rkrcmar@redhat.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Raphaël Hertzog <hertzog@debian.org>
  Rasmus Villemoes <linux@rasmusvillemoes.dk>
  Richard Weinberger <richard@nod.at>
  Sakari Ailus <sakari.ailus@linux.intel.com>
  Sascha Hauer <s.hauer@pengutronix.de>
  Scott Mayhew <smayhew@redhat.com>
  Stafford Horne <shorne@gmail.com>
  Steve French <smfrench@gmail.com>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Takashi Iwai <tiwai@suse.de>
  Tejun Heo <tj@kernel.org>
  Thomas Gleixner <tglx@linutronix.de>
  Toshi Kani <toshi.kani@hpe.com>
  Trond Myklebust <trond.myklebust@primarydata.com>
  Trond Myklebust <trondmy@gmail.com>
  Vinod Koul <vinod.koul@intel.com>
  Willy Tarreau <w@1wt.eu>
  Wim Van Sebroeck <wim@iguana.be>
  Xiaolei Li <xiaolei.li@mediatek.com>
  Yang Shunyong <shunyong.yang@hxt-semitech.com>

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
 test-armhf-armhf-libvirt-xsm                                 fail    
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


Pushing revision :

To xenbits.xen.org:/home/xen/git/linux-pvops.git
   7f3bd8db9974..3e598a7089ee  3e598a7089eef1fe04d5b87cc154295302960e62 -> tested/linux-4.9


--===============0803500032261214625==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0803500032261214625==--
