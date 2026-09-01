Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F26C624D3
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2026 15:50:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404818.1638482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1Qkw-0002uq-3F; Tue, 01 Sep 2026 15:50:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404818.1638482; Tue, 01 Sep 2026 15:50:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1Qkv-0002uj-VP; Tue, 01 Sep 2026 15:50:37 +0000
Received: by outflank-mailman (input) for mailman id 1404818;
 Tue, 01 Sep 2026 15:50:36 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x1Qku-0002ud-CL
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 15:50:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1Qkt-006mSe-56
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 17:50:35 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a96f448-bab6-0a2a0a5309dd-0a2a450cd70a-8
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 17:50:35 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a96f44a-f479-0a2a450c0019-d155802eadaa-3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 17:50:35 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-49b0dd3c9a0so34536055e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 08:50:35 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce10148sm73933495e9.5.2026.09.01.08.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2026 08:50:33 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788277834; x=1788882634; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2jLmcDK1E+Gg/mpM2jH3Fh2/6vWMsyX9FlhdI9FX5Qc=;
        b=mWeZJkweTGFMldSkLVus5fr0ar7wPHa1FkX2Cs8d3/G1I+wAIB4nzYqqrDCdGGugPj
         3KR5UeAqRi9Tz1JQo2aYZKrZu+++U4k5lbCk4h4ZlipKBaK5KqHvMx4AXH6txbmHKC/e
         O1RUynVDHe0R2EmVaRcJR+SHgBNemb/t6+8Z5kY9OeP4GARfXH9FEv5sM6DoAQUevppK
         Y9Mbc9npg5F36g+FrlCyjLAVkbXzCWJuEk9m080akxzwWUYDLoPMhmzGlWjvCiUgZ+fE
         nUDOJRmQNYxJ1EA/Pf1XR/E7ulbPFk6eDhDjjfTM2SXe2mYS4oTqtTI6ZwfDHQ7IURIz
         OxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277834; x=1788882634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2jLmcDK1E+Gg/mpM2jH3Fh2/6vWMsyX9FlhdI9FX5Qc=;
        b=FGiSsNfgD6+J+AmGGj3146SN08pvbBZmDNMtUFjMUhPZJkj69pXFa7l5kHRi4ktkSb
         GguQV0FMQKP/Flh2yp0Mj351eHQf2pOT1LkClcw6oMJEqlJ+VS4gVp0jRApNkyhXfjFD
         8d0Gutc95Baxzy0i94DgbXWvOviuKJDnQE0QAQH8bxKJP3ZkvINTX+c9Rankk/bt7/Ss
         Z4X4m7SEs0rWEtn/q+VDuFdR8dbBw2IM6f/DpKDXsHBUoNV2yPL82jc/8uda6wCV+zfN
         zKv7RkJOjqFZ0o5iV0zyJ5NEw8Ezj29j25naoNFFpkakuke8VB2g/6bSP+UcHWwfzjrh
         Br+A==
X-Gm-Message-State: AFuF++mZkfU1GGEkVEAnXqT4CJU/phE6qqy56NCU+37FMP+JEHK2lwWM
	cjdfmCmN1EHarkpGwF6IFKXNANMWUDaLwivP+gLjtyJGicfHT+AIdgFMz5NYEw==
X-Gm-Gg: AR+sD12+l/eSKBmtT7CeAnfIM9TuL1Y6dU6VrgYJoiuAsGdcRrIMKHxq8ON6czHv/H5
	z/kJ/CF5RHufcg84pRsZCaaaZ4hSm319L7PeN6Lk6Iw8jW3uVk1ndwqpcHzv6l48idFDHOLeCl6
	1LMkFlR9gdnNqy/k3lSnoHTGnhS08JTfFV85syDAKujDc7HERaCnOwzsPg99NzmXfB7gSI4ncMw
	neoRoLw6KfyNQVgxi58VZtsc6r2RFloHE9Vh1cAuPEKrFx45x1+4G2o40XMjl+oM1zTXBUNLXVX
	O/AzJj8xJ6h4IW52j+IXCxb5G88BbaUZoIxh+cYgXGFYSPzm9L4k2+P5UCiuO5YC51czUE5rHmc
	8TvH5a55D75UULwdti4reh7RtzZppQadcIJb7fYerHoRX1iQWkNNZXqvSaEc9uPjuN/b8JWwBb2
	KZiQGpGAhGp3BQRlU74BvlCGRreW/UurNG0Wbqk1FlA96OkuocrvEbe5jHZeaRbzmMn2qYiI+uh
	RWDgrk1kqLwRAdfMG0d43cVgQrpuitRtwwU200wPKk=
X-Received: by 2002:a05:600c:1d99:b0:49c:cee0:e7c0 with SMTP id 5b1f17b1804b1-49cdc560282mr201403165e9.16.1788277834225;
        Tue, 01 Sep 2026 08:50:34 -0700 (PDT)
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
Subject: [PATCH] xen/riscv: fix out-of-range indexing of the IMSIC per-CPU MSI array
Date: Tue,  1 Sep 2026 17:50:23 +0200
Message-ID: <20260901155023.116381-1-oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1788277835-770D9A5B-41ACEFD9/10/73395122804
X-purgate-type: spam
X-purgate-size: 3032

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

Size the array by num_possible_cpus(), which is what it is indexed by,
and move the range check ahead of the first msi[] access.

Fixes: c9bd8b322ecb ("xen/riscv: imsic_init() implementation")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/imsic.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index f7b70a8da09e..a32264518676 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -326,6 +326,8 @@ int __init imsic_init(const struct dt_device_node *node)
     unsigned int nr_parent_irqs, index, nr_handlers = 0;
     paddr_t base_addr;
     unsigned int nr_mmios;
+    /* imsic_cfg.msi[] is indexed by Xen CPU id, so size it accordingly. */
+    unsigned int nr_msi = num_possible_cpus();
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


