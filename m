From: osstest service owner <osstest-admin@xenproject.org>
Subject: [linux-3.18 test] 117211: tolerable FAIL - PUSHED
Date: Sun, 17 Dec 2017 17:57:18 +0000
Message-ID: <osstest-117211-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5523657986084485532=="
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

--===============5523657986084485532==
Content-Type: text/plain

flight 117211 linux-3.18 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/117211/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-xsm 14 saverestore-support-check    fail  like 117131
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 117131
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 117131
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 117131
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 117131
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 117131
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 117131
 test-amd64-amd64-xl-pvhv2-amd 12 guest-start                  fail  never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-xl-pvhv2-intel 12 guest-start                 fail never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 build-arm64-pvops             6 kernel-build                 fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-xsm      13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemuu-win10-i386 10 windows-install         fail never pass
 test-amd64-amd64-xl-qemut-win10-i386 10 windows-install        fail never pass
 test-amd64-amd64-xl-qemuu-win10-i386 10 windows-install        fail never pass
 test-amd64-i386-xl-qemut-win10-i386 10 windows-install         fail never pass

version targeted for testing:
 linux                e6318e33ba9471a6eb8c975c92a0015b9271ce7a
baseline version:
 linux                2179863ede7c9ea56d80fbfe9bfc710c269c7e69

Last test of basis   117131  2017-12-14 08:19:15 Z    3 days
Testing same since   117211  2017-12-16 09:50:33 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alex Williamson <alex.williamson@redhat.com>
  Andrew Honig <ahonig@google.com>
  Andrew Morton <akpm@linux-foundation.org>
  Anna Schumaker <Anna.Schumaker@Netapp.com>
  Ard Biesheuvel <ard.biesheuvel@linaro.org>
  Arvind Yadav <arvind.yadav.cs@gmail.com>
  Blomme, Maarten <Maarten.Blomme@flir.com>
  Borislav Petkov <bp@suse.de>
  Chris Brandt <chris.brandt@renesas.com>
  Christoffer Dall <christoffer.dall@linaro.org>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chuck Lever <chuck.lever@oracle.com>
  Cong Wang <xiyou.wangcong@gmail.com>
  Daniel Thompson <daniel.thompson@linaro.org>
  Dave Martin <Dave.Martin@arm.com>
  Dave Young <dyoung@redhat.com>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  Dick Kennedy <dick.kennedy@broadcom.com>
  Doug Ledford <dledford@redhat.com>
  Eric Biggers <ebiggers@google.com>
  Eric Dumazet <edumazet@google.com>
  Felipe Balbi <felipe.balbi@linux.intel.com>
  Franck Demathieu <fdemathieu@gmail.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Hangbin Liu <liuhangbin@gmail.com>
  Hannes Frederic Sowa <hannes@stressinduktion.org>
  Herbert Xu <herbert@gondor.apana.org.au>
  Håkon Bugge <haakon.bugge@oracle.com>
  Ingo Molnar <mingo@kernel.org>
  Jaejoong Kim <climbbb.kim@gmail.com>
  James Smart <james.smart@broadcom.com>
  James Smart <jsmart2021@gmail.com>
  Jan Kara <jack@suse.cz>
  Jason Baron <jbaron@akamai.com>
  Jason Wessel <jason.wessel@windriver.com>
  Jens Axboe <axboe@fb.com>
  Jim Mattson <jmattson@google.com>
  Jimmy Assarsson <jimmyassarsson@gmail.com>
  John Keeping <john@metanate.com>
  Jérémy Lefaure <jeremy.lefaure@lse.epita.fr>
  K. Y. Srinivasan <kys@microsoft.com>
  Kristina Martsenko <kristina.martsenko@arm.com>
  Krzysztof Kozlowski <krzk@kernel.org>
  Laurent Caumont <lcaumont2@gmail.com>
  Leon Romanovsky <leon@kernel.org>
  Linus Torvalds <torvalds@linux-foundation.org>
  Long Li <longli@microsoft.com>
  Maarten Blomme <Maarten.Blomme@flir.com>
  Majd Dibbiny <majd@mellanox.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marc Zyngier <marc.zyngier@arm.com>
  Mark Bloch <markb@mellanox.com>
  Mark Rutland <mark.rutland@arm.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin Kelly <mkelly@xevo.com>
  Mauro Carvalho Chehab <mchehab@s-opensource.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael S. Tsirkin <mst@redhat.com>
  Michal Hocko <mhocko@suse.com>
  Michal Schmidt <mschmidt@redhat.com>
  Neil Horman <nhorman@tuxdriver.com>
  Nick Desaulniers <ndesaulniers@google.com>
  Nicolas Dichtel <nicolas.dichtel@6wind.com>
  Paul Meyer <Paul.Meyer@microsoft.com>
  Paul Moore <paul@paul-moore.com>
  Pavel Tatashin <pasha.tatashin@oracle.com>
  Radim Krčmář <rkrcmar@redhat.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Randy Dunlap <rdunlap@infradead.org>
  Robb Glasser <rglasser@google.com>
  Robin Murphy <robin.murphy@arm.com>
  Sachin Sant <sachinp@linux.vnet.ibm.com>
  Santosh Shilimkar <santosh.shilimkar@oracle.com>
  Sasha Levin <alexander.levin@verizon.com>
  Sean Young <sean@mess.org>
  Simon Horman <horms+renesas@verge.net.au>
  Siqi Lin <siqilin@google.com>
  Steffen Klassert <steffen.klassert@secunet.com>
  Stephen Bates <sbates@raithlin.com>
  Takashi Iwai <tiwai@suse.de>
  Tejun Heo <tj@kernel.org>
  Thomas Gleixner <tglx@linutronix.de>
  Trond Myklebust <trond.myklebust@primarydata.com>
  Vincent Pelletier <plr.vincent@gmail.com>
  WANG Cong <xiyou.wangcong@gmail.com>
  Wanpeng Li <wanpeng.li@hotmail.com>
  weiping zhang <zhangweiping@didichuxing.com>
  weiping zhang <zwp10758@gmail.com>
  Will Deacon <will.deacon@arm.com>
  William Breathitt Gray <vilhelm.gray@gmail.com>
  Wolfram Sang <wsa@the-dreams.de>
  Xin Long <lucien.xin@gmail.com>

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
 build-arm64-pvops                                            fail    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 build-amd64-rumprun                                          pass    
 build-i386-rumprun                                           pass    
 test-amd64-amd64-xl                                          pass    
 test-arm64-arm64-xl                                          blocked 
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
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-armhf-armhf-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      blocked 
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
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     blocked 
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
   2179863..e6318e3  e6318e33ba9471a6eb8c975c92a0015b9271ce7a -> tested/linux-3.18


--===============5523657986084485532==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5523657986084485532==--
