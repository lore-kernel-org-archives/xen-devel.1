Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3671606A328
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 08:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=edera.dev header.i=@edera.dev header.a=rsa-sha256 header.s=google header.b=De2RiAai
Received: from list by lists.xenproject.org with outflank-mailman.1476314.1682469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPF0i-0007bd-PW; Fri, 06 Nov 2026 08:09:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1476314.1682469; Fri, 06 Nov 2026 08:09:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPF0i-0007bT-MM; Fri, 06 Nov 2026 08:09:20 +0000
Received: by outflank-mailman (input) for mailman id 1476314;
 Fri, 06 Nov 2026 08:09:19 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca@edera.dev>) id 1xPF0h-0007Zw-5k
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 08:09:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPF0g-000tMz-J0
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 09:09:18 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca@edera.dev>)
 id 6aed8b2a-8faa-0a2a0a5109dd-0a2a4509b500-10
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 09:09:18 +0100
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luca@edera.dev>)
 id 6aed8b2e-be1a-0a2a45090019-d155dd30cd6a-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 09:09:18 +0100
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-48dfc0421d9so338353f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 00:09:18 -0800 (PST)
Received: from framework13.home ([2a01:e11:3:1ff0:831:b00b:e409:f875])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492ff85585esm1534507f8f.5.2026.11.06.00.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 00:09:17 -0800 (PST)
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
        d=edera.dev; s=google; t=1793952558; x=1794557358; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IEKAEyHBNOdxjTO8grr2RcMiadnMYmahTPI5OWv+TvE=;
        b=De2RiAaiB2O14DOFE0sO/fUsQzGpTH+zjsT2Y811te+E9w6w141GKwDfPh2QWIHBdw
         X0k/tDzWDwWzAcAR2eZ8LOR5TkTlfNgiDyvP9rzA/PWUKzpnliSyRq6Y/iRa5N76kajP
         bDoWbs6nhsaCLd8ZBacVUxBnDOIOxZp+qOb+mWyGhaMadHtxb+mtXk0UbDtaXw4Z+zsA
         7PZthVM0HAmn5Dz68Evv80PBMsHzT0MkHgWwWFSWVMwEFA6siEzjlgto0YA3asqqmldm
         oVCGvLoat0O6NnmlsiRqnVC3K+Lipskr4wW9qHDUn0zk7dg4Lq814wAOigCvn+T+e1w/
         IZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952558; x=1794557358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IEKAEyHBNOdxjTO8grr2RcMiadnMYmahTPI5OWv+TvE=;
        b=0Y00uN/LgLcjbo6TAsHLKEL37HqEEZy+iFDa8y5iKOHBt79apdOqTgfrEQNYeBQCYs
         lwhSp26W4l7PATIpkpB2vsZFDJdafEgeCNA+0vDVHM/xme0fK8pQZj8A3RDkZdKKuiCE
         6sRz/dO1S+V8lZttxsDrEWBpmGtarnU6gKm0Ra0WXWdRF97mO3XLuyPnXxscWIZ9+Yt9
         zsJAjnYtuuPBMPiEevlMrwWKCcM2fX9qza8Rd2jWGeOwfoWGdbj6orW2W4siFKg977G6
         boFGwityzmGD5MbgsHzYUM1AyzT2Am+KIesxXFMshqdexsd2gBPMGgtVReddJooIlHvN
         wIpg==
X-Gm-Message-State: APuU4Z+Tc1kBOwhKcbCUYf2jWxqSgh/S4fSg/zfH1QgAqZb52eM5HXPw
	ZYv3MsHxVrs59YFIDvSWipCieF/AgQX1FtlPSnOa52hwhcdz9jwDd0MqsdZYQRjAgBUL8fJ/RWV
	/J57pksc=
X-Gm-Gg: AYBFou3iW5T4FxUs4eBfbu4lukaeGPE+rVRIDe6AGdAvGR3J7/KaXVXJYReR/fn5SBa
	RDa9CgT+UDcCvabHen8bK46aLpi7Xl7Z5kNF7waCdEbaI2pKtgZ2jEITeuSGlJONCtHuFVz/y8L
	s9FJ391Z7zXBLjp/b7lseaOaYm3kRMFkzdQr9MdmYYsxI8X8aY2WxmxjhpJV4NDGkKFlp/W8OLb
	W81q2afTmnXaGvcDlVFlAyVYyX0lUwlAQozJM9NoYvE5Os8rnDoBKTg+mmCJbVGrQ1WqAO9T0Uc
	rst/XyLctqn44uYysNKDDPWB+foLc/79anBkyr5FnfnLob8U6TNtx8xIhCV85g2nYU2r4CF+Aud
	BmXGCIZB6zJKa5T639GIimmQMKbelw9G584gPULuZ+LJVE6APMz0ONE9dQA0Nzw/+oISpDXyGLs
	EWo6/jfADb45tr0QNxTjqzzBvtmusj0JC4VFDrUDL5R4T8uWwAyzmJIyHAr+CHiD2H7ajxjFjQY
	48JvxmVULmgw1ibLooV6gEsTyijLCpWPKd6Z5UUG3LfyLV6DuMqaW5zWhCMClWy1683Rdqtivdf
	+VzPsxVwykJWNQLJNgB+UpIkgA==
