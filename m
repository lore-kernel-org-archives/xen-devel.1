Return-Path: <SRS0=1i6W=L5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93795C07E99
	for <xen-devel@archiver.kernel.org>; Mon,  5 Jul 2021 17:49:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F5F961960
	for <xen-devel@archiver.kernel.org>; Mon,  5 Jul 2021 17:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F5F961960
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.150576.278391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Sig-00072D-Fv; Mon, 05 Jul 2021 17:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150576.278391; Mon, 05 Jul 2021 17:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Sig-000726-9u; Mon, 05 Jul 2021 17:49:22 +0000
Received: by outflank-mailman (input) for mailman id 150576;
 Mon, 05 Jul 2021 17:49:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SjzX=L5=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1m0Sif-00071Z-0V
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 17:49:21 +0000
Received: from mail-lj1-x230.google.com (unknown [2a00:1450:4864:20::230])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43850cdf-149a-4dac-8f2a-a30ff813d72f;
 Mon, 05 Jul 2021 17:49:20 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id e3so17148284ljo.6
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jul 2021 10:49:20 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id q187sm1432127ljb.15.2021.07.05.10.49.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Jul 2021 10:49:18 -0700 (PDT)
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
X-Inumbo-ID: 43850cdf-149a-4dac-8f2a-a30ff813d72f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Dtbwv4IFVzRj2RmogpDQ8g32JCoeVAmzIyswirsKuGs=;
        b=aoeEXTmV1vPJGRglhLbAZ81FKPuvszD6xxO5nTj3z3srFOrM6b11/gD4xM4Z+HfJdf
         +Nf/3mRfp/PqujOlv5q+6zezT2y0sPEdH/oAsYrNDXBB27RYCgi16mtn+101dGeUyeoT
         ViHuGZvhy8Isc1xZbC7Xnevdzf1KyYnVBW/zVpmj+LnLLRSM05VyT99eh70cPZ0rSDJt
         y9gJOAh5QJ4YReE9B8EP4BefZFJon7WLq/Kw/6glHGCB2lt3bHQy4XxCxBdFiNMsuq7N
         BoP9YR/QAy9hoHaA0FCuODmPZ6Qqc1frGlSvc/xsCdjoagBf0ZoJnRrA7vxfdxq8/n6w
         NHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Dtbwv4IFVzRj2RmogpDQ8g32JCoeVAmzIyswirsKuGs=;
        b=n7G6XWq4hWJyzwGlztT0veBscBGaVOwkpMsUMvvR6q/43VzimF2+k7CNlPvm7QuQpW
         AKzkk6DraL4DaR4o9dkycT/GtVXwJB4bgf/C1UUhXoUKH7ez0kS0epYKeX8NW9Dw6Ysg
         P6Vkax9TTEqg7M4Mk/bhrzvv13drvWo7Z+//9VLokY+nVGFqFqCgeKe4KUsUBrfiAuBQ
         QCsTEkrenXKxJjMNGdKNyNobg875j9Vj4J/faTAzsnbmnQZQ/98RrqjWeT/SHF49pl+v
         zfNh5/akXPjBBVcwrUrOGJy6ipJq+4tV+fcCurzHkcLrCNgrMm+Kk5cSrhVqJkazsYFZ
         TjaA==
X-Gm-Message-State: AOAM5329fD97yhf8ztw80m0/OrVes5N6McPayY3uq3j8ylpJ44x8blda
	pEWKLqsig3cMxM/cGOMoaMgHRfpre1A=
X-Google-Smtp-Source: ABdhPJw+aNscKEDHeGH1RL0B1HHw7z7Pe9e3rZRCahq51FxfHdFLGOrsK9hepDqgV6IY+82wP5hIQA==
X-Received: by 2002:a2e:a261:: with SMTP id k1mr11860601ljm.452.1625507359018;
        Mon, 05 Jul 2021 10:49:19 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH V2] xen/arm: bootfdt: Always sort memory banks
Date: Mon,  5 Jul 2021 20:48:51 +0300
Message-Id: <1625507331-17934-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

At the moment, Xen on Arm64 expects the memory banks to be ordered.
Unfortunately, there may be a case when updated by firmware
device tree contains unordered banks. This means Xen will panic
when setting xenheap mappings for the subsequent bank with start
address being less than xenheap_mfn_start (start address of
the first bank).

As there is no clear requirement regarding ordering in the device
tree, update code to be able to deal with by sorting memory
banks. There is only one heap region on Arm32, so the sorting
is fine to be done in the common code.

Suggested-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

---
   V2:
   - add Stefano's R-b
   - clarify patch description
   - clarify comment in code
   - drop "if (bootinfo.mem.nr_banks > 1)" check
---
 xen/arch/arm/bootfdt.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index dcff512..476e32e 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -13,6 +13,7 @@
 #include <xen/init.h>
 #include <xen/device_tree.h>
 #include <xen/libfdt/libfdt.h>
+#include <xen/sort.h>
 #include <xsm/xsm.h>
 #include <asm/setup.h>
 
@@ -395,6 +396,21 @@ static void __init early_print_info(void)
     printk("\n");
 }
 
+/* This function assumes that memory regions are not overlapped */
+static int __init cmp_memory_node(const void *key, const void *elem)
+{
+    const struct membank *handler0 = key;
+    const struct membank *handler1 = elem;
+
+    if ( handler0->start < handler1->start )
+        return -1;
+
+    if ( handler0->start >= (handler1->start + handler1->size) )
+        return 1;
+
+    return 0;
+}
+
 /**
  * boot_fdt_info - initialize bootinfo from a DTB
  * @fdt: flattened device tree binary
@@ -412,6 +428,15 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
     add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
 
     device_tree_for_each_node((void *)fdt, 0, early_scan_node, NULL);
+
+    /*
+     * On Arm64 setup_xenheap_mappings() expects to be called with the lowest
+     * bank in memory first. There is no requirement that the DT will provide
+     * the banks sorted in ascending order. So sort them through.
+     */
+    sort(bootinfo.mem.bank, bootinfo.mem.nr_banks, sizeof(struct membank),
+         cmp_memory_node, NULL);
+
     early_print_info();
 
     return fdt_totalsize(fdt);
-- 
2.7.4


