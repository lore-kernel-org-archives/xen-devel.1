From: osstest service owner <osstest-admin@xenproject.org>
Subject: [libvirt test] 119237: regressions - FAIL
Date: Fri, 16 Feb 2018 04:56:38 +0000
Message-ID: <osstest-119237-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7016775422360482906=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=jbeh=fk=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1emY4m-0004qM-HT
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2018 04:56:48 +0000
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

--===============7016775422360482906==
Content-Type: text/plain

flight 119237 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/119237/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-libvirt-raw 11 guest-start              fail REGR. vs. 119049

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt-xsm 14 saverestore-support-check    fail  like 119049
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 119049
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt     14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-qcow2 12 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-qcow2 13 saverestore-support-check    fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass

version targeted for testing:
 libvirt              d70d07eef8001b55a5f6b18a2065da2b528d3679
baseline version:
 libvirt              554a5edcb46ff972fed45b851d70823b923fec6a

Last test of basis   119049  2018-02-13 04:20:05 Z    3 days
Failing since        119148  2018-02-14 04:23:35 Z    2 days    2 attempts
Testing same since   119237  2018-02-15 04:25:30 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrea Bolognani <abologna@redhat.com>
  Bjoern Walk <bwalk@linux.vnet.ibm.com>
  Jiri Denemark <jdenemar@redhat.com>
  Michal Privoznik <mprivozn@redhat.com>
  Peter Krempa <pkrempa@redhat.com>

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
commit d70d07eef8001b55a5f6b18a2065da2b528d3679
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Mon Feb 12 16:16:42 2018 +0100

    virstoragetest: Add test case for NBD over unix socket with new syntax
    
    Use the new syntax which uses the 'UnixSocket' type in qemu.
    
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>

commit a3a3de9bc74aea9f56790210948cdb7cf579d84c
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Mon Feb 12 15:44:11 2018 +0100

    storage: Fix formatting and parsing of qemu type 'UnixSocketAddress'
    
    The documentation for the JSON/qapi type 'UnixSocketAddress' states that
    the unix socket path field is named 'path'. Unfortunately qemu uses
    'socket' in case of the gluster driver (despite documented otherwise).
    
    Add logic which will format the correct fields while keeping support of
    the old spelling.
    
    Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=1544325
    
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>

commit bc84bb9fe001fc3ca5436b9b50fbd669e4c489b6
Author: Jiri Denemark <jdenemar@redhat.com>
Date:   Wed Feb 14 13:16:52 2018 +0100

    spec: Drop overlapping triggers
    
    The postun trigger for libvirt-daemon was defined twice for overlapping
    ranges of package verions if systemd support was switched off (which
    happens when building on something ancient, such as RHEL-6).
    
    Let's combine the two triggers into the one which is called when
    libvirt-daemon < 1.3.0 is uninstalled. As a side effect, virtlockd and
    virtlogd might be reloaded twice after an upgrade from libvirt newer
    than 1.2.1 and older than 1.3.0 (by postun script from the old libvirt
    and postun trigger from the new libvirt).
    
    Signed-off-by: Jiri Denemark <jdenemar@redhat.com>
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

commit cf555f92128222f5a392cf80478c0a291bb1a0fe
Author: Jiri Denemark <jdenemar@redhat.com>
Date:   Wed Feb 14 12:09:32 2018 +0100

    spec: Fix indentation in daemon's triggerpostun
    
    Signed-off-by: Jiri Denemark <jdenemar@redhat.com>
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

commit b2ab38bfdc765bbcb56b89b55dfee6b406fc8c29
Author: Jiri Denemark <jdenemar@redhat.com>
Date:   Fri Feb 9 14:08:45 2018 +0100

    spec: Prepare for future RHEL
    
    Signed-off-by: Jiri Denemark <jdenemar@redhat.com>
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

commit 259b5ca73c13d09b510475e1bb58d31d509193ba
Author: Jiri Denemark <jdenemar@redhat.com>
Date:   Fri Feb 9 14:02:00 2018 +0100

    spec: Drop checks for old Fedora releases
    
    The oldest Fedora release supported by the spec file is 26. Checking for
    anything older makes no sense.
    
    Signed-off-by: Jiri Denemark <jdenemar@redhat.com>
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

