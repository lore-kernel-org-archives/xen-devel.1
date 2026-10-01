Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A02CA5FCE
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 11:16:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438175.1657056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCEmJ-0000Gi-K6; Thu, 01 Oct 2026 11:16:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438175.1657056; Thu, 01 Oct 2026 11:16:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCEmJ-0000GG-Bu; Thu, 01 Oct 2026 11:16:43 +0000
Received: by outflank-mailman (input) for mailman id 1438175;
 Thu, 01 Oct 2026 11:16:42 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xCEmI-0008T2-02
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 11:16:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCEmG-00Ha1J-Ti
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 13:16:40 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abe4111-8faa-0a2a0a5109dd-0a2a45079d0c-22
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 13:16:40 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abe4118-b4ea-0a2a45070019-4a7de18c93e1-3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 13:16:40 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-4a003bd18e5so24167325e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 04:16:40 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b068ff994sm5610427f8f.6.2026.10.01.04.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2026 04:16:39 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790853400; x=1791458200; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kbE4+gPC0KovURIfC+5IoRX/rbVyUI3fgwu1ICNzI/c=;
        b=cguSkl/aUkY3mzj0CR7s9c4XPcJ/zwky962U6mF1PLoewmjit9Mt6mCUFkTOZGe76r
         53EThSmC9DwaahT7AfX6Fou2/zV0bRJsxJTQ/+X4G3KLQhpxRdLdgdvVUHnJpevuOchJ
         l3j+eFAdil/qdgY+1qI5oNWZ3yWRr3AJqbdBWHd47YQ99FeIEOi1ZE4h9j9jDWTB1fy5
         L01R3z4YT3rmy3VCD8ulTnwpef8MAnXjGgGUN99FLkRkyDSYvai/InznDKB7rn+n6DVu
         gcCBhCOqZmbhG4v5NCV26o63F2uBX1B5OrJURBHAtuA5HnlUpVI2UGsjnY2ga8hrZ0T9
         vB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790853400; x=1791458200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kbE4+gPC0KovURIfC+5IoRX/rbVyUI3fgwu1ICNzI/c=;
        b=Qc7i70ZTZxqWA9SdSPYZqghnqBNLPBbIrpDHYYTkUq/Vg5BALjzD+sPg1wL6IKqwSI
         pnFtiXBldU2Um0drAmGhfi0MfK0e78qtn1WmQuxLAg4yMjp9enQ24hBKDvrFD1Oua5CY
         Sw//a4PQkkdVMzrZpP68zpSw1wt0RiZjrxl7hrta7yoXdJpZWpql8Yyz5/id+f8d0Zii
         YZkDcuG+u/+xD1uVdSaPP0vl6TaGRZ0WYjtMqXj2Xp10yWU43sguU2q0X3NoaS/wR+KT
         6tNOLC2w2qtuiJKspq6NfYw8IrWwaSQZ2CXmcOXdjNTPnMmUnqaoB/5C5f1Zdbh2wQIn
         GtVA==
X-Gm-Message-State: AFuF++m6miZt9P7BhVI8ETQbiupi31V23h40LbbSnDsBhMZSXx6ZLVWn
	x7uWGSi5AxI+NhoNpfK1duJ3jdbYrgrYirQwSV2KLldwoF3UEk0kmC8539eyrA==
X-Gm-Gg: AYBFou22/6nLOUyNwvVqdR5LOCgNvqoi7WowxDU61cY6cZa0gVfiY5O/6QKh/DL3yz5
	riPncbkdiHCIeJUHaI6sOxW2K38HM7em50yxLEevqAQubsyukpMMPzvhSJQHbcc9wDaaOhPJfyG
	DDHvvmYmVS3ODTugObJknU3XBk/fmy0chhgjcaRZvbNrR9alArxiJhCn8uTumqMBLUaJT2tsqpr
	alS+hCOewjV3aswnVHl9ucOCr978VjJGwqLyNDn1MS4EUxStI2ytwzmZ6hbL4up82L0Y3tRfMFO
	Q0p44Q4Y3F23KJKoim3L36DJkKsjqS86DZ0bmUhTCr8KNIJyStd2QxOgxVQZxlEAD6ecuY9cRc8
	XkZo8gyP92JPTtd6XZsVR0iuhH/QWd1+a/EdQ46N3wnn5wTBhPb2SOktQKwmdskZEdTM0Bfdhme
	2rbJp6I6t4pKfmqAsODExRo2Agsyra8SBCjdUsnTfHNsvx8AErRolh+CBM41Qz1g27NbcnHhM3l
	9LxbOM2EHQVx/hsshCrLczW9p8UkOcFOF0tB63wmiSkqXDCw+M=
X-Received: by 2002:a05:600c:c1c8:20b0:4a0:2488:71cc with SMTP id 5b1f17b1804b1-4a0248872a5mr11942715e9.32.1790853400220;
        Thu, 01 Oct 2026 04:16:40 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>
Subject: [PATCH 2/2] xen/device-tree: move discard_initial_modules() to common code
Date: Thu,  1 Oct 2026 13:16:30 +0200
Message-ID: <20261001111630.112472-3-oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001111630.112472-1-oleksii.kurochko@gmail.com>
References: <20261001111630.112472-1-oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1790853400-36EDEAE4-BB1535DB/10/73395122804
X-purgate-type: spam
X-purgate-size: 4822

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
---
 xen/arch/arm/include/asm/setup.h  |  2 --
 xen/arch/arm/setup.c              | 35 ++-----------------------------
 xen/common/device-tree/bootinfo.c | 30 ++++++++++++++++++++++++++
 xen/include/xen/bootinfo.h        |  8 +++++++
 4 files changed, 40 insertions(+), 35 deletions(-)

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
index 16f899dff57b..a65c3d2a655e 100644
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
@@ -509,6 +476,8 @@ void asmlinkage __init noreturn start_xen(unsigned long fdt_paddr)
      */
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


