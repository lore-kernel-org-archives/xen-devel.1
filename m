Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1227CD5BB1
	for <xen-devel@archiver.kernel.org>; Tue, 26 May 2026 15:08:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1320030.1587464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRtOR-0008CW-Cl; Tue, 26 May 2026 15:08:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320030.1587464; Tue, 26 May 2026 15:08:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRtOR-0008CP-9H; Tue, 26 May 2026 15:08:31 +0000
Received: by outflank-mailman (input) for mailman id 1320030;
 Tue, 26 May 2026 15:08:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wRtOQ-000883-HH
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 15:08:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRtOP-004Daz-SX
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 17:08:29 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a15b76a-bab6-0a2a0a5309dd-0a2a450b967c-8
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 17:08:29 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 6a15b76d-212f-0a2a450b0019-c387df82af78-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 17:08:29 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 76EF06B4EB;
 Tue, 26 May 2026 15:08:29 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3AF225A27D;
 Tue, 26 May 2026 15:08:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id k7hNDW23FWrFVQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 26 May 2026 15:08:29 +0000
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
	t=1779808109; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pt9GbUbcaD67j5AZ7mMspgj0EXB/Dgj0oV0yVnH+lpQ=;
	b=Lv6+OtYc0uGqB6j7HELQQ0r2+99m0fxwA2+9PL5fCUZqn2aws3QbxX8kYNiGxCXKxZdHSa
	Vz5ppkYQAfprJooaY8qKaRVQ/qVbD7rLZf7Dta2MmPw7dhfrKCHbVq56GzzQtf2dHjSXG5
	5ruzN89C6u4FfTYP848Hc6TIvu9lVDE=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Lv6+OtYc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1779808109; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pt9GbUbcaD67j5AZ7mMspgj0EXB/Dgj0oV0yVnH+lpQ=;
	b=Lv6+OtYc0uGqB6j7HELQQ0r2+99m0fxwA2+9PL5fCUZqn2aws3QbxX8kYNiGxCXKxZdHSa
	Vz5ppkYQAfprJooaY8qKaRVQ/qVbD7rLZf7Dta2MmPw7dhfrKCHbVq56GzzQtf2dHjSXG5
	5ruzN89C6u4FfTYP848Hc6TIvu9lVDE=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 5/5] x86/xen: Replace generic lazy tracking with cpu specific one
