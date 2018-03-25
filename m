From: osstest service owner <osstest-admin@xenproject.org>
Subject: [linux-3.18 test] 121099: tolerable FAIL - PUSHED
Date: Sun, 25 Mar 2018 10:08:30 +0000
Message-ID: <osstest-121099-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5068538746817134487=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=uz8o=gp=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1f02Zp-0003L2-14
 for xen-devel@lists.xenproject.org; Sun, 25 Mar 2018 10:08:37 +0000
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

--===============5068538746817134487==
Content-Type: text/plain

flight 121099 linux-3.18 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/121099/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-vhd      18 leak-check/check fail in 121053 pass in 121099
 test-armhf-armhf-xl           5 host-ping-check-native     fail pass in 121053

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl         13 migrate-support-check fail in 121053 never pass
 test-armhf-armhf-xl     14 saverestore-support-check fail in 121053 never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 120977
 test-armhf-armhf-libvirt-xsm 14 saverestore-support-check    fail  like 120977
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 120977
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 120977
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 120977
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 120977
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 120977
 test-amd64-amd64-xl-pvhv2-intel 12 guest-start                 fail never pass
 test-amd64-amd64-xl-pvhv2-amd 12 guest-start                  fail  never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 build-arm64-pvops             6 kernel-build                 fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-xsm      13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemut-win10-i386 10 windows-install         fail never pass
 test-amd64-i386-xl-qemuu-win10-i386 10 windows-install         fail never pass
 test-amd64-amd64-xl-qemuu-win10-i386 10 windows-install        fail never pass
 test-amd64-amd64-xl-qemut-win10-i386 10 windows-install        fail never pass

version targeted for testing:
 linux                44ec71c0cd728e8cbd346e135eef9b43b03654ab
baseline version:
 linux                5fcd9374919e35f015c283d6900a1f0fca00477e

Last test of basis   120977  2018-03-19 23:54:00 Z    5 days
Testing same since   121053  2018-03-22 08:45:13 Z    2 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Akinobu Mita <akinobu.mita@gmail.com>
  Al Viro <viro@zeniv.linux.org.uk>
  Alan Stern <stern@rowland.harvard.edu>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Potapenko <glider@google.com>
  Andreas Pape <apape@phoenixcontact.com>
  Andrew F. Davis <afd@ti.com>
  Andrew Lunn <andrew@lunn.ch>
  Anton Blanchard <anton@samba.org>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
  Benjamin Tissoires <benjamin.tissoires@redhat.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Boris Brezillon <boris.brezillon@free-electrons.com>
  Brian King <brking@linux.vnet.ibm.com>
  Chris Clayton <chris2553@googlemail.com>
  Chris Wilson <chris@chris-wilson.co.uk>
  Christopher James Halse Rogers <christopher.halse.rogers@canonical.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  David Carrillo-Cisneros <davidcc@google.com>
  David Daney <david.daney@cavium.com>
  David Engraf <david.engraf@sysgo.com>
  David S. Miller <davem@davemloft.net>
  Davide Caratti <dcaratti@redhat.com>
  Dedy Lansky <qca_dlansky@qca.qualcomm.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Douglas Gilbert <dgilbert@interlog.com>
  Eric Dumazet <edumazet@google.com>
  Felipe Balbi <felipe.balbi@linux.intel.com>
  Gao Feng <fgao@ikuai8.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guennadi Liakhovetski <g.liakhovetski@gmx.de>
  H. Nikolaus Schaller <hns@goldelico.com>
  Hannes Reinecke <hare@suse.com>
  Hannes Reinecke <hare@suse.de>
  Hans Verkuil <hans.verkuil@cisco.com>
  Ingo Molnar <mingo@kernel.org>
  Iyappan Subramanian <isubramanian@apm.com>
  James Morris <james.l.morris@oracle.com>
  Jan Kara <jack@suse.cz>
  Janusz Krzysztofik <jmkrzyszt@gmail.com>
  Jason L Tibbitts III <tibbs@math.uh.edu>
  Jeff Kirsher <jeffrey.t.kirsher@intel.com>
  Jens Axboe <axboe@fb.com>
  Jiri Kosina <jkosina@suse.cz>
  Jiri Olsa <jolsa@kernel.org>
  Jiri Olsa <jolsa@redhat.com>
  Joerg Roedel <jroedel@suse.de>
  Johannes Berg <johannes.berg@intel.com>
  Johannes Thumshirn <jthumshirn@suse.de>
  John Johansen <john.johansen@canonical.com>
  John Stultz <john.stultz@linaro.org>
  Jonas Jensen <jonas.jensen@gmail.com>
  Julien BOIBESSOT <julien.boibessot@armadeus.com>
  Kalle Valo <kvalo@qca.qualcomm.com>
  Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
  Krishneil Singh <krishneil.k.singh@intel.com>
  Liam Beguin <lbeguin@tycoint.com>
  Linus Walleij <linus.walleij@linaro.org>
  Lorenzo Colitti <lorenzo@google.com>
  Luca Coelho <luciano.coelho@intel.com>
  Mark Brown <broonie@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Masami Hiramatsu <mhiramat@kernel.org>
  Mauro Carvalho Chehab <mchehab@s-opensource.com>
  Maxime Ripard <maxime.ripard@free-electrons.com>
  Maya Erez <qca_merez@qca.qualcomm.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Mimi Zohar <zohar@linux.vnet.ibm.com>
  Miquel Raynal <miquel.raynal@free-electrons.com>
  Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
  Nate Watterson <nwatters@codeaurora.org>
  Olof Johansson <olof@lixom.net>
  Paul E. McKenney <paulmck@linux.vnet.ibm.com>
  Paul Moore <paul@paul-moore.com>
  Petr Mladek <pmladek@suse.com>
  Phil Turnbull <phil.turnbull@oracle.com>
  Prarit Bhargava <prarit@redhat.com>
  Quan Nguyen <qnguyen@apm.com>
  Ralf Baechle <ralf@linux-mips.org>
  Rob Herring <robh@kernel.org>
  Samuel Thibault <samuel.thibault@ens-lyon.org>
  Sasha Levin <alexander.levin@microsoft.com>
  SeongJae Park <sj38.park@gmail.com>
  Shaohua Li <shli@fb.com>
  Shuah Khan <shuahkh@osg.samsung.com>
  Simon Horman <horms+renesas@verge.net.au>
  Simon Wunderlich <sw@simonwunderlich.de>
  Steffen Klassert <steffen.klassert@secunet.com>
  Stephane Eranian <eranian@google.com>
  Stephen Hemminger <stephen@networkplumber.org>
  Stephen Hemminger <sthemmin@microsoft.com>
  Sven Eckelmann <sven@narfation.org>
  Sylvain Lemieux <slemieux@tycoint.com>
  Takashi Iwai <tiwai@suse.de>
  Tejun Heo <tj@kernel.org>
  Tobias Jordan <Tobias.Jordan@elektrobit.com>
  Tomasz Kramkowski <tk@the-tk.com>
  Tony Lindgren <tony@atomide.com>
  Valtteri Heikkilä <rnd@nic.fi>
  Vincent Stehlé <vincent.stehle@laposte.net>
  Wendy Xiong <wenxiong@linux.vnet.ibm.com>
  Xose Vazquez Perez <xose.vazquez@gmail.com>
  Yuyang Du <yuyang.du@intel.com>

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
 test-armhf-armhf-xl                                          fail    
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
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
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
   5fcd9374919e..44ec71c0cd72  44ec71c0cd728e8cbd346e135eef9b43b03654ab -> tested/linux-3.18


--===============5068538746817134487==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5068538746817134487==--
