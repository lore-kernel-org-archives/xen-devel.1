Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8761C88E4C
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 08:43:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416007.1645178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4wr9-0000c5-2B; Fri, 11 Sep 2026 08:43:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416007.1645178; Fri, 11 Sep 2026 08:43:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4wr8-0000by-V1; Fri, 11 Sep 2026 08:43:34 +0000
Received: by outflank-mailman (input) for mailman id 1416007;
 Fri, 11 Sep 2026 08:43:33 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1x4wr7-0000bY-8S
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 08:43:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4wr6-00AnFg-8f
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 10:43:32 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6aa3bf25-bab6-0a2a0a5309dd-0a2a4507940c-46
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 10:43:32 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6aa3bf34-b4ea-0a2a45070019-c387df83884a-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 10:43:32 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 98F131FA79;
 Fri, 11 Sep 2026 08:43:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 11536132D3;
 Fri, 11 Sep 2026 08:43:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id tXzkAiu/o2odFgAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 11 Sep 2026 08:43:23 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789116207; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y/JsZQGyUXG2PbaQKxJnt1DssgKzKUnZGz0wBmIldJU=;
	b=K2ym+chdvp4AOLx7hkxPAOXGGkVqFjIwBO9J5eYiDHaqbG0tAeUekjwPw1enesmOmkvpbb
	60J62JjW2kbAONrRWP2I4xEvPu2HolP1M+HFk/LKa50fHZp6nuQTkaBSMvDwaXGYKL+Mag
	GcRxrTsJHmSDk3XBZtwilU2ydL4nGmM=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789116203; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y/JsZQGyUXG2PbaQKxJnt1DssgKzKUnZGz0wBmIldJU=;
	b=FbfwFv85BO4Lxu6VbQS451GwDDEmZSiFnVhP+ZEMXMkCC4ikbs9v0r/FjQR3mWFpjf0TmZ
	L7QidEp3rxrjzR1mcTx3zjxQjYzGnTk8S4X2HyKk3oxdwLdM0rUhIobEQUL6hT/voPzpLw
	GEhuzD1Hyktm7Yj3T5pIddq8QY0s1VQ=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	virtualization@lists.linux.dev
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v5 12/17] x86/paravirt: Split off MSR related hooks into new header
Date: Fri, 11 Sep 2026 10:42:06 +0200
Message-ID: <20260911084211.3149957-13-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911084211.3149957-1-jgross@suse.com>
References: <20260911084211.3149957-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLfdszjqhz8kzzb9uwpzdm8png)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-purgate-ID: tlsNG-ef75cf/1789116212-A64DBAE4-5D0BC8C6/0/0
X-purgate-type: clean
X-purgate-size: 8115

Move the WRMSR, RDMSR and RDPMC related parts of paravirt.h and
paravirt_types.h into a new header file paravirt-msr.h.

Switch all moved helper functions to __always_inline.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
V4:
- always use __always_inline
---
 arch/x86/include/asm/msr.h            |  2 +-
 arch/x86/include/asm/paravirt-msr.h   | 56 +++++++++++++++++++++++++++
 arch/x86/include/asm/paravirt.h       | 55 --------------------------
 arch/x86/include/asm/paravirt_types.h | 13 -------
 arch/x86/kernel/paravirt.c            | 14 ++++---
 arch/x86/xen/enlighten_pv.c           | 11 +++---
 tools/objtool/check.c                 |  1 +
 7 files changed, 73 insertions(+), 79 deletions(-)
 create mode 100644 arch/x86/include/asm/paravirt-msr.h

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index fb1027dc7f64..f7ad6d25bb65 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -323,7 +323,7 @@ static inline u64 native_read_pmc(int counter)
 }
 
 #ifdef CONFIG_PARAVIRT_XXL
