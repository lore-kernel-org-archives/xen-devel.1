From: osstest service owner <osstest-admin@xenproject.org>
Subject: [linux-linus bisection] complete
 test-amd64-amd64-qemuu-nested-amd
Date: Tue, 11 Sep 2018 02:17:32 +0000
Message-ID: <E1fzYFA-0003uo-NB@osstest.test-lab.xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5203987469524196661=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qnbd=lz=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1fzYFH-0008Dp-3p
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 02:17:39 +0000
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

--===============5203987469524196661==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-qemuu-nested-amd
testid debian-hvm-install

Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  linux git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
  Bug introduced:  93065ac753e4443840a057bfef4be71ec766fde9
  Bug not present: c2343d2761f86ae1b857f78c7cdb9f51e5fa1641
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/127488/


  commit 93065ac753e4443840a057bfef4be71ec766fde9
  Author: Michal Hocko <mhocko@suse.com>
  Date:   Tue Aug 21 21:52:33 2018 -0700
  
      mm, oom: distinguish blockable mode for mmu notifiers
      
      There are several blockable mmu notifiers which might sleep in
      mmu_notifier_invalidate_range_start and that is a problem for the
      oom_reaper because it needs to guarantee a forward progress so it cannot
      depend on any sleepable locks.
      
      Currently we simply back off and mark an oom victim with blockable mmu
      notifiers as done after a short sleep.  That can result in selecting a new
      oom victim prematurely because the previous one still hasn't torn its
      memory down yet.
      
      We can do much better though.  Even if mmu notifiers use sleepable locks
      there is no reason to automatically assume those locks are held.  Moreover
      majority of notifiers only care about a portion of the address space and
      there is absolutely zero reason to fail when we are unmapping an unrelated
      range.  Many notifiers do really block and wait for HW which is harder to
      handle and we have to bail out though.
      
      This patch handles the low hanging fruit.
      __mmu_notifier_invalidate_range_start gets a blockable flag and callbacks
      are not allowed to sleep if the flag is set to false.  This is achieved by
      using trylock instead of the sleepable lock for most callbacks and
      continue as long as we do not block down the call chain.
      
      I think we can improve that even further because there is a common pattern
      to do a range lookup first and then do something about that.  The first
      part can be done without a sleeping lock in most cases AFAICS.
      
      The oom_reaper end then simply retries if there is at least one notifier
      which couldn't make any progress in !blockable mode.  A retry loop is
      already implemented to wait for the mmap_sem and this is basically the
      same thing.
      
      The simplest way for driver developers to test this code path is to wrap
      userspace code which uses these notifiers into a memcg and set the hard
      limit to hit the oom.  This can be done e.g.  after the test faults in all
      the mmu notifier managed memory and set the hard limit to something really
      small.  Then we are looking for a proper process tear down.
      
      [akpm@linux-foundation.org: coding style fixes]
      [akpm@linux-foundation.org: minor code simplification]
      Link: http://lkml.kernel.org/r/20180716115058.5559-1-mhocko@kernel.org
      Signed-off-by: Michal Hocko <mhocko@suse.com>
      Acked-by: Christian König <christian.koenig@amd.com> # AMD notifiers
      Acked-by: Leon Romanovsky <leonro@mellanox.com> # mlx and umem_odp
      Reported-by: David Rientjes <rientjes@google.com>
      Cc: "David (ChunMing) Zhou" <David1.Zhou@amd.com>
      Cc: Paolo Bonzini <pbonzini@redhat.com>
      Cc: Alex Deucher <alexander.deucher@amd.com>
      Cc: David Airlie <airlied@linux.ie>
      Cc: Jani Nikula <jani.nikula@linux.intel.com>
      Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
      Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
      Cc: Doug Ledford <dledford@redhat.com>
      Cc: Jason Gunthorpe <jgg@ziepe.ca>
      Cc: Mike Marciniszyn <mike.marciniszyn@intel.com>
      Cc: Dennis Dalessandro <dennis.dalessandro@intel.com>
      Cc: Sudeep Dutt <sudeep.dutt@intel.com>
      Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
      Cc: Dimitri Sivanich <sivanich@sgi.com>
      Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
      Cc: Juergen Gross <jgross@suse.com>
      Cc: "Jérôme Glisse" <jglisse@redhat.com>
      Cc: Andrea Arcangeli <aarcange@redhat.com>
      Cc: Felix Kuehling <felix.kuehling@amd.com>
      Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
      Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/linux-linus/test-amd64-amd64-qemuu-nested-amd.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/linux-linus/test-amd64-amd64-qemuu-nested-amd.debian-hvm-install --summary-out=tmp/127488.bisection-summary --basis-template=125898 --blessings=real,real-bisect linux-linus test-amd64-amd64-qemuu-nested-amd debian-hvm-install
