Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B42C55822
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 15:48:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382268.1625670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNW-0008Rt-RS; Tue, 04 Aug 2026 15:48:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382268.1625670; Tue, 04 Aug 2026 15:48:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNW-0008RZ-Kq; Tue, 04 Aug 2026 15:48:30 +0000
Received: by outflank-mailman (input) for mailman id 1382268;
 Tue, 04 Aug 2026 15:48:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wrHNU-0007gh-Fy
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 15:48:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrHNT-009QHz-SM
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 17:48:27 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209c8-5cb7-0a2a0a5109dd-0a2a450bdaba-8
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:27 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209cb-b7e8-0a2a450b0019-d1558031e9ac-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:27 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4955de8797cso21143195e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 08:48:27 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49949fcb46esm116430355e9.5.2026.08.04.08.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2026 08:48:26 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785858507; x=1786463307; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rya0M33QFFZ2ZUtKRPpGLKlS3qYbQXw2r8chWSRTMZ4=;
        b=cfbY1msnd39EcO4GDxFdxC01xMFVr7SpVkJ9oPRgn9rDEu0Cs1AAcORr697/qthwfS
         nK+Psr0OIwV8BnvvKdbgAy7PEO2+YjBl2WluLDu1/EgUtV9BQPHBe6dqYg7kXv+4W6j3
         Y1U1YarQO7ErvGXTMsd17ZmCXCNMCjB5n84gMnP2F1uPtcksmv8bjE4JR9N0zIdJ1Ug4
         QzsG35CQHq/a4F9iK3eqe0ARfjcTzOpcqYGrP6IrODKuZpkul19gPekabLR32XZogGco
         Gwp5pZ9bwic/nJH/wLpQ1hoSJW/Sz7mo7Kan9B46jMS11iMCNx6Z2MzYgLBvRWpOFOdj
         WLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785858507; x=1786463307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rya0M33QFFZ2ZUtKRPpGLKlS3qYbQXw2r8chWSRTMZ4=;
        b=c4vIKlqb2vTmWvbRmZqp1m7JrQkHMktXnl8+6v82Q+OeRKe44Bv6MyJ2odXdfAWjZl
         T1gk7ihyd5fSl4a87IfOBNAoYA8WAoPbM+13TerULaUXtatckW68JH3vXCJ8EExffZTD
         +QJepOeKGSetkvM951kuqRo7Ummt+cvj3e65/Pqd4DyjltOvqChK/f31xiHQXoHHUL41
         mtj5Eyo/F8GTwdMWtaBlaZHdHO5ARCsqkTJKzGu4rH4SWkwb3+yix5Mn2Um/ZyA84sT3
         jW77PfbVgJb7ApFwOcy24KGrau43YZuek5wiTkeZ9TdDihNvAvRBln+HnGzu18xCxUge
         MH3g==
X-Gm-Message-State: AOJu0Yw3/UQ/yX2fzcWfoe05vvPKoXu57eIUo5kLIIK+mw5Cdhv+nE0p
	zzsNj+x0+GAn0/h6Vmjg4jiYnQ//nxHWp4r7bcF4EWSktIai1M0VjEhpUfyVZw==
X-Gm-Gg: AR+sD11jhv3dpsW+6gC1PElWwURVzh75OCjffG6yt4ek0Yv2qONMNCt4um4fm1+sVS1
	SxWpmXz0gkrZHG+GqAFB3djXqACBhLZbDhSqqpqJpgkCvZUFEPZSg04lbz2+Po+iMmvZ6EtPTQs
	EzW4pvdQPJ19d9+UXNZNDu/7y5P4XbELCpltwWZ0zZ3ORVW7keBJHoAReF/06Shxp/GwzFSODve
	FMpP+yugC2IDPRBHXArfrk8s3do251ajHdhZKgqa6+hX4qWClPBM1U92efraxwX41CGwadTtZT8
	fQgAA4jPiK+UAQhiGcOL7TZMiKeq4kFx849a+8OC9IS/vH1UAwuWy0ObfewBfRWGNWT9p3lM9lN
	GKFb5AZPs+TVyEUIF4eae3wXtv0pqLnXNhUHPhUDFeQeYH7WO+ZVVNfynCdjvzeWOiy9ouCfJzl
	no+C8NjLeDdSA3CbznM4gRbTImwnsJm08K5oAbbXcetKmAhKzfYkPT4Mqmn7+Ji8AkoLPO1CAtC
	w3xMCy0iFDT3JwXL0UzcmCwjHozrVsF2WlZHrnnGMkC
X-Received: by 2002:a05:600c:628c:b0:496:c0f6:78d6 with SMTP id 5b1f17b1804b1-4980c64b5a7mr388460645e9.2.1785858506985;
        Tue, 04 Aug 2026 08:48:26 -0700 (PDT)
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
Subject: [PATCH v7 07/20] xen/riscv: implement make_arch_nodes()
Date: Tue,  4 Aug 2026 17:47:57 +0200
Message-ID: <6bc1edc29160d7758d71402632309aeb7029d7fa.1785836421.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785836421.git.oleksii.kurochko@gmail.com>
References: <cover.1785836421.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1785858507-AB8D19EA-DE3A0F14/10/73395122804
X-purgate-type: spam
X-purgate-size: 1444

No RISC-V-specific nodes need to be created at the moment,
so make_arch_nodes() is implemented to simply return 0.

It is placed in dom0less-build.c as make_arch_nodes() is
only used in the dom0less code path. In the future, it will
be extended to create an emulated UART node.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v6-v7:
 - Nothing changed. Only rebase.
---
Changes in v5:
 - Drop "Add" before Acked-by above the footer.
---
Change in v4:
 - Add lost Acked-by.
---
Changes in v3:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v2:
 - Update the commit message.
---
---
 xen/arch/riscv/dom0less-build.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/riscv/dom0less-build.c b/xen/arch/riscv/dom0less-build.c
index a683972e9235..4cc00012aa8d 100644
--- a/xen/arch/riscv/dom0less-build.c
+++ b/xen/arch/riscv/dom0less-build.c
@@ -2,10 +2,18 @@
 
 #include <xen/bootfdt.h>
 #include <xen/device_tree.h>
+#include <xen/fdt-kernel.h>
 #include <xen/init.h>
 
 #include <asm/p2m.h>
 
+int __init make_arch_nodes(struct kernel_info *kinfo)
+{
+    /* No RISC-V specific nodes need to be made, at the moment. */
+
+    return 0;
+}
+
 int __init arch_parse_dom0less_node(struct dt_device_node *node,
                                     struct boot_domain *bd)
 {
-- 
2.55.0


