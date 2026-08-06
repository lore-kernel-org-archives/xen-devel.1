Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A76C5AC67
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:36:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385274.1627751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7de-0008Fe-GG; Thu, 06 Aug 2026 23:36:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385274.1627751; Thu, 06 Aug 2026 23:36:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7de-0008EQ-6p; Thu, 06 Aug 2026 23:36:38 +0000
Received: by outflank-mailman (input) for mailman id 1385274;
 Thu, 06 Aug 2026 23:36:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3gRp1agYKCeQYKGTPIMUUMRK.IUSdKT-JKbKRROYZY.dKTVXUPKIZ.UXM@flex--seanjc.bounces.google.com>)
 id 1ws7dc-0007wv-Sl
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:36:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7dc-00GcaU-9U
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:36:36 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3gRp1agYKCeQYKGTPIMUUMRK.IUSdKT-JKbKRROYZY.dKTVXUPKIZ.UXM@flex--seanjc.bounces.google.com>)
 id 6a751a49-bab6-0a2a0a5309dd-0a2a4501d568-40
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:36 +0200
Received: from [209.85.210.200] (helo=mail-pf1-f200.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3gRp1agYKCeQYKGTPIMUUMRK.IUSdKT-JKbKRROYZY.dKTVXUPKIZ.UXM@flex--seanjc.bounces.google.com>)
 id 6a751a82-5984-0a2a45010019-d155d2c8bc06-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:36 +0200
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-848d21bbb55so4633309b3a.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:36:35 -0700 (PDT)
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
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786059394; x=1786664194; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kH88onT2XQPjPMTP9foWuf2kpVwGIl3qVDy3ZQ/XBNk=;
        b=WgpBj2tnuNJ8SKIkDltzyjZYZdaZ4+v5LrHck/UlzPGVAaC0Y+kWkaw7cQoy0DjGB/
         Koa0/gX/mEToB0MINePIOkunIjb6f6S7sdX0pL1Fy67Y9pARoXS5xt4df38bIU6LwBAd
         maiiV7PBAT3ShzRssQ/ghWB8VQLcM+zhMAraRJ95hmS6IBKFowXlwJBPpPwSBaetWY/U
         nqnM5X6M9fSZvCaCJS0kBFWoxZ44BehTNxPe1eiAhL+XKnZoNX3F+SxvUXp606yW6Nm/
         XwYAXiihNRxJDzwwVvmRDnWjFSOxfreg2UYK/RMOx2wPux5Bijeq6bxP44qD1IuF9I3s
         apQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059394; x=1786664194;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kH88onT2XQPjPMTP9foWuf2kpVwGIl3qVDy3ZQ/XBNk=;
        b=ZQuOQh9JBLwvjrb/DXSmp3fLrCv4pUxkuiUf871DeJ3ItpP62L2Lt+0TcJT1+t6NvY
         4hSz3K6cpOpj1bQhxtgKMf1ZaB+aoi9QIqEIOkCN/kYaCMZSfkYXn7jJd9efzvWkRMUb
         uw3D05cEJw2ZqnE42/5nIquxx5vVkpSUFiAdC4EXTD+eVlfiEfym4soIF7vpb5jRKPfh
         RFSkDVOpfeGaE/edDg8gdGvImdltTnrluVL8QT/cqN2bHQGKNrQMFKCFzsPERcxdithO
         Ev8GdVs3oGqND+WUJhqhueUfiTmiTEj1b8N1jGxDNKCRpAO4fPA9R9UUk5VFMAv35I01
         rFHg==
X-Forwarded-Encrypted: i=1; AHgh+RpZMiycyxlC7LBHRni2KqoN/d82d1ecAJ8JS3qiAH9HczEmWCxym2W6TbBOplgdppSWTBXpyZ3YY5E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAvwnQIc5B1tAHSQNLfEbgzMJK0aYXa5SJNUEK25YUzIQwuId5
	U2GSOvcLaQPcM2Tg6UQaq6t35I+jfQlpCieiwIKZ0QlBtz275PP3T/AGEm9ako0ZGOR0M1g2bC2
	lzoyWEA==
