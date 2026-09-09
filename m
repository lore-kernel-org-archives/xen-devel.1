Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2280DC79FB6
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 11:54:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412845.1643159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Gs7-0007OP-Mi; Wed, 09 Sep 2026 11:53:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412845.1643159; Wed, 09 Sep 2026 11:53:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Gs7-0007OI-Jx; Wed, 09 Sep 2026 11:53:47 +0000
Received: by outflank-mailman (input) for mailman id 1412845;
 Wed, 09 Sep 2026 11:53:46 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4Gs6-0007OC-50
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 11:53:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4Gs4-004v81-Vs
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 13:53:44 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6aa1489e-8faa-0a2a0a5109dd-0a2a4502a3c2-34
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 13:53:44 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6aa148c8-6ca4-0a2a45020019-4a7de18c8d26-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 13:53:44 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49d097b4939so659945e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 04:53:44 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d20da3354sm41850325e9.2.2026.09.09.04.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 04:53:43 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1788954824; x=1789559624; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B/6yXL54bLxkuz/0JL99kwUk+Zbxp7yQGgiSS7WqOJI=;
        b=qjCoxzmVA1mm8ZfkWzZT7/BnA8Sliv12/Mro3EfNEhumZEZIu8Iu+lx3K2ygaKl5EA
         naG8R3dgqsyOCo0tgUXtqGGuTi5VgbaaZZL9JtaTY1bu8dSMV6KmaPvVdIGk/ppVfE8Y
         T0C/GkKfTRlr0Em+FvczH3bMPffNq9kZ66Loc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954824; x=1789559624;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B/6yXL54bLxkuz/0JL99kwUk+Zbxp7yQGgiSS7WqOJI=;
        b=hHJEOHyo49H1xgRMqypeRelemkJHZ2YIR6gWbYeRbNP9CnviZuR2SDtr/s+KmnaQ7c
         4UITbdoOuxFXzUkQNFeSyrL0W8vo26VzlwkAoFBNCyFvXBeLVbGKEPSrjC1kdghQswQO
         MIrm3mfKB2GCbvlhtjNFU8hl7WU5SZt/nRo5P9L8iOyKID43C7zASC0mk3jfx5nw6VCY
         wuYZOw4uzmIw2rH6sPux1ehm1H9D5bDYOrEXEIGNw5ghv07PBuS6ghwp7hT40hMVFzW1
         u7EL9PiQDdYQzfRj9MP/L/9hI+hUQU6Hu8eqWZbNDvzG65MxTw1F36h/fWgGjZIlyQ9E
         Uyig==
X-Gm-Message-State: AFuF++lSdV7h2ASFA7QMNp4qBTOa4KmmLf/fQznycdnBErca90530Ba1
	gx4iFlnOv0zqdxpoUVmRpcf8laxk6sdGAbUzuSJFrmzaZ+VjE+/gmmIggqBnGD12cNG4QLf652/
	LMC232wQ=
X-Gm-Gg: AYBFou3Y/nN+QtxHIWY+R6tr0rYa2Cqq9P6wq2kXM/SJSRtzx7fQ/ig/zfrSKdupT3G
	9YlDcFnzFpS7ZuNiA5vnyBKXFJkoC0gdONjJxLRze2gTyWBEVFpTXlsdXH7AiRfQWsjbiqy+c6g
	/nTDyqPxXYsVejUv21qI4YAXeP5h/Pw+SfGQkPiffQanJ/HFmfFIadLGOsLk5Wc3GQ1aH47j535
	7wZrpGp8pj4BSiRbku2BC3Re2jOY6z/y7LB3h4rn5PWnTb5fXo4eiPWceEMPyaM2JL7fp5CgL/9
	Sss9DYBSbbhJOznkYVPTaFAg8YhChCtAlDk8JsDPoAMprXrYDr7e8TDD0vZHzDTjrV2wP/8b6WT
	8Ff5rHsZpDmMcAIeByjhU4Fskyq2O1qjfIFBFEwfnV9m6PhzzEjSz7k6PzK9wrmQtwniak1L+10
	D2qIk5hfhYewukcaCMh8i4AG3nwcohsnv3I0cnjo2gTNvMicPfExRvN37xyGB8MNF3fVECETJiC
	mWOoGy0dMeVGkFx5lXhL1RZin3K8bQMULlcN4ZpcjgUCD45fQ==
