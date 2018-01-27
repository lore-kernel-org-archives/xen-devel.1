From: osstest service owner <osstest-admin@xenproject.org>
Subject: [linux-linus test] 118362: regressions - FAIL
Date: Sat, 27 Jan 2018 23:32:40 +0000
Message-ID: <osstest-118362-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1526127256117853356=="
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

--===============1526127256117853356==
Content-Type: text/plain

flight 118362 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/118362/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-libvirt-xsm  5 host-ping-check-native   fail REGR. vs. 118324

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 118324
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 118324
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 118324
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 118324
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 118324
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 118324
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 118324
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 118324
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-xsm      13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-win10-i386 10 windows-install         fail never pass
 test-amd64-amd64-xl-qemuu-win10-i386 10 windows-install        fail never pass
 test-amd64-amd64-xl-qemut-win10-i386 10 windows-install        fail never pass
 test-amd64-i386-xl-qemut-win10-i386 10 windows-install         fail never pass

version targeted for testing:
 linux                993ca2068b043dc3c933a8a4fe1052b77fe63f10
baseline version:
 linux                5b7d27967dabfb17c21b0d98b29153b9e3ee71e5

Last test of basis   118324  2018-01-25 07:31:24 Z    2 days
Testing same since   118362  2018-01-26 16:56:17 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaron Ma <aaron.ma@canonical.com>
  Andi Shyti <andi.shyti@samsung.com>
  Christian Borntraeger <borntraeger@de.ibm.com>
  David Sterba <dsterba@suse.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Josef Bacik <jbacik@fb.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Mark Furneaux <mark@furneaux.ca>
  Martin Brandenburg <martin@omnibond.com>
  Nick Dyer <nick@shmanahar.org>
  Radim Krčmář <rkrcmar@redhat.com>

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
 test-armhf-armhf-libvirt-xsm                                 fail    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-armhf-armhf-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
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
 test-amd64-amd64-xl-pvhv2-intel                              pass    
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


Not pushing.

------------------------------------------------------------
commit 993ca2068b043dc3c933a8a4fe1052b77fe63f10
Merge: 6793f1c450b1 060403f34008
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu Jan 25 17:30:47 2018 -0800

    Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input
    
    Pull input fixes from Dmitry Torokhov:
     "The main item is that we try to better handle the newer trackpoints on
      Lenovo devices that are now being produced by Elan/ALPS/NXP and only
      implement a small subset of the original IBM trackpoint controls"
    
    * 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input:
      Revert "Input: synaptics_rmi4 - use devm_device_add_group() for attributes in F01"
      Input: trackpoint - only expose supported controls for Elan, ALPS and NXP
      Input: trackpoint - force 3 buttons if 0 button is reported
      Input: xpad - add support for PDP Xbox One controllers
      Input: stmfts,s6sy671 - add SPDX identifier

commit 6793f1c450b1533a5e9c2493490de771d38b24f9
Author: Martin Brandenburg <martin@omnibond.com>
Date:   Thu Jan 25 19:39:44 2018 -0500

    orangefs: fix deadlock; do not write i_size in read_iter
    
    After do_readv_writev, the inode cache is invalidated anyway, so i_size
    will never be read.  It will be fetched from the server which will also
    know about updates from other machines.
    
    Fixes deadlock on 32-bit SMP.
    
    See https://marc.info/?l=linux-fsdevel&m=151268557427760&w=2
    
    Signed-off-by: Martin Brandenburg <martin@omnibond.com>
    Cc: Al Viro <viro@zeniv.linux.org.uk>
    Cc: Mike Marshall <hubcap@omnibond.com>
    Cc: stable@vger.kernel.org
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

commit 6e20630e300486045bf480139c9e17e7071629ce
Merge: 525273fb2e7c bda646dd182a
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu Jan 25 09:32:10 2018 -0800

    Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm
    
    Pull KVM fixes from Radim Krčmář:
     "Fix races and a potential use after free in the s390 cmma migration
      code"
    
    * tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm:
      KVM: s390: add proper locking for CMMA migration bitmap

commit 525273fb2e7c84c98e3dffc5b446141bda99ff01
Merge: 5b7d27967dab e4fd493c0541
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu Jan 25 09:03:10 2018 -0800

    Merge tag 'for-4.15-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
    
    Pull btrfs fix from David Sterba:
     "It's been reported recently that readdir can list stale entries under
      some conditions. Fix it."
    
    * tag 'for-4.15-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux:
      Btrfs: fix stale entries in readdir

commit 060403f34008af90e310d7e0e7531ebb3acf9557
Author: Nick Dyer <nick@shmanahar.org>
Date:   Wed Jan 24 13:46:04 2018 -0800

    Revert "Input: synaptics_rmi4 - use devm_device_add_group() for attributes in F01"
    
    Since the sysfs attribute hangs off the RMI bus, which doesn't go away during
    firmware flash, it needs to be explicitly removed, otherwise we would try and
    register the same attribute twice.
    
    This reverts commit 36a44af5c176d619552d99697433261141dd1296.
    
    Signed-off-by: Nick Dyer <nick@shmanahar.org>
    Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

