Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4216F606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 16:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=edera.dev header.i=@edera.dev header.a=rsa-sha256 header.s=google header.b=fxEif2nN
Received: from list by lists.xenproject.org with outflank-mailman.1465934.1676371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMpoh-0005h9-KR; Fri, 30 Oct 2026 16:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465934.1676371; Fri, 30 Oct 2026 16:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMpoh-0005h1-GX; Fri, 30 Oct 2026 16:50:59 +0000
Received: by outflank-mailman (input) for mailman id 1465934;
 Fri, 30 Oct 2026 16:50:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca@edera.dev>) id 1xMpog-0005g6-0E
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 16:50:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMpof-00HTpX-Cy
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 17:50:57 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca@edera.dev>)
 id 6ae4cab1-8faa-0a2a0a5109dd-0a2a45088dba-30
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 17:50:57 +0100
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luca@edera.dev>)
 id 6ae4caf1-f659-0a2a45080019-d155802ac1b0-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 17:50:57 +0100
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4a5036bbac7so5859245e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 09:50:57 -0700 (PDT)
Received: from framework13.home ([2a01:e11:3:1ff0:831:b00b:e409:f875])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf396dfdbsm74305045e9.1.2026.10.30.09.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 09:50:55 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=edera.dev header.i="@edera.dev" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edera.dev; s=google; t=1793379057; x=1793983857; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BHbJwlNel7oeXOuhSgNQ/cQeRQwXwAq7hTzL8o/4KZw=;
        b=fxEif2nNTz8myRDi8ueBoDhoG5Gi5nMM1XZWjb1faVcklVvCp3E5Gy7T/1wzMW9bID
         a7I4nMFaVMfw1+Orky71NO0sSop6Vqh+xAtR6joYlG3FRAhgpCh0lJE50hBRwkBljLpn
         klNc7ySSSSZU4b5hycive0BtMoM02pssBOkfUuI0VgfDI1OJ5h4i/N218bX59mcChbN4
         iX9KrSGwv2iB6gaaeawmktbzP4U86p9MmHX4F6ALDERTMuS1VPgaoDUH0ZgY9FqCFDoy
         aGk19d0e5x/RHY+Q9NwiIcDRpo8FQIn6yLfKcbBlUBTGe2m412lRTNqz2/aHIuAZ8Axi
         yKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793379057; x=1793983857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BHbJwlNel7oeXOuhSgNQ/cQeRQwXwAq7hTzL8o/4KZw=;
        b=EieI4nIl+naA6nmAOf7Ao8LH5MO5ldXcn+V3tMsJJq1VCN/6nBYEDUKGEAhJqz2/5P
         Kx0UCm0SEw3KSVHX20VvmqEhGzL2H1QL/O7odlmUd/rQIsCUBYc6t9ZLpIsqK2oqZDGF
         oARJc+xQfyVRBL33BuJbyY1dTPJAzLcj3jFR1Jqk3KR6W31LqGVZV/qd6n9F61QOLa4x
         3inDMCiLSgg9fWEWKCuAwaLe/EBdSdsulHFL6FiNncBmQ1wYhncBpr6FoTJuXjIdm4NR
         fX85j1139p1VE4VOIpYzIfl1mm8mPSEcjMY3EHsbOUnkfUVMlZITzG9mThWXV618oBNZ
         azPA==
X-Gm-Message-State: AFq9FYLV5tsi1aAeSF37loZysCEbNJNrhqN+neTa00N6VzpBsU9M/NqT
	/kVae+E+076jqiMEw5AMEz6bT0DdKvkuyBsOrMItECAh7htONdsfP4pD/2gZy1sYDXYWtKTEIjR
	PTVl69Ivztw==
