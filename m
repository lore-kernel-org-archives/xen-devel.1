From: Platform Team regression test user <citrix-osstest@xenproject.org>
Subject: [qemu-mainline baseline-only test] 74493: trouble:
 blocked/broken/queued/running
Date: Fri, 6 Apr 2018 11:58:41 +0100
Message-ID: <osstest-74493-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7240165884733313806=="
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

--===============7240165884733313806==
Content-Type: text/plain

This run is configured for baseline tests only.

flight 74493 qemu-mainline running [real]
http://osstest.xs.citrite.net/~osstest/testlogs/logs/74493/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                     <job status>                 broken
 build-armhf-pvops               <job status>                 broken
 build-i386-xsm                  <job status>                 broken
 build-amd64-xsm                 <job status>                 broken
 build-amd64-pvops               <job status>                 broken
 build-i386-pvops                <job status>                 broken
 build-armhf-xsm                 <job status>                 broken
 build-armhf                     <job status>                 broken
 test-amd64-i386-pair            <none executed>              queued
 test-amd64-i386-qemuu-rhel6hvm-intel    <none executed>              queued
 test-amd64-i386-xl-qemuu-ovmf-amd64    <none executed>              queued
 test-amd64-i386-freebsd10-amd64    <none executed>              queued
 test-amd64-i386-libvirt-qcow2    <none executed>              queued
 test-amd64-i386-xl-qemuu-win10-i386    <none executed>              queued
 test-amd64-i386-libvirt         <none executed>              queued
 test-amd64-i386-xl-qemuu-ws16-amd64    <none executed>              queued
 test-amd64-i386-freebsd10-i386    <none executed>              queued
 test-amd64-i386-xl-qemuu-win7-amd64    <none executed>              queued
 test-amd64-i386-xl-qemuu-debianhvm-amd64    <none executed>             queued
 test-amd64-i386-libvirt-xsm     <none executed>              queued
 test-amd64-i386-xl-raw          <none executed>              queued
 build-i386-libvirt              <none executed>              queued
 test-amd64-i386-libvirt-pair    <none executed>              queued
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm    <none executed>    queued
 test-amd64-i386-qemuu-rhel6hvm-amd    <none executed>              queued
 test-amd64-i386-xl              <none executed>              queued
 build-i386                    3 syslog-server                running
 build-armhf-pvops             3 syslog-server                running
 build-armhf                   3 syslog-server                running
 build-armhf-xsm               3 syslog-server                running
 build-i386                    4 host-install(4)              running

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-amd64-qemuu-nested-intel  1 build-check(1)              blocked n/a
 test-armhf-armhf-xl-midway    1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64-xsm  1 build-check(1)     blocked n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-pair         1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-win10-i386  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-pygrub       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qcow2     1 build-check(1)               blocked  n/a
 test-amd64-amd64-amd64-pvgrub  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit2   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-xsm        1 build-check(1)               blocked  n/a
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-xsm  1 build-check(1)    blocked n/a
 test-amd64-amd64-i386-pvgrub  1 build-check(1)               blocked  n/a
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ws16-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-intel  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-amd  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-rtds      1 build-check(1)               blocked  n/a
 build-amd64-pvops             4 host-install(4)       broken baseline untested
 build-amd64                   4 host-install(4)       broken baseline untested
 build-amd64-xsm               4 host-install(4)       broken baseline untested
 build-armhf                   4 host-install(4)       broken baseline untested
 build-armhf-pvops             4 host-install(4)       broken baseline untested
 build-i386-xsm                4 host-install(4)       broken baseline untested
 build-i386-pvops              4 host-install(4)       broken baseline untested
 build-armhf-xsm               4 host-install(4)       broken baseline untested
 build-armhf-xsm               5 capture-logs          broken baseline untested
 build-armhf                   5 capture-logs          broken baseline untested
 build-armhf-pvops             5 capture-logs          broken baseline untested

version targeted for testing:
 qemuu                6697439794f72b3501ee16bb95d16854f9981421
baseline version:
 qemuu                7398166ddf7c6dbbc9cae6ac69bb2feda14b40ac

