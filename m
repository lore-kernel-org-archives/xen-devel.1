From: osstest service owner <osstest-admin@xenproject.org>
Subject: [libvirt test] 117023: regressions - trouble:
	blocked/broken/fail/pass
Date: Thu, 14 Dec 2017 08:46:27 +0000
Message-ID: <osstest-117023-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8775410285058435398=="
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

--===============8775410285058435398==
Content-Type: text/plain

flight 117023 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/117023/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-xsm                 <job status>                 broken
 build-amd64-pvops               <job status>                 broken
 build-i386-pvops                <job status>                 broken
 build-amd64                     <job status>                 broken
 build-i386                      <job status>                 broken
 build-armhf-pvops               <job status>                 broken
 build-armhf-xsm                 <job status>                 broken
 build-armhf                     <job status>                 broken
 build-i386-xsm                  <job status>                 broken
 build-armhf-pvops             4 host-install(4)        broken REGR. vs. 116965
 build-armhf                   4 host-install(4)        broken REGR. vs. 116965
 build-armhf-xsm               4 host-install(4)        broken REGR. vs. 116965
 build-amd64-pvops             4 host-install(4)        broken REGR. vs. 116965
 build-i386-xsm                4 host-install(4)        broken REGR. vs. 116965
 build-amd64                   4 host-install(4)        broken REGR. vs. 116965
 build-i386-pvops              4 host-install(4)        broken REGR. vs. 116965
 build-amd64-xsm               4 host-install(4)        broken REGR. vs. 116965
 build-i386                    4 host-install(4)        broken REGR. vs. 116965
 test-arm64-arm64-libvirt-qcow2 10 debian-di-install      fail REGR. vs. 116965

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-armhf-armhf-libvirt-xsm  1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt     14 saverestore-support-check    fail   never pass

version targeted for testing:
 libvirt              984c534a3f2219444f4cb4df61d77b8c6e5054d7
baseline version:
 libvirt              e2ad8e5993df3cf1ebb575cd960f8f3d0efd2424

Last test of basis   116965  2017-12-08 04:20:53 Z    6 days
Testing same since   117023  2017-12-09 04:22:55 Z    5 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jiri Denemark <jdenemar@redhat.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Peter Krempa <pkrempa@redhat.com>

jobs:
 build-amd64-xsm                                              broken  
 build-arm64-xsm                                              pass    
 build-armhf-xsm                                              broken  
 build-i386-xsm                                               broken  
 build-amd64                                                  broken  
 build-arm64                                                  pass    
 build-armhf                                                  broken  
 build-i386                                                   broken  
 build-amd64-libvirt                                          blocked 
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            broken  
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            broken  
 build-i386-pvops                                             broken  
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           blocked 
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
 test-amd64-amd64-libvirt-xsm                                 blocked 
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-armhf-armhf-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  blocked 
 test-amd64-amd64-libvirt                                     blocked 
 test-arm64-arm64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      blocked 
 test-amd64-amd64-libvirt-pair                                blocked 
 test-amd64-i386-libvirt-pair                                 blocked 
 test-arm64-arm64-libvirt-qcow2                               fail    
 test-armhf-armhf-libvirt-raw                                 blocked 
 test-amd64-amd64-libvirt-vhd                                 blocked 


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

broken-job build-amd64-xsm broken
broken-job build-amd64-pvops broken
broken-job build-i386-pvops broken
broken-job build-amd64 broken
broken-job build-i386 broken
broken-job build-armhf-pvops broken
broken-job build-armhf-xsm broken
broken-job build-armhf broken
broken-job build-i386-xsm broken
broken-step build-armhf-pvops host-install(4)
broken-step build-armhf host-install(4)
broken-step build-armhf-xsm host-install(4)
broken-step build-amd64-pvops host-install(4)
broken-step build-i386-xsm host-install(4)
broken-step build-amd64 host-install(4)
broken-step build-i386-pvops host-install(4)
broken-step build-amd64-xsm host-install(4)
broken-step build-i386 host-install(4)

