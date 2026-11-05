Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11F2606A32E
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 17:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q9wwUz+H
Received: from list by lists.xenproject.org with outflank-mailman.1475294.1682118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP0qH-00034f-Sd; Thu, 05 Nov 2026 17:01:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1475294.1682118; Thu, 05 Nov 2026 17:01:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP0qH-00034Y-PZ; Thu, 05 Nov 2026 17:01:37 +0000
Received: by outflank-mailman (input) for mailman id 1475294;
 Thu, 05 Nov 2026 17:01:37 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <visitorckw@gmail.com>) id 1xP0qH-00034S-AD
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 17:01:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xP0qG-003gM9-M8
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 18:01:36 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <visitorckw@gmail.com>)
 id 6aecb65e-8faa-0a2a0a5109dd-0a2a450387a2-30
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 18:01:36 +0100
Received: from [74.125.82.49] (helo=mail-dl1-f49.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <visitorckw@gmail.com>)
 id 6aecb66f-fae8-0a2a45030019-4a7d5231d531-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 18:01:36 +0100
Received: by mail-dl1-f49.google.com with SMTP id
 a92af1059eb24-1b244fb7fffso2770457c88.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 09:01:36 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com
 (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b245c2d69asm16890919c88.11.2026.11.05.09.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 09:01:33 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793898094; x=1794502894; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=if0uxxccF3aSEurV3j2odeW1LivV1aGquxssomLU2ug=;
        b=Q9wwUz+HgSbFdIVzU+J3afZGtkK52TQQbh/S6KmN/4CHl2DvbD9TD+7Mcl7KN8Ep1v
         zMdozMagvtwvmb2OpYyta57htVzaGvFzOiiDJ8yNKAlBh0BvEpckWbQdVAvlkF3CUNTy
         CP/Ew415kAJkVyAhftjvjrakhFrG8D+5YCCuT9b4xD9IB5oqfrwmDhrPjLK+aWVM0B6r
         S+2VHXO9jIXwDZ0z6IeeAAH8/8HZl/wgEl1FmQeF+BLuyHZjgcss5Mkg0jl2fYmdwoIj
         2zYnnRx1skxDmmvssv43IyvN5YgtpfT7y1jEB+LQ2d6mUD7DW4fJ46KfShdMlQYK5+Wf
         rE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793898094; x=1794502894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=if0uxxccF3aSEurV3j2odeW1LivV1aGquxssomLU2ug=;
        b=swUfvAbXueXUEscGCjRYw0CC1yuleI7/Tj41zOuhp94EM3pxrhTG4H1zeaVniHyZEM
         MVphBnhtB9PtkUjJCz5hOBmRbpUvOY+oH7PgLNt+2wVKkdsN/NuEIbhnafl2WtxlMEhs
         PxEX3/TXYMttCuFq2KqSCYwNLk4yC5g6NeENUQPNnbYNdd3r8IL4EylkS3sstIpKAKbN
         oT5C6MpsprcNjeCx0iqNG6vxDlomzHpYbsUFPzBsewhU8aYkFkII1xr+Dl5/Q+1n5TAJ
         iFoId0eLKqcsKK83Tdu/UG0MxCXwy4o21cDIZS2KQB96MmFnkq7Lc+DL2L4NqrsFil3L
         Apyg==
X-Gm-Message-State: APuU4Z+a7+uJril49DE1on8GE9xz8KkWjjOBfxm7+0gsqxNCkE75jcI8
	GqI/FI5pmx0zwxm3cuUzP3dYBZB2q1UpjoXBO6x6M/MkZiMq375/2p71fMJIfQ==
X-Gm-Gg: AYBFou0TUQdpTyXlpGa7+JAu5fGJqh61qX6iwXG/8U1LeWafZkXH6FI84DwYcYRA2/6
	YolbXa3jXMhd9hORF0Znay4I53ivexT6qfGptXSwrgyq8tQuiWWMzu+AhJlngRtSfHHu0njlHkV
	YQQAzaFfwqMifYwQzIuPYV1xyJRWjt3RKVtAhHUIf2K6J5WjoYPY3nK08j5mz4j5Iwg27+DqZ/k
	6wDQ8HgtweSrPONkZfvKFJB6u5YN3kyWqJsqM+6SOB2bCdb7Hf4gEWdsFR5r9SuEvx7G2CNUmMm
	G3R6dS+j1nektUxqQP7YjdKI2be8SScVVfHNyr9JF4xUZ9IwyGMBMVAOe7m3MXIySNkVYGgHRqD
	1hL/8AqlPUixgtm+Wsgi5LZ06oYxqrb/jhfyzNW+t2YgmBPhYAY0Sn+Sb9iNJ0GpMQMfBD81iDj
	MR/AApobYNDRT53hAWjpf76EnLOQdtlfvvfZ7Q64thUMC4rMZv+udDWBCq+FuBBGk3Z73wpEEz4
	FD7Bhf7gcNO5YCpTuZVOAV+jmDaMkCnbDEfuVlZNIm2S7dpp6MEOZafscYN7yHdT/ZjTnuHtEdy
	b6JIGO22Vz2mP7qKQ7PJRo0qDGCSgsXXUyWTz4RhIjOxFttL2Cpuw0EIKSIVJQarKYmJDIFmeP8
	8O2VTMXWcsP9hOJZhwGeM3sc=
X-Received: by 2002:a05:701b:4248:20b0:1a1:c1e3:1ec with SMTP id a92af1059eb24-1ac5ecb684emr30127651c88.46.1793898094186;
        Thu, 05 Nov 2026 09:01:34 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH] xen/arm: Preserve host GIC #interrupt-cells for Dom0
