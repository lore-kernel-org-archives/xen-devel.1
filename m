Return-Path: <SRS0=xPWR=G4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE84C43381
	for <xen-devel@archiver.kernel.org>; Mon, 25 Jan 2021 19:20:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 218B821D94
	for <xen-devel@archiver.kernel.org>; Mon, 25 Jan 2021 19:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 218B821D94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.74352.133671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47P7-0002AO-BY; Mon, 25 Jan 2021 19:20:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74352.133671; Mon, 25 Jan 2021 19:20:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47P6-00029a-Ny; Mon, 25 Jan 2021 19:20:00 +0000
Received: by outflank-mailman (input) for mailman id 74352;
 Mon, 25 Jan 2021 19:19:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DTVL=G4=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l47Fu-0008N7-IY
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 19:10:30 +0000
Received: from mail-wm1-x32f.google.com (unknown [2a00:1450:4864:20::32f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4dfaaa4d-5dbd-425e-9d2c-1919a684d858;
 Mon, 25 Jan 2021 19:09:14 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id 190so405291wmz.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Jan 2021 11:09:14 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id k6sm12991031wro.27.2021.01.25.11.09.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 11:09:12 -0800 (PST)
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
X-Inumbo-ID: 4dfaaa4d-5dbd-425e-9d2c-1919a684d858
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pxgov1xTpd8KSnySmM4D4uZTYyiz6I2VdpWg/8wV51k=;
        b=W03jV8YEA/hR0F4fHiOoCDKFawl/qg34vNIqq+NGhzipFTuuFdx7wcv+lRy7ksGeMu
         Nik6eCRjOZb22kpissSQ90IGVhrd/qb7KFFdjq+QrHdq1sogZerWbxPhP1t1bJYAF+/k
         iGR6DdduTW4uCzmeJgVzI3OTQkKh/K3A1Abz2oG34khU57tp1qNdI6D2nrZVTzpgy5tS
         fXh9Cwh6mq2F+RS8W1DGiQKDinVd9LPyF+VhCb/1g+RKzXt7zxIBqfpLglHFSXhPqnrr
         Df08V2grxXpR/MCI5O+yTIvPBCYt1EE4jdfw3q8NhEvmMAeYkIp67nYLsdywH4jOPYxb
         HlYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pxgov1xTpd8KSnySmM4D4uZTYyiz6I2VdpWg/8wV51k=;
        b=SFsWKbWqVf7bYygPXMNxhGU4JUdH086HXKey42jDjuVhMDDjuklArMzemLt5eMEe8t
         SYiESu9fsBX0lGwZdd9BJaDIKrkoplGeO9dMVLVkaXLgr6NVfISFxitAeaa6P9eVl71r
         Ultah475N2+Fcdpn/JvztDvBRsaDToxHg4a/WxurfEc0GQ+1mwjHgNaghOsprPhwtDQG
         55XhD6dm+8QNz0mRLMZ/7IXEDBzcWy24LbQt+y+7jiQujjvzivSa3jsFZLPu6QD6PBuM
         zoMtCLmE8V81KR0q3y3ymj4eDkULAADmLdWOkXMAFy9ZQR6LPKvzZaoth4f0x5H+1sHL
         A1iA==
X-Gm-Message-State: AOAM532jHuu9HYQ/9jAyraHKVseYh3oZdFHSGp8oZJ+0J5AhIj2Ks4Q3
	FE2lqr3TGvGKq4WymUiBE3VPsx4jWuOs3Q==
X-Google-Smtp-Source: ABdhPJwbvxnS2Vdxbms+fUo2bzss4WZ733bXU/Z9kbBbeM5k0GlYC+GRHiZ0+HOtAM9BrdGzPkzNEw==
X-Received: by 2002:a1c:e912:: with SMTP id q18mr1462529wmc.162.1611601753061;
        Mon, 25 Jan 2021 11:09:13 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V5 19/22] xen/arm: io: Abstract sign-extension
Date: Mon, 25 Jan 2021 21:08:26 +0200
Message-Id: <1611601709-28361-20-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

In order to avoid code duplication (both handle_read() and
handle_ioserv() contain the same code for the sign-extension)
put this code to a common helper to be used for both.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien.grall@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
[On Arm only]
Tested-by: Wei Chen <Wei.Chen@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes V1 -> V2:
   - new patch

Changes V2 -> V3:
   - no changes

Changes V3 -> V4:
   - no changes here, but in new patch:
     "xen/arm: io: Harden sign extension check"

Changes V4 -> V5:
   - add Stefano-s R-b
---
---
 xen/arch/arm/io.c           | 18 ++----------------
 xen/arch/arm/ioreq.c        | 17 +----------------
 xen/include/asm-arm/traps.h | 24 ++++++++++++++++++++++++
 3 files changed, 27 insertions(+), 32 deletions(-)

diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 7ac0303..729287e 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -25,6 +25,7 @@
 #include <asm/current.h>
 #include <asm/ioreq.h>
 #include <asm/mmio.h>
+#include <asm/traps.h>
 
 #include "decode.h"
 
@@ -40,26 +41,11 @@ static enum io_state handle_read(const struct mmio_handler *handler,
      * setting r).
      */
     register_t r = 0;
-    uint8_t size = (1 << dabt.size) * 8;
 
     if ( !handler->ops->read(v, info, &r, handler->priv) )
         return IO_ABORT;
 
-    /*
-     * Sign extend if required.
-     * Note that we expect the read handler to have zeroed the bits
-     * outside the requested access size.
-     */
-    if ( dabt.sign && (r & (1UL << (size - 1))) )
-    {
-        /*
-         * We are relying on register_t using the same as
-         * an unsigned long in order to keep the 32-bit assembly
-         * code smaller.
-         */
-        BUILD_BUG_ON(sizeof(register_t) != sizeof(unsigned long));
-        r |= (~0UL) << size;
-    }
+    r = sign_extend(dabt, r);
 
     set_user_reg(regs, dabt.reg, r);
 
diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
index ffeeb0b..c7ee1a7 100644
--- a/xen/arch/arm/ioreq.c
+++ b/xen/arch/arm/ioreq.c
@@ -28,7 +28,6 @@ enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu *v)
     const union hsr hsr = { .bits = regs->hsr };
     const struct hsr_dabt dabt = hsr.dabt;
     /* Code is similar to handle_read */
