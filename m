Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCDFCD37AD
	for <xen-devel@archiver.kernel.org>; Fri,  8 May 2026 14:44:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1303751.1577081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQn-0007XN-1J; Fri, 08 May 2026 14:43:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303751.1577081; Fri, 08 May 2026 14:43:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQm-0007X3-OJ; Fri, 08 May 2026 14:43:56 +0000
Received: by outflank-mailman (input) for mailman id 1303751;
 Fri, 08 May 2026 14:43:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wLMQl-0007Cq-8s
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 14:43:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLMQk-007XVC-Kx
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 16:43:54 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6a5-2eae-0a2a0a5409dd-0a2a4502de26-14
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:43:54 +0200
Received: from [209.85.218.46] (helo=mail-ej1-f46.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6aa-af86-0a2a45020019-d155da2eb034-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:43:54 +0200
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b8f97c626aaso358645366b.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 07:43:54 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bcac4942068sm90736166b.62.2026.05.08.07.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 07:43:53 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778251434; x=1778856234; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuQ/dZIZ6GUpQXp8UMUYCyKW7XWo14Gw5sW3GPz0m38=;
        b=fXOB4eAiVaP2gDuCF3VApR2SYYZK9jd26lwghggHGfuilvx4jsLq3WIAi8ufGuVrlV
         I88RstgFMlLVA3bk/EjKphV4tiAHovU/+awTXow1KkI7I0Mr8KGb+j4sXtQJWVXK4nhy
         jjCJN2Gpt6TbmHStXXoy5nvjtYJbdR05J9t0ata4T9cPUekrluY6FfFUIAKfk55u8UUK
         HOoIVQat2bM4KdbMeqFkgQloOwySYX1CTdYHDZJB9wmSRglSWKruef0qgXzdPJSmizXZ
         yKlg0SdEIAWSiMJriBFMnX3/P1Bi/3SZT7RzTTM6ir2PGHQbESsdAljzwPA9ENpI/97Q
         F4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251434; x=1778856234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AuQ/dZIZ6GUpQXp8UMUYCyKW7XWo14Gw5sW3GPz0m38=;
        b=EiYN3xuW85o4uzClE/5yqyNKcQsqgACcv6snrwUbI7d0axQsjR5jdaBce5KY79WWSw
         KwYb51JdNYxGUPmTYlRnqfurMc6/ciyTdbRJ+5Jg5qSSQfzwviS4KbzcwkzmYeCaQz1h
         MtRUcDe6ZOhCWRzeHaiGez7bqOKE3oiW/Vnd3QiO35/HKqzDAxtw9u5/LwrjwjBIPZt7
         87NwSJ3hTcV6/6z9/OwUNuoyWwzAovTrrl9y5Vt3/+h/KF6C2krgXGK35v8sX8nrbpDp
         NgcwrJ5kAMML/oLbvMeXPLe67f0ebT7g9K2Nvlt2zYhFgEsv+U8spjHYL5tisTvH2ImC
         ko4g==
X-Gm-Message-State: AOJu0YwDxxjFN3yjkGq0Wl/GdA0D54OZfusZOrq/h9+4uMgAil4wyN0u
	AgrSlA3xZ+iSp777n1sJkEia7xNHRy5AquUqnLklO+GVhro3RO49KRrQn709Bw==
X-Gm-Gg: Acq92OGHIVtp1tb3GCcELuP+qSQcm3WkXmR+84eHNYYTyGcLkFUdpFItqFUpKee5Z5l
	F7QeopN66+nipfkBsgR0F6YyZ/cxkKJemsw8LNgejnkcaN8SdiawMtliAaCtkwz7XfWEcACKwBu
	/xiw+hu9Dv09P9PBtfNS4WYPMHOLH9IyZc/If3jIsC2LERQNsFya6lnpYOx9Qd1wXQC/0Blt+fq
	oTseRCSbVqz4OULHjPusRNJeQ0YoNAzsFVk7qF7UWY7n53vd+08InVj1aaL2RgYblFXf5n1F+g5
	AtGmK6ylEpgzwRP+LqSp85+qp1uOEG/FTMYDIrbgy24q3pgMrZujbjO9bJWCsh5wQRKe3FV/7sY
	mk3a7U9Iqq8E4npB0XzBnZKbhIHjcsbYttDpoQPJhXnIg6insUObnQR3+0Sb6ZhyAfVM6Qvg/Hs
	rNo8lrB/PeJ0T4UR/KnJ9auRXHYqQrr8FQzoCFkrd+FP3cNdsn+tNOZUomDrxfYpR5/lm93jvME
	Y7B
X-Received: by 2002:a17:907:c14:b0:bc6:7238:bd57 with SMTP id a640c23a62f3a-bcaa9f590a1mr190536466b.7.1778251433591;
        Fri, 08 May 2026 07:43:53 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
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
Subject: [PATCH v2 11/26] xen/riscv: introduce aia_init() and aia_usable()
Date: Fri,  8 May 2026 16:43:13 +0200
Message-ID: <66ca7f49756740c3d54ac660bebf406479ed011e.1778250616.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778250616.git.oleksii.kurochko@gmail.com>
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1778251434-A9971161-45DABEF4/10/73395122804
X-purgate-type: spam
X-purgate-size: 2828

aia_init() is going to contain all the logic related to AIA initialization.

At the moment, it only checks whether the SSAIA extension is available,
and if so, sets is_aia_usable (which  indicates more than just the
availability of the extension) to true; it also signifies that the necessary
components (to be introduced in follow-up patches) have been initialized.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - s/is_aia_available/is_aia_usable.
 - Drop return value for aia_init().
 - s/aia_available()/aia_usable().
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
index 000000000000..f67f422c5a45
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
+static bool __ro_after_init is_aia_usable;
+
+bool aia_usable(void)
+{
+    return is_aia_usable;
+}
+
+void __init aia_init(void)
+{
+    if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia) )
+        return;
+
+    is_aia_usable = true;
+}
diff --git a/xen/arch/riscv/include/asm/aia.h b/xen/arch/riscv/include/asm/aia.h
new file mode 100644
index 000000000000..ca42c3086126
--- /dev/null
+++ b/xen/arch/riscv/include/asm/aia.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef ASM__RISCV__AIA_H
+#define ASM__RISCV__AIA_H
+
+bool aia_usable(void);
+
+void aia_init(void);
+
+#endif /* ASM__RISCV__ACPI_H */
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index 0994deddcb2c..a611c9dc5f32 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -9,6 +9,7 @@
 #include <xen/lib.h>
 #include <xen/spinlock.h>
 
+#include <asm/aia.h>
 #include <asm/intc.h>
 
 static const struct intc_hw_operations *__ro_after_init intc_hw_ops;
@@ -34,6 +35,8 @@ void __init intc_init(void)
 {
     ASSERT(intc_hw_init_ops && intc_hw_init_ops->init);
 
+    aia_init();
+
     if ( intc_hw_init_ops->init() )
         panic("Failed to initialize the interrupt controller drivers\n");
 }
-- 
2.54.0