commit 42188c1c65c34b8e77ad48f4dde8a5f06328f16a
Author: Jiri Denemark <jdenemar@redhat.com>
Date:   Wed Feb 14 14:49:28 2018 +0100

    spec: Build virt-login-shell iff LXC driver is enabled
    
    Building virt-login-shell doesn't really make any sense without LXC and
    doing so even breaks "make rpm" since the associated files are installed
    but unpackaged (the login-shell sub package already depends on LXC).
    
    Signed-off-by: Jiri Denemark <jdenemar@redhat.com>
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

commit 34783a9e6b9c3d8850db878fc323c1ff40703ea6
Author: Jiri Denemark <jdenemar@redhat.com>
Date:   Fri Feb 9 13:42:50 2018 +0100

    spec: Enable fuse only if LXC is enabled
    
    Enabling fuse without LXC does not make a lot of sense because fuse is
    used only by LXC.
    
    Signed-off-by: Jiri Denemark <jdenemar@redhat.com>
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

commit b62b8090b2ad4524a5bf9d40d0d1c17a9d57f5a0
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Tue Feb 6 10:21:56 2018 +0100

    qemu: Check for down limit of SLIRP prefix too
    
    https://bugzilla.redhat.com/show_bug.cgi?id=1515533
    
    We're already checking if IPv4 prefix isn't too long. But we are
    not checking if it isn't too short. QEMU supports prefixes longer
    than 4 (including). I haven't find anything similar related to
    IPv6 in qemu sources.
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: John Ferlan <jferlan@redhat.com>

commit 9cae9c822be1330fe5c6eec5c61be2be8b70ba64
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Mon Feb 12 15:50:12 2018 +0100

    qemu: block: Remove misleading part of comment in qemuBlockStorageSourceBuildJSONSocketAddress
    
    The array indexes are formatted if the JSON->commandline translator is
    translating an array type. It does not at all depend on this function.
    
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>

commit 6fc33b6f37af2310fd5bb1246e194eed96741df8
Author: Bjoern Walk <bwalk@linux.vnet.ibm.com>
Date:   Thu Feb 8 13:38:25 2018 +0100

    tests: run virshtest independent of current pwd
    
    virshtest execves the virsh binary. Make sure that it finds the binary's
    location independent of the current working directory by specifying the
    absolute path as determined by the build environment.
    
    Reviewed-by: Marc Hartmayer <mhartmay@linux.vnet.ibm.com>
    Reviewed-by: Boris Fiuczynski <fiuczy@linux.vnet.ibm.com>
    Signed-off-by: Bjoern Walk <bwalk@linux.vnet.ibm.com>

commit e6f36ae43544576353a8ab1168d749dcd11e7465
Author: Andrea Bolognani <abologna@redhat.com>
Date:   Tue Jan 23 10:50:04 2018 +0100

    tests: Clean up HPT tests
    
    Give them better names and remove some redundancy.
    
    Signed-off-by: Andrea Bolognani <abologna@redhat.com>
    Reviewed-by: John Ferlan <jferlan@redhat.com>

commit 3dd1eb3b26504f91ec6c8487784c494718d884c1
Author: Andrea Bolognani <abologna@redhat.com>
Date:   Tue Feb 6 14:49:41 2018 +0100

    conf: Improve HPT feature handling
    
    Instead of storing separately whether the feature is enabled
    or not and what resizing policy should be used, store both of
    them in a single place.
    
    Signed-off-by: Andrea Bolognani <abologna@redhat.com>
    Reviewed-by: John Ferlan <jferlan@redhat.com>

commit c5a451ef21293468b64eb7929ada6b9406350bf5
Author: Andrea Bolognani <abologna@redhat.com>
Date:   Tue Feb 6 14:30:40 2018 +0100

    conf: Improve IOAPIC feature handling
    
    Instead of storing separately whether the feature is enabled
    or not and what driver should be used, store both of them in
    a single place.
    
    Signed-off-by: Andrea Bolognani <abologna@redhat.com>
    Reviewed-by: John Ferlan <jferlan@redhat.com>

commit 132548efde76defaca54f90cc9c8a57508a4a86f
Author: Andrea Bolognani <abologna@redhat.com>
Date:   Thu Feb 1 17:52:48 2018 +0100

    qemu: Fix GIC behavior for the default case
    
    When no GIC version is specified, we currently default to GIC v2;
    however, that's not a great default, since guests will fail to
    start if the hardware only supports GIC v3.
    
    Change the behavior so that a sensible default is chosen instead.
    That basically means using the same algorithm whether the user
    didn't explicitly enable the GIC feature or they explicitly
    enabled it but didn't specify any GIC version.
    
    Signed-off-by: Andrea Bolognani <abologna@redhat.com>
    Reviewed-by: John Ferlan <jferlan@redhat.com>