Date: Thu,  5 Nov 2026 17:01:17 +0000
Message-ID: <20261105170117.3550534-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1793898096-6D2D84E9-8F63384D/0/0
X-purgate-type: clean
X-purgate-size: 2811
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Xen copies device interrupt properties from the host device tree to
Dom0, but hardcodes #interrupt-cells to 3 in make_gic_node() and
fdt_property_interrupts(). On GICv3 platforms where the host uses 4
cells, Dom0 parses the copied specifiers as 3 cells each and fails to
set up device interrupts.

Propagate #interrupt-cells from the host GIC node in make_gic_node()
and pad Dom0 interrupt specifiers with trailing zero cells in
fdt_property_interrupts().

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 xen/arch/arm/domain_build.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 1ee1f1f6a7..74d2491f9e 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -654,12 +654,30 @@ static int __init fdt_property_interrupts(const struct kernel_info *kinfo,
                                           unsigned int num_irq)
 {
     int res;
+    uint32_t intrcells = ARRAY_SIZE(intr[0]);
+    void *val;
+    unsigned int i, stride;
 
-    res = fdt_property(kinfo->fdt, "interrupts",
-                       intr, sizeof(intr[0]) * num_irq);
+    if ( is_hardware_domain(kinfo->bd.d) )
+    {
+        const struct dt_device_node *gic = dt_interrupt_controller;
+
+        if ( !dt_property_read_u32(gic, "#interrupt-cells", &intrcells) )
+            return -FDT_ERR_XEN(ENOENT);
+        if ( intrcells < ARRAY_SIZE(intr[0]) )
+            return -FDT_ERR_XEN(ERANGE);
+    }
+
+    stride = intrcells * sizeof(intr[0][0]);
+    res = fdt_property_placeholder(kinfo->fdt, "interrupts",
+                                   stride * num_irq, &val);
     if ( res )
         return res;
 
+    memset(val, 0, stride * num_irq);
+    for ( i = 0; i < num_irq; i++ )
+        memcpy((uint8_t *)val + i * stride, intr[i], sizeof(intr[0]));
+
     res = fdt_property_cell(kinfo->fdt, "interrupt-parent",
                             kinfo->phandle_intc);
 
@@ -1320,6 +1338,7 @@ static int __init make_gic_node(const struct domain *d, void *fdt,
     int res = 0;
     const void *addrcells, *sizecells;
     u32 addrcells_len, sizecells_len;
+    uint32_t intrcells;
     const char *name;
 
     /*
@@ -1370,7 +1389,12 @@ static int __init make_gic_node(const struct domain *d, void *fdt,
             return res;
     }
 
-    res = fdt_property_cell(fdt, "#interrupt-cells", 3);
+    if ( !dt_property_read_u32(gic, "#interrupt-cells", &intrcells) )
+        return -FDT_ERR_XEN(ENOENT);
+    if ( intrcells < 3 )
+        return -FDT_ERR_XEN(ERANGE);
+
+    res = fdt_property_cell(fdt, "#interrupt-cells", intrcells);
     if ( res )
         return res;
 
-- 
2.56.0.385.gac671c819a-goog