Last test of basis    74401  2018-01-14 05:58:16 Z   82 days
Testing same since                          (not found)         0 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alberto Garcia <berto@igalia.com>
  Alex Bennée <alex.bennee@linaro.org>
  Alex Williamson <alex.williamson@redhat.com>
  Alexey Kardashevskiy <aik@ozlabs.ru>
  Alexey Perevalov <a.perevalov@samsung.com>
  Alice Frosi <alice@linux.vnet.ibm.com>
  Alistair Francis <alistair.francis@xilinx.com>
  Amador Pahim <apahim@redhat.com>
  Anatoly Trosinenko <anatoly.trosinenko@gmail.com>
  Andreas Gustafsson <gson@gson.org>
  Andreas Schwab <schwab@suse.de>
  Andrew Jeffery <andrew@aj.id.au>
  Andrey Smirnov <andrew.smirnov@gmail.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Anton Nefedov <anton.nefedov@virtuozzo.com>
  Ard Biesheuvel <ard.biesheuvel@linaro.org>
  Artyom Tarasenko <atar4qemu@gmail.com>
  BALATON Zoltan <balaton@eik.bme.hu>
  Bandan Das <bsd@redhat.com>
  Brad Smith <brad@comstyle.com>
  Cao jin <caoj.fnst@cn.fujitsu.com>
  Changpeng Liu <changpeng.liu@intel.com>
  Christian Borntraeger <borntraeger@de.ibm.com>
  Christoffer Dall <christoffer.dall@linaro.org>
  Claudio Imbrenda <imbrenda@linux.vnet.ibm.com>
  Cole Robinson <crobinso@redhat.com>
  Corey Minyard <cminyard@mvista.com>
  Cornelia Huck <cohuck@redhat.com>
  Cédric Le Goater <clg@kaod.org>
  Daniel Barboza <danielhb@linux.vnet.ibm.com>
  Daniel Henrique Barboza <danielhb@linux.vnet.ibm.com>
  Daniel P. Berrange <berrange@redhat.com>
  Daniel P. Berrangé <berrange@redhat.com>
  Dave Airlie <airlied@redhat.com>
  David Gibson <david@gibson.dropbear.id.au>
  David Hildenbrand <david@redhat.com>
  Denis V. Lunev <den@openvz.org>
  Deniz Eren <deniz.eren@icloud.com>
  Dou Liyang <douly.fnst@cn.fujitsu.com>
  Dr. David Alan Gilbert <dgilbert@redhat.com>
  Edgar E. Iglesias <edgar.iglesias@xilinx.com>
  Edgar Kaziakhmedov <edgar.kaziakhmedov@virtuozzo.com>
  Eduardo Habkost <ehabkost@redhat.com>
  Emilio G. Cota <cota@braap.org>
  Eric Auger <eric.auger@redhat.com>
  Eric Blake <eblake@redhat.com>
  Fam Zheng <famz@redhat.com>
  Francisco Iglesias <frasse.iglesias@gmail.com>
  Frediano Ziglio <fziglio@redhat.com>
  Fyleo  <fyleo45@gmail.com>
  Gal Hammer <ghammer@redhat.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Greg Kurz <groug@kaod.org>
  Guido Günther <agx@sigxcpu.org>
  Haozhong Zhang <haozhong.zhang@intel.com>
  Helge Deller <deller@gmx.de>
  Hervé Poussineau <hpoussin@reactos.org>
  Hikaru Nishida <hikarupsp@gmail.com>
  Howard Spoelstra <hsp.cat7@gmail.com>
  Hugo Landau <hlandau@devever.net>
  Igor Mammedov <imammedo@redhat.com>
  Izik Eidus <izik@veertu.com>
  Jan Beulich <jbeulich@suse.com>
  Jan Dakinevich <jan.dakinevich@virtuozzo.com>
  Jan Kiszka <jan.kiszka@siemens.com>
  Jason Wang <jasowang@redhat.com>
  Jay Zhou <jianjay.zhou@huawei.com>
  Jean-Christophe Dubois <jcd@tribudubois.net>
  Jeff Cody <jcody@redhat.com>
  Jindrich Makovicka <makovick@gmail.com>
  John Arbuckle <programmingkidx@gmail.com>
  John Snow <jsnow@redhat.com>
  Jon Emil Jahren <jonemilj@gmail.com>
  Jose Ricardo Ziviani <joserz@linux.vnet.ibm.com>
  Juan Quintela <quintela@redhat.com>
  Justin Terry (VM) <juterry@microsoft.com>
  Keno Fischer <keno@juliacomputing.com>
  Kevin Wolf <kwolf@redhat.com>
  Klim Kireev <klim.kireev@virtuozzo.com>
  Ladi Prosek <lprosek@redhat.com>
  Laszlo Ersek <lersek@redhat.com>
  Laurent Vivier <laurent@vivier.eu>
  Laurent Vivier <lvivier@redhat.com>
  Li Zhijian <lizhijian@cn.fujitsu.com>
  Liang Li <liliangleo@didichuxing.com>
  Linus Walleij <linus.walleij@linaro.org>
  linzhecheng <linzc@zju.edu.cn>
  linzhecheng <linzhecheng@huawei.com>
  Luc MICHEL <luc.michel@git.antfield.fr>
  Mao Zhongyi <maozy.fnst@cn.fujitsu.com>
  Marc-André Lureau <marcandre.lureau@redhat.com>
  Marcel Apfelbaum <marcel@redhat.com>
  Marcelo Tosatti <mtosatti@redhat.com>
  Marco A L Barbosa <malbarbo@gmail.com>
  Maria Klimushenkova <maria.klimushenkova@ispras.ru>
  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
  Markus Armbruster <armbru@redhat.com>
  Max Filippov <jcmvbkbc@gmail.com>
  Max Reitz <mreitz@redhat.com>
  Maxime Coquelin <maxime.coquelin@redhat.com>
  Maximilian Riemensberger <riemensberger@cadami.net>
  Michael Roth <mdroth@linux.vnet.ibm.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michael Tokarev <mjt@tls.msk.ru>
  Michael Walle <michael@walle.cc>
  Mihail Abakumov <mikhail.abakumov@ispras.ru>
  Miika S <miika9764@gmail.com>
  Mohammed Gamal <mgamal@redhat.com>
  Murilo Opsfelder Araujo <muriloo@linux.vnet.ibm.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
  Pavel Pisa <pisa@cmp.felk.cvut.cz>
  pbonzini@redhat.com <pbonzini@redhat.com>
  Pekka Enberg <penberg@iki.fi>
  Peter Lieven <pl@kamp.de>
  Peter Maydell <peter.maydell@linaro.org>
  Peter Xu <peterx@redhat.com>
  Philippe Mathieu-DaudÃ© <f4bug@amsat.org>
  Philippe Mathieu-Daudé <f4bug@amsat.org>
  Pierre Morel <pmorel@linux.vnet.ibm.com>
  Prasad J Pandit <pjp@fedoraproject.org>
  Prasad Singamsetty <prasad.singamsetty@oracle.com>
  Prasad Singamsetty <prasad.singamsety@oracle.com>
  Richard Braun <rbraun@sceen.net>
  Richard Henderson <richard.henderson@linaro.org>
  Roman Kagan <rkagan@virtuozzo.com>
  Ross Lagerwall <ross.lagerwall@citrix.com>
  Sai Pavan Boddu <saipava@xilinx.com>
  Samuel Thibault <samuel.thibault@ens-lyon.org>
  Stafford Horne <shorne@gmail.com>
  Stefan Berger <stefanb@linux.vnet.ibm.com>
  Stefan Hajnoczi <stefanha@redhat.com>
  Suraj Jitindar Singh <sjitindarsingh@gmail.com>
  Tao Wu <lepton@google.com>
  Thomas Huth <thuth@redhat.com>
  thuth@redhat.com <thuth@redhat.com>
  Tiwei Bie <tiwei.bie@intel.com>
  Tomáš Golembiovský <tgolembi@redhat.com>
  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
  Wei Huang <wei@redhat.com>
  Wei Wang <wei.w.wang@intel.com>
  Weiping Zhang <zhangweiping@didichuxing.com>
  Wolfgang Bumiller <w.bumiller@proxmox.com>
  Yi Min Zhao <zyimin@linux.vnet.ibm.com>
  Yongji Xie <elohimes@gmail.com>
  Yongji Xie <xieyongji@baidu.com>
  Yoni Bettan <ybettan@redhat.com>
  Yu Ning <yu.ning@intel.com>
  YunQiang Su <syq@debian.org>
  Yuval Shaia <yuval.shaia@oracle.com>
  Zhang Chen <zhangckid@gmail.com>

