Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E845CA5FE0
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 19:15:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439557.1657913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCij3-0000fa-2v; Fri, 02 Oct 2026 19:15:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439557.1657913; Fri, 02 Oct 2026 19:15:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCij2-0000fT-WE; Fri, 02 Oct 2026 19:15:21 +0000
Received: by outflank-mailman (input) for mailman id 1439557;
 Fri, 02 Oct 2026 19:15:20 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gabi.qs.mail@gmail.com>) id 1xCij1-0000fN-VN
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 19:15:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCij0-00H36G-Sf
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 21:15:18 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <gabi.qs.mail@gmail.com>)
 id 6ac002ab-2eae-0a2a0a5409dd-0a2a4502b584-18
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 21:15:18 +0200
Received: from [74.125.225.98] (helo=mail-wr2-f34.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <gabi.qs.mail@gmail.com>)
 id 6ac002c6-6ca4-0a2a45020019-4a7de1628bb7-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 21:15:18 +0200
Received: by mail-wr2-f34.google.com with SMTP id
 ffacd0b85a97d-48af9f88c95so76653f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 12:15:18 -0700 (PDT)
Received: from ws-fedora.tail006fee.ts.net (cm-93-156-216-249.telecable.es.
 [93.156.216.249]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a166bfaf73sm14012525e9.4.2026.10.02.12.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 12:15:17 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790968518; x=1791573318; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7hzVLCLqTCo6ZZjXX7PS4ZOVN+xMW/Fn8WqC339I+g8=;
        b=eNtO3ZeIDQiQlmfQB8PdwqhJ1G3SYafc0Gf1kuy1Wva3m2zqExXGonywpj6xEQZuez
         f89O75Q98mJjSb7nsDZLHnlHgZA8VJayGECR1qpXtIii2ju4EilaqVzH+C0eaMb/Him3
         7PHpta+APgRZ8nAJOPTxY6deuablVIblaOL+lfAAREM8RBhBfQe2kQKoXEB9L5jmB7c6
         +w7s4Zsf7Iz3ypFk96yQnhjyKhDEQn+u27u0JiWFWSf0UIfXEY7mlnVWd151LBchs8N8
         ca6w830YoLQyDPtoo/cP0x0Umw+3nO9gojAWd37PO1pYAqncA3nCoMAlw2k4afIRPEGf
         giWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790968518; x=1791573318;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7hzVLCLqTCo6ZZjXX7PS4ZOVN+xMW/Fn8WqC339I+g8=;
        b=u09I04SKK+LuwxGfGewQa1LxVHuzlor2IJJbetZ1oOqJ2/0MaXrSksBckMcFf/zW/q
         QJYhxYcoJnm3i2Wjry5IHqFRPNo3pOauiPV9mpl2/GdZOkAdbLlqfK1H8xsEK0oYRCk+
         eRXn8BV53RUMhMKeKI0wjTGBncWNdO530klJ282jRm328e/NsM0mFwhUvlZ479TfOlmI
         K2b0Q+nIFzE/n+n6sNKJqD6o3pgmnzuFDLZzZBhLxgmYTGOQNS7hHLCh/c266sJlQxMb
         vrPduCQebnE8y5K2yUC5YOq3YpPC60YFwM22Z3JwvlJM5IeSsISEWI6Icn/989jsIbRG
         CaYA==
X-Gm-Message-State: AFuF++m3tUymhiRFvG/5dEKPZNFLsnfmBAA3sawWgCwKhFHOh8O7Wymn
	NA5ghga/a8kLzIBOdwIIbGpFomMr81On3tfK3ihXNRR/jI53Nk4MLo7k3LbK6QDIrGM=
X-Gm-Gg: AYBFou15HMUMHqZB0KYhlbwHaZUQFIw55goFjXC+4CWgQUNeyJZLTlQUqXdxS0pKh31
	6cZfktyuFINXTIyIgb+mbU4OTq91LQRpRL9XPwewyfQbMCaDxBkqsfhMCoexpneFHR1vtM8NUkR
	NR5MR/zO6k7IUoUVP2pYgjsR5cNNBSef6G3gHYExnpKqBL5NaWuKVnMz3P3Z0gXnd2sH5E6uRQg
	0HxSJ7JxM582M6xj7EPrIMddWmuWXu7kgfByaNurJoi2a33XzlGiz9oVSHwB4hISIGB3gtEXArv
	qTRd02ruObJD932yuWWILirs8YLh8kTuMRtKRUYxcJ1fms9eQtrDkxcPj9LC8Xo5+R/VQzAnqOx
	x7uA8uUwMFIEWHYvme2cgDBC0Z1N9wvtzgT6Gr8pYvJb+5At37bNSg2K4MTXckCrGgSjEpqTVyv
	EjOUNu9p/ckGTlnWns7G7iTnSJ9IBoomJqdS/D9q39kzPBT6f6/CLaebM7i1vg38faNuiTeeU1z
	xXwv7bjVOChjXtHZg3oKyXppH+AOXoo7PMA2JsuJ0ZhOD7pt+L544k=
X-Received: by 2002:a05:600c:3b05:b0:49e:715d:95ca with SMTP id 5b1f17b1804b1-4a027561e0fmr62509815e9.13.1790968518152;
        Fri, 02 Oct 2026 12:15:18 -0700 (PDT)
From: =?UTF-8?q?Gabriel=20Quint=C3=A1ns=20Souto?= <gabi.qs.mail@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	julien@xen.org,
	bertrand.marquis@arm.com,
	sstabellini@kernel.org,
	=?UTF-8?q?Gabriel=20Quint=C3=A1ns=20Souto?= <gabi.qs.mail@gmail.com>
Subject: [PATCH v1] xen/arm: validate non-common page-table ranges
Date: Fri,  2 Oct 2026 21:14:18 +0200
Message-ID: <20261002191418.287819-1-gabi.qs.mail@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1790968518-F2AB52AC-BB20AB6C/0/0
X-purgate-type: clean
X-purgate-size: 2497

On arm32, page-tables are different on each CPUs, although they share some
common mappings.

The xen_pt_update function assumed that only said mappings would be
modified, but did not check this assumption.

Add a range check to reject modifications to non-common mappings.

Signed-off-by: Gabriel Quintáns Souto <gabi.qs.mail@gmail.com>
---
 xen/arch/arm/mmu/pt.c | 36 +++++++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c
index 621b47d..ad0d1e6 100644
--- a/xen/arch/arm/mmu/pt.c
+++ b/xen/arch/arm/mmu/pt.c
@@ -13,6 +13,7 @@
 
 #include <asm/current.h>
 #include <asm/fixmap.h>
+#include <asm/mmu/layout.h>
 
 #ifdef NDEBUG
 static inline void
@@ -589,6 +590,29 @@ static unsigned int xen_pt_check_contig(unsigned long vfn, mfn_t mfn,
     return XEN_PT_4K_NR_CONTIG;
 }
 
+#ifdef CONFIG_ARM_32
+static bool ranges_overlap(unsigned long start1, unsigned long size1,
+                           unsigned long start2, unsigned long size2)
+{
+    if ( start1 < start2 )
+        return start2 - start1 < size1;
+
+    return start1 - start2 < size2;
+}
+
+static bool xen_pt_range_is_non_common(unsigned long virt,
+                                       unsigned long size)
+{
+    unsigned long temporary_start = TEMPORARY_AREA_ADDR(0);
+    unsigned long temporary_size = XEN_PT_LEVEL_SIZE(1);
+
+    return ranges_overlap(virt, size,
+                          DOMHEAP_VIRT_START, DOMHEAP_VIRT_SIZE) ||
+           ranges_overlap(virt, size,
+                          temporary_start, temporary_size);
+}
+#endif
+
 static DEFINE_SPINLOCK(xen_pt_lock);
 
 static int xen_pt_update(unsigned long virt,
@@ -601,15 +625,13 @@ static int xen_pt_update(unsigned long virt,
     unsigned long vfn = virt >> PAGE_SHIFT;
     unsigned long left = nr_mfns;
 
-    /*
-     * For arm32, page-tables are different on each CPUs. Yet, they share
-     * some common mappings. It is assumed that only common mappings
-     * will be modified with this function.
-     *
-     * XXX: Add a check.
-     */
     const mfn_t root = maddr_to_mfn(READ_SYSREG64(TTBR0_EL2));
 
+    #ifdef CONFIG_ARM_32
+    if ( xen_pt_range_is_non_common(virt, nr_mfns * PAGE_SIZE) )
+        return -EINVAL;
+    #endif
+
     if ( flags_has_rwx(flags) )
     {
         mm_printk("Mappings should not be both Writeable and Executable.\n");
-- 
2.54.0


