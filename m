Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C248CA5FF0
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 13:07:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441494.1659097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE4sk-0000Je-RB; Tue, 06 Oct 2026 13:06:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441494.1659097; Tue, 06 Oct 2026 13:06:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE4sk-0000JX-Ob; Tue, 06 Oct 2026 13:06:58 +0000
Received: by outflank-mailman (input) for mailman id 1441494;
 Tue, 06 Oct 2026 13:06:57 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <coolhaoyt@gmail.com>) id 1xE4sj-0000JR-P4
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 13:06:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xE4si-00Acg7-GJ
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 15:06:56 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <coolhaoyt@gmail.com>)
 id 6ac4f26e-bab6-0a2a0a5309dd-0a2a45028844-8
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 15:06:56 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <coolhaoyt@gmail.com>)
 id 6ac4f270-6ca4-0a2a45020019-d1558031c063-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 15:06:56 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a1698ea378so5787305e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 06:06:56 -0700 (PDT)
Received: from LukeW.manchester.ac.uk (uom-130-88-226-5.manchester.ac.uk.
 [130.88.226.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a03043fae5sm254460855e9.0.2026.10.06.06.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 06:06:54 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791292016; x=1791896816; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFYOvHs1zHB2tYA6ImDHS5zPbAzxghlTOpxWyn9IDQI=;
        b=GArXisX0hHMK96EjcPYs2snlXiwxQCzet2xcZLMbuzDmzEFDQg30f22EFLHE2EVPeE
         dv5JhBFaARRR9yKN14P7vMPPby3FmNo5Yrxt/zy3ZOTUm7m7JHZcd5OvOVLbug1pXDnd
         6i0BcmrCfRj5o5aotZMgCRaQFUqerqqTb+ucacWjLVXEqSprKI//+I4JqXAPjRG3nLZu
         xwhmBV4KAhCIqBi4mg1zCYNdtagxfsswyfQdmVUPp/KDhj2pKuu/slBEuRC5WtNOfVTC
         lzu0RKLCEUVn4X72idatvKS7TQlIj8v8gTvjZ+sWYDJx3gcDWywNQj9LWp0nqFe4K8YT
         1wwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791292016; x=1791896816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WFYOvHs1zHB2tYA6ImDHS5zPbAzxghlTOpxWyn9IDQI=;
        b=lM9MkzXxwaoFDo9fbgsKSqIXEJ0wWWHSDrKf4Gv6mdcOoZk4oOdA2kCUEA0WW7Zn+C
         rB5aca+MIP1pvNCe9bYY7cbua19jNTWeDqeVnXA3WiU47MEc6uQ972BAOPaSw+6ZXODy
         s0UEcmLcqTteSSJTjPPuzGwNngQt+6A59SQD0qY81/O69LCzl2VQ5tWDKta7/AKdBP5X
         joMfi6t6DTHMGg3bpXl8HXCfhdyfj+C/I2UAUeuz2X5X6UwVgQLZh7bcY+QPZH/XGW7a
         a0F9WmqQUie1WT2lVc/QH1cLaqr1qkDL1r6rqKn20w/PNrdcNFNb7YDAJfezyBT1F7+Z
         1w4g==
X-Gm-Message-State: AFuF++m1v7lvMnasmgmDU2XTbVaie4Qg46JovFa/bGrFSbcEBbCYNxqH
	kunI4b1QOMkHyA8a1rHAAbJWd2msCzFVG+8wlUt1wm6JDgVgdqPPP89zfLghcH1Ypu0=
X-Gm-Gg: AYBFou3IpFx42KLVJttDbvjQDmavLkBhSK3CGvrVtNGA3JKkDFRmbE5XYZXtvbuFv53
	v8CRkLO4O+/agbyLKoOgddMafikypOWunsUTrqzeAVGIhgcuexPoroGPhVgrleyC5ooAGGPXYAr
	sc0Jp3KTLEl1aaJd3MYMAk0Oq22ULW1jw5pyOEpXhd4X0yk/0PhfEphoZZ5ZctePywrgHBhv5y0
	P7+iqHOrl1YRJKQECk+ymQuUH877XCfd4eULTpxZorCxwhII7dgefTtB2rzYbLALooFjtMtJ8Js
	dbLeZJ7yR6wShGIUF/8sF4z+Bo20cYuosLeU87N1QSMvKK1c8CVehsjj+Og9fQf3/nEBPSA4aAr
	XPC1bOfr6qHdJE/XutDGB0Dp78sbrrjdnZp76Zed/SqMFmy1zG+sPcwMZGrSgexEVVgTmqP1kNs
	dwjd8nFmoY8atCl10hAwF2n574RWv+PiWx8zJot+RmBlPsCoVpuv5IzE10iXwVFXCUZZv/9LP1m
	s5qwWIqJ1e+N2HAvU/FVueXC/8ttk0U/bp4oZCXk7uBV6s=
X-Received: by 2002:a05:600d:9:b0:4a0:2391:6529 with SMTP id 5b1f17b1804b1-4a17b55241fmr25854435e9.29.1791292014912;
        Tue, 06 Oct 2026 06:06:54 -0700 (PDT)
From: Weiqi Wang <coolhaoyt@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	michal.orzel@amd.com,
	julien@xen.org,
	sstabellini@kernel.org,
	roger@xenproject.org,
	lucas.cordeiro@manchester.ac.uk,
	Weiqi Wang <weiqi.wang-2@postgrad.manchester.ac.uk>
Subject: [PATCH v3 2/2] xen/pdx: reject regions crossing a lookup table index
Date: Tue,  6 Oct 2026 14:06:50 +0100
Message-Id: <71fe1a0cff0563db66df7f427d115fdd1953938e.1791291898.git.weiqi.wang-2@postgrad.manchester.ac.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <c3ba7ec05772614c4f84f9bba1e4f3e54d21c14d.1791291898.git.weiqi.wang-2@postgrad.manchester.ac.uk>
References: <c3ba7ec05772614c4f84f9bba1e4f3e54d21c14d.1791291898.git.weiqi.wang-2@postgrad.manchester.ac.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1791292016-30FCE2AC-0EA17957/0/0
X-purgate-type: clean
X-purgate-size: 6148

From: Weiqi Wang <weiqi.wang-2@postgrad.manchester.ac.uk>

pdx_is_region_compressible() only looks up the table entry of the first
page, and checks the region against [pfn_base, pfn_base +
pdx_region_size).  pfn_base need not be aligned to the table index
granularity, so that window can extend into the next index, which belongs
to a different range with a different offset.  A region whose tail lies
there is reported compressible, yet its last page on its own is not, and
translates through the wrong offset.

Require the first and last page of the region to use the same table
index.

This can be reached from the coverage check in srat_parse_regions() when an
e820 RAM range is not covered by the SRAT ranges, which is the case that
check is meant to catch.

Add a test case that fails without this change.

Found with the ESBMC bounded model checker, and confirmed by running the
failing case natively against the unmodified code.

Fixes: c5c45bcbd6a1 ("pdx: introduce a new compression algorithm based on region offsets")
Assisted-by: Claude Code:claude-opus-5-5 # finding the issue with ESBMC, patch creation
Signed-off-by: Weiqi Wang <weiqi.wang-2@postgrad.manchester.ac.uk>
---

Notes:
    Changes in v3:
    - reword the second paragraph to start with "Require" (Roger)
    - reword the ESBMC line so it no longer names a counterexample that is
      not part of the commit log (Roger)
    - add the reproduction as a test case in tools/tests/pdx (Roger)
    
    Changes in v2:
    - the issue is not tied to huge addresses (Jan): replaced the example
      with a ~5 GB reproduction and dropped the 2^51 remark
    
    This was discussed when the offset compression was reviewed.  In the v2
    thread [1] Jan asked whether pdx_is_region_compressible() is correct when
    a region crosses a lookup table slot boundary.  The thread concluded it
    was not an issue, on the basis that pages contiguous in MFN space are also
    contiguous in PDX space.  The case below is one where that does not hold
    for the code as merged: the region is reported compressible, its last page
    on its own is not, and that page round-trips to a different PFN.
    
    The ranges are as srat_parse_regions() would see them.  The RAM range is
    not covered by either SRAT range, which is the situation the coverage
    check in srat_parse_regions() is meant to detect.  On staging plus the
    first patch of this series, before this patch:
    
      region [0x4ca9b, 0x12982e) compressible: 1
      last page: pfn 0x12982d -> pdx 0xa982d -> pfn 0xe982d
    
    With this patch the region is reported not compressible, and
    srat_parse_regions() disables compression.  The test case added here is
    this same ~5 GB layout, checked through pdx_is_region_compressible()
    directly; it fails before the change and passes after.  The existing
    tests in tools/tests/pdx continue to pass in both mask and offset mode.
    
    Other callers that rely on the same answer are mem_hotadd_check() and the
    EFI ram_range_valid() check.  I have not run those paths.
    
    One behavioural change to check: with npages == 0 the new condition
    compares against pfn - 1.  The callers I looked at never pass 0.
    
    Model checking (ESBMC, 2 SRAT ranges and 2 e820 RAM ranges, all free
    within a bounded address range, the srat_parse_regions() coverage check
    modelled) finds no accepted RAM page that fails to round-trip with both
    patches applied.  It also finds no layout where the coverage check now
    rejects what setup accepted, with RAM equal to the SRAT ranges.  This is
    bounded to 2 ranges.
    
    [1] https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg194095.html

 tools/tests/pdx/test-pdx.c | 33 +++++++++++++++++++++++++++++++++
 xen/common/pdx.c           |  3 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/tools/tests/pdx/test-pdx.c b/tools/tests/pdx/test-pdx.c
index 6728ffc7a5..10c659b775 100644
--- a/tools/tests/pdx/test-pdx.c
+++ b/tools/tests/pdx/test-pdx.c
@@ -288,6 +288,39 @@ int main(int argc, char **argv)
         }
     }
 
