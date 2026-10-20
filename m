Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73B6606A319
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 10:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=lrw5xn6zmrgwjg4x3oteet6dzm.protonmail2 header.b=vQJay5x0
Received: from list by lists.xenproject.org with outflank-mailman.1455126.1668854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ7VW-0000vY-PC; Tue, 20 Oct 2026 10:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455126.1668854; Tue, 20 Oct 2026 10:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ7VW-0000vP-LY; Tue, 20 Oct 2026 10:55:50 +0000
Received: by outflank-mailman (input) for mailman id 1455126;
 Tue, 20 Oct 2026 07:28:25 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <lluisbessasanz@proton.me>) id 1xJ4Gl-0001KX-M4
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 07:28:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJ4Gk-003d4d-VA
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 09:28:22 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <lluisbessasanz@proton.me>)
 id 6ad71813-2eae-0a2a0a5409dd-0a2a4505b8c0-32
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 09:28:22 +0200
Received: from [79.135.106.120] (helo=mail-106120.protonmail.ch)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <lluisbessasanz@proton.me>)
 id 6ad71816-4cb1-0a2a45050019-4f876a78ad7d-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 09:28:22 +0200
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=lrw5xn6zmrgwjg4x3oteet6dzm.protonmail2 header.d=proton.me header.i="@proton.me" header.h="Date:To:From:Subject:Message-ID:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=lrw5xn6zmrgwjg4x3oteet6dzm.protonmail2; t=1792481301;
	x=1792740501; bh=ma6dsYAeSOTRStqdIRsDBk+0FnUo+52hhwVoyi+LQ80=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=vQJay5x0a5nLQVuVxeaZVa8vIjOjYlPShyURML5WmMvkLArc/XvgVTxRF28f0H2m9
	 AU1xLf/CAO75GOzkcvj86lUav2STLilFsZRwMtGMwWG6w8o0AitfrKp0+eElAHVvXF
	 SidbHNQgNDBwQWw11XW0MYGLVohkLkxrSGJRblJG99MIRpEAKExFwRtjGGgVUYw1D9
	 0W9/A5U9jydC4xqAF2sRQJ96fqG18WTbZCboDupNy0hwFya1PIVwo91W9lpLwdSvn4
	 BgeRfkhTpECKBJFXcS9UXs+mZN1cPUx9s/HKCdWYryZcPlFKiZkM0gbmOWhhjg3r3q
	 LBSSqS/m2JFqQ==
Date: Tue, 20 Oct 2026 07:28:17 +0000
To: evilbootloader@proton.me, xen-devel@lists.xenproject.org
From: lluisbessasanz <lluisbessasanz@proton.me>
Subject: [PATCH] x86/altp2m: pause the vCPU before taking the altp2m list lock
Message-ID: <20261020072806.465449-1-lluisbessasanz@proton.me>
Feedback-ID: 116934124:user:proton
X-Pm-Message-ID: 133332cbbfb1a3cd7404c8e14a6732b930984778
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c201ff/1792481302-730B22A1-1A54319D/0/0
X-purgate-type: clean
X-purgate-size: 6492
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Llu=C3=ADs Bessa <evilbootloader@proton.me>

p2m_switch_vcpu_altp2m_by_id() takes the altp2m list lock and then
updates the vCPU's EPTP. For a vCPU other than current,
vmx_vcpu_update_eptp() -> vmx_vmcs_enter() pauses it and waits in
vcpu_sleep_sync() until it is off its pCPU, with the lock still held.

A vCPU on its way off its pCPU may need the p2m lock: context_switch()
updates its runstate area, which for an area registered by guest virtual
address (VCPUOP_register_runstate_memory_area, as Linux does) is a copy
to guest memory and needs a p2m lookup. A vCPU handling a log-dirty
write fault holds the host p2m lock in p2m_change_type_one() and waits
for the altp2m list lock in p2m_altp2m_propagate_change(). That closes
a cycle:

  dom0 vCPU, vm_event_resume() -> p2m_altp2m_check():
    holds the altp2m list lock, waits for vCPU X to be descheduled
  vCPU X, context_switch() -> update_runstate_area():
    waits for the host p2m lock
  vCPU Y, hvm_hap_nested_page_fault() -> p2m_change_type_one():
    holds the host p2m lock, waits for the altp2m list lock

A vm_event consumer switching views in its responses
(VM_EVENT_FLAG_ALTERNATE_P2M) hits it with a Linux HVM guest while QEMU
tracks dirty VRAM for a VNC client. The dom0 vCPUs involved spin in Xen
and stop handling interrupts, and dom0 hangs.

Pause the vCPU before taking the lock, like
p2m_switch_domain_altp2m_by_id() does with domain_pause_except_self().
The pause in vmx_vmcs_enter() then finds the vCPU already descheduled.
Only vm_event_resume() switches another vCPU's view, the other callers
switch current and are unaffected.

Signed-off-by: Llu=C3=ADs Bessa <evilbootloader@proton.me>
Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
---

Notes:
    Seen on Xen 4.20.1 (debug=3Dn), Intel family 6 model 0xb7, PV dom0 (Lin=
ux
    6.8, 6 vCPUs pinned), Xen command line:
      dom0_mem=3D6144M,max:6144M dom0_max_vcpus=3D6 dom0_vcpus_pin=3D1 forc=
