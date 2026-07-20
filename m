Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B30C44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:00:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366963.1616836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqQ2-0007Fz-Im; Mon, 20 Jul 2026 16:00:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366963.1616836; Mon, 20 Jul 2026 16:00:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqQ2-0007F6-6g; Mon, 20 Jul 2026 16:00:38 +0000
Received: by outflank-mailman (input) for mailman id 1366963;
 Mon, 20 Jul 2026 16:00:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqQ0-0006ws-Sw
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:00:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqQ0-00AdEr-9U
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:00:36 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e461a-5cb7-0a2a0a5109dd-0a2a4505a692-20
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:36 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4624-4cb1-0a2a45050019-d155dd33f1db-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:36 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-47f7872abb6so520820f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:00:36 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63edd7d3sm30084673f8f.25.2026.07.20.09.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:00:34 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784563236; x=1785168036; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bw1hrTkQ2ATB1SLL0iu4tNbNK40JrBmaLHXXypeFp0c=;
        b=s2xuyZgC9l4bMLrmjMxRnRscz/ReOB0pOL+tgBnQ6DzQgcbkKFAi5Wdxhmc356KS04
         1woABZG+5kPhNmCbX66LmUAxtu0hpo3xwBflALv6GwSGmLShUJFsUvhtthcYy8tSZFU4
         NrdpOl5937cQ2fYkyZ2m7sDOrDlT+B6fVp8Npd9bR021OdQl56ejBji5xwz08HqIc9rN
         vUDZ0KArD4BtjjJJaCAv96nKFI+Knnoz/F2ygkK5ZiyuuXYdlV2Shrz1QTb4c9/M0uEW
         O2g2Ls5uUk61ddnSGr2rHV7ckKjFBYpSUk4VfxGcCDAg4Gm2TlVOViGuaVhbrF86kzSt
         l/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563236; x=1785168036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bw1hrTkQ2ATB1SLL0iu4tNbNK40JrBmaLHXXypeFp0c=;
        b=MLVYJgcpGDq77fGc+fnSpcoz8BqsZQuNpwlvv4zwQ0yJkwVgqnbFP82QwdeQbcJaXJ
         OCKtPufp4pOipm5C4rz0Yi2kzei41nJtlJgk9FLFnJn5nd4Ccflk84hPX8LajyC2EF/C
         NLmZE1xpH0HfP19EmRl4Hf4fSY3ckj8rzVYuqSdgbKmaVquziiE35ErSLaz1noGnG7/D
         tNnbjhl5AILwfmK6VWcw7lI6jjHv7VwOiwlVt6oNBlLgYdt/rQdxit+isLmqJLRk1nUM
         RGgUbM42u0RNyw+TidrQsGeiQOG2fv5QKEYrOGpOSKgTb80+Tb7mC3On5BUDiTQm1cCD
         x1Dw==
X-Gm-Message-State: AOJu0YyCqsR43KrFa/RVQepPDBjFycZCpjJOAufe7lHqfeB875gHAGQ6
	95CvK2Fr5pkjokNXh6WmJLfrK6wMCSVnTV5rj7Ie1lbfn0Nxte4fq5bWMAcYgg==
X-Gm-Gg: AR+sD12rDqJNcAzxkR6RMog70lWQqbq3IYWaeMSNIeiSr7VNUWJO8FYzqyDBjTJQ408
	sWTlrxCA385MwzIHnrfourBi6mAIrz9KY+SHRqIDDRkbVEPGM1NY+onJXsm27XV/xyb5SkcS9w+
	x8Yj5KXQxp1bzkuEwpLzP2cx6R+2m7v6zaaFWh3Mg1iJqZpmOQzm81yLLrm0LCGyE7bodf5LFuT
	FPQCuYkXr/5rXVZU1cAU0W8c3vSGxAdwY+o3+WMg7kaXw0Ior8Xr2cGC8n3fYzuEYLMu1Dh+BYh
	Vc3YmPShnZaYUHvwFjmBZg80k1Lr+OEejMQ8h/72Aq5jUjJPziD3Azwwv+yolpbCwHUXIo7F+xc
	pdRhDdJigvQHsLAkDC2ur1pRRzDgIz0LtObxpE1axFIe7lPbMsw66zKsznJG+a+IAu2YaK4eXX6
	R/KwuHzu0Pa60OhdL+aMakSuEmBbo78cmtaCpbVCXGGA7P86QKmpRfwzAslw==
