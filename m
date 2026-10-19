Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABFE606A31F
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 19:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=tod2/hna
Received: from list by lists.xenproject.org with outflank-mailman.1454841.1668424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItS4-0004r4-QY; Mon, 19 Oct 2026 19:55:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454841.1668424; Mon, 19 Oct 2026 19:55:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItS4-0004lt-AI; Mon, 19 Oct 2026 19:55:20 +0000
Received: by outflank-mailman (input) for mailman id 1454841;
 Mon, 19 Oct 2026 19:55:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xItRz-0003hY-Jt
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 19:55:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItRz-000000022yW-2GmY;
 Mon, 19 Oct 2026 19:55:15 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItGr-00000001FjN-1qeb;
 Mon, 19 Oct 2026 19:43:45 +0000
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
	bh=WXccehmoUo316LnD9XW5/ndVjuvHxgbNQjKqxh2kxOI=; b=tod2/hnaQFr59FD07ZjAE2NgIJ
	LraLVV9STvXUDhkjdyGXCiHO9lB/NP4MKcMy0CE3a1LD8ZezfoxsWBWBn/wefms9gzlOhFt3QuGNX
	D755nVMWCflmOJfbIDgLm0Sc5w7RiozLi28V9xBe1plK9CY+Ze6uiHdfER7nx5uUHhuw=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v4 28/30] x86/svm: drop svm_vmcb_dump()'s paddr and the unused VCPU_svm_vmcb
Date: Mon, 19 Oct 2026 20:42:59 +0100
Message-ID: <20261019-asi-hvm-v4-28-b68b66652266@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019-asi-hvm-v4-0-b68b66652266@xenproject.org>
References: <20261019-asi-hvm-v4-0-b68b66652266@xenproject.org>
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

Nothing uses the VCPU_svm_vmcb asm-offset: assembly only consumes
VCPU_svm_vmcb_pa.  Drop it.

Both prepare for moving VMCBs off always-mapped memory.

Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v4:
- New in this version.
---
 xen/arch/x86/hvm/svm/vmcb.c       | 4 ++--
 xen/arch/x86/x86_64/asm-offsets.c | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 4c48bbc76d..f5321b03fb 100644
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
diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-offsets.c
index 0549fd5e8d..c5259de604 100644
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -118,7 +118,6 @@ void __dummy__(void)
 
 #ifdef CONFIG_HVM
     OFFSET(VCPU_svm_vmcb_pa, struct vcpu, arch.hvm.svm.vmcb_pa);
-    OFFSET(VCPU_svm_vmcb, struct vcpu, arch.hvm.svm.vmcb);
     BLANK();
 
     OFFSET(VCPU_vmx_launched, struct vcpu, arch.hvm.vmx.launched);
-- 
2.55.0


