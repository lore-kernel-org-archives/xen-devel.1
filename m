From: Platform Team regression test user <citrix-osstest@xenproject.org>
Subject: [qemu-upstream-unstable baseline-only test] 74316:
	trouble: blocked/broken
Date: Fri, 12 Jan 2018 20:20:37 +0000
Message-ID: <osstest-74316-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2131307113687864390=="
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

--===============2131307113687864390==
Content-Type: text/plain

This run is configured for baseline tests only.

flight 74316 qemu-upstream-unstable real [real]
http://osstest.xs.citrite.net/~osstest/testlogs/logs/74316/

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
 build-armhf                   4 host-install(4)         broken REGR. vs. 72443
 build-armhf-xsm               4 host-install(4)         broken REGR. vs. 72443
 build-armhf-pvops             4 host-install(4)         broken REGR. vs. 72443
 build-i386                    4 host-install(4)         broken REGR. vs. 72443
 build-i386-xsm                4 host-install(4)         broken REGR. vs. 72443
 build-i386-pvops              4 host-install(4)         broken REGR. vs. 72443
 build-amd64-pvops             4 host-install(4)         broken REGR. vs. 72443
 build-amd64                   4 host-install(4)         broken REGR. vs. 72443
 build-amd64-xsm               4 host-install(4)         broken REGR. vs. 72443
 build-armhf-pvops             3 syslog-server                running
 build-armhf                   3 syslog-server                running
 build-armhf-xsm               3 syslog-server                running

Tests which did not succeed, but are not blocking:
 test-amd64-i386-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-i386-freebsd10-i386  1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-intel  1 build-check(1)              blocked n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-armhf-armhf-xl-midway    1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64-xsm  1 build-check(1)     blocked n/a
 test-amd64-i386-xl-qemuu-win10-i386  1 build-check(1)              blocked n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-amd64  1 build-check(1)               blocked  n/a
 test-amd64-amd64-pair         1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-win10-i386  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-pygrub       1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-amd64-xl-qcow2     1 build-check(1)               blocked  n/a
 test-amd64-amd64-amd64-pvgrub  1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-armhf-armhf-libvirt-xsm  1 build-check(1)               blocked  n/a
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
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-raw        1 build-check(1)               blocked  n/a
 test-amd64-amd64-i386-pvgrub  1 build-check(1)               blocked  n/a
 test-amd64-i386-qemuu-rhel6hvm-amd  1 build-check(1)               blocked n/a
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ws16-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-intel  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-i386-qemuu-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-amd64-xl           1 build-check(1)               blocked  n/a
 test-amd64-i386-pair          1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-amd  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-rtds      1 build-check(1)               blocked  n/a
 build-armhf-pvops             5 capture-logs           broken blocked in 72443
 build-armhf-xsm               5 capture-logs                 broken never pass
 build-armhf                   5 capture-logs                 broken never pass

version targeted for testing:
 qemuu                2b033e396f4fa0981bae1213cdacd15775655a97
baseline version:
 qemuu                b79708a8ed1b3d18bee67baeaf33b3fa529493e2

