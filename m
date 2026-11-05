Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65AF606F975
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 15:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=XT7M0GGX
Received: from list by lists.xenproject.org with outflank-mailman.1475002.1681885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzj4-0004Nx-On; Thu, 05 Nov 2026 15:50:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1475002.1681885; Thu, 05 Nov 2026 15:50:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzj4-0004Ks-IF; Thu, 05 Nov 2026 15:50:06 +0000
Received: by outflank-mailman (input) for mailman id 1475002;
 Thu, 05 Nov 2026 15:50:04 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+a10630623031064a0c86+8474+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1xOzj2-0003kM-GD
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 15:50:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOzj1-00GUz4-SG; Thu, 05 Nov 2026 16:50:03 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+a10630623031064a0c86+8474+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6aeca5a0-8faa-0a2a0a5109dd-0a2a4508cd68-22
 for <multiple-recipients>; Thu, 05 Nov 2026 16:50:03 +0100
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+a10630623031064a0c86+8474+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6aeca5a6-f659-0a2a45080019-5a9b3222a2e0-3
 for <multiple-recipients>; Thu, 05 Nov 2026 16:49:58 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xOziu-00000009aom-0Bg6; Thu, 05 Nov 2026 15:49:56 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xOzit-0000000AazE-3RpG;
 Thu, 05 Nov 2026 15:49:55 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=casper.20170209 header.d=infradead.org header.i="@infradead.org" header.h="Sender:Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=LO8qpf/zyYF+KNtOzcQ25RJ1JLpxTyJ3m93RmYz7zZU=; b=XT7M0GGX2fVH2MB+JSMkxarzg7
	DKgvl5uClCYMLng9USON+1pZhCxVy6Uu8Au0b+wwlC5cQSb3i4+fW+7VAr/LCRBAYjYIa4PD4Q2C1
	hh01bgMXyQ57XoFl9FfKrqGlncF82+zya0U7L3l+gma6s8022NHcZXP3JUJg80tpu9gyj0G5Ywjbg
	Fe2e8pg4NiPVeOq8GLwtPSrinn/C+SQQaj71oemDrCiCQESLqI+qSoetQkFz2QnoXTtZd0F7STyfQ
	0fbSwIzFF6/CuN35IwXPOSHm96vRdkBh+0+9GpDIQu32xVatgmf7kdRrfgvPpkgIdIxW0vazEv4zl
	rBx6C4hA==;
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
Subject: [PATCH v11 08/23] KVM: x86: Re-synchronize TSC after KVM_SET_TSC_KHZ
Date: Thu,  5 Nov 2026 07:49:39 -0800
Message-ID: <20261105154955.2525419-9-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105154955.2525419-1-dwmw2@infradead.org>
References: <20261105154955.2525419-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-c1860d/1793893803-D715E87B-EA25E761/0/0
X-purgate-type: clean
X-purgate-size: 6805
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

KVM_SET_TSC_KHZ changes the vCPU's TSC scaling ratio but does not
update the VM-wide cur_tsc_scaling_ratio used by get_kvmclock().
This causes get_kvmclock() to use a stale (default 1:1) ratio when
computing the KVM clock, leading to drift between the host-side
kvmclock and what the guest observes.

Fix this by calling kvm_synchronize_tsc() after changing the TSC
frequency. This:
 - Updates cur_tsc_scaling_ratio (consumed by pvclock_update_vm_gtod_copy)
 - Ensures the TSC value is continuous across the frequency change
 - Triggers kvm_track_tsc_matching() for proper masterclock handling
 - Establishes the new TSC generation for subsequent vCPUs to match

Since kvm_synchronize_tsc() previously inferred "userspace wrote the
TSC" from being given a non-NULL value, and this new call is a purely
kernel-internal resynchronization (including from vCPU creation via
the default frequency), make that an explicit 'user_initiated'
parameter instead. Otherwise the kernel's own call would set
kvm->arch.user_set_tsc and incorrectly enable the 1-second slop
heuristic before userspace has ever written a TSC value, breaking
the restore of a guest with less than one second of runtime.

Only preserve the TSC value across the change for a vCPU which has
actually run. For one which has not, synchronize as for a zero write
instead, joining the current generation. At vCPU creation (which comes
through here with the default frequency) the value read happens to be
zero anyway, because the scaling ratio has not yet been initialized;
make that explicit rather than an accident. For an explicit
KVM_SET_TSC_KHZ on a never-run vCPU, the nonzero value could never
match — userspace has not written a TSC, so the matching window is not
armed — and each such call would open a new TSC generation, orphaning
the matched state of the sibling vCPUs and denying
PVCLOCK_TSC_STABLE_BIT to a multi-vCPU guest whose VMM never writes
the TSCs explicitly. If userspace has already written a TSC, preserve
the value even for a never-run vCPU — a zero write would discard it —
and let the user-write matching window do its usual job.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/msrs.c |  2 +-
 arch/x86/kvm/x86.c  | 38 +++++++++++++++++++++++++++++++++-----
 arch/x86/kvm/x86.h  |  2 +-
 3 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/msrs.c b/arch/x86/kvm/msrs.c
