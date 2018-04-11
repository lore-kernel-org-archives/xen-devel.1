From: Platform Team regression test user <citrix-osstest@xenproject.org>
Subject: [qemu-mainline baseline-only test] 74574: trouble:
 blocked/broken/fail/pass
Date: Wed, 11 Apr 2018 10:32:39 +0100
Message-ID: <osstest-74574-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1396115381139327114=="
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

--===============1396115381139327114==
Content-Type: text/plain

This run is configured for baseline tests only.

flight 74574 qemu-mainline real [real]
http://osstest.xs.citrite.net/~osstest/testlogs/logs/74574/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64                     <job status>                 broken
 build-arm64-pvops               <job status>                 broken
 build-arm64-xsm                 <job status>                 broken

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 build-arm64-libvirt           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 build-arm64                   2 hosts-allocate               broken never pass
 build-arm64-xsm               2 hosts-allocate               broken never pass
 build-arm64-pvops             2 hosts-allocate               broken never pass
 build-arm64-xsm               3 capture-logs                 broken never pass
 build-arm64                   3 capture-logs                 broken never pass
 build-arm64-pvops             3 capture-logs                 broken never pass
 test-amd64-amd64-xl-qemuu-win10-i386 10 windows-install  fail blocked in 74553
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop       fail blocked in 74553
 test-armhf-armhf-libvirt-xsm 12 guest-start                  fail   like 74553
 test-armhf-armhf-xl-xsm      12 guest-start                  fail   like 74553
 test-armhf-armhf-xl-rtds     12 guest-start                  fail   like 74553
 test-armhf-armhf-libvirt     12 guest-start                  fail   like 74553
 test-armhf-armhf-xl-multivcpu 12 guest-start                  fail  like 74553
 test-armhf-armhf-xl          12 guest-start                  fail   like 74553
 test-armhf-armhf-xl-midway   12 guest-start                  fail   like 74553
 test-armhf-armhf-xl-credit2  12 guest-start                  fail   like 74553
 test-amd64-amd64-qemuu-nested-intel 14 xen-boot/l1             fail like 74553
 test-armhf-armhf-xl-vhd      10 debian-di-install            fail   like 74553
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop              fail like 74553
 test-armhf-armhf-libvirt-raw 10 debian-di-install            fail   like 74553
 test-amd64-i386-xl-qemuu-win10-i386 17 guest-stop              fail like 74553
 test-amd64-amd64-xl-qemuu-ws16-amd64 10 windows-install        fail never pass
 test-amd64-amd64-xl-pvhv2-intel 12 guest-start                 fail never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-xl-pvhv2-amd 12 guest-start                  fail  never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass

version targeted for testing:
 qemuu                915d34c5f99b0ab91517c69f54272bfdb6ca2b32
baseline version:
 qemuu                6697439794f72b3501ee16bb95d16854f9981421