X-Received: from pgei3.prod.google.com ([2002:a05:6a02:5263:b0:c82:7761:9936])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1ca2:b0:847:8ccc:d7c6
 with SMTP id d2e1a72fcca58-84f2e0278d5mr21014018b3a.31.1786059393911; Thu, 06
 Aug 2026 16:36:33 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:25 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-9-seanjc@google.com>
Subject: [PATCH v6 08/51] x86/sev: Shove SNP's secure/trusted TSC frequency
 directly into "calibration"
From: Sean Christopherson <seanjc@google.com>
To: Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	John Stultz <jstultz@google.com>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, x86@kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Michael Kelley <mhklinux@outlook.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, David Woodhouse <dwmw2@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-d62444/1786059396-BEA66757-721236B2/0/0
X-purgate-type: clean
X-purgate-size: 7245

As a first step towards dropping .calibrate_{cpu,tsc}() and explicitly
defining precedence/priority for "calibration" routines, pass the secure
TSC frequency obtained from SNP firmware directly to
determine_cpu_tsc_frequencies() instead of overriding the .calibrate_tsc()
hook.

Unlike the native calibration routines, all of the paravirtual overrides,
including SNP and TDX, are constant in the sense that the frequency
provided by the hypervisor or trusted firmware is fixed, known, and always
available during early boot.  More importantly, for CoCo (SNP and TDX) VMs,
it's imperative that the kernel uses the frequency provided by the trusted
firmware, not by the untrusted hypervisor.  Enforcing the priority between
sources by carefully ordering seemingly unrelated init calls, so that the
trusted override "wins", is brittle and all but impossible to follow.

