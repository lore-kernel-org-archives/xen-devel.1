Return-Path: <SRS0=Yd2Y=E2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28AD8C63798
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2020 11:46:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABC832222A
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2020 11:46:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="mWw0Ws0N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABC832222A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.31990.62845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg4sE-0004DQ-1d; Fri, 20 Nov 2020 11:46:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31990.62845; Fri, 20 Nov 2020 11:46:42 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg4sD-0004DF-TV; Fri, 20 Nov 2020 11:46:41 +0000
Received: by outflank-mailman (input) for mailman id 31990;
 Fri, 20 Nov 2020 11:46:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wRTa=E2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kg4sC-00048T-5F
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 11:46:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e2d7855c-8201-44a5-b991-dd6dab2025d5;
 Fri, 20 Nov 2020 11:46:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E646FAD72;
 Fri, 20 Nov 2020 11:46:33 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=wRTa=E2=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kg4sC-00048T-5F
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 11:46:40 +0000
X-Inumbo-ID: e2d7855c-8201-44a5-b991-dd6dab2025d5
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e2d7855c-8201-44a5-b991-dd6dab2025d5;
	Fri, 20 Nov 2020 11:46:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605872794; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DI15xw9ExyUJ7xw8dQLYWmC3PSDAqfO4l4ENDPXt7+Q=;
	b=mWw0Ws0NBqavgb45dBphRfdbFlhVmnXfWBXplGYA/FRvJK5vi2N8tlRc1IvDC3qLAxtJjW
	FN+C6T9+2sHEwpGV2HEJQT2CxFd4GiD8I0seVpnENFNj1FbuiKKkbx3lBpp6f9zW/qYDXT
	9pKdnSSIYQZhIRreOfbYufU434AZdmk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E646FAD72;
	Fri, 20 Nov 2020 11:46:33 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: peterz@infradead.org,
	luto@kernel.org,
	Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 02/12] x86/xen: use specific Xen pv interrupt entry for DF
Date: Fri, 20 Nov 2020 12:46:20 +0100
Message-Id: <20201120114630.13552-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120114630.13552-1-jgross@suse.com>
References: <20201120114630.13552-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen PV guests don't use IST. For double fault interrupts switch to
the same model as NMI.

Correct a typo in a comment while copying it.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
V2:
- fix typo (Andy Lutomirski)
---
 arch/x86/include/asm/idtentry.h |  3 +++
 arch/x86/xen/enlighten_pv.c     | 10 ++++++++--
 arch/x86/xen/xen-asm.S          |  2 +-
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/idtentry.h b/arch/x86/include/asm/idtentry.h
index 3505c0396fa5..b35825392547 100644
--- a/arch/x86/include/asm/idtentry.h
+++ b/arch/x86/include/asm/idtentry.h
@@ -611,6 +611,9 @@ DECLARE_IDTENTRY_RAW(X86_TRAP_DB,	xenpv_exc_debug);
 
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