jobs:
 build-amd64-xsm                                              broken  
 build-armhf-xsm                                              broken  
 build-i386-xsm                                               broken  
 build-amd64                                                  broken  
 build-armhf                                                  broken  
 build-i386                                                   running 
 build-amd64-libvirt                                          blocked 
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           queued  
 build-amd64-pvops                                            broken  
 build-armhf-pvops                                            broken  
 build-i386-pvops                                             broken  
 test-amd64-amd64-xl                                          blocked 
 test-armhf-armhf-xl                                          blocked 
 test-amd64-i386-xl                                           queued  
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           blocked 
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            queued  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-xsm                blocked 
 test-amd64-i386-xl-qemuu-debianhvm-amd64-xsm                 blocked 
 test-amd64-amd64-libvirt-xsm                                 blocked 
 test-armhf-armhf-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  queued  
 test-amd64-amd64-xl-xsm                                      blocked 
 test-armhf-armhf-xl-xsm                                      blocked 
 test-amd64-i386-xl-xsm                                       blocked 
 test-amd64-amd64-qemuu-nested-amd                            blocked 
 test-amd64-amd64-xl-pvhv2-amd                                blocked 
 test-amd64-i386-qemuu-rhel6hvm-amd                           queued  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    blocked 
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     queued  
 test-amd64-i386-freebsd10-amd64                              queued  
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         blocked 
 test-amd64-i386-xl-qemuu-ovmf-amd64                          queued  
 test-amd64-amd64-xl-qemuu-win7-amd64                         blocked 
 test-amd64-i386-xl-qemuu-win7-amd64                          queued  
 test-amd64-amd64-xl-qemuu-ws16-amd64                         blocked 
 test-amd64-i386-xl-qemuu-ws16-amd64                          queued  
 test-amd64-amd64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  blocked 
 test-amd64-i386-freebsd10-i386                               queued  
 test-amd64-amd64-xl-qemuu-win10-i386                         blocked 
 test-amd64-i386-xl-qemuu-win10-i386                          queued  
 test-amd64-amd64-qemuu-nested-intel                          blocked 
 test-amd64-amd64-xl-pvhv2-intel                              blocked 
 test-amd64-i386-qemuu-rhel6hvm-intel                         queued  
 test-amd64-amd64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      queued  
 test-armhf-armhf-xl-midway                                   blocked 
 test-amd64-amd64-xl-multivcpu                                blocked 
 test-armhf-armhf-xl-multivcpu                                blocked 
 test-amd64-amd64-pair                                        blocked 
 test-amd64-i386-pair                                         queued  
 test-amd64-amd64-libvirt-pair                                blocked 
 test-amd64-i386-libvirt-pair                                 queued  
 test-amd64-amd64-amd64-pvgrub                                blocked 
 test-amd64-amd64-i386-pvgrub                                 blocked 
 test-amd64-amd64-pygrub                                      blocked 
 test-amd64-i386-libvirt-qcow2                                queued  
 test-amd64-amd64-xl-qcow2                                    blocked 
 test-armhf-armhf-libvirt-raw                                 blocked 
 test-amd64-i386-xl-raw                                       queued  
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