Searching for failure / basis pass:
 127458 fail [host=pinot1] / 126310 ok.
Failure / basis pass flights: 127458 / 126310
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 9a5682765a2e5f93cf2fe7b612b8072b18f0c68a c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 1d069e45f7c2f6b2982797dd32092b300bacafad
Basis pass 778a33959a8ad4cb1ea2f4c5119f9e1e8b9f9d9b c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 3dd454c6c694409aaedd4ed075d6aeace2dd8391
Generating revisions with ./adhoc-revtuple-generator  git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git#778a33959a8ad4cb1ea2f4c5119f9e1e8b9f9d9b-9a5682765a2e5f93cf2fe7b612b8072b18f0c68a git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#c8ea0457495342c417c3dc033bba25148b279f60-9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 git://xenbits.xen.org/qemu-xen.git#4f080070a9809bde857851e68a3aeff0c4b9b6a6-de5b678ca4dcdfa83e322491d478d66df56c1986 git://xenbits.xen.org/xen.git#3dd454c6c694409aaedd4ed075d6aeace2dd8391-1d069e45f7c2f6b2982797dd32092b300bacafad
Loaded 597010 nodes in revision graph
Searching for test results:
 126310 pass 778a33959a8ad4cb1ea2f4c5119f9e1e8b9f9d9b c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 3dd454c6c694409aaedd4ed075d6aeace2dd8391
 126412 fail irrelevant
 126550 fail irrelevant
 126682 fail irrelevant
 126888 fail irrelevant
 126978 fail irrelevant
 127038 fail irrelevant
 127108 fail irrelevant
 127148 fail irrelevant
 127193 fail irrelevant
 127221 fail irrelevant
 127256 fail irrelevant
 127284 fail irrelevant
 127315 fail irrelevant
 127344 fail irrelevant
 127364 fail irrelevant
 127457 fail b7b4247d553939ccf02ff597ec60f41a2f93ee8e c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 36e29dd9e580cb0f847f5ac1e72afdb5febe3e99
 127446 fail 741880e1f2f59b20125dc480765d2546cec66080 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 a9a2a761f75126d908612c64fabe6adde2b6d2b9
 127389 fail irrelevant
 127447 fail ff06525fcb8ae3c302ac1319bf6c07c026dea964 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 342dcb6430d76ebd1ce229a02bad83f8881c9ac9
 127466 fail b66fb005c97544e9e589b2f2e60ccfe3808c6c3e c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 1cd5d824c716280db4b5799d9aa64ca2f0730f72
 127459 fail 00efcdce67a365ec1881a6fbf17f769d690244e9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 4f080070a9809bde857851e68a3aeff0c4b9b6a6 a923919797c39d51ea0b808ea691bed20fe8e072
 127448 fail 25a8238f4cc8425d4aade4f9041be468d0e8aa2e c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 66235dd9f014e46b125c0f461c2f18a799de4d25
 127403 fail irrelevant
 127449 fail f707ef61e17261f2bb18c3e4871c6f135ab3aba9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 66235dd9f014e46b125c0f461c2f18a799de4d25
 127415 fail irrelevant
 127443 fail f8f65382c98a28e3c2b20df9dd4231dca5a11682 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 1d069e45f7c2f6b2982797dd32092b300bacafad
 127450 fail 455c4401fe7a538facaffb35b906ce19f1ece474 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 66235dd9f014e46b125c0f461c2f18a799de4d25
 127451 pass 778a33959a8ad4cb1ea2f4c5119f9e1e8b9f9d9b c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 3dd454c6c694409aaedd4ed075d6aeace2dd8391
 127460 fail d40acad1f1979194ecda83f77468751244b4b098 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 4f080070a9809bde857851e68a3aeff0c4b9b6a6 a923919797c39d51ea0b808ea691bed20fe8e072
 127441 pass 778a33959a8ad4cb1ea2f4c5119f9e1e8b9f9d9b c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 3dd454c6c694409aaedd4ed075d6aeace2dd8391
 127444 fail irrelevant
 127445 fail 00fe9c326d2027f2437dea38ef0e82f9d02d94c0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 a9a2a761f75126d908612c64fabe6adde2b6d2b9
 127477 pass 778a33959a8ad4cb1ea2f4c5119f9e1e8b9f9d9b c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 3dd454c6c694409aaedd4ed075d6aeace2dd8391
 127452 fail f8f65382c98a28e3c2b20df9dd4231dca5a11682 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 1d069e45f7c2f6b2982797dd32092b300bacafad
 127456 fail a8cf76a9023bc6709b1361d06bb2fae5227b9d68 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 55924f9d923b51ce8ed6d2ecc7a3644a8562e8d9
 127484 pass c2343d2761f86ae1b857f78c7cdb9f51e5fa1641 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 1cd5d824c716280db4b5799d9aa64ca2f0730f72
 127462 fail 2a9d6481004215da8e93edb588cf448f2af80303 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 1cd5d824c716280db4b5799d9aa64ca2f0730f72
 127471 fail 85f237a57f143c0c895dcb7cc53fa0174522ce07 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 1cd5d824c716280db4b5799d9aa64ca2f0730f72
 127468 pass 778a33959a8ad4cb1ea2f4c5119f9e1e8b9f9d9b c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 bb126eaf2c9d12a2368162e7aa27313c2ddc6fe8
 127480 fail f1547959d9efd0be6cac2a2fd32f05dd7144dd6c c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 1cd5d824c716280db4b5799d9aa64ca2f0730f72
 127482 fail 93065ac753e4443840a057bfef4be71ec766fde9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 1cd5d824c716280db4b5799d9aa64ca2f0730f72
 127458 fail 9a5682765a2e5f93cf2fe7b612b8072b18f0c68a c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 1d069e45f7c2f6b2982797dd32092b300bacafad
 127476 pass c2343d2761f86ae1b857f78c7cdb9f51e5fa1641 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 1cd5d824c716280db4b5799d9aa64ca2f0730f72
 127478 fail 9a5682765a2e5f93cf2fe7b612b8072b18f0c68a c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c0eed618f37dd5b4a57c8b3fbc48ef8913e3149 de5b678ca4dcdfa83e322491d478d66df56c1986 1d069e45f7c2f6b2982797dd32092b300bacafad
 127481 fail c3b78b11efbb2865433abf9d22c004ffe4a73f5c c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 1cd5d824c716280db4b5799d9aa64ca2f0730f72
 127487 pass c2343d2761f86ae1b857f78c7cdb9f51e5fa1641 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 1cd5d824c716280db4b5799d9aa64ca2f0730f72
 127485 fail 93065ac753e4443840a057bfef4be71ec766fde9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 1cd5d824c716280db4b5799d9aa64ca2f0730f72
 127488 fail 93065ac753e4443840a057bfef4be71ec766fde9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 1cd5d824c716280db4b5799d9aa64ca2f0730f72
