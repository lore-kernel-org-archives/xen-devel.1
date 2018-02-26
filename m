From: osstest service owner <osstest-admin@xenproject.org>
Subject: [linux-3.18 test] 120010: regressions - FAIL
Date: Mon, 26 Feb 2018 17:39:15 +0000
Message-ID: <osstest-120010-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6397567561153798973=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=hv1c=fu=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1eqMkM-0000kR-0U
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2018 17:39:30 +0000
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

--===============6397567561153798973==
Content-Type: text/plain

flight 120010 linux-3.18 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/120010/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-freebsd10-i386 17 guest-localmigrate/x10 fail REGR. vs. 119432
 test-amd64-i386-xl-qemut-debianhvm-amd64 16 guest-localmigrate/x10 fail REGR. vs. 119432

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 119432
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 119432
 test-armhf-armhf-libvirt-xsm 14 saverestore-support-check    fail  like 119432
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 119432
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 119432
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 119432
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 119432
 test-amd64-amd64-xl-pvhv2-intel 12 guest-start                 fail never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-xl-pvhv2-amd 12 guest-start                  fail  never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-xsm      13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-xsm      14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 build-arm64-pvops             6 kernel-build                 fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemuu-win10-i386 10 windows-install         fail never pass
 test-amd64-i386-xl-qemut-win10-i386 10 windows-install         fail never pass
 test-amd64-amd64-xl-qemuu-win10-i386 10 windows-install        fail never pass
 test-amd64-amd64-xl-qemut-win10-i386 10 windows-install        fail never pass

version targeted for testing:
 linux                f8f8e8c5bbed6c3941845a1b7956bd893818f29f
baseline version:
 linux                0c946219398a3108a9fe8dbc5096586bdcc797d6

Last test of basis   119432  2018-02-16 20:38:28 Z    9 days
Testing same since   120010  2018-02-25 10:46:44 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Al Viro <viro@zeniv.linux.org.uk>
  Alex Deucher <alexander.deucher@amd.com>
  Aliaksei Karaliou <akaraliou.dev@gmail.com>
  Anand Moon <linux.amoon@gmail.com>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Balamuruhan S <bala24@linux.vnet.ibm.com>
  Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
  Bjorn Andersson <bjorn.andersson@linaro.org>
  Boris Ostrovsky <boris.ostrovsky@oracle.com>
  Chanwoo Choi <cw00.choi@samsung.com>
  Cong Wang <xiyou.wangcong@gmail.com>
  Dave Young <dyoung@redhat.com>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dmitry Vyukov <dvyukov@google.com>
  Eric Biggers <ebiggers3@gmail.com>
  Eric Biggers <ebiggers@google.com>
  Eric Dumazet <edumazet@google.com>
  Ernesto A. Fernández <ernesto.mnd.fernandez@gmail.com>
  Eugene Syromiatnikov <esyr@redhat.com>
  Florian Westphal <fw@strlen.de>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Heiko Carstens <heiko.carstens@de.ibm.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Ingo Molnar <mingo@kernel.org>
  Jack Morgenstein <jackm@dev.mellanox.co.il>
  Jack Wang <jinpu.wang@profitbricks.com>
  Jan Beulich <jbeulich@suse.com>
  Jason Gunthorpe <jgg@mellanox.com>
  Jia-Ju Bai <baijiaju1990@163.com>
  Jiri Olsa <jolsa@kernel.org>
  Johan Hovold <johan@kernel.org>
  Jonathan Corbet <corbet@lwn.net>
  Julia Lawall <Julia.Lawall@lip6.fr>
  Kamil Konieczny <k.konieczny@partner.samsung.com>
  Karol Herbst <kherbst@redhat.com>
  Keerthy <j-keerthy@ti.com>
  Leon Romanovsky <leon@kernel.org>
  Liu Bo <bo.li.liu@oracle.com>
  Lyude <lyude@redhat.com>
  Mark Brown <broonie@kernel.org>
  Martin Schwidefsky <schwidefsky@de.ibm.com>
  Mauro Carvalho Chehab <mchehab@s-opensource.com>
  Maxime Ripard <maxime.ripard@free-electrons.com>
  Michael Ellerman <mpe@ellerman.id.au>
  MyungJoo Ham <myungjoo.ham@samsung.com>
  Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
  Nicolas Pitre <nico@linaro.org>
  Nicolas Pitre <nicolas.pitre@linaro.org>
  Nikolay Borisov <nborisov@suse.com>
  Nogah Frankel <nogahf@mellanox.com>
  Olof Johansson <olof@lixom.net>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paul Moore <paul@paul-moore.com>
  Pekka Paalanen <ppaalanen@gmail.com>
  Peter Ujfalusi <peter.ujfalusi@ti.com>
  Radim Krčmář <rkrcmar@redhat.com>
  Randy Dunlap <rdunlap@infradead.org>
  Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
  Sasha Levin <alexander.levin@microsoft.com>
  Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
  Shuah Khan <shuahkh@osg.samsung.com>
  Stefan Haberland <sth@linux.vnet.ibm.com>
  Steffen Klassert <steffen.klassert@secunet.com>
  Stephen Smalley <sds@tycho.nsa.gov>
  Takashi Iwai <tiwai@suse.de>
  Takuo Koguchi <takuo.koguchi.sw@hitachi.com>
  Takuo Koguchi <takuo.koguchi@gmail.com>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Theodore Ts'o <tytso@mit.edu>
  Thomas Gleixner <tglx@linutronix.de>
  Tobias Jordan <Tobias.Jordan@elektrobit.com>
  Tony Lindgren <tony@atomide.com>
  Vinod Koul <vinod.koul@intel.com>
  Viresh Kumar <viresh.kumar@linaro.org>
  Wanpeng Li <wanpeng.li@hotmail.com>
  Will Deacon <will.deacon@arm.com>
  Willem de Bruijn <willemb@google.com>
  Zhouyi Zhou <zhouzhouyi@gmail.com>
  Zumeng Chen <zumeng.chen@gmail.com>

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
 test-amd64-i386-xl-qemut-debianhvm-amd64                     fail    
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
 test-amd64-i386-freebsd10-i386                               fail    
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


Not pushing.

(No revision log; it would be 1549 lines long.)


--===============6397567561153798973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6397567561153798973==--
