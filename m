Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D7DCA5FE2
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 05:17:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440471.1657970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDb4L-0002XZ-SK; Mon, 05 Oct 2026 05:16:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440471.1657970; Mon, 05 Oct 2026 05:16:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDb4L-0002Wn-PH; Mon, 05 Oct 2026 05:16:57 +0000
Received: by outflank-mailman (input) for mailman id 1440471;
 Sun, 04 Oct 2026 19:04:17 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <coolhaoyt@gmail.com>) id 1xDRVR-0003rA-J7
 for xen-devel@lists.xenproject.org; Sun, 04 Oct 2026 19:04:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDRVQ-0006n3-C8
 for xen-devel@lists.xenproject.org; Sun, 04 Oct 2026 21:04:16 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <coolhaoyt@gmail.com>)
 id 6ac2a30c-e002-0a2a0a5209dd-0a2a450bcf20-22
 for <xen-devel@lists.xenproject.org>; Sun, 04 Oct 2026 21:04:16 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <coolhaoyt@gmail.com>)
 id 6ac2a32f-b7e8-0a2a450b0019-d155dd34dc02-3
 for <xen-devel@lists.xenproject.org>; Sun, 04 Oct 2026 21:04:16 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-48c5358fc28so385639f8f.0
 for <xen-devel@lists.xenproject.org>; Sun, 04 Oct 2026 12:04:16 -0700 (PDT)
