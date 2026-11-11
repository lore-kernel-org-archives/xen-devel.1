Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A323E606A8B0
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 18:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=GgFWIqP5
Received: from list by lists.xenproject.org with outflank-mailman.1484483.1687845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRClL-0000UR-L9; Wed, 11 Nov 2026 18:09:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484483.1687845; Wed, 11 Nov 2026 18:09:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRClL-0000RD-AL; Wed, 11 Nov 2026 18:09:35 +0000
Received: by outflank-mailman (input) for mailman id 1484483;
 Wed, 11 Nov 2026 18:09:31 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+abad5507353db368323c+8480+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1xRClH-00089N-GN
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 18:09:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRClG-00Gwen-TT; Wed, 11 Nov 2026 19:09:30 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+abad5507353db368323c+8480+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6af4af52-8faa-0a2a0a5109dd-0a2a450ceabc-10
 for <multiple-recipients>; Wed, 11 Nov 2026 19:09:30 +0100
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+abad5507353db368323c+8480+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6af4af55-f479-0a2a450c0019-5a9b3222a57a-3
 for <multiple-recipients>; Wed, 11 Nov 2026 19:09:25 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xRCl9-0000000CKvR-02kT; Wed, 11 Nov 2026 18:09:23 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xRCl8-0000000HWs7-3MR0;
 Wed, 11 Nov 2026 18:09:22 +0000
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
	bh=+A9Stxes180y3/UPopEooT4olRi063r0UwlDJ4vvUVk=; b=GgFWIqP5y2Xd7bbAKad9gvlMax
	OiUQJlTyRN4/Y0kgMAT93W4qPtA2rhqhIpyxW2s6SyUStbCOAXHAH37ORXrMVR1nZVn3+2qEyii7/
	uTV/D2RIjNQzRfJPRaBO61kBow0ZOIRT8fGPD/X0KUgRgX5ZKGDM4QBJzzS/wgaQcD8OaLVjO/Gr3
	VyHdzrlA18IFj0Hpg8QfxY1IGeLReh7R/hMhgWGzlXyjhmzDKZUGd8NnHM2+eMJ33GFeiQLipaeY4
	i+hNibznKGldnTKRnXKDws6G3OaLpO2vOoeBw+dfzMghZ41OBHYeZ1K4ouTlxH92z9qwpM7viZcKp
	gZIKwDqA==;
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
Subject: [PATCH v13 02/26] KVM: x86: Kill last_tsc_{nsec,write,offset} fields
Date: Wed, 11 Nov 2026 10:08:58 -0800
Message-ID: <20261111180922.4177927-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261111180922.4177927-1-dwmw2@infradead.org>
References: <20261111180922.4177927-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-d25034/1794420570-77AD4A5B-B2189DDB/0/0
X-purgate-type: clean
X-purgate-size: 13534
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

These mostly duplicate the cur_tsc_{nsec,write,offset} values. On the
stable-TSC matching paths the offsets used were identical; the stored
{nsec, write} anchor could differ, because a matched
kvm_arch_tsc_set_attr() recorded a freshly measured point, quietly
re-anchoring the 1-second matching window onto the guest's actual TSC
line. Matching now measures from the generation's origin alone. A
guest frequency within tsc_tolerance_ppm of the host's can therefore
drift out of the window after about an hour of generation age; such a
write opens a new generation and still installs the exact value — a
PVCLOCK_TSC_STABLE_BIT drop, healed as the siblings' own writes
rejoin, never an inaccuracy. On the unstable-TSC paths the two values
could genuinely diverge, so kvm_arch_tsc_set_attr() now matches
against the generation's reference offset — the more principled
comparison anyway, and with an unstable TSC the match only affects
generation accounting.

Rename last_tsc_khz and last_tsc_scaling_ratio to cur_tsc_khz and
cur_tsc_scaling_ratio, since they are properties of the current
generation.

With cur_tsc_offset the single source of truth for the generation's
offset, the backwards-TSC compensation on S4 resume must adjust it by
the same (guest-scaled) delta it applies to every vCPU; later
synchronizations would otherwise match against a stale pre-S4 offset.
And since a synchronization installs an absolute offset which already
includes that delta, it clears the vCPU's pending
tsc_offset_adjustment — applying the deferred compensation on top at
the next vcpu_load would double it. Previously a nonzero write could
not hit this: zeroing the last_tsc values broke the matching window
after a backwards TSC.

