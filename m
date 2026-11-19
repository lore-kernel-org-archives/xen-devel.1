Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F179606A325
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 12:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=k5AdgbmS
Received: from list by lists.xenproject.org with outflank-mailman.1496240.1694891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU0oQ-0001pt-0d; Thu, 19 Nov 2026 12:00:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496240.1694891; Thu, 19 Nov 2026 12:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU0oP-0001pm-TK; Thu, 19 Nov 2026 12:00:21 +0000
Received: by outflank-mailman (input) for mailman id 1496240;
 Thu, 19 Nov 2026 12:00:21 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hfranco@baylibre.com>) id 1xU0oO-0001pM-I1
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 12:00:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU0oN-00BaAB-RK
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 13:00:19 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <hfranco@baylibre.com>)
 id 6afee4cb-bab6-0a2a0a5309dd-0a2a4503eb7e-44
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 13:00:19 +0100
Received: from [74.125.82.171] (helo=mail-dy1-f171.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <hfranco@baylibre.com>)
 id 6afee4d0-fae8-0a2a45030019-4a7d52abe4fd-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 13:00:18 +0100
Received: by mail-dy1-f171.google.com with SMTP id
 5a478bee46e88-3282db206d3so5726390eec.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 04:00:17 -0800 (PST)
Received: from [127.0.1.1] ([2804:14c:4c5:8bf0:364f:2eda:8fb7:113e])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-382a6800338sm17511239eec.11.2026.11.19.04.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 04:00:15 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=baylibre.com header.i="@baylibre.com" header.h="Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795089616; x=1795694416; darn=lists.xenproject.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e3zsQyKdghvUgzwo767y1pXHAU/pumMMP2gnVy5W9Sw=;
        b=k5AdgbmSd5whGxD5fIYQjhZU5QEwU8f9KgqXOxMNaS8rEhn5ZMjbuXt+LFZSscpYFn
         rNyRrN+PhKdeg1ab1Une6D52b8DIuP1dc5pHsKLPTasI94+MWMhR3RsJNu8aWRP+qfFt
         l1SH2wCnyXZvpclKjZtP2EXrdyVrYiojRfcoh3dnSCNhxdRlTkqJvSow0GVDCcCN1Njn
         uCCr3NoYPA+0wAcDaVtmCtzsJ+T913jXOw1yz3VrdEw8VcTIRx+wygLs7o8qWzCYJkmC
         ghiD1cAxin+aDYjea+OgqgMa5WhvuIVqtZUWspkXXhx/jQjgeaYvQX5jKELGBB9V8/bc
         pwSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795089616; x=1795694416;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e3zsQyKdghvUgzwo767y1pXHAU/pumMMP2gnVy5W9Sw=;
        b=fmlMhsBr0sRYdZBq1xxnEmcwpzmFpdBBye9iHmPEPfD+bsUuo3t9OJu44SjefHNBwG
         dKkxmSR/DIo9sMR/QTxadXzGHkE86yBmzxLND1QjShGdLFqclJ4i9XTfNp56APG1Tu5f
         ogbADY1USP5EPO45zYuOM2R5vQbVZBN/FBDeM8Rt1mRyXiNIG6cT1eppKJpY7ILemiMc
         1NdiNIb0jCoEgK5auE8Pe3PPv+XOuwmpOTIPK9rrwX73jtD7Byz8F8blRw3c4ujbwsvK
         Xojigk3nddGBpZcIhGjB405+RuIOjcR9i4bPwMTJkV4ytYVZ2K06AMwNcubKnKMhZ3Fw
         Vnbg==
X-Gm-Message-State: APuU4Z9WF2buFAkQ0OdyIpqR3dksJOlhqjkWSRL0+G6EQNmIJKp/CSvN
	FSICGQX8DmcAAvWlevzazypiD7ykF+rIy1QnN18Y5BlZuqgR+ZuX9yl9jrsyy8fbSmM=
X-Gm-Gg: AZFdTZdqmCYrt2Seqk6fk94FVqQEm1I69aFMQAeenNXcNKkVqHga8lNjhlLq7vGtNTc
	2zOXOzwd00zjLhbj5e9a3axI1xDmcfJky8tPqAGVHeuyaCJvKd2XuTBSLLZ99hPX+M4Ulad6FOV
	NURF6tWZY3v93HX5Nxm2d1ULYTvSUOglv+eBEQ/pa3cKSftoGHAzZ6oqoElL0BlaTaKAM6yCXY5
	6B6r+R4xuWF+rJeuoi57foT9yfGXPG3VidKTOjJdGDY32UxUMLoCOXrDYzlDXRCPemq7uLLE3nL
	Ng/6FfnimgH7a+C6d9E+WtSl8FAMXqh8mh0hYkujV2GMlBGK3vLeBBW2FvRS5N7glmDwBQkAt/M
	nUlVv76Ce1xDsKvj+fJLFogrlZV5YrIzBn0e65m+ypf99MeSFq7lATY0ByMPXiDU4ZyRldGFJ30
	J9JrJXTUaKgDy3obso/PxG+eyCJwjh3r7anRYxB+0eyNihxdrVSRY7s4JIBFtH6DK4K4hDUaJHN
	bdpqdcJWH1rKT1ecaz9zZpWUc/D6Yd7Ct71C6aNFM/W57UJFVD1krrzJmn0y9QwQVzkmKQfOrNc
	P8c5x833FUdV8lbJ+U7ACQPY20M8ioaKSnRlzffi55U7LqSwl11TsenvE/4Qb/C4cSLWEwfHp7f
	1yoeoKyyoIVM=
