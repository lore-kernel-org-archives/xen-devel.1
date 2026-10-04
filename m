Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40941CA5FE2
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 05:17:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440469.1657968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDb4L-0002VH-M9; Mon, 05 Oct 2026 05:16:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440469.1657968; Mon, 05 Oct 2026 05:16:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDb4L-0002V9-HJ; Mon, 05 Oct 2026 05:16:57 +0000
Received: by outflank-mailman (input) for mailman id 1440469;
 Sun, 04 Oct 2026 19:04:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <coolhaoyt@gmail.com>) id 1xDRVK-0003qW-Dq
 for xen-devel@lists.xenproject.org; Sun, 04 Oct 2026 19:04:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDRVJ-006aRJ-RA
 for xen-devel@lists.xenproject.org; Sun, 04 Oct 2026 21:04:09 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <coolhaoyt@gmail.com>)
 id 6ac2a2ef-bab6-0a2a0a5309dd-0a2a4507986e-28
 for <xen-devel@lists.xenproject.org>; Sun, 04 Oct 2026 21:04:09 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <coolhaoyt@gmail.com>)
 id 6ac2a329-b4ea-0a2a45070019-4a7de18cc727-3
 for <xen-devel@lists.xenproject.org>; Sun, 04 Oct 2026 21:04:09 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-4a1722c37c9so1326335e9.3
 for <xen-devel@lists.xenproject.org>; Sun, 04 Oct 2026 12:04:09 -0700 (PDT)