Received: from LukeW.mynet ([143.58.214.168]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b38104602sm20231561f8f.26.2026.10.04.12.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 12:04:14 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791140655; x=1791745455; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+0EkOyBSqfwlelDGlGE8QtC8Dmz3E2dIr4FDjMU3FTk=;
        b=VKR6VVZ4/itmp97djkEo4DJToRyL2VHzvm3V4zouQzCVVGP2F5CvqE5NOppd+glN47
         /SwKuy1M2QvLgzjr/geSrSFCwh8g09a7NQKKVrh6HDEiYFawNHOZa1y/Ewh+NVPvbLaE
         kGfxo5MHDfubc8c3NFKMRmDmJ3prmEk99/lMlyjqCm4eE3jgGfErGKGq3JmzxH0rJBfK
         VDtFcQO0vHbg1dfKuLL4n1OCiDH+TvFuU9usNH0mrlEvkUqM4hwbCP4HQXgAeoMmGxeZ
         /oTRjZeUE0QfgSWgC9xizqpJ2/CiM4N5Z+UwOPiHUfGaoyr1saiO7LC1Sd6mMiyVUlXi
         PqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791140655; x=1791745455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+0EkOyBSqfwlelDGlGE8QtC8Dmz3E2dIr4FDjMU3FTk=;
        b=0AiTL02xN+uJjV+ZGPIyjILXOd6NHWSLTt43GMy5APosBta3/DUozN6Geswc0LkUMy
         zHZFw0ufl6u99FLOpTs0/hkfs1qToAaPrhXFIg8Fnc8SsGPismzFOmtSyw6oxraR5F2M
         dgz6n7dGhnWzjuIRXVMM1SEL40h5r+yLe8mg+caEuC6g8wwbIQ3PRafXYEzsczeztSxP
         hAfzUyreBy4ujsjOt7DY79z6ruqzdxJD2ai5UFXghwTU5ajLprw7GPZWE3occv9p7/5c
         qHyI9kMMxjBEeAZELot5wQx728E8JHXlXe8px4Q9L9cRESAoC3U7VV8/BZ+7hclMqewh
         s7gQ==
X-Gm-Message-State: AFq9FYJklwDgHu46po+1dqXHTFdqlPBqAPoUOX/XCX6jQIJ5D1hp9suX
	LNKZ8Sycw3Gg5jVvbz5HCSrQdI+jwCp8iHf6QViVk8ceCals1J2oIFrzpU7j+5P5tcHC/A==
X-Gm-Gg: AYBFou0Y7Zrv6bePazViqj7DNWaIAPEoWhda03R26yueoAomCtc1ls367Oz6aipJKj6
	Vzp1IVw5wemL62t4LlguJm2GyrjURsgZA+NCjMVuowEYxiNwN3AvyN6NF1pCt8lVrfnWujNC78Z
	O6FmLcM5XnzpYlM/A0K4JHMTIt0JOaRaNWKt5oJdiMW42KIuwLUzIHFszY8B5G4Pk7yPYAz7mCK
	0u4Q1Tr79y0L07/XhputC92aHoux0bopKbET5ensNUnZHaPUcAr3o00b0MM8EYUP5rLUI6YwrCi
	P4UN8R9UZ3Sm8hhHE3eKQhQBfV6nU9SMjLZGn/bY6SXb0TtB3wyoATxSWUzpi4FiehMrFfhtZyO
	Eie00Od1v3pRYAFpL2KafHImYnbwVpKq59gHxZN9XonH28EtS3TNkYzYtUSqIosgIU0y64V1bGX
	zakbqJHXrzWkyXJeUIqyy0sc5Ssv8HHAxQ4umWBr7FWTZ8y9ybglID2Ttb1XtMu+3hUxBKXg==
X-Received: by 2002:a5d:5d0d:0:b0:487:b4a:3f54 with SMTP id ffacd0b85a97d-48c4800336amr9297340f8f.29.1791140655281;
        Sun, 04 Oct 2026 12:04:15 -0700 (PDT)
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
Subject: [RFC PATCH] xen/pdx: reject regions crossing a lookup table index
Date: Sun,  4 Oct 2026 20:04:09 +0100
Message-Id: <20261004190409.29276-1-coolhaoyt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1791140656-AA4DB9EA-42CBB4B2/0/0
X-purgate-type: clean
X-purgate-size: 5725

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
    
      region [0x75757ffef9, 0x8122007e00) compressible: 1
      last page compressible: 0
      last page: pfn 0x8122007dff -> pdx 0x2122047dff -> pfn 0x2d7ee07dff
    
    With this patch the region is reported not compressible, and
    srat_parse_regions() disables compression.
    
    8<----------------------------------------------------------------------
    /* Build like test-pdx-offset, e.g. from tools/tests/pdx:
     *   gcc -D__XEN_TOOLS__ -DCONFIG_PDX_OFFSET_COMPRESSION \
     *       -I../../include -o repro-window repro-window.c
     * (after generating pdx.h as the Makefile does). */
    #include "harness.h"
    #include "../../xen/common/pdx.c"
    
    int main(void)
    {
        /* Two SRAT-like ranges, in PFNs. */
        pfn_pdx_add_region(pfn_to_paddr(0xdffffe0000UL),
                           pfn_to_paddr(0xe000000000UL - 0xdffffe0000UL));
        pfn_pdx_add_region(pfn_to_paddr(0xc5cde0000UL),
                           pfn_to_paddr(0x4cd7000000UL - 0xc5cde0000UL));
        if ( !pfn_pdx_compression_setup(0) )
            return puts("compression not enabled"), EXIT_FAILURE;
    
        /* A RAM range not covered by either, as srat_parse_regions() checks. */
        unsigned long s = 0x75757ffef9UL, e = 0x8122007e00UL;
    
        printf("region [%#lx, %#lx) compressible: %d\n", s, e,
               pdx_is_region_compressible(pfn_to_paddr(s), e - s));
        printf("last page compressible: %d\n",
               pdx_is_region_compressible(pfn_to_paddr(e - 1), 1));
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
    below 2^40 PFNs, the srat_parse_regions() coverage check modelled) finds
    no accepted RAM page that fails to round-trip with both patches applied.
    It also finds no layout where the coverage check now rejects what setup
    accepted, with RAM equal to the SRAT ranges.  This is bounded to 2 ranges.
    
    The existing tests in tools/tests/pdx pass in both mask and offset mode.
    
    I have not reproduced this in a boot: the layout needs RAM near 2^51
    bytes, which I could not set up under QEMU.
    
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


