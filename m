From: osstest service owner <osstest-admin@xenproject.org>
Subject: [linux-4.9 test] 120260: tolerable FAIL - PUSHED
Date: Wed, 07 Mar 2018 02:32:40 +0000
Message-ID: <osstest-120260-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7243749015686653592=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=/bh1=f5=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1etOsw-0006z7-Sg
 for xen-devel@lists.xenproject.org; Wed, 07 Mar 2018 02:32:54 +0000
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

--===============7243749015686653592==
Content-Type: text/plain

flight 120260 linux-4.9 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/120260/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 120047
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 120047
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 120047
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 120047
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 120047
 test-amd64-amd64-xl-pvhv2-intel 12 guest-start                 fail never pass
 test-amd64-amd64-xl-pvhv2-amd 12 guest-start                  fail  never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-xsm      13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
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
 linux                6a83eb2354543e3263b880eb822c4b0993a2236b
baseline version:
 linux                19c04ca5b239e6e2277a5b381d1e79482ab9bbc5

Last test of basis   120047  2018-02-26 20:22:05 Z    8 days
Failing since        120091  2018-02-28 09:55:21 Z    6 days    4 attempts
Testing same since   120260  2018-03-05 12:55:27 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abhijeet Kumar <abhijeet.kumar@intel.com>
  Al Viro <viro@zeniv.linux.org.uk>
  Alan Stern <stern@rowland.harvard.edu>
  Albert Hsieh <wen.hsieh@broadcom.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Duyck <alexander.h.duyck@intel.com>
  Alexander Kochetkov <al.kochet@gmail.com>
  Alexey Khoroshilov <khoroshilov@ispras.ru>
  Aliaksei Karaliou <akaraliou.dev@gmail.com>
  Aman Deep <aman.deep@samsung.com>
  Andreas Platschek <andreas.platschek@opentech.at>
  Andrew Bowers <andrewx.bowers@intel.com>
  Andrew Morton <akpm@linux-foundation.org>
  Anna-Maria Gleixner <anna-maria@linutronix.de>
  Arjun Vynipadath <arjun@chelsio.com>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Ben Gardner <gardner.ben@gmail.com>
  Ben Skeggs <bskeggs@redhat.com>
  Bin Liu <b-liu@ti.com>
  Bjørn Mork <bjorn@mork.no>
  Boris Brezillon <boris.brezillon@free-electrons.com>
  Boris Ostrovsky <boris.ostrovsky@oracle.com>
  Brendan McGrath <redmcg@redmandi.dyndns.org>
  Casey Leedom <leedom@chelsio.com>
  Cathy Avery <cavery@redhat.com>
  Christian König <christian.koenig@amd.com>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chunyan Zhang <zhang.lyra@gmail.com>
  Dan Williams <dan.j.williams@intel.com>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Daniele Palmas <dnlplm@gmail.com>
  Darrick J. Wong <darrick.wong@oracle.com>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  Doug Ledford <dledford@redhat.com>
  Eduardo Otubo <otubo@redhat.com>
  Erez Shitrit <erezsh@mellanox.com>
  Eric Biggers <ebiggers@google.com>
  Felipe Balbi <felipe.balbi@linux.intel.com>
  Felix Janda <felix.janda@posteo.de>
  Fengguang Wu <fengguang.wu@intel.com>
  Fredrik Hallenberg <megahallon@gmail.com>
  Ganesh Goudar <ganeshgr@chelsio.com>
  Gao Feng <gfree.wind@vip.163.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Guilherme G. Piccoli <gpiccoli@linux.vnet.ibm.com>
  Haiqing Bai <Haiqing.Bai@windriver.com>
  Hao Chen <flank3rsky@gmail.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Ingo Molnar <mingo@kernel.org>
  Jack Pham <jackp@codeaurora.org>
  Jack Stocker <jackstocker.93@gmail.com>
  Jaegeuk Kim <jaegeuk@kernel.org>
  James Hogan <jhogan@kernel.org>
  Jan H. Schönherr <jschoenh@amazon.de>
  Jan Kara <jack@suse.cz>
  Jarkko Nikula <jarkko.nikula@linux.intel.com>
  Jason Gunthorpe <jgg@mellanox.com>
  Jeff Kirsher <jeffrey.t.kirsher@intel.com>
  Jeffy Chen <jeffy.chen@rock-chips.com>
  Jia-Ju Bai <baijiaju1990@163.com>
  Johannes Berg <johannes.berg@intel.com>
  Jon Maloy <jon.maloy@ericsson.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Junwei Zhang <Jerry.Zhang@amd.com> (v2)
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Karol Herbst <kherbst@redhat.com>
  Karsten Koop <kkoop@ld-didactic.de>
  Keith Busch <keith.busch@intel.com>
  Krzysztof Piotr Oledzki <ole@ans.pl>
  Lars-Peter Clausen <lars@metafoo.de>
  Leon Romanovsky <leon@kernel.org>
  Leon Romanovsky <leonro@mellanox.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Long Li <longli@microsoft.com>
  Lukas Wunner <lukas@wunner.de>
  Lukas Wunner <lukas@wunner.de> (v1)
  Luu An Phu <phu.luuan@nxp.com>
  Lvqiang Huang <Lvqiang.Huang@spreadtrum.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marc Zyngier <marc.zyngier@arm.com>
  Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
  Mark Brown <broonie@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin Schwidefsky <schwidefsky@de.ibm.com>
  Matthieu CASTET <matthieu.castet@parrot.com>
  Max Filippov <jcmvbkbc@gmail.com>
  Max Gurtovoy <maxg@mellanox.com>
  Mayank Rana <mrana@codeaurora.org>
  Michael Chan <michael.chan@broadcom.com>
  Michael Weiser <michael.weiser@gmx.de>
  Nikolay Borisov <nborisov@suse.com>
  Nitzan Carmi <nitzanc@mellanox.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Punit Agrawal <punit.agrawal@arm.com>
  Radu Pirea <radu.pirea@microchip.com>
  Richard Cochran <richardcochran@gmail.com>
  Richard Weinberger <richard@nod.at>
  Ross Lagerwall <ross.lagerwall@citrix.com>
  Ross Zwisler <ross.zwisler@linux.intel.com>
  Russell King <rmk+kernel@armlinux.org.uk>
  Sascha Hauer <s.hauer@pengutronix.de>
  Sasha Levin <alexander.levin@microsoft.com>
  Sean Wang <sean.wang@mediatek.com>
  Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
  Shahed Shaikh <Shahed.Shaikh@cavium.com>
  Shanker Donthineni <shankerd@codeaurora.org>
  Shigeru Yoshida <Shigeru.Yoshida@windriver.com>
  Siva Reddy Kallam <siva.kallam@broadcom.com>
  Stefan Haberland <sth@linux.vnet.ibm.com>
  Stefan Windfeldt-Prytz <stefan.windfeldt@axis.com>
  SZ Lin (林上智) <sz.lin@moxa.com>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thinh Nguyen <thinhn@synopsys.com>
  Thomas Gleixner <tglx@linutronix.de>
  Tommi Rantala <tommi.t.rantala@nokia.com>
  Tushar Dave <tushar.n.dave@oracle.com>
  Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
  Venkat Devvuru <venkatkumar.duvvuru@broadcom.com>
  Venkat Duvvuru <venkatkumar.duvvuru@broadcom.com>
  Vinod Koul <vinod.koul@intel.com>
  Waldemar Brodkorb <wbx@openadk.org>
  Will Deacon <will.deacon@arm.com>
  Will Deacon <will.deacon@arm.com>,
  Wolfram Sang <wsa@the-dreams.de>
  Xin Long <lucien.xin@gmail.com>
  Xiongwei Song <sxwjean@gmail.com>
  Yangbo Lu <yangbo.lu@nxp.com>
  Ying Xue <ying.xue@windriver.com>
  Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Yunlei He <heyunlei@huawei.com>

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
   19c04ca5b239..6a83eb235454  6a83eb2354543e3263b880eb822c4b0993a2236b -> tested/linux-4.9


--===============7243749015686653592==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7243749015686653592==--
