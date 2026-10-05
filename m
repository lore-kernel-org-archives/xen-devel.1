Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21392CA5FF0
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 17:54:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441084.1658696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDmtU-0007jW-La; Mon, 05 Oct 2026 17:54:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441084.1658696; Mon, 05 Oct 2026 17:54:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDmtU-0007jP-J0; Mon, 05 Oct 2026 17:54:32 +0000
Received: by outflank-mailman (input) for mailman id 1441084;
 Mon, 05 Oct 2026 17:54:31 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gabi.qs.mail@gmail.com>) id 1xDmtT-0007jJ-5v
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 17:54:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDmtS-00DGz4-It
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 19:54:30 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <gabi.qs.mail@gmail.com>)
 id 6ac3e452-2eae-0a2a0a5409dd-0a2a4506a83c-4
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 19:54:30 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <gabi.qs.mail@gmail.com>)
 id 6ac3e456-195a-0a2a45060019-d155802bdde5-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 19:54:30 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a1728d8dfcso11379545e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 10:54:30 -0700 (PDT)
Received: from ws-fedora.tail006fee.ts.net (cm-93-156-216-249.telecable.es.
 [93.156.216.249]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1794a1af9sm2122515e9.5.2026.10.05.10.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 10:54:29 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791222870; x=1791827670; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xwNDRvPWE8TgwU0etaLOayu72eOFBBKFcNRGWmPN8AM=;
        b=lZV3dTGg3qmvevt3t8BIpIyTTRQKVAsHSI/ySzn1gBHid+h2SPHFKjfx45O6N43RyP
         VU/EIQQ8xjfdyFrSG2Dgrvyarl5RGF9G7p4UFC6ceqVo+QLx3cgZ/GkLpxb/YPLb6bXB
         jxhzJFBDN6ly+uCZAn9edWuUu7TE4MHybvB48EaUCW4I+ZZERiJJEUWERuB7Ga3TfJvw
         y4XrWAgjO/MWrcJAlQOxBsyn6RNfvtm8lmCgythev+X5Q7UbydPKhcIANWaIxZzwIC5G
         unCQjPHG2GVXLBKxyw2Fv313zNzzi0JX8y4UWCI0IFyi9h2+jQk+3Ouw/GC2Xq9cQnyt
         jIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791222870; x=1791827670;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xwNDRvPWE8TgwU0etaLOayu72eOFBBKFcNRGWmPN8AM=;
        b=fDfbiG+WhgN1/igEJr3QSFse8KOOAnqGpDRKYDNi6SRfI1a/TvXNIP6CC1seL5XWQs
         bFdusePdEkjyBepQbmDWf6y42qnDt3GwvBTKo2m3D1lF0bkSc/p5DV223mD6adEOhmYM
         5f+1Z6lniiq119/0LYxcMig6z6J6xFr+H6BRhIcChhaySYDkFfnBt6Em2KL11MF5RMgC
         78eqjdgjUgrAlIQMFSl8k1F8WVv1yUtH/Oy2drVKWl3kIQpMK2bE/IqhfEisdLX2wk6B
         pL9gkzspAGgl/P1O03Jv3/yj5vrafVoCOOFBU7bAImE623IzmiFnkeH97WFKpdibeF4v
         nxOQ==
X-Gm-Message-State: AFuF++lSvMLBZMh77ZC1d8gD+CI3XCsEEtyM9ZhTUmLEW1MfNsAQxPLq
	Y7s/dd9kr5Z6rTA4lEH6sT6vxjBfcU560eQu7fU7xYc2Q1fPJ0M73tYIpGKntTtr0pM=
X-Gm-Gg: AYBFou1sQ4YoF/JfXKFSg7Lq7QoVO8NtnM/rQpGnh85tDqtdLaAGVIiUt3+t8GMX/Ph
	tPaqkjQOoGSxbvwKDqEmeXKCqjpV1cC0g+gAyL/PvbziWBZK7FvxKcI0zMOwr6bHvrWLsO23qF9
	H5Cfd+k/IxiPljoSlUUEEMJji1pA94cQZ28luf10MrP8CAwsRZ400W4zEbsqJ8RQs6m9KRGK6O5
	ApFV907+KTF4DVyq1mHoHsTNgYAzVPhvI7OgiWywjEJmflWfCItfi04io0Ik6p63DiukE+BYzRC
	hqVkI8ZVDjTWCqulHnC4HP3Mmza6jTqRx6qN0ONF4jMMK8A2ix/FhzaW3XDKJc5EXuUTgEqTk77
	VuRuuxYTMJppFF8VV+qhKAVQTQeCiBjS3ahQZcTTSfcOcMAD+Y2enC6aEM7JQDvzXJaGntNy8sq
	WQB3m7/gGWE6P2F0/YeguDLnYduTm4g1DVWZfu4u7JJsErDJspuRjqV9KeGfY1VWtTEm/eHTj/N
	TE2749bbaGytYVDjSLJ/z9eBnHHjsSxQMryeEsYE1MLQqN7hzy1WDM=
X-Received: by 2002:a05:600c:3110:b0:4a0:b6:4619 with SMTP id 5b1f17b1804b1-4a168069b91mr149082325e9.0.1791222869694;
        Mon, 05 Oct 2026 10:54:29 -0700 (PDT)
From: =?UTF-8?q?Gabriel=20Quint=C3=A1ns=20Souto?= <gabi.qs.mail@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	julien@xen.org,
	bertrand.marquis@arm.com,
	sstabellini@kernel.org,
	=?UTF-8?q?Gabriel=20Quint=C3=A1ns=20Souto?= <gabi.qs.mail@gmail.com>
Subject: [PATCH v2] xen/arm: validate non-common page-table ranges
Date: Mon,  5 Oct 2026 19:52:58 +0200
Message-ID: <20261005175258.101303-1-gabi.qs.mail@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1791222870-F70C777B-7E953AC2/0/0
X-purgate-type: clean
X-purgate-size: 7894

On arm32, page-tables are different on each CPUs, although they share some
common mappings.

The xen_pt_update function assumed that only said mappings would be
modified, but did not check this assumption.

Add a range check to reject modifications to non-common mappings.

Signed-off-by: Gabriel Quintáns Souto <gabi.qs.mail@gmail.com>
---
v2:
- Inverted polarity of xen_pt_range_is_non_common() as suggested.
- Moved xen_pt_range_is_common() implementation to arch-specific headers
(arm32 vs arm64) instead of keeping #ifdef CONFIG_ARM_32 in pt.c (tried
IS_ENABLED() for DCE, but ARM64 lacks definitions for
DOMHEAP_VIRT_START/TEMPORARY_AREA_ADDR, breaking the build).
- Added ASSERT_UNREACHABLE() on failure path in xen_pt_update().
---
 ...alidate-non-common-page-table-ranges.patch | 87 +++++++++++++++++++
 xen/arch/arm/include/asm/arm32/mm.h           | 24 +++++
 xen/arch/arm/include/asm/arm64/mm.h           | 10 +++
 xen/arch/arm/mmu/pt.c                         | 30 +------
 4 files changed, 125 insertions(+), 26 deletions(-)
 create mode 100644 v1-0001-xen-arm-validate-non-common-page-table-ranges.patch

