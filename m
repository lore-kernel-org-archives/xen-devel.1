Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFCFCD3447
	for <xen-devel@archiver.kernel.org>; Sat,  9 May 2026 22:52:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1305100.1577730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLqXQ-00055G-T6; Sat, 09 May 2026 22:52:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1305100.1577730; Sat, 09 May 2026 22:52:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLqXQ-000558-QG; Sat, 09 May 2026 22:52:48 +0000
Received: by outflank-mailman (input) for mailman id 1305100;
 Sat, 09 May 2026 22:52:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+34a25b45fb3f66caac6a+8294+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1wLqXP-0004qN-8E
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 22:52:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLqXO-008rH7-LN; Sun, 10 May 2026 00:52:46 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+34a25b45fb3f66caac6a+8294+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 69ffba24-2eae-0a2a0a5409dd-0a2a4506b144-48
 for <multiple-recipients>; Sun, 10 May 2026 00:52:46 +0200
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <BATV+34a25b45fb3f66caac6a+8294+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 69ffb9cd-7371-0a2a45060019-5a9b3222d576-3
 for <multiple-recipients>; Sun, 10 May 2026 00:48:45 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wLqTD-000000060LP-2pj4; Sat, 09 May 2026 22:48:30 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1wLqTD-0000000DhJ7-1V2k;
 Sat, 09 May 2026 23:48:27 +0100
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
	bh=HcPos2+xuZTjBV7pxq7NSClTpw+Fu99QdQJ5Jy1Ls+M=; b=Zf77LfPtfI70hL1gqLbAhPtLtX
	ibkr66p3p6/yNwf1wG6qqc/ms/D0cd+mf/gL9RKluGUlABJWL954X+hC7rfWjImiJ7CROZMthVqh7
	OTkMC4vADFkwf63SWHGMNbF2qJVf9rruhAcDBmTZgzvOH0jHPndB5bEQv9StPED9R1rJWRdq5KqsA
	idLIC0tiDnsbUYQlxQkaFsJ1rxU7HJqRe1UHoilCGBY2oTbY3Qok9mr4jH7I9F9puYYvsCXOgoRSg
	aGZgxEUEluS1lC7dL54o1eq6sM/iCEMUEUte4b9q7W4oNzFdeq8Z9C54Hgb9kHKHIxTuTapNwFb2v
	46Z9XONA==;
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
Subject: [PATCH v4 29/30] x86/kvm: Obtain TSC frequency from CPUID if present
Date: Sat,  9 May 2026 23:46:55 +0100
Message-ID: <20260509224824.3264567-30-dwmw2@infradead.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260509224824.3264567-1-dwmw2@infradead.org>
References: <20260509224824.3264567-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-16d1c6/1778366926-8FD7AD75-F860CF9A/0/0
X-purgate-type: clean
X-purgate-size: 3522

From: David Woodhouse <dwmw@amazon.co.uk>

In https://lore.kernel.org/all/1222881242.9381.17.camel@alok-dev1/
a proposal was made for generic CPUID conventions across hypervisors.
It was mostly shot down in flames, but the leaf at 0x40000010
containing timing information didn't die.

It's used by XNU and FreeBSD guests under all hypervisors to determine
the TSC frequency, and also exposed by the EC2 Nitro hypervisor and
VMware. Use it under KVM to obtain the TSC frequency more accurately,
instead of reverse-calculating the frequency from the mul/shift values
in the KVM clock.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/include/asm/kvm_para.h      |  1 +
 arch/x86/include/uapi/asm/kvm_para.h | 11 +++++++++++
 arch/x86/kernel/kvm.c                | 10 ++++++++++
 arch/x86/kernel/kvmclock.c           |  7 ++++++-
 4 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/kvm_para.h b/arch/x86/include/asm/kvm_para.h
index 4a47c16e2df8..03fa1228fcf2 100644
--- a/arch/x86/include/asm/kvm_para.h
+++ b/arch/x86/include/asm/kvm_para.h
@@ -121,6 +121,7 @@ static inline long kvm_sev_hypercall3(unsigned int nr, unsigned long p1,
 void kvmclock_init(void);
 void kvmclock_disable(void);
 bool kvm_para_available(void);
+unsigned int kvm_para_tsc_khz(void);
 unsigned int kvm_arch_para_features(void);
 unsigned int kvm_arch_para_hints(void);
 void kvm_async_pf_task_wait_schedule(u32 token);
diff --git a/arch/x86/include/uapi/asm/kvm_para.h b/arch/x86/include/uapi/asm/kvm_para.h
index a1efa7907a0b..dc0d036fe678 100644
--- a/arch/x86/include/uapi/asm/kvm_para.h
+++ b/arch/x86/include/uapi/asm/kvm_para.h
@@ -44,6 +44,17 @@
  */
 #define KVM_FEATURE_CLOCKSOURCE_STABLE_BIT	24
 
+/*
+ * In https://lore.kernel.org/all/1222881242.9381.17.camel@alok-dev1/
+ * VMware proposed a timing information leaf providing the TSC and
+ * local APIC timer frequencies:
+ *
+ *  # EAX: (Virtual) TSC frequency in kHz.
+ *  # EBX: (Virtual) Bus (local apic timer) frequency in kHz.
+ *  # ECX, EDX: RESERVED (reserved fields are set to zero).
+ */
+#define KVM_CPUID_TIMING_INFO	0x40000010
+
 #define MSR_KVM_WALL_CLOCK  0x11
 #define MSR_KVM_SYSTEM_TIME 0x12
 
diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 29226d112029..60375165b66c 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -910,6 +910,16 @@ bool kvm_para_available(void)
 }
 EXPORT_SYMBOL_GPL(kvm_para_available);
 
+unsigned int kvm_para_tsc_khz(void)
+{
+	u32 base = kvm_cpuid_base();
+
+	if (base && cpuid_eax(base) >= (base | KVM_CPUID_TIMING_INFO))
+		return cpuid_eax(base | KVM_CPUID_TIMING_INFO);
+
+	return 0;
+}
+
 unsigned int kvm_arch_para_features(void)
 {
 	return cpuid_eax(kvm_cpuid_base() | KVM_CPUID_FEATURES);
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index b5991d53fc0e..74aca22dc726 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -118,7 +118,12 @@ static inline void kvm_sched_clock_init(bool stable)
 static unsigned long kvm_get_tsc_khz(void)
 {
 	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
-	return pvclock_tsc_khz(this_cpu_pvti());
+
+	/*
+	 * If KVM advertises the frequency directly in CPUID, use that
+	 * instead of reverse-calculating it from the KVM clock data.
+	 */
+	return kvm_para_tsc_khz() ? : pvclock_tsc_khz(this_cpu_pvti());
 }
 
 static void __init kvm_get_preset_lpj(void)
-- 
2.51.0


