Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DCC4C54F9B
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 14:50:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374503.1621727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woj8L-0006u7-Uv; Tue, 28 Jul 2026 14:50:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374503.1621727; Tue, 28 Jul 2026 14:50:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woj8L-0006sU-7U; Tue, 28 Jul 2026 14:50:17 +0000
Received: by outflank-mailman (input) for mailman id 1374503;
 Tue, 28 Jul 2026 14:50:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+a16dffe8eb885fac2cd9+8374+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1woj8G-0005Wv-Qj
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 14:50:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woj8G-00BbE3-6v; Tue, 28 Jul 2026 16:50:12 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+a16dffe8eb885fac2cd9+8374+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a68c19e-e002-0a2a0a5209dd-0a2a45078960-30
 for <multiple-recipients>; Tue, 28 Jul 2026 16:50:12 +0200
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+a16dffe8eb885fac2cd9+8374+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a68c1a3-b4ea-0a2a45070019-5a9b3222b228-3
 for <multiple-recipients>; Tue, 28 Jul 2026 16:50:12 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1woj80-0000000DUOl-0Qdr; Tue, 28 Jul 2026 14:49:56 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.4 #2 (Red
 Hat Linux)) id 1woj7z-00000001UYY-2iTL;
 Tue, 28 Jul 2026 15:49:55 +0100
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=casper.20170209 header.d=infradead.org header.i="@infradead.org" header.h="Sender:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description;
	bh=Np+lnW0zMX6EBxR3IucamlCTWncoQk51Zdx888ep58k=; b=HIcYbNLbdtrhYLnbpH4D3S/B9d
	/Nh9W8GKFPsYH0ifjli/yFfTVTGWTlJPqyeVt5Ggj7nv3mIcmcLG++/RJgj48DgBZ3G8boQut0o1E
	A9JhvQw2yFklnq9c3Xz8wBwVIRswkG5RhWwcmIJ7dyNrN+2EtaKtc+JpbgYLQmqS5rRBQkEwJX460
	aCJMYiaAZfyIeU9Wk9ijuvMzIjmIi9mciQWxqGeHQevRSwRFRz1zHtW0ubq7OI3lUduofXHHBZNj/
	5CBS4wwEomK0lRwUoz7HX5AWkU6XIcYqsbm5CNJQu6RafZlsN/YiV8xeBIKjj18dTZap2lAUgqK20
	0gx371ew==;
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
Subject: [PATCH v7 15/36] KVM: x86: Kill last_tsc_{nsec,write,offset} fields
Date: Tue, 28 Jul 2026 15:39:55 +0100
Message-ID: <20260728144954.355376-16-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728144954.355376-1-dwmw2@infradead.org>
References: <20260728144954.355376-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-ef75cf/1785250212-A7CD7AE4-10743BBC/0/0
X-purgate-type: clean
X-purgate-size: 6375

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
resume when the host TSC resets) must also update cur_tsc_offset by the
same delta applied to all vCPUs. Without this, subsequent vCPUs that
synchronize after the adjustment would get the stale pre-S4 offset.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 arch/x86/include/asm/kvm_host.h |  7 ++---
 arch/x86/kvm/x86.c              | 45 +++++++++++++++++----------------
 2 files changed, 25 insertions(+), 27 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index c3b97ca24a8c..2f01f3f9ba97 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1232,11 +1232,8 @@ struct kvm_arch {
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
index 812657f7c984..dceb6d3660a2 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -1274,14 +1274,12 @@ static void __kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 offset, u64 tsc,
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
 
@@ -1294,8 +1292,6 @@ static void __kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 offset, u64 tsc,
 		 * nanosecond time, offset, and write, so if TSCs are in
 		 * sync, we can match exact offset, and if not, we can match
 		 * exact software computation in compute_guest_tsc()
-		 *
-		 * These values are tracked in kvm->arch.cur_xxx variables.
 		 */
 		kvm->arch.cur_tsc_generation++;
 		kvm->arch.cur_tsc_nsec = ns;
@@ -1335,7 +1331,7 @@ void kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 *user_value)
 	}
 
 	offset = kvm_compute_l1_tsc_offset(vcpu, host_tsc, data);