diff --git a/v1-0001-xen-arm-validate-non-common-page-table-ranges.patch b/v1-0001-xen-arm-validate-non-common-page-table-ranges.patch
new file mode 100644
index 0000000..9f04107
--- /dev/null
+++ b/v1-0001-xen-arm-validate-non-common-page-table-ranges.patch
@@ -0,0 +1,87 @@
+From 21cd59798dafea289feeecd94f39890e99497525 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Gabriel=20Quint=C3=A1ns=20Souto?= <gabi.qs.mail@gmail.com>
+Date: Fri, 2 Oct 2026 20:17:05 +0200
+Subject: [PATCH v1] xen/arm: validate non-common page-table ranges
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+On arm32, page-tables are different on each CPUs, although they share some
+common mappings.
+
+The xen_pt_update function assumed that only said mappings would be
+modified, but did not check this assumption.
+
+Add a range check to reject modifications to non-common mappings.
+
+Signed-off-by: Gabriel Quintáns Souto <gabi.qs.mail@gmail.com>
+---
+ xen/arch/arm/mmu/pt.c | 36 +++++++++++++++++++++++++++++-------
+ 1 file changed, 29 insertions(+), 7 deletions(-)
+
+diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c
+index 621b47d..ad0d1e6 100644
+--- a/xen/arch/arm/mmu/pt.c
++++ b/xen/arch/arm/mmu/pt.c
+@@ -13,6 +13,7 @@
+ 
+ #include <asm/current.h>
+ #include <asm/fixmap.h>
++#include <asm/mmu/layout.h>
+ 
+ #ifdef NDEBUG
+ static inline void
+@@ -589,6 +590,29 @@ static unsigned int xen_pt_check_contig(unsigned long vfn, mfn_t mfn,
+     return XEN_PT_4K_NR_CONTIG;
+ }
+ 
++#ifdef CONFIG_ARM_32
++static bool ranges_overlap(unsigned long start1, unsigned long size1,
++                           unsigned long start2, unsigned long size2)
++{
++    if ( start1 < start2 )
++        return start2 - start1 < size1;
++
++    return start1 - start2 < size2;
++}
++
++static bool xen_pt_range_is_non_common(unsigned long virt,
++                                       unsigned long size)
++{
++    unsigned long temporary_start = TEMPORARY_AREA_ADDR(0);
++    unsigned long temporary_size = XEN_PT_LEVEL_SIZE(1);
++
++    return ranges_overlap(virt, size,
++                          DOMHEAP_VIRT_START, DOMHEAP_VIRT_SIZE) ||
++           ranges_overlap(virt, size,
++                          temporary_start, temporary_size);
++}
++#endif
++
+ static DEFINE_SPINLOCK(xen_pt_lock);
+ 
+ static int xen_pt_update(unsigned long virt,
+@@ -601,15 +625,13 @@ static int xen_pt_update(unsigned long virt,
+     unsigned long vfn = virt >> PAGE_SHIFT;
+     unsigned long left = nr_mfns;
+ 
+-    /*
+-     * For arm32, page-tables are different on each CPUs. Yet, they share
+-     * some common mappings. It is assumed that only common mappings
+-     * will be modified with this function.
+-     *
+-     * XXX: Add a check.
+-     */
+     const mfn_t root = maddr_to_mfn(READ_SYSREG64(TTBR0_EL2));
+ 
++    #ifdef CONFIG_ARM_32
++    if ( xen_pt_range_is_non_common(virt, nr_mfns * PAGE_SIZE) )
++        return -EINVAL;
++    #endif
++
+     if ( flags_has_rwx(flags) )
+     {
+         mm_printk("Mappings should not be both Writeable and Executable.\n");
+-- 
+2.54.0
+
diff --git a/xen/arch/arm/include/asm/arm32/mm.h b/xen/arch/arm/include/asm/arm32/mm.h
index 856f2db..c7d09d3 100644
--- a/xen/arch/arm/include/asm/arm32/mm.h
+++ b/xen/arch/arm/include/asm/arm32/mm.h
@@ -16,6 +16,30 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
     return false;
 }
 
+static inline bool ranges_overlap(unsigned long start1, unsigned long size1,
+                           unsigned long start2, unsigned long size2)
+{
+    if ( start1 < start2 )
+        return start2 - start1 < size1;
+
+    return start1 - start2 < size2;
+}
+
+/*
+ * On ARM32, page-tables differ between CPUs, so not all mappings are common.
+ */
+static inline bool xen_pt_range_is_common(unsigned long virt,
+                                       unsigned long size)
+{
+    unsigned long temporary_start = TEMPORARY_AREA_ADDR(0);
+    unsigned long temporary_size = XEN_PT_LEVEL_SIZE(1);
+
+    return !ranges_overlap(virt, size,
+                          DOMHEAP_VIRT_START, DOMHEAP_VIRT_SIZE) &&
+           !ranges_overlap(virt, size,
+                          temporary_start, temporary_size);
+}
+
 bool init_domheap_mappings(unsigned int cpu);
 
 static inline void arch_setup_page_tables(void)
diff --git a/xen/arch/arm/include/asm/arm64/mm.h b/xen/arch/arm/include/asm/arm64/mm.h
index b4f7545..a3cb56d 100644
--- a/xen/arch/arm/include/asm/arm64/mm.h
+++ b/xen/arch/arm/include/asm/arm64/mm.h
@@ -12,6 +12,16 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
     return true;
 }
 
+/*
+ * On ARM64, the Xen page-tables are shared by all the CPUs,
+ * any range is therefore common.
+ */
+static inline bool xen_pt_range_is_common(unsigned long virt,
+                                          unsigned long size)
+{
+    return true;
+}
+
 void arch_setup_page_tables(void);
 
 void update_boot_mapping(bool enable);
diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c
index ad0d1e6..5e1b427 100644
--- a/xen/arch/arm/mmu/pt.c
+++ b/xen/arch/arm/mmu/pt.c
@@ -590,29 +590,6 @@ static unsigned int xen_pt_check_contig(unsigned long vfn, mfn_t mfn,
     return XEN_PT_4K_NR_CONTIG;
 }
 
-#ifdef CONFIG_ARM_32
-static bool ranges_overlap(unsigned long start1, unsigned long size1,
-                           unsigned long start2, unsigned long size2)
-{
-    if ( start1 < start2 )
-        return start2 - start1 < size1;
-
-    return start1 - start2 < size2;
-}
-
-static bool xen_pt_range_is_non_common(unsigned long virt,
-                                       unsigned long size)
-{
-    unsigned long temporary_start = TEMPORARY_AREA_ADDR(0);
-    unsigned long temporary_size = XEN_PT_LEVEL_SIZE(1);
-
-    return ranges_overlap(virt, size,
-                          DOMHEAP_VIRT_START, DOMHEAP_VIRT_SIZE) ||
-           ranges_overlap(virt, size,
-                          temporary_start, temporary_size);
-}
-#endif
-
 static DEFINE_SPINLOCK(xen_pt_lock);
 
 static int xen_pt_update(unsigned long virt,
@@ -627,10 +604,11 @@ static int xen_pt_update(unsigned long virt,
 
     const mfn_t root = maddr_to_mfn(READ_SYSREG64(TTBR0_EL2));
 
-    #ifdef CONFIG_ARM_32
-    if ( xen_pt_range_is_non_common(virt, nr_mfns * PAGE_SIZE) )
+    if ( !xen_pt_range_is_common(virt, nr_mfns * PAGE_SIZE) )
+    {
+        ASSERT_UNREACHABLE();
         return -EINVAL;
-    #endif
+    }
 
     if ( flags_has_rwx(flags) )
     {
-- 
2.54.0