X-Gm-Gg: AYBFou2vY4a6f5fNICVzm5/AYWUaFQfjLUaASNFY2wUUu0lOrA7O3AhzFFXfpUgadmA
	UPicaUA2lAv6JIWOzWw/VeOIW/PA0yT53Xoirnuvo26173gp77wFiIhJXLr8xeZ/cOwZm1s6Cz0
	glQUuV9vfoKHZ5ZVW+DnGSyqQhs7JNxN5iVmvIuYndJ6RfPGJIK54/WHHoWqPEY8aFlPfu7bSup
	Y14IrJZauSdmhc1Ql+qJJmYrpUX1SOVxYsNafBc+moaUV+nEdu98lKPAEXUYCwrfuHQvMYS43oP
	wuR13BJAm5HXPEcB410SL9nvVHPIZdPo3d9Z+YDCB8tursDDve0gWmxiUWmDYJmuTJ20JPbuJB2
	J8N1biLqwA11R8f/dMAi8U6jZDqv0J2qxkXI4bcZWg9OmShy2aewzkmWXC1SsMIO8Gr685Dh9wl
	ftc+J6f0AmN5MJMhXWvHD3jeBXiSNPaAu9zYPYkhjivu1Sxn4mJgbaxH/SauGiu56zTjB7c93Vh
	vWw0YM7WxKtjyFJ3XpjCiVbHWkQsK961ujbuVPc4BbfXPJGtEah+inIjHMDQsn4lnNI7XwU+JRQ
	kbqHauHu6SLJ2OmEE8Ld7S8lAnobxasfuRMEud/LdSlUay4=
X-Received: by 2002:a05:600c:34cf:b0:4a7:c366:d791 with SMTP id 5b1f17b1804b1-4ac150b38ebmr67069405e9.1.1793379056683;
        Fri, 30 Oct 2026 09:50:56 -0700 (PDT)
From: Luca Di Maio <luca@edera.dev>
To: xen-devel@lists.xenproject.org
Cc: Luca Di Maio <luca@edera.dev>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 2/3] x86/HVM: defer IOTLB flushes across a grant unmap batch
Date: Fri, 30 Oct 2026 17:50:09 +0100
Message-ID: <20261030165031.2560020-3-luca@edera.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030165031.2560020-1-luca@edera.dev>
References: <20261030165031.2560020-1-luca@edera.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1793379057-D694287B-5BE3560F/0/0
X-purgate-type: clean
X-purgate-size: 8479
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

gnttab_unmap_grant_ref() flushes the TLBs of a PV caller once per group
of GNTTAB_UNMAP_BATCH_SIZE unmaps. A translated caller instead gets an
IOTLB flush per page from the p2m code, so netback in a PVH dom0 issues
one for every page a domU transmits.

Open a batch for translated callers before each group, and end it next
to gnttab_flush_tlb(), so before unmap_common_complete() releases the
pages. Ending the batch flushes the smallest aligned power-of-two range
holding all the unmapped gfns, as VT-d flushes any other range as a
whole domain.

The batch lives in the vCPU, and iommu_dont_flush_iotlb isn't held
across the guest copies between the unmaps, as those can sleep on a
vm_event ring and change the p2m, e.g. by unsharing a page. If the
flush fails, the pages may still be reachable through the IOMMU, so
the group isn't completed and its pages leak.

PV callers, Arm, and other callers of replace_grant_host_mapping() are
unchanged.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: Luca Di Maio <luca@edera.dev>

---
 xen/arch/arm/include/asm/grant_table.h     |  3 ++
 xen/arch/x86/hvm/grant_table.c             | 47 +++++++++++++++++++++-
 xen/arch/x86/include/asm/grant_table.h     | 13 ++++++
 xen/arch/x86/include/asm/hvm/grant_table.h |  5 +++
 xen/arch/x86/include/asm/hvm/vcpu.h        |  9 +++++
 xen/common/grant_table.c                   |  6 +++
 6 files changed, 82 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/grant_table.h b/xen/arch/arm/include/asm/grant_table.h