Last test of basis    74553  2018-04-06 11:27:51 Z    4 days
Testing same since    74574  2018-04-10 23:20:14 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alberto Garcia <berto@igalia.com>
  Alex BennÃ©e <alex.bennee@linaro.org>
  Alex Bennée <alex.bennee@linaro.org>
  Alex Williamson <alex.williamson@redhat.com>
  Alexandro Sanchez Bach <alexandro@phi.nz>
  Alexey Kardashevskiy <aik@ozlabs.ru>
  Alistair Francis <alistair.francis@xilinx.com>
  Alistair Francis <alistair@alistair23.me>
  Andrew Jones <drjones@redhat.com>
  Andrey Smirnov <andrew.smirnov@gmail.com>
  Anton Nefedov <anton.nefedov@virtuozzo.com>
  BALATON Zoltan <balaton@eik.bme.hu>
  Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
  Bastian Koppelmann <kbastian@mail.uni-paderborn.de> (tricore)
  Bill Paul <wpaul@windriver.com>
  Brijesh Singh <brijesh.singh@amd.com>
  Bruce Rogers <brogers@suse.com>
  Changpeng Liu <changpeng.liu@intel.com>
  Chao Peng <chao.p.peng@linux.intel.com>
  Christian Borntraeger <borntraeger@de.ibm.com>
  Christophe Fergeau <cfergeau@redhat.com>
  Claudio Imbrenda <imbrenda@linux.vnet.ibm.com>
  Collin L. Walling <walling@linux.vnet.ibm.com>
  Corey Minyard <cminyard@mvista.com>
  Cornelia Huck <cohuck@redhat.com>
  Cédric Le Goater <clg@kaod.org>
  Daire McNamara <daire.mcnamara@emdalo.com>
  Daniel Henrique Barboza <danielhb@linux.vnet.ibm.com>
  Daniel P. Berrange <berrange@redhat.com>
  Daniel P. Berrangé <berrange@redhat.com>
  David Brenken <david.brenken@efs-auto.de>
  David Engraf <david.engraf@sysgo.com>
  David Gibson <david@gibson.dropbear.id.au>
  David Gibson <david@gibson.dropbear.id.au> (hw/ppc)
  David Gibson <david@gibson.dropbear.id.au> (ppc)
  David Gibson <david@gibson.dropbear.id.au> for ppc part
  David Hildenbrand <david@redhat.com>
  Deepa Srinivasan <deepa.srinivasan@oracle.com>
  Dr. David Alan Gilbert <dgilbert@redhat.com>
  Eduardo Habkost <ehabkost@redhat.com>
  Elie Tournier <elie.tournier@collabora.com>
  Elie Tournier <tournier.elie@gmail.com>
  Emilio G. Cota <cota@braap.org>
  Eric Auger <eric.auger@redhat.com>
  Eric Blake <eblake@redhat.com>
  Eugene Minibaev <mail@kitsu.me>
  Fabiano Rosas <farosas@linux.vnet.ibm.com>
  Fam Zheng <famz@redhat.com>
  Florian Artmeier <florian.artmeier@efs-auto.de>
  Francisco Iglesias <frasse.iglesias@gmail.com>
  François Revol <revol@free.fr>
  Georg Hofstetter <georg.hofstetter@efs-auto.de>
  Gerd Hoffmann <kraxel@redhat.com>
  Gonglei <arei.gonglei@huawei.com>
  Greg Kurz <groug@kaod.org>
  Guenter Roeck <linux@roeck-us.net>
  Halil Pasic <pasic@linux.vnet.ibm.com>
  Haozhong Zhang <haozhong.zhang@intel.com>
  Howard Spoelstra <hsp.cat7@gmail.com>
  Huaitong Han <huanhuaitong@didichuxing.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Igor Mammedov <imammedo@redhat.com>
  Ivan Griffin <ivan.griffin@emdalo.com>
  Jack Schwartz <jack.schwartz@oracle.com>
  Jan Kiszka <jan.kiszka@siemens.com>
  Janosch Frank <frankja@linux.vnet.ibm.com>
  Jason Baron <jbaron@akamai.com>
  Jason Wang <jasowang@redhat.com>
  Jay Zhou <jianjay.zhou@huawei.com>
  Jeff Cody <jcody@redhat.com>
  Jia He <hejianet@gmail.com>
  Jia He <jia.he@hxt-semitech.com>
  John Snow <jsnow@redhat.com>
  Julia Suvorova <jusual@mail.ru>
  Julia Suvorova via Qemu-devel <qemu-devel@nongnu.org>
  Justin Terry (VM) <juterry@microsoft.com>
  Justin Terry (VM) via Qemu-devel <qemu-devel@nongnu.org>
  Kashyap Chamarthy <kchamart@redhat.com>
  Kevin Wolf <kwolf@redhat.com>
  KONRAD Frederic <frederic.konrad@adacore.com>
  Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
  Laurent Vivier <laurent@vivier.eu>
  Laurent Vivier <lvivier@redhat.com>
  Liang Li <liliang.opensource@gmail.com>
  Liang Li <liliangleo@didichuxing.com>
  Lidong Chen <jemmy858585@gmail.com>
  Lidong Chen <lidongchen@tencent.com>
  Linus Walleij <linus.walleij@linaro.org>
  linzhecheng <linzhecheng@huawei.com>
  Liran Alon <liran.alon@oracle.com>
  Longpeng(Mike) <longpeng2@huawei.com>
  Luiz Capitulino <lcapitulino@redhat.com>
  Luke Shumaker <lukeshu@parabola.nu>
  Lukáš Doktor <ldoktor@redhat.com>
  Luwei Kang <luwei.kang@intel.com>
  Marc-AndrÃ© Lureau <marcandre.lureau@redhat.com>
  Marc-André Lureau <marcandre.lureau@redhat.com>
  Marcel Apfelbaum <marcel@redhat.com>
  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
  Markus Armbruster <armbru@redhat.com>
  Matthew Rosato <mjrosato@linux.vnet.ibm.com>
  Max Filippov <jcmvbkbc@gmail.com>
  Max Reitz <mreitz@redhat.com>
  Maxime Coquelin <maxime.coquelin@redhat.com>
  Michael Chapman <mike@very.puzzling.org>
  Michael Clark <mjc@sifive.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michal Privoznik <mprivozn@redhat.com>
  Miroslav Rezanina <mrezanin@redhat.com>
  Nia Alarie <nia.alarie@gmail.com>
  Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>
  Palmer Dabbelt <palmer@sifive.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
  Peer Adelt <peer.adelt@hni.uni-paderborn.de>
  Peter Lieven <pl@kamp.de>
  Peter Maydell <peter.maydell@linaro.org>
  Peter Xu <peterx@redhat.com>
  Philippe Mathieu-Daudé <f4bug@amsat.org>
  Pierre Morel <pmorel@linux.vnet.ibm.com>
  R. Nageswara Sastry <nasastry@in.ibm.com>
  Richard Henderson <richard.henderson@linaro.org>
  Richard W.M. Jones <rjones@redhat.com>
  Roman Kagan <rkagan@virtuozzo.com>
  Ross Lagerwall <ross.lagerwall@citrix.com>
  Sagar Karandikar <sagark@eecs.berkeley.edu>
  Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
  Sergio Lopez <slp@redhat.com>
  Shea Levy <shea@shealevy.com>
  Simon Guo <wei.guo.simon@gmail.com>
  Stef O'Rear <sorear2@gmail.com>
  Stefan Berger <stefanb@linux.vnet.ibm.com>
  Stefan Hajnoczi <stefanha@redhat.com>
  Stefan O'Rear <sorear2@gmail.com>
  Su Hang <suhang16@mails.ucas.ac.cn>
  Suraj Jitindar Singh <sjitindarsingh@gmail.com>
  Thomas Huth <thuth@redhat.com>
  Tomáš Golembiovský <tgolembi@redhat.com>
  Trent Piepho <tpiepho@impinj.com>
  Victor Kamensky <kamensky@cisco.com>
  Viktor Mihajlovski <mihajlov@linux.vnet.ibm.com>
  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
  Wang Xin <wangxinxin.wang@huawei.com>
  Wanpeng Li <wanpengli@tencent.com>
  Wei Huang <wei@redhat.com>
  Yasmin Beatriz <yasmins@linux.vnet.ibm.com>
  Yi Min Zhao <zyimin@linux.vnet.ibm.com>
  yuchenlin <yuchenlin@synology.com>
  Yuval Shaia <yuval.shaia@oracle.com>
  zhangjixiang <jixiang_zhang@h3c.com>
  zhenwei.pi <zhenwei.pi@youruncloud.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              broken  
 build-armhf-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  broken  
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          blocked 
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            broken  
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          fail    
 test-amd64-i386-xl                                           pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-xsm                pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-armhf-armhf-libvirt-xsm                                 fail    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      blocked 
 test-armhf-armhf-xl-xsm                                      fail    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                fail    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  fail    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-xl-qemuu-win10-i386                         fail    
 test-amd64-i386-xl-qemuu-win10-i386                          fail    
 test-amd64-amd64-qemuu-nested-intel                          fail    
 test-amd64-amd64-xl-pvhv2-intel                              fail    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-i386-libvirt                                      pass    
 test-armhf-armhf-xl-midway                                   fail    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-xl-vhd                                      fail    


------------------------------------------------------------
sg-report-flight on osstest.xs.citrite.net
logs: /home/osstest/logs
images: /home/osstest/images

Logs, config files, etc. are available at
    http://osstest.xs.citrite.net/~osstest/testlogs/logs

Test harness code can be found at
    http://xenbits.xensource.com/gitweb?p=osstest.git;a=summary

broken-job build-arm64 broken
broken-job build-arm64-pvops broken
broken-job build-arm64-xsm broken
broken-step build-arm64 hosts-allocate
broken-step build-arm64-xsm hosts-allocate
broken-step build-arm64-pvops hosts-allocate
broken-step build-arm64-xsm capture-logs
broken-step build-arm64 capture-logs
broken-step build-arm64-pvops capture-logs

Push not applicable.

(No revision log; it would be 22094 lines long.)


--===============1396115381139327114==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1396115381139327114==--
