Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DAA60720CA
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 15:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=BtNOOdFE
Received: from list by lists.xenproject.org with outflank-mailman.1475010.1681942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzjC-0005tS-HJ; Thu, 05 Nov 2026 15:50:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1475010.1681942; Thu, 05 Nov 2026 15:50:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzjB-0005pl-E2; Thu, 05 Nov 2026 15:50:13 +0000
Received: by outflank-mailman (input) for mailman id 1475010;
 Thu, 05 Nov 2026 15:50:07 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+4c1d8b341febb4002902+8474+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1xOzj4-0004O8-Qy
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 15:50:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOzj4-000oQ8-7K; Thu, 05 Nov 2026 16:50:06 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+4c1d8b341febb4002902+8474+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6aeca59e-bab6-0a2a0a5309dd-0a2a45079914-34
 for <multiple-recipients>; Thu, 05 Nov 2026 16:50:06 +0100
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+4c1d8b341febb4002902+8474+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6aeca5a8-b4ea-0a2a45070019-5a9b5cc7ae00-3
 for <multiple-recipients>; Thu, 05 Nov 2026 16:50:00 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xOziw-00000003Bnw-28EW; Thu, 05 Nov 2026 15:49:58 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xOzit-0000000Aayp-28rZ;
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
	bh=jcUOz2MyJ2ssYA+GXoGpQlnR6nBQaKCDGjGWzKE1pAw=; b=BtNOOdFEiNQnqWX9OahKDXYhD9
	ELmKzIDV3YZaaEHN67LeNXckfEbS+9KX0/9hY37cUNf5SDll1Jevu3IYS00CgHkqLmTxkKPH0G256
	ZGlB5TqcXj0mT5+zUGq5Lc+os4ZF4sKMlhOEF4svemuufssn2urYexd52KD3WjqFLa4epSXt/oipf
	AiXX5eS4UjMVOWGNoPTKibzFBysuwXJ0HJh2NgCsH/TUDzLRx/oSWed9qPwcUtorkuo3PErSnE5kR
	S/xcFIFzycOhUmtcEboXlQV2dw2FJ+mloFWheMN2TwtXBSLhFNyHQKBOBepS1886unDegISjCluO4
	E4nYuXcw==;
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
Subject: [PATCH v11 02/23] KVM: x86: Kill last_tsc_{nsec,write,offset} fields
Date: Thu,  5 Nov 2026 07:49:33 -0800
Message-ID: <20261105154955.2525419-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105154955.2525419-1-dwmw2@infradead.org>
References: <20261105154955.2525419-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-ef75cf/1793893806-A64DBAE4-9987A4A9/0/0
X-purgate-type: clean
X-purgate-size: 9201
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

These pointlessly duplicate the cur_tsc_{nsec,write,offset} values.
The only place they were used was where the TSC is stable and a new
vCPU is being synchronized to the previous setting, in which case the
cur_tsc_* value is definitely identical.

Rename last_tsc_khz and last_tsc_scaling_ratio to cur_tsc_khz and
cur_tsc_scaling_ratio respectively, since they are properties of the
current TSC generation.

Since cur_tsc_offset now serves as the single source of truth for the
TSC generation's offset, the backwards-TSC adjustment (used during S4
resume when the host TSC resets) must also update cur_tsc_offset by
the same delta applied to all vCPUs (scaled to the guest TSC rate, as
adjust_tsc_offset_host() does). Without this, subsequent vCPUs that
synchronize after the adjustment would get the stale pre-S4 offset.

Since a synchronization now establishes an absolute offset which (via
a matched reuse of cur_tsc_offset) already includes any backwards-TSC
delta, clear the vCPU's pending tsc_offset_adjustment when writing it:
the deferred per-vCPU compensation would otherwise be applied on top
at the next vcpu_load, doubling the delta. Previously this could not
happen, because zeroing the last_tsc values disabled offset matching
entirely after a backwards TSC.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 Documentation/virt/kvm/locking.rst |  2 +-
 arch/x86/include/asm/kvm_host.h    |  7 +--
 arch/x86/kvm/x86.c                 | 72 ++++++++++++++++++------------
 3 files changed, 47 insertions(+), 34 deletions(-)

diff --git a/Documentation/virt/kvm/locking.rst b/Documentation/virt/kvm/locking.rst
index 662231e958a0..4548b61a7652 100644
--- a/Documentation/virt/kvm/locking.rst
+++ b/Documentation/virt/kvm/locking.rst
@@ -263,7 +263,7 @@ time it will be set using the Dirty tracking mechanism described above.
 
 :Type:		raw_spinlock_t
 :Arch:		x86
