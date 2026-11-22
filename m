Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954E7606A320
	for <xen-devel@archiver.kernel.org>; Sun, 22 Nov 2026 09:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OW2+reAW
Received: from list by lists.xenproject.org with outflank-mailman.1499544.1696341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xV4HZ-0006Ab-7h; Sun, 22 Nov 2026 09:54:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1499544.1696341; Sun, 22 Nov 2026 09:54:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xV4HZ-0006AN-3U; Sun, 22 Nov 2026 09:54:49 +0000
Received: by outflank-mailman (input) for mailman id 1499544;
 Sun, 22 Nov 2026 09:54:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <haseebashraf091@gmail.com>) id 1xV4HX-00066H-5o
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2026 09:54:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xV4HW-008zYS-Ib
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2026 10:54:46 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <haseebashraf091@gmail.com>)
 id 6b02bb91-2eae-0a2a0a5409dd-0a2a4504dd18-46
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 10:54:46 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <haseebashraf091@gmail.com>)
 id 6b02bbe6-b57f-0a2a45040019-d1558033c164-3
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 10:54:46 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4bb606491faso12391375e9.3
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 01:54:46 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.36.59.78])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8849e598sm218409605e9.8.2026.11.22.01.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2026 01:54:45 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795341286; x=1795946086; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uRWbLZw3/yEQ5PXPC7OpQnHirRM8EvYxh4g9KylG2S8=;
        b=OW2+reAWCeotFmyMeKdQhb03XTSIA2kgaY3KfiVWtzi+1QRtbKNv+OXXVurq4MN2Po
         Z3nMNMNNDChBInZCPsdxtlakEygID5StDUiOXmuin5OEergmCNX4VX0bo1A/t8yMJ5j8
         NdqVPriIBJmZUr5NiSPDA5EGRMd4iGwuA5YL2sFlMxqKyLaLStycWj8/h6pcpZzl/ghP
         97dyr8vPI4LdY8gTtLA89inGdA+nqmZxEy80RP/08Jvox5MtPR0yoKKfCm9F8K/xifVN
         Bl3OW7bYHx0gDlAXopazZ7FHEaPsfzIBf+tMfgEA5pEzkRSh9vlx1I5u7b99TBczC3DX
         FLew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795341286; x=1795946086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uRWbLZw3/yEQ5PXPC7OpQnHirRM8EvYxh4g9KylG2S8=;
        b=r5gQ7xdeG33uTj0l2lKbLL/SM/pLp4RX9G7Tux6jCIxZoTIBofFf79zDnSfQ/xKEes
         TV1ZYHRpy3Nsl4GDYaFyVa/s4IYplSJ/YCNegGdzhC7/+TJK5GbPmR8Mm5on46gs7fuB
         mbbd6IMzFl7qEKz+lkzj6ibHd1cgO3Nw9P74BOrs6uZ0g7oh2IntNKxfK4+ov8qFcXWS
         I0RuzVo7Uya6zL3YmuIMQNFW+GQl0fDLVdnU1qYN4AFBvvVQ+Hygfhe0Y/LtKDQkVta6
         bjbAUBHH7dFENKscpT35n0H3DOVnBpW0TXw7Owq4KjSTKJ2WkXSLI6UXOXWp6JBxIUP4
         IVYQ==
X-Gm-Message-State: APuU4Z+EA2rIIqlIJ/Id7JNnQONqqPkpHAo4dufbFT39FTi60cCBn+IP
	yOj1SaG8+OC2NQpU0AzGt7z/P3TOEqdtlIC8TSBGWb1ZhROyKBUZUyjkmvuaDy+Pzgg=
X-Gm-Gg: AZFdTZedVX4aRVFGpbAhQezTBO4/EfGJf2fsOjXOOMzo5JKU7xWZJ5S2xVXmYb4mNsM
	Cp0JziU6DiIzgPQtmzclfI6otm9K8mZxCMoAPOxbEBx+NSWPuBtulCdyt8c45Kn6mMUdWbPpm+8
	6bSR64c9qLkWOqu1/C1kRZxCXKnQLN2DRWmGEGYO6FyDmztBl0N6RUSzpTMF2tRNjwBQuUe4Zuy
	yRMpzinLCNqxQSUqMZjotTsjekij8hbzgM6Xuql09+i2LZWToD4Wwuwx0PXB5ezQjZ9tzXG4OFl
	7rzvUGiN2d3bF+7OiOaTRSyeC/7zLQXRNGwtJYLOkiKs3qAeWRbrCjoQFDhMezwstAR65VC2XzV
	FJOfN16t4b5MhwqdUnmSNSx373RB6HTHlL5JAU9/HmFyHn1thqwFAkuLoywpUf5/OQpemphQQtS
	TrstBKyTkMgUzL8HpPEsjf//NF5rmPE21lXHW+IY5H7200HVUIsw716uU4D0j6m9o1/bXaIPNIH
	chZlpiiZmMBUeNCkGPEMPrVlAImxoP6lN5eZ3NCYCL0xvFf+AzPCg6ZHThvb8bOdak1GGi/5TfM
	j7V8iiocygWc5tjsOPu5ShCKZCV+nSF8v2xWmA1/lb3urMut3FDM72IDtnEMM/hWh67xbENVW1D
	QEWJfnPWMvHH+t5xiVAXtQmzw
