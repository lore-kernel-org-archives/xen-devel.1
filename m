From: osstest service owner <osstest-admin@xenproject.org>
Subject: [xen-unstable test] 118456: regressions - FAIL
Date: Wed, 31 Jan 2018 19:51:54 +0000
Message-ID: <osstest-118456-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2565383322080931730=="
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

--===============2565383322080931730==
Content-Type: text/plain

flight 118456 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/118456/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-multivcpu 16 guest-start/debian.repeat fail REGR. vs. 118441

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt-xsm 14 saverestore-support-check    fail  like 118423
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 118441
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 118441
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 118441
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 118441
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 118441
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 118441
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop             fail like 118441
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 118441
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 118441
 test-amd64-amd64-xl-pvhv2-intel 12 guest-start                 fail never pass
 test-amd64-amd64-xl-pvhv2-amd 12 guest-start                  fail  never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-xsm      13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemuu-win10-i386 10 windows-install        fail never pass
 test-amd64-amd64-xl-qemut-win10-i386 10 windows-install        fail never pass
 test-amd64-i386-xl-qemut-win10-i386 10 windows-install         fail never pass
 test-amd64-i386-xl-qemuu-win10-i386 10 windows-install         fail never pass

version targeted for testing:
 xen                  2b8d75e975d6fbe0140969154a67601698b84738
baseline version:
 xen                  4c7e478d597b0346eef3a256cfd6794ac778b608

Last test of basis   118441  2018-01-29 15:47:57 Z    2 days
Testing same since   118456  2018-01-30 15:48:17 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Christian Lindig <christian.lindig@citrix.com>
  Daniel De Graaf <dgdegra@tycho.nsa.gov>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Wei Liu <wei.liu2@citrix.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-armhf-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-prev                                             pass    
 build-i386-prev                                              pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 build-amd64-rumprun                                          pass    
 build-i386-rumprun                                           pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    
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
 test-armhf-armhf-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
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
 test-amd64-amd64-xl-pvhv2-intel                              fail    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  pass    
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
commit 2b8d75e975d6fbe0140969154a67601698b84738
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Sat Jan 27 21:09:10 2018 +0000

    x86/hvm: Drop hvm_set_mode() and associated vmx hooks
    
    This is more vestigial rementants of PVHv1.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>

commit 474bb2e262b54e32ddb82b226ee1c69b86361930
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Sun Jan 21 17:21:05 2018 +0000

    xen/evtchn: Cleanup for virq_is_global() infrastructure
    
    Switch it, and the arch infrastructure, to return bool.  Drop the unnecessary
    rc variable, and remove a redundant assertion from send_global_virq().
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 1943e8fe359e8b507759acea139e6fc9be241105
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Jan 29 18:01:35 2018 +0000

    x86/asm: Drop __GET_CURRENT()
    
    __GET_CURRENT() is dangerous to use, as is easy to confuse with GET_CURRENT(),
    but strictly depends on the regster parameter already having the STACK_END
    value in it.  Also, there is no reason to special case accesses of
    current_vcpu differently to other cpuinfo fields.
    
    Expand __GET_CURRENT() in its current users, and remove the macro.
    
    Take the opportunity to replace the GET_CURRENT() in the cstar path which
    doesn't need to recalculate STACK_END.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 43cc31b4778ed8313c4324547da1f46037132c52
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Jan 26 19:03:12 2018 +0000

    tools/libxl: Fix assertion failure when trying to build a nested-virt PVH domain
    
    xl: libxl.c:339: libxl_defbool_val: Assertion `!libxl_defbool_is_default(db)' failed.
    
    This happens because initiate_domain_create() checks for type != HVM, then
    pokes at the hvm union.  Check for == HVM instead so the union access is
    correctly guarded.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

commit 0252bcf32d4f193d5a077342ca62fe16b6731b58
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Jan 26 19:33:40 2018 +0000

    xen: Fix XSM build after dropping XEN_DOMCTL_getmemlist
    
    c/s 94450e36bfbb removed XEN_DOMCTL_getmemlist entirely, but missed adjusting
    the XSM side of things.  As far as I can tell, 'pagelist' wasn't even offered
    to dom0 in default policy.
    
    Also, drop the stale struct xen_domctl_getmemlist which was missed from the
    same changeset.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Daniel De Graaf <dgdegra@tycho.nsa.gov>

commit b03e568ea9eb609f85a0a496c83a5f27ce18498e
Author: Stefano Stabellini <sstabellini@kernel.org>
Date:   Fri Jan 26 09:19:31 2018 -0800

    x86/boot: turn the selftests ASSERT into a warning
    
    On selftests failure, print a very visible warning instead of crashing
    over an ASSERT.
    
    Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    
    Adjust to print extra information in the case of a failure
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 510414bd5a65a239912c12482102073ca8cf7424
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Jan 26 15:59:51 2018 +0000

    x86/boot: Make the "Building Dom0" messages consistent
    
    Switch the PV message to match the wording of the PVH side, use the same
    number of ***'s, explicitly identify PV vs PVH, set the log level at INFO, and
    print the real domid (which won't be 0 in pv-shim mode).
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Wei Liu <wei.liu2@citrix.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 94450e36bfbb1cac447fb4009476e6d54bf68678
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Jan 15 10:00:51 2018 +0000

    xen: Drop DOMCTL_getmemlist and xc_get_pfn_list()
    
    c/s 4ddf474e2 "tools/xen-mceinj: Pass in GPA when injecting through
    MSR_MCI_ADDR" removed the remaining user of hypercall.
    
    It has been listed as broken, deprecated and wont-fix since XSA-74, so take
    this opportunity to remove it completely.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>

commit d933f1a53c06002351c1e36d40615e40bd4bf6af
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Jan 19 18:04:27 2018 +0000

    tools/ocaml: Drop coredump infrastructure
    
    It is unused, and uses an obsolete hypercall which has never ever functioned
    for HVM guests.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>

commit 1124a9a26f05439a3aa31eaea227285e50dc94c0
Author: Roger Pau Monne <roger.pau@citrix.com>
Date:   Fri Jan 26 15:29:10 2018 +0000

    xen/pvshim: fix GNTTABOP_query_size hypercall forwarding with SMAP
    
    Disable SMAP in the shim before bouncing the hypercall, or else L0
    will fail to get the hypercall buffer.
    
    Reported-by: Fatih Acar <fatih.acar@gandi.net>
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Wei Liu <wei.liu2@citrix.com>
(qemu changes not included)


--===============2565383322080931730==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2565383322080931730==--
