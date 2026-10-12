Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CEC3CA9EC5
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 07:35:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445855.1661715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGAYf-0005jP-Qj; Mon, 12 Oct 2026 07:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445855.1661715; Mon, 12 Oct 2026 07:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGAYf-0005jH-Kj; Mon, 12 Oct 2026 07:34:53 +0000
Received: by outflank-mailman (input) for mailman id 1445855;
 Mon, 12 Oct 2026 07:34:51 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGAYd-0005gY-D9
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 07:34:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGAYc-005BV3-Q5
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 09:34:50 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acc8d91-bab6-0a2a0a5309dd-0a2a4506b5c0-48
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 09:34:50 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acc8d9a-195a-0a2a45060019-d155dd32ade2-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 09:34:50 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-48c6955a7c3so225637f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 00:34:50 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9aba3e5sm17622702f8f.31.2026.10.12.00.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 00:34:49 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791790490; x=1792395290; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u85WjwwTDumBM2QRM9L5Q/kESBWlmNyvbPl4+ZXJng4=;
        b=VOqqxXLXyQC6M3CpPd3po7X0FozQur2Fwf1XcllSrixMENjSGEUl8diunNi44g6hMu
         m3uj/V08xmIAU3WCbn/1WCLMS+HqBbzAhMCWFPTXM4rmkH0nyRDiJWtw4s8pXJU0FAK4
         hfkrADFzWHMfnmFgO4hPsItlJAhLVK+/aqg8mJEs9XrOaQQKmLqJfioesBwdN9iDbGUt
         DDohbVosBcAZAHAnB1jmkp+Dhz2020/R/5GDySqcu6tOSCxGH1pazB8T4yfbNCJ95mZt
         Wjm2LdNUV1r8r39OzXSeoicMY7TwF+RHbN07o2MeX6PfItZWz4XsB5FNP8FeYDIIAQdf
         g2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791790490; x=1792395290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u85WjwwTDumBM2QRM9L5Q/kESBWlmNyvbPl4+ZXJng4=;
        b=zZ4+LrTsrYvjUnJa0ki3yVCE1d/iBDjruEtWN8yQ5EQ/BTQmU2Tq2Ap0sLLi+CgDlZ
         5dkGlRzJbw1nQf4xP6Lv2C1pa2CcUBfxiCOrNJeV1pthYE4LyZJBYTQsMy54+HloACRo
         C/tBBk/SMfNN9bx2HPzvzKNufG7gS+ceo5g+xSIFKiAmVWgW0f0sal+Y5NWpcwda8G5T
         y8l2kwW5aYoNHL1NcZi291gqBBXh5m/jZEmz8eQBFttq/kP5NjpSOU824n00Qslcwhgd
         9ivXKuJWqK/a8jLC689M5QDGZujzzHWkcdklVPifJjmbPe6hEUJXyz4fmOno8kcxHuor
         8J/g==
X-Gm-Message-State: AFq9FYJSoNircqydIlegWdLTtlEtgyC5yWpkq/oAVmHDbFUz1uP9WnZY
	uBcQLS1ZE3N3urfYBYSjho/bt1XzGDRmi8rKYYExkUXzM8ureqoOo+0rWdJuGA==
X-Gm-Gg: AYBFou2KXyzSGRpWwnu1crXBxqnnS/NpHcNhVyz3G2jQ8bBTfU70iDlh7lp3QrhqvnQ
	JL5+0sD7P7bxVxrABRzLN4dr2dOMKDQGHqoIPxgDv/0VMA5PwloMCqUTYBtCILPkXdMEAB5Iwqj
	krOsTcZI1qTh0XcgmIKbiBEnqdy3+X+eYGi0L6QgLUaqzNZuXX/9JjJ5O2VFhGarXYcJaCO3qEy
	woTxd/EVeZcMGdIF6etkD9wUS93vBSdtzFr1zV+TNROJMHnAMYmV2uPcJoMOexpVZ6gDKhrRsEP
	Au5gz373grFh6ajXl4iaJ4ei9pVnOZ8VOGheJgumA2JrIi0zLB2l9ovyL/a+Qn0d7G+ijUyE+Kt
	+c4el3QtY0rp9ctH+bmvTnymIzuhEHTMk1OHObaDbaIlaEbIe8DPXlei176NtUIkdwwHUuFBD79
	TY+PmTNqvwNce4VJFdJuI0iVvrwojaDhpdAKg/TjCNmnLUe/o1lxcWywJNBSBRHkHw5GAbi6J+g
	GupjAS1NdaTH2f6gtTC9htGQAU4XCRwVWjhDtqw
X-Received: by 2002:adf:f782:0:b0:48c:71b8:c633 with SMTP id ffacd0b85a97d-48dbad34569mr12042628f8f.43.1791790489938;
        Mon, 12 Oct 2026 00:34:49 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 1/2] xen/device-tree: move discard_initial_modules() to common code
Date: Mon, 12 Oct 2026 09:34:41 +0200
Message-ID: <20261012073442.15819-2-oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012073442.15819-1-oleksii.kurochko@gmail.com>
References: <20261012073442.15819-1-oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1791790490-FD40B77B-2D081998/10/73395122804
X-purgate-type: spam
X-purgate-size: 5267