+#ifdef CONFIG_PDX_OFFSET_COMPRESSION
+    /*
+     * srat_parse_regions() passes e820 RAM ranges to
+     * pdx_is_region_compressible(), and these can be wider than any single
+     * SRAT range.  A region must be rejected when its first and last page
+     * resolve through different lookup table indices, even if it fits within
+     * pdx_region_size.  The values are PFNs from a ~5 GiB layout.
+     */
+    {
+        unsigned long ram_start = 0x4ca9bUL, ram_end = 0x12982eUL;
+
+        pfn_pdx_compression_reset();
+        pfn_pdx_add_region(pfn_to_paddr(0x5bbd3UL),
+                           pfn_to_paddr(0xf18f2UL - 0x5bbd3UL));
+        pfn_pdx_add_region(pfn_to_paddr(0x1869bdUL),
+                           pfn_to_paddr(0x189f58UL - 0x1869bdUL));
+
+        if ( !pfn_pdx_compression_setup(0) )
+        {
+            printf("table-index crossing test: compression disabled\n");
+            ret_code = EXIT_FAILURE;
+        }
+        else if ( pdx_is_region_compressible(pfn_to_paddr(ram_start),
+                                             ram_end - ram_start) )
+        {
+            printf(
+    "region [%#lx, %#lx) crosses a table index but was accepted\n",
+                   ram_start, ram_end);
+            ret_code = EXIT_FAILURE;
+        }
+    }
+#endif
+
     return ret_code;
 }
 
diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index 23655ef3bd..52928faa15 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -324,7 +324,8 @@ bool pdx_is_region_compressible(paddr_t base, unsigned long npages)
     unsigned long pfn_base = pfn_bases[PFN_TBL_IDX(pfn)];
 
     return pfn >= pfn_base &&
-           pfn + npages <= pfn_base + pdx_region_size;
+           pfn + npages <= pfn_base + pdx_region_size &&
+           PFN_TBL_IDX(pfn) == PFN_TBL_IDX(pfn + npages - 1);
 }
 
 static int __init cf_check cmp_node(const void *a, const void *b)
-- 
2.34.1


