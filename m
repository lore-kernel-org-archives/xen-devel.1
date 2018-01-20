From: osstest service owner <osstest-admin@xenproject.org>
Subject: [linux-linus test] 118215: regressions - FAIL
Date: Sat, 20 Jan 2018 04:12:48 +0000
Message-ID: <osstest-118215-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2565440698922141425=="
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

--===============2565440698922141425==
Content-Type: text/plain

flight 118215 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/118215/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf-xsm               6 xen-build                fail REGR. vs. 118112

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 118112
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 118112
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 118112
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 118112
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 118112
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 118112
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 118112
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 118112
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-win10-i386 10 windows-install         fail never pass
 test-amd64-amd64-xl-qemuu-win10-i386 10 windows-install        fail never pass
 test-amd64-amd64-xl-qemut-win10-i386 10 windows-install        fail never pass
 test-amd64-i386-xl-qemut-win10-i386 10 windows-install         fail never pass

version targeted for testing:
 linux                1d966eb4d6326a2521073174e9710713e9846e8b
baseline version:
 linux                41aa5e5d712ba3a5f4fac0bbd6d976d70f9aed06

Last test of basis   118112  2018-01-16 20:52:02 Z    3 days
Failing since        118154  2018-01-17 09:59:00 Z    2 days    2 attempts
Testing same since   118215  2018-01-18 18:05:53 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Eric W. Biederman" <ebiederm@xmission.com>
  Alaa Hleihel <alaa@mellanox.com>
  Alexei Starovoitov <ast@kernel.org>
  Andi Kleen <ak@linux.intel.com>
  Andrey Ryabinin <aryabinin@virtuozzo.com>
  Arjan van de Ven <arjan@linux.intel.com>
  Arnd Bergmann <arnd@arndb.de>
  Balbir Singh <bsingharora@gmail.com>
  Baoquan He <bhe@redhat.com>
  Benjamin Beichler <benjamin.beichler@uni-rostock.de>
  Colin Ian King <colin.king@canonical.com>
  Cong Wang <xiyou.wangcong@gmail.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Dave Young <dyoung@redhat.com>
  David Ahern <dsahern@gmail.com>
  David S. Miller <davem@davemloft.net>
  David Woodhouse <dwmw@amazon.co.uk>
  Dmitry Vyukov <dvyukov@google.com>
  Dominik Brodowski <linux@dominikbrodowski.net>
  Doug Ledford <dledford@redhat.com>
  Eran Ben Elisha <eranbe@mellanox.com>
  Eric Biggers <ebiggers@google.com>
  Eric Dumazet <edumazet@google.com>
  Eric W. Biederman <ebiederm@xmission.com>
  Eugenia Emantayev <eugenia@mellanox.com>
  Feras Daoud <ferasda@mellanox.com>
  Florian Westphal <fw@strlen.de>
  Gabriel Craciunescu <nix.or.die@gmail.com>
  Gal Pressman <galp@mellanox.com>
  Gratian Crisan <gratian.crisan@ni.com>
  Guillaume Nault <g.nault@alphalink.fr>
  Herbert Xu <herbert@gondor.apana.org.au>
  Ingo Molnar <mingo@kernel.org>
  Jakub Kicinski <jakub.kicinski@netronome.com>
  Jason Gunthorpe <jgg@mellanox.com>
  Jim Westfall <jwestfall@surrealistic.net>
  Jiri Benc <jbenc@redhat.com>
  Johannes Berg <johannes.berg@intel.com>
  John Fastabend <john.fastabend@gmail.com>
  Josh Poimboeuf <jpoimboe@redhat.com>
  Josh Snyder <joshs@netflix.com>
  Julia Cartwright <julia@ni.com>
  Kan Liang <kan.liang@linux.intel.com>
  Keith Busch <keith.busch@intel.com>
  Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
  Len Brown <len.brown@intel.com>
  Leon Romanovsky <leonro@mellanox.com>
  Li Jinyue <lijinyue@huawei.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Lorenzo Colitti <lorenzo@google.com>
  Maor Gottlieb <maorg@mellanox.com>
  Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
  Michael S. Tsirkin <mst@redhat.com>
  Mike Maloney <maloney@google.com>
  Neil Horman <nhorman@tuxdriver.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Pravin B Shelar <pshelar@ovn.org>
  r.hering@avm.de <r.hering@avm.de>
  Robert Hering <r.hering@avm.de>
  Roland Dreier <roland@purestorage.com>
  Sabrina Dubroca <sd@queasysnail.net>
  Saeed Mahameed <saeedm@mellanox.com>
  Sagi Grimberg <sagi@grimberg.me>
  Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
  Steffen Klassert <steffen.klassert@secunet.com>
  Stephen Hemminger <stephen@networkplumber.org>
  Tariq Toukan <tariqt@mellanox.com>
  Tejun Heo <tj@kernel.org>
  Thomas Falcon <tlfalcon@linux.vnet.ibm.com>
  Thomas Gleixner <tglx@linutronix.de>
  Tom Lendacky <thomas.lendacky@amd.com>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  William Tu <u9012063@gmail.com>
  Xin Long <lucien.xin@gmail.com>
  Ying Xue <ying.xue@windriver.com>
  Yuiko Oshino <yuiko.oshino@microchip.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-armhf-xsm                                              fail    
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
 test-armhf-armhf-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-armhf-armhf-xl-xsm                                      blocked 
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
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
 test-amd64-amd64-xl-pvhv2-intel                              pass    
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

(No revision log; it would be 2477 lines long.)


--===============2565440698922141425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2565440698922141425==--
