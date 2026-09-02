Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72863C624D7
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 14:16:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405970.1639386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1llD-0006wQ-7g; Wed, 02 Sep 2026 14:16:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405970.1639386; Wed, 02 Sep 2026 14:16:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1llD-0006wJ-55; Wed, 02 Sep 2026 14:16:19 +0000
Received: by outflank-mailman (input) for mailman id 1405970;
 Wed, 02 Sep 2026 14:16:17 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x1llB-0006wD-SQ
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 14:16:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1llA-00FV6K-Ge
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 16:16:16 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a982faf-bab6-0a2a0a5309dd-0a2a4505de10-8
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 16:16:16 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a982fb0-4cb1-0a2a45050019-d155802ca4bd-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 16:16:16 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-49b0eab380eso10478345e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 07:16:16 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce5533ffbsm43550395e9.3.2026.09.02.07.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 07:16:15 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788358576; x=1788963376; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lS5Jt5Zsbat0B1Cf88rX8Gj9YZoVhCThztwHEOEzvNQ=;
        b=Q/vxnN57niTqpvw0oEzrPlAJhlVt2cpT5NBcpBwd/tbEsmM4U5tAbq4aJG3gH1KJTG
         lifaKa74A5SgwCmk5cY+L7yAEdx1a8lHcYGzVAwwix7hpw63scyejH0ay06DCTbmxGyc
         cV1p7SEH/+gSPZdZLtWWkpn4+Fj+XmrwZIQUpj31W/gQDVjvyuW1HkkiwTH9TIcPZBOQ
         idAm+jqLHTWb4S+hmwCvQXm6a+2W7+QuniPuEJ2OSWED13bj38ivn0OVJ6VrEV1Y4RJF
         /tQHySAooZC3kus+uv57/r5fPdgBRIG4+Qrw8E+YDtYvanDE7xryRL5wC4vqbrPn+sXZ
         yCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788358576; x=1788963376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lS5Jt5Zsbat0B1Cf88rX8Gj9YZoVhCThztwHEOEzvNQ=;
        b=HuRHr3Aw/pi0XD2OEZ8txeZE9DZacel6IM2L/v3sExz2+tPyliRhs7gNPkev9qo+7F
         vMhaAHnUuPps2DI7uRzCBxeYBzlP+a7shM0BlI7TYgNRY8yJH+nnPyjq9QJAj8O8Sv9m
         WSmB9+VmHqKGJGuvF1A8zWlkerm2b7yQ4JQfo3wvoZ4LWhSXTrcmBIY3PjQSxldzDYUE
         FhDKzHmkzgThhWL65yllW35vMAQi5v6gCVrv+FMCJCo0WflJ4HmYhR6hUh9VXM5Rb/hY
         S/wbH9WMANeD2jS7HeA20DzPKZi3PDlxoFvPDcnJYTA38NrwjPwIAL5Ka/wUg2T2NTq8
         m4TA==
X-Gm-Message-State: AFuF++n2DdbyvFYvGGVWHc6xDk0EKEkJ7UVrsF/bX2U/OU3PA018WMVC
	VrF4bc0PIj12yzSfScBzjYaMI5Y9Yu6zfTBtO5AmkOISmoveEc07KyKI54Ol1A==
X-Gm-Gg: AR+sD13TQoMFmIVkYcPeVzdgbe6SsjnDlhM9KBllTo7Mx61uiHAqwRWnUx3HDmj0paC
	v81VtxfQRo6HgfquqHvL8aM/GTzHZJ8MrpVrhMpuSDp223jNfDBQK3wdRaiSKGv3mS5fRkGxmsa
	vBn/7OTbRrsgvmQuJIMz4rpWobDW6MU4IaXw2sO/NUKVqaQ0cF9kk6hTQjK5bi5yugAN8fCVJIl
	qZKB0cwkMDRRkdqNfTCzlxLv8ofhoT++tQ2lRT3lsarWwKYNBulm7R77t251n5Ip+ZgIqw34vGi
	D49sjZW5oEVizv2j+L39gx3wNf2b3Le5yfgCGHhav2IYjbkWGbXi9KKB9hYxtJK7X4VaCEEDa7G
	5BLGaP6ykCINTys75C0f1HP3gnPDdwqnQMFW00g2+rTMfg7vvMVsspu8Zchrb5QHGLEaReSg708
	pswmkXvNNG7zkDDyWmk6QwSH3kB+6M1KruV4m9/YN4z+DmdwqU0187HDe3bSM9KqUkQfZG352fC
	QF2h7qfQc8OXPpXXQEVgiMdq96Il2sI