Searching for interesting versions
 Result found: flight 126310 (pass), for basis pass
 Result found: flight 127458 (fail), for basis failure
 Repro found: flight 127477 (pass), for basis pass
 Repro found: flight 127478 (fail), for basis failure
 0 revisions at c2343d2761f86ae1b857f78c7cdb9f51e5fa1641 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8ea0457495342c417c3dc033bba25148b279f60 4f080070a9809bde857851e68a3aeff0c4b9b6a6 1cd5d824c716280db4b5799d9aa64ca2f0730f72
No revisions left to test, checking graph state.
 Result found: flight 127476 (pass), for last pass
 Result found: flight 127482 (fail), for first failure
 Repro found: flight 127484 (pass), for last pass
 Repro found: flight 127485 (fail), for first failure
 Repro found: flight 127487 (pass), for last pass
 Repro found: flight 127488 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  linux git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
  Bug introduced:  93065ac753e4443840a057bfef4be71ec766fde9
  Bug not present: c2343d2761f86ae1b857f78c7cdb9f51e5fa1641
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/127488/


  commit 93065ac753e4443840a057bfef4be71ec766fde9
  Author: Michal Hocko <mhocko@suse.com>
  Date:   Tue Aug 21 21:52:33 2018 -0700
  
      mm, oom: distinguish blockable mode for mmu notifiers
      
      There are several blockable mmu notifiers which might sleep in
      mmu_notifier_invalidate_range_start and that is a problem for the
      oom_reaper because it needs to guarantee a forward progress so it cannot
      depend on any sleepable locks.
      
      Currently we simply back off and mark an oom victim with blockable mmu
      notifiers as done after a short sleep.  That can result in selecting a new
      oom victim prematurely because the previous one still hasn't torn its
      memory down yet.
      
      We can do much better though.  Even if mmu notifiers use sleepable locks
      there is no reason to automatically assume those locks are held.  Moreover
      majority of notifiers only care about a portion of the address space and
      there is absolutely zero reason to fail when we are unmapping an unrelated
      range.  Many notifiers do really block and wait for HW which is harder to
      handle and we have to bail out though.
      
      This patch handles the low hanging fruit.
      __mmu_notifier_invalidate_range_start gets a blockable flag and callbacks
      are not allowed to sleep if the flag is set to false.  This is achieved by
      using trylock instead of the sleepable lock for most callbacks and
      continue as long as we do not block down the call chain.
      
      I think we can improve that even further because there is a common pattern
      to do a range lookup first and then do something about that.  The first
      part can be done without a sleeping lock in most cases AFAICS.
      
      The oom_reaper end then simply retries if there is at least one notifier
      which couldn't make any progress in !blockable mode.  A retry loop is
      already implemented to wait for the mmap_sem and this is basically the
      same thing.
      
      The simplest way for driver developers to test this code path is to wrap
      userspace code which uses these notifiers into a memcg and set the hard
      limit to hit the oom.  This can be done e.g.  after the test faults in all
      the mmu notifier managed memory and set the hard limit to something really
      small.  Then we are looking for a proper process tear down.
      
      [akpm@linux-foundation.org: coding style fixes]
      [akpm@linux-foundation.org: minor code simplification]
      Link: http://lkml.kernel.org/r/20180716115058.5559-1-mhocko@kernel.org
      Signed-off-by: Michal Hocko <mhocko@suse.com>
      Acked-by: Christian König <christian.koenig@amd.com> # AMD notifiers
      Acked-by: Leon Romanovsky <leonro@mellanox.com> # mlx and umem_odp
      Reported-by: David Rientjes <rientjes@google.com>
      Cc: "David (ChunMing) Zhou" <David1.Zhou@amd.com>
      Cc: Paolo Bonzini <pbonzini@redhat.com>
      Cc: Alex Deucher <alexander.deucher@amd.com>
      Cc: David Airlie <airlied@linux.ie>
      Cc: Jani Nikula <jani.nikula@linux.intel.com>
      Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
      Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
      Cc: Doug Ledford <dledford@redhat.com>
      Cc: Jason Gunthorpe <jgg@ziepe.ca>
      Cc: Mike Marciniszyn <mike.marciniszyn@intel.com>
      Cc: Dennis Dalessandro <dennis.dalessandro@intel.com>
      Cc: Sudeep Dutt <sudeep.dutt@intel.com>
      Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
      Cc: Dimitri Sivanich <sivanich@sgi.com>
      Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
      Cc: Juergen Gross <jgross@suse.com>
      Cc: "Jérôme Glisse" <jglisse@redhat.com>
      Cc: Andrea Arcangeli <aarcange@redhat.com>
      Cc: Felix Kuehling <felix.kuehling@amd.com>
      Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
      Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

pnmtopng: 216 colors found
Revision graph left in /home/logs/results/bisect/linux-linus/test-amd64-amd64-qemuu-nested-amd.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
127488: tolerable ALL FAIL

flight 127488 linux-linus real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/127488/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-qemuu-nested-amd 10 debian-hvm-install fail baseline untested


jobs:
 test-amd64-amd64-qemuu-nested-amd                            fail    


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



--===============5203987469524196661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5203987469524196661==--
