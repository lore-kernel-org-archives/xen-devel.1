Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F09606A32A
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 21:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=LHSSTvVy
Received: from list by lists.xenproject.org with outflank-mailman.1497119.1695450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9i5-0002ZT-T4; Thu, 19 Nov 2026 21:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497119.1695450; Thu, 19 Nov 2026 21:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9i5-0002WF-8C; Thu, 19 Nov 2026 21:30:25 +0000
Received: by outflank-mailman (input) for mailman id 1497119;
 Thu, 19 Nov 2026 21:30:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xU9hz-0001Cb-8y
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 21:30:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9hy-00000006tHD-3YjF;
 Thu, 19 Nov 2026 21:30:19 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9MV-0000000CVBH-2aJV;
 Thu, 19 Nov 2026 21:08:07 +0000
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
	bh=Y4mhj3jCPZOoipEGwmPIT9w36kLKqqmGJrKUF7TJVS4=; b=LHSSTvVyEByN1kFPCbtAWb/kVy
	MOz8ww3dT38SYzqyzl51YPD3Czv+KLeBNkzK7nDyT5ATdaQ0Ay1wg4NyFC4IGkBjxFFO3+g7oNZbT
	nu2nTuVju21lXknCwRubbZqcBmad6mhJ+ApLWFphInz5rIQp2aVtI0vkoHwBe4pAQbAY=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v7 20/50] x86/domain: restore FPU state after switching to the new page tables
Date: Thu, 19 Nov 2026 21:07:11 +0000
Message-ID: <20261119-asi-hvm-v7-20-6551b6d5c879@xenproject.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119-asi-hvm-v7-0-6551b6d5c879@xenproject.org>
References: <20261119-asi-hvm-v7-0-6551b6d5c879@xenproject.org>
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
index e605936797..a71c11cf52 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2255,7 +2255,6 @@ static void __context_switch(void)
             if ( cpu_has_xsaves && is_hvm_vcpu(n) )
                 set_msr_xss(n->arch.msrs->xss.raw);
         }
-        vcpu_restore_fpu(n);
         nd->arch.ctxt_switch->to(n);
     }
 
@@ -2271,7 +2270,10 @@ static void __context_switch(void)
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


