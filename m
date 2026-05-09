Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F59CD37B8
	for <xen-devel@archiver.kernel.org>; Sat,  9 May 2026 22:53:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1305106.1577768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLqXT-0005kL-I0; Sat, 09 May 2026 22:52:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1305106.1577768; Sat, 09 May 2026 22:52:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLqXT-0005j1-7k; Sat, 09 May 2026 22:52:51 +0000
Received: by outflank-mailman (input) for mailman id 1305106;
 Sat, 09 May 2026 22:52:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+34a25b45fb3f66caac6a+8294+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1wLqXQ-00054w-S0
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 22:52:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLqXQ-00270l-8r; Sun, 10 May 2026 00:52:48 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+34a25b45fb3f66caac6a+8294+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 69ffba8c-5cb7-0a2a0a5109dd-0a2a4502af40-16
 for <multiple-recipients>; Sun, 10 May 2026 00:52:48 +0200
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <BATV+34a25b45fb3f66caac6a+8294+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 69ffb9cf-af86-0a2a45020019-5a9b322294d0-3
 for <multiple-recipients>; Sun, 10 May 2026 00:48:47 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wLqTD-000000060LG-11bn; Sat, 09 May 2026 22:48:30 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1wLqTC-0000000DhIX-44HE;
 Sat, 09 May 2026 23:48:26 +0100
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
	bh=iwNDogNMnm4WL4MqrZc8nsIfoorb7pJAk0uuGh5ggK4=; b=mRIMgmptP6nlE1xwJJE7wWchlj
	c5hj715Dq8L1J2PI/D8dsuU7xrbXhQSFIt0oyARLK3GdPSMaIrfKJHxkF9HDegFgOkjueS3rlt6/W
	67i4Frua5/XiZINxBRRzCpomDpKO/csTN/dT245yPE+YO/RGSemOgeVIrNqUFKZUie5YfIuoBg59D
	g4vHNMHV7b+p80wEm1WwTOrLjMRW61Rdrzxh+x2pC5SJvDvJ5xkIWKHTGA60lHzLK+h51bNW2SkUq
	GFEo/NItxLK2xl668Yom6hg1gOvV+KTatfa1uufQQBtqoY9AZDAAT79NjCzqnQxh6Fr9HrZUmpbLh
	cxvDdfFQ==;
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
Subject: [PATCH v4 20/30] KVM: x86: Kill last_tsc_{nsec,write,offset} fields
Date: Sat,  9 May 2026 23:46:46 +0100
Message-ID: <20260509224824.3264567-21-dwmw2@infradead.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260509224824.3264567-1-dwmw2@infradead.org>
References: <20260509224824.3264567-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-720697/1778366927-AB762161-F367B231/13/0
X-purgate-type: clean
X-purgate-size: 5500

From: David Woodhouse <dwmw@amazon.co.uk>

These pointlessly duplicate the cur_tsc_{nsec,write,offset} values.
The only place they were used was where the TSC is stable and a new
vCPU is being synchronized to the previous setting, in which case the
cur_tsc_* value is definitely identical.

Rename last_tsc_khz and last_tsc_scaling_ratio to cur_tsc_khz and
cur_tsc_scaling_ratio respectively, since they are properties of the
current TSC generation.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 arch/x86/include/asm/kvm_host.h |  7 ++-----
 arch/x86/kvm/x86.c              | 32 ++++++++++++++------------------
 2 files changed, 16 insertions(+), 23 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 5348fd5ea3f3..59298a8f78eb 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1486,11 +1486,8 @@ struct kvm_arch {
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
index 097df58749c3..3c68d2a4c8d0 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -2813,14 +2813,12 @@ static void __kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 offset, u64 tsc,
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
 
@@ -2833,8 +2831,6 @@ static void __kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 offset, u64 tsc,
 		 * nanosecond time, offset, and write, so if TSCs are in
 		 * sync, we can match exact offset, and if not, we can match
 		 * exact software computation in compute_guest_tsc()
-		 *
-		 * These values are tracked in kvm->arch.cur_xxx variables.
 		 */
 		kvm->arch.cur_tsc_generation++;
 		kvm->arch.cur_tsc_nsec = ns;
@@ -2873,7 +2869,7 @@ static void kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 *user_value)
 	raw_spin_lock_irqsave(&kvm->arch.tsc_write_lock, flags);
 
 	offset = kvm_compute_l1_tsc_offset(vcpu, host_tsc, data);