index 7661a95341..66f90083db 100644
--- a/xen/arch/arm/include/asm/grant_table.h
+++ b/xen/arch/arm/include/asm/grant_table.h
@@ -40,6 +40,9 @@ int create_grant_host_mapping(uint64_t gpaddr, mfn_t frame,
 int replace_grant_host_mapping(uint64_t gpaddr, mfn_t frame,
                                uint64_t new_gpaddr, unsigned int flags);
 
+static inline void gnttab_unmap_batch_begin(void) {}
+static inline int gnttab_unmap_batch_end(void) { return 0; }
+
 /*
  * The region used by Xen on the memory will never be mapped in DOM0
  * memory layout. Therefore it can be used for the grant table.
diff --git a/xen/arch/x86/hvm/grant_table.c b/xen/arch/x86/hvm/grant_table.c
index afe449d888..1d7f9b19f9 100644
--- a/xen/arch/x86/hvm/grant_table.c
+++ b/xen/arch/x86/hvm/grant_table.c
@@ -41,6 +41,8 @@ int replace_grant_p2m_mapping(uint64_t addr, mfn_t frame,
     p2m_type_t type;
     mfn_t old_mfn;
     struct domain *d = current->domain;
+    struct hvm_grant_unmap_batch *batch = &current->arch.hvm.grant_unmap_batch;
+    int rc;
 
     if ( new_addr != 0 || (flags & GNTMAP_contains_pte) )
         return GNTST_general_error;
@@ -54,7 +56,25 @@ int replace_grant_p2m_mapping(uint64_t addr, mfn_t frame,
                  type, mfn_x(old_mfn), mfn_x(frame));
         return GNTST_general_error;
     }
-    if ( p2m_remove_page(d, _gfn(gfn), frame, PAGE_ORDER_4K) )
+
+    /* Not across the guest copies, which can change the p2m or sleep. */
+    if ( batch->open )
+    {
+        this_cpu(iommu_skipped_flush_flags) = 0;
+        this_cpu(iommu_dont_flush_iotlb) = true;
+    }
+
+    rc = p2m_remove_page(d, _gfn(gfn), frame, PAGE_ORDER_4K);
+
+    if ( batch->open )
+    {
+        this_cpu(iommu_dont_flush_iotlb) = false;
+        batch->iommu_flags |= this_cpu(iommu_skipped_flush_flags);
+        batch->gfn_lo = min(batch->gfn_lo, gfn);
+        batch->gfn_hi = max(batch->gfn_hi, gfn);
+    }
+
+    if ( rc )
     {
         put_gfn(d, gfn);
         return GNTST_general_error;
@@ -64,6 +84,31 @@ int replace_grant_p2m_mapping(uint64_t addr, mfn_t frame,
     return GNTST_okay;
 }
 
+void grant_p2m_unmap_batch_begin(void)
+{
+    struct hvm_grant_unmap_batch *batch = &current->arch.hvm.grant_unmap_batch;
+
+    ASSERT(!batch->open);
+    *batch = (struct hvm_grant_unmap_batch){ .open = true, .gfn_lo = ~0UL };
+}
+
+int grant_p2m_unmap_batch_end(void)
+{
+    struct domain *d = current->domain;
+    struct hvm_grant_unmap_batch *batch = &current->arch.hvm.grant_unmap_batch;
+    unsigned int order;
+
+    batch->open = false;
+
+    if ( !batch->iommu_flags )
+        return 0;
+
+    /* VT-d flushes any range but an aligned power of two as a whole domain. */
+    order = flsl(batch->gfn_lo ^ batch->gfn_hi);
+    return iommu_iotlb_flush(d, _dfn(ROUNDDOWN(batch->gfn_lo, 1UL << order)),
+                             1UL << order, batch->iommu_flags);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/include/asm/grant_table.h b/xen/arch/x86/include/asm/grant_table.h
index e939c9bacb..3aae47092f 100644
--- a/xen/arch/x86/include/asm/grant_table.h
+++ b/xen/arch/x86/include/asm/grant_table.h
@@ -32,6 +32,19 @@ static inline int replace_grant_host_mapping(uint64_t addr, mfn_t frame,
     return replace_grant_pv_mapping(addr, frame, new_addr, flags);
 }
 
+static inline void gnttab_unmap_batch_begin(void)
+{
+    if ( paging_mode_external(current->domain) )
+        grant_p2m_unmap_batch_begin();
+}
+
+static inline int __must_check gnttab_unmap_batch_end(void)
+{
+    if ( paging_mode_external(current->domain) )
+        return grant_p2m_unmap_batch_end();
+    return 0;
+}
+
 #define gnttab_get_frame_gfn(gt, st, idx) ({                             \
     mfn_t mfn_ = (st) ? gnttab_status_mfn(gt, idx)                       \
                       : gnttab_shared_mfn(gt, idx);                      \
diff --git a/xen/arch/x86/include/asm/hvm/grant_table.h b/xen/arch/x86/include/asm/hvm/grant_table.h
index 01e23f79b8..9877262f51 100644
--- a/xen/arch/x86/include/asm/hvm/grant_table.h
+++ b/xen/arch/x86/include/asm/hvm/grant_table.h
@@ -19,6 +19,8 @@ int create_grant_p2m_mapping(uint64_t addr, mfn_t frame,
                              unsigned int cache_flags);
 int replace_grant_p2m_mapping(uint64_t addr, mfn_t frame,
                               uint64_t new_addr, unsigned int flags);
+void grant_p2m_unmap_batch_begin(void);
+int grant_p2m_unmap_batch_end(void);
 
 #else
 
@@ -37,6 +39,9 @@ static inline int replace_grant_p2m_mapping(uint64_t addr, mfn_t frame,
     return GNTST_general_error;
 }
 
+static inline void grant_p2m_unmap_batch_begin(void) {}
+static inline int grant_p2m_unmap_batch_end(void) { return 0; }
+
 #endif
 
 #endif /* __X86_HVM_GRANT_TABLE_H__ */
diff --git a/xen/arch/x86/include/asm/hvm/vcpu.h b/xen/arch/x86/include/asm/hvm/vcpu.h
index 876c230784..12b7e9b707 100644
--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -108,6 +108,13 @@ struct altp2mvcpu {
 
 #define vcpu_altp2m(v) ((v)->arch.hvm.avcpu)
 
+/* Per vCPU, as the guest copies between the unmaps can sleep. */
+struct hvm_grant_unmap_batch {
+    bool          open;
+    unsigned int  iommu_flags;
+    unsigned long gfn_lo, gfn_hi;
+};
+
 struct hvm_vcpu {
     /* Guest control-register and EFER values, just as the guest sees them. */
     unsigned long       guest_cr[5];
@@ -172,6 +179,8 @@ struct hvm_vcpu {
     /* Pending hw/sw interrupt (.vector = -1 means nothing pending). */
     struct x86_event     inject_event;
 
+    struct hvm_grant_unmap_batch grant_unmap_batch;
+
 #ifdef CONFIG_VIRIDIAN
     struct viridian_vcpu *viridian;
 #endif
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index b15805f3f9..ade42b4cb4 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1722,6 +1722,7 @@ gnttab_unmap_grant_ref(
         c = min(count, (unsigned int)GNTTAB_UNMAP_BATCH_SIZE);
         partial_done = 0;
 
+        gnttab_unmap_batch_begin();
         for ( i = 0; i < c; i++ )
         {
             if ( unlikely(__copy_from_guest(&op, uop, 1)) )
@@ -1734,6 +1735,9 @@ gnttab_unmap_grant_ref(
         }
 
         gnttab_flush_tlb(current->domain);
+        /* After a failed flush the pages may still be reachable: leak them. */
+        if ( gnttab_unmap_batch_end() )
+            partial_done = 0;
 
         for ( i = 0; i < partial_done; i++ )
             unmap_common_complete(&common[i]);
@@ -1749,6 +1753,8 @@ gnttab_unmap_grant_ref(
 
 fault:
     gnttab_flush_tlb(current->domain);
+    if ( gnttab_unmap_batch_end() )
+        partial_done = 0;
 
     for ( i = 0; i < partial_done; i++ )
         unmap_common_complete(&common[i]);
-- 
2.54.0


