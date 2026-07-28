Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5B5C54F4D
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 14:50:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374501.1621713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woj8J-0006VC-U4; Tue, 28 Jul 2026 14:50:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374501.1621713; Tue, 28 Jul 2026 14:50:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woj8J-0006Tc-BZ; Tue, 28 Jul 2026 14:50:15 +0000
Received: by outflank-mailman (input) for mailman id 1374501;
 Tue, 28 Jul 2026 14:50:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+a16dffe8eb885fac2cd9+8374+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1woj8F-0005AA-9p
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 14:50:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woj8E-00EhwD-Mq; Tue, 28 Jul 2026 16:50:10 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+a16dffe8eb885fac2cd9+8374+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a68c19e-5cb7-0a2a0a5109dd-0a2a450ae24e-16
 for <multiple-recipients>; Tue, 28 Jul 2026 16:50:10 +0200
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+a16dffe8eb885fac2cd9+8374+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a68c1a2-f2d2-0a2a450a0019-5a9b32229268-3
 for <multiple-recipients>; Tue, 28 Jul 2026 16:50:10 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1woj80-0000000DUOx-21dv; Tue, 28 Jul 2026 14:49:57 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.4 #2 (Red
 Hat Linux)) id 1woj80-00000001UZd-1F1s;
 Tue, 28 Jul 2026 15:49:56 +0100
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
	bh=AhrOLRSCrNBvlBnZAjLfNnRsdG9qHTgKeEj17ZRlPXE=; b=Ye65D5VeKg9qacBebQB2C9y+D4
	rfZL0yOdDKo/kRxCDfdORG7ZEYTbfkXtzLxIxmqK1ykPEtJpcGaawAqYU/7qIT4RGWGXWdjCscrlF
	bCu3vlfaRZRAlu01S9dMvmUgDXeZT2nBsTSo2VjuH4QPq1VmoS2S3BrZWdYR+0u9d2RqVf3fKuA0V
	gywJq1jR0pCa9egWfdF15/YQAyo0n3D44CUlCzu2I6NhtCfsMzYnkA+mn18M4Mh8vadEIH15dBCXa
	J1tvJGiQDLiDCFK41VnAhd5jol90l7b7M5AOBMX5oVisrD3Yhu4EwchONo6/BBW27mzrrAhtzoNt5
	1F/UCUhg==;
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
Subject: [PATCH v7 28/36] KVM: x86: Activate master clock from kvm_arch_init_vm()
Date: Tue, 28 Jul 2026 15:40:08 +0100
Message-ID: <20260728144954.355376-29-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728144954.355376-1-dwmw2@infradead.org>
References: <20260728144954.355376-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-4011c0/1785250210-538D5CFC-318DE19E/0/0
X-purgate-type: clean
X-purgate-size: 4169

From: David Woodhouse <dwmw@amazon.co.uk>

Initialize the TSC generation and master clock state at VM creation
time, rather than relying on kvm_update_masterclock() from
kvm_arch_vcpu_postcreate().

Set cur_tsc_generation=1, cur_tsc_khz, cur_tsc_scaling_ratio,
cur_tsc_offset, cur_tsc_nsec and kvmclock_offset from an atomic
ktime/TSC snapshot. This establishes a coherent epoch so that:

 - The first vCPU synchronizes to the existing generation (getting
   the pre-computed TSC offset) rather than computing its own.
 - pvclock_update_vm_gtod_copy() succeeds immediately (no zero
   tsc_hz from uninitialized cur_tsc_scaling_ratio).
 - KVM_GET_CLOCK returns valid {host_tsc, realtime} fields as soon
   as any vCPU exists.
 - KVM_[GS]ET_CLOCK_GUEST works without a prior KVM_RUN.
 - No O(N) iteration of all vCPUs on each vCPU creation.

