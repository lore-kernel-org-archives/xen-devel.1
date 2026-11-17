Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6588D606A323
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 07:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GhSGByOh
Received: from list by lists.xenproject.org with outflank-mailman.1491914.1692611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTDmh-0007y7-Fq; Tue, 17 Nov 2026 07:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491914.1692611; Tue, 17 Nov 2026 07:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTDmh-0007y0-BK; Tue, 17 Nov 2026 07:39:19 +0000
Received: by outflank-mailman (input) for mailman id 1491914;
 Tue, 17 Nov 2026 07:39:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <visitorckw@gmail.com>) id 1xTDmf-0007xq-Eb
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 07:39:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTDme-009GGz-QF
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 08:39:16 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <visitorckw@gmail.com>)
 id 6afc0496-2eae-0a2a0a5409dd-0a2a4506bb44-40
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 08:39:16 +0100
Received: from [74.125.82.45] (helo=mail-dl1-f45.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <visitorckw@gmail.com>)
 id 6afc04a3-195a-0a2a45060019-4a7d522ddcdf-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 08:39:16 +0100
Received: by mail-dl1-f45.google.com with SMTP id
 a92af1059eb24-1b3beeaf6f9so5241886c88.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 23:39:16 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com
 (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-379563e6b6dsm74356425eec.21.2026.11.16.23.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 23:39:12 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794901154; x=1795505954; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+s93m3mNuE5TzrRy6Xqxj2SKWP2Sf3U+Y71j/Vf2uJI=;
        b=GhSGByOhf4dXPtlTwh7wOcsryM1Upt7IoJo76zCJKuR3dVUZMo/PYICek1Aj55FzpO
         iexifUEZGw57ep9SlzJWUkGHrGyhO6WaOSlV/oQgNJzCkxdvcoIrySl52mSRYUlO3wDV
         vGtXTMP71Nr/zfppeeAQ01jcVlVAXYB8pZGFS3MMJlhrVnkpN6KtIdbbamBOaa8klSYj
         Qz2gqP/sZ1vqFQ7CyME5jRrdRjCsxcsLAddHQBakyPuHh2UnuWxo5ASmFHFS8pjuTRlO
         36MUZs6wVtycQRJ9rizfFrYxjvHwRv4dtB0NH7SpYhbdIF9Ug6Pmn4dfD8zLpSfKtezn
         MSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794901154; x=1795505954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+s93m3mNuE5TzrRy6Xqxj2SKWP2Sf3U+Y71j/Vf2uJI=;
        b=wHmD1Awl/5ExHv4U+v++UYoiAEAEpBZIa4/4LZjaZoOQRTlIGLmWcV4ZQvAFQK0oiq
         WPe5yEfxCEsvBPQGxexfwTm3yPsjjlY32E7uuvMRqGC8vz00h0ppycNSfTxXPi7oYPTu
         0w99LrT7kvJhut/3yPxz9nqOu2C9c/mTQ0Yw36KwyIk/nSc/tRXw2PEjuPKB5yQ6kLQ1
         3UVrBVq5xuK7EOzoVOB3UKhN9CKIun0h0cZc3fGtJV0LLJwn/zYJdKtOk/AdZxluWohE
         infHL0viQK1fz0IS417MONZi+VMyZwYTnQFW3hVVH1ZtUJE0jzbVXPF9Bvf+qwaLHm+/
         95rg==
X-Gm-Message-State: APuU4Z93SC3628v3tHMQ3f+07HPWVb3G4jF3ujRBPtz7YMIE/TRwwt/m
	THZmOpV8VTQ7FAYN60bODww5tOrhhobtE7tg530legTnf6nPw6ZE/d7oYMAcUw==
X-Gm-Gg: AZFdTZeDZuCVM5exnebwPgzr8Sbn6qqiRfz6CJWc2CX80PC52SWUexc50jZtBqU3yF9
	OBXetOV0kKWI5dD+XcNDu4gCYim78dvH50uqySm7+A/fg7nloBgIWh48D6QKtG/GEHwSb5FaAQZ
	9SN20UCRJniWK5224tcSIPa5oq+aTfDv37F+ghOptiExSP7idOxCKHZQtCcr+URPGzExXFDMxYp
	pBJg5JqSSigpHCDe3fchar78+LEX9UfACik1DMU7mOIgWNAlwDk1+jc62eq6jAhVEOhVm5CPwWm
	xwJD5BGB4NzRYSaC8EQS1mydGUnM8KmCOvfWd53J+TsaWpfY35m98l5cFRBJR47sIxkiyg56XDF
	TA4PYdiL7Qb/UJTst3mCt8M/ihXkSoon9qoEhMUVUbUqMAB1vuDzdbXQBGOw43X1pJrJ32YRukV
	P3NE0WbsOr7XXyszjAEEjLewwAc4l7Vsq7OJe8ZmQ4vSejwZJDWe0sdkXrQdHlT8ED/k9uHYVzB
	bMG8Y/l/y9GXyWtdx6KJSgnU77eEDy4xmViR0V/deY/8qt9yfB4xcZqt3P48bcV7ApvShbTI6ND
	QOeAPUZUEU+e4pS2SQrGBNTxXZriK5OvxW9W1/wpyeaKyLer1GbYwKMk5wH3o581OEuvqB7MgY1
	Wz6unNMaX7dU7MCsJA4miT2JdJrhEkeqdr44FiF+HHJWE
X-Received: by 2002:a05:693c:8206:b0:36f:f3b7:6dee with SMTP id 5a478bee46e88-37966e3ab88mr14116809eec.7.1794901153433;
        Mon, 16 Nov 2026 23:39:13 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2] xen/arm: Preserve host GIC #interrupt-cells for Dom0
Date: Tue, 17 Nov 2026 07:39:04 +0000
Message-ID: <20261117073904.2281059-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1794901156-F500977B-51F637A2/0/0
X-purgate-type: clean
X-purgate-size: 3405
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
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
- Add a comment in fdt_property_interrupts() explaining why only the
hardware domain preserves the host GIC's #interrupt-cells and that
extra cells beyond 3 are zero-padded.

 xen/arch/arm/domain_build.c | 37 ++++++++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 606e85818e..d5bb895a6e 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -654,12 +654,37 @@ static int __init fdt_property_interrupts(const struct kernel_info *kinfo,
                                           unsigned int num_irq)
 {
     int res;
+    uint32_t intrcells = ARRAY_SIZE(intr[0]);
+    void *val;
+    unsigned int i, stride;
 
-    res = fdt_property(kinfo->fdt, "interrupts",
-                       intr, sizeof(intr[0]) * num_irq);
+    /*
+     * Only the hardware domain preserves the host GIC's #interrupt-cells,
+     * since its device interrupt properties are copied from the host DT;
+     * domUs always use a 3-cell virtual GIC. Any extra cells beyond the
+     * 3-cell specifier, such as the GICv3 PPI affinity partition, are
+     * zero-padded.
+     */
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
 
@@ -1320,6 +1345,7 @@ static int __init make_gic_node(const struct domain *d, void *fdt,
     int res = 0;
     const void *addrcells, *sizecells;
     u32 addrcells_len, sizecells_len;
+    uint32_t intrcells;
     const char *name;
 
     /*
@@ -1370,7 +1396,12 @@ static int __init make_gic_node(const struct domain *d, void *fdt,
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
2.56.1.703.gf848ed807c-goog


