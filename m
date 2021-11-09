Return-Path: <SRS0=fUSO=P4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1629DC433EF
	for <xen-devel@archiver.kernel.org>; Tue,  9 Nov 2021 23:18:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C402361184
	for <xen-devel@archiver.kernel.org>; Tue,  9 Nov 2021 23:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C402361184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.224147.387256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkaNq-0005p7-CY; Tue, 09 Nov 2021 23:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224147.387256; Tue, 09 Nov 2021 23:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkaNq-0005p0-9N; Tue, 09 Nov 2021 23:18:30 +0000
Received: by outflank-mailman (input) for mailman id 224147;
 Tue, 09 Nov 2021 23:18:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i2Q5=P4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mkaNp-0005ou-GM
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 23:18:29 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5771ed6f-41b3-11ec-a9d2-d9f7a1cc8784;
 Wed, 10 Nov 2021 00:18:28 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C18561184;
 Tue,  9 Nov 2021 23:18:25 +0000 (UTC)
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
X-Inumbo-ID: 5771ed6f-41b3-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636499906;
	bh=OxUWFDEDkNrUSwgkt3sGH9Y+1YXvIqRgEzBbuJTC630=;
	h=From:To:Cc:Subject:Date:From;
	b=BkdFJsKeRpOIZfAQLgtlIRysg25a87ntJfH7e8sEq1R8MFI2QYdlFtd6U/ZetY7LH
	 SE3M7OcH25KIzC0Jg94GVLLbks9qixJiSoLuS/4AbNHQYACaBGWeCU9dEiaQtJs5J6
	 /xlE894b+CxH6yJn5fowiXDA1yR10od3yG/SRTY4oG4sBta3KWnDaD7JX2OMTzCNhf
	 a1dZdJwrJYh6ma8sGuw+C3YM8J0pNWeT02bVsM5K58Dh4Fw86M60Ts/gRKeYcQ/KcR
	 rTv3FS/ZxvhzStz83vo7RreNijmUMV7KJ1UMMPpJYHhNu0eZXlu6LsfCn90RJri4/d
	 tD3+9PGZbw50w==
From: Stefano Stabellini <sstabellini@kernel.org>
To: julien@xen.org
Cc: sstabellini@kernel.org,
	Penny.Zheng@arm.com,
	Bertrand.Marquis@arm.com,
	Wei.Chen@arm.com,
	iwj@xenproject.org,
	Volodymyr_Babchuk@epam.com,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v2] xen/arm: don't assign domU static-mem to dom0 as reserved-memory
Date: Tue,  9 Nov 2021 15:18:17 -0800
Message-Id: <20211109231817.587168-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

DomUs static-mem ranges are added to the reserved_mem array for
accounting, but they shouldn't be assigned to dom0 as the other regular
reserved-memory ranges in device tree.

In make_memory_nodes, fix the error by skipping banks with xen_domain
set to true in the reserved-memory array. Also make sure to use the
first valid (!xen_domain) start address for the memory node name.

Fixes: 41c031ff437b ("xen/arm: introduce domain on Static Allocation")
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>

---
Changes in v2:
- improve commit message
- improve in-code comment
- update nr_cells appropriately
---
 xen/arch/arm/domain_build.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 9e92b640cd..c81a2bdfef 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -862,21 +862,25 @@ static int __init make_memory_node(const struct domain *d,
 {
     int res, i;
     int reg_size = addrcells + sizecells;
-    int nr_cells = reg_size * mem->nr_banks;
+    int nr_cells = 0;
     /* Placeholder for memory@ + a 64-bit number + \0 */
     char buf[24];
     __be32 reg[NR_MEM_BANKS * 4 /* Worst case addrcells + sizecells */];
     __be32 *cells;
 
-    BUG_ON(nr_cells >= ARRAY_SIZE(reg));
     if ( mem->nr_banks == 0 )
         return -ENOENT;
 
-    dt_dprintk("Create memory node (reg size %d, nr cells %d)\n",
-               reg_size, nr_cells);
+    /* find first memory range not bound to a Xen domain */
+    for ( i = 0; i < mem->nr_banks && mem->bank[i].xen_domain; i++ )
+        ;
+    if ( i == mem->nr_banks )
+        return 0;
+
+    dt_dprintk("Create memory node\n");
 
     /* ePAPR 3.4 */
-    snprintf(buf, sizeof(buf), "memory@%"PRIx64, mem->bank[0].start);
+    snprintf(buf, sizeof(buf), "memory@%"PRIx64, mem->bank[i].start);
     res = fdt_begin_node(fdt, buf);
     if ( res )
         return res;
@@ -886,17 +890,24 @@ static int __init make_memory_node(const struct domain *d,
         return res;
 
     cells = &reg[0];
-    for ( i = 0 ; i < mem->nr_banks; i++ )
+    for ( ; i < mem->nr_banks; i++ )
     {
         u64 start = mem->bank[i].start;
         u64 size = mem->bank[i].size;
 
+        if ( mem->bank[i].xen_domain )
+            continue;
+
         dt_dprintk("  Bank %d: %#"PRIx64"->%#"PRIx64"\n",
                    i, start, start + size);
 
+        nr_cells += reg_size;
         dt_child_set_range(&cells, addrcells, sizecells, start, size);
     }
 
+    dt_dprintk("(reg size %d, nr cells %d)\n", reg_size, nr_cells);
+    BUG_ON(nr_cells >= ARRAY_SIZE(reg));
+
     res = fdt_property(fdt, "reg", reg, nr_cells * sizeof(*reg));
     if ( res )
         return res;
-- 
2.25.1