index 26eb30f10c43..d07831b5dfb8 100644
--- a/arch/x86/kvm/msrs.c
+++ b/arch/x86/kvm/msrs.c
@@ -1645,7 +1645,7 @@ int kvm_set_msr_common(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 		break;
 	case MSR_IA32_TSC:
 		if (msr_info->host_initiated) {
-			kvm_synchronize_tsc(vcpu, &data);
+			kvm_synchronize_tsc(vcpu, &data, true);
 		} else if (!vcpu->arch.guest_tsc_protected) {
 			u64 adj = kvm_compute_l1_tsc_offset(vcpu, rdtsc(), data) -
 				  vcpu->arch.l1_tsc_offset;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 77bd3e4bfdcd..f551056d7274 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -1064,6 +1064,7 @@ static int kvm_set_tsc_khz(struct kvm_vcpu *vcpu, u32 user_tsc_khz)
 {
 	u32 thresh_lo, thresh_hi;
 	int use_scaling = 0;
+	u64 tsc;
 
 	/* tsc_khz can be zero if TSC calibration fails */
 	if (user_tsc_khz == 0) {
@@ -1091,7 +1092,34 @@ static int kvm_set_tsc_khz(struct kvm_vcpu *vcpu, u32 user_tsc_khz)
 			 user_tsc_khz, thresh_lo, thresh_hi);
 		use_scaling = 1;
 	}
-	return set_tsc_khz(vcpu, user_tsc_khz, use_scaling);
+	/*
+	 * Read the guest TSC before changing the ratio, so we can
+	 * re-synchronize to preserve continuity across the change.
+	 */
+	tsc = kvm_read_l1_tsc(vcpu, rdtsc());
+
+	if (set_tsc_khz(vcpu, user_tsc_khz, use_scaling))
+		return -1;
+
+	/*
+	 * Preserving continuity only makes sense for a vCPU which has
+	 * actually run; for one which has not, synchronize as for a zero
+	 * write, joining the current generation. This makes vCPU creation
+	 * (which comes through here with the default frequency) join the
+	 * generation *explicitly*, rather than by the accident that the
+	 * scaling ratio is still zero at this point so the TSC read above
+	 * is zero anyway — and it stops an explicit KVM_SET_TSC_KHZ on a
+	 * never-run vCPU, whose nonzero TSC value could never match, from
+	 * opening a new generation and orphaning the matched state of its
+	 * siblings. If userspace has already written a TSC, preserve the
+	 * value even for a never-run vCPU — a zero write would discard it —
+	 * and let the user-write matching window do its usual job.
+	 */
+	if (vcpu->arch.last_vmentry_cpu != -1 || vcpu->kvm->arch.user_set_tsc)
+		kvm_synchronize_tsc(vcpu, &tsc, false);
+	else
+		kvm_synchronize_tsc(vcpu, NULL, false);
+	return 0;
 }
 
 static u64 compute_guest_tsc(struct kvm_vcpu *vcpu, s64 kernel_ns)
@@ -1453,9 +1481,9 @@ static void __kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 offset, u64 tsc,
 	kvm_track_tsc_matching(vcpu, !matched);
 }
 
-void kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 *user_value)
+void kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 *value, bool user_initiated)
 {
-	u64 data = user_value ? *user_value : 0;
+	u64 data = value ? *value : 0;
 	struct kvm *kvm = vcpu->kvm;
 	u64 offset, host_tsc, elapsed;
 	s64 ns;
@@ -1531,7 +1559,7 @@ void kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 *user_value)
 		matched = true;
 	}
 
-	__kvm_synchronize_tsc(vcpu, offset, data, ns, matched, !!user_value);
+	__kvm_synchronize_tsc(vcpu, offset, data, ns, matched, user_initiated);
 	raw_spin_unlock_irqrestore(&kvm->arch.tsc_write_lock, flags);
 }
 
@@ -9665,7 +9693,7 @@ void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
 	if (mutex_lock_killable(&vcpu->mutex))
 		return;
 	vcpu_load(vcpu);
-	kvm_synchronize_tsc(vcpu, NULL);
+	kvm_synchronize_tsc(vcpu, NULL, false);
 	if (kvm_check_request(KVM_REQ_MASTERCLOCK_UPDATE, vcpu))
 		kvm_update_masterclock(vcpu->kvm, NULL);
 	vcpu_put(vcpu);
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index 436e2fb1396c..de4c86ea5a7d 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -330,7 +330,7 @@ uint64_t kvm_get_wall_clock_epoch(struct kvm *kvm);
 bool kvm_get_monotonic_and_clockread(s64 *kernel_ns, u64 *tsc_timestamp);
 int kvm_guest_time_update(struct kvm_vcpu *v);
 
-void kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 *user_value);
+void kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 *value, bool user_initiated);
 u64 kvm_scale_tsc(u64 tsc, u64 ratio);
 u64 kvm_read_l1_tsc(struct kvm_vcpu *vcpu, u64 host_tsc);
 u64 kvm_calc_nested_tsc_offset(u64 l1_offset, u64 l2_offset, u64 l2_multiplier);
-- 
2.43.0