X-Received: by 2002:a05:600c:674b:b0:4bb:6847:791f with SMTP id 5b1f17b1804b1-4bb8880f267mr170364285e9.7.1795341285907;
        Sun, 22 Nov 2026 01:54:45 -0800 (PST)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Haseeb Ashraf <haseeb.ashraf@siemens.com>,
	sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	roger@xenproject.org
Subject: [XEN][PATCH v5 6/8] xen/arm: batch stage-2 removal with range flushes
Date: Sun, 22 Nov 2026 14:54:20 +0500
Message-ID: <4dbfc8f1332054d9883d2b6632741f5ee99aa6d1.1795336377.git.haseebashraf091@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795336377.git.haseebashraf091@gmail.com>
References: <cover.1795336377.git.haseebashraf091@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1795341286-C04DBB50-26F9318F/0/0
X-purgate-type: clean
X-purgate-size: 8123
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Haseeb Ashraf <haseeb.ashraf@siemens.com>

Removing pages from a guest p2m requires TLB invalidation. The cost is
particularly high when Xen runs under another hypervisor, where each
invalidation can trap to the outer hypervisor.

Add guest_physmap_remove_page_batch() to remove a list of pages under a
single p2m write lock and invalidate each contiguous run of changed GFNs
with one range-flush call. The range helper selects the TLBI method and
uses a full-VMID flush when a range exceeds the supported limit. Patch 7
adds the public hypercall that calls this helper.

An entry is checked at removal time, so a duplicate or missing GFN is
reported as -ENOENT, like single-page removal. Entries that were not
changed are excluded from invalidation; a removal that fails after
changing an entry is included.

The caller must hold a reference on each page until the invalidation is
complete. HAS_PHYSMAP_REMOVE_BATCH is selected for Arm MMU only; the MPU
p2m has no TLB invalidation by range.

Linux reference:
- KVM: arm64: Use TLBI range-based instructions for unmap, which
  similarly defers the stage-2 invalidation and coalesces it into
  ranges:
  https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=7657ea920c54218f123ddc1b572821695b669c13

Signed-off-by: Haseeb Ashraf <haseeb.ashraf@siemens.com>
---
New in v5.

 xen/arch/arm/Kconfig         |  1 +
 xen/arch/arm/p2m.c           | 97 ++++++++++++++++++++++++++++++++----
 xen/common/Kconfig           |  3 ++
 xen/include/xen/p2m-common.h | 16 ++++++
 4 files changed, 106 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index b9c5c40678..7ad676940b 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -85,6 +85,7 @@ config MMU
 	bool "MMU"
 	select ARCH_PAGING_MEMPOOL
 	select HAS_LLC_COLORING if !NUMA && ARM_64
+	select HAS_PHYSMAP_REMOVE_BATCH
 	select HAS_PMAP
 	select HAS_VMAP
 	select HAS_PASSTHROUGH
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index a39351ede9..c4f1f3709c 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -123,16 +123,18 @@ int p2m_insert_mapping(struct domain *d, gfn_t start_gfn, unsigned long nr,
     return rc;
 }
 
