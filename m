Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A3B606A324
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 23:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=wbvQCI/A
Received: from list by lists.xenproject.org with outflank-mailman.1470804.1679521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xONxp-0003Gr-Oi; Tue, 03 Nov 2026 23:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470804.1679521; Tue, 03 Nov 2026 23:30:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xONxo-0003CF-Na; Tue, 03 Nov 2026 23:30:48 +0000
Received: by outflank-mailman (input) for mailman id 1470804;
 Tue, 03 Nov 2026 23:30:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xONxc-0000dS-BI
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 23:30:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xONxc-0000000Cov0-0w8D;
 Tue, 03 Nov 2026 23:30:36 +0000
Received: from [2607:fb91:4c8c:bd3f:1da5:e92a:c5fb:865a]
 (helo=localhost.localdomain)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xONo4-0000000EMFa-2viA;
 Tue, 03 Nov 2026 23:20:44 +0000
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
	bh=x3Vx8q2pS91S3VIbmLZaIAr7uWnHJgNTJ/Nzz6y5x7k=; b=wbvQCI/AKOeHsMMV8YDR6d+O+i
	wcQfJ59sX90HfnIR+e2NYtcVK8N+/sZrDPi1gnCubI/xaC9loStf9App35e6PbyaDj39wmLkuQq44
	Bphh6KMQg9/Gks66bMmehJyBAOqtvdwzddlb8E+6kIEB6K4EewkvCSOVPYMw+rDkYiI8=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v6 28/44] x86/svm: drop svm_vmcb_dump()'s paddr
Date: Tue,  3 Nov 2026 17:13:50 -0500
Message-ID: <20261103-asi-hvm-v6-28-59dbc5ce9615@xenproject.org>
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

svm_vmcb_dump() prints virt_to_maddr() of the VMCB, which is right only
while VMCBs are reached through the directmap.  Print the virtual
address alone.

This prepares for moving VMCBs off always-mapped memory.

Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
CC: Ross Lagerwall <ross.lagerwall@citrix.com>

Changes in v5:
- Keep VCPU_svm_vmcb: svm_asm_do_resume() now uses it, since
  df8d101a3854 ("x86/svm: Work around VMRUN's corruption of
  VMCB.INTR_SHADOW") in staging.
- Retitle (was: "x86/svm: drop svm_vmcb_dump()'s paddr and the unused
  VCPU_svm_vmcb").

Changes in v4:
- New in this version.
---
 xen/arch/x86/hvm/svm/vmcb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 5e193be9cd..21005dc57f 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -280,8 +280,8 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
         svm_sync_vmcb(curr, vmcb_in_sync);
 
     printk("Dumping guest's current state at %s...\n", from);
-    printk("Size of VMCB = %zu, paddr = %"PRIpaddr", vaddr = %p\n",
-           sizeof(struct vmcb_struct), virt_to_maddr(vmcb), vmcb);
+    printk("Size of VMCB = %zu, vaddr = %p\n",
+           sizeof(struct vmcb_struct), vmcb);
 
     printk("cr_intercepts = %#x dr_intercepts = %#x "
            "exception_intercepts = %#x\n",
-- 
2.56.0


