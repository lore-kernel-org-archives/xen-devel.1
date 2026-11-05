Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D3860720CD
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 15:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=IBFpOFMs
Received: from list by lists.xenproject.org with outflank-mailman.1475007.1681919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzj8-0005D3-P5; Thu, 05 Nov 2026 15:50:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1475007.1681919; Thu, 05 Nov 2026 15:50:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzj8-00059x-7f; Thu, 05 Nov 2026 15:50:10 +0000
Received: by outflank-mailman (input) for mailman id 1475007;
 Thu, 05 Nov 2026 15:50:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+4c1d8b341febb4002902+8474+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1xOzj3-00048z-Ox
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 15:50:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOzj3-00B7sn-55; Thu, 05 Nov 2026 16:50:05 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+4c1d8b341febb4002902+8474+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6aeca5ab-2eae-0a2a0a5409dd-0a2a4504ba48-14
 for <multiple-recipients>; Thu, 05 Nov 2026 16:50:05 +0100
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+4c1d8b341febb4002902+8474+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6aeca5ac-b57f-0a2a45040019-5a9b5cc79a2c-3
 for <multiple-recipients>; Thu, 05 Nov 2026 16:50:05 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xOziw-00000003Bnx-29gN; Thu, 05 Nov 2026 15:50:02 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xOzit-0000000AazA-3F3l;
 Thu, 05 Nov 2026 15:49:55 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=desiato.20200630 header.d=infradead.org header.i="@infradead.org" header.h="Sender:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=4v0rDhUMKy7kQmc3QfZi0l6L+ftlrEv1HxH6keOFZdY=; b=IBFpOFMsi6NlpMtYPKpOTju9Rz
	DYt/dOI0xTywoqJg1je/Aw5UehdLHfwZCvA0+U5UlA2LBReC+cQSkLu4+D5f90OBL5AVgaudHdcLX
	gJ+jCHLLz+g+poLxU6cXjbFtieCFYlWjnUfP11hqf4DC7n5OruYyfGEGtBVWMwXAe1kUCN/IRoqFT
	NzTkyrdbZuveCj0AvhWlaRdNaNP2jaTHjlr+vD4lm064zduWBZyvPu0vzyXehISJuSN/1ufQyC/Mq
	PiwB6dgoGAntbeAaStGhq6VtTIJnDTCN/HbGxju7Swe50SzsLrfygMn/KhS6IpodjzVgs5HuhFMsx
	zpwckCnA==;
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
Subject: [PATCH v11 07/23] KVM: x86: Avoid redundant masterclock updates from multiple vCPUs
Date: Thu,  5 Nov 2026 07:49:38 -0800
Message-ID: <20261105154955.2525419-8-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105154955.2525419-1-dwmw2@infradead.org>
References: <20261105154955.2525419-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-ebf023/1793893805-587C6B50-ADDD1A45/0/0
X-purgate-type: clean
X-purgate-size: 7053
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

When a masterclock update is triggered (e.g. by the clocksource change
notifier), KVM_REQ_MASTERCLOCK_UPDATE is set on all vCPUs. Without this
fix, each vCPU independently processes the request and redundantly
re-executes the entire pvclock_update_vm_gtod_copy() sequence, serialized
only by tsc_write_lock. Each redundant re-snapshot of the master clock
reference point introduces potential clock drift.

Fix this by having __kvm_start_pvclock_update() check, after acquiring
the lock, whether the requesting vCPU's KVM_REQ_MASTERCLOCK_UPDATE is
still set. If another vCPU already did the update and cleared it, bail
out. Otherwise, clear the request on all other vCPUs before proceeding.

The caller in vcpu_enter_guest() now uses kvm_test_request() (non-clearing)
since the clearing is done inside __kvm_start_pvclock_update() under the
lock.

kvm_end_pvclock_update() now broadcasts KVM_REQ_CLOCK_UPDATE and clears
KVM_REQ_MCLOCK_INPROGRESS while still inside the interrupts-off lock
section with the seqcount held open. That ordering is load-bearing for
the bail-out path: a vCPU whose request was consumed by another updater
must be guaranteed to observe either the open seqcount or its pending
KVM_REQ_CLOCK_UPDATE before it can enter the guest.

Since the update now consumes pending KVM_REQ_MASTERCLOCK_UPDATE
requests, the Hyper-V reenlightenment notifier must invalidate the
Hyper-V TSC page itself; previously a pending request survived the
notifier and refreshed the page via kvm_update_masterclock() later.

