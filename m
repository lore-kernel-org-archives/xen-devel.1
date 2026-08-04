Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85950C56201
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 15:48:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382272.1625693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNZ-0000du-Kx; Tue, 04 Aug 2026 15:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382272.1625693; Tue, 04 Aug 2026 15:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNZ-0000cn-9P; Tue, 04 Aug 2026 15:48:33 +0000
Received: by outflank-mailman (input) for mailman id 1382272;
 Tue, 04 Aug 2026 15:48:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wrHNY-0000H8-3W
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 15:48:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrHNX-009QIN-GW
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 17:48:31 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209ce-e002-0a2a0a5209dd-0a2a45039d84-4
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:31 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209cf-fae8-0a2a45030019-d155802ae1c7-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:31 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-49554ebb87dso29813805e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 08:48:31 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49949fcb46esm116430355e9.5.2026.08.04.08.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2026 08:48:30 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785858511; x=1786463311; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SDS5pojmUe3g07xF2AfnOz4IjY2ac3KvA+3GWL6CRYM=;
        b=rExF+rEmSxmns9/JGLQkUQ/vd3TB1JZ/fiz/f0i6v57laz3Eo2/o6P2J8Ai8sYqJab
         funUWIHDqSm7j13kM/9dIwfSEDDaZR2uCtmBxJQckmsZ6hvjwSSN0nMgOBl53b2IGyuS
         GKazF+Hu/fXgjq80QIzzVhXm1WeZ9X1vHJEakIwsiPSNCeyJPM/nghtm3lNkDo1qe10e
         sKzHWjDcPR868Gv+An6oy2S7VF75dIl7agVir5I0L2K1DH1Yg8H5OzxFZ4CDiRGCuRCb
         fngfvjNkq9EBNkvq2R2r9fAFLy78ikkcbzTx3XtG2Ht04fgZqyofxViGeCC7Xd/k6Hxu
         Ytag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785858511; x=1786463311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SDS5pojmUe3g07xF2AfnOz4IjY2ac3KvA+3GWL6CRYM=;
        b=hvGvTRD1j69g6jn+fcki4wxQAkwAGySkgNnayD6Pk6pbn1VeskE2z3IvkG8bc/Fa/1
         oCDBdFXoQiU8va9deZD53x5SwHtTHHbF9DBoj4+Nm77sBi/PWzE0lH3SAp+MDdZsaLX9
         DqfmEIXb1JiYq4l07WNYRH0aoe3Gdr+IqqA89LUU66dCzulgDzo3UFZlhvmnHD6Xm4WA
         W4Wn5VIlCl93SgeBdnPXcslW3jpxcwhilYyPwTXRNv1WMpaH8bNl4w48tXVqc+z7Or7l
         e04/PkQ8X+BIf20qBSrpynJ7576g4pToJ1gZmvgICMQpEIJMpOZbTphk8f6O5qi8dSp6
         /bWQ==
X-Gm-Message-State: AOJu0Yy1EUTNMZXnBF2Pk/yVSTHrq5hzXwlOmEbOjUqHJjdIxySXx+BG
	wznDGUHlF4ddRwGylHR60is+ph6j3menmBvWZKCHAA58uEXuc8rn8QqkfEghhg==
X-Gm-Gg: AR+sD12w+X8tMWLBs1apKm3jEYuUWdXswNGYhL3W4jaox5pHAVwVJZ3eF9Y2ZBUKHIP
	Na0RDHBP5HcSr+lwo0BfqxvNTltS0/BCLJyPm5wq3SIjrjKULbq+vaMoYGLaFXbtf42Z49gzqtV
	u02crfHxtWUvWQ/L2TCadeKqiiHwKq3UsZNM1z8EfjziQJUtpjC/WQSGI1/boIPdbIuccvkZmWa
	T395fqhdtKhmI95F34eEID0IlRsKTO/JKyjsbD8qKc892wtMgOJxynGDbG7O6+lY2fRip14TEfI
	329Y8Wse/cQd5fzp+5s0vCS7XIx+ae0dq1zv4RGQZoJoZ38Y5L7R3iba855w2lLlHSkAqHsRPdl
	96Ugtx8aMNAqFtZfxdcqZuRyXZ2D3LbNfyyiO+GHRrY17vCLQgh+f9lgX1cScQkB30QZeM46k4b
	FOmcVIyIOvdIZ6jHq+iBcK3/CtifmheEY5xGIbsepB0+lAuXNVJvDXWnc1RelPdTDjnXUv5PR4A
	YEJNamdxcBwxWcF6MTKe2RULa/6WnbAnkU++nCiAP4JEw==
X-Received: by 2002:a05:600c:6990:b0:495:4d00:2fc0 with SMTP id 5b1f17b1804b1-4980c673907mr369134765e9.12.1785858510888;
        Tue, 04 Aug 2026 08:48:30 -0700 (PDT)
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
Subject: [PATCH v7 10/20] xen/riscv: introduce aia_init() and aia_usable()
Date: Tue,  4 Aug 2026 17:48:00 +0200
Message-ID: <a2d2d30d0810a1ed2c129a35b90898884d262486.1785836421.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785836421.git.oleksii.kurochko@gmail.com>
References: <cover.1785836421.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1785858511-6E6CE4E9-47FC6A01/10/73395122804
X-purgate-type: spam
X-purgate-size: 3240

aia_init() is going to contain all the logic related to AIA initialization.

At the moment, it only checks whether the SSAIA extension is available,
and if so, sets is_aia_usable (which  indicates more than just the
availability of the extension) to true; it also signifies that the necessary
components (to be introduced in follow-up patches) have been initialized.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v6-7:
 - Nothing changed. Only rebase.
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
index 2d24670dfc74..8e7a6370eee2 100644
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
2.55.0


