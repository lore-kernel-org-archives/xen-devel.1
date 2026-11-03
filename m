Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDA1606D817
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 23:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=0zZZVuMb
Received: from list by lists.xenproject.org with outflank-mailman.1470807.1679540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xONxt-0003xV-Tu; Tue, 03 Nov 2026 23:30:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470807.1679540; Tue, 03 Nov 2026 23:30:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xONxs-0003s8-Gi; Tue, 03 Nov 2026 23:30:52 +0000
Received: by outflank-mailman (input) for mailman id 1470807;
 Tue, 03 Nov 2026 23:30:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xONxc-0000do-FR
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 23:30:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xONxc-0000000Covg-1eHq;
 Tue, 03 Nov 2026 23:30:36 +0000
Received: from [2607:fb91:4c8c:bd3f:1da5:e92a:c5fb:865a]
 (helo=localhost.localdomain)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xONoG-0000000EMFa-0CcU;
 Tue, 03 Nov 2026 23:20:56 +0000
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
	bh=DkoUGAtm2uD3yJT2Of+9zcbopY7hys4Hst7tr895h8s=; b=0zZZVuMbiTzSgULRHdyHIFL1nu
	JaOS1K6nBf0PCpyp7d5Tig3pUeuBzD94xkenpFTP2LIma4RNkDHkbDI5gVYdGJr497IajtC/7sMhi
	YiV6okeH+AQbg6PwplJQPcQIt6hy2zNZh725Cbgd501EmdscmeH9oUzcx0n/40cs1+NU=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v6 43/44] x86/domain: restore FPU state after switching to the new page tables
Date: Tue,  3 Nov 2026 17:14:05 -0500
Message-ID: <20261103-asi-hvm-v6-43-59dbc5ce9615@xenproject.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103-asi-hvm-v6-0-59dbc5ce9615@xenproject.org>
References: <20261103-asi-hvm-v6-0-59dbc5ce9615@xenproject.org>
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
index 66d71ec41b..8222ad9e2a 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2267,7 +2267,6 @@ static void __context_switch(void)
             if ( cpu_has_xsaves && is_hvm_vcpu(n) )
                 set_msr_xss(n->arch.msrs->xss.raw);
         }
-        vcpu_restore_fpu(n);
         nd->arch.ctxt_switch->to(n);
     }
 
@@ -2283,7 +2282,10 @@ static void __context_switch(void)
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


