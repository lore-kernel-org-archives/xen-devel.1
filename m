Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2011AC79FBD
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 15:09:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413273.1643536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Juq-0003Sc-JD; Wed, 09 Sep 2026 15:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413273.1643536; Wed, 09 Sep 2026 15:08:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Juq-0003SV-GT; Wed, 09 Sep 2026 15:08:48 +0000
Received: by outflank-mailman (input) for mailman id 1413273;
 Wed, 09 Sep 2026 15:08:46 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4Juo-0003Ef-GW
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 15:08:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4Jun-00DoNW-TR
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 17:08:45 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa17665-e002-0a2a0a5209dd-0a2a4506ec68-38
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:08:45 +0200
Received: from [209.85.218.42] (helo=mail-ej1-f42.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa1767d-195a-0a2a45060019-d155da2ae80b-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:08:45 +0200
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-c262bc686d9so755811766b.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 08:08:45 -0700 (PDT)
Received: from fedora (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c261f673000sm709991666b.24.2026.09.09.08.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 08:08:45 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788966525; x=1789571325; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/0W7LJeeRtFjbmuJPQsrOkLOl9/tUs9pbSj+ISpVBYg=;
        b=QSNg//iiO1wdtmenxp2hOlm263UL1KyUdEwAhj/QCuphQTHIHazJKpMd42ELcU9cNv
         H3rXCsDOTKCnowz9ACl7L39tmn7l43rhHQxIsav4ZvyUbGOGUizMUtvREJxHze1ewJTK
         RMq8g3YgWw+Vz4T8hps2WD+KkRBvMAlsfY9OdKyByneZISTsC00ozF5Y/drVoV0yDlyO
         TAyJM+2Kc6vNSz9VNIT5zOnr80OdtT+4TBDxR66Uw6grouFCK1IN4rJsvZAAwcw01uW0
         Xcyo25rrg9yqM8/0yL3k1b7vouEzMWHuoupWdrntTbkdzA2JLZjxSmYVn1j2G9+LbLTk
         SbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966525; x=1789571325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/0W7LJeeRtFjbmuJPQsrOkLOl9/tUs9pbSj+ISpVBYg=;
        b=ej6rIToaNfBhOfQpHL/2sEIC1gpD9wzIYNqTtjHzTD1VhU4tR4nIx9atqotyJExQI/
         ufKbhbQbph9mne1yPLx4iHKEMyZe/PuBkrtIjfyJK1rfR6Om8uuqs96pZlSwZsAlRreV
         5C7pwXZm1I54wXTZO3uvA4Tzkm7E3tl67YNHLAQd2ueu4whfrZ+TS8uJvUsnqrhc/wh1
         FW/piyjLjpF4oabA030Gv67FZd0SvIQUmtAQdfaJlJ+VO6bE6pajBF2TdeiHN3Th9YJV
         2RWoewZfDrg+3rL8VahOMW4DGvpBJpqnr6zEiB4nM8JfPM0KumgUNtBLI5wLfp0nmN4R
         0/rg==
X-Gm-Message-State: AFuF++m2sCKlNGWorZ+bR0DThApHSUSMhlioalsqiPfK7aqGiHQClDCx
	QpWKx3tPSV3q1v0MGGazhRksLGG4cxLaRDAS6puDvpuUgdwRB5YxOxltf/czyt3b
X-Gm-Gg: AYBFou0X81ELmsSHtJVjem6fa66/qyDNu0Jgc7m0kMNn2ftO3U5Cqyrl/66NtcFkAmw
	MTYOcqGd+n/V3smw2qZJqvyRFZEoSqvsE/wK8wl2yo0rZNvVRZjNEbOBX+3Qnk1fzv8O9oYZx6w
	y2kOuv8SxO0EHtfMUmp+JPQonl91+qg0Y+H5g0FMhmgeZB5ocCZWHwmGkGPoHTPX2iHbCb6lWSL
	s4t9DrmVOeqDHR6kwoYPgXNJP2OXGj63AIBFLk6LlG7TUwwp8fUzdwop14P0WxQhCaDYw0wHLLe
	mBr5QUlZnAvqDFkUBsN89DYZZIuhqebazSP86XT7ttHWIQUVMxk9TnC97OM41wodz5ALW3srWJ8
	5d+v+Kkpj4bjrJB5RMJml8b8RHA17KMsJwASub9hf7ldBQbe2GfEkQIRkt9fFlj6I8mghIMpuJk
	kSd4n6TCDdiHCdv5bPP54EZWLe1nXjo1f+MXGQqfCoSGwAC1vX34kN6vrvTWJKyN2jFEJhEXOKg
	aNQnhWAUt5hGcK85rQ=
X-Received: by 2002:a17:907:c81a:b0:c21:726b:34eb with SMTP id a640c23a62f3a-c260c7ad2e2mr1393559666b.8.1788966525397;
        Wed, 09 Sep 2026 08:08:45 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Zheng Zhang <zhangzheng@iscas.ac.cn>,
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
Subject: [PATCH v9 10/20] xen/riscv: introduce aia_init() and aia_usable()
Date: Wed,  9 Sep 2026 17:07:28 +0200
Message-ID: <38e822dac4d22a8f8348b54a8d0f7dff9187b904.1788876411.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788876411.git.oleksii.kurochko@gmail.com>
References: <cover.1788876411.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1788966525-FDA0C77B-CC68EF0F/10/73395122804
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
Changes in v6-9:
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