-#include <asm/paravirt.h>
+#include <asm/paravirt-msr.h>
 #else
 static __always_inline u64 read_msr(u32 msr)
 {
diff --git a/arch/x86/include/asm/paravirt-msr.h b/arch/x86/include/asm/paravirt-msr.h
new file mode 100644
index 000000000000..3e31648316a8
--- /dev/null
+++ b/arch/x86/include/asm/paravirt-msr.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_X86_PARAVIRT_MSR_H
+#define _ASM_X86_PARAVIRT_MSR_H
+
+#include <asm/paravirt_types.h>
+
+struct pv_msr_ops {
+	/* Unsafe MSR operations.  These will warn or panic on failure. */
+	u64 (*read_msr)(u32 msr);
+	void (*write_msr)(u32 msr, u64 val);
+
+	/* Safe MSR operations.  Returns 0 or -EIO. */
+	int (*read_msr_safe)(u32 msr, u64 *val);
+	int (*write_msr_safe)(u32 msr, u64 val);
+
+	u64 (*read_pmc)(int counter);
+} __no_randomize_layout;
+
+extern struct pv_msr_ops pv_ops_msr;
+
+static __always_inline u64 read_msr(u32 msr)
+{
+	return PVOP_CALL1(u64, pv_ops_msr, read_msr, msr);
+}
+
+static __always_inline void write_msr(u32 msr, u64 val)
+{
+	PVOP_VCALL2(pv_ops_msr, write_msr, msr, val);
+}
+
+static __always_inline void write_msrns(u32 msr, u64 val)
+{
+	PVOP_VCALL2(pv_ops_msr, write_msr, msr, val);
+}
+
+static __always_inline int read_msr_safe(u32 msr, u64 *val)
+{
+	return PVOP_CALL2(int, pv_ops_msr, read_msr_safe, msr, val);
+}
+
+static __always_inline int write_msr_safe(u32 msr, u64 val)
+{
+	return PVOP_CALL2(int, pv_ops_msr, write_msr_safe, msr, val);
+}
+
+static __always_inline int write_msrns_safe(u32 msr, u64 val)
+{
+	return PVOP_CALL2(int, pv_ops_msr, write_msr_safe, msr, val);
+}
+
+static __always_inline u64 rdpmc(int counter)
+{
+	return PVOP_CALL1(u64, pv_ops_msr, read_pmc, counter);
+}
+
+#endif /* _ASM_X86_PARAVIRT_MSR_H */
diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index b0c740316cf7..eb16d55f94d3 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -130,61 +130,6 @@ static inline void __write_cr4(unsigned long x)
 	PVOP_VCALL1(pv_ops, cpu.write_cr4, x);
 }
 