e-ept=3D1
      ept=3Dad=3D0 hap_1gb=3D0 hap_2mb=3D0 altp2m=3D1 hpet=3Dlegacy-replace=
ment smt=3D0
      sched=3Dcredit conring_size=3D4M
    Guest: HVM, hap=3D1, altp2m=3D2 (external), 3 vCPUs, 8 GiB, vga=3D"stdv=
ga",
    vnc=3D1, QEMU 9.1.0. Ubuntu 22.04 with its stock 5.15 kernel, no driver=
s
    installed. The trace of CPU12 below shows Xen copying the runstate into
    guest memory, so the guest kernel registered a runstate area by itself.
   =20
    vm_event consumer: a multithreaded DRAKVUF build we are developing,
    which handles the vm_events of different vCPUs in parallel threads. It
    traces syscalls with altp2m breakpoints, every breakpoint response sets
    VM_EVENT_FLAG_ALTERNATE_P2M (fast single step). The same build with
    single-threaded event handling hangs as well, so one dom0 thread
    answering events is enough. Upstream DRAKVUF wasn't tested, it sends
    the same kind of responses.
   =20
    With a VNC client attached and the guest screen changing, dom0 hangs
    within seconds in most runs, with multithreaded and single-threaded
    event handling: soft lockups in dom0, disk and network I/O stop. Not
    seen without a VNC client, nor with a Windows guest without Xen PV
    drivers.
   =20
    Debug keys 'q' and 'd' during the hang (trimmed). d1 has pause_count=3D=
1
    (QEMU in hap_track_dirty_vram()), but its vCPUs are still running:
   =20
      VCPU0: CPU12 [has=3DT] pause_count=3D2
      VCPU1: CPU14 [has=3DT] pause_count=3D0
      VCPU2: CPU16 [has=3DT] pause_count=3D0
   =20
    CPU2 (d0v1, DRAKVUF answering a breakpoint; our build running with
    single-threaded event handling):
      vcpu_sleep_sync+0x32/0x60
      vmx_vmcs_try_enter.part.0+0x3e/0xe0
      vmx_vcpu_update_eptp+0x43/0xb0
      p2m_switch_vcpu_altp2m_by_id+0x14a/0x1d0
      vm_event_resume.part.0+0x245/0x270
      evtchn_send+0x28a/0x2e0
      do_event_channel_op+0x1cc/0x1130
   =20
    CPU12 (d1v0, being descheduled):
      queue_read_lock_slowpath+0x22/0x60
      p2m_get_page_from_gfn+0x305/0x360
      hvm_translate_get_page+0x19c/0x1e0
      __hvm_copy+0xa9/0x460
      copy_to_user_hvm+0x71/0x90
      update_runstate_area+0x200/0x3a0
      _update_runstate_area+0x9/0x40
      context_switch+0x63/0x940
      schedule+0x1c4/0x260
      __do_softirq+0x59/0xa0
      vmx_asm_do_vmentry+0x2b/0x30
   =20
    CPU14 (d1v1, log-dirty write fault on VRAM):
      _rspin_lock+0x42/0x60
      p2m_altp2m_propagate_change+0x62/0x2d0
      ept_set_entry+0x71c/0x7c0
      p2m_set_entry+0x8e/0x150
      p2m_change_type_one+0xb5/0x270
      hvm_hap_nested_page_fault+0x3f6/0x6b0
      vmx_vmexit_handler+0xe7f/0x17f0
   =20
    Also waiting: CPU8 (d0v4, QEMU) in vcpu_sleep_sync() from _domain_pause=
()
    in hap_track_dirty_vram(), CPU16 (d1v2) for the p2m write lock in
    p2m_get_gfn_type_access(), CPU10 (d0v5, netback) for the p2m read lock =
in
    gnttab_copy().
   =20
    Tested on 4.20.1 with this patch: 9 runs of 15 s with a VNC client
    attached, 3 with single-threaded and 6 with multithreaded event
    handling, 390k to 818k traced syscalls each, no hang. A run with a
    Windows guest works as before. Compile-tested on staging.

 xen/arch/x86/mm/altp2m.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index 0bc9b9a..8c3450c 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -220,6 +220,17 @@ bool p2m_switch_vcpu_altp2m_by_id(struct vcpu *v, unsi=
gned int idx)
     if ( idx >=3D d->nr_altp2m )
         return rc;
=20
+    /*
+     * Updating another vCPU's EPTP (vmx_vmcs_enter()) waits until that vC=
PU
+     * is off its pCPU. Wait for it before taking the altp2m list lock: th=
e
+     * vCPU may need the p2m lock to get off its pCPU (to update its runst=
ate
+     * area in guest memory), while a vCPU handling a log-dirty fault hold=
s the
+     * p2m lock and waits for the altp2m list lock in
+     * p2m_altp2m_propagate_change().
+     */
+    if ( v !=3D current )
+        vcpu_pause(v);
+
     altp2m_list_lock(d);
=20
     if ( d->arch.altp2m_eptp[idx] !=3D mfn_x(INVALID_MFN) )
@@ -230,6 +241,10 @@ bool p2m_switch_vcpu_altp2m_by_id(struct vcpu *v, unsi=
gned int idx)
     }
=20
     altp2m_list_unlock(d);
+
+    if ( v !=3D current )
+        vcpu_unpause(v);
+
     return rc;
 }
=20
--=20
2.56.0