X-Received: by 2002:a05:600c:3b07:b0:49c:799a:177b with SMTP id 5b1f17b1804b1-49ce7bb7a75mr24872415e9.2.1788358575650;
        Wed, 02 Sep 2026 07:16:15 -0700 (PDT)
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
Subject: [PATCH v2] xen/riscv: fix out-of-range indexing of the IMSIC per-CPU MSI array
Date: Wed,  2 Sep 2026 16:16:07 +0200
Message-ID: <20260902141607.24390-1-oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1788358576-F5CA82A1-707DA15F/10/73395122804
X-purgate-type: spam
X-purgate-size: 3156

imsic_init() indexes msi[] by the Xen CPU id hartid_to_cpuid() returns,
but that array is allocated with one entry per parent IRQ of the IMSIC
node, and the only range check compares the index against
num_possible_cpus(). Neither matches the array, and the check comes
after the first access:

- hartid_to_cpuid() returns NR_CPUS when the hart isn't one Xen brought
  up, and msi[NR_CPUS].base_addr is read before that is noticed;
- an IMSIC node listing fewer parents than Xen has CPUs makes every
  index past nr_parent_irqs go past the end of the allocation, which the
  num_possible_cpus() check lets through.

Size the array by nr_cpu_ids, which is what it is indexed by,
and move the range check ahead of the first msi[] access.

Fixes: c9bd8b322ecb ("xen/riscv: imsic_init() implementation")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Use nr_cpu_ids instead of num_possible_cpus() to not be dependent on
   if cpu_possible_map is sparsed or not.
---
---
 xen/arch/riscv/imsic.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index f7b70a8da09e..44eb7abf76fd 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -326,6 +326,8 @@ int __init imsic_init(const struct dt_device_node *node)
     unsigned int nr_parent_irqs, index, nr_handlers = 0;
     paddr_t base_addr;
     unsigned int nr_mmios;
+    /* imsic_cfg.msi[] is indexed by Xen CPU id, so size it accordingly. */
+    unsigned int nr_msi = nr_cpu_ids;
     struct imsic_mmios *mmios;
     struct imsic_msi *msi = NULL;
 
@@ -346,7 +348,7 @@ int __init imsic_init(const struct dt_device_node *node)
         goto imsic_init_err;
     }
 
-    msi = xvzalloc_array(struct imsic_msi, nr_parent_irqs);
+    msi = xvzalloc_array(struct imsic_msi, nr_msi);
     if ( !msi )
     {
         rc = -ENOMEM;
@@ -405,7 +407,18 @@ int __init imsic_init(const struct dt_device_node *node)
             continue;
         }
 
+        /*
+         * hartid_to_cpuid() returns NR_CPUS for a hart Xen doesn't know, so
+         * the range has to be checked before msi[] is indexed at all.
+         */
         cpu = hartid_to_cpuid(hartid);
+        if ( cpu >= nr_msi )
+        {
+            printk(XENLOG_WARNING
+                   "%s: unsupported hart ID=%#lx for parent irq%u\n",
+                   node->name, hartid, i);
+            continue;
+        }
 
         /*
          * If .base_addr is not 0, it indicates that the CPU has already been
@@ -421,13 +434,6 @@ int __init imsic_init(const struct dt_device_node *node)
             continue;
         }
 
-        if ( cpu >= num_possible_cpus() )
-        {
-            printk(XENLOG_WARNING "%s: unsupported hart ID=%#lx for parent irq%u\n",
-                   node->name, hartid, i);
-            continue;
-        }
-
         /* Find MMIO location of MSI page */
         reloff = i * IMSIC_HART_SIZE(imsic_cfg.guest_index_bits);
         for ( index = 0; index < nr_mmios; index++ )
-- 
2.55.0


