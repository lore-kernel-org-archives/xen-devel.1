Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9AD606A8AF
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 18:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=B0c6cVsS
Received: from list by lists.xenproject.org with outflank-mailman.1484476.1687803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRClI-0008Ag-6B; Wed, 11 Nov 2026 18:09:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484476.1687803; Wed, 11 Nov 2026 18:09:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRClI-0008AY-3F; Wed, 11 Nov 2026 18:09:32 +0000
Received: by outflank-mailman (input) for mailman id 1484476;
 Wed, 11 Nov 2026 18:09:30 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+6fbd95a72608138381e9+8480+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1xRClG-0007s2-6A
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 18:09:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRClF-00Gwen-Gg; Wed, 11 Nov 2026 19:09:29 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+6fbd95a72608138381e9+8480+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6af4af3c-8faa-0a2a0a5109dd-0a2a45069894-48
 for <multiple-recipients>; Wed, 11 Nov 2026 19:09:28 +0100
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+6fbd95a72608138381e9+8480+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6af4af57-195a-0a2a45060019-5a9b5cc7d51a-3
 for <multiple-recipients>; Wed, 11 Nov 2026 19:09:28 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xRClB-00000009PvN-3CJy; Wed, 11 Nov 2026 18:09:25 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xRCl9-0000000HWsW-0ONu;
 Wed, 11 Nov 2026 18:09:23 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=desiato.20200630 header.d=infradead.org header.i="@infradead.org" header.h="Sender:Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=vWs4t5uxl9jHxvt00tM8dY6zv888q/Xb7jvTWjeauvw=; b=B0c6cVsSxce2OrrqxC/zRui5F5
	Dz5AvMue4Sv/ggFoLJPcscu4jQ2t/mbe8NsBBgsFONIdLXMf/1TuOTjrC7eg84Jy4OEEfhzW0BxBk
	zmhWDaef/8um3IflDZOaVmKbiXcFF06V2cA+cpTEjwebiyWi/Sqh6m8QDYSIa30HzqvMw+txcFOuY
	3ReiaJO74Zg1lCyFEgM6kWjc3yF0DWQoR5Yyq3W6IpzbgMIp/giuE6K0lPyEPnG6ah46LNofAyBfg
	9BVFanOuzGu6OxCh6bGsQ1IX5MGwusfghV698fp+p5F8OJSgzwtbhC2Zy5hHCwaF6ezbMujeTZ1sC
	cQl6Yh+A==;
From: David Woodhouse <dwmw2@infradead.org>
To: kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	x86@kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Paul Durrant <paul@xen.org>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Jack Allister <jalliste@amazon.com>,
	Dongli Zhang <dongli.zhang@oracle.com>,
	joe.jin@oracle.com,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH v13 08/26] KVM: x86: Avoid redundant masterclock updates from multiple vCPUs
Date: Wed, 11 Nov 2026 10:09:04 -0800
Message-ID: <20261111180922.4177927-9-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261111180922.4177927-1-dwmw2@infradead.org>
References: <20261111180922.4177927-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-16d1c6/1794420568-1FECC77B-24D56A9F/0/0
X-purgate-type: clean
X-purgate-size: 10605
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

When a masterclock update is triggered (e.g. by the clocksource change
notifier), KVM_REQ_MASTERCLOCK_UPDATE is set on all vCPUs, and each of
them independently re-executed the whole pvclock_update_vm_gtod_copy()
sequence, serialized only by tsc_write_lock. Every redundant
re-snapshot moves the reference point.

Let the first vCPU to take the lock do the update and clear the
request on the others, which then bail out; the caller in
vcpu_enter_guest() uses the non-clearing kvm_test_request(), since the
clearing happens under the lock. Concurrent updaters are refcounted:
each broadcasts its KVM_REQ_MCLOCK_INPROGRESS kicks before contending
for the lock, and only the last one out releases them, so a finishing
updater cannot free vCPUs into the guest while another update is in
flight. The seqcount write section opens before the pending requests
are consumed — a vCPU which sees its request gone and heads into
kvm_guest_time_update() spins until the new snapshot is live — and
closes before the KVM_REQ_CLOCK_UPDATE broadcast, so readers do not
spin across the request loops. Those loops run with interrupts off
under tsc_write_lock: bounded by the vCPU count, paid once per
deduplicated update.

