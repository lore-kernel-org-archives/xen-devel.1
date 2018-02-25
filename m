From: osstest service owner <osstest-admin@xenproject.org>
Subject: [libvirt test] 119991: regressions - FAIL
Date: Sun, 25 Feb 2018 07:31:49 +0000
Message-ID: <osstest-119991-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0162469581695878819=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=/c0b=ft=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1epqmw-0005ZC-Tg
 for xen-devel@lists.xenproject.org; Sun, 25 Feb 2018 07:32:02 +0000
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

--===============0162469581695878819==
Content-Type: text/plain

flight 119991 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/119991/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-libvirt-raw  7 xen-boot                 fail REGR. vs. 119943

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt-xsm 14 saverestore-support-check    fail  like 119943
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 119943
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt     14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-qcow2 12 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-qcow2 13 saverestore-support-check    fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass

version targeted for testing:
 libvirt              ef71caeaa81ab75daf441fe702d267c9b722bafb
baseline version:
 libvirt              87876c7736646452f4139a4d3a8478c51b92abbe

Last test of basis   119943  2018-02-23 06:46:50 Z    2 days
Testing same since   119991  2018-02-24 08:11:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Christian Ehrhardt <christian.ehrhardt@canonical.com>
  Daniel P. Berrangé <berrange@redhat.com>
  Jim Fehlig <jfehlig@suse.com>
  Jiri Denemark <jdenemar@redhat.com>
  Michal Privoznik <mprivozn@redhat.com>

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
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-armhf-armhf-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-libvirt                                     pass    
 test-arm64-arm64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-arm64-arm64-libvirt-qcow2                               pass    
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-amd64-libvirt-vhd                                 pass    


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


Not pushing.

------------------------------------------------------------
commit ef71caeaa81ab75daf441fe702d267c9b722bafb
Author: Jim Fehlig <jfehlig@suse.com>
Date:   Wed Feb 21 18:48:38 2018 -0700

    libxl: round memory values to next 1MiB increment
    
    libxl requires the memory sizes to be rounded to 1MiB increments.
    Attempting to start a domain that violates this requirement will
    fail with the marginally helpful error
    
    2018-02-22 01:55:32.921+0000: xc: panic: xc_dom_boot.c:141: xc_dom_boot_mem_init: can't allocate low memory for domain: Out of memory
    2018-02-22 01:55:32.921+0000: libxl: libxl_dom.c:671:libxl__build_dom: xc_dom_boot_mem_init failed: No such file or directory
    
    Round the maximum and current memory values to the next 1MiB
    increment when generating the libxl_domain_config object.
    
    Signed-off-by: Jim Fehlig <jfehlig@suse.com>

commit ddedcd0e14cda2b41d5f22fdfd0ad78cf057d49c
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Wed Feb 21 18:05:56 2018 +0000

    make: split lxc driver build rules into lxc/Makefile.inc.am
    
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

commit 7b621870df921aa665a92ffa11debcaa02ea318b
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Wed Feb 21 18:05:56 2018 +0000

    make: split vz driver build rules into vz/Makefile.inc.am
    
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

commit 4edef9c3b38568b8b17487b7a852b3ce011bf575
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Wed Feb 21 18:05:56 2018 +0000

    make: split xenapi driver build rules into xenapi/Makefile.inc.am
    
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

commit 2cd876eb7f5739c71e5211468076fdf6de514290
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Wed Feb 21 18:05:56 2018 +0000

    make: split xen driver build rules into xen/Makefile.inc.am
    
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

commit ea7c61255f79e8944eb46ba2531c097710655865
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Wed Feb 21 18:05:56 2018 +0000

    make: split libxl driver build rules into libxl/Makefile.inc.am
    
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

commit cdfbb0666f7aebdff4b113b8a9c3f44ad467cd9a
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Wed Feb 21 18:05:56 2018 +0000

    make: split xenconfig driver build rules into xenconfig/Makefile.inc.am
    
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

commit cf2c4c9e15978767dbd103b2121d58a3c7219f32
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Wed Feb 21 18:05:56 2018 +0000

    make: split bhyve driver build rules into bhyve/Makefile.inc.am
    
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

commit abe060a4fa177a089a9496c03a7f439a5f7f20ab
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Wed Feb 21 18:05:56 2018 +0000

    make: split qemu driver build rules into qemu/Makefile.inc.am
    
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

commit 1158bf0db1da1ff558d840f4c10b9c061c970d8e
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Wed Feb 21 18:05:56 2018 +0000

    make: split openvz driver build rules into openvz/Makefile.inc.am
    
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

commit 0ca89a95ac8d305cd569b3e698ba10be269226f4
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Wed Feb 21 18:05:56 2018 +0000

    make: split vbox driver build rules into vbox/Makefile.inc.am
    
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

commit af04f5c02397d70227138605ac27c691f257b30f
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Wed Feb 21 18:05:56 2018 +0000

    make: split vmware driver build rules into vmware/Makefile.inc.am
    
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

