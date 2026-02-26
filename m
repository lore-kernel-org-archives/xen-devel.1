Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C49AFC5939
	for <xen-devel@archiver.kernel.org>; Thu, 26 Feb 2026 11:51:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1241460.1542553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvZu7-00088X-5j; Thu, 26 Feb 2026 11:51:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241460.1542553; Thu, 26 Feb 2026 11:51:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvZu7-00088A-2c; Thu, 26 Feb 2026 11:51:39 +0000
Received: by outflank-mailman (input) for mailman id 1241460;
 Thu, 26 Feb 2026 11:51:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Tft=A6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vvZu5-0006E8-TY
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 11:51:37 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 813fca0c-1309-11f1-b164-2bf370ae4941;
 Thu, 26 Feb 2026 12:51:37 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4834826e5a0so8712645e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Feb 2026 03:51:37 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd68826asm220079295e9.0.2026.02.26.03.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 03:51:35 -0800 (PST)
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
X-Inumbo-ID: 813fca0c-1309-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772106696; x=1772711496; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPVdYf1isxzjgFuoXm9FNs+0/fH+qzHDGQJ001Hb8No=;
        b=Zwqz2yqXa7g87XHb7LLY8/1TsbvSgCQrK48X8HAJpKHfr5lYf+ZJs/KVUWJLyePnAA
         LpOG2fJ/A95W9GrmcCKQkiMTwO/qSKtEnwKoSi96lTko7P9QrMxRS6YrsqRwiBBj2v40
         HDLqFUWCoigVwwF7JjLMm683CPBIUkzrZE4SRNrcYbw2vK6VTA1+CubZ9JMTeoY2OGwk
         dErOTRMs+6LHU7nj8cTzB22d20u7RhOUbiEN+S5enl1SLwDX/P/Y/nEA7QLyH0rZAW8k
         yRdijRhj5lnX3F8V0dCv3zEAMFDdNX4TfCZaeBRvnpr8RbrPgpVff1hIkMhmaF/eWrlW
         iVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772106696; x=1772711496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YPVdYf1isxzjgFuoXm9FNs+0/fH+qzHDGQJ001Hb8No=;
        b=oRZB7/4RVSpSS3y55JFJGr2RN92AtphrrMMH4MVTpbyjv9vu2sIBn3kZF6vOkHzdJd
         rZrVoaNDwsyfU7dO0Ac8QUQo5l6hnYdvc0plTIaQBIhvZpOgVt+oHkRbioDyypaG2Xkk
         eFW4lbilUC2EymiNPITzjym6BVKY8nrJNIJ9W4Poz6Nu56v+8h+goYpiReTaSXkuYR01
         d+KRXBcbWHjpQwUomOf22kb6KJcfD8O+NXdFYZuU7Ad1p9dqU8+ig5nvXidps1IqKnSI
         I2ExZauBhTHOD9rJhXNR4vnvrgSu2WL+XnjgU2rEaUTqf12+IvdbyV9YrkJ0sIIkYXSl
         o1VQ==
X-Gm-Message-State: AOJu0YzCHaisymKpA6vSjEck5XlEl9MfBQ3FUqH5KUqcKl0BV8sMDUtl
	QncPt01mI+VAwTt8Zzo84bHgvpwJEaEcC5Y6iuWqwhk8CPn+VwpIp4m8+YJzQg==
X-Gm-Gg: ATEYQzxsG4xVgImrFiXsxTE2y0SUqpKKCuYNfRC4HSW7ki+N9Qq8Sv3tocGDPYO4hHF
	smDvGJYJlfnXDiQkw3vBnDx7Kso/+pZu2RNia6eGCnDjE+2K9ROGbms+K3zyqCmi8E2h9uWqiLn
	RJmKrcpNaXR7lqPeLBFHdTD6wQ0epY4M6sIKVib0tuRjqlm3hNS0JGOwtR9J+Ooj1smEcOUQDSI
	bDKrfPkh+pLitoHSSPDtOEgWGGk1dmTDbprEAy+8HwkD7WPO61VUkkKu8P/YVqhu1lOunCyRaO2
	PclA26tAPhNpisrrBx9K3xQimHF+Zz2u9gPGWz3x15R1/rkNKPcbvf5GiINbCkQIlUSLq1QHoo2
	Lg9qLrWNa2jAdKbMWjWkAZr4RKwfAKPz9RTHC7v9s6OwXzlC/sXJht4bqXU2xkSvEgBr9uXYU+V
	48UUp1X+kEdgmVudnBabITmmUM8NJ2JNokPgYOmOL7L0JWCLU2XXOLPN/AsZyyJ6pSag==
X-Received: by 2002:a05:600c:a009:b0:483:b505:9db4 with SMTP id 5b1f17b1804b1-483c3df45e6mr36293535e9.31.1772106696251;
        Thu, 26 Feb 2026 03:51:36 -0800 (PST)
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
Subject: [PATCH v6 09/14] xen/riscv: implement SBI legacy SET_TIMER support for guests
Date: Thu, 26 Feb 2026 12:51:09 +0100
Message-ID: <3ca9368fac1294d5e7f3b64bd1ffae281f880ccc.1772016457.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772016457.git.oleksii.kurochko@gmail.com>
References: <cover.1772016457.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add handling of the SBI_EXT_0_1_SET_TIMER function ID to the legacy
extension ecall handler. The handler now programs the vCPU’s virtual
timer via vtimer_set_timer() and returns SBI_SUCCESS.

This enables guests using the legacy SBI timer interface to schedule
timer events correctly.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v3-v6:
 - Nothing changed. Only rebase.
---
Changes in v2:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
 xen/arch/riscv/vsbi/legacy-extension.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/riscv/vsbi/legacy-extension.c b/xen/arch/riscv/vsbi/legacy-extension.c
index 2e8df191c295..090c23440cea 100644
--- a/xen/arch/riscv/vsbi/legacy-extension.c
+++ b/xen/arch/riscv/vsbi/legacy-extension.c
@@ -7,6 +7,7 @@
 
 #include <asm/processor.h>
 #include <asm/vsbi.h>
+#include <asm/vtimer.h>
 
 static void vsbi_print_char(char c)
 {
@@ -44,6 +45,11 @@ static int vsbi_legacy_ecall_handler(unsigned long eid, unsigned long fid,
         ret = SBI_ERR_NOT_SUPPORTED;
         break;
 
+    case SBI_EXT_0_1_SET_TIMER:
+        vtimer_set_timer(&current->arch.vtimer, regs->a0);
+        regs->a0 = SBI_SUCCESS;
+        break;
+
     default:
         /*
          * TODO: domain_crash() is acceptable here while things are still under
-- 
2.53.0