This replaces the kvm_update_masterclock() call that was added to
kvm_arch_vcpu_postcreate() to work around the missing initialization.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Assisted-by: Kiro (claude-opus-4.6-1m)
---
 arch/x86/kvm/x86.c | 45 +++++++++++++++++++++++++++++++++++++--------
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index e8e75e47fc33..5c78dd1e4c69 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9456,8 +9456,6 @@ void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
 		return;
 	vcpu_load(vcpu);
 	kvm_synchronize_tsc(vcpu, NULL);
-	if (!vcpu->kvm->arch.use_master_clock)
-		kvm_update_masterclock(vcpu->kvm, NULL);
 	vcpu_put(vcpu);
 
 	/* poll control enabled by default */
@@ -9867,6 +9865,8 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 {
 	int ret;
 	unsigned long flags;
+	u64 kvmclock_host_tsc;
+	s64 kvmclock_ns;
 
 	if (!kvm_is_vm_type_supported(type))
 		return -EINVAL;
@@ -9898,18 +9898,47 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 	seqcount_raw_spinlock_init(&kvm->arch.pvclock_sc, &kvm->arch.tsc_write_lock);
 	ratelimit_state_init(&kvm->arch.kvmclock_update_rs, HZ, 10);
 	ratelimit_set_flags(&kvm->arch.kvmclock_update_rs, RATELIMIT_MSG_ON_RELEASE);
-	kvm->arch.kvmclock_offset = -get_kvmclock_base_ns();
-	kvm->arch.all_vcpus_matched_freq = true;
-
-	raw_spin_lock_irqsave(&kvm->arch.tsc_write_lock, flags);
-	pvclock_update_vm_gtod_copy(kvm);
-	raw_spin_unlock_irqrestore(&kvm->arch.tsc_write_lock, flags);
 
 	kvm->arch.default_tsc_khz = max_tsc_khz ? : tsc_khz;
 	kvm->arch.apic_bus_cycle_ns = APIC_BUS_CYCLE_NS_DEFAULT;
 	kvm->arch.guest_can_read_msr_platform_info = true;
 	kvm->arch.enable_pmu = enable_pmu && !kvm->arch.has_protected_pmu;
 
+	kvm->arch.all_vcpus_matched_freq = true;
+	kvm->arch.all_vcpus_matched_tsc = true;
+	kvm->arch.cur_tsc_scaling_ratio = kvm_caps.default_tsc_scaling_ratio;
+	kvm->arch.cur_tsc_khz = kvm->arch.default_tsc_khz;
+
+	raw_spin_lock_irqsave(&kvm->arch.tsc_write_lock, flags);
+
+	/*
+	 * Establish the initial TSC generation for synchronization logic.
+	 * The first vCPU will sync to this, starting its guest TSC at the
+	 * number of cycles elapsed since VM creation rather than at zero.
+	 * This ensures coherence with the kvmclock epoch (also set here)
+	 * and means the master clock snapshot taken below is immediately
+	 * valid — no need to redo it at first vCPU creation.
+	 */
+#ifdef CONFIG_X86_64
+	if (!kvm_get_time_and_clockread(&kvmclock_ns, &kvmclock_host_tsc))
+#endif
+	{
+		/*
+		 * If not simultaneous, we want the TSC to be zero slightly
+		 * *after* the kvmclock is zero.
+		 */
+		kvmclock_ns = get_kvmclock_base_ns();
+		kvmclock_host_tsc = rdtsc();
+	}
+	kvm->arch.cur_tsc_write = 0;
+	kvm->arch.cur_tsc_offset = -(s64)kvmclock_host_tsc;
+	kvm->arch.cur_tsc_nsec = kvmclock_ns;
+	kvm->arch.cur_tsc_generation = 1;
+	kvm->arch.kvmclock_offset = -kvmclock_ns;
+
+	pvclock_update_vm_gtod_copy(kvm);
+	raw_spin_unlock_irqrestore(&kvm->arch.tsc_write_lock, flags);
+
 #if IS_ENABLED(CONFIG_HYPERV)
 	spin_lock_init(&kvm->arch.hv_root_tdp_lock);
 	kvm->arch.hv_root_tdp = INVALID_PAGE;
-- 
2.55.0