-	elapsed = ns - kvm->arch.last_tsc_nsec;
+	elapsed = ns - kvm->arch.cur_tsc_nsec;
 
 	if (vcpu->arch.virtual_tsc_khz) {
 		if (data == 0) {
@@ -2883,7 +2879,7 @@ static void kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 *user_value)
 			 */
 			synchronizing = true;
 		} else if (kvm->arch.user_set_tsc) {
-			u64 tsc_exp = kvm->arch.last_tsc_write +
+			u64 tsc_exp = kvm->arch.cur_tsc_write +
 						nsec_to_cycles(vcpu, elapsed);
 			u64 tsc_hz = vcpu->arch.virtual_tsc_khz * 1000LL;
 			/*
@@ -2914,14 +2910,14 @@ static void kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 *user_value)
 	 * it's better to try to match offsets from the beginning.
          */
 	if (synchronizing &&
-	    vcpu->arch.virtual_tsc_khz == kvm->arch.last_tsc_khz) {
+	    vcpu->arch.virtual_tsc_khz == kvm->arch.cur_tsc_khz) {
 		/*
 		 * If synchronizing, the "last written" TSC value/time
 		 * recorded by __kvm_synchronize_tsc() should not change
 		 * (i.e. should be precisely the same as the existing
 		 * generation).
 		 */
-		data = kvm->arch.last_tsc_write;
+		data = kvm->arch.cur_tsc_write;
 
 		if (!kvm_check_tsc_unstable()) {
 			offset = kvm->arch.cur_tsc_offset;
@@ -3206,7 +3202,7 @@ static void pvclock_update_vm_gtod_copy(struct kvm *kvm)
 		 * get_kvmclock() to compute kvmclock from the host TSC
 		 * without needing a vCPU reference.
 		 */
-		ka->master_tsc_scaling_ratio = ka->last_tsc_scaling_ratio;
+		ka->master_tsc_scaling_ratio = ka->cur_tsc_scaling_ratio;
 		tsc_hz = (u64)get_cpu_tsc_khz() * 1000;
 		if (tsc_hz && kvm_caps.has_tsc_control)
 			tsc_hz = kvm_scale_tsc(tsc_hz,
@@ -6075,8 +6071,8 @@ static int kvm_arch_tsc_set_attr(struct kvm_vcpu *vcpu,
 		raw_spin_lock_irqsave(&kvm->arch.tsc_write_lock, flags);
 
 		matched = (vcpu->arch.virtual_tsc_khz &&
-			   kvm->arch.last_tsc_khz == vcpu->arch.virtual_tsc_khz &&
-			   kvm->arch.last_tsc_offset == offset);
+			   kvm->arch.cur_tsc_khz == vcpu->arch.virtual_tsc_khz &&
+			   kvm->arch.cur_tsc_offset == offset);
 
 		tsc = kvm_scale_tsc(rdtsc(), vcpu->arch.l1_tsc_scaling_ratio) + offset;
 		ns = get_kvmclock_base_ns();
@@ -13520,8 +13516,8 @@ int kvm_arch_enable_virtualization_cpu(void)
 			 * you may have some problem.  Solving this issue is
 			 * left as an exercise to the reader.
 			 */
-			kvm->arch.last_tsc_nsec = 0;
-			kvm->arch.last_tsc_write = 0;
+			kvm->arch.cur_tsc_nsec = 0;
+			kvm->arch.cur_tsc_write = 0;
 		}
 
 	}
-- 
2.51.0


