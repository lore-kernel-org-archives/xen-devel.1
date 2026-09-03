Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B413DC624D6
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 15:05:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407442.1640533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x290O-0007ic-L1; Thu, 03 Sep 2026 15:05:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407442.1640533; Thu, 03 Sep 2026 15:05:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x290O-0007iV-IT; Thu, 03 Sep 2026 15:05:32 +0000
Received: by outflank-mailman (input) for mailman id 1407442;
 Thu, 03 Sep 2026 15:05:31 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x290N-0007iH-SO
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 15:05:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x290M-00FSzv-NS
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 17:05:30 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a998cb6-e002-0a2a0a5209dd-0a2a4508b616-12
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 17:05:30 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a998cba-f659-0a2a45080019-d1558034d047-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 17:05:30 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-49b392ccaacso37083575e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 08:05:30 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee5f912esm78154695e9.4.2026.09.03.08.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 08:05:28 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788447930; x=1789052730; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mANjaLxbTBRxPJI3nJCkis86IS9gaBZ1y1v/6VoNZTY=;
        b=rOoQbHR2ao60KApSDeajnTLQ2ijCf6xgKLNMANbLZh5T2Zghc4Xi7StPbe3qdLkLVI
         GbPxh07BRcW86MccPAWD3ravBcAPMjLBvGtkQJmzGioQGyGtPycah4xlKJMEnFlvswSu
         X1M7A+g2dC1NCpIEL0UNTqSpqD2ZnVDuweREKwrU2tElBqSTNXlsE2D9y+MtSZ8ZImFv
         llt0B1N980fnrJ1x+uRgB7Ct5iAc9Nrsgv4r0HFhjaJUhWTuFQwW/05DIQYfx0TRERw3
         ilQE5FWqV0kJxU78chbado5qpkOP6TOdFkDKis1EfOtftGtewicWkeY7OmGa6IV/EddJ
         nwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788447930; x=1789052730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mANjaLxbTBRxPJI3nJCkis86IS9gaBZ1y1v/6VoNZTY=;
        b=muL6pCuXJ5UVJD21D6CQ1K74NuC5GmD6+KyN5AWjhULLmpy4X4mqjjp2xdefEEI0Mo
         +3jePCvM1R/jAL+/NTaosoE0hCZy+lycJY2Y3zLRVv4HW2vC9/8PMPMcRHdPssPLJcav
         B8+WBUz1Fq6YwfMNQkYcYmnWxTDlMjH50sR/QEgjj2AOB/QumTb2lmKILJB1ZkdY9C33
         Jf1+dK9TKHoDUWNe13Yv/KqaNzNyQxeEMIV47qKj3bzgA0yqnKTWUmWvC65Y/HzcYJ17
         pwpyMmhFCS+cijWP/6unTI/virSyqMXwkduyByIV6SUSCcaNNt1HJ68Ex/Z0VPX+GHg4
         PbLw==
X-Gm-Message-State: AFuF++mNYeWw+/+O1vuI2gZEcFKlk3U+CKQ7+C4Oj1jhLgv8KqWmBrFX
	8NC97isk2K0/HfMoL/7Ty3y1XZWGWe1rG73UW5ZPiHM7Gsrti01yFv+Zpg/lcQ==
X-Gm-Gg: AYBFou2bKotfyXskP/Od2ANIy8S7U0mUSRxX/jOTsosrCu7dk21Dd62KYZpOg7U0GIa
	JGkdNazAKCJRJYZeiD1f440eQ8y6PpePKstO3YKyzarFZLktDVx/mBvErkA4BlJgBu/m+zADMYq
	Vm1FK0goYjH+P3a1i7o5c/stJzvLEZM1EHes0V9qSPntWJpvz9CZuQntWkf4cfuslDNOINBa1B9
	pkl9vybkojjanM8tQf4oCn0tobW9OJbbDf+wIZJrhxX/1N3gmMywsl1iTKbJi2y4q37cexpGlIx
	0eCwgc0kg0KWD6lEmIyQrzwJuJ7g4BTUOOOzUktslO8cGoEXmg0vNczW15aZchhxkgZw6mQTwxF
	v5UZvwtkO7i8lwqqIqJN8193HbMT6t0eCBwVmIj6IiXSDQcgXCsZOTKwg7LDO+cHKU/62pCRXQ8
	Ru19g1tS+MG4b+UvZ9rXuucAtfnVSY4Tbqc7+D8rzGpmZ4Abzkfqp0B61nCT4xLYxy120ziwpg6
	yrZmIeNM1JPedDsJdVxtas31fUNAguyJ9oFJ7jTALw=
X-Received: by 2002:a05:600c:1da1:b0:499:9eb8:a1d7 with SMTP id 5b1f17b1804b1-49ce5842935mr283797955e9.9.1788447929879;
        Thu, 03 Sep 2026 08:05:29 -0700 (PDT)
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
Subject: [PATCH v3] xen/riscv: fix out-of-range indexing of the IMSIC per-CPU MSI array
Date: Thu,  3 Sep 2026 17:05:21 +0200
Message-ID: <20260903150521.29804-1-oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1788447930-D614687B-F128AF34/10/73395122804
X-purgate-type: spam
X-purgate-size: 2865

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
Changes in v3:
 - Drop local variable nr_msis and use nr_cpu_ids explicitly.
---
Changes in v2:
 - Use nr_cpu_ids instead of num_possible_cpus() to not be dependent on
   if cpu_possible_map is sparsed or not.
---
---
 xen/arch/riscv/imsic.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index f7b70a8da09e..8da72c007225 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -346,7 +346,7 @@ int __init imsic_init(const struct dt_device_node *node)
         goto imsic_init_err;
     }
 
-    msi = xvzalloc_array(struct imsic_msi, nr_parent_irqs);
+    msi = xvzalloc_array(struct imsic_msi, nr_cpu_ids);
     if ( !msi )
     {
         rc = -ENOMEM;
@@ -405,7 +405,18 @@ int __init imsic_init(const struct dt_device_node *node)
             continue;
         }
 
+        /*
+         * hartid_to_cpuid() returns NR_CPUS for a hart Xen doesn't know, so
+         * the range has to be checked before msi[] is indexed at all.
+         */
         cpu = hartid_to_cpuid(hartid);
+        if ( cpu >= nr_cpu_ids )
+        {
+            printk(XENLOG_WARNING
+                   "%s: unsupported hart ID=%#lx for parent irq%u\n",
+                   node->name, hartid, i);
+            continue;
+        }
 
         /*
          * If .base_addr is not 0, it indicates that the CPU has already been
@@ -421,13 +432,6 @@ int __init imsic_init(const struct dt_device_node *node)
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


