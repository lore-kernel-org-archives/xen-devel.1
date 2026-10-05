Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7111BCA5FF0
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 10:27:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440716.1658156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDfuj-0008VD-A7; Mon, 05 Oct 2026 10:27:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440716.1658156; Mon, 05 Oct 2026 10:27:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDfuj-0008V6-6Y; Mon, 05 Oct 2026 10:27:21 +0000
Received: by outflank-mailman (input) for mailman id 1440716;
 Mon, 05 Oct 2026 10:27:20 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <coolhaoyt@gmail.com>) id 1xDfui-0008Uu-81
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 10:27:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDfug-00Ag0X-Hl
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 12:27:18 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <coolhaoyt@gmail.com>)
 id 6ac37b71-bab6-0a2a0a5309dd-0a2a4502a0f2-42
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 12:27:18 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <coolhaoyt@gmail.com>)
 id 6ac37b86-6ca4-0a2a45020019-d155802be803-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 12:27:18 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-49d05d51553so11053535e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 03:27:18 -0700 (PDT)
Received: from LukeW.mynet ([143.58.214.168]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0280b2e3csm384732015e9.5.2026.10.05.03.27.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 03:27:16 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791196038; x=1791800838; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kYmAFEk+9DyfFKrorv/uXWuca7Y+Cy0LJB7RP8dB/zM=;
        b=nB/xryQkI2FUZ+jpFe60U5k5su9dT74Puu4/jZo6W3xGVM+y2tAOGLWB4zJzC397Ve
         8NaTWZEkdwQGDsrAhO2c3gvPxZ935yCxI1hIReuh4rz7rHg+6B7Pjf7f6J5oqYtp81Sq
         agjaSbmrR9s/Uwv8a4U0dYi+y59ITj+/WWSzgKasLqKZvioeLLZKgNUP7IjbyY3DuBaS
         NUU8Z0Rbw7QL84HBu48G5Tuklqnw78RWZYEbgbsUsCdEH+px0Hl/pBC2/c0uQwAKJrqE
         sRMTT7Qp0cd9mGUV3790vNoofGWNaABzuA8hzi51hjmUImNdLhSMvmhVV2jeciDhCvLR
         7WmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196038; x=1791800838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kYmAFEk+9DyfFKrorv/uXWuca7Y+Cy0LJB7RP8dB/zM=;
        b=PTm3eLc4yzjZXSh72/s0WAon98l/gIE8pIEo6w0VoLkM/CCFBKv12OYjmb6DjJSIA4
         Z6K1lbl7t58mvljBjfHVtoyZDZoaWXvncRKz61b3c97Hfnm/j8OPBL5nskdvyDatrNg6
         u4dBKORn9P7BwiEGPKfoqYZjmrtvn4XD7F+WS4q6iMDNxEFrfLTmTAGbQ+MONzqczfz6
         tnklX8dksI4Pk+PX8fwNPlQdXvo5sR0dI45qbWrzM4tLlUBg4cONNNPWJs9qIn0IgBHE
         UPzjQ22WFuXKNDwG9RNWf2judj2pCiRuvCXhSX0mPBSn35HGtV0jyxGyrqPmgpqMPkFN
         dLRg==
X-Gm-Message-State: AFuF++lDvz57CBCajkgjBKBk4cAWu3OoAWqkl/jWBurCF+K9NpuIHA3D
	Fh4SkV+LzOQNbx7Wc42mh1MFMYh7QR+eHQv2urgY2pRyc2WRDDRzCJOyeSJHpu50FdVTEg==
X-Gm-Gg: AYBFou3r0apvbhYzgsFZtOIIXVmbWMsIOurKP6HLgVqN4TaOLEnSPPb6uV/N2KJx+IQ
	4WRXqBuqpjFZnAtgCYajPXcr7bd0tTWHCc3g71E0JoRX4ekYyZ8Tlx86GbhxSjnty7l+GH80sRz
	FxE5eWyvLG+JS1bqgxBfuCJtKYSdNVSyks+qdjalGumOvQFwcoWZGqmknXviLojsL46QVVW+fgN
	p7lYexjDh5p1Dx40YrUAdWtR5UtxHeupVmMkTqhXW7ni8vPcwE/J4hpJqF6RS/XrfLtJGkIafwi
	pxCw212ILLAHcYSiDV41NwFThyuYh2Gdyye/qTP9S39G3NcgdVeynjzUwH3spJDyVdZjRuqMgZ/
	MVK34fS0MSNMyiiO3/4/GLl+lH8BESQuFRjmRG3T+kSb6Tfbg8MVIvoaYNmhByo0RALP7GP8i5N
	NWfwEOHaPzoQ0bpeHR6BO86US9c2KtFwnuJjxJVEg0d/Om2272ef3TcjjX45aa3nwoM54S+rg=
X-Received: by 2002:a05:600c:314f:b0:49c:fc6e:a3e1 with SMTP id 5b1f17b1804b1-4a168106a95mr101986325e9.32.1791196037601;
        Mon, 05 Oct 2026 03:27:17 -0700 (PDT)
From: Weiqi Wang <coolhaoyt@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: roger@xenproject.org,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	michal.orzel@amd.com,
	julien@xen.org,
	sstabellini@kernel.org,
	lucas.cordeiro@manchester.ac.uk,
	Weiqi Wang <weiqi.wang-2@postgrad.manchester.ac.uk>
Subject: [PATCH v2] xen/pdx: reject regions crossing a lookup table index
Date: Mon,  5 Oct 2026 11:27:16 +0100
Message-Id: <20261005102716.94054-1-coolhaoyt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1791196038-F1AAD2AC-8B9ECB51/0/0
X-purgate-type: clean
X-purgate-size: 5679

From: Weiqi Wang <weiqi.wang-2@postgrad.manchester.ac.uk>

pdx_is_region_compressible() only looks up the table entry of the first
page, and checks the region against [pfn_base, pfn_base +
pdx_region_size).  pfn_base need not be aligned to the table index
granularity, so that window can extend into the next index, which belongs
to a different range with a different offset.  A region whose tail lies
there is reported compressible, yet its last page on its own is not, and
translates through the wrong offset.

Also require the first and last page of the region to use the same table
index.

This can be reached from the coverage check in srat_parse_regions() when an
e820 RAM range is not covered by the SRAT ranges, which is the case that
check is meant to catch.

Found with the ESBMC bounded model checker.  The counterexample was
confirmed by running it natively against the unmodified code.

Fixes: c5c45bcbd6a1 ("pdx: introduce a new compression algorithm based on region offsets")
Assisted-by: Claude Code:claude-opus-5-5 # finding the issue with ESBMC, patch creation
Signed-off-by: Weiqi Wang <weiqi.wang-2@postgrad.manchester.ac.uk>
---

Notes:
    Changes in v2:
    - the issue is not tied to huge addresses (Jan): replaced the example
      with a ~5 GB reproduction and dropped the 2^51 remark
    
    RFC because this was discussed when the offset compression was reviewed.
    In the v2 thread [1] Jan asked whether pdx_is_region_compressible() is
    correct when a region crosses a lookup table slot boundary.  The thread
    concluded it was not an issue, on the basis that pages contiguous in MFN
    space are also contiguous in PDX space.  The reproducer below is a case
    where that does not hold for the code as merged: the region is reported
    compressible, its last page on its own is not, and that page round-trips
    to a different PFN.
    
    The ranges are as srat_parse_regions() would see them.  The RAM range is
    not covered by either SRAT range, which is the situation the coverage
    check in srat_parse_regions() is meant to detect.  Built from
    tools/tests/pdx like test-pdx-offset, on staging (e4da182973) plus patch
    "xen/pdx: fix merging of a range contained in the previous one":
    
      region [0x4ca9b, 0x12982e) compressible: 1
      last page: pfn 0x12982d -> pdx 0xa982d -> pfn 0xe982d
    
    The region is reported compressible, yet its last page round-trips to a
    different PFN.  With this patch the region is reported not compressible, and
    srat_parse_regions() disables compression.
    
    8<----------------------------------------------------------------------
    /* Build like test-pdx-offset, from tools/tests/pdx:
     *   gcc -D__XEN_TOOLS__ -DCONFIG_PDX_OFFSET_COMPRESSION \
     *       -I../../include -o repro-window repro-window.c
     * (after generating pdx.h as the Makefile does). */
    #include "harness.h"
    #include "../../xen/common/pdx.c"
    
    int main(void)
    {
        /* Two SRAT-like ranges, in PFNs, on a ~5 GB machine. */
        pfn_pdx_add_region(pfn_to_paddr(0x5bbd3UL),
                           pfn_to_paddr(0xf18f2UL - 0x5bbd3UL));
        pfn_pdx_add_region(pfn_to_paddr(0x1869bdUL),
                           pfn_to_paddr(0x189f58UL - 0x1869bdUL));
        if ( !pfn_pdx_compression_setup(0) )
            return puts("compression not enabled"), EXIT_FAILURE;
    
        /* A RAM range not covered by either, as srat_parse_regions() checks. */
        unsigned long s = 0x4ca9bUL, e = 0x12982eUL;
    
        printf("region [%#lx, %#lx) compressible: %d\n", s, e,
               pdx_is_region_compressible(pfn_to_paddr(s), e - s));
        printf("last page: pfn %#lx -> pdx %#lx -> pfn %#lx\n",
               e - 1, pfn_to_pdx(e - 1), pdx_to_pfn(pfn_to_pdx(e - 1)));
    
        return pdx_is_region_compressible(pfn_to_paddr(s), e - s) &&
               pdx_to_pfn(pfn_to_pdx(e - 1)) != e - 1 ? EXIT_FAILURE : EXIT_SUCCESS;
    }
    8<----------------------------------------------------------------------
    
    Other callers that rely on the same answer are mem_hotadd_check() and
    the EFI ram_range_valid() check.  I have not run those paths.
    
    One behavioural change to check: with npages == 0 the new condition
    compares against pfn - 1.  The callers I looked at never pass 0.
    
    Model checking (ESBMC, 2 SRAT ranges and 2 e820 RAM ranges, all free
    within a bounded address range, the srat_parse_regions() coverage
    check modelled) finds
    no accepted RAM page that fails to round-trip with both patches applied.
    It also finds no layout where the coverage check now rejects what setup
    accepted, with RAM equal to the SRAT ranges.  This is bounded to 2 ranges.
    
    The existing tests in tools/tests/pdx pass in both mask and offset mode.
    
    [1] https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg194095.html

 xen/common/pdx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

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