Suggested-by: Dongli Zhang <dongli.zhang@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Tested-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 arch/x86/kvm/msrs.c | 11 ++++++--
 arch/x86/kvm/x86.c  | 67 +++++++++++++++++++++++++++++++++++----------
 2 files changed, 61 insertions(+), 17 deletions(-)

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
index e3618d82c099..77bd3e4bfdcd 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -1712,10 +1712,39 @@ static void kvm_make_mclock_inprogress_request(struct kvm *kvm)
 	kvm_make_all_cpus_request(kvm, KVM_REQ_MCLOCK_INPROGRESS);
 }
 
-static void __kvm_start_pvclock_update(struct kvm *kvm)
+static void kvm_clear_mclock_inprogress_request(struct kvm *kvm)
 {
+	struct kvm_vcpu *vcpu;
+	unsigned long i;
+
+	kvm_for_each_vcpu(i, vcpu, kvm)
+		kvm_clear_request(KVM_REQ_MCLOCK_INPROGRESS, vcpu);
+}
+
+static bool __kvm_start_pvclock_update(struct kvm *kvm, struct kvm_vcpu *requesting_vcpu)
+{
+	struct kvm_vcpu *vcpu;
+	unsigned long i;
+
 	raw_spin_lock_irq(&kvm->arch.tsc_write_lock);
+
+	/*
+	 * If another vCPU already did the update while we were waiting
+	 * for the lock, our request will have been cleared. Bail out.
+	 */
+	if (requesting_vcpu &&
+	    !kvm_test_request(KVM_REQ_MASTERCLOCK_UPDATE, requesting_vcpu)) {
+		kvm_clear_mclock_inprogress_request(kvm);
+		raw_spin_unlock_irq(&kvm->arch.tsc_write_lock);
+		return false;
+	}
+
+	/* The update is VM-wide; prevent other vCPUs from redoing it. */
+	kvm_for_each_vcpu(i, vcpu, kvm)
+		kvm_clear_request(KVM_REQ_MASTERCLOCK_UPDATE, vcpu);
+
 	write_seqcount_begin(&kvm->arch.pvclock_sc);
+	return true;
 }
 
 static void kvm_start_pvclock_update(struct kvm *kvm)
@@ -1723,7 +1752,7 @@ static void kvm_start_pvclock_update(struct kvm *kvm)
 	kvm_make_mclock_inprogress_request(kvm);
 
 	/* no guest entries from this point */
-	__kvm_start_pvclock_update(kvm);
+	__kvm_start_pvclock_update(kvm, NULL);
 }
 
 static void kvm_end_pvclock_update(struct kvm *kvm)
@@ -1732,22 +1761,25 @@ static void kvm_end_pvclock_update(struct kvm *kvm)
 	struct kvm_vcpu *vcpu;
 	unsigned long i;
 
-	write_seqcount_end(&ka->pvclock_sc);
-	raw_spin_unlock_irq(&ka->tsc_write_lock);
 	kvm_for_each_vcpu(i, vcpu, kvm)
 		kvm_make_request(KVM_REQ_CLOCK_UPDATE, vcpu);
 
 	/* guest entries allowed */
-	kvm_for_each_vcpu(i, vcpu, kvm)
-		kvm_clear_request(KVM_REQ_MCLOCK_INPROGRESS, vcpu);
+	kvm_clear_mclock_inprogress_request(kvm);
+
+	write_seqcount_end(&ka->pvclock_sc);
+	raw_spin_unlock_irq(&ka->tsc_write_lock);
 }
 
-static void kvm_update_masterclock(struct kvm *kvm)
+static void kvm_update_masterclock(struct kvm *kvm, struct kvm_vcpu *vcpu)
 {
 	kvm_hv_request_tsc_page_update(kvm);
-	kvm_start_pvclock_update(kvm);
-	pvclock_update_vm_gtod_copy(kvm);
-	kvm_end_pvclock_update(kvm);
+	kvm_make_mclock_inprogress_request(kvm);
+
+	if (__kvm_start_pvclock_update(kvm, vcpu)) {
+		pvclock_update_vm_gtod_copy(kvm);
+		kvm_end_pvclock_update(kvm);
+	}
 }
 
 /*
@@ -6848,7 +6880,14 @@ static void kvm_hyperv_tsc_notifier(void)
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
 	}
@@ -8254,8 +8293,8 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
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
@@ -9628,7 +9667,7 @@ void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
 	vcpu_load(vcpu);
 	kvm_synchronize_tsc(vcpu, NULL);
 	if (kvm_check_request(KVM_REQ_MASTERCLOCK_UPDATE, vcpu))
-		kvm_update_masterclock(vcpu->kvm);
+		kvm_update_masterclock(vcpu->kvm, NULL);
 	vcpu_put(vcpu);
 
 	/* poll control enabled by default */
-- 
2.43.0