-:Protects:	- kvm_arch::{last_tsc_write,last_tsc_nsec,last_tsc_offset}
+:Protects:	- kvm_arch::{cur_tsc_write,cur_tsc_nsec,cur_tsc_offset}
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
index 7a2b0b99373f..90f9b07ef749 100644
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
@@ -1436,15 +1441,12 @@ void kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 *user_value)
 	 * it's better to try to match offsets from the beginning.
          */
 	if (synchronizing &&
-	    vcpu->arch.virtual_tsc_khz == kvm->arch.last_tsc_khz) {
+	    vcpu->arch.virtual_tsc_khz == kvm->arch.cur_tsc_khz) {
 		/*
 		 * If synchronizing, advance the reference point to "now"
 		 * so the matching window slides forward with each vCPU.
-		 * Extrapolate from the generation's own origin: 'elapsed'
-		 * is measured from the most recent write, which lies on
-		 * the generation's line only for the first matched write.
 		 */
-		u64 delta = nsec_to_cycles(vcpu, ns - kvm->arch.cur_tsc_nsec);
+		u64 delta = nsec_to_cycles(vcpu, elapsed);
 
 		data = kvm->arch.cur_tsc_write + delta;
 
@@ -1615,7 +1617,7 @@ static void pvclock_update_vm_gtod_copy(struct kvm *kvm)
 		 * get_kvmclock() to compute kvmclock from the host TSC
 		 * without needing a vCPU reference.
 		 */
-		ka->master_tsc_scaling_ratio = ka->last_tsc_scaling_ratio;
+		ka->master_tsc_scaling_ratio = ka->cur_tsc_scaling_ratio;
 		tsc_hz = (u64)get_cpu_tsc_khz() * HZ_PER_KHZ;
 		if (tsc_hz && kvm_caps.has_tsc_control)
 			tsc_hz = kvm_scale_tsc(tsc_hz,
@@ -3344,8 +3346,8 @@ static int kvm_arch_tsc_set_attr(struct kvm_vcpu *vcpu,
 		raw_spin_lock_irqsave(&kvm->arch.tsc_write_lock, flags);
 
 		matched = (vcpu->arch.virtual_tsc_khz &&
-			   kvm->arch.last_tsc_khz == vcpu->arch.virtual_tsc_khz &&
-			   kvm->arch.last_tsc_offset == offset);
+			   kvm->arch.cur_tsc_khz == vcpu->arch.virtual_tsc_khz &&
+			   kvm->arch.cur_tsc_offset == offset);
 
 		tsc = kvm_scale_tsc(rdtsc(), vcpu->arch.l1_tsc_scaling_ratio) + offset;
 		ns = get_kvmclock_base_ns();
@@ -9803,7 +9805,7 @@ int kvm_arch_enable_virtualization_cpu(void)
 {
 	struct kvm *kvm;
 	struct kvm_vcpu *vcpu;
-	unsigned long i;
+	unsigned long i, flags;
 	int ret;
 	u64 local_tsc;
 	u64 max_tsc = 0;
@@ -9874,6 +9876,24 @@ int kvm_arch_enable_virtualization_cpu(void)
 	if (backwards_tsc) {
 		u64 delta_cyc = max_tsc - local_tsc;
 		list_for_each_entry(kvm, &vm_list, vm_list) {
+			/*
+			 * Hold tsc_write_lock across the per-vCPU adjustments
+			 * AND the generation reference offset adjustment, so
+			 * that a concurrent TSC synchronization cannot observe
+			 * one without the other (it would compute an offset
+			 * with the delta applied twice, or not at all).
+			 *
+			 * The generation's reference offset is adjusted by the
+			 * same (guest-scaled, as adjust_tsc_offset_host()
+			 * does for each vCPU) delta, so that future
+			 * KVM_SET_TSC / vCPU creation still matches against
+			 * the adjusted TSC timeline. The recorded
+			 * {cur_tsc_nsec, cur_tsc_write} pair needs no
+			 * adjustment: the guest TSC is kept continuous
+			 * across the host TSC jump, and that pair lives in
+			 * the wall-clock/guest-cycle domain.
+			 */
+			raw_spin_lock_irqsave(&kvm->arch.tsc_write_lock, flags);
 			kvm->arch.backwards_tsc_observed = true;
 			kvm_for_each_vcpu(i, vcpu, kvm) {
 				vcpu->arch.tsc_offset_adjustment += delta_cyc;
@@ -9881,14 +9901,10 @@ int kvm_arch_enable_virtualization_cpu(void)
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


