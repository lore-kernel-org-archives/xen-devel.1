Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5631606A31B
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 06:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b3Fy06ht
Received: from list by lists.xenproject.org with outflank-mailman.1461804.1672840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLaUY-0007ud-Og; Tue, 27 Oct 2026 06:17:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461804.1672840; Tue, 27 Oct 2026 06:17:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLaUY-0007uW-Lc; Tue, 27 Oct 2026 06:17:02 +0000
Received: by outflank-mailman (input) for mailman id 1461804;
 Tue, 27 Oct 2026 03:19:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <visitorckw@gmail.com>) id 1xLXiT-0007I4-2h
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 03:19:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLXiS-004yKJ-1r
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 04:19:12 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <visitorckw@gmail.com>)
 id 6ae017c0-e002-0a2a0a5209dd-0a2a4509b8d8-46
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 04:19:12 +0100
Received: from [209.85.214.173] (helo=mail-pl1-f173.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <visitorckw@gmail.com>)
 id 6ae0182e-be1a-0a2a45090019-d155d6adc4a8-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 04:19:11 +0100
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2e5fb79ce82so23269635ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 20:19:11 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com
 (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2eae6c3b67bsm2337455ad.52.2026.10.26.20.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2026 20:19:08 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793071150; x=1793675950; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S5gJzH23fh/nKBiSObpCi+vZMP2u0y30tbWtykkO/f4=;
        b=b3Fy06htmGpGrQJTOO14irawXGNSrHV159EiSegHgpzICpeja8Okc5+oa5+WMUlTRY
         hty6IDCGfmmSiUGg81rE1Q91oIUIX9cOle9ypJNPGpegyrEN/ytZj0WzLUdIQK0hlYb3
         1F8Mq866dP9TAAi2wPTrDpin5lWuhayai6M7AjiIBsOm6BrAS6agW+qnnOvSGOHpEBfT
         mIjoPBLUCYL3wFqO26S8pkKWhNr6wM//MONZ9hcQvu8UcWzHWWpVdJgclSxYsw9l9LWI
         GRbKspbs2DwwD6LfYkgBAuuR3FT0V8utALW7VcwmTYGpM8fOQ6DJJzEQ6fagd0Qzw9T2
         7mPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793071150; x=1793675950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S5gJzH23fh/nKBiSObpCi+vZMP2u0y30tbWtykkO/f4=;
        b=kK8WTpQRiZdtQzdVm4xted+77NhgUNFok4IrELfeqK+wzKiLEcTpbhuMPHvK47j4Em
         rTJZiuDMYCWVXIipRPqTcdyvo7hloi6kNYiGbxs5QwL1dhTJtMcXwmRHmYJAM4xUtxu3
         wC5om6QmDGDP8oDIOcnRVZ/o3g7H+Hxe4YuN798zr6pplYO0y/Cjf+8U45cyr5iTgkoo
         o9sxysL6/u2aPKsWDM+l5YLn85L1cuCWsaZ6dVkTrRpKUCkl2AEOOeFDI+dLncqByHkS
         nTL+gvXH4Ae+urUPuro9cxm6/lo/uxjtvmM78ba/5ACkAKBWXT9G032O78MhG0pO6Xep
         vK7A==
X-Gm-Message-State: AFq9FYI8Tb42sFROM2q+xK+zyJUYOk457rlC4gFbnILrTaTCL5lHT0CP
	FWUD/EswKcmqnJlESgHkUeoL4VjVUMTHIzM4OA24+o1G4HqCBxIeCQX7tOnzR6+a
X-Gm-Gg: AYBFou36ZftvcRamp25pya1uILMx8XdMVfG7aLKz8HZC3oJIjB94GGqFO9uJ8SJFkit
	fqxczMcttsZoo4p6I8yY7tsZ0IeAdOll4O5wVVFqgqjwPHam60dCDvmeQUxvbp+WCVWbFlHw/5U
	kLty53R/8IaFWTSqzmxUwqTYx0CXoMWMnhZBDApjJb7vitiFj2d4viSWq7w9flxFad8W2xE8jlA
	UNXNYFHxO2naedKODnuCRUEPHzofeR1P1oKL/DO3TpxyMmetgczrKxIFFYldwHjPkS6/qMebg8W
	oBSkfg5XecZ+x4sJYpbnpS66MNjxbZKTaDuWQp4v2kkSyJ3sYPjc5WYZ2h4VQjYt9EX3Zb8VUAx
	BCg3cHMfj3omwQf0SLeE7Qf3f43fYXZG7XqiwoEeMRkdd4tIvY7IFnmDEBRRhAqgqAyXD58Z1xH
	NqyYkbB7FdNyclwFAyuVT0AnHtNIVDQHlmF3P8j7AreJlIVusFXTaPef3bHt8e0yGEJ5uaVTLrY
	5JtRs9DVFYrWJkrDbAjjB2hywRXSxMv137hin2q4nHaXP7yW85Ui335xbkwYzQW3D0FplGn4Oyy
	ixBP+1A/OXizj+jsr5iafXyU2VLFxaZFky5agVInTk3NAmlIkg==
X-Received: by 2002:a17:902:da85:b0:2ea:71a7:7f21 with SMTP id d9443c01a7336-2ea9c6c245fmr67368925ad.13.1793071149905;
        Mon, 26 Oct 2026 20:19:09 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	marscheng@google.com,
	jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH] xen/dt: Only parse direct child nodes of /reserved-memory
Date: Tue, 27 Oct 2026 03:18:55 +0000
Message-ID: <20261027031855.2671912-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1793071152-3A4DB034-815C6872/0/0
X-purgate-type: clean
X-purgate-size: 1663
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

process_reserved_memory() uses device_tree_for_each_node(), which walks
all descendants of /reserved-memory rather than just its direct children.
However, a child node such as nvmem-rmem can contain nvmem-layout and
cell subnodes whose reg properties specify internal offsets rather than
physical memory addresses. Parsing these subnodes records invalid
reserved memory regions and fails the overlap check when bitfield cells
share the same offset.

Ignore nodes with depth != 1 in process_reserved_memory_node().

Fixes: d96594eef39a ("xen/arm: keep track of reserved-memory regions")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 xen/common/device-tree/bootinfo-fdt.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/common/device-tree/bootinfo-fdt.c b/xen/common/device-tree/bootinfo-fdt.c
index ca64daf4cd..eea35325f7 100644
--- a/xen/common/device-tree/bootinfo-fdt.c
+++ b/xen/common/device-tree/bootinfo-fdt.c
@@ -185,8 +185,13 @@ static int __init process_reserved_memory_node(const void *fdt, int node,
                                                u32 size_cells,
                                                void *data)
 {
-    int rc = process_memory_node(fdt, node, name, depth, address_cells,
-                                 size_cells, data);
+    int rc;
+
+    if ( depth != 1 )
+        return 0;
+
+    rc = process_memory_node(fdt, node, name, depth, address_cells,
+                             size_cells, data);
 
     if ( rc == -ENOSPC )
         panic("Max number of supported reserved-memory regions reached.\n");
-- 
2.56.0.307.g5fe7bd680c-goog


