From: osstest service owner <osstest-admin@xenproject.org>
Subject: [linux-4.9 test] 119074: tolerable FAIL - PUSHED
Date: Wed, 14 Feb 2018 08:47:04 +0000
Message-ID: <osstest-119074-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3923261576619795349=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vkh0=fi=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1elsik-0005cO-U0
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2018 08:47:18 +0000
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

--===============3923261576619795349==
Content-Type: text/plain

flight 119074 linux-4.9 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/119074/

Failures :-/ but no regressions.

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds    16 guest-start/debian.repeat fail REGR. vs. 118552

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 118552
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 118552
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 118552
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 118552
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 118552
 test-amd64-amd64-xl-pvhv2-intel 12 guest-start                 fail never pass
 test-amd64-amd64-xl-pvhv2-amd 12 guest-start                  fail  never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-xsm      13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemuu-win10-i386 10 windows-install        fail never pass
 test-amd64-amd64-xl-qemut-win10-i386 10 windows-install        fail never pass
 test-amd64-i386-xl-qemuu-win10-i386 10 windows-install         fail never pass
 test-amd64-i386-xl-qemut-win10-i386 10 windows-install         fail never pass

version targeted for testing:
 linux                7f3bd8db99746a60bcae1ec4059a4756d19b63c2
baseline version:
 linux                331b057d4f3ccf2290e6e651b5728db81e9249c6

Last test of basis   118552  2018-02-03 16:18:29 Z   10 days
Testing same since   119074  2018-02-13 12:04:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andi Kleen <ak@linux.intel.com>
  Andy Lutomirski <luto@kernel.org>
  Arnd Bergmann <arnd@arndb.de>
  Ashok Raj <ashok.raj@intel.com>
  Balbir Singh <bsingharora@gmail.com>
  Bjørn Mork <bjorn@mork.no>
  Boris Ostrovsky <boris.ostrovsky@oracle.com>
  Borislav Petkov <bp@alien8.de>
  Borislav Petkov <bp@suse.de>
  Chunhao Lin <hau@realtek.com>
  Colin Ian King <colin.king@canonical.com>
  Cong Wang <xiyou.wangcong@gmail.com>
  Craig Gallek <kraig@google.com>
  Dan Williams <dan.j.williams@intel.com>
  Darren Kenny <darren.kenny@oracle.com>
  Dave Hansen <dave.hansen@intel.com>
  Dave Hansen <dave.hansen@linux.intel.com>
  David Hildenbrand <david@redhat.com>
  David Howells <dhowells@redhat.com>
  David Matlack <dmatlack@google.com>
  David S. Miller <davem@davemloft.net>
  David Woodhouse <dwmw@amazon.co.uk>
  Dou Liyang <douly.fnst@cn.fujitsu.com>
  Eric Biggers <ebiggers@google.com>
  Eric Dumazet <edumazet@google.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Hans Verkuil <hans.verkuil@cisco.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
  Horia Geantă <horia.geanta@nxp.com>
  Hugh Dickins <hughd@google.com>
  Ingo Molnar <mingo@kernel.org>
  James Morris <james.l.morris@oracle.com>
  Jason Wang <jasowang@redhat.com>
  Jesse Chan <jc@linux.com>
  Jim Mattson <jmattson@google.com>
  Jin Qian <jinqian@google.com>
  Johannes Berg <johannes@sipsolutions.net>
  Jon Masters <jcm@redhat.com>
  Josh Poimboeuf <jpoimboe@redhat.com>
  Juergen Gross <jgross@suse.com>
  Julian Scheel <julian@jusst.de>
  Junxiao Bi <junxiao.bi@oracle.com>
  Kalle Valo <kvalo@codeaurora.org>
  KarimAllah Ahmed <karahmed@amazon.de>
  Kristian Evensen <kristian.evensen@gmail.com>
  Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Li RongQing <lirongqing@baidu.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Mark Brown <broonie@kernel.org>
  Mark Kanda <mark.kanda@oracle.com>
  Mark Rutland <mark.rutland@arm.com>
  Martin KaFai Lau <kafai@fb.com>
  Mauro Carvalho Chehab <mchehab@s-opensource.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Neuling <mikey@neuling.org>
  Neal Cardwell <ncardwell@google.com>
  Nhan Nguyen <nhan.nguyen.yb@renesas.com>
  Nicholas Piggin <npiggin@gmail.com>
  Nikolay Aleksandrov <nikolay@cumulusnetworks.com>
  Oliver O'Halloran <oohall@gmail.com>
  Paolo Abeni <pabeni@redhat.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Radim Krčmář <rkrcmar@redhat.com>
  Robert Baronescu <robert.baronescu@nxp.com>
  Rolf Neugebauer <rolf.neugebauer@docker.com>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  Soheil Hassas Yeganeh <soheil@google.com>
  Takashi Iwai <tiwai@suse.de>
  Thomas Gleixner <tglx@linutronix.de>
  thongsyho <thong.ho.px@rvc.renesas.com>
  Waiman Long <longman@redhat.com>
  Will Deacon <will.deacon@arm.com>
  Yuchung Cheng <ycheng@google.com>

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
   331b057d4f3c..7f3bd8db9974  7f3bd8db99746a60bcae1ec4059a4756d19b63c2 -> tested/linux-4.9


--===============3923261576619795349==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3923261576619795349==--
