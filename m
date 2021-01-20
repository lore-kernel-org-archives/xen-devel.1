Return-Path: <SRS0=FMYz=GX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E441CC433E0
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 13:56:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9219923382
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 13:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9219923382
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.71380.127762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Dxw-0000o8-CU; Wed, 20 Jan 2021 13:56:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71380.127762; Wed, 20 Jan 2021 13:56:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Dxw-0000nz-8C; Wed, 20 Jan 2021 13:56:08 +0000
Received: by outflank-mailman (input) for mailman id 71380;
 Wed, 20 Jan 2021 13:56:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ap16=GX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l2Dxu-0000k4-UA
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 13:56:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 124e3f5f-0a60-49ec-a706-9e65ce4ad17e;
 Wed, 20 Jan 2021 13:56:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2CB35AE89;
 Wed, 20 Jan 2021 13:56:00 +0000 (UTC)
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
X-Inumbo-ID: 124e3f5f-0a60-49ec-a706-9e65ce4ad17e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611150960; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sHlV/W1YFbgt7ZvBN6riN3ibxVfg2lJ3Lv2QWPteOwQ=;
	b=X/jx5d/NUHCownktyTuoTE8+uHUv856Gc1U/W72xbCKhVO+2n3w9nAijRa7Tu94bA5d+Y8
	j27TjcB4H7pJDSboYfEiJQfDhQEGLzuMM2LLeHLY+2UloZph74a82zhrRyS1okJJiUbV8U
	Q/WLi3XlwVnZPBLgymQz1YwcBXPup9o=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH v4 03/15] x86/xen: use specific Xen pv interrupt entry for DF
Date: Wed, 20 Jan 2021 14:55:43 +0100
Message-Id: <20210120135555.32594-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210120135555.32594-1-jgross@suse.com>
References: <20210120135555.32594-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen PV guests don't use IST. For double fault interrupts switch to
the same model as NMI.

Correct a typo in a comment while copying it.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
---
V2:
- fix typo (Andy Lutomirski)
---
 arch/x86/include/asm/idtentry.h |  3 +++
 arch/x86/xen/enlighten_pv.c     | 10 ++++++++--
 arch/x86/xen/xen-asm.S          |  2 +-
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/idtentry.h b/arch/x86/include/asm/idtentry.h
index 5dd64404715a..3ac84cb702fc 100644
--- a/arch/x86/include/asm/idtentry.h
+++ b/arch/x86/include/asm/idtentry.h
@@ -608,6 +608,9 @@ DECLARE_IDTENTRY_RAW(X86_TRAP_DB,	xenpv_exc_debug);
 
 /* #DF */
 DECLARE_IDTENTRY_DF(X86_TRAP_DF,	exc_double_fault);
+#ifdef CONFIG_XEN_PV
+DECLARE_IDTENTRY_RAW_ERRORCODE(X86_TRAP_DF,	xenpv_exc_double_fault);
+#endif
 
 /* #VC */
 #ifdef CONFIG_AMD_MEM_ENCRYPT
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 9f5e44c1f70a..76616024129e 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -567,10 +567,16 @@ void noist_exc_debug(struct pt_regs *regs);
 
 DEFINE_IDTENTRY_RAW(xenpv_exc_nmi)
 {
-	/* On Xen PV, NMI doesn't use IST.  The C part is the sane as native. */
+	/* On Xen PV, NMI doesn't use IST.  The C part is the same as native. */
 	exc_nmi(regs);
 }
 
+DEFINE_IDTENTRY_RAW_ERRORCODE(xenpv_exc_double_fault)
+{
+	/* On Xen PV, DF doesn't use IST.  The C part is the same as native. */
+	exc_double_fault(regs, error_code);
+}
+
 DEFINE_IDTENTRY_RAW(xenpv_exc_debug)
 {
 	/*
@@ -615,7 +621,7 @@ struct trap_array_entry {
 
 static struct trap_array_entry trap_array[] = {
 	TRAP_ENTRY_REDIR(exc_debug,			true  ),
-	TRAP_ENTRY(exc_double_fault,			true  ),
+	TRAP_ENTRY_REDIR(exc_double_fault,		true  ),
 #ifdef CONFIG_X86_MCE
 	TRAP_ENTRY_REDIR(exc_machine_check,		true  ),
 #endif
diff --git a/arch/x86/xen/xen-asm.S b/arch/x86/xen/xen-asm.S
index bc2586730a5b..1d054c915046 100644
--- a/arch/x86/xen/xen-asm.S
+++ b/arch/x86/xen/xen-asm.S
@@ -161,7 +161,7 @@ xen_pv_trap asm_exc_overflow
 xen_pv_trap asm_exc_bounds
 xen_pv_trap asm_exc_invalid_op
 xen_pv_trap asm_exc_device_not_available
-xen_pv_trap asm_exc_double_fault
+xen_pv_trap asm_xenpv_exc_double_fault
 xen_pv_trap asm_exc_coproc_segment_overrun
 xen_pv_trap asm_exc_invalid_tss
 xen_pv_trap asm_exc_segment_not_present
-- 
2.26.2