broken-job test-amd64-i386-pair queued
broken-job test-amd64-i386-qemuu-rhel6hvm-intel queued
broken-job test-amd64-i386-xl-qemuu-ovmf-amd64 queued
broken-job build-amd64 broken
broken-job test-amd64-i386-freebsd10-amd64 queued
broken-job test-amd64-i386-libvirt-qcow2 queued
broken-job test-amd64-i386-xl-qemuu-win10-i386 queued
broken-job build-armhf-pvops broken
broken-job test-amd64-i386-libvirt queued
broken-job test-amd64-i386-xl-qemuu-ws16-amd64 queued
broken-job test-amd64-i386-freebsd10-i386 queued
broken-job build-i386-xsm broken
broken-job test-amd64-i386-xl-qemuu-win7-amd64 queued
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64 queued
broken-job build-amd64-xsm broken
broken-job test-amd64-i386-libvirt-xsm queued
broken-job build-amd64-pvops broken
broken-job build-i386-pvops broken
broken-job test-amd64-i386-xl-raw queued
broken-job build-armhf-xsm broken
broken-job build-armhf broken
broken-job build-i386-libvirt queued
broken-job test-amd64-i386-libvirt-pair queued
broken-job test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm queued
broken-job test-amd64-i386-qemuu-rhel6hvm-amd queued
broken-job test-amd64-i386-xl queued
broken-step build-amd64-pvops host-install(4)
broken-step build-amd64 host-install(4)
broken-step build-amd64-xsm host-install(4)
broken-step build-armhf host-install(4)
broken-step build-armhf-pvops host-install(4)
broken-step build-i386-xsm host-install(4)
broken-step build-i386-pvops host-install(4)
broken-step build-armhf-xsm host-install(4)
broken-step build-armhf-xsm capture-logs
broken-step build-armhf capture-logs
broken-step build-armhf-pvops capture-logs

Push not applicable.

(No revision log; it would be 21776 lines long.)


--===============7240165884733313806==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7240165884733313806==--
