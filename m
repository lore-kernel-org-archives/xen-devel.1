Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE3AC43458
	for <xen-devel@archiver.kernel.org>; Fri,  3 Jul 2026 21:22:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1353748.1609438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wflKm-000522-Fe; Fri, 03 Jul 2026 21:22:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1353748.1609438; Fri, 03 Jul 2026 21:22:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wflKm-00051r-CB; Fri, 03 Jul 2026 21:22:04 +0000
Received: by outflank-mailman (input) for mailman id 1353748;
 Fri, 03 Jul 2026 21:22:03 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+ba378bf2ab63d22ff04d+8349+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1wflKk-00051O-DP
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 21:22:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wflKj-001t36-Bn; Fri, 03 Jul 2026 23:22:01 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+ba378bf2ab63d22ff04d+8349+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a4827ca-bab6-0a2a0a5309dd-0a2a4503bf3c-14
 for <multiple-recipients>; Fri, 03 Jul 2026 23:22:01 +0200
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+ba378bf2ab63d22ff04d+8349+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a4827f8-ec1a-0a2a45030019-5a9b322284a8-3
 for <multiple-recipients>; Fri, 03 Jul 2026 23:22:01 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wflKX-0000000AsYQ-3NCh; Fri, 03 Jul 2026 21:21:50 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.2 #2 (Red
 Hat Linux)) id 1wflKX-00000001RQ7-2xkg;
 Fri, 03 Jul 2026 22:21:49 +0100
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=casper.20170209 header.d=infradead.org header.i="@infradead.org" header.h="Sender:Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description;
	bh=EpzXffKcCC8OCVBj38i2t8eVI2Er97bsxo1QNBYCK8E=; b=jIerjpGT+yTwXfADnzFS9Ehvw1
	qj5/hvk/X0LarGRgEVv+dsiKFbGxRWGknJH57gqRXscS5FUYAhSqnvtRBTN2Z6vn9teqs3fY7T27K
	jW8kTa1Wn2iOLEOqSbhIdiHt8Zmudzhq+tZg56Q8n6poP0Su9bZXGRUplcGieKFs0iNapavWjR6fc
	hzkoY/l9qx1zH8w8EdFXPjFM5inA9cmW6nJSdRy1/qSf00oSXhQLvq8P2NHcd9wzCsCydXn58F6FC
	AElEi2x7GlGagDUvtuQfZMQtQYs0miIjMnEqFVh2YzqPw/nArOHgfhgvtrehoSUcccIphTfkzHx4t
	XG8AdZ9w==;
From: David Woodhouse <dwmw2@infradead.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sean Christopherson <seanjc@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Paul Durrant <paul@xen.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Jack Allister <jalliste@amazon.com>,
	Dongli Zhang <dongli.zhang@oracle.com>,
	joe.jin@oracle.com,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v6 34/36] KVM: x86: Cache host vclock_mode for masterclock eligibility checks
Date: Fri,  3 Jul 2026 22:18:13 +0100
Message-ID: <20260703212145.343527-35-dwmw2@infradead.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703212145.343527-1-dwmw2@infradead.org>
References: <20260703212145.343527-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-33051d/1783113721-B4F835D1-4427BB93/0/0
X-purgate-type: clean
X-purgate-size: 4113

From: David Woodhouse <dwmw@amazon.co.uk>

The remaining users of pvclock_gtod_data only need to know whether
the host clocksource is TSC-based. Cache the vclock_mode value in a
simple kvm_host_vclock_mode variable, updated by the pvclock_gtod_notify
callback, and use gtod_is_based_on_tsc() for eligibility checks.

This is inherently racy (as it always was — kvm_track_tsc_matching
never held the gtod seqcount), relying on eventual consistency: the
notifier fires on every timekeeping update and will correct any
transient inconsistency within one tick.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Assisted-by: Kiro (claude-opus-4.6-1m)
---
 arch/x86/kvm/x86.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 8d520bfae089..c67655f8e078 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -2647,6 +2647,8 @@ static u64 compute_guest_tsc(struct kvm_vcpu *vcpu, s64 kernel_ns)
 }
 
 #ifdef CONFIG_X86_64