X-Received: by 2002:a05:6000:2dc2:b0:48d:db77:d124 with SMTP id ffacd0b85a97d-49273e5bcb5mr3324321f8f.6.1793952557946;
        Fri, 06 Nov 2026 00:09:17 -0800 (PST)
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
Subject: [PATCH v2 2/4] IOMMU: record the flushes skipped under iommu_dont_flush_iotlb
Date: Fri,  6 Nov 2026 09:08:52 +0100
Message-ID: <20261106080859.2285309-3-luca@edera.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106080859.2285309-1-luca@edera.dev>
References: <20261106080859.2285309-1-luca@edera.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1793952558-BFAD0034-3315047D/0/0
X-purgate-type: clean
X-purgate-size: 4385
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

While iommu_dont_flush_iotlb is set, iommu_legacy_map(),
iommu_legacy_unmap() and the shared-EPT path of ept_set_entry() skip
their IOTLB flush and drop its range and flags, so a caller deferring
the flush has to work out what to flush on its own.

Check the flag in iommu_iotlb_flush() instead, which all three call,
and record what it skips in the per-CPU iommu_skipped_flush: the
smallest range covering the skipped flushes, and their flags. No other
caller of iommu_iotlb_flush() runs while the flag is set, and the code
setting it clears it before its own flush. The next patch uses the
record for grant unmaps.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: Luca Di Maio <luca@edera.dev>

---
Changes in v2:
- Check the flag in iommu_iotlb_flush() rather than in its callers,
  which also drops the duplicated flags in ept_set_entry() (Teddy).
- Record the range of the skipped flushes as well as their flags
  (Teddy).
- Store the flags as unsigned int in struct iommu_skipped_flush, instead
  of a uint8_t checked by a BUILD_BUG_ON() (Teddy, Jan).
---
 xen/arch/x86/mm/p2m-ept.c       |  2 +-
 xen/drivers/passthrough/iommu.c | 17 +++++++++++++++--
 xen/include/xen/iommu.h         |  6 ++++++
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index 204bdb054a..33c3d8fc58 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -976,7 +976,7 @@ out:
     if ( rc == 0 && p2m_is_hostp2m(p2m) &&
          need_modify_vtd_table )
     {
-        if ( iommu_use_hap_pt(d) && !this_cpu(iommu_dont_flush_iotlb) )
+        if ( iommu_use_hap_pt(d) )
             rc = iommu_iotlb_flush(d, _dfn(gfn), 1ul << order,
                                    (iommu_flags ? IOMMU_FLUSHF_added : 0) |
                                    (vtd_pte_present ? IOMMU_FLUSHF_modified
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 4b22ecfe65..8e97086601 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -64,6 +64,7 @@ bool __read_mostly iommu_hap_pt_share = true;
 bool __read_mostly iommu_debug;
 
 DEFINE_PER_CPU(bool, iommu_dont_flush_iotlb);
+DEFINE_PER_CPU(struct iommu_skipped_flush, iommu_skipped_flush);
 
 static int __init cf_check parse_iommu_param(const char *s)
 {
@@ -390,7 +391,7 @@ int iommu_legacy_map(struct domain *d, dfn_t dfn, mfn_t mfn,
     ASSERT(!(flags & IOMMUF_preempt));
     rc = iommu_map(d, dfn, mfn, page_count, flags, &flush_flags);
 
-    if ( !this_cpu(iommu_dont_flush_iotlb) && !rc )
+    if ( !rc )
         rc = iommu_iotlb_flush(d, dfn, page_count, flush_flags);
 
     return rc;
@@ -458,7 +459,7 @@ int iommu_legacy_unmap(struct domain *d, dfn_t dfn, unsigned long page_count)
     unsigned int flush_flags = 0;
     int rc = iommu_unmap(d, dfn, page_count, 0, &flush_flags);
 
-    if ( !this_cpu(iommu_dont_flush_iotlb) && !rc )
+    if ( !rc )
         rc = iommu_iotlb_flush(d, dfn, page_count, flush_flags);
 
     return rc;
@@ -488,6 +489,18 @@ int iommu_iotlb_flush(struct domain *d, dfn_t dfn, unsigned long page_count,
     if ( dfn_eq(dfn, INVALID_DFN) )
         return -EINVAL;
 
+    if ( this_cpu(iommu_dont_flush_iotlb) )
+    {
+        struct iommu_skipped_flush *skipped = &this_cpu(iommu_skipped_flush);
+
+        skipped->first = _dfn(min(dfn_x(skipped->first), dfn_x(dfn)));
+        skipped->last = _dfn(max(dfn_x(skipped->last),
+                                 dfn_x(dfn) + page_count - 1));
+        skipped->flags |= flush_flags;
+
+        return 0;
+    }
+
     rc = iommu_call(hd->platform_ops, iotlb_flush, d, dfn, page_count,
                     flush_flags);
     if ( unlikely(rc) )
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 37c4a1dc82..a2aeaf8d41 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -502,6 +502,12 @@ void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev);
  */
 DECLARE_PER_CPU(bool, iommu_dont_flush_iotlb);
 
+struct iommu_skipped_flush {
+    dfn_t first, last;
+    unsigned int flags;
+};
+DECLARE_PER_CPU(struct iommu_skipped_flush, iommu_skipped_flush);
+
 bool arch_iommu_use_permitted(const struct domain *d);
 
 #ifdef CONFIG_X86
-- 
2.47.3