Since the update now consumes pending requests, the Hyper-V
reenlightenment notifier must invalidate the Hyper-V TSC page itself;
previously a surviving request refreshed the page later.

Deduplication also strips the paper off an old race on the Hyper-V
TSC page which the preceding commit fixed properly: every vCPU
re-running the broadcast used to re-mark the page by accident, so the
masterclock update paths must now re-mark it on purpose, as
KVM_SET_CLOCK already does, once the new snapshot is published.

Suggested-by: Dongli Zhang <dongli.zhang@oracle.com>
Tested-by: Dongli Zhang <dongli.zhang@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/include/asm/kvm_host.h |   1 +
 arch/x86/kvm/msrs.c             |  11 ++-
 arch/x86/kvm/x86.c              | 122 +++++++++++++++++++++++++++-----
 3 files changed, 115 insertions(+), 19 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 74306a81e882..3f5aa1d3f6bb 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1241,6 +1241,7 @@ struct kvm_arch {
 	raw_spinlock_t tsc_write_lock;
 	u32 cur_tsc_khz;
 	u64 cur_tsc_scaling_ratio;
+	int mclock_updaters; /* protected by tsc_write_lock */
 	u64 cur_tsc_nsec;
 	u64 cur_tsc_write;
 	u64 cur_tsc_offset;
diff --git a/arch/x86/kvm/msrs.c b/arch/x86/kvm/msrs.c
index a2dffa1c706f..26eb30f10c43 100644
--- a/arch/x86/kvm/msrs.c
+++ b/arch/x86/kvm/msrs.c
@@ -1278,10 +1278,15 @@ static void kvm_write_system_time(struct kvm_vcpu *vcpu, gpa_t system_time,
 	struct kvm_arch *ka = &vcpu->kvm->arch;
 
 	if (vcpu->vcpu_id == 0 && !host_initiated) {
-		if (ka->boot_vcpu_runs_old_kvmclock != old_msr)
+		/*
+		 * Store the flag before requesting the masterclock update:
+		 * the update may now be performed by another vCPU (which
+		 * consumes this request), and it must observe the new value.
+		 */
+		if (ka->boot_vcpu_runs_old_kvmclock != old_msr) {
+			ka->boot_vcpu_runs_old_kvmclock = old_msr;
 			kvm_make_request(KVM_REQ_MASTERCLOCK_UPDATE, vcpu);
-
-		ka->boot_vcpu_runs_old_kvmclock = old_msr;
+		}
 	}
 
 	vcpu->arch.time = system_time;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index f7af94d8b3bb..0b3b04a156da 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -1756,13 +1756,72 @@ static void pvclock_update_vm_gtod_copy(struct kvm *kvm)
 
 static void kvm_make_mclock_inprogress_request(struct kvm *kvm)
 {
+	unsigned long flags;
+
+	/*
+	 * Count updaters in flight: several can broadcast their
+	 * KVM_REQ_MCLOCK_INPROGRESS kicks and then contend for
+	 * tsc_write_lock, and whoever finishes (or bails out) first must
+	 * not clear the kicks out from under the updates still pending —
+	 * vCPUs would re-enter the guest mid-update and miss the
+	 * un-kicked KVM_REQ_CLOCK_UPDATE made at the end.
+	 */
+	raw_spin_lock_irqsave(&kvm->arch.tsc_write_lock, flags);
+	kvm->arch.mclock_updaters++;
+	raw_spin_unlock_irqrestore(&kvm->arch.tsc_write_lock, flags);
+
 	kvm_make_all_cpus_request(kvm, KVM_REQ_MCLOCK_INPROGRESS);
 }
 
-static void __kvm_start_pvclock_update(struct kvm *kvm)
+/* Drop an updater; the last one out re-allows guest entries. */
+static void kvm_put_mclock_updater(struct kvm *kvm)
+{
+	struct kvm_vcpu *vcpu;
+	unsigned long i;
+
+	lockdep_assert_held(&kvm->arch.tsc_write_lock);
+
+	if (--kvm->arch.mclock_updaters)
+		return;
+
+	kvm_for_each_vcpu(i, vcpu, kvm)
+		kvm_clear_request(KVM_REQ_MCLOCK_INPROGRESS, vcpu);
+}
+
+static bool __kvm_start_pvclock_update(struct kvm *kvm, struct kvm_vcpu *requesting_vcpu)
 {
+	struct kvm_vcpu *vcpu;
+	unsigned long i;
+
 	raw_spin_lock_irq(&kvm->arch.tsc_write_lock);
+
+	/*
+	 * If another vCPU already did the update while we were waiting
+	 * for the lock, our request will have been cleared. Bail out,
+	 * dropping this updater's hold on KVM_REQ_MCLOCK_INPROGRESS.
+	 */
+	if (requesting_vcpu &&
+	    !kvm_test_request(KVM_REQ_MASTERCLOCK_UPDATE, requesting_vcpu)) {
+		kvm_put_mclock_updater(kvm);
+		raw_spin_unlock_irq(&kvm->arch.tsc_write_lock);
+		return false;
+	}
+
+	/*
+	 * Open the seqcount before consuming the other vCPUs' requests:
+	 * a vCPU which sees its KVM_REQ_MASTERCLOCK_UPDATE gone and goes
+	 * straight to kvm_guest_time_update() must then spin on the
+	 * seqcount until the new snapshot is live, rather than read the
+	 * old one (and, via kvm_hv_setup_tsc_page(), consume the Hyper-V
+	 * TSC page's pending state against it).
+	 */
 	write_seqcount_begin(&kvm->arch.pvclock_sc);
+
+	/* The update is VM-wide; prevent other vCPUs from redoing it. */
+	kvm_for_each_vcpu(i, vcpu, kvm)
+		kvm_clear_request(KVM_REQ_MASTERCLOCK_UPDATE, vcpu);
+
+	return true;
 }
 
 static void kvm_start_pvclock_update(struct kvm *kvm)
@@ -1770,7 +1829,7 @@ static void kvm_start_pvclock_update(struct kvm *kvm)
 	kvm_make_mclock_inprogress_request(kvm);
 
 	/* no guest entries from this point */
-	__kvm_start_pvclock_update(kvm);
+	__kvm_start_pvclock_update(kvm, NULL);
 }
 
 static void kvm_end_pvclock_update(struct kvm *kvm)
@@ -1779,14 +1838,22 @@ static void kvm_end_pvclock_update(struct kvm *kvm)
 	struct kvm_vcpu *vcpu;
 	unsigned long i;
 
+	/*
+	 * The new snapshot is complete; close the seqcount first so
+	 * readers stop spinning while the requests are broadcast. The
+	 * CLOCK_UPDATE requests must precede the release of the
+	 * INPROGRESS holds, so that a vCPU allowed back into the guest
+	 * is guaranteed to refresh its pvclock on the way in.
+	 */
 	write_seqcount_end(&ka->pvclock_sc);
-	raw_spin_unlock_irq(&ka->tsc_write_lock);
+
 	kvm_for_each_vcpu(i, vcpu, kvm)
 		kvm_make_request(KVM_REQ_CLOCK_UPDATE, vcpu);
 
-	/* guest entries allowed */
-	kvm_for_each_vcpu(i, vcpu, kvm)
-		kvm_clear_request(KVM_REQ_MCLOCK_INPROGRESS, vcpu);
+	/* guest entries allowed, unless another update is in flight */
+	kvm_put_mclock_updater(kvm);
+
+	raw_spin_unlock_irq(&ka->tsc_write_lock);
 }
 
 /*
@@ -1819,12 +1886,27 @@ static void kvm_hv_remark_tsc_page(struct kvm *kvm)
 #endif
 }
 
-static void kvm_update_masterclock(struct kvm *kvm)
+static void kvm_update_masterclock(struct kvm *kvm, struct kvm_vcpu *vcpu)
 {
+	/*
+	 * The Hyper-V TSC page request is made before the dedupe check
+	 * in __kvm_start_pvclock_update() because it takes a mutex and
+	 * so cannot sit inside the tsc_write_lock critical section where
+	 * the winning updater is known. A losing vCPU may therefore mark
+	 * the page HOST_CHANGED after the winner has already rewritten
+	 * it; the next clock update then rewrites the page again with
+	 * the same contents, which the TSC-page sequence protocol makes
+	 * safe against concurrently running guests.
+	 */
 	kvm_hv_request_tsc_page_update(kvm);
