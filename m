Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F84C624D3
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 11:40:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408296.1640948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2SH9-000710-LG; Fri, 04 Sep 2026 11:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408296.1640948; Fri, 04 Sep 2026 11:40:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2SH9-00070t-IJ; Fri, 04 Sep 2026 11:40:07 +0000
Received: by outflank-mailman (input) for mailman id 1408296;
 Fri, 04 Sep 2026 11:25:33 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hemanth.selam@gmail.com>) id 1x2S33-0002TS-FV
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 11:25:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2S32-009Sod-Qy
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 13:25:32 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <hemanth.selam@gmail.com>)
 id 6a9aaa96-8faa-0a2a0a5109dd-0a2a45068016-38
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 13:25:32 +0200
Received: from [209.85.216.43] (helo=mail-pj1-f43.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <hemanth.selam@gmail.com>)
 id 6a9aaaab-195a-0a2a45060019-d155d82bb0ae-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 13:25:32 +0200
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-398a4dcf289so1030679a91.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 04:25:32 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3339ac24d7esm8970969eec.15.2026.09.04.04.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 04:25:30 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521131; x=1789125931; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=545O0WDL5qNzN0FtnQz+2XQixX5ANxvieXurE5YLToc=;
        b=V8mnPLnIBndK1ZsdrmWe+sN2cqMZZq6A4T1xIQv9M1NT7a/DQQzIefD+7oAJPvlbxQ
         UA2HIUPj7dpNxDzLT2jUwF5IfBMEAT/dmLuhNluPPOmCD5L1d7R2bbhxfmztzWunH6xN
         5AtquoIWi6Ga5LxCrZ61E0HDvQhx+N74IQz4cH7UGuE7ywp3eJd0G7PtLoXv1B1ElaWB
         +bSNGyAOD6ddLuOFt4TYRFXrl4TcZjmEpfU8HsIVaWjERovAY9oJ3lSHxD3bhnmefASY
         zrnjUq/7nfCM3XWhF3ymK2weiXNG9S8CAt1ZMJY/ASSm33J5Vxs1RxV20EHCU/pzGBwr
         4gqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521131; x=1789125931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=545O0WDL5qNzN0FtnQz+2XQixX5ANxvieXurE5YLToc=;
        b=TOZPaPwb+8QEwhHDr+1ZPaxi1Yll3Kah7mjfO8xa83+UzAXPFMOOQO5oBcEoMbqeKO
         pU1huIlR5NHA41fK5q0YaeSORfBMUpgNcnYx24wmhbwTiN4TVvM1Oo+7kCL1mztJ9TI1
         EPFr5iVobaj/JrX6p0dmZn8ZCkADJflf6h+p02a/DPFaSVrOIDqJXvfMGBPdTy6bArL5
         8CFAncqgSUtBzn2x9nVL4wExzdSrQ+52keQIofg7AAUejw80DPflpNxzDSSa09+JC+VU
         ysGbvpniwidIAkcPJd3otOzO1iP5/l+lc6mGAteVnc6x/r6Gt1XM6nAEYHdGPV37vbKT
         xipg==
X-Forwarded-Encrypted: i=1; AKwUvBxQXQPyXtJ7QDPuUOnvF5zt+YQembMI8lsCIJRR3epS1qqzniWj1hWIPu2GonTrNCRaWqZWySekaQA=@lists.xenproject.org
X-Gm-Message-State: AFuF++kLx5hcjhiTmtAUhvCD2CUcrqqaLzGJ6OpgetKWRbp15iTl2A8y
	LAzQPQaT+1SzUaCL9IPNahgj2shLSV42QSjzJ7DtL4TmvTn3unvWS8nDvxPLcvA8
X-Gm-Gg: AYBFou0SDnTFydPnqu0fGJ4+1RA5aU/8uEIWh7VDgRsaxn46k7tppVTDzkpLZEPM6vV
	ziUUO8mIE1o5SWUT8K3Nd59PU98SDJPV3sbhdvUehMuc5Xyxk/5HFFz2qlICp2UpTZNKFR/Zqbu
	riOjycrWK4248lsDm42TSUtok8XQTvlkw4ZTtBEv9uZZRFWZz4HUzeiy7qbdwOxSXLJejx3Khcz
	URRJRNxggCqQ0Eu6UNDbUfn+BO3FTIYn6PyefCQIO8WKF7W68o+gZhbu4+MBsMO2Y8pC75eHMBN
	DwWIKKtctRvtsEZakldW1JBiC085JZIzQ1yMLuKPgjfU+tsH9axbBfINgrnCu+A9smjr4HjePuO
	o+oagWvb/nej2TBUPaI6dtQREiclFWENI4dVR6VaMmnbiMMzeBeBVK82V1OSjXMmposW7gAVA0u
	HgCHcHD1xV3AtLfIvHM1pa9AxIEvGtm5KZ5OwmioDmj8GAI5+RfuAmHmNsHbwWLW3dt5s//buc6
	g2+TyVTtBVNocE=
