From: osstest service owner <osstest-admin@xenproject.org>
Subject: [linux-linus test] 117996: tolerable FAIL - PUSHED
Date: Mon, 15 Jan 2018 14:20:13 +0000
Message-ID: <osstest-117996-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4225958260564535052=="
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

--===============4225958260564535052==
Content-Type: text/plain

flight 117996 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/117996/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 117945
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 117945
 test-armhf-armhf-libvirt-xsm 14 saverestore-support-check    fail  like 117945
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 117945
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 117945
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 117945
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 117945
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 117945
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 117945
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-xsm      13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemut-win10-i386 10 windows-install        fail never pass
 test-amd64-i386-xl-qemuu-win10-i386 10 windows-install         fail never pass
 test-amd64-amd64-xl-qemuu-win10-i386 10 windows-install        fail never pass
 test-amd64-i386-xl-qemut-win10-i386 10 windows-install         fail never pass

version targeted for testing:
 linux                a8750ddca918032d6349adbf9a4b6555e7db20da
baseline version:
 linux                c92a9a461dff6140c539c61e457aa97df29517d6

Last test of basis   117945  2018-01-13 15:55:40 Z    1 days
Testing same since   117996  2018-01-15 00:47:18 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
  Alan Stern <stern@rowland.harvard.edu>
  Andi Kleen <ak@linux.intel.com>
  Andrea Arcangeli <aarcange@redhat.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andy Lutomirski <luto@kernel.org>
  Arjan van de Ven <arjan@linux.intel.com>
  Baoquan He <bhe@redhat.com>
  Ben Seri <ben@armis.com>
  Bin Liu <b-liu@ti.com>
  Bjorn Helgaas <helgaas@kernel.org>
  Borislav Petkov <bp@suse.de>
  Christian Holl <cyborgx1@gmail.com>
  Christian König <christian.koenig@amd.com>
  Christoph Hellwig <hch@lst.de>
  Dave Hansen <dave.hansen@linux.intel.com>
  Dave Young <dyoung@redhat.com>
  David Woodhouse <dwmw@amazon.co.uk>
  Diego Elio Pettenò <flameeyes@flameeyes.eu>
  Dimitri Sivanich <sivanich@hpe.com>
  Dmitry Vyukov <dvyukov@google.com>
  Ewan D. Milne <emilne@redhat.com>
  Felipe Balbi <felipe.balbi@linux.intel.com>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Hans de Goede <hdegoede@redhat.com>
  Icenowy Zheng <icenowy@aosc.io>
  Ingo Molnar <mingo@kernel.org>
  Jens Axboe <axboe@kernel.dk>
  Jike Song <albcamus@gmail.com>
  Jiri Kosina <jkosina@suse.cz>
  Johan Hovold <johan@kernel.org>
  John Johansen <john.johansen@canonical.com>
  Jon Masters <jcm@redhat.com>
  Jose Ricardo Ziviani <joserz@linux.vnet.ibm.com>
  Josh Poimboeuf <jpoimboe@redhat.com>
  Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Masahiro Yamada <yamada.masahiro@socionext.com>
  Matthew Garrett <mjg59@google.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Neuling <mikey@neuling.org>
  Nicholas Piggin <npiggin@gmail.com>
  Nicolas Pitre <nico@linaro.org>
  Nicolas Pitre <nicolas.pitre@linaro.org>
  Oliver O'Halloran <oohall@gmail.com>
  Pete Zaitcev <zaitcev@redhat.com>
  Peter Rosin <peda@axentia.se>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Randy Dunlap <rdunlap@infradead.org>
  Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>
  Shuah Khan <shuahkh@osg.samsung.com>
  Stefan Agner <stefan@agner.ch>
  Thomas Gleixner <tglx@linutronix.de>
  Tom Lendacky <thomas.lendacky@amd.com>
  Viktor Slavkovic <viktors@google.com>
  W. Trevor King <wking@tremily.us>

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
   c92a9a461dff..a8750ddca918  a8750ddca918032d6349adbf9a4b6555e7db20da -> tested/linux-linus


--===============4225958260564535052==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4225958260564535052==--