+static int kvm_host_vclock_mode;
+
 static inline bool gtod_is_based_on_tsc(int mode)
 {
 	return mode == VDSO_CLOCKMODE_TSC || mode == VDSO_CLOCKMODE_HVCLOCK;
@@ -2676,7 +2678,6 @@ static bool kvm_use_master_clock(struct kvm *kvm)
 static void kvm_track_tsc_matching(struct kvm_vcpu *vcpu, bool update_mclock)
 {
 	struct kvm_arch *ka = &vcpu->kvm->arch;
-	struct pvclock_gtod_data *gtod = &pvclock_gtod_data;
 	bool prev_matched_tsc = ka->all_vcpus_matched_tsc;
 
 	/*
@@ -2713,7 +2714,7 @@ static void kvm_track_tsc_matching(struct kvm_vcpu *vcpu, bool update_mclock)
 	 * accounts for its offset.
 	 */
 	bool use_master_clock = kvm_use_master_clock(vcpu->kvm) &&
-				gtod_is_based_on_tsc(gtod->clock.vclock_mode);
+				gtod_is_based_on_tsc(kvm_host_vclock_mode);
 
 	/*
 	 * Request a masterclock update if needed: toggling master clock,
@@ -2726,11 +2727,11 @@ static void kvm_track_tsc_matching(struct kvm_vcpu *vcpu, bool update_mclock)
 
 	trace_kvm_track_tsc(vcpu->vcpu_id, ka->nr_vcpus_matched_tsc,
 			    atomic_read(&vcpu->kvm->online_vcpus),
-		            ka->use_master_clock, gtod->clock.vclock_mode);
+		            ka->use_master_clock, kvm_host_vclock_mode);
 }
 #else
 static inline void kvm_track_tsc_matching(struct kvm_vcpu *vcpu,
-					  bool new_generation) {}
+					  bool update_mclock) {}
 #endif
 
 /*
@@ -2850,7 +2851,7 @@ static inline bool kvm_check_tsc_unstable(void)
 	 * TSC is marked unstable when we're running on Hyper-V,
 	 * 'TSC page' clocksource is good.
 	 */
-	if (pvclock_gtod_data.clock.vclock_mode == VDSO_CLOCKMODE_HVCLOCK)
+	if (kvm_host_vclock_mode == VDSO_CLOCKMODE_HVCLOCK)
 		return false;
 #endif
 	return check_tsc_unstable();
@@ -3274,7 +3275,6 @@ static void pvclock_update_vm_gtod_copy(struct kvm *kvm)
 {
 #ifdef CONFIG_X86_64
 	struct kvm_arch *ka = &kvm->arch;
-	int vclock_mode;
 	bool host_tsc_clocksource;
 
 	lockdep_assert_held(&kvm->arch.tsc_write_lock);
@@ -3314,9 +3314,9 @@ static void pvclock_update_vm_gtod_copy(struct kvm *kvm)
 			ka->use_master_clock = false;
 	}
 
-	vclock_mode = pvclock_gtod_data.clock.vclock_mode;
-	trace_kvm_update_master_clock(ka->use_master_clock, vclock_mode,
-					ka->all_vcpus_matched_freq);
+	trace_kvm_update_master_clock(ka->use_master_clock,
+				     kvm_host_vclock_mode,
+				     ka->all_vcpus_matched_freq);
 #endif
 }
 
@@ -10399,12 +10399,15 @@ static int pvclock_gtod_notify(struct notifier_block *nb, unsigned long unused,
 	update_pvclock_gtod(tk);
 
 #ifdef CONFIG_X86_64
+	kvm_host_vclock_mode =
+		tk->tkr_mono.clock->vdso_clock_mode;
+
 	/*
 	 * Disable master clock if host does not trust, or does not use,
 	 * TSC based clocksource. Delegate queue_work() to irq_work as
 	 * this is invoked with tk_core.seq write held.
 	 */
-	if (!gtod_is_based_on_tsc(pvclock_gtod_data.clock.vclock_mode) &&
+	if (!gtod_is_based_on_tsc(kvm_host_vclock_mode) &&
 	    atomic_read(&kvm_guest_has_master_clock) != 0)
 		irq_work_queue(&pvclock_irq_work);
 #endif
-- 
2.54.0


