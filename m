Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C15606A320
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 21:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=JG0I/F5E
Received: from list by lists.xenproject.org with outflank-mailman.1497015.1695326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9MJ-0001rK-Au; Thu, 19 Nov 2026 21:07:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497015.1695326; Thu, 19 Nov 2026 21:07:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9MJ-0001r8-7O; Thu, 19 Nov 2026 21:07:55 +0000
Received: by outflank-mailman (input) for mailman id 1497015;
 Thu, 19 Nov 2026 21:07:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xU9MH-0001aD-Ge
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 21:07:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9MG-00000006spW-2BnM;
 Thu, 19 Nov 2026 21:07:52 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9MG-0000000CVBH-2WfO;
 Thu, 19 Nov 2026 21:07:52 +0000
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
	bh=1skpsV1b2ZOyD148I7gOD6OP0JnbmLzJMFRON5POrPo=; b=JG0I/F5EzYqvTpHBS1JmgwaZOb
	eVJ7Nm5CeyE7yzv6kSBXnCC9OO0OjX1m/DEXF/0NMyH82ZTLL+Km5HrgezsiEsKA4ggPO1E/MuJ6B
	GUExyHQAmZz9WHdRI4B5NhnPGIHqraeI/ZwQoIlhM0wOJAlUQ3P6qzUx5NpccNJSYm1U=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v7 05/50] x86/svm: Pass struct vcpu to svm_vmcb_dump()
Date: Thu, 19 Nov 2026 21:06:56 +0000
Message-ID: <20261119-asi-hvm-v7-5-6551b6d5c879@xenproject.org>
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

svm_vmcb_dump() prints virt_to_maddr() of the VMCB it's passed, which
is right only while VMCBs are reached through the directmap.  Pass
instead the vcpu, fish out the physical address from that, and map it
ourselves.

This prepares for moving VMCBs off the xenheap.

Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
CC: Ross Lagerwall <ross.lagerwall@citrix.com>

Changes in v7:
- Rebase over "x86/svm: Drop 'struct' from the vmcb_struct type".
- Pass `struct vcpu` so that we can print the paddr (Jan Beulich).
- Retitle (was: "x86/svm: drop svm_vmcb_dump()'s paddr").
- Assert in svm_vmexit_handler() that its vmcb is still the vCPU's
  before dumping it.
- Message: VMCBs move off the xenheap.

Changes in v5:
- Keep VCPU_svm_vmcb: svm_asm_do_resume() now uses it, since
  df8d101a3854 ("x86/svm: Work around VMRUN's corruption of
  VMCB.INTR_SHADOW") in staging.
- Retitle (was: "x86/svm: drop svm_vmcb_dump()'s paddr and the unused
  VCPU_svm_vmcb").

Changes in v4:
- New in this version.
---
 xen/arch/x86/hvm/svm/svm.c  |  3 ++-
 xen/arch/x86/hvm/svm/vmcb.c | 19 ++++++++++++-------
 xen/arch/x86/hvm/svm/vmcb.h |  2 +-
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 6419f3011e..a846328802 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2693,7 +2693,8 @@ void asmlinkage svm_vmexit_handler(void)
     if ( unlikely(exit_reason == VMEXIT_INVALID) )
     {
         gdprintk(XENLOG_ERR, "invalid VMCB state:\n");
-        svm_vmcb_dump(__func__, vmcb);
+        ASSERT(vmcb == v->arch.hvm.svm.vmcb);
+        svm_vmcb_dump(__func__, v);
         domain_crash(v->domain);
         goto out;
     }
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 5c893fde95..bbeee4ec67 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -268,20 +268,26 @@ static void svm_dump_sel(const char *name, const struct segment_register *s)
            name, s->sel, s->attr, s->limit, s->base);
 }
 
-void svm_vmcb_dump(const char *from, const struct vmcb *vmcb)
+void svm_vmcb_dump(const char *from, const struct vcpu *v)
 {
     struct vcpu *curr = current;
+    paddr_t pa = v->arch.hvm.svm.vmcb_pa;
+    struct vmcb *vmcb = SVM_MAP_VMCB_ONE(v, v->arch.hvm.svm.vmcb, pa);
 
     /*
      * If we are dumping the VMCB currently in context, some guest state may
      * still be cached in hardware.  Retrieve it.
      */
-    if ( vmcb == curr->arch.hvm.svm.vmcb )
+    if ( v == curr )
         svm_sync_vmcb(curr, vmcb_in_sync);
 
     printk("Dumping guest's current state at %s...\n", from);
+    /*
+     * Always print the vaddr from the vcpu struct; the local vmcb
+     * pointer variable may be a transient mapping.
+     */
     printk("Size of VMCB = %zu, paddr = %"PRIpaddr", vaddr = %p\n",
-           sizeof(struct vmcb), virt_to_maddr(vmcb), vmcb);
+           sizeof(struct vmcb), pa, v->arch.hvm.svm.vmcb);
 
     printk("cr_intercepts = %#x dr_intercepts = %#x "
            "exception_intercepts = %#x\n",
@@ -343,6 +349,8 @@ void svm_vmcb_dump(const char *from, const struct vmcb *vmcb)
     svm_dump_sel("LDTR", &vmcb->ldtr);
     svm_dump_sel("IDTR", &vmcb->idtr);
     svm_dump_sel("  TR", &vmcb->tr);
+
+    SVM_UNMAP_VMCB(v, vmcb);
 }
 
 bool svm_vmcb_isvalid(
@@ -425,7 +433,6 @@ static void cf_check vmcb_dump(unsigned char ch)
 {
     struct domain *d;
     struct vcpu *v;
-    struct vmcb *vmcb;
 
     printk("*********** VMCB Areas **************\n");
 
@@ -444,9 +451,7 @@ static void cf_check vmcb_dump(unsigned char ch)
                 continue;
             }
             printk("\tVCPU %d\n", v->vcpu_id);
-            vmcb = SVM_MAP_VMCB(v);
-            svm_vmcb_dump("key_handler", vmcb);
-            SVM_UNMAP_VMCB(v, vmcb);
+            svm_vmcb_dump("key_handler", v);
 
             process_pending_softirqs();
         }
diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
index 2ffb6b1b99..070a44ff6c 100644
--- a/xen/arch/x86/hvm/svm/vmcb.h
+++ b/xen/arch/x86/hvm/svm/vmcb.h
@@ -561,7 +561,7 @@ int  svm_create_vmcb(struct vcpu *v);
 void svm_destroy_vmcb(struct vcpu *v);
 
 void setup_vmcb_dump(void);
-void svm_vmcb_dump(const char *from, const struct vmcb *vmcb);
+void svm_vmcb_dump(const char *from, const struct vcpu *v);
 bool svm_vmcb_isvalid(const char *from, const struct vmcb *vmcb,
                       const struct vcpu *v, bool verbose);
 
-- 
2.56.0


