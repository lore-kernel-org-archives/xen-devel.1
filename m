Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DA1CA5FF0
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 18:00:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441090.1658706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDmz3-00014G-8Q; Mon, 05 Oct 2026 18:00:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441090.1658706; Mon, 05 Oct 2026 18:00:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDmz3-000149-5G; Mon, 05 Oct 2026 18:00:17 +0000
Received: by outflank-mailman (input) for mailman id 1441090;
 Mon, 05 Oct 2026 18:00:15 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gabi.qs.mail@gmail.com>) id 1xDmz1-000143-MI
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 18:00:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDmz0-006t1w-SS
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 20:00:14 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <gabi.qs.mail@gmail.com>)
 id 6ac3e573-2eae-0a2a0a5409dd-0a2a4505cc12-38
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 20:00:14 +0200
Received: from [74.125.225.98] (helo=mail-wr2-f34.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <gabi.qs.mail@gmail.com>)
 id 6ac3e5ae-4cb1-0a2a45050019-4a7de1629ca8-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 20:00:14 +0200
Received: by mail-wr2-f34.google.com with SMTP id
 ffacd0b85a97d-48af5ae31d8so1558353f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 11:00:14 -0700 (PDT)
Received: from ws-fedora.tail006fee.ts.net (cm-93-156-216-249.telecable.es.
 [93.156.216.249]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c622907fesm5312951f8f.26.2026.10.05.11.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 11:00:13 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791223214; x=1791828014; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lg//XOkHoxzTHuefAMSiqaJqd/+zKvdBQBqoUAddV/4=;
        b=iOHgSazzwKUwuXJT8q+IqrXO96D8NcA2xLJHsE7dpO0gLx3gOYQyhJFgh6X1Q9Ees1
         r18jTedTTwCBKlrZKpH1X3FilCTTct337othNcYSubkaRg5OkupAjAHconq10eySbIzL
         rFXQCMoFTfNG05xX54Ek6cIGvl+eg3KYcAp7on/NhmNGwn3KLeDE+QZ8yhIb4xfmHgv0
         ohRrC0Bu+GsHM7wBZEaAtJbqTbqTD2pK49x2/UAx6fsYPCIPpw79CzCXQ24tonzjdaCm
         tmGzDQKAahWJ5KBa9JvXghvwfDiRNyO+fMOTyA4paDuN5TtgtaUNd/oiaiMPTytrJGha
         ATxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791223214; x=1791828014;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lg//XOkHoxzTHuefAMSiqaJqd/+zKvdBQBqoUAddV/4=;
        b=M9r9vjJ0CC2ctSoGfjzeFbZoMX1ziVzhLG0alCOljeg/lzEiqsLIEEajqY1c25r9Vc
         1Md0/0Pkak4vd47CCLeSz2X2wPeOTRoHI4gN/a3uY8BumY9bngASBnyAWCwzDbfvpLUC
         BhSYgcQ64uTZOiBD9FTQ4og02goGwmJPCCGN48CHqauAyRZeKkCXnrSmFus3VbkYCOnI
         vB81Gd67eIczavRTqNrGOGHRbMVzpaYaujlGUrcSdwnvDYZ3bsep/P+4zL1sbJQtLr5t
         NlKPsWOph6OUAC/AfZ8/keSxlfh4XxssJ96E4DwzK4geGB+z1wBP1VpYzL2jnQqQE0Dd
         kBJQ==
X-Gm-Message-State: AFq9FYLqOlMGM36qliBjpQviS5o10EtT+yYJ5ByPkB0syXQxFP9Zec+S
	2I9PpxLS0jXDvL0hWNrX412Ce0pQqTnOKSdh8hVI7ANfi/ObqXzKlV4ez4qwvvAW
X-Gm-Gg: AYBFou1jqVVIOla64ODhaPKBu42h7+5T40ynxZ3tb9uqhzQeOCpW3nj9EmXyUskEdJR
	0mMcTqk7X0lhiqf/NR85EcX0oqL3MEqiOi9rnnaJFXJCuCwWGIXO0e8WtN07qu3UPYHf/wfsOJK
	774m6f+vLUhQn/tXcU3G+Bh8vJItOVuNr+eGv6PgCrEzoq1gJqJrKzvinGwZ7WYa+VVEu5e0AgX
	yPgmtMATODtHvwiStF1ptg812n+8fo8HhE9iSDY93alIP+ra+KMIQdsfbiUu3dwJ4yO+cJgAnQR
	ZWTVM9BtWtfQcMTV/Vp5+6idM9XSXCVkTcP51kR0wX3qSOH23WBkQ5V2qW4T8JmbvubSUBEe9in
	jJl4nhSJ63TSQkP68wQ7I/oXlMMpwO4q5NJjUi+POfWCtO0k+16dva9MPEvk3zvAdplmuCIG6B5
	axIIaV6nmDMfellWMm7Qn1gonc8GAy1YY2CQ93TjWcbzGF+agEiprlzdgJiXrXOgbdnpDxvvJKG
	CYw1bruPkvUO0Vilqhxy0PiwCx32g7s5HZAqjeDrlxLssMN/Js9j5c=
X-Received: by 2002:a05:6000:178f:b0:488:8436:b343 with SMTP id ffacd0b85a97d-48b1271aa6fmr20188534f8f.37.1791223213942;
        Mon, 05 Oct 2026 11:00:13 -0700 (PDT)
From: =?UTF-8?q?Gabriel=20Quint=C3=A1ns=20Souto?= <gabi.qs.mail@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	julien@xen.org,
	bertrand.marquis@arm.com,
	sstabellini@kernel.org,
	=?UTF-8?q?Gabriel=20Quint=C3=A1ns=20Souto?= <gabi.qs.mail@gmail.com>
Subject: [PATCH v3] xen/arm: validate non-common page-table ranges
Date: Mon,  5 Oct 2026 19:59:40 +0200
Message-ID: <20261005175940.103249-1-gabi.qs.mail@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1791223214-F70B22A1-F9D967F2/0/0
X-purgate-type: clean
X-purgate-size: 4605

On arm32, page-tables are different on each CPUs, although they share some
common mappings.

The xen_pt_update function assumed that only said mappings would be
modified, but did not check this assumption.

Add a range check to reject modifications to non-common mappings.

Signed-off-by: Gabriel Quintáns Souto <gabi.qs.mail@gmail.com>
---
v3:
 - Dropped accidentally tracked patch file from commit.

v2:
- Inverted polarity of xen_pt_range_is_non_common() as suggested.
- Moved xen_pt_range_is_common() implementation to arch-specific headers
(arm32 vs arm64) instead of keeping #ifdef CONFIG_ARM_32 in pt.c (tried
IS_ENABLED() for DCE, but ARM64 lacks definitions for
DOMHEAP_VIRT_START/TEMPORARY_AREA_ADDR, breaking the build).
- Added ASSERT_UNREACHABLE() on failure path in xen_pt_update().
---
 xen/arch/arm/include/asm/arm32/mm.h | 24 +++++++++++++++++++++++
 xen/arch/arm/include/asm/arm64/mm.h | 10 ++++++++++
 xen/arch/arm/mmu/pt.c               | 30 ++++-------------------------
 3 files changed, 38 insertions(+), 26 deletions(-)

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


