From: osstest service owner <osstest-admin@xenproject.org>
Subject: [libvirt test] 117631: regressions - trouble:
	broken/fail/pass
Date: Fri, 05 Jan 2018 20:56:15 +0000
Message-ID: <osstest-117631-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5785949260779979549=="
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

--===============5785949260779979549==
Content-Type: text/plain

flight 117631 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/117631/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt-pair    <job status>                 broken
 test-amd64-amd64-libvirt-pair 4 host-install/src_host(4) broken REGR. vs. 117589
 test-amd64-amd64-libvirt-pair 5 host-install/dst_host(5) broken REGR. vs. 117589
 test-armhf-armhf-libvirt-xsm 16 guest-start/debian.repeat fail REGR. vs. 117589

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 117589
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 117589
 test-armhf-armhf-libvirt-xsm 14 saverestore-support-check    fail  like 117589
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt     14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-qcow2 12 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-qcow2 13 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-xsm 13 migrate-support-check        fail   never pass

version targeted for testing:
 libvirt              9a22251bbe6a4ff8dab90da53a1c0df82d8d29fc
baseline version:
 libvirt              8bcceaa9244fbf89dd1173756dd835c8c0d5af1c

Last test of basis   117589  2018-01-03 04:22:30 Z    2 days
Testing same since   117631  2018-01-04 10:04:20 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chen Hanxiao <chenhanxiao@gmail.com>
  Christian Ehrhardt <christian.ehrhardt@canonical.com>
  Cédric Bosdonnat <cbosdonnat@suse.com>
  Eduardo Habkost <ehabkost@redhat.com>
  Eric Blake <eblake@redhat.com>
  Erik Skultety <eskultet@redhat.com>
  Julio Faracco <jcfaracco@gmail.com>
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
 test-armhf-armhf-libvirt-xsm                                 fail    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-libvirt                                     pass    
 test-arm64-arm64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-libvirt-pair                                broken  
 test-amd64-i386-libvirt-pair                                 pass    
 test-arm64-arm64-libvirt-qcow2                               pass    
 test-armhf-armhf-libvirt-raw                                 pass    
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

broken-job test-amd64-amd64-libvirt-pair broken
broken-step test-amd64-amd64-libvirt-pair host-install/src_host(4)
broken-step test-amd64-amd64-libvirt-pair host-install/dst_host(5)

Not pushing.

------------------------------------------------------------
commit 9a22251bbe6a4ff8dab90da53a1c0df82d8d29fc
Author: Eduardo Habkost <ehabkost@redhat.com>
Date:   Thu Dec 28 15:41:28 2017 -0200

    qemu_cgroup: Fix 'rc' argument on virDomainAuditCgroupPath() calls
    
    All calls to virDomainAuditCgroupPath() were passing 'rc == 0' as
    argument, when it was supposed to pass the 'rc' value directly.
    
    As a consequence, the audit events that were supposed to be
    logged (actual cgroup changes) were never being logged, and bogus
    audit events were logged when using regular files as disk image.
    
    Fix all calls to use the return value of
    virCgroup{Allow,Deny}Device*() directly as the 'rc' argument.
    
    Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>

commit 474c7a2ffa74d6acc93d0749a899e851dc2cc94d
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Thu Jan 4 09:29:49 2018 +0100

    virstringtest: Fix alignment of backslashes
    
    We don't try to right align the backslashes anymore.
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>

commit 450bf83a929d2f789c7300980ee4e54973806fe7
Author: Eric Blake <eblake@redhat.com>
Date:   Tue Oct 10 09:56:31 2017 +0100

    maint: update to latest gnulib
    
    This pulls in updates for the 2018 copyright year, among other things.
    
    Signed-off-by: Eric Blake <eblake@redhat.com>

commit 259a2cc34e0b006be3ba8489d2e26b69cd3361a8
Author: Cédric Bosdonnat <cbosdonnat@suse.com>
Date:   Tue Jan 2 09:54:46 2018 +0100

    apparmor: fix virt-aa-helper profile
    
    Fix rule introduced by commit 0f33025a:
      * to handle /var/run not being a symlink to /run
      * to be properly parsed: missing comma at the end.

commit d0307a9a766f1eb0f24ad2cc7c7ae730f1bde966
Author: Julio Faracco <jcfaracco@gmail.com>
Date:   Tue Jan 2 16:52:20 2018 -0200

    storage: Fixing missing 'backingStore' tag from volume XML dumps.
    
    After commit a693fdb 'vol-dumpxml' missed the ability to show backingStore
    information. This commit adds a volume type for files that fixes this
    problem.
    
    Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=1529663
    
    Signed-off-by: Julio Faracco <jcfaracco@gmail.com>