Three races around that compensation are handled. The consume in
kvm_arch_vcpu_load() now runs under tsc_write_lock, as an unlocked
read-then-zero racing the hotplug-time fold could discard a delta the
generation keeps. kvm_arch_tsc_set_attr() folds a pending adjustment
into the user-supplied offset under the lock, since userspace computed
it against the pre-jump TSC line. And the lockless vm_list walk in
kvm_arch_enable_virtualization_cpu() remains as it was: unsound
against a concurrent kvm_destroy_vm(), but pre-existing, and not
fixable with kvm_lock without recreating the inversion against
cpus_read_lock() that commit 44d174596260 ("KVM: Use dedicated mutex
to protect kvm_usage_count to avoid deadlock") untangled.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 Documentation/virt/kvm/locking.rst |   3 +-
 arch/x86/include/asm/kvm_host.h    |   7 +-
 arch/x86/kvm/x86.c                 | 132 ++++++++++++++++++++++-------
 3 files changed, 105 insertions(+), 37 deletions(-)

diff --git a/Documentation/virt/kvm/locking.rst b/Documentation/virt/kvm/locking.rst
index 662231e958a0..b3621eb3c1cd 100644
--- a/Documentation/virt/kvm/locking.rst
+++ b/Documentation/virt/kvm/locking.rst
@@ -263,7 +263,8 @@ time it will be set using the Dirty tracking mechanism described above.
 
 :Type:		raw_spinlock_t
 :Arch:		x86
-:Protects:	- kvm_arch::{last_tsc_write,last_tsc_nsec,last_tsc_offset}
+:Protects:	- kvm_arch::{cur_tsc_write,cur_tsc_nsec,cur_tsc_offset,cur_tsc_khz,cur_tsc_scaling_ratio}
+		- kvm_vcpu_arch::tsc_offset_adjustment
 		- tsc offset in vmcb
 :Comment:	'raw' because updating the tsc offsets must not be preempted.
 
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index e2eef7057bd3..ea48b1949316 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1236,11 +1236,8 @@ struct kvm_arch {
 	 * preemption-disabled region, so it must be a raw spinlock.
 	 */
 	raw_spinlock_t tsc_write_lock;
-	u64 last_tsc_nsec;
-	u64 last_tsc_write;
-	u32 last_tsc_khz;
-	u64 last_tsc_offset;
-	u64 last_tsc_scaling_ratio;
+	u32 cur_tsc_khz;
+	u64 cur_tsc_scaling_ratio;
 	u64 cur_tsc_nsec;
 	u64 cur_tsc_write;
 	u64 cur_tsc_offset;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 7a2b0b99373f..12f465040efc 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -1334,17 +1334,24 @@ static void __kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 offset, u64 tsc,
 		vcpu->kvm->arch.user_set_tsc = true;
 
 	/*
-	 * We also track th most recent recorded KHZ, write and time to
-	 * allow the matching interval to be extended at each write.
+	 * Track the TSC frequency, scaling ratio, and offset for the current
+	 * generation. These are used to detect matching TSC writes and to
+	 * compute the guest TSC from the host clock.
 	 */
-	kvm->arch.last_tsc_nsec = ns;
-	kvm->arch.last_tsc_write = tsc;
-	kvm->arch.last_tsc_khz = vcpu->arch.virtual_tsc_khz;
-	kvm->arch.last_tsc_offset = offset;
-	kvm->arch.last_tsc_scaling_ratio = vcpu->arch.l1_tsc_scaling_ratio;
+	kvm->arch.cur_tsc_khz = vcpu->arch.virtual_tsc_khz;
+	kvm->arch.cur_tsc_scaling_ratio = vcpu->arch.l1_tsc_scaling_ratio;
 
 	vcpu->arch.last_guest_tsc = tsc;
 
+	/*
+	 * The offset written below is absolute, superseding any backwards-TSC
+	 * compensation still pending from kvm_arch_enable_virtualization_cpu()
+	 * (which has already been folded into cur_tsc_offset, and thus into
+	 * a matched @offset); applying it again at the next vcpu_load would
+	 * double it.
+	 */
+	vcpu->arch.tsc_offset_adjustment = 0;
+
 	kvm_vcpu_write_tsc_offset(vcpu, offset);
 
 	if (!matched) {
@@ -1354,8 +1361,6 @@ static void __kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 offset, u64 tsc,
 		 * nanosecond time, offset, and write, so if TSCs are in
 		 * sync, we can match exact offset, and if not, we can match
 		 * exact software computation in compute_guest_tsc()
-		 *
-		 * These values are tracked in kvm->arch.cur_xxx variables.
 		 */
 		kvm->arch.cur_tsc_generation++;
 		kvm->arch.cur_tsc_nsec = ns;
@@ -1395,7 +1400,7 @@ void kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 *user_value)
 	}
 
 	offset = kvm_compute_l1_tsc_offset(vcpu, host_tsc, data);
-	elapsed = ns - kvm->arch.last_tsc_nsec;
+	elapsed = ns - kvm->arch.cur_tsc_nsec;
 
 	if (vcpu->arch.virtual_tsc_khz) {
 		if (data == 0) {
@@ -1405,7 +1410,7 @@ void kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 *user_value)
 			 */
 			synchronizing = true;
 		} else if (kvm->arch.user_set_tsc) {
-			u64 tsc_exp = kvm->arch.last_tsc_write +
+			u64 tsc_exp = kvm->arch.cur_tsc_write +
 						nsec_to_cycles(vcpu, elapsed);
 			u64 tsc_hz = vcpu->arch.virtual_tsc_khz * 1000LL;
 			/*
@@ -1436,15 +1441,14 @@ void kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 *user_value)
 	 * it's better to try to match offsets from the beginning.
          */
 	if (synchronizing &&
-	    vcpu->arch.virtual_tsc_khz == kvm->arch.last_tsc_khz) {
+	    vcpu->arch.virtual_tsc_khz == kvm->arch.cur_tsc_khz) {
 		/*
-		 * If synchronizing, advance the reference point to "now"
-		 * so the matching window slides forward with each vCPU.
-		 * Extrapolate from the generation's own origin: 'elapsed'
-		 * is measured from the most recent write, which lies on
-		 * the generation's line only for the first matched write.
+		 * If synchronizing, extrapolate the generation's value to
+		 * "now": the matching window slides forward with wall time,
+		 * anchored on the generation's origin alone (a matched
+		 * write no longer updates any stored reference point).
 		 */
-		u64 delta = nsec_to_cycles(vcpu, ns - kvm->arch.cur_tsc_nsec);
+		u64 delta = nsec_to_cycles(vcpu, elapsed);
 
 		data = kvm->arch.cur_tsc_write + delta;
 
@@ -1615,7 +1619,7 @@ static void pvclock_update_vm_gtod_copy(struct kvm *kvm)
 		 * get_kvmclock() to compute kvmclock from the host TSC
 		 * without needing a vCPU reference.
 		 */
-		ka->master_tsc_scaling_ratio = ka->last_tsc_scaling_ratio;
+		ka->master_tsc_scaling_ratio = ka->cur_tsc_scaling_ratio;
 		tsc_hz = (u64)get_cpu_tsc_khz() * HZ_PER_KHZ;
 		if (tsc_hz && kvm_caps.has_tsc_control)
 			tsc_hz = kvm_scale_tsc(tsc_hz,
@@ -2603,8 +2607,24 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 
 	/* Apply any externally detected TSC adjustments (due to suspend) */
 	if (unlikely(vcpu->arch.tsc_offset_adjustment)) {
-		adjust_tsc_offset_host(vcpu, vcpu->arch.tsc_offset_adjustment);
+		unsigned long flags;
+		u64 adj;
+
+		/*
+		 * Consume under tsc_write_lock: the writer in
+		 * kvm_arch_enable_virtualization_cpu() folds the same delta
+		 * into the generation's cur_tsc_offset under the lock, and
+		 * an unlocked read-then-zero here could discard a delta the
+		 * generation keeps, leaving this vCPU's offset diverged
+		 * from a generation it is still counted as matching.
+		 */
+		raw_spin_lock_irqsave(&vcpu->kvm->arch.tsc_write_lock, flags);
+		adj = vcpu->arch.tsc_offset_adjustment;
 		vcpu->arch.tsc_offset_adjustment = 0;
+		raw_spin_unlock_irqrestore(&vcpu->kvm->arch.tsc_write_lock,
+					   flags);
+
+		adjust_tsc_offset_host(vcpu, adj);
 		kvm_make_request(KVM_REQ_CLOCK_UPDATE, vcpu);
 	}
 
@@ -3343,9 +3363,25 @@ static int kvm_arch_tsc_set_attr(struct kvm_vcpu *vcpu,
 
 		raw_spin_lock_irqsave(&kvm->arch.tsc_write_lock, flags);
 
+		/*
+		 * A backwards-TSC compensation which landed after this
+		 * ioctl's vcpu_load() consumed the pending adjustment was
+		 * folded into cur_tsc_offset but not yet into this vCPU —
+		 * and @offset was computed by userspace against the
+		 * pre-jump TSC line. Fold it into @offset here (scaled as
+		 * adjust_tsc_offset_host() would), both so the matched
+		 * comparison below compares like with like and because
+		 * __kvm_synchronize_tsc() will clear the pending
+		 * adjustment as superseded by the absolute offset it
+		 * installs.
+		 */
+		if (unlikely(vcpu->arch.tsc_offset_adjustment))
+			offset += kvm_scale_tsc(vcpu->arch.tsc_offset_adjustment,
+						vcpu->arch.l1_tsc_scaling_ratio);
+
 		matched = (vcpu->arch.virtual_tsc_khz &&
-			   kvm->arch.last_tsc_khz == vcpu->arch.virtual_tsc_khz &&
-			   kvm->arch.last_tsc_offset == offset);
+			   kvm->arch.cur_tsc_khz == vcpu->arch.virtual_tsc_khz &&
+			   kvm->arch.cur_tsc_offset == offset);
 
 		tsc = kvm_scale_tsc(rdtsc(), vcpu->arch.l1_tsc_scaling_ratio) + offset;
 		ns = get_kvmclock_base_ns();
@@ -9803,7 +9839,7 @@ int kvm_arch_enable_virtualization_cpu(void)
 {
 	struct kvm *kvm;
 	struct kvm_vcpu *vcpu;
-	unsigned long i;
+	unsigned long i, flags;
 	int ret;
 	u64 local_tsc;
 	u64 max_tsc = 0;
@@ -9874,6 +9910,44 @@ int kvm_arch_enable_virtualization_cpu(void)
 	if (backwards_tsc) {
 		u64 delta_cyc = max_tsc - local_tsc;
 		list_for_each_entry(kvm, &vm_list, vm_list) {
+			/*
+			 * Hold tsc_write_lock across the per-vCPU adjustments
+			 * AND the generation reference offset adjustment, so
+			 * that a concurrent TSC synchronization cannot observe
+			 * one without the other (it would compute an offset
+			 * with the delta applied twice, or not at all).
+			 * kvm_arch_vcpu_load() consumes tsc_offset_adjustment
+			 * under the same lock, so it cannot discard a delta
+			 * which has been folded into the generation
+			 * reference.
+			 *
+			 * The generation's reference offset is adjusted by the
+			 * same (guest-scaled, as adjust_tsc_offset_host()
+			 * does for each vCPU) delta, so that future
+			 * KVM_SET_TSC / vCPU creation still matches against
+			 * the adjusted TSC timeline.
+			 *
+			 * The recorded {cur_tsc_nsec, cur_tsc_write} pair is
+			 * left alone, and ends up stale by the sleep period:
+			 * cur_tsc_nsec is CLOCK_BOOTTIME, which has the sleep
+			 * injected on resume, while the guest TSC (kept
+			 * continuous across the host TSC jump) does not
+			 * advance during the sleep. It cannot be re-anchored
+			 * here because, as noted above, timekeeping has not
+			 * yet been resumed. The 1-second matching window
+			 * therefore fails to match across a longer sleep,
+			 * and the next nonzero TSC write opens a fresh,
+			 * coherent generation. A forced synchronization
+			 * (vCPU creation, or a zero write) bypasses the
+			 * window and does extrapolate along the stale line,
+			 * overshooting by the sleep period — but it installs
+			 * the compensated offset, so the vCPU's actual TSC
+			 * is correct; only last_guest_tsc overshoots, which
+			 * matters only if the TSC turns unstable before the
+			 * vCPU first enters the guest, exactly as it did
+			 * before this accounting existed.
+			 */
+			raw_spin_lock_irqsave(&kvm->arch.tsc_write_lock, flags);
 			kvm->arch.backwards_tsc_observed = true;
 			kvm_for_each_vcpu(i, vcpu, kvm) {
 				vcpu->arch.tsc_offset_adjustment += delta_cyc;
@@ -9881,14 +9955,10 @@ int kvm_arch_enable_virtualization_cpu(void)
 				kvm_make_request(KVM_REQ_MASTERCLOCK_UPDATE, vcpu);
 			}
 
-			/*
-			 * We have to disable TSC offset matching.. if you were
-			 * booting a VM while issuing an S4 host suspend....
-			 * you may have some problem.  Solving this issue is
-			 * left as an exercise to the reader.
-			 */
-			kvm->arch.last_tsc_nsec = 0;
-			kvm->arch.last_tsc_write = 0;
+			kvm->arch.cur_tsc_offset +=
+				kvm_scale_tsc(delta_cyc,
+					      kvm->arch.cur_tsc_scaling_ratio);
+			raw_spin_unlock_irqrestore(&kvm->arch.tsc_write_lock, flags);
 		}
 
 	}
-- 
2.43.0