-	elapsed = ns - kvm->arch.last_tsc_nsec;
+	elapsed = ns - kvm->arch.cur_tsc_nsec;
 
 	if (vcpu->arch.virtual_tsc_khz) {
 		if (data == 0) {
@@ -1345,7 +1341,7 @@ void kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 *user_value)
 			 */
 			synchronizing = true;
 		} else if (kvm->arch.user_set_tsc) {
-			u64 tsc_exp = kvm->arch.last_tsc_write +
+			u64 tsc_exp = kvm->arch.cur_tsc_write +
 						nsec_to_cycles(vcpu, elapsed);
 			u64 tsc_hz = vcpu->arch.virtual_tsc_khz * 1000LL;
 			/*
@@ -1376,7 +1372,7 @@ void kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 *user_value)
 	 * it's better to try to match offsets from the beginning.
          */
 	if (synchronizing &&
-	    vcpu->arch.virtual_tsc_khz == kvm->arch.last_tsc_khz) {
+	    vcpu->arch.virtual_tsc_khz == kvm->arch.cur_tsc_khz) {
 		/*
 		 * If synchronizing, advance the reference point to "now"
 		 * so the matching window slides forward with each vCPU.
@@ -1644,7 +1640,7 @@ static void pvclock_update_vm_gtod_copy(struct kvm *kvm)
 		 * get_kvmclock() to compute kvmclock from the host TSC
 		 * without needing a vCPU reference.
 		 */
-		ka->master_tsc_scaling_ratio = ka->last_tsc_scaling_ratio;
+		ka->master_tsc_scaling_ratio = ka->cur_tsc_scaling_ratio;
 		tsc_hz = (u64)get_cpu_tsc_khz() * HZ_PER_KHZ;
 		if (tsc_hz && kvm_caps.has_tsc_control)
 			tsc_hz = kvm_scale_tsc(tsc_hz,
@@ -3376,8 +3372,8 @@ static int kvm_arch_tsc_set_attr(struct kvm_vcpu *vcpu,
 		raw_spin_lock_irqsave(&kvm->arch.tsc_write_lock, flags);
 
 		matched = (vcpu->arch.virtual_tsc_khz &&
-			   kvm->arch.last_tsc_khz == vcpu->arch.virtual_tsc_khz &&
-			   kvm->arch.last_tsc_offset == offset);
+			   kvm->arch.cur_tsc_khz == vcpu->arch.virtual_tsc_khz &&
+			   kvm->arch.cur_tsc_offset == offset);
 
 		tsc = kvm_scale_tsc(rdtsc(), vcpu->arch.l1_tsc_scaling_ratio) + offset;
 		ns = get_kvmclock_base_ns();
@@ -9748,7 +9744,7 @@ int kvm_arch_enable_virtualization_cpu(void)
 {
 	struct kvm *kvm;
 	struct kvm_vcpu *vcpu;
-	unsigned long i;
+	unsigned long i, flags;
 	int ret;
 	u64 local_tsc;
 	u64 max_tsc = 0;
@@ -9827,13 +9823,18 @@ int kvm_arch_enable_virtualization_cpu(void)
 			}
 
 			/*
-			 * We have to disable TSC offset matching.. if you were
-			 * booting a VM while issuing an S4 host suspend....
-			 * you may have some problem.  Solving this issue is
-			 * left as an exercise to the reader.
+			 * Adjust the TSC matching reference by the same
+			 * delta applied to each vCPU's offset, so that
+			 * future KVM_SET_TSC / vCPU creation still matches
+			 * correctly against the adjusted TSC timeline.
+			 * Scale from host to guest TSC rate.
 			 */
-			kvm->arch.last_tsc_nsec = 0;
-			kvm->arch.last_tsc_write = 0;
+			raw_spin_lock_irqsave(&kvm->arch.tsc_write_lock, flags);
+			kvm->arch.cur_tsc_write -=
+				kvm_scale_tsc(delta_cyc,
+					      kvm->arch.cur_tsc_scaling_ratio);
+			kvm->arch.cur_tsc_offset += delta_cyc;
+			raw_spin_unlock_irqrestore(&kvm->arch.tsc_write_lock, flags);
 		}
 
 	}
-- 
2.55.0


