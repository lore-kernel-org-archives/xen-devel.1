Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049D2606A32C
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 08:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=edera.dev header.i=@edera.dev header.a=rsa-sha256 header.s=google header.b=k+0SzDoS
Received: from list by lists.xenproject.org with outflank-mailman.1476315.1682478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPF0m-0007sF-4l; Fri, 06 Nov 2026 08:09:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1476315.1682478; Fri, 06 Nov 2026 08:09:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPF0m-0007s8-0b; Fri, 06 Nov 2026 08:09:24 +0000
Received: by outflank-mailman (input) for mailman id 1476315;
 Fri, 06 Nov 2026 08:09:22 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca@edera.dev>) id 1xPF0k-0007pV-1x
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 08:09:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPF0j-005S4K-Eq
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 09:09:21 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca@edera.dev>)
 id 6aed8b2e-bab6-0a2a0a5309dd-0a2a450a95a4-16
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 09:09:21 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luca@edera.dev>)
 id 6aed8b31-f2d2-0a2a450a0019-d155802bddc5-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 09:09:21 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4b4571ff080so3659665e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 00:09:21 -0800 (PST)
Received: from framework13.home ([2a01:e11:3:1ff0:831:b00b:e409:f875])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492ff85585esm1534507f8f.5.2026.11.06.00.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 00:09:20 -0800 (PST)
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
        d=edera.dev; s=google; t=1793952561; x=1794557361; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QoFzDdd2lf6UxmsRhpAJjlVL9PKwQJXX6SC5k0LavRI=;
        b=k+0SzDoSEuOQWH7eqtjicU4suJwSA9VdEG27Sjpr15j/YCv2h1xY3nGTYlEv8P2s/J
         C+VpFAWXBjVdhuP59M9i+/mvi1SPkshqnOKHnaWBzgHfqzlIjcaDbbpDN5JSfrCX1sm8
         gJTdS6j76WwZ2tJdmIX8086vIoClWRIV3IUsdfMItDbOyWaarBDzdNCeyehlL+fQMY9E
         zA7RP7Pf5MrDNyP74yZKWeDKiDQ2cBWib8GZA7EjHCJRpq7+bGaWKtgTs03LFuxViG1x
         6KldP9cyt8uZ5fzEnjWFlWEVJfamMjbpk9xWOfDMCPrvnwSdPYf40emz5O2qZl5Z0Tow
         0R5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952561; x=1794557361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QoFzDdd2lf6UxmsRhpAJjlVL9PKwQJXX6SC5k0LavRI=;
        b=ztsQNXbuRI3O51IX2D2cNzckFIbe7vrh//I2XnJTolTv7sbWvjw8+ZHXFPlPgAHLxt
         4YRU3h1VK/0rhV7N0IN9HpiJ+0mma5DWJZHg3GMIvrFB10ahYNz0rMvE5stj6Zfdd4VL
         TydTPHHA/6o8ulzNOcCYsHPfaMJWRnA3nsRMYobczirV0ulmu5ScbE+6OEZD9Klo7ikM
         R+PCkldq51QBZLXUyt0TU0vpWjiGfh6K5EGiQfOoFEPUi7ZHE7KL6bhyt074+UxaIpAw
         F9UQcM44LqzmCg5+BLV96kLvOpiVXYCsDmAWny3SJ1FoIvyIUoPip6zlVCL1JSmr1XQg
         x0cg==
X-Gm-Message-State: APuU4Z9mWDiPTJl+oQrD28yutPhxf3mfcsm5MbVtc9c00v/vTSMTD36L
	c7gMv3B4WKm0O9r8xycJ71WbQOtUEshW04hXg/53MzQvVfaSsjVzSuiBdC5kjw+cb9B0RcTv2UM
	IP1Pfmxc=
X-Gm-Gg: AYBFou0FZlCcUTZ7lZqC2qegMtrON1VUFpOBYRe78VxVpuQqJ3Expac8ifEGPeICcy2
	jf0kLwpV4XOaWS8qbUZR0UKCWRDlarkGjbgwtPfUin+NeaLT+YKtuG5MJxa63Sxc38v6AAyjMhU
	TH/WZVDrf4Ui5XI0W2wYARMpB+MZjc3bnqY5HSOGCJOV5PXZD9Kqam0dD8JZVZSRyZ/gDI4RW+P
	mrko6vDV8zEDNtL9URK+6UTRg2EdjbSCK/6cSI0vfel0fV3lDxg7can1L5h0ypdsqxGY94AA0Ia
	bDfW+A53j7yhH/DhWCMJi//pUAVpm3U6l6A43B+iqP87Z91vpYH1IElhYZtTH5pi3OXdiRCn5bO
	qaz/B/lAoTbMCrSMCGofHh1RhqqzynY857WzbzLDAskQswmcdKVtZI0c7o8F2ziiF59fXewBubC
	xCHjzEdZNsfXUqAsS0TlRnCvnAU6r7rrKuQvCHB0+D9AKc4HrYPp0NloeMRosuIwgx5w+vYJeJ5
	1lKOLKXWFY4jfvTy3ZsKGwLqx4F1uHH2f/TKmEy9HWLmjN6ykNneHm8JBrQHqYlG634enuubCgL
	2ecFE1WtkH1Dg7ZMzTk48SmJpg==