Received: from LukeW.mynet ([143.58.214.168]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0280c8bb0sm306875715e9.11.2026.10.04.12.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 12:04:08 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791140649; x=1791745449; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ugn7qb3Ihe6pRVSsU144ndfnHVeChYDf+vJI65Hlci4=;
        b=R6HhQnqYfNXnJxKJW5Ke2+vewNkdwK5fDP0ELwaxVUQ/k4XSL0+ox7ldqhMao7SF+a
         OSJC3qIikK0oJqsMl6UxIbaIPIaa+BOYflDRogg7lgFifF0ojIoMtHxCvBFFKT5zK++H
         TVeWhO+NoGlWOkyBvcp4AHRZlLiKwYpK5GgjQLjWlAha78byU0rL2XtENvVeGctwmjJR
         +ODoiK2L/s8b68e11WicZEuWOb4cz4DH1qRaK3MDacmgI5Qb4VQOmpe+NrAqFoGu7P9O
         aLLuXX2ozIWLQ7mt0FxFTISZ0afDEtjEPd2fUUL1VVIQOJsSvGqwmzOPmJnbjX33FfEN
         wc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791140649; x=1791745449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ugn7qb3Ihe6pRVSsU144ndfnHVeChYDf+vJI65Hlci4=;
        b=zIH93/FF43V6aX15+62dBxxmj/WtRIHhm6CFaj7uwQvnegS95t6rBVXqpgoXfSocBC
         fT7xKxUNMKEZVAjM7pYXz7jTHfD30S7DBrEi7fwJi1lTeWbFJ6JlnCQLAzJNmHioNY+V
         UVLCMR81vZEiIt0n8LPHlkBHcSmpgr4OlQsg+6zOt5G5rjAzmcjspaFrALm6YlHEJ4Nk
         dU4vH4PARU7Ud1zCnEIdWIe5OHNydzGo2ocw5jeDE6pIJPYwYTBdqz/jODk4JQUB+48X
         BKNfIxwpkX2za4B22hc7z/hEhX/574Y+ZUl2X+kHeJca4APGniNAMb6/CQ6Ff7vIJmaa
         PVqw==
X-Gm-Message-State: AFuF++lWZpsBLebOoeGdC0V2uQIPEaN+3nDa0nXr4WUC/WPt5ZMolQac
	hM8tClebZzPaAweY1MmR7uSW15eUMxbA2ws6UbcA37048MGX1KS+S+Ge7N0WBdM6KxonXQ==
X-Gm-Gg: AYBFou27fldMp7eTbQu/kQ/uRE1636fpXKylfu+eqrgX+O5YxE9EyJrwHbttNSNVxYQ
	cBg1UYMj3utVE10KSfEpgxriOZsc6F7L7sBf8whqTnqPwDJE+NfL9q1Q7OQtU/+Dn4qeQ42my9R
	TYt97SpN4qfhvaacYdsBDuXF7yDVSQfIHbAJbMe/NY+ZJ18IblbQUP+h2I260d8nfdBEEhLsnTg
	QNoRFWQtT5YkVHkuO2twpUBLkzTGlU2V5xed9HlnrJQ1RG4QzhW8+tQbzxQ6Zxmo+E5nq6AltkV
	SClmtctur8btIaF+cxzV+OOfE+EU61RdsJt2nH4s/h8a4T28HPPKqM83aWUJFPNkbOdinOxuu+r
	7NhsI4YOKgB5dRbM/AgPvawR9lfiXOaXOrpXnXb1cVAO7v8G22MZocdWaVUr39YJLUuEarxDVof
	suc2Y/F0gLr1AA/sC1YXrWAyvPzalayOBbCbHbOsTQ9zG5e/VQXntFdTyr3pdKjDJkW39ZZg==
X-Received: by 2002:a05:600c:46d0:b0:49c:fa21:1c84 with SMTP id 5b1f17b1804b1-4a0275a28d5mr154397295e9.25.1791140649040;
        Sun, 04 Oct 2026 12:04:09 -0700 (PDT)
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
Subject: [PATCH] xen/pdx: fix merging of a range contained in the previous one
Date: Sun,  4 Oct 2026 20:03:57 +0100
Message-Id: <20261004190357.29254-1-coolhaoyt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1791140649-364DBAE4-8B95E713/0/0
X-purgate-type: clean
X-purgate-size: 4185

From: Weiqi Wang <weiqi.wang-2@postgrad.manchester.ac.uk>

When sorting and merging overlapping ranges in
pfn_pdx_compression_setup(), the merged range is set to end where the
second range ends.  If the second range is fully contained in the first,
this truncates the first range, and the tail of it is then neither
compressible nor translated correctly.

Keep the end of the merged range as the maximum of both ends.

On x86 the ranges come from the SRAT memory affinity entries, and
overlapping entries for the same node are tolerated with a warning by the
NUMA code.  The caller's subsequent coverage check catches the truncated
range, so the effect is that PDX compression is disabled with a "RAM
region ... not covered" message rather than memory being mistranslated.

Add a test case that fails without this change.

Found with the ESBMC bounded model checker.  The counterexample was
confirmed by running it natively against the unmodified code.

Fixes: c5c45bcbd6a1 ("pdx: introduce a new compression algorithm based on region offsets")
Assisted-by: Claude Code:claude-opus-5-5 # finding the issue with ESBMC, patch creation
Signed-off-by: Weiqi Wang <weiqi.wang-2@postgrad.manchester.ac.uk>
---

Notes:
    Also seen in a real boot: the hypervisor alone under QEMU (pc, 8 GiB),
    built from defconfig, with no -numa and a hand-built SRAT passed with
    -acpitable.  Memory affinity entries, all PXM 0:
    
      [0, 3G)  [4G, 9G)  [5G, 6G)  [1T, 1T+1G)
    
    The third entry lies inside the second.  The NUMA code prints "overlaps
    with itself" for it and accepts it.  Without this patch:
    
      (XEN) PFN compression using lookup table shift 23 and region size 0x200000
      (XEN)  range   0 [0000000000000, 000000017ffff] PFN IDX   0 : 0000000000000
      (XEN)  range   1 [0000010000000, 000001003ffff] PFN IDX  32 : 000000fe00000
      (XEN) PFN compression disabled, RAM region [0x100000000, 0x23fffffff] not covered
    
    With it, the same output as without the third entry:
    
      (XEN) PFN compression using lookup table shift 28 and region size 0x400000
      (XEN)  range   0 [0000000000000, 000000023ffff] PFN IDX   0 : 0000000000000
      (XEN)  range   1 [0000010000000, 000001003ffff] PFN IDX   1 : 000000fc00000

 tools/tests/pdx/test-pdx.c | 12 ++++++++++++
 xen/common/pdx.c           |  5 +++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/tools/tests/pdx/test-pdx.c b/tools/tests/pdx/test-pdx.c
index 4de8d43d86..2b5bea07a0 100644
--- a/tools/tests/pdx/test-pdx.c
+++ b/tools/tests/pdx/test-pdx.c
@@ -87,6 +87,18 @@ int main(int argc, char **argv)
             },
             .compress = true,
         },
+        /* Range contained in a previous one. */
+        {
+            .ranges = {
+                { .start =                                                 0,
+                  .end   =                            (1UL << MAX_ORDER) * 1 },
+                { .start = (1UL << (MAX_ORDER * 2)) |                      0,
+                  .end   = (1UL << (MAX_ORDER * 2)) | (1UL << MAX_ORDER) * 4 },
+                { .start = (1UL << (MAX_ORDER * 2)) | (1UL << MAX_ORDER) * 1,
+                  .end   = (1UL << (MAX_ORDER * 2)) | (1UL << MAX_ORDER) * 2 },
+            },
+            .compress = true,
+        },
 #endif
         /* PDX compression, 2 ranges covered by the lower mask. */
         {
diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index e7e16e193e..23655ef3bd 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -393,8 +393,9 @@ bool __init pfn_pdx_compression_setup(paddr_t base)
              (ranges[i - 1].base_pfn + ranges[i - 1].pages) )
             continue;
 
-        ranges[i - 1].pages = ranges[i].base_pfn + ranges[i].pages -
-                              ranges[i - 1].base_pfn;
+        ranges[i - 1].pages = max(ranges[i - 1].pages,
+                                  ranges[i].base_pfn + ranges[i].pages -
+                                  ranges[i - 1].base_pfn);
 
         if ( i + 1 < nr_ranges )
             memmove(&ranges[i], &ranges[i + 1],
-- 
2.34.1