X-Received: by 2002:adf:e190:0:b0:47f:6981:a043 with SMTP id ffacd0b85a97d-47f6981a0f3mr11625636f8f.26.1784563235540;
        Mon, 20 Jul 2026 09:00:35 -0700 (PDT)
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 12/23] xen/riscv: introduce aia_init() and aia_usable()
Date: Mon, 20 Jul 2026 17:59:53 +0200
Message-ID: <5d8739f32ae69ee845559ae1a03442e1a583c39d.1784559209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784559209.git.oleksii.kurochko@gmail.com>
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1784563236-730B22A1-55F362FC/10/73395122804
X-purgate-type: spam
X-purgate-size: 3183

aia_init() is going to contain all the logic related to AIA initialization.

At the moment, it only checks whether the SSAIA extension is available,
and if so, sets is_aia_usable (which  indicates more than just the
availability of the extension) to true; it also signifies that the necessary
components (to be introduced in follow-up patches) have been initialized.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v5:
 - Update the guards in asm/aia.h according to CODING_STYLE:
   s/ASM__RISCV__AIA_H/RISCV_AIA_H.
---
Changes in v4:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v3:
 - s/is_aia_usable/_aia_usable to drop the is_ prefix while avoiding
   conflict with the aia_usable() function name.
---
Changes in v2:
 - s/is_aia_available/is_aia_usable.
 - Drop return value for aia_init().
 - s/aia_available()/aia_usable().
---
---
 xen/arch/riscv/Makefile          |  1 +
 xen/arch/riscv/aia.c             | 23 +++++++++++++++++++++++
 xen/arch/riscv/include/asm/aia.h | 10 ++++++++++
 xen/arch/riscv/intc.c            |  3 +++
 4 files changed, 37 insertions(+)
 create mode 100644 xen/arch/riscv/aia.c
 create mode 100644 xen/arch/riscv/include/asm/aia.h

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index fd5e499eb4b9..9df8b72b5494 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,3 +1,4 @@
+obj-y += aia.o
 obj-y += aplic.o
 obj-y += cpufeature.o
 obj-y += domain.o
diff --git a/xen/arch/riscv/aia.c b/xen/arch/riscv/aia.c
new file mode 100644
index 000000000000..e31c9c2d24b6
--- /dev/null
+++ b/xen/arch/riscv/aia.c
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/sections.h>
+#include <xen/types.h>
+
+#include <asm/cpufeature.h>
+
+static bool __ro_after_init _aia_usable;
+
+bool aia_usable(void)
+{
+    return _aia_usable;
+}
+
+void __init aia_init(void)
+{
+    if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia) )
+        return;
+
+    _aia_usable = true;
+}
diff --git a/xen/arch/riscv/include/asm/aia.h b/xen/arch/riscv/include/asm/aia.h
new file mode 100644
index 000000000000..aaa4bf91fc75
--- /dev/null
+++ b/xen/arch/riscv/include/asm/aia.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef RISCV_AIA_H
+#define RISCV_AIA_H
+
+bool aia_usable(void);
+
+void aia_init(void);
+
+#endif /* RISCV_AIA_H */
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index e63da5e22efc..2864a896b677 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -9,6 +9,7 @@
 #include <xen/lib.h>
 #include <xen/spinlock.h>
 
+#include <asm/aia.h>
 #include <asm/intc.h>
 
 static const struct intc_hw_operations *__ro_after_init intc_hw_ops;
@@ -33,6 +34,8 @@ void __init intc_init(void)
 {
     ASSERT(intc_hw_init_ops && intc_hw_init_ops->init);
 
+    aia_init();
+
     if ( intc_hw_init_ops->init() )
         panic("Failed to initialize the interrupt controller drivers\n");
 }
-- 
2.54.0


