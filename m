Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B593C44516
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 18:35:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364419.1615631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkQvV-00048P-K3; Thu, 16 Jul 2026 18:35:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364419.1615631; Thu, 16 Jul 2026 18:35:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkQvV-00048I-GF; Thu, 16 Jul 2026 18:35:17 +0000
Received: by outflank-mailman (input) for mailman id 1364419;
 Thu, 16 Jul 2026 18:35:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ariadne@ariadne.space>) id 1wkQvT-00048B-MJ
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 18:35:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkQvS-00Eyiq-Jc
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 20:35:14 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ariadne@ariadne.space>)
 id 6a592431-e002-0a2a0a5209dd-0a2a4501a7d2-40
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 20:35:14 +0200
Received: from [149.248.47.155] (helo=hermes.ariadne.space)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ariadne@ariadne.space>)
 id 6a592460-5984-0a2a45010019-95f82f9bb49c-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 20:35:14 +0200
Received: from helios (unknown [100.74.42.12])
 by hermes.ariadne.space (Postfix) with ESMTP id 20942268525;
 Thu, 16 Jul 2026 18:35:12 +0000 (UTC)
Received: from phoebe.taild41b8.ts.net (unknown [172.19.0.1])
 by helios (Postfix) with ESMTPSA id 0EEBD16002600D;
 Thu, 16 Jul 2026 18:35:12 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=dkim header.d=ariadne.space header.i="@ariadne.space" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ariadne.space;
	s=dkim; t=1784226912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p44kd+uQNsJxFjwWzzLjF8gAa9SqkybYEa3jfRq58go=;
	b=nsdqJ4o84owQ8ZEHT74MsQjKvFqs51BGj/N0wIfO81C6PVJ/ErX/+pn5M+3/T6tgPTn7y+
	bTAdwpg55GmvsFjzSEHf6L1yXa1XeHLrwj3Zas0d1I+ldWXvD23ED4lGWScVgYhIF9I4PZ
	vCMS7uZCD/iWPUR8arCzz6oXiy+vjx4=
From: Ariadne Conill <ariadne@ariadne.space>
To: xen-devel@lists.xenproject.org
Cc: Ariadne Conill <ariadne@ariadne.space>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v4] x86/hyperv: use dynamically allocated page for hypercalls
Date: Thu, 16 Jul 2026 11:35:02 -0700
Message-ID: <20260716183502.21075-1-ariadne@ariadne.space>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1784226914-1D47D757-39B742B3/0/0
X-purgate-type: clean
X-purgate-size: 3327

Previously, the Hyper-V guest code placed the hypercall page at a
fixed, hardcoded location: the top-most MFN of the guest physical
address space (HV_HCALL_MFN). To make this work, an e820_fixup hook
reserved that range as E820_RESERVED so nothing else would claim it.

This assumes the top-most physical frame is actually backed by RAM (or
at least mapped to something), which is not guaranteed. On Azure
compute guests it is not: the top-most MFN is not physically mapped to
anything. When we program HV_X64_MSR_HYPERCALL to point at that frame
and subsequently execute through the hypercall page via the fixmap, the
access faults and Xen panics during early boot.

Instead of guessing at a physical address, allocate a real xenheap page
and use its MFN for the hypercall page. This frame is always backed and
mapped, so the fault no longer occurs. The e820_fixup hook and the
HV_HCALL_MFN definition are no longer needed and are removed.

Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
---
 xen/arch/x86/guest/hyperv/hyperv.c      | 19 +++++++++----------
 xen/arch/x86/include/asm/guest/hyperv.h |  3 ---
 2 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/guest/hyperv/hyperv.c b/xen/arch/x86/guest/hyperv/hyperv.c
index 90757e0793..d98d02fb80 100644
--- a/xen/arch/x86/guest/hyperv/hyperv.c
+++ b/xen/arch/x86/guest/hyperv/hyperv.c
@@ -99,10 +99,18 @@ static void __init setup_hypercall_page(void)
     rdmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
     if ( !hypercall_msr.enable )
     {
-        mfn = HV_HCALL_MFN;
+        void *hcall_page = alloc_xenheap_page();
+
+        if ( !hcall_page )
+            panic("Hyper-V: Failed to allocate hypercall trampoline page\n");
+
+        mfn = virt_to_mfn(hcall_page);
         hypercall_msr.enable = 1;
         hypercall_msr.guest_physical_address = mfn;
         wrmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
+
+        dprintk(XENLOG_INFO,
+                "Hyper-V: Allocated hypercall page at MFN %lx\n", mfn);
     }
     else
         mfn = hypercall_msr.guest_physical_address;
@@ -188,14 +196,6 @@ static int cf_check ap_setup(void)
     return setup_vp_assist();
 }
 
-static void __init cf_check e820_fixup(void)
-{
-    uint64_t s = HV_HCALL_MFN << PAGE_SHIFT;
-
-    if ( !e820_add_range(s, s + PAGE_SIZE, E820_RESERVED) )
-        panic("Unable to reserve Hyper-V hypercall range\n");
-}
-
 static int cf_check flush_tlb(
     const cpumask_t *mask, const void *va, unsigned int flags)
 {
@@ -212,7 +212,6 @@ static const struct hypervisor_ops __initconst_cf_clobber ops = {
     .name = "Hyper-V",
     .setup = setup,
     .ap_setup = ap_setup,
-    .e820_fixup = e820_fixup,
     .flush_tlb = flush_tlb,
 };
 
diff --git a/xen/arch/x86/include/asm/guest/hyperv.h b/xen/arch/x86/include/asm/guest/hyperv.h
index dabc62727b..5792e77104 100644
--- a/xen/arch/x86/include/asm/guest/hyperv.h
+++ b/xen/arch/x86/include/asm/guest/hyperv.h
@@ -10,9 +10,6 @@
 
 #include <xen/types.h>
 
-/* Use top-most MFN for hypercall page */
-#define HV_HCALL_MFN   (((1ULL << paddr_bits) - 1) >> HV_HYP_PAGE_SHIFT)
-
 /*
  * The specification says: "The partition reference time is computed
  * by the following formula:
-- 
2.54.0


