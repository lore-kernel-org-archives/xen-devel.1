Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C697606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 23:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=GJGBBUha
Received: from list by lists.xenproject.org with outflank-mailman.1463787.1674573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMD6O-0004Za-3d; Wed, 28 Oct 2026 23:30:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463787.1674573; Wed, 28 Oct 2026 23:30:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMD6N-0004V2-Tz; Wed, 28 Oct 2026 23:30:39 +0000
Received: by outflank-mailman (input) for mailman id 1463787;
 Wed, 28 Oct 2026 23:30:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xMD6K-00047z-MY
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 23:30:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMD6K-00000000pNx-1lM3;
 Wed, 28 Oct 2026 23:30:36 +0000
Received: from [217.155.165.12] (helo=Mac.fritz.box.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMCjb-00000001KpM-0c14;
 Wed, 28 Oct 2026 23:07:07 +0000
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
	bh=x3Vx8q2pS91S3VIbmLZaIAr7uWnHJgNTJ/Nzz6y5x7k=; b=GJGBBUhazwLI1pIZEQMb4WxmYe
	5ltdacPokxGJtkWZJ596SQy6OJoH8NxWMlkXkksXGLoekxC7QgOOX6SALu+R82bN+AAz2AcTtnz0c
	ryTUVky/v2ZHpd5CgbcMIdiYuQ/UEIZJHpAhOtFY6fQsO7lKz24lp2c3DjzblyOvulK4=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v5 29/45] x86/svm: drop svm_vmcb_dump()'s paddr
Date: Wed, 28 Oct 2026 23:05:43 +0000
Message-ID: <20261028-asi-hvm-v5-29-13b908e0df0b@xenproject.org>
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