Date: Tue, 26 May 2026 17:05:14 +0200
Message-ID: <20260526150514.129330-6-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526150514.129330-1-jgross@suse.com>
References: <20260526150514.129330-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 76EF06B4EB
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	URIBL_BLOCKED(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[10];
	DWL_DNSWL_BLOCKED(0.00)[suse.com:dkim];
	R_RATELIMIT(0.00)[to_ip_from(RLkdkdrsxe9hqhhs5ask8616i6)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-purgate-ID: tlsNG-42698a/1779808109-18D67F3B-3DFB2A6C/0/0
X-purgate-type: clean
X-purgate-size: 5501

Now that lazy mmu state tracking no longer relies on the Xen specific
one, cpu lazy mode is the only user of the Xen generic lazy tracking.

Replace the Xen generic lazy tracking with a cpu lazy specific one.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/xen/hypervisor.h | 25 +------------------------
 arch/x86/xen/enlighten_pv.c           | 23 ++++++++++-------------
 arch/x86/xen/mmu_pv.c                 |  6 +++---
 3 files changed, 14 insertions(+), 40 deletions(-)

diff --git a/arch/x86/include/asm/xen/hypervisor.h b/arch/x86/include/asm/xen/hypervisor.h
index c2fc7869b996..f666637d773e 100644
--- a/arch/x86/include/asm/xen/hypervisor.h
+++ b/arch/x86/include/asm/xen/hypervisor.h
@@ -64,30 +64,7 @@ void __init xen_pvh_init(struct boot_params *boot_params);
 void __init mem_map_via_hcall(struct boot_params *boot_params_p);
 #endif
 
-/* Lazy mode for batching updates / context switch */
-enum xen_lazy_mode {
-	XEN_LAZY_NONE,
-	XEN_LAZY_MMU,
-	XEN_LAZY_CPU,
-};
-
-DECLARE_PER_CPU(enum xen_lazy_mode, xen_lazy_mode);
-
-static inline void enter_lazy(enum xen_lazy_mode mode)
-{
-	BUG_ON(this_cpu_read(xen_lazy_mode) != XEN_LAZY_NONE);
-
-	this_cpu_write(xen_lazy_mode, mode);
-}
-
-static inline void leave_lazy(enum xen_lazy_mode mode)
-{
-	BUG_ON(this_cpu_read(xen_lazy_mode) != mode);
-
-	this_cpu_write(xen_lazy_mode, XEN_LAZY_NONE);
-}
-
-enum xen_lazy_mode xen_get_lazy_mode(void);
+bool xen_is_cpu_lazy_mode(void);
 
 #if defined(CONFIG_XEN_DOM0) && defined(CONFIG_ACPI)
 void xen_sanitize_proc_cap_bits(uint32_t *buf);
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 8ee4910d597a..b310b91f2994 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -138,14 +138,11 @@ struct tls_descs {
 	struct desc_struct desc[3];
 };
 
-DEFINE_PER_CPU(enum xen_lazy_mode, xen_lazy_mode) = XEN_LAZY_NONE;
+static DEFINE_PER_CPU(bool, xen_cpu_lazy_mode);
 
-enum xen_lazy_mode xen_get_lazy_mode(void)
+bool xen_is_cpu_lazy_mode(void)
 {
-	if (in_interrupt())
-		return XEN_LAZY_NONE;
-
-	return this_cpu_read(xen_lazy_mode);
+	return !in_interrupt() && this_cpu_read(xen_cpu_lazy_mode);
 }
 
 /*
@@ -425,7 +422,7 @@ static void xen_start_context_switch(struct task_struct *prev)
 	BUG_ON(preemptible());
 
 	__task_lazy_mmu_mode_pause(prev);
-	enter_lazy(XEN_LAZY_CPU);
+	this_cpu_write(xen_cpu_lazy_mode, true);
 }
 
 static void xen_end_context_switch(struct task_struct *next)
@@ -433,7 +430,7 @@ static void xen_end_context_switch(struct task_struct *next)
 	BUG_ON(preemptible());
 
 	xen_mc_flush();
-	leave_lazy(XEN_LAZY_CPU);
+	this_cpu_write(xen_cpu_lazy_mode, false);
 	__task_lazy_mmu_mode_resume(next);
 }
 
@@ -541,7 +538,7 @@ static void xen_set_ldt(const void *addr, unsigned entries)
 
 	MULTI_mmuext_op(mcs.mc, op, 1, NULL, DOMID_SELF);
 
-	xen_mc_issue(xen_get_lazy_mode() != XEN_LAZY_CPU);
+	xen_mc_issue(!xen_is_cpu_lazy_mode());
 }
 
 static void xen_load_gdt(const struct desc_ptr *dtr)
@@ -637,7 +634,7 @@ static void xen_load_tls(struct thread_struct *t, unsigned int cpu)
 	 * exception between the new %fs descriptor being loaded and
 	 * %fs being effectively cleared at __switch_to().
 	 */
-	if (xen_get_lazy_mode() == XEN_LAZY_CPU)
+	if (xen_is_cpu_lazy_mode())
 		loadsegment(fs, 0);
 
 	xen_mc_batch();
@@ -646,7 +643,7 @@ static void xen_load_tls(struct thread_struct *t, unsigned int cpu)
 	load_TLS_descriptor(t, cpu, 1);
 	load_TLS_descriptor(t, cpu, 2);
 
-	xen_mc_issue(xen_get_lazy_mode() != XEN_LAZY_CPU);
+	xen_mc_issue(!xen_is_cpu_lazy_mode());
 }
 
 static void xen_load_gs_index(unsigned int idx)
@@ -1008,7 +1005,7 @@ static void xen_load_sp0(unsigned long sp0)
 
 	mcs = xen_mc_entry(0);
 	MULTI_stack_switch(mcs.mc, __KERNEL_DS, sp0);
-	xen_mc_issue(xen_get_lazy_mode() != XEN_LAZY_CPU);
+	xen_mc_issue(!xen_is_cpu_lazy_mode());
 	this_cpu_write(cpu_tss_rw.x86_tss.sp0, sp0);
 }
 
@@ -1068,7 +1065,7 @@ static void xen_write_cr0(unsigned long cr0)
 
 	MULTI_fpu_taskswitch(mcs.mc, (cr0 & X86_CR0_TS) != 0);
 
-	xen_mc_issue(xen_get_lazy_mode() != XEN_LAZY_CPU);
+	xen_mc_issue(!xen_is_cpu_lazy_mode());
 }
 
 static void xen_write_cr4(unsigned long cr4)
diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index 928b4b0a4484..aab5f70d407c 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -1425,7 +1425,7 @@ static void xen_write_cr3(unsigned long cr3)
 	else
 		__xen_write_cr3(false, 0);
 
-	xen_mc_issue(xen_get_lazy_mode() != XEN_LAZY_CPU);  /* interrupts restored */
+	xen_mc_issue(!xen_is_cpu_lazy_mode());  /* interrupts restored */
 }
 
 /*
@@ -1460,7 +1460,7 @@ static void __init xen_write_cr3_init(unsigned long cr3)
 
 	__xen_write_cr3(true, cr3);
 
-	xen_mc_issue(xen_get_lazy_mode() != XEN_LAZY_CPU);  /* interrupts restored */
+	xen_mc_issue(!xen_is_cpu_lazy_mode());  /* interrupts restored */
 }
 
 static int xen_pgd_alloc(struct mm_struct *mm)
@@ -1875,7 +1875,7 @@ void __init xen_setup_kernel_pagetable(pgd_t *pgd, unsigned long max_pfn)
 	 */
 	xen_mc_batch();
 	__xen_write_cr3(true, __pa(init_top_pgt));
-	xen_mc_issue(xen_get_lazy_mode() != XEN_LAZY_CPU);
+	xen_mc_issue(!xen_is_cpu_lazy_mode());
 
 	/* We can't that easily rip out L3 and L2, as the Xen pagetables are
 	 * set out this way: [L4], [L1], [L2], [L3], [L1], [L1] ...  for
-- 
2.54.0