-	kvm_start_pvclock_update(kvm);
-	pvclock_update_vm_gtod_copy(kvm);
-	kvm_end_pvclock_update(kvm);
+	kvm_make_mclock_inprogress_request(kvm);
+
+	if (__kvm_start_pvclock_update(kvm, vcpu)) {
+		pvclock_update_vm_gtod_copy(kvm);
+		kvm_end_pvclock_update(kvm);
+
+		kvm_hv_remark_tsc_page(kvm);
+	}
 }
 
 /*
@@ -4604,7 +4686,6 @@ static int kvm_vm_ioctl_set_clock(struct kvm *kvm, void __user *argp)
 	ka->kvmclock_offset = data.clock - now_raw_ns;
 	kvm_end_pvclock_update(kvm);
 
-	/* As in kvm_update_masterclock(): re-mark after publishing. */
 	kvm_hv_remark_tsc_page(kvm);
 	return 0;
 }
@@ -6961,9 +7042,18 @@ static void kvm_hyperv_tsc_notifier(void)
 	kvm_caps.max_guest_tsc_khz = tsc_khz;
 
 	list_for_each_entry(kvm, &vm_list, vm_list) {
-		__kvm_start_pvclock_update(kvm);
+		/*
+		 * Invalidate the Hyper-V TSC page explicitly: the update
+		 * below consumes any pending KVM_REQ_MASTERCLOCK_UPDATE,
+		 * which would otherwise have refreshed the page from
+		 * kvm_update_masterclock().
+		 */
+		kvm_hv_request_tsc_page_update(kvm);
+		__kvm_start_pvclock_update(kvm, NULL);
 		pvclock_update_vm_gtod_copy(kvm);
 		kvm_end_pvclock_update(kvm);
+
+		kvm_hv_remark_tsc_page(kvm);
 	}
 
 	mutex_unlock(&kvm_lock);
