Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA83606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 23:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=LNhda0lc
Received: from list by lists.xenproject.org with outflank-mailman.1463803.1674696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMD6c-0007eR-Je; Wed, 28 Oct 2026 23:30:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463803.1674696; Wed, 28 Oct 2026 23:30:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMD6a-0007ZM-Sk; Wed, 28 Oct 2026 23:30:52 +0000
Received: by outflank-mailman (input) for mailman id 1463803;
 Wed, 28 Oct 2026 23:30:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xMD6L-00049S-6H
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 23:30:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMD6L-00000000pQT-1FKD;
 Wed, 28 Oct 2026 23:30:37 +0000
Received: from [217.155.165.12] (helo=Mac.fritz.box.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMCjp-00000001KpM-3mRa;
 Wed, 28 Oct 2026 23:07:22 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=IteVxGd7849ZKEuwZ+hgHhRePArJlWdr2co4VC0Lmas=; b=LNhda0lc5wqv4nnzd4y0DOMRGq
	vKOvo3jJYjZL2/Zqcjs6lB9v4QY3Dx6zi/JVJ1SvBoLT8ncHu2hCe35COlprlZ2RfkbuysdGmQ6E0
	QY5q2az3WmPS6c3d0h3nLj3IWatihHCSuTLv5MN4o8w34iYHhlb537WiOzEw1THBN2MI=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v5 44/45] x86/domain: restore FPU state after switching to the new page tables
Date: Wed, 28 Oct 2026 23:05:58 +0000
Message-ID: <20261028-asi-hvm-v5-44-13b908e0df0b@xenproject.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028-asi-hvm-v5-0-13b908e0df0b@xenproject.org>
References: <20261028-asi-hvm-v5-0-13b908e0df0b@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

__context_switch() restores the incoming vCPU's FPU state
(vcpu_restore_fpu(n)) while still running on the outgoing vCPU's page
tables, before write_ptbase(n).  That dereferences n's XSAVE area
through whatever address it happens to have in p's address space --
fine today, when the area is globally mapped, but not once guest XSAVE
state moves to a per-vCPU mapping that need not exist in another vCPU's
address space (upcoming Address Space Isolation work).

Move the eager restore to just after write_ptbase(n), so it runs with
n's page tables loaded.  The XCR0/XSS setup stays where it is (it
programs control registers / an MSR, independent of the page tables,
and XSS must be set before the supervisor-state xrstor).  Nothing
between the save and the new restore point touches guest FPU state:
the ctxt_switch->to() hooks, psr and GDT handling are all FPU-free,
and Xen is built without SSE.

No functional change with the current global XSAVE-area mapping.

Assisted-by: Claude Code:claude-opus-4-8
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v5:
- New in this version.
---
 xen/arch/x86/domain.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 397508a313..e57a99504b 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2261,7 +2261,6 @@ static void __context_switch(void)
             if ( cpu_has_xsaves && is_hvm_vcpu(n) )
                 set_msr_xss(n->arch.msrs->xss.raw);
         }
-        vcpu_restore_fpu(n);
         nd->arch.ctxt_switch->to(n);
     }
 
@@ -2277,7 +2276,10 @@ static void __context_switch(void)
     write_ptbase(n);
 
     if ( !is_idle_domain(nd) )
+    {
         memcpy(stack_regs, vcpu_user_regs(n), CTXT_SWITCH_STACK_BYTES);
+        vcpu_restore_fpu(n);
+    }
 
 #ifdef CONFIG_PV
     /* Prefetch the VMCB if we expect to use it later in the context switch */
-- 
2.56.0