X-Received: by 2002:a17:90b:2b43:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-39b25ed34f3mr9759398a91.0.1788521130565;
        Fri, 04 Sep 2026 04:25:30 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Stefano Stabellini <sstabellini@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH 1/2] ARM: fix typos in comments
Date: Fri,  4 Sep 2026 16:55:17 +0530
Message-ID: <20260904112522.1426-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904112522.1426-1-hemanth.selam@gmail.com>
References: <20260904112522.1426-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1788521132-F460277B-BA1FCDD2/0/0
X-purgate-type: clean
X-purgate-size: 6846

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/arm/boot/compressed/head.S     | 2 +-
 arch/arm/include/asm/uaccess.h      | 2 +-
 arch/arm/kernel/cpuidle.c           | 2 +-
 arch/arm/mm/cache-l2x0.c            | 2 +-
 arch/arm/mm/context.c               | 4 ++--
 arch/arm/probes/decode.h            | 2 +-
 arch/arm/probes/kprobes/opt-arm.c   | 4 ++--
 arch/arm/probes/kprobes/test-core.c | 2 +-
 arch/arm/xen/hypercall.S            | 4 ++--
 9 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/compressed/head.S
index 9f406e9c0ea6..e117f2b4dea9 100644
--- a/arch/arm/boot/compressed/head.S
+++ b/arch/arm/boot/compressed/head.S
@@ -955,7 +955,7 @@ call_cache_fn:	adr	r12, proc_types
 		/*
 		 * On v7-M the processor id is located in the V7M_SCB_CPUID
 		 * register, but as cache handling is IMPLEMENTATION DEFINED on
-		 * v7-M (if existant at all) we just return early here.
+		 * v7-M (if existent at all) we just return early here.
 		 * If V7M_SCB_CPUID were used the cpu ID functions (i.e.
 		 * __armv7_mmu_cache_{on,off,flush}) would be selected which
 		 * use cp15 registers that are not implemented on v7-M.
diff --git a/arch/arm/include/asm/uaccess.h b/arch/arm/include/asm/uaccess.h
index 1593cf3b9800..9805001f9d72 100644
--- a/arch/arm/include/asm/uaccess.h
+++ b/arch/arm/include/asm/uaccess.h
@@ -24,7 +24,7 @@
  * These two functions allow hooking accesses to userspace to increase
  * system integrity by ensuring that the kernel can not inadvertantly
  * perform such accesses (eg, via list poison values) which could then
- * be exploited for priviledge escalation.
+ * be exploited for privilege escalation.
  */
 #if defined(CONFIG_CPU_SW_DOMAIN_PAN)
 
diff --git a/arch/arm/kernel/cpuidle.c b/arch/arm/kernel/cpuidle.c
index fba1f8bb03b5..784457ac7b2b 100644
--- a/arch/arm/kernel/cpuidle.c
+++ b/arch/arm/kernel/cpuidle.c
@@ -79,7 +79,7 @@ static const struct cpuidle_ops *__init arm_cpuidle_get_ops(const char *method)
  * cpuidle_ops are tagged __initconst and will be unloaded after the init
  * process.
  *
- * Return 0 on sucess, -ENOENT if no 'enable-method' is defined, -EOPNOTSUPP if
+ * Return 0 on success, -ENOENT if no 'enable-method' is defined, -EOPNOTSUPP if
  * no cpuidle_ops is registered for the 'enable-method', or if either init or
  * suspend callback isn't defined.
  */
diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
index 470867160076..0eaaf99d3d11 100644
--- a/arch/arm/mm/cache-l2x0.c
+++ b/arch/arm/mm/cache-l2x0.c
@@ -1381,7 +1381,7 @@ static void aurora_pa_range(unsigned long start, unsigned long end,
 	unsigned long flags;
 
 	/*
-	 * round start and end adresses up to cache line size
+	 * round start and end addresses up to cache line size
 	 */
 	start &= ~(CACHE_LINE_SIZE - 1);
 	end = ALIGN(end, CACHE_LINE_SIZE);
diff --git a/arch/arm/mm/context.c b/arch/arm/mm/context.c
index 4204ffa2d104..95d477cab0f5 100644
--- a/arch/arm/mm/context.c
+++ b/arch/arm/mm/context.c
@@ -76,7 +76,7 @@ void a15_erratum_get_cpumask(int this_cpu, struct mm_struct *mm,
 
 #ifdef CONFIG_ARM_LPAE
 /*
- * With LPAE, the ASID and page tables are updated atomicly, so there is
+ * With LPAE, the ASID and page tables are updated atomically, so there is
  * no need for a reserved set of tables (the active ASID tracking prevents
  * any issues across a rollover).
  */
@@ -243,7 +243,7 @@ void check_and_switch_context(struct mm_struct *mm, struct task_struct *tsk)
 	check_vmalloc_seq(mm);
 
 	/*
-	 * We cannot update the pgd and the ASID atomicly with classic
+	 * We cannot update the pgd and the ASID atomically with classic
 	 * MMU, so switch exclusively to global mappings to avoid
 	 * speculative page table walking with the wrong TTBR.
 	 */
diff --git a/arch/arm/probes/decode.h b/arch/arm/probes/decode.h
index facc889d05ee..b09c44ba1030 100644
--- a/arch/arm/probes/decode.h
+++ b/arch/arm/probes/decode.h
@@ -250,7 +250,7 @@ enum decode_reg_type {
 	REG_TYPE_NOPCWB,   /* No PC if load/store write-back flag also set */
 
 	/* The following types are used when the encoding for PC indicates
-	 * another instruction form. This distiction only matters for test
+	 * another instruction form. This distinction only matters for test
 	 * case coverage checks.
 	 */
 	REG_TYPE_NOPCX,	   /* Register must not be PC */
diff --git a/arch/arm/probes/kprobes/opt-arm.c b/arch/arm/probes/kprobes/opt-arm.c
index 966c6042c5ad..a3aed8c01c98 100644
--- a/arch/arm/probes/kprobes/opt-arm.c
+++ b/arch/arm/probes/kprobes/opt-arm.c
@@ -210,11 +210,11 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *or
 	 *
 	 * So the maximum forward branch should be:
 	 *   (0x007fffff << 2) = 0x01fffffc =  0x1fffffc
-	 * The maximum backword branch should be:
+	 * The maximum backward branch should be:
 	 *   (0xff800000 << 2) = 0xfe000000 = -0x2000000
 	 *
 	 * We can simply check (rel & 0xfe000003):
-	 *  if rel is positive, (rel & 0xfe000000) shoule be 0
+	 *  if rel is positive, (rel & 0xfe000000) should be 0
 	 *  if rel is negitive, (rel & 0xfe000000) should be 0xfe000000
 	 *  the last '3' is used for alignment checking.
 	 */
diff --git a/arch/arm/probes/kprobes/test-core.c b/arch/arm/probes/kprobes/test-core.c
index 2de28088dac8..531fec3621b8 100644
--- a/arch/arm/probes/kprobes/test-core.c
+++ b/arch/arm/probes/kprobes/test-core.c
@@ -125,7 +125,7 @@
  *	.byte	ARG_TYPE_END
  *	.byte	TEST_ISA	@ flags, including ISA being tested
  *	.short	50f-0f		@ offset of 'test_before'
- *	.short	2f-0f		@ offset of 'test_after2' (if relevent)
+ *	.short	2f-0f		@ offset of 'test_after2' (if relevant)
  *	.short	99f-0f		@ offset of 'test_done'
  *	@ start of test case code...
  *	0:
diff --git a/arch/arm/xen/hypercall.S b/arch/arm/xen/hypercall.S
index f794dac9859a..b8b6192e310e 100644
--- a/arch/arm/xen/hypercall.S
+++ b/arch/arm/xen/hypercall.S
@@ -32,9 +32,9 @@
 
 /*
  * The Xen hypercall calling convention is very similar to the ARM
- * procedure calling convention: the first paramter is passed in r0, the
+ * procedure calling convention: the first parameter is passed in r0, the
  * second in r1, the third in r2 and the fourth in r3. Considering that
- * Xen hypercalls have 5 arguments at most, the fifth paramter is passed
+ * Xen hypercalls have 5 arguments at most, the fifth parameter is passed
  * in r4, differently from the procedure calling convention of using the
  * stack for that case.
  *
-- 
2.48.1