-    uint8_t size = (1 << dabt.size) * 8;
     register_t r = v->io.req.data;
 
     /* We are done with the IO */
@@ -37,21 +36,7 @@ enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu *v)
     if ( dabt.write )
         return IO_HANDLED;
 
-    /*
-     * Sign extend if required.
-     * Note that we expect the read handler to have zeroed the bits
-     * outside the requested access size.
-     */
-    if ( dabt.sign && (r & (1UL << (size - 1))) )
-    {
-        /*
-         * We are relying on register_t using the same as
-         * an unsigned long in order to keep the 32-bit assembly
-         * code smaller.
-         */
-        BUILD_BUG_ON(sizeof(register_t) != sizeof(unsigned long));
-        r |= (~0UL) << size;
-    }
+    r = sign_extend(dabt, r);
 
     set_user_reg(regs, dabt.reg, r);
 
diff --git a/xen/include/asm-arm/traps.h b/xen/include/asm-arm/traps.h
index c4a3d0f..c6b3cc7 100644
--- a/xen/include/asm-arm/traps.h
+++ b/xen/include/asm-arm/traps.h
@@ -84,6 +84,30 @@ static inline bool VABORT_GEN_BY_GUEST(const struct cpu_user_regs *regs)
         (unsigned long)abort_guest_exit_end == regs->pc;
 }
 
+/* Check whether the sign extension is required and perform it */
+static inline register_t sign_extend(const struct hsr_dabt dabt, register_t r)
+{
+    uint8_t size = (1 << dabt.size) * 8;
+
+    /*
+     * Sign extend if required.
+     * Note that we expect the read handler to have zeroed the bits
+     * outside the requested access size.
+     */
+    if ( dabt.sign && (r & (1UL << (size - 1))) )
+    {
+        /*
+         * We are relying on register_t using the same as
+         * an unsigned long in order to keep the 32-bit assembly
+         * code smaller.
+         */
+        BUILD_BUG_ON(sizeof(register_t) != sizeof(unsigned long));
+        r |= (~0UL) << size;
+    }
+
+    return r;
+}
+
 #endif /* __ASM_ARM_TRAPS__ */
 /*
  * Local variables:
-- 
2.7.4