commit 253b528c3f595dbca8c065e952fb859893d973e6
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Wed Feb 21 18:05:56 2018 +0000

    make: split hyperv driver build rules into hyperv/Makefile.inc.am
    
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

commit 100864c042c497e9381fe6ba26e918174a9af9ea
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Wed Feb 21 18:05:56 2018 +0000

    make: split ESX driver build rules into esx/Makefile.inc.am
    
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

commit c8da8363d2227843df0990809fdcbdc9123cf394
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Wed Feb 21 18:05:56 2018 +0000

    make: split test driver build rules into test/Makefile.inc.am
    
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

commit 82ef8c49ae990e84886f1239e72ff1759d6007a1
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Wed Feb 21 18:05:56 2018 +0000

    make: split PHyp driver build rules into phyp/Makefile.inc.am
    
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

commit 44fc16ec7fe1e1b29797789d0888cd56324d681e
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Wed Feb 21 18:05:56 2018 +0000

    make: split UML driver build rules into uml/Makefile.inc.am
    
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

commit ff02d1af4041ea4cf6bea68aac66d93a970e92f1
Author: Christian Ehrhardt <christian.ehrhardt@canonical.com>
Date:   Tue Jan 16 16:05:26 2018 +0100

    tools: avoid text spilling into variables
    
    While libvirt-guests.sh is running cases can let guest_is_on fail which
    causes check_guests_shutdown to print output.
    That output shall not spill into the users of function
    check_guests_shutdown which is therefore now returning values in a
    variable like guest_is_on already did.
    
    Original-Author: Christian Ehrhardt <christian.ehrhardt@canonical.com>
    Modified-By: Jorge Niedbalski <niedbalski@ubuntu.com>
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>

commit 1351a0f8b428d52b42ff1e5c3a109077ac58c855
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Fri Feb 23 11:36:37 2018 +0000

    make: fix VPATH install of upstart files
    
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

commit edae027cfe02be4863dcef1e7f0ea0564766e312
Author: Jiri Denemark <jdenemar@redhat.com>
Date:   Thu Feb 22 13:51:36 2018 +0100

    qemu: Fix updating device with boot order
    
    Commit v3.7.0-14-gc57f3fd2f8 prevented adding a <boot order='x'/>
    element to an inactive domain with global <boot dev='...'/> element.
    However, as a result of that change updating any device with boot order
    would fail with 'boot order X is already used by another device', where
    "another device" is in fact the device which is being updated.
    
    To fix this we have to ignore the device which we're about to update
    when checking for boot order conflicts.
    
    https://bugzilla.redhat.com/show_bug.cgi?id=1546971
    
    Signed-off-by: Jiri Denemark <jdenemar@redhat.com>

commit b6a264e8550d4add3946ec2fd9ae31a76fbf16fe
Author: Jiri Denemark <jdenemar@redhat.com>
Date:   Thu Feb 22 13:30:27 2018 +0100

    Pass oldDev to virDomainDefCompatibleDevice on device update
    
    When calling virDomainDefCompatibleDevice to check a new device during
    device update, we need to pass the original device which is going to be
    updated in addition to the new device. Otherwise, the function can
    report false conflicts.
    
    The new argument is currently ignored by virDomainDefCompatibleDevice,
    but this will change in the following patch.
    
    https://bugzilla.redhat.com/show_bug.cgi?id=1546971
    
    Signed-off-by: Jiri Denemark <jdenemar@redhat.com>

commit e3497f3fc895c427ce35188f3ddb2bb47a853be9
Author: Jiri Denemark <jdenemar@redhat.com>
Date:   Thu Feb 22 13:22:39 2018 +0100

    lxc: Drop useless check in live device update
    
    Checking the new device definition makes little sense when lxc driver
    does not support live device update at all.
    
    Signed-off-by: Jiri Denemark <jdenemar@redhat.com>

commit 64ba7803ca1dc04aa5cbc60b4cf51c1868ae0dc4
Author: Jiri Denemark <jdenemar@redhat.com>
Date:   Thu Feb 22 13:24:58 2018 +0100

    qemu_hotplug: Drop dead code in net update
    
    vm->def->nets[changeidx] can never be NULL for changeidx returned by
    virDomainNetFindIdx.
    
    Signed-off-by: Jiri Denemark <jdenemar@redhat.com>

commit 3154b3414a930a572b086c06f9d99afe09b83ded
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Fri Feb 23 09:47:41 2018 +0100

    libvirt.spec.in: Don't distribute libvirtd.upstart
    
    Firstly, for rpm we are building libvirt with
    --init-script=systemd or --init-script=redhat. So upstart is
    never enabled. And only due to a bug we installed
    libvirtd.upstart file.
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Pavel Hrdina <phrdina@redhat.com>


--===============0162469581695878819==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0162469581695878819==--