-static inline u64 paravirt_read_msr(u32 msr)
-{
-	return PVOP_CALL1(u64, pv_ops, cpu.read_msr, msr);
-}
-
-static inline void paravirt_write_msr(u32 msr, u64 val)
-{
-	PVOP_VCALL2(pv_ops, cpu.write_msr, msr, val);
-}
-
-static inline int paravirt_read_msr_safe(u32 msr, u64 *val)
-{
-	return PVOP_CALL2(int, pv_ops, cpu.read_msr_safe, msr, val);
-}
-
-static inline int paravirt_write_msr_safe(u32 msr, u64 val)
-{
-	return PVOP_CALL2(int, pv_ops, cpu.write_msr_safe, msr, val);
-}
-
-static __always_inline u64 read_msr(u32 msr)
-{
-	return paravirt_read_msr(msr);
-}
-
-static inline void write_msr(u32 msr, u64 val)
-{
-	paravirt_write_msr(msr, val);
-}
-
-static __always_inline void write_msrns(u32 msr, u64 val)
-{
-	paravirt_write_msr(msr, val);
-}
-
-static inline int write_msr_safe(u32 msr, u64 val)
-{
-	return paravirt_write_msr_safe(msr, val);
-}
-
-static __always_inline int write_msrns_safe(u32 msr, u64 val)
-{
-	return paravirt_write_msr_safe(msr, val);
-}
-
-static __always_inline int read_msr_safe(u32 msr, u64 *p)
-{
-	return paravirt_read_msr_safe(msr, p);
-}
-
-static __always_inline u64 rdpmc(int counter)
-{
-	return PVOP_CALL1(u64, pv_ops, cpu.read_pmc, counter);
-}
-
 static inline void paravirt_alloc_ldt(struct desc_struct *ldt, unsigned entries)
 {
 	PVOP_VCALL2(pv_ops, cpu.alloc_ldt, ldt, entries);
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index b4c4a23e77a1..2459163fa196 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -58,19 +58,6 @@ struct pv_cpu_ops {
 	void (*cpuid)(unsigned int *eax, unsigned int *ebx,
 		      unsigned int *ecx, unsigned int *edx);
 
-	/* Unsafe MSR operations.  These will warn or panic on failure. */
-	u64 (*read_msr)(u32 msr);
-	void (*write_msr)(u32 msr, u64 val);
-
-	/*
-	 * Safe MSR operations.
-	 * Returns 0 or -EIO.
-	 */
-	int (*read_msr_safe)(u32 msr, u64 *val);
-	int (*write_msr_safe)(u32 msr, u64 val);
-
-	u64 (*read_pmc)(int counter);
-
 	void (*start_context_switch)(struct task_struct *prev);
 	void (*end_context_switch)(struct task_struct *next);
 #endif
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 00b59d774389..739dbfd8aadf 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -110,11 +110,6 @@ struct paravirt_patch_template pv_ops = {
 	.cpu.read_cr0		= native_read_cr0,
 	.cpu.write_cr0		= native_write_cr0,
 	.cpu.write_cr4		= native_write_cr4,
-	.cpu.read_msr		= native_read_msr,
-	.cpu.write_msr		= native_write_msr,
-	.cpu.read_msr_safe	= native_read_msr_safe,
-	.cpu.write_msr_safe	= native_write_msr_safe,
-	.cpu.read_pmc		= native_read_pmc,
 	.cpu.load_tr_desc	= native_load_tr_desc,
 	.cpu.set_ldt		= native_set_ldt,
 	.cpu.load_gdt		= native_load_gdt,
@@ -212,6 +207,15 @@ struct paravirt_patch_template pv_ops = {
 };
 
 #ifdef CONFIG_PARAVIRT_XXL
+struct pv_msr_ops pv_ops_msr = {
+	.read_msr	= native_read_msr,
+	.write_msr	= native_write_msr,
+	.read_msr_safe	= native_read_msr_safe,
+	.write_msr_safe	= native_write_msr_safe,
+	.read_pmc	= native_read_pmc,
+};
+EXPORT_SYMBOL(pv_ops_msr);
+
 NOKPROBE_SYMBOL(native_load_idt);
 #endif
 
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 2c64b388f616..bf81e84ff261 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1360,11 +1360,6 @@ asmlinkage __visible void __init xen_start_kernel(struct start_info *si)
 	pv_ops.cpu.read_cr0 = xen_read_cr0;
 	pv_ops.cpu.write_cr0 = xen_write_cr0;
 	pv_ops.cpu.write_cr4 = xen_write_cr4;
-	pv_ops.cpu.read_msr = xen_read_msr;
-	pv_ops.cpu.write_msr = xen_write_msr;
-	pv_ops.cpu.read_msr_safe = xen_read_msr_safe;
-	pv_ops.cpu.write_msr_safe = xen_write_msr_safe;
-	pv_ops.cpu.read_pmc = xen_read_pmc;
 	pv_ops.cpu.load_tr_desc = paravirt_nop;
 	pv_ops.cpu.set_ldt = xen_set_ldt;
 	pv_ops.cpu.load_gdt = xen_load_gdt;
@@ -1385,6 +1380,12 @@ asmlinkage __visible void __init xen_start_kernel(struct start_info *si)
 	pv_ops.cpu.start_context_switch = xen_start_context_switch;
 	pv_ops.cpu.end_context_switch = xen_end_context_switch;
 
+	pv_ops_msr.read_msr = xen_read_msr;
+	pv_ops_msr.write_msr = xen_write_msr;
+	pv_ops_msr.read_msr_safe = xen_read_msr_safe;
+	pv_ops_msr.write_msr_safe = xen_write_msr_safe;
+	pv_ops_msr.read_pmc = xen_read_pmc;
+
 	xen_init_irq_ops();
 
 	/*
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 464f6c9d9ff0..6c47d650b20e 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -529,6 +529,7 @@ static struct {
 } pv_ops_tables[] = {
 	{ .name = "pv_ops", },
 	{ .name = "pv_ops_lock", },
+	{ .name = "pv_ops_msr", },
 	{ .name = NULL, .idx_off = -1 }
 };
 
-- 
2.55.0