Everything discard_initial_modules() touches is already common code:
bootinfo.modules, using_static_heap and fw_unreserved_regions(). Move it
out of Arm into common/device-tree/bootinfo.c, next to the boot allocator
handling of the same memory, and declare it in xen/bootinfo.h, so that
other device-tree based architectures can reuse it instead of growing a
copy of their own.

The arch-specific remove_early_mappings() is not moved along with it:
how the early FDT mapping is torn down is up to the architecture. As the
DTB is one of the boot modules being released, the mapping has to go once
they are discarded, so call it from start_xen() right after
discard_initial_modules(), which keeps the common function free of any
arch dependency.

While moving it, use unsigned int for the loop counter and replace the
"goto out" by a plain return, as there is nothing left to do at the label.

No functional change.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - Drop the comment above the call of discard_initial_modules() from
   arm/setup.c as it duplicates the comment added in xen/bootfdt.h.
 - Add Reviewed-by: Michal Orzel <michal.orzel@amd.com>.
---
---
 xen/arch/arm/include/asm/setup.h  |  2 --
 xen/arch/arm/setup.c              | 39 ++-----------------------------
 xen/common/device-tree/bootinfo.c | 30 ++++++++++++++++++++++++
 xen/include/xen/bootinfo.h        |  8 +++++++
 4 files changed, 40 insertions(+), 39 deletions(-)

diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index c491c567298f..02fdf2b56c9c 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -40,8 +40,6 @@ int acpi_make_efi_nodes(void *fdt, struct membank tbl_add[]);
 
 void create_dom0(void);
 
-void discard_initial_modules(void);
-
 void init_pdx(void);
 void setup_mm(void);
 
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 16f899dff57b..2cd1c021b559 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -210,39 +210,6 @@ static void __init processor_id(void)
     processor_setup();
 }
 
-void __init discard_initial_modules(void)
-{
-    struct boot_modules *mi = &bootinfo.modules;
-    int i;
-
-    /*
-     * When using static heap feature, don't give boot_modules memory back to
-     * the heap allocator
-     */
-    if ( using_static_heap )
-        goto out;
-
-    for ( i = 0; i < mi->nr_mods; i++ )
-    {
-        paddr_t s = mi->module[i].start;
-        paddr_t e = s + PAGE_ALIGN(mi->module[i].size);
-
-        if ( mi->module[i].kind == BOOTMOD_XEN )
-            continue;
-
-        if ( !mfn_valid(maddr_to_mfn(s)) ||
-             !mfn_valid(maddr_to_mfn(e)) )
-            continue;
-
-        fw_unreserved_regions(s, e, init_domheap_pages, 0);
-    }
-
-    mi->nr_mods = 0;
-
- out:
-    remove_early_mappings();
-}
-
 /* Relocate the FDT in Xen heap */
 static void __init relocate_fdt(const void **dtb_vaddr, size_t dtb_size)
 {
@@ -503,12 +470,10 @@ void asmlinkage __init noreturn start_xen(unsigned long fdt_paddr)
         alloc_static_evtchn();
     }
 
-    /*
-     * This needs to be called **before** heap_init_late() so modules
-     * will be scrubbed (unless suppressed).
-     */
     discard_initial_modules();
 
+    remove_early_mappings();
+
     heap_init_late();
 
     init_constructors();
diff --git a/xen/common/device-tree/bootinfo.c b/xen/common/device-tree/bootinfo.c
index c637c45ad594..6772bf2df002 100644
--- a/xen/common/device-tree/bootinfo.c
+++ b/xen/common/device-tree/bootinfo.c
@@ -471,6 +471,36 @@ void __init populate_boot_allocator(void)
     }
 }
 
+void __init discard_initial_modules(void)
+{
+    struct boot_modules *mi = &bootinfo.modules;
+    unsigned int i;
+
+    /*
+     * When using static heap feature, don't give boot_modules memory back to
+     * the heap allocator
+     */
+    if ( using_static_heap )
+        return;
+
+    for ( i = 0; i < mi->nr_mods; i++ )
+    {
+        paddr_t s = mi->module[i].start;
+        paddr_t e = s + PAGE_ALIGN(mi->module[i].size);
+
+        if ( mi->module[i].kind == BOOTMOD_XEN )
+            continue;
+
+        if ( !mfn_valid(maddr_to_mfn(s)) ||
+             !mfn_valid(maddr_to_mfn(e)) )
+            continue;
+
+        fw_unreserved_regions(s, e, init_domheap_pages, 0);
+    }
+
+    mi->nr_mods = 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
index dbf492c2e36e..60ef25f3cf83 100644
--- a/xen/include/xen/bootinfo.h
+++ b/xen/include/xen/bootinfo.h
@@ -214,4 +214,12 @@ void fw_unreserved_regions(paddr_t s, paddr_t e,
                            void (*cb)(paddr_t ps, paddr_t pe),
                            unsigned int first);
 
+/*
+ * Return the memory occupied by the boot modules to the heap allocator.
+ *
+ * It needs to be called **before** heap_init_late() so that the released
+ * modules are scrubbed (unless suppressed).
+ */
+void discard_initial_modules(void);
+
 #endif /* XEN_BOOTINFO_H */
-- 
2.55.0