Explicitly ignore tsc_early_khz if the exact TSC frequency was obtained
from trusted firmware, as per commit bd35c77e32e4 ("x86/tsc: Add
tsc_early_khz command line parameter"), the goal of the param is to play
nice with setups that provide partial frequency information in CPUID, i.e.
is NOT intended to be a hard override.  Neither SNP's secure TSC nor TDX
was supported when commit bd35c77e32e4 landed back in 2020, i.e. lack of
consideration for the interaction was purely due to oversight when SNP and
TDX support came along.

Reviewed-by: Nikunj A Dadhania <nikunj@amd.com>
Tested-by: Nikunj A Dadhania <nikunj@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../admin-guide/kernel-parameters.txt         |  4 +++
 arch/x86/coco/sev/core.c                      | 14 +++--------
 arch/x86/include/asm/sev.h                    |  4 +--
 arch/x86/kernel/tsc.c                         | 25 ++++++++++++++-----
 4 files changed, 29 insertions(+), 18 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 87bb1fb31696..aa4eb568d9fb 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7946,6 +7946,10 @@ Kernel parameters
 			with CPUID.16h support and partial CPUID.15h support.
 			Format: <unsigned int>
 
+			Note, tsc_early_khz is ignored if the TSC frequency is
+			provided by trusted firmware when running as an SNP
+			guest.
+
 	tsx=		[X86] Control Transactional Synchronization
 			Extensions (TSX) feature in Intel processors that
 			support TSX control.
diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index 403dcea86452..bc5ae9ef74da 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -99,7 +99,6 @@ static const char * const sev_status_feat_names[] = {
  */
 static u64 snp_tsc_scale __ro_after_init;
 static u64 snp_tsc_offset __ro_after_init;
-static unsigned long snp_tsc_freq_khz __ro_after_init;
 
 DEFINE_PER_CPU(struct sev_es_runtime_data*, runtime_data);
 DEFINE_PER_CPU(struct sev_es_save_area *, sev_vmsa);
@@ -2014,15 +2013,10 @@ void __init snp_secure_tsc_prepare(void)
 	pr_debug("SecureTSC enabled");
 }
 
-static unsigned long securetsc_get_tsc_khz(void)
-{
-	return snp_tsc_freq_khz;
-}
-
-void __init snp_secure_tsc_init(void)
+unsigned int __init snp_secure_tsc_init(void)
 {
+	unsigned long snp_tsc_freq_khz, tsc_freq_mhz;
 	struct snp_secrets_page *secrets;
-	unsigned long tsc_freq_mhz;
 	void *mem;
 
 	mem = early_memremap_encrypted(sev_secrets_pa, PAGE_SIZE);
@@ -2043,7 +2037,7 @@ void __init snp_secure_tsc_init(void)
 
 	snp_tsc_freq_khz = SNP_SCALE_TSC_FREQ(tsc_freq_mhz * 1000, secrets->tsc_factor);
 
-	x86_platform.calibrate_tsc = securetsc_get_tsc_khz;
-
 	early_memunmap(mem, PAGE_SIZE);
+
+	return snp_tsc_freq_khz;
 }
diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index 594cfa19cbd4..05ebf0b73ef4 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -530,7 +530,7 @@ int snp_send_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_req *req
 int snp_svsm_vtpm_send_command(u8 *buffer);
 
 void __init snp_secure_tsc_prepare(void);
-void __init snp_secure_tsc_init(void);
+unsigned int snp_secure_tsc_init(void);
 enum es_result savic_register_gpa(u64 gpa);
 enum es_result savic_unregister_gpa(u64 *gpa);
 u64 savic_ghcb_msr_read(u32 reg);
@@ -637,7 +637,7 @@ static inline int snp_send_guest_request(struct snp_msg_desc *mdesc,
 					 struct snp_guest_req *req) { return -ENODEV; }
 static inline int snp_svsm_vtpm_send_command(u8 *buffer) { return -ENODEV; }
 static inline void __init snp_secure_tsc_prepare(void) { }
-static inline void __init snp_secure_tsc_init(void) { }
+static inline unsigned int __init snp_secure_tsc_init(void) { return 0; }
 static inline void sev_evict_cache(void *va, int npages) {}
 static inline enum es_result savic_register_gpa(u64 gpa) { return ES_UNSUPPORTED; }
 static inline enum es_result savic_unregister_gpa(u64 *gpa) { return ES_UNSUPPORTED; }
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index c710c71a1bdf..6898584610a7 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -1440,15 +1440,16 @@ static int __init init_tsc_clocksource(void)
  */
 device_initcall(init_tsc_clocksource);
 
-static bool __init determine_cpu_tsc_frequencies(bool early)
+static bool __init determine_cpu_tsc_frequencies(bool early,
+						 unsigned int known_tsc_khz)
 {
 	/* Make sure that cpu and tsc are not already calibrated */
 	WARN_ON(cpu_khz || tsc_khz);
 
 	if (early) {
 		cpu_khz = x86_platform.calibrate_cpu();
-		if (tsc_early_khz)
-			tsc_khz = tsc_early_khz;
+		if (known_tsc_khz)
+			tsc_khz = known_tsc_khz;
 		else
 			tsc_khz = x86_platform.calibrate_tsc();
 	} else {
@@ -1503,6 +1504,8 @@ static void __init tsc_enable_sched_clock(void)
 
 void __init tsc_early_init(void)
 {
+	unsigned int known_tsc_khz = 0;
+
 	if (!boot_cpu_has(X86_FEATURE_TSC))
 		return;
 	/* Don't change UV TSC multi-chassis synchronization */
@@ -1510,9 +1513,19 @@ void __init tsc_early_init(void)
 		return;
 
 	if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC))
-		snp_secure_tsc_init();
+		known_tsc_khz = snp_secure_tsc_init();
 
-	if (!determine_cpu_tsc_frequencies(true))
+	/*
+	 * Ignore the user-provided TSC frequency if the exact frequency was
+	 * obtained from trusted firmware, as the user-provided frequency is
+	 * intended as a "starting point", not a known, guaranteed frequency.
+	 */
+	if (!known_tsc_khz)
+		known_tsc_khz = tsc_early_khz;
+	else if (tsc_early_khz)
+		pr_err("Ignoring 'tsc_early_khz' in favor of trusted firmware.\n");
+
+	if (!determine_cpu_tsc_frequencies(true, known_tsc_khz))
 		return;
 	tsc_enable_sched_clock();
 }
@@ -1533,7 +1546,7 @@ void __init tsc_init(void)
 
 	if (!tsc_khz) {
 		/* We failed to determine frequencies earlier, try again */
-		if (!determine_cpu_tsc_frequencies(false)) {
+		if (!determine_cpu_tsc_frequencies(false, 0)) {
 			mark_tsc_unstable("could not calculate TSC khz");
 			setup_clear_cpu_cap(X86_FEATURE_TSC_DEADLINE_TIMER);
 			return;
-- 
2.55.0.679.g6767b8d81c-goog


