From: osstest service owner <osstest-admin@xenproject.org>
Subject: [linux-4.9 test] 120137: trouble: broken/fail/pass
Date: Sat, 03 Mar 2018 18:25:05 +0000
Message-ID: <osstest-120137-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0407214362140963428=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ybyn=fz=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1esBqT-0000wK-5s
 for xen-devel@lists.xenproject.org; Sat, 03 Mar 2018 18:25:21 +0000
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

--===============0407214362140963428==
Content-Type: text/plain

flight 120137 linux-4.9 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/120137/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-raw          <job status>                 broken
 test-amd64-i386-libvirt-xsm     <job status>                 broken

Tests which are failing intermittently (not blocking):
 test-amd64-i386-libvirt-xsm   4 host-install(4)          broken pass in 120091
 test-amd64-i386-xl-raw        4 host-install(4)          broken pass in 120091
 test-armhf-armhf-xl     5 host-ping-check-native fail in 120091 pass in 120137

Tests which did not succeed, but are not blocking:
 test-amd64-i386-libvirt-xsm 13 migrate-support-check fail in 120091 never pass
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 120047
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 120047
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 120047
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 120047
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 120047
 test-amd64-amd64-xl-pvhv2-intel 12 guest-start                 fail never pass
 test-amd64-amd64-xl-pvhv2-amd 12 guest-start                  fail  never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-xsm      13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-xsm      14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemuu-win10-i386 10 windows-install        fail never pass
 test-amd64-amd64-xl-qemut-win10-i386 10 windows-install        fail never pass
 test-amd64-i386-xl-qemuu-win10-i386 10 windows-install         fail never pass
 test-amd64-i386-xl-qemut-win10-i386 10 windows-install         fail never pass

version targeted for testing:
 linux                c426a717c3c633c743bfa84af902012aa84063f4
baseline version:
 linux                19c04ca5b239e6e2277a5b381d1e79482ab9bbc5

Last test of basis   120047  2018-02-26 20:22:05 Z    4 days
Testing same since   120091  2018-02-28 09:55:21 Z    3 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alan Stern <stern@rowland.harvard.edu>
  Alex Deucher <alexander.deucher@amd.com>
  Aman Deep <aman.deep@samsung.com>
  Andrew Morton <akpm@linux-foundation.org>
  Arjun Vynipadath <arjun@chelsio.com>
  Arnd Bergmann <arnd@arndb.de>
  Bin Liu <b-liu@ti.com>
  Casey Leedom <leedom@chelsio.com>
  Christian König <christian.koenig@amd.com>
  Dan Williams <dan.j.williams@intel.com>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  Doug Ledford <dledford@redhat.com>
  Eric Biggers <ebiggers@google.com>
  Felipe Balbi <felipe.balbi@linux.intel.com>
  Ganesh Goudar <ganeshgr@chelsio.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Haiqing Bai <Haiqing.Bai@windriver.com>
  Ingo Molnar <mingo@kernel.org>
  Jack Pham <jackp@codeaurora.org>
  Jack Stocker <jackstocker.93@gmail.com>
  Jan H. Schönherr <jschoenh@amazon.de>
  Jan Kara <jack@suse.cz>
  Jason Gunthorpe <jgg@mellanox.com>
  Jeffy Chen <jeffy.chen@rock-chips.com>
  Johannes Berg <johannes.berg@intel.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Junwei Zhang <Jerry.Zhang@amd.com> (v2)
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Karsten Koop <kkoop@ld-didactic.de>
  Krzysztof Piotr Oledzki <ole@ans.pl>
  Lars-Peter Clausen <lars@metafoo.de>
  Leon Romanovsky <leonro@mellanox.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Lukas Wunner <lukas@wunner.de>
  Lukas Wunner <lukas@wunner.de> (v1)
  Marc Zyngier <marc.zyngier@arm.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Max Filippov <jcmvbkbc@gmail.com>
  Mayank Rana <mrana@codeaurora.org>
  Michael Weiser <michael.weiser@gmx.de>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Ross Zwisler <ross.zwisler@linux.intel.com>
  Shanker Donthineni <shankerd@codeaurora.org>
  Shigeru Yoshida <Shigeru.Yoshida@windriver.com>
  Stefan Windfeldt-Prytz <stefan.windfeldt@axis.com>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thinh Nguyen <thinhn@synopsys.com>
  Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
  Will Deacon <will.deacon@arm.com>
  Will Deacon <will.deacon@arm.com>,
  Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

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
 test-amd64-i386-libvirt-xsm                                  broken  
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
 test-amd64-i386-xl-raw                                       broken  
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

broken-job test-amd64-i386-xl-raw broken
broken-job test-amd64-i386-libvirt-xsm broken
broken-step test-amd64-i386-libvirt-xsm host-install(4)
broken-step test-amd64-i386-xl-raw host-install(4)

Not pushing.

(No revision log; it would be 1383 lines long.)


--===============0407214362140963428==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0407214362140963428==--