X-Received: by 2002:a05:600c:4f44:b0:49d:e0c:e55e with SMTP id 5b1f17b1804b1-49d25914e45mr5985165e9.23.1788954824184;
        Wed, 09 Sep 2026 04:53:44 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH] xen: Use __has_include() in xen/percpu.h
Date: Wed,  9 Sep 2026 12:53:42 +0100
Message-Id: <20260909115342.3376342-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1788954824-67ABD2AC-34FFB9F1/10/73395122804
X-purgate-type: spam
X-purgate-size: 3296

Only x86 has an asm/percpu.h.  Have the compiler only include it if it's
present, rather than symlinking an empty file.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

This same pattern can be applied most of the rest of generic-*, and it's high
time we purged that logic.
---
 xen/arch/arm/include/asm/Makefile   |  1 -
 xen/arch/ppc/include/asm/Makefile   |  1 -
 xen/arch/riscv/include/asm/Makefile |  1 -
 xen/include/asm-generic/percpu.h    | 14 --------------
 xen/include/xen/percpu.h            |  4 +++-
 5 files changed, 3 insertions(+), 18 deletions(-)
 delete mode 100644 xen/include/asm-generic/percpu.h

diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
index 4565baca6a4d..a78a498eb566 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -5,7 +5,6 @@ generic-y += hardirq.h
 generic-y += iocap.h
 generic-y += irq-dt.h
 generic-y += paging.h
-generic-y += percpu.h
 generic-y += random.h
 generic-y += softirq.h
 generic-y += vm_event.h
diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
index c989a7f89b34..a5c46704ccad 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -6,7 +6,6 @@ generic-y += hardirq.h
 generic-y += hypercall.h
 generic-y += iocap.h
 generic-y += paging.h
-generic-y += percpu.h
 generic-y += perfc_defn.h
 generic-y += random.h
 generic-y += softirq.h
diff --git a/xen/arch/riscv/include/asm/Makefile b/xen/arch/riscv/include/asm/Makefile
index 86c56251d5d7..d3483699278d 100644
--- a/xen/arch/riscv/include/asm/Makefile
+++ b/xen/arch/riscv/include/asm/Makefile
@@ -6,7 +6,6 @@ generic-y += hardirq.h
 generic-y += hypercall.h
 generic-y += iocap.h
 generic-y += irq-dt.h
-generic-y += percpu.h
 generic-y += random.h
 generic-y += softirq.h
 generic-y += vm_event.h
diff --git a/xen/include/asm-generic/percpu.h b/xen/include/asm-generic/percpu.h
deleted file mode 100644
index 3fdb3a2a0208..000000000000
--- a/xen/include/asm-generic/percpu.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_GENERIC_PERCPU_H__
-#define __ASM_GENERIC_PERCPU_H__
-
-#endif /* __ASM_GENERIC_PERCPU_H__ */
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/include/xen/percpu.h b/xen/include/xen/percpu.h
index 30609f49f0b3..d324671b5b5f 100644
--- a/xen/include/xen/percpu.h
+++ b/xen/include/xen/percpu.h
@@ -27,7 +27,9 @@
 
 #define get_per_cpu_var(var)  (per_cpu__##var)
 
-#include <asm/percpu.h>
+#if __has_include(<asm/percpu.h>)
+# include <asm/percpu.h>
+#endif
 
 #ifndef __ASSEMBLER__
 

base-commit: a2ca4f8b9890899ca89d6116002e7a9c5957d8c6
-- 
2.39.5