commit 6534b3c4bb146d0c2a8412bd032ce5f356af6e4a
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Tue Dec 12 14:03:13 2017 +0100

    qemuBuildMemPathStr: Forbid memoryBacking/access for non-numa case
    
    https://bugzilla.redhat.com/show_bug.cgi?id=1448149
    
    If a domain has no numa nodes, that means we don't put any
    memory-backend-file onto the qemu command line. That in turn
    means we can't set access='shared'. Therefore, we should produce
    an error instead of ignoring the setting silently.
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>

commit f10bb3347b43d900ff361cda5fe1996782284991
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Wed Dec 20 13:09:07 2017 +0100

    qemu: monitor: Decrease logging verbosity
    
    The PROBE macro used in qemuMonitorIOProcess and the VIR_DEBUG message
    in qemuMonitorJSONIOProcess create a lot of logging churn when debug
    logging is enabled during monitor communication.
    
    The messages logged from the PROBE macro are rather useless since they
    are reporting the partial state of receiving the reply from qemu. The
    actual full reply is still logged in qemuMonitorJSONIOProcessLine once
    the full message is received.

commit f06e488d5484031a76e7ed231c8fef8fa1181d2c
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Wed Dec 20 12:58:36 2017 +0100

    util: probe: Add quiet versions of the "PROBE" macro
    
    PROBE macro adds a logging entry, when used in places seeing a lot of
    traffic this can cause a significant slowdown.

commit c1a6e2fb43156b096787ad6e300f42b3da753826
Author: Chen Hanxiao <chenhanxiao@gmail.com>
Date:   Wed Jan 3 17:56:35 2018 +0800

    util: virstring: Tweak a few more descriptions.
    
    There are a few more description-related issues that commit @9026d115
    forgot to address.
    
    Signed-off-by: Chen Hanxiao <chenhanxiao@gmail.com>
    Signed-off-by: Erik Skultety <eskultet@redhat.com>

commit faec1958614bfcdb535b1bcc0ddac8cde4516e1a
Author: Cédric Bosdonnat <cbosdonnat@suse.com>
Date:   Mon Dec 18 15:48:33 2017 +0100

    lxc: set a hostname based on the container name
    
    Set a transient hostname on containers. The hostname is computed from
    the container name, only keeping the valid characters [a-zA-Z0-9-] in it.
    This filtering is based on RFC 1123 and allows a digit to start the
    hostname.

commit b475a91b7753281eb60b87f75b0055fe3c139276
Author: Cédric Bosdonnat <cbosdonnat@suse.com>
Date:   Mon Dec 18 15:46:53 2017 +0100

    Add virStringFilterChars() string utility
    
    Add a function to filter a string based on a list of valid characters.

commit 9026d1152c236ac7a7ab25845220a8e14d6bc630
Author: Chen Hanxiao <chenhanxiao@gmail.com>
Date:   Sat Dec 23 17:49:08 2017 +0800

    util: fix the description of virStringSearch
    
    There's no argument named @result, use @matches instead.
    
    Signed-off-by: Chen Hanxiao <chenhanxiao@gmail.com>
    Signed-off-by: Erik Skultety <eskultet@redhat.com>

commit 8f882cf36e4709b103fa237253052d09ff349cfe
Author: Christian Ehrhardt <christian.ehrhardt@canonical.com>
Date:   Tue Dec 19 14:13:06 2017 +0100

    apparmor: allow unix stream for p2p migrations
    
    On live migration with --p2p like:
     $ virsh migrate --live --p2p kvmguest-bionic-normal \
           qemu+ssh://10.6.221.80/system
    
    We hit an apparmor deny like:
      apparmor="DENIED" operation="file_inherit"
      profile="/usr/sbin/libvirtd" pid=23477 comm="ssh" family="unix"
      sock_type="stream" protocol=0 requested_mask="send receive"
      denied_mask="send" addr=none peer_addr=none peer="unconfined"
    
    The rule is not perfect, but can't be restricted further at the moment
    (new upstream kernel features needed). For now the lack of a profile on the
    peer as well as comm not being a conditional on rules do not allow to filter
    further.
    
    Signed-off-by: Christian Ehrhardt <christian.ehrhardt@canonical.com>

commit 4ce06ba6f43ebaeeb6d47d70237fd1c747f42883
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Tue Dec 12 13:52:50 2017 +0100

    src: Export virDomainMemoryAccessType*String
    
    These are already exported at header file level because of
    VIR_ENUM_DECL being in numa_conf.h. However, they are not being
    exported at object level because of missing libvirt_private.syms
    record.
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: John Ferlan <jferlan@redhat.com>


--===============5785949260779979549==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5785949260779979549==--