Last test of basis    72443  2017-11-13 23:16:21 Z   59 days
Testing same since    74316  2018-01-12 15:23:58 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Daniel P. Berrange" <berrange@redhat.com>
  Aaron Lindsay <alindsay@codeaurora.org>
  Alberto Garcia <berto@igalia.com>
  Aleksandr Bezzubikov <zuban32s@gmail.com>
  Alex Bennée <alex.bennee@linaro.org>
  Alex Williamson <alex.williamson@redhat.com>
  Alexander Graf <agraf@suse.de>
  Alexey Kardashevskiy <aik@ozlabs.ru>
  Alexey Perevalov <a.perevalov@samsung.com>
  Alistair Francis <alistair.francis@xilinx.com>
  Amador Pahim <apahim@redhat.com>
  Amarnath Valluri <amarnath.valluri@intel.com>
  Andreas Färber <afaerber@suse.de>
  Andrew Baumann <Andrew.Baumann@microsoft.com>
  Andrew Jeffery <andrew@aj.id.au>
  Andrew Jones <drjones@redhat.com>
  Anthoine Bourgeois <anthoine.bourgeois@blade-group.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Anton Nefedov <anton.nefedov@virtuozzo.com>
  Artyom Tarasenko <atar4qemu@gmail.com>
  BALATON Zoltan <balaton@eik.bme.hu>
  Benjamin Herrenschmidt <benh@kernel.crashing.org>
  Bishara AbuHattoum <bishara@daynix.com>
  Brad Smith <brad@comstyle.com>
  Brandon Carpenter <brandon.carpenter@cypherpath.com>
  Brijesh Singh <brijesh.singh@amd.com>
  Cao jin <caoj.fnst@cn.fujitsu.com>
  Carlo Marcelo Arenas Belón <carenas@gmail.com>
  Chao Gao <chao.gao@intel.com>
  Chen Hanxiao <chenhanxiao@gmail.com>
  Christian Borntraeger <borntraeger@de.ibm.com>
  Cleber Rosa <crosa@redhat.com>
  Collin L. Walling <walling@linux.vnet.ibm.com>
  Cornelia Huck <cohuck@redhat.com>
  Cornelia Huck <Cornelia Huck <cohuck@redhat.com>
  Cornelia Huck <cornelia.huck@de.ibm.com>
  Cédric Le Goater <clg@kaod.org>
  Dan Aloni <dan@kernelim.com>
  Daniel Henrique Barboza <danielhb@linux.vnet.ibm.com>
  Daniel P. Berrange <berrange@redhat.com>
  Dariusz Stojaczyk <dariuszx.stojaczyk@intel.com>
  David Gibson <david@gibson.dropbear.id.au>
  David Hildenbrand <david@redhat.com>
  Dong Jia Shi <bjsdjshi@linux.vnet.ibm.com>
  Dou Liyang <douly.fnst@cn.fujitsu.com>
  Dr. David Alan Gilbert <dgilbert@redhat.com>
  Ed Swierk <eswierk@skyportsystems.com>
  Edgar E. Iglesias <edgar.iglesias@xilinx.com>
  Eduardo Habkost <ehabkost@redhat.com>
  Eduardo Otubo <eduardo.otubo@profitbricks.com>
  Eduardo Otubo <otubo@redhat.com>
  Emilio G. Cota <cota@braap.org>
  Eric Auger <eric.auger@redhat.com>
  Eric Blake <eblake@redhat.com>
  Eric Farman <farman@linux.vnet.ibm.com>
  Fam Zheng <famz@redhat.com>
  Farhan Ali <alifm@linux.vnet.ibm.com>
  Felipe Franciosi <felipe@nutanix.com>
  Feng Kan <fkan@apm.com>
  Fred Rolland <frolland@redhat.com>
  Fred Rolland <rollandf@gmail.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Gonglei <arei.gonglei@huawei.com>
  Greg Kurz <groug@kaod.org>
  Halil Pasic <pasic@linux.vnet.ibm.com>
  Hannes Reinecke <hare@suse.com>
  Hannes Reinecke <hare@suse.de>
  Helge Deller <deller@gmx.de>
  Hua Yanghao <huayanghao@gmail.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Igor Mammedov <imammedo@redhat.com>
  James Clarke <jrtc27@jrtc27.com>
  James Cowgill <james.cowgill@mips.com>
  James Hogan <james.hogan@imgtec.com>
  Jan Dakinevich <jan.dakinevich@gmail.com>
  Jan Kiszka <jan.kiszka@siemens.com>
  Janosch Frank <frankja@linux.vnet.ibm.com>
  Jaroslaw Pelczar <j.pelczar@samsung.com>
  Jason J . Herne <jjherne@linux.vnet.ibm.com>
  Jason J. Herne <jjherne@linux.vnet.ibm.com>
  Jason Wang <jasowang@redhat.com>
  Jeff Cody <jcody@redhat.com>
  Jens Freimann <jfreimann@redhat.com>
  Jiang Biao <jiang.biao2@zte.com.cn>
  Jim Somerville <Jim.Somerville@windriver.com>
  Jindrich Makovicka <makovick@gmail.com>
  Joe Clifford <joeclifford@gmail.com>
  Joel Stanley <joel@jms.id.au>
  John Arbuckle <programmingkidx@gmail.com>
  John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
  John Snow <jsnow@redhat.com>
  Joseph Myers <joseph@codesourcery.com>
  Juan Quintela <quintela@redhat.com>
  Juergen Gross <jgross@suse.com>
  Kamil Rytarowski <n54@gmx.com>
  Kashyap Chamarthy <kchamart@redhat.com>
  Kevin Cernekee <cernekee@chromium.org>
  Kevin Wolf <kwolf@redhat.com>
  Knut Omang <knut.omang@oracle.com>
  KONRAD Frederic <frederic.konrad@adacore.com>
  Kurban Mallachiev <mallachiev@ispras.ru>
  Ladi Prosek <lprosek@redhat.com>
  Lan Tianyu <tianyu.lan@intel.com>
  Laszlo Ersek <lersek@redhat.com>
  Laurent Desnogues <laurent.desnogues@gmail.com>
  Laurent Vivier <laurent@vivier.eu>
  Laurent Vivier <lvivier@redhat.com>
  Liang Yan <lyan@suse.com>
  linzhecheng <linzhecheng@huawei.com>
  Lluís Vilanova <vilanova@ac.upc.edu>
  Longpeng <longpeng2@huawei.com>
  Lukáš Doktor <ldoktor@redhat.com>
  Manos Pitsidianakis <el13635@mail.ntua.gr>
  Mao Zhongyi <maozy.fnst@cn.fujitsu.com>
  Marc-André Lureau <marcandre.lureau@redhat.com>
  Marcel Apfelbaum <marcel@redhat.com>
  Marco A L Barbosa <malbarbo@gmail.com>
  Maria Klimushenkova <maria.klimushenkova@ispras.ru>
  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
  Mark Kanda <mark.kanda@oracle.com>
  Markus Armbruster <armbru@redhat.com>
  Matt Parker <mtparkr@gmail.com>
  Matt Redfearn <matt.redfearn@imgtec.com>
  Matthew Rosato <mjrosato@linux.vnet.ibm.com>
  Max Filippov <jcmvbkbc@gmail.com>
  Max Reitz <mreitz@redhat.com>
  Maxime Coquelin <maxime.coquelin@redhat.com>
  Michael Davidsaver <mdavidsaver@gmail.com>
  Michael Olbrich <m.olbrich@pengutronix.de>
  Michael Roth <mdroth@linux.vnet.ibm.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michael Tokarev <mjt@tls.msk.ru>
  Michael Walle <michael@walle.cc>
  Michal Privoznik <mprivozn@redhat.com>
  Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
  Mohammed Gamal <mohammed.gamal@profitbricks.com>
  Olaf Hering <olaf@aepfle.de>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul Burton <paul.burton@imgtec.com>
  Pavel Butsykin <pbutsykin@virtuozzo.com>
  Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
  Peter Krempa <pkrempa@redhat.com>
  Peter Lieven <pl@kamp.de>
  Peter Maydell <peter.maydell@linaro.org>
  Peter Xu <peterx@redhat.com>
  Philippe Mathieu-DaudÃ© <f4bug@amsat.org>
  Philippe Mathieu-Daudé <f4bug@amsat.org>
  Portia Stephens <portia.stephens@xilinx.com>
  Pranavkumar Sawargaonkar <pranavkumar@linaro.org>
  Pranith Kumar <bobby.prani@gmail.com>
  Prasad J Pandit <pjp@fedoraproject.org>
  Richard Henderson <richard.henderson@linaro.org>
  Richard Henderson <rth@twiddle.net>
  Richard Purdie <richard.purdie@linuxfoundation.org>
  Richard W.M. Jones <rjones@redhat.com>
  Riku Voipio <riku.voipio@linaro.org>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Roman Kagan <rkagan@virtuozzo.com>
  Ross Lagerwall <ross.lagerwall@citrix.com>
  Sam Bobroff <sam.bobroff@au1.ibm.com>
  Samuel Thibault <samuel.thibault@ens-lyon.org>
  Sandipan Das <sandipan@linux.vnet.ibm.com>
  Seeteena Thoufeek <s1seetee@linux.vnet.ibm.com>
  Sergio Lopez <slp@redhat.com>
  Shanker Donthineni <shankerd@codeaurora.org>
  Stafford Horne <shorne@gmail.com>
  Stefan Berger <stefanb@linux.vnet.ibm.com>
  Stefan Hajnoczi <stefanha@redhat.com>
  Stefan Weil <sw@weilnetz.de>
  Stefano Stabellini <sstabellini@kernel.org>
  Subbaraya Sundeep <sundeep.lkml@gmail.com>
  Suraj Jitindar Singh <sjitindarsingh@gmail.com>
  Tao Wu <lepton@google.com>
  Thomas Huth <huth@tuxfamily.org>
  Thomas Huth <thuth@redhat.com>
  Todd Eisenberger <teisenbe@google.com>
  Tushar Jagad <tushar.jagad@linaro.org>
  Vadim Galitsyn <vadim.galitsyn@profitbricks.com>
  Vasilis Liaskovitis <vasilis.liaskovitis@profitbricks.com>
  Viktor Mihajlovski <mihajlov@linux.vnet.ibm.com>
  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
  Wang Guang <wang.guang55@zte.com.cn>
  Wang Yong <wang.yong155@zte.com.cn>
  Wanpeng Li <wanpeng.li@hotmail.com>
  Wei Huang <wei@redhat.com>
  Wei Liu <wei.liu2@citrix.com>
  Wolfgang Bumiller <w.bumiller@proxmox.com>
  Xiao Guangrong <xiaoguangrong.eric@gmail.com>
  Yi Min Zhao <zyimin@linux.vnet.ibm.com>
  Yi Wang <wang.yi59@zte.com.cn>
  Yongbok Kim <yongbok.kim@imgtec.com>
  Yongbok Kim <yongbok.kim@mips.com>
  Yoni Bettan <ybettan@redhat.com>
  Yun Liu <liu.yunh@zte.com.cn>
  Zack Cornelius <zack.cornelius@kove.net>
  Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
  Zhang Chen <zhangckid@gmail.com>
  Zhengui <lizhengui@huawei.com>
  Zhipeng Lu <lu.zhipeng@zte.com.cn>

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
 test-amd64-amd64-xl                                          blocked 
 test-armhf-armhf-xl                                          blocked 
 test-amd64-i386-xl                                           blocked 
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           blocked 
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-xsm                blocked 
 test-amd64-i386-xl-qemuu-debianhvm-amd64-xsm                 blocked 
 test-amd64-amd64-libvirt-xsm                                 blocked 
 test-armhf-armhf-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  blocked 
 test-amd64-amd64-xl-xsm                                      blocked 
 test-armhf-armhf-xl-xsm                                      blocked 
 test-amd64-i386-xl-xsm                                       blocked 
 test-amd64-amd64-qemuu-nested-amd                            blocked 
 test-amd64-amd64-xl-pvhv2-amd                                blocked 
 test-amd64-i386-qemuu-rhel6hvm-amd                           blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    blocked 
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     blocked 
 test-amd64-i386-freebsd10-amd64                              blocked 
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         blocked 
 test-amd64-i386-xl-qemuu-ovmf-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-win7-amd64                         blocked 
 test-amd64-i386-xl-qemuu-win7-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-ws16-amd64                         blocked 
 test-amd64-i386-xl-qemuu-ws16-amd64                          blocked 
 test-amd64-amd64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  blocked 
 test-amd64-i386-freebsd10-i386                               blocked 
 test-amd64-amd64-xl-qemuu-win10-i386                         blocked 
 test-amd64-i386-xl-qemuu-win10-i386                          blocked 
 test-amd64-amd64-qemuu-nested-intel                          blocked 
 test-amd64-amd64-xl-pvhv2-intel                              blocked 
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
broken-step build-armhf host-install(4)
broken-step build-armhf-xsm host-install(4)
broken-step build-armhf-pvops host-install(4)
broken-step build-armhf-xsm capture-logs
broken-step build-armhf capture-logs
broken-step build-armhf-pvops capture-logs
broken-step build-i386 host-install(4)
broken-step build-i386-xsm host-install(4)
broken-step build-i386-pvops host-install(4)
broken-step build-amd64-pvops host-install(4)
broken-step build-amd64 host-install(4)
broken-step build-amd64-xsm host-install(4)

Push not applicable.

(No revision log; it would be 39057 lines long.)


--===============2131307113687864390==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2131307113687864390==--