commit 7500533c5629c4864ae6cfa6672ff28f36e7010f
Author: Andrea Bolognani <abologna@redhat.com>
Date:   Thu Feb 1 18:17:13 2018 +0100

    tests: Improve GIC tests
    
    Account for the fact that the default might change based on what
    GIC versions are supported by QEMU. That's not the case at the
    moment, but it will be soon.
    
    Signed-off-by: Andrea Bolognani <abologna@redhat.com>
    Reviewed-by: John Ferlan <jferlan@redhat.com>

commit f3b4c98748458fe149ee3d4ad65528a0b3b278b0
Author: Andrea Bolognani <abologna@redhat.com>
Date:   Fri Feb 2 15:55:14 2018 +0100

    conf: Integrate all features ABI checks in the switch
    
    There are a few stray checks which still live outside of the
    switch in virDomainDefFeaturesCheckABIStability() for no good
    reason. Move them inside the switch, and update the error
    messages to be consistent while at it.
    
    Signed-off-by: Andrea Bolognani <abologna@redhat.com>
    Reviewed-by: John Ferlan <jferlan@redhat.com>

commit 53072064745731e8c887f8ee71092060a4025c62
Author: Andrea Bolognani <abologna@redhat.com>
Date:   Thu Feb 1 12:35:15 2018 +0100

    conf: Validate VIR_DOMAIN_FEATURE_CAPABILITIES properly
    
    Unlike most other features, VIR_DOMAIN_FEATURE_CAPABILITIES is
    of type virDomainCapabilitiesPolicy instead of virTristateSwitch,
    so we need to handle it separately for the error message to make
    sense.
    
    Signed-off-by: Andrea Bolognani <abologna@redhat.com>
    Reviewed-by: John Ferlan <jferlan@redhat.com>

commit a975c95967e5da43c231601913ccb2077c8434b6
Author: Andrea Bolognani <abologna@redhat.com>
Date:   Thu Feb 1 12:31:57 2018 +0100

    conf: Use switch in virDomainDefFeaturesCheckABIStability()
    
    The compiler can make sure we are handling all features.
    
    Signed-off-by: Andrea Bolognani <abologna@redhat.com>
    Reviewed-by: John Ferlan <jferlan@redhat.com>

commit f55fcb7e8f997d0f15b344c8653725624c7b37ee
Author: Andrea Bolognani <abologna@redhat.com>
Date:   Fri Feb 2 16:05:51 2018 +0100

    qemu: Move GIC checks to qemuDomainDefValidateFeatures()
    
    Keep them along with other arch/machine type checks for
    features instead of waiting until command line generation
    time.
    
    Signed-off-by: Andrea Bolognani <abologna@redhat.com>
    Reviewed-by: John Ferlan <jferlan@redhat.com>

commit ce24802a6b1c86f13735ce9533acff15346138a3
Author: Andrea Bolognani <abologna@redhat.com>
Date:   Fri Feb 2 16:05:01 2018 +0100

    qemu: Use switch in qemuDomainDefValidateFeatures()
    
    The compiler can make sure we are handling all features.
    
    While reworking the logic, also change error messages to a more
    consistent style.
    
    Signed-off-by: Andrea Bolognani <abologna@redhat.com>
    Reviewed-by: John Ferlan <jferlan@redhat.com>

commit 56ca68c3c8947fb37e97a131af7d0fcd1987e800
Author: Andrea Bolognani <abologna@redhat.com>
Date:   Fri Feb 2 10:58:13 2018 +0100

    qemu: Move feature verification from PostParse() to Validate()
    
    We want to perform all feature verification in a single spot, but
    some of it (eg. GIC) is currently being performed at command line
    generation time, and moving it to PostParse() would cause guests
    to disappear. Moving verification to Validate() allows us to
    side-step the issue.
    
    Signed-off-by: Andrea Bolognani <abologna@redhat.com>
    Reviewed-by: John Ferlan <jferlan@redhat.com>


--===============7016775422360482906==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7016775422360482906==--