commit e4fd493c0541d36953f7b9d3bfced67a1321792f
Author: Josef Bacik <jbacik@fb.com>
Date:   Tue Jan 23 15:17:05 2018 -0500

    Btrfs: fix stale entries in readdir
    
    In fixing the readdir+pagefault deadlock I accidentally introduced a
    stale entry regression in readdir.  If we get close to full for the
    temporary buffer, and then skip a few delayed deletions, and then try to
    add another entry that won't fit, we will emit the entries we found and
    retry.  Unfortunately we delete entries from our del_list as we find
    them, assuming we won't need them.  However our pos will be with
    whatever our last entry was, which could be before the delayed deletions
    we skipped, so the next search will add the deleted entries back into
    our readdir buffer.  So instead don't delete entries we find in our
    del_list so we can make sure we always find our delayed deletions.  This
    is a slight perf hit for readdir with lots of pending deletions, but
    hopefully this isn't a common occurrence.  If it is we can revist this
    and optimize it.
    
    cc: stable@vger.kernel.org
    Fixes: 23b5ec74943f ("btrfs: fix readdir deadlock with pagefault")
    Signed-off-by: Josef Bacik <jbacik@fb.com>
    Signed-off-by: David Sterba <dsterba@suse.com>

commit bda646dd182a90ba4239fc62b71eb8b73126fa77
Merge: 0c5b9b5d9adb 1de1ea7efeb9
Author: Radim Krčmář <rkrcmar@redhat.com>
Date:   Wed Jan 24 16:25:53 2018 +0100

    Merge tag 'kvm-s390-master-4.15-3' of git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux
    
    KVM: s390: another fix for cmma migration
    
    This fixes races and potential use after free in the
    cmma migration code.

commit 1de1ea7efeb9e8543212210e34518b4049ccd285
Author: Christian Borntraeger <borntraeger@de.ibm.com>
Date:   Fri Dec 22 10:54:20 2017 +0100

    KVM: s390: add proper locking for CMMA migration bitmap
    
    Some parts of the cmma migration bitmap is already protected
    with the kvm->lock (e.g. the migration start). On the other
    hand the read of the cmma bits is not protected against a
    concurrent free, neither is the emulation of the ESSA instruction.
    Let's extend the locking to all related ioctls by using
    the slots lock for
    - kvm_s390_vm_start_migration
    - kvm_s390_vm_stop_migration
    - kvm_s390_set_cmma_bits
    - kvm_s390_get_cmma_bits
    
    In addition to that, we use synchronize_srcu before freeing
    the migration structure as all users hold kvm->srcu for read.
    (e.g. the ESSA handler).
    
    Reported-by: David Hildenbrand <david@redhat.com>
    Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
    Cc: stable@vger.kernel.org # 4.13+
    Fixes: 190df4a212a7 (KVM: s390: CMMA tracking, ESSA emulation, migration mode)
    Reviewed-by: Claudio Imbrenda <imbrenda@linux.vnet.ibm.com>
    Reviewed-by: David Hildenbrand <david@redhat.com>
    Reviewed-by: Cornelia Huck <cohuck@redhat.com>

commit 2a924d71794c530e55e73d0ce2cc77233307eaa9
Author: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date:   Fri Jan 5 13:28:47 2018 -0800

    Input: trackpoint - only expose supported controls for Elan, ALPS and NXP
    
    The newer trackpoints from ALPS, Elan and NXP implement a very limited
    subset of extended commands and controls that the original trackpoints
    implemented, so we should not be exposing not working controls in sysfs.
    The newer trackpoints also do not implement "Power On Reset" or "Read
    Extended Button Status", so we should not be using these commands during
    initialization.
    
    While we are at it, let's change "unsigned char" to u8 for byte data or
    bool for booleans and use better suited error codes instead of -1.
    
    Cc: stable@vger.kernel.org
    Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

commit f5d07b9e98022d50720e38aa936fc11c67868ece
Author: Aaron Ma <aaron.ma@canonical.com>
Date:   Fri Jan 19 09:43:39 2018 -0800

    Input: trackpoint - force 3 buttons if 0 button is reported
    
    Lenovo introduced trackpoint compatible sticks with minimum PS/2 commands.
    They supposed to reply with 0x02, 0x03, or 0x04 in response to the
    "Read Extended ID" command, so we would know not to try certain extended
    commands. Unfortunately even some trackpoints reporting the original IBM
    version (0x01 firmware 0x0e) now respond with incorrect data to the "Get
    Extended Buttons" command:
    
     thinkpad_acpi: ThinkPad BIOS R0DET87W (1.87 ), EC unknown
     thinkpad_acpi: Lenovo ThinkPad E470, model 20H1004SGE
    
     psmouse serio2: trackpoint: IBM TrackPoint firmware: 0x0e, buttons: 0/0
    
    Since there are no trackpoints without buttons, let's assume the trackpoint
    has 3 buttons when we get 0 response to the extended buttons query.
    
    Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
    Fixes: https://bugzilla.kernel.org/show_bug.cgi?id=196253
    Cc: stable@vger.kernel.org
    Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

commit e5c9c6a885fad00aa559b49d8fc23a60e290824e
Author: Mark Furneaux <mark@furneaux.ca>
Date:   Mon Jan 22 11:24:17 2018 -0800

    Input: xpad - add support for PDP Xbox One controllers
    
    Adds support for the current lineup of Xbox One controllers from PDP
    (Performance Designed Products). These controllers are very picky with
    their initialization sequence and require an additional 2 packets before
    they send any input reports.
    
    Signed-off-by: Mark Furneaux <mark@furneaux.ca>
    Reviewed-by: Cameron Gutman <aicommander@gmail.com>
    Cc: stable@vger.kernel.org
    Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

commit f30fefd8949290f505b3af2ba3c7c4c831f199b3
Author: Andi Shyti <andi.shyti@samsung.com>
Date:   Mon Jan 22 11:23:27 2018 -0800

    Input: stmfts,s6sy671 - add SPDX identifier
    
    Replace the original license statement with the SPDX identifier.
    
    Update also the copyright owner adding myself as co-owner of the
    copyright.
    
    Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
    Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>


--===============1526127256117853356==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1526127256117853356==--
