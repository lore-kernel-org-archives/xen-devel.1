From: osstest service owner <osstest-admin@xenproject.org>
Subject: [linux-linus test] 118324: tolerable FAIL - PUSHED
Date: Fri, 26 Jan 2018 16:53:13 +0000
Message-ID: <osstest-118324-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0014385678973500482=="
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

--===============0014385678973500482==
Content-Type: text/plain

flight 118324 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/118324/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt-xsm 14 saverestore-support-check    fail  like 118250
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 118250
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 118250
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 118250
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 118250
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 118250
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 118250
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 118250
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 118250
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-xsm      13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-win10-i386 10 windows-install         fail never pass
 test-amd64-amd64-xl-qemuu-win10-i386 10 windows-install        fail never pass
 test-amd64-amd64-xl-qemut-win10-i386 10 windows-install        fail never pass
 test-amd64-i386-xl-qemut-win10-i386 10 windows-install         fail never pass

version targeted for testing:
 linux                5b7d27967dabfb17c21b0d98b29153b9e3ee71e5
baseline version:
 linux                d517bb79f4994a87cfc2ddd4cc76bd1a627d4bed

Last test of basis   118250  2018-01-21 06:48:31 Z    5 days
Failing since        118263  2018-01-21 23:17:15 Z    4 days    6 attempts
Testing same since   118324  2018-01-25 07:31:24 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
  Amritha Nambiar <amritha.nambiar@intel.com>
  Andi Kleen <ak@linux.intel.com>
  Ariel Elior <Ariel.Elior@cavium.com>
  Aviad Yehezkel <aviadye@mellanox.com>
  Aviad Yehezkel <aviadye@mellnaox.com>
  Aviv Heller <avivh@mellanox.com>
  Ben Hutchings <ben.hutchings@codethink.co.uk>
  Bjorn Helgaas <bhelgaas@google.com>
  Boris Pismeny <borisp@mellanox.com>
  Christian König <christian.koenig@amd.com>
  Corentin Labbe <clabbe@baylibre.com>
  Dave Watson <davejwatson@fb.com>
  Dave Young <dyoung@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Woodhouse <dwmw@amazon.co.uk>
  Eric Dumazet <edumazet@google.com>
  Felix Fietkau <nbd@nbd.name>
  Ganesh Goudar <ganeshgr@chelsio.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guillaume Nault <g.nault@alphalink.fr>
  Gustavo A. R. Silva <garsilva@embeddedor.com>
  Ivan Mikhaylov <ivan@de.ibm.com>
  Ivan Vecera <cera@cera.cz>
  Ivan Vecera <ivecera@redhat.com>
  J. Bruce Fields <bfields@redhat.com>
  Jakub Kicinski <jakub.kicinski@netronome.com>
  James Morris <jmorris@namei.org>
  Jason Wang <jasowang@redhat.com>
  Jeff Kirsher <jeffrey.t.kirsher@intel.com>
  Jiri Pirko <jiri@mellanox.com>
  John Allen <jallen@linux.vnet.ibm.com>
  Josh Poimboeuf <jpoimboe@redhat.com>
  Keith Busch <keith.busch@intel.com>
  Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
  Kumar Sanghvi <kumaras@chelsio.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Martin Brandenburg <martin@omnibond.com>
  Masami Hiramatsu <mhiramat@kernel.org>
  Michael S. Tsirkin <mst@redhat.com>
  Michal Hocko <mhocko@suse.com>
  Michal Kalderon <Michal.Kalderon@cavium.com>
  Neil Horman <nhorman@tuxdriver.com>
  Oliver Neukum <oneukum@suse.com>
  Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>
  Saeed Mahameed <saeedm@mellanox.com>
  Shrikrishna Khare <skhare@vmware.com>
  Sowmini Varadhan <sowmini.varadhan@oracle.com>
  Steffen Klassert <steffen.klassert@secunet.com>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Talat Batheesh <talatb@mellanox.com>
  Thomas Gleixner <tglx@linutronix.de>
  Tom Herbert <tom@quantonium.net>
  Tom Lendacky <thomas.lendacky@amd.com>
  Willem de Bruijn <willemb@google.com>
  Willy Tarreau <w@1wt.eu>
  Wolfgang Bumiller <w.bumiller@proxmox.com>
  Yossi Kuperman <yossiku@mellanox.com>
  Yuval Mintz <yuvalm@mellanox.com>
  zhenwei.pi <zhenwei.pi@youruncloud.com>

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


Pushing revision :

To xenbits.xen.org:/home/xen/git/linux-pvops.git
   d517bb79f499..5b7d27967dab  5b7d27967dabfb17c21b0d98b29153b9e3ee71e5 -> tested/linux-linus


--===============0014385678973500482==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0014385678973500482==--