X-Received: by 2002:a05:6000:2488:b0:48e:2448:ea23 with SMTP id ffacd0b85a97d-4927807f0a8mr3734805f8f.55.1793952560685;
        Fri, 06 Nov 2026 00:09:20 -0800 (PST)
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
Subject: [PATCH v2 3/4] x86/HVM: defer IOTLB flushes across a grant unmap batch
Date: Fri,  6 Nov 2026 09:08:53 +0100
Message-ID: <20261106080859.2285309-4-luca@edera.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106080859.2285309-1-luca@edera.dev>
References: <20261106080859.2285309-1-luca@edera.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1793952561-59DDFCFC-56EE003E/0/0
X-purgate-type: clean
X-purgate-size: 8732
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
pages. Ending the batch issues one flush covering the flushes the
unmaps skipped, as iommu_skipped_flush recorded them.

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
Changes in v2:
- Flush the range recorded in iommu_skipped_flush, rather than one
  derived from the unmapped gfns (Teddy).
- Leave rounding the range to an aligned power of two to VT-d, in
  patch 1 (Teddy).
---
 xen/arch/arm/include/asm/grant_table.h     |  3 ++
 xen/arch/x86/hvm/grant_table.c             | 49 +++++++++++++++++++++-
 xen/arch/x86/include/asm/grant_table.h     | 13 ++++++
 xen/arch/x86/include/asm/hvm/grant_table.h |  5 +++
 xen/arch/x86/include/asm/hvm/vcpu.h        |  9 ++++
 xen/common/grant_table.c                   |  6 +++
 6 files changed, 84 insertions(+), 1 deletion(-)

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
index afe449d888..5ecba6db65 100644
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
@@ -54,7 +56,29 @@ int replace_grant_p2m_mapping(uint64_t addr, mfn_t frame,
                  type, mfn_x(old_mfn), mfn_x(frame));
         return GNTST_general_error;
     }
-    if ( p2m_remove_page(d, _gfn(gfn), frame, PAGE_ORDER_4K) )
+
+    /* Not across the guest copies, which can change the p2m or sleep. */
+    if ( batch->open )
+    {
+        this_cpu(iommu_skipped_flush) =
+            (struct iommu_skipped_flush){ .first = INVALID_DFN };
+        this_cpu(iommu_dont_flush_iotlb) = true;
+    }
+
+    rc = p2m_remove_page(d, _gfn(gfn), frame, PAGE_ORDER_4K);
+
+    if ( batch->open )
+    {
+        const struct iommu_skipped_flush *skipped =
+            &this_cpu(iommu_skipped_flush);
+
+        this_cpu(iommu_dont_flush_iotlb) = false;
+        batch->iommu_flags |= skipped->flags;
+        batch->dfn_first = min(batch->dfn_first, dfn_x(skipped->first));
+        batch->dfn_last = max(batch->dfn_last, dfn_x(skipped->last));
+    }
+
+    if ( rc )
     {
         put_gfn(d, gfn);
         return GNTST_general_error;
@@ -64,6 +88,29 @@ int replace_grant_p2m_mapping(uint64_t addr, mfn_t frame,
     return GNTST_okay;
 }
 
+void grant_p2m_unmap_batch_begin(void)
+{
+    struct hvm_grant_unmap_batch *batch = &current->arch.hvm.grant_unmap_batch;
+
+    ASSERT(!batch->open);
+    *batch = (struct hvm_grant_unmap_batch){ .open = true, .dfn_first = ~0UL };
+}
+
+int grant_p2m_unmap_batch_end(void)
+{
+    struct domain *d = current->domain;
+    struct hvm_grant_unmap_batch *batch = &current->arch.hvm.grant_unmap_batch;
+
+    batch->open = false;
+
+    if ( !batch->iommu_flags )
+        return 0;
+
+    return iommu_iotlb_flush(d, _dfn(batch->dfn_first),
+                             batch->dfn_last - batch->dfn_first + 1,
+                             batch->iommu_flags);
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
index 876c230784..990411e2c7 100644
--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -108,6 +108,13 @@ struct altp2mvcpu {
 
 #define vcpu_altp2m(v) ((v)->arch.hvm.avcpu)
 
+/* Per vCPU, as the guest copies between the unmaps can sleep. */
+struct hvm_grant_unmap_batch {
+    bool          open;
+    unsigned int  iommu_flags;
+    unsigned long dfn_first, dfn_last;
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
2.47.3