-static inline int p2m_remove_mapping(struct domain *d,
+/*
+ * Remove [start_gfn, start_gfn + nr) from the p2m. The caller must hold the
+ * p2m write lock and is responsible for flushing any removed entries.
+ */
+static int p2m_remove_mapping_locked(struct p2m_domain *p2m,
                                      gfn_t start_gfn,
                                      unsigned long nr,
                                      mfn_t mfn)
 {
-    struct p2m_domain *p2m = p2m_get_hostp2m(d);
     unsigned long i;
-    int rc;
 
-    p2m_write_lock(p2m);
+    ASSERT(p2m_is_write_locked(p2m));
 
     /*
      * Before removing the GFN - MFN mapping for any RAM pages make sure
@@ -150,17 +152,27 @@ static inline int p2m_remove_mapping(struct domain *d,
 
         if ( p2m_is_any_ram(t) &&
              (!mfn_valid(mfn) || !mfn_eq(mfn_add(mfn, i), mfn_return)) )
-        {
-            rc = -EILSEQ;
-            goto out;
-        }
+            return -EILSEQ;
 
         i += (1UL << cur_order) -
              ((gfn_x(start_gfn) + i) & ((1UL << cur_order) - 1));
     }
 
-    rc = p2m_set_entry(p2m, start_gfn, nr, INVALID_MFN,
-                       p2m_invalid, p2m_access_rwx);
+    return p2m_set_entry(p2m, start_gfn, nr, INVALID_MFN,
+                         p2m_invalid, p2m_access_rwx);
+}
+
+static inline int p2m_remove_mapping(struct domain *d,
+                                     gfn_t start_gfn,
+                                     unsigned long nr,
+                                     mfn_t mfn)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    int rc;
+
+    p2m_write_lock(p2m);
+
+    rc = p2m_remove_mapping_locked(p2m, start_gfn, nr, mfn);
 
     /*
      * The range that may have changed is known. Invalidate it instead of
@@ -175,12 +187,75 @@ static inline int p2m_remove_mapping(struct domain *d,
         p2m->need_flush = false;
     }
 
- out:
     p2m_write_unlock(p2m);
 
     return rc;
 }
 
+#ifdef CONFIG_HAS_PHYSMAP_REMOVE_BATCH
+/* Whether the removal of an entry may have changed the p2m. */
+static bool removal_touched_p2m(int err)
+{
+    /* These are returned before the p2m is modified. */
+    return err != -ENOENT && err != -EILSEQ;
+}
+
+void guest_physmap_remove_page_batch(struct domain *d,
+                                     const xen_pfn_t *gpfns,
+                                     const mfn_t *mfns,
+                                     int *errs,
+                                     unsigned int count)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    unsigned int i;
+
+    p2m_write_lock(p2m);
+
+    /* A flush that is still pending covers more than this batch. */
+    p2m_tlb_flush_sync(p2m);
+
+    /* __p2m_set_entry() only sets p2m->need_flush for a removed entry. */
+    for ( i = 0; i < count; i++ )
+    {
+        if ( mfn_eq(mfns[i], INVALID_MFN) ||
+             mfn_eq(p2m_get_entry(p2m, _gfn(gpfns[i]), NULL, NULL, NULL, NULL),
+                    INVALID_MFN) )
+            errs[i] = -ENOENT;
+        else
+            errs[i] = p2m_remove_mapping_locked(p2m, _gfn(gpfns[i]), 1,
+                                                mfns[i]);
+    }
+
+    /*
+     * Invalidate each run of consecutive entries that may have changed.
+     * The range helper selects the TLBI method and falls back to a full-VMID
+     * flush for ranges beyond its per-CPU limit. Include an entry whose
+     * removal failed after changing the p2m.
+     */
+    if ( p2m->need_flush )
+    {
+        for ( i = 0; i < count; i++ )
+        {
+            unsigned int first = i;
+
+            if ( !removal_touched_p2m(errs[i]) )
+                continue;
+
+            while ( i + 1 < count && removal_touched_p2m(errs[i + 1]) &&
+                    gpfns[i + 1] == gpfns[i] + 1 )
+                i++;
+
+            p2m_force_tlb_flush_range_sync(p2m, pfn_to_paddr(gpfns[first]),
+                                           i - first + 1);
+        }
+
+        p2m->need_flush = false;
+    }
+
+    p2m_write_unlock(p2m);
+}
+#endif /* CONFIG_HAS_PHYSMAP_REMOVE_BATCH */
+
 int map_regions_p2mt(struct domain *d,
                      gfn_t gfn,
                      unsigned long nr,
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index a619f2cef1..e687b59e8f 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -152,6 +152,9 @@ config HAS_KEXEC
 config HAS_LLC_COLORING
 	bool
 
+config HAS_PHYSMAP_REMOVE_BATCH
+	bool
+
 config HAS_PIRQ
 	bool
 
diff --git a/xen/include/xen/p2m-common.h b/xen/include/xen/p2m-common.h
index 0eb0619912..7a78c8b421 100644
--- a/xen/include/xen/p2m-common.h
+++ b/xen/include/xen/p2m-common.h
@@ -12,6 +12,22 @@ int __must_check
 guest_physmap_remove_page(struct domain *d, gfn_t gfn, mfn_t mfn,
                           unsigned int page_order);
 
+#ifdef CONFIG_HAS_PHYSMAP_REMOVE_BATCH
+/*
+ * Remove a batch of pages from a domain's p2m table.
+ *
+ * gpfns[] lists the frames. mfns[] holds, for each page the caller holds a
+ * reference on, its frame, or INVALID_MFN if there is no page. errs[]
+ * receives a result per entry. All entries are removed under one p2m write
+ * lock; changed contiguous runs are invalidated after processing the batch.
+ */
+void guest_physmap_remove_page_batch(struct domain *d,
+                                     const xen_pfn_t *gpfns,
+                                     const mfn_t *mfns,
+                                     int *errs,
+                                     unsigned int count);
+#endif
+
 /* Map MMIO regions in the p2m: start_gfn and nr describe the range in
  *  * the guest physical address space to map, starting from the machine
  *   * frame number mfn. */

