From: Platform Team regression test user <citrix-osstest@xenproject.org>
Subject: [linux-3.18 baseline-only test] 72961: trouble:
	blocked/broken
Date: Mon, 18 Dec 2017 00:06:29 +0000
Message-ID: <osstest-72961-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3944423128630966167=="
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

--===============3944423128630966167==
Content-Type: text/plain

This run is configured for baseline tests only.

flight 72961 linux-3.18 real [real]
http://osstest.xs.citrite.net/~osstest/testlogs/logs/72961/

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
 build-armhf-pvops             4 host-install(4)       broken baseline untested
 build-armhf                   4 host-install(4)       broken baseline untested
 build-armhf-xsm               4 host-install(4)       broken baseline untested
 build-i386-xsm                4 host-install(4)       broken baseline untested
 build-i386-pvops              4 host-install(4)       broken baseline untested
 build-amd64                   4 host-install(4)       broken baseline untested
 build-amd64-xsm               4 host-install(4)       broken baseline untested
 build-amd64-pvops             4 host-install(4)       broken baseline untested
 build-i386                    4 host-install(4)       broken baseline untested

version targeted for testing:
 linux                e6318e33ba9471a6eb8c975c92a0015b9271ce7a
baseline version:
 linux                2179863ede7c9ea56d80fbfe9bfc710c269c7e69

Last test of basis    72837  2017-12-15 11:17:14 Z    2 days
Testing same since    72961  2017-12-17 17:57:50 Z    0 days    1 attempts

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
broken-step build-armhf-pvops host-install(4)
broken-step build-armhf host-install(4)
broken-step build-armhf-xsm host-install(4)
broken-step build-i386-xsm host-install(4)
broken-step build-i386-pvops host-install(4)
broken-step build-amd64 host-install(4)
broken-step build-amd64-xsm host-install(4)
broken-step build-amd64-pvops host-install(4)
broken-step build-i386 host-install(4)

Push not applicable.

(No revision log; it would be 1913 lines long.)


--===============3944423128630966167==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3944423128630966167==--
