Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EE6C55ABF
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 15:48:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382284.1625744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNk-0002Oo-Kn; Tue, 04 Aug 2026 15:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382284.1625744; Tue, 04 Aug 2026 15:48:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNj-0002KO-IX; Tue, 04 Aug 2026 15:48:43 +0000
Received: by outflank-mailman (input) for mailman id 1382284;
 Tue, 04 Aug 2026 15:48:40 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wrHNf-0001mH-Lq
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 15:48:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrHNf-009GkK-0p
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 17:48:39 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209ce-e002-0a2a0a5209dd-0a2a45039d84-26
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:39 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209d6-fae8-0a2a45030019-d155802ead15-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:38 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-49558ce01afso26775235e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 08:48:38 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49949fcb46esm116430355e9.5.2026.08.04.08.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2026 08:48:38 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785858518; x=1786463318; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJC5+YtFPL568P1Nwi/6zQXEX1Gc8Q+IUKJN5b49m2w=;
        b=sBzQ2F05A/eqIYdR9SxI/+qK+dW8EEqOZo0y/tYH37zqMKyijk8OoTC/gP4cuHigVs
         AGnVRuoDszt4mAtKovMyIJyCkM1XIyRusfdicgsyUjWUtdlsv1mnzWqvDbAKDeg6+b56
         1a78yp0JkjC+jsavsnbhg4jDUMGBztPYmgCrHOIfZoU1F09CiCyjphO1ti0YqKOk3YRG
         rC6EOcCIsrPk9bvCLRkQV5xaU2yuerBM07oLE3xCUoHCSqY9fmSDLz6F3btw7fw9LIgf
         4vgRvGg35QbbOIjie18hE2n4FTm5XYd03ZleacweTAmrO5a/6rCF6OSK2+Rf72Wb4vHs
         QBOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785858518; x=1786463318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fJC5+YtFPL568P1Nwi/6zQXEX1Gc8Q+IUKJN5b49m2w=;
        b=FS+8oYyR740BMdHP0/OjR2G/Eo74ORp81tk7GXSy17t2Bpze6biN/C3ZtiHuYmayjm
         nuF+R7+8tGihju0vNo6fR9tnFfpR5LJxsPS5kjCFJmwLpaXyOlPOzRJxViBDGkq288JG
         mocWdJWo0EiBnM6+ktyzyCrwOCLQwMAuUa7nCnY2FKBx5wEhNF+NXP8rLHswl+QHwzjp
         W1uLvB+tYYVbrRHdxDVrIa0B3zmNNfdgz8r8u7moTZTsvd+/9exZvLCGbq+gW/7a5PVn
         HSeUPxe/OZ1AySlMmbIelCQgE2Jf1XBitYPOsNvW2LBfj9cQekXrUTi6GC9JbqiMq+9l
         ZBmA==
X-Gm-Message-State: AOJu0YyzSiioIoaG5BD6t9obbgPGcI8xis9s47ebgjUgQYYEDlOJ8fuw
	0rtubE+Zu5OSTz20ZCx/aVSwdM1/Z3ZhSyTlR4OGtNChjhxmPc40nEtevjpK+A==
X-Gm-Gg: AR+sD10AcgyMz4Mgbn0ERB/cQmXyDETfG83fU07f2PXl4wUuuRPKZia4EGxp2mxTFDC
	j03D7gjixuwPiO66ew7B+gfPXZHdX2KJnOudun8XoBerjQZNmwkaGiyeaDMPsc3wyDwQgQ3QdLj
	4Vhns6D8R8dvzVkKgerSiIfJHsxLSpRcJbEf1jRe522HCiwiT4uUo84GGPAYHyTzoFSt1B+MTid
	FPsx10271CLquPc0LLABPvLMeQ7QaKZUmPmbzPPf/M/aqHINYPaeQeazK8e2ZVSUenzNhsALMFs
	Uel1oazAQnJZb2WNQY2xZIMPhaXOSjQ1crTJrVsC+chNjUNehz876c2teUPguA/ZAeNNZMYe97l
	epERil6SXongVd8NnwH6Lo4W1/FJZcnwFzDneavyYfycKUiwhkgogoOGJwe8BVPPiT4zZSX9uzd
	CN5l9oTKbSnROrHtU7FRC/4IwPOs+cmhQFDiKkOYWJW2s42/W5Zw5oTbPAWlUTiFfjlvhLOSRAg
	PwSb3W0t5AHB8r5bri1BowhKiNrpWflFg==
X-Received: by 2002:a05:600c:a45:b0:492:45a0:dcef with SMTP id 5b1f17b1804b1-4980c66d8a5mr305184025e9.5.1785858518366;
        Tue, 04 Aug 2026 08:48:38 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 17/20] xen/riscv: implement init_intc_phandle()
Date: Tue,  4 Aug 2026 17:48:07 +0200
Message-ID: <2cfa77799f1605bbe4f7dc70662e356e52d4581e.1785836421.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785836421.git.oleksii.kurochko@gmail.com>
References: <cover.1785836421.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1785858518-74A894E9-26B688DB/10/73395122804
X-purgate-type: spam
X-purgate-size: 1378

Implement init_intc_phandle() to read phandle of interrupt controller
node and save it in kernel->phandle_intc for the future usage during
creation of guest interrupt controller node.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4-7:
 - Nothing changed. Only rebase.
---
---
 xen/arch/riscv/dom0less-build.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/xen/arch/riscv/dom0less-build.c b/xen/arch/riscv/dom0less-build.c
index 4cc00012aa8d..a1fa51b996a7 100644
--- a/xen/arch/riscv/dom0less-build.c
+++ b/xen/arch/riscv/dom0less-build.c
@@ -4,9 +4,26 @@
 #include <xen/device_tree.h>
 #include <xen/fdt-kernel.h>
 #include <xen/init.h>
+#include <xen/libfdt/libfdt.h>
 
 #include <asm/p2m.h>
 
+int __init init_intc_phandle(struct kernel_info *kinfo, const char *name,
+                             const int node_next, const void *pfdt)
+{
+    if ( dt_node_cmp(name, "intc") == 0 )
+    {
+        uint32_t phandle_intc = fdt_get_phandle(pfdt, node_next);
+
+        if ( phandle_intc != 0 )
+            kinfo->phandle_intc = phandle_intc;
+
+        return 0;
+    }
+
+    return 1;
+}
+
 int __init make_arch_nodes(struct kernel_info *kinfo)
 {
     /* No RISC-V specific nodes need to be made, at the moment. */
-- 
2.55.0