X-Received: by 2002:a05:7300:b196:b0:377:678:2309 with SMTP id 5a478bee46e88-3827fe76e1bmr5269863eec.15.1795089615894;
        Thu, 19 Nov 2026 04:00:15 -0800 (PST)
From: Hiago De Franco <hfranco@baylibre.com>
Date: Thu, 19 Nov 2026 08:59:47 -0300
Subject: [PATCH] xen/riscv: vsbi: add SBI TIME extension
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-riscv-vsbi-time-ext-v1-1-1d5813a883e6@baylibre.com>
X-B4-Tracking: v=1; b=H4sIALLk/moC/x3MTQqAIBBA4avIrBtQox+6SrSwnGoWWTghgXT3p
 OW3eC+DUGQSGFSGSImFz1BgKgXL7sJGyL4YrLatMabDyLIkTDIz3nwQ0nOj1c7Xdds3s26glFe
 klZ//Ok7v+wGHSQfkZQAAAA==
X-Change-ID: 20261117-riscv-vsbi-time-ext-20ad33685b05
To: xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 Ronaldo Nunez <rnunez@baylibre.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: b4 0.14.2
X-purgate-ID: tlsNG-33051d/1795089618-760FE4E9-A594F368/0/0
X-purgate-type: clean
X-purgate-size: 2748
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Xen reports SBI v0.2 but does not implement the TIME extension, so the
guest probe fails and Linux falls back to the legacy SBI v0.1 SET_TIMER
call.

The fallback is deprecated and only available when the guest is built
with CONFIG_RISCV_SBI_V01, so a guest built without it never arms the
timer.

Implement the TIME extension and handle SET_TIMER() by programming the
vCPU virtual timer through vtimer_set_timer(). With the extension
registered, SBI_EXT_BASE_PROBE_EXT reports TIME as available and Linux
selects the v0.2 path.

Assisted-by: DeepSeek:v4.1-flash
Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
Hello,

This is a prerequisite for removing the legacy v0.1 from the guest
configuration.

Tested by booting dom0less Linux guest, which prints "SBI TIME
extension detected". To test this, I used the fork from Oleksii [1]
(branch riscv-next-upstreaming) to boot linux guest with dom0less.

Since this is an isolated patch and applies to the xen master branch, I
decided to send the patch. Please let me know if this is not correct.

[1] https://gitlab.com/xen-project/people/olkur/xen
---
 xen/arch/riscv/vsbi/Makefile         |  1 +
 xen/arch/riscv/vsbi/time-extension.c | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/xen/arch/riscv/vsbi/Makefile b/xen/arch/riscv/vsbi/Makefile
index 8ce470f787c5b04f985dfb76d076025b49ddef19..31ff8e86d1a20500b9321c826c1e48c0f84cde84 100644
--- a/xen/arch/riscv/vsbi/Makefile
+++ b/xen/arch/riscv/vsbi/Makefile
@@ -1,3 +1,4 @@
 obj-y += base-extension.o
 obj-y += core.o
 obj-y += legacy-extension.o
+obj-y += time-extension.o
diff --git a/xen/arch/riscv/vsbi/time-extension.c b/xen/arch/riscv/vsbi/time-extension.c
new file mode 100644
index 0000000000000000000000000000000000000000..6bf23f5708d45d2f671bb15f423f209fb250525a
--- /dev/null
+++ b/xen/arch/riscv/vsbi/time-extension.c
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/lib.h>
+#include <xen/sched.h>
+
+#include <asm/current.h>
+#include <asm/processor.h>
+#include <asm/sbi.h>
+#include <asm/vsbi.h>
+#include <asm/vtimer.h>
+
+static int vsbi_time_ecall_handler(unsigned long eid, unsigned long fid,
+                                   struct cpu_user_regs *regs)
+{
+    ASSERT(eid == SBI_EXT_TIME);
+
+    if ( fid != SBI_EXT_TIME_SET_TIMER )
+        return SBI_ERR_NOT_SUPPORTED;
+
+    vtimer_set_timer(&current->arch.vtimer, regs->a0);
+
+    return SBI_SUCCESS;
+}
+
+VSBI_EXT(time, SBI_EXT_TIME, SBI_EXT_TIME, vsbi_time_ecall_handler);

---
base-commit: ab77da87e9b38022341eb6a54593e681485d203a
change-id: 20261117-riscv-vsbi-time-ext-20ad33685b05

Best regards,
-- 
Hiago


