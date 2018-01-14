From: Platform Team regression test user <citrix-osstest@xenproject.org>
Subject: [qemu-mainline baseline-only test] 74401: trouble:
	blocked/broken
Date: Sun, 14 Jan 2018 11:59:24 +0000
Message-ID: <osstest-74401-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0162143198973538193=="
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

--===============0162143198973538193==
Content-Type: text/plain

This run is configured for baseline tests only.

flight 74401 qemu-mainline real [real]
http://osstest.xs.citrite.net/~osstest/testlogs/logs/74401/

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
 build-armhf-xsm               4 host-install(4)       broken baseline untested
 build-armhf                   4 host-install(4)       broken baseline untested
 build-armhf-pvops             4 host-install(4)       broken baseline untested
 build-armhf-xsm               5 capture-logs          broken baseline untested
 build-armhf                   5 capture-logs          broken baseline untested
 build-armhf-pvops             5 capture-logs          broken baseline untested
 build-i386                    4 host-install(4)       broken baseline untested
 build-amd64-xsm               4 host-install(4)       broken baseline untested
 build-amd64                   4 host-install(4)       broken baseline untested
 build-i386-pvops              4 host-install(4)       broken baseline untested
 build-i386-xsm                4 host-install(4)       broken baseline untested
 build-amd64-pvops             4 host-install(4)       broken baseline untested

version targeted for testing:
 qemuu                7398166ddf7c6dbbc9cae6ac69bb2feda14b40ac
baseline version:
 qemuu                7642f96e6015ea0c6a8334f8e36f824f70378b5d

Last test of basis    74335  2018-01-12 23:50:11 Z    1 days
Testing same since    74401  2018-01-14 05:58:16 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alexey Kardashevskiy <aik@ozlabs.ru>
  Andrey Smirnov <andrew.smirnov@gmail.com>
  BALATON Zoltan <balaton@eik.bme.hu>
  Cédric Le Goater <clg@kaod.org>
  Daniel P. Berrange <berrange@redhat.com>
  David Gibson <david@gibson.dropbear.id.au>
  Eric Blake <eblake@redhat.com>
  François Revol <revol@free.fr>
  Gerd Hoffmann <kraxel@redhat.com>
  Greg Kurz <groug@kaod.org>
  Hervé Poussineau <hpoussin@reactos.org>
  John Arbuckle <programmingkidx@gmail.com>
  John Snow <jsnow@redhat.com>
  Ladi Prosek <lprosek@redhat.com>
  Marc-André Lureau <marcandre.lureau@redhat.com>
  Maxime Coquelin <maxime.coquelin@redhat.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michael Weiser <michael.weiser@gmx.de>
  Peter Maydell <peter.maydell@linaro.org>
  Peter Xu <peterx@redhat.com>
  Philippe Mathieu-Daudé <f4bug@amsat.org>
  Prasad J Pandit <pjp@fedoraproject.org>
  Roman Kagan <rkagan@virtuozzo.com>
  Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
  Stefan Hajnoczi <stefanha@redhat.com>
  Thomas Huth <thuth@redhat.com>
  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
  Zhaoshenglong <zhaoshenglong@huawei.com>

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
broken-step build-armhf-xsm host-install(4)
broken-step build-armhf host-install(4)
broken-step build-armhf-pvops host-install(4)
broken-step build-armhf-xsm capture-logs
broken-step build-armhf capture-logs
broken-step build-armhf-pvops capture-logs
broken-step build-i386 host-install(4)
broken-step build-amd64-xsm host-install(4)
broken-step build-amd64 host-install(4)
broken-step build-i386-pvops host-install(4)
broken-step build-i386-xsm host-install(4)
broken-step build-amd64-pvops host-install(4)

Push not applicable.

(No revision log; it would be 1771 lines long.)


--===============0162143198973538193==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0162143198973538193==--
