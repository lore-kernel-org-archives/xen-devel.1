Return-Path: <SRS0=ek7T=FV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9AA7C2BB40
	for <xen-devel@archiver.kernel.org>; Thu, 17 Dec 2020 09:32:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5918923602
	for <xen-devel@archiver.kernel.org>; Thu, 17 Dec 2020 09:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5918923602
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.55773.97187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kppdU-0006RJ-TF; Thu, 17 Dec 2020 09:31:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55773.97187; Thu, 17 Dec 2020 09:31:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kppdU-0006RC-Oj; Thu, 17 Dec 2020 09:31:48 +0000
Received: by outflank-mailman (input) for mailman id 55773;
 Thu, 17 Dec 2020 09:31:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gjir=FV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kppdT-0006R7-Nx
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 09:31:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d97c4d01-3d7d-47e1-8352-0f890596a2e5;
 Thu, 17 Dec 2020 09:31:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 08D43AC90;
 Thu, 17 Dec 2020 09:31:46 +0000 (UTC)
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
X-Inumbo-ID: d97c4d01-3d7d-47e1-8352-0f890596a2e5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608197506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PezddZt9B1as0O7QAdAa2+LbregUz6HT/ncAiFWbX44=;
	b=DVZpQtKFw1mbHOWW2Oa8umjpwXvQ8DLru5/9cePMOFKRN0fxFl0PRnfMwggcnF//of12qz
	+S57/gJSEh/PGOWLxELsA0xltbCfgnoigSs/f3djzPQlxeLmr07I6DHwijDWY5ABJ4WsQ3
	YSIyWGihHsG4YZsZYKtBtufuF8+ewAc=
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
Subject: [PATCH v3 01/15] x86/xen: use specific Xen pv interrupt entry for MCE
Date: Thu, 17 Dec 2020 10:31:19 +0100
Message-Id: <20201217093133.1507-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201217093133.1507-1-jgross@suse.com>
References: <20201217093133.1507-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen PV guests don't use IST. For machine check interrupts switch to
the same model as debug interrupts.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/include/asm/idtentry.h |  3 +++
 arch/x86/xen/enlighten_pv.c     | 16 +++++++++++++++-
 arch/x86/xen/xen-asm.S          |  2 +-
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/idtentry.h b/arch/x86/include/asm/idtentry.h
index 247a60a47331..5dd64404715a 100644
--- a/arch/x86/include/asm/idtentry.h
+++ b/arch/x86/include/asm/idtentry.h
@@ -585,6 +585,9 @@ DECLARE_IDTENTRY_MCE(X86_TRAP_MC,	exc_machine_check);
 #else
 DECLARE_IDTENTRY_RAW(X86_TRAP_MC,	exc_machine_check);
 #endif
+#ifdef CONFIG_XEN_PV
+DECLARE_IDTENTRY_RAW(X86_TRAP_MC,	xenpv_exc_machine_check);
+#endif
 #endif
 
 /* NMI */
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 4409306364dc..9f5e44c1f70a 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -583,6 +583,20 @@ DEFINE_IDTENTRY_RAW(xenpv_exc_debug)
 		exc_debug(regs);
 }
 
+#ifdef CONFIG_X86_MCE
+DEFINE_IDTENTRY_RAW(xenpv_exc_machine_check)
+{
+	/*
+	 * There's no IST on Xen PV, but we still need to dispatch
+	 * to the correct handler.
+	 */
+	if (user_mode(regs))
+		noist_exc_machine_check(regs);
+	else
+		exc_machine_check(regs);
+}
+#endif
+
 struct trap_array_entry {
 	void (*orig)(void);
 	void (*xen)(void);
@@ -603,7 +617,7 @@ static struct trap_array_entry trap_array[] = {
 	TRAP_ENTRY_REDIR(exc_debug,			true  ),
 	TRAP_ENTRY(exc_double_fault,			true  ),
 #ifdef CONFIG_X86_MCE
-	TRAP_ENTRY(exc_machine_check,			true  ),
+	TRAP_ENTRY_REDIR(exc_machine_check,		true  ),
 #endif
 	TRAP_ENTRY_REDIR(exc_nmi,			true  ),
 	TRAP_ENTRY(exc_int3,				false ),
diff --git a/arch/x86/xen/xen-asm.S b/arch/x86/xen/xen-asm.S
index 1cb0e84b9161..bc2586730a5b 100644
--- a/arch/x86/xen/xen-asm.S
+++ b/arch/x86/xen/xen-asm.S
@@ -172,7 +172,7 @@ xen_pv_trap asm_exc_spurious_interrupt_bug
 xen_pv_trap asm_exc_coprocessor_error
 xen_pv_trap asm_exc_alignment_check
 #ifdef CONFIG_X86_MCE
-xen_pv_trap asm_exc_machine_check
+xen_pv_trap asm_xenpv_exc_machine_check
 #endif /* CONFIG_X86_MCE */
 xen_pv_trap asm_exc_simd_coprocessor_error
 #ifdef CONFIG_IA32_EMULATION
-- 
2.26.2