Not pushing.

------------------------------------------------------------
commit 984c534a3f2219444f4cb4df61d77b8c6e5054d7
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Thu Dec 7 03:27:47 2017 +0100

    tests: add test for multiple IPs for libxl and xenconfig driver
    
    Test conversion of multiple IP addresses to/from xl format and
    domXML. Also test libxl_domain_config generator handling of
    multiple IP addresses.
    
    Reviewed-by: Jim Fehlig <jfehlig@suse.com>

commit a861054fc7999ccb41fcbe9592c1df80456cca94
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Thu Dec 7 03:27:46 2017 +0100

    xenconfig: add support for multiple IP addresses
    
    Xen's xl config format has long supported specifying multiple IP
    addresses for virtual interfaces. E.g.
    
    vif = [ "ip=10.0.0.1 10.1.1.1 2000::1, ..." ]
    
    Add support for converting multiple IP addresses to/from domXML.
    
    Reviewed-by: Jim Fehlig <jfehlig@suse.com>

commit 82ef04fe79751ba98f48e220b7c2e9366935449a
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Thu Dec 7 03:27:45 2017 +0100

    libxl: add support for multiple IP addresses
    
    vif-* scripts support it for a long time, and expect addresses to be
    separated by spaces. Add appropriate support to libxl driver.
    
    Reviewed-by: Jim Fehlig <jfehlig@suse.com>

commit 2c01e4febcd161226ce707892d8e53f4e66f708f
Author: Jiri Denemark <jdenemar@redhat.com>
Date:   Fri Dec 8 10:31:38 2017 +0100

    migration.html: Clarify configuration file handling docs
    
    Migration never removes any configuration files on the destination host.
    Thus when the domain is already defined on the destination, it will stay
    persistent even after migration without --persist.
    
    https://bugzilla.redhat.com/show_bug.cgi?id=1514930
    
    Signed-off-by: Jiri Denemark <jdenemar@redhat.com>

commit ce73de441d35e17a29b83b8741e668a6ddc013ba
Author: Jiri Denemark <jdenemar@redhat.com>
Date:   Thu Dec 7 11:23:50 2017 +0100

    qemu: Make sure host-model uses CPU model supported by QEMU
    
    When reconnecting to a running domain started by old libvirt, which did
    not change host-model into a custom CPU definition, we replace the CPU
    definition with a specific CPU model from host capabilities. However,
    that CPU model may not be supported by the running qemu process. We need
    to translate the CPU model to one of the models which libvirt could have
    used when starting the domain.
    
    https://bugzilla.redhat.com/show_bug.cgi?id=1521202
    
    Signed-off-by: Jiri Denemark <jdenemar@redhat.com>

commit 4486dcdb4a386a906807d4eb7de586202e50cd18
Author: Jiri Denemark <jdenemar@redhat.com>
Date:   Thu Dec 7 11:21:48 2017 +0100

    qemu: Separate fetching CPU definitions from filling qemuCaps
    
    virQEMUCapsProbeQMPCPUDefinitions is now a small wrapper which fills in
    qemuCaps with CPU models fetched by virQEMUCapsFetchCPUDefinitions.
    
    Signed-off-by: Jiri Denemark <jdenemar@redhat.com>

commit fac8724ceb371f962d5d185c639456a34d71659e
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Thu Dec 7 16:11:18 2017 +0100

    qemu: blockjob: Reset disk source index after pivot
    
    Since we are re-detecting the backing chain after pivoting to the active
    block commit target (or block copy target) the disk index needs to be
    reset to 0. This is necessary since we move a member of the backing
    chain to disk->src but clear indexes only starting from
    disk->src->backingStore. The freshly detected images have indexes
    starting from 1, but since we've pivoted into an image which was
    previously a backing store it would have a non-0 index.
    The lookup function would then return the top of the chain for queries
    like 'vda[1]' instead of the first backing store.
    
    This problem will not be present once we keep the disk indexes stable.
    
    Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=1519745


--===============8775410285058435398==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8775410285058435398==--