@@ -8367,8 +8457,8 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 			kvm_mmu_free_obsolete_roots(vcpu);
 		if (kvm_check_request(KVM_REQ_MIGRATE_TIMER, vcpu))
 			__kvm_migrate_timers(vcpu);
-		if (kvm_check_request(KVM_REQ_MASTERCLOCK_UPDATE, vcpu))
-			kvm_update_masterclock(vcpu->kvm);
+		if (kvm_test_request(KVM_REQ_MASTERCLOCK_UPDATE, vcpu))
+			kvm_update_masterclock(vcpu->kvm, vcpu);
 		if (kvm_check_request(KVM_REQ_GLOBAL_CLOCK_UPDATE, vcpu))
 			kvm_gen_kvmclock_update(vcpu);
 		if (kvm_check_request(KVM_REQ_CLOCK_UPDATE, vcpu)) {
@@ -9766,13 +9856,13 @@ void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
 		 * master clock does not stay in its previous mode with
 		 * running siblings keeping PVCLOCK_TSC_STABLE_BIT.
 		 */
-		kvm_update_masterclock(vcpu->kvm);
+		kvm_update_masterclock(vcpu->kvm, NULL);
 		return;
 	}
 	vcpu_load(vcpu);
 	kvm_synchronize_tsc(vcpu, NULL);
 	if (kvm_check_request(KVM_REQ_MASTERCLOCK_UPDATE, vcpu))
-		kvm_update_masterclock(vcpu->kvm);
+		kvm_update_masterclock(vcpu->kvm, NULL);
 	vcpu_put(vcpu);
 
 	/* poll control enabled by default */
-- 
2.43.0


