Return-Path: <SRS0=htIg=C3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9324AC43463
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2020 17:11:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34A07206A2
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2020 17:11:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="o6NFjwD+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34A07206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kJJut-0000tU-Pn; Fri, 18 Sep 2020 17:11:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GPqB=C3=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kJJus-0000tP-Cc
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2020 17:11:22 +0000
X-Inumbo-ID: 4504d02e-40b6-4dec-9d6a-a4d2e795864a
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4504d02e-40b6-4dec-9d6a-a4d2e795864a;
 Fri, 18 Sep 2020 17:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
 bh=LgQLs2YLbXiHm/kwO0K4g+V1qaQJHGfPUQrNLvjoytU=; b=o6NFjwD+tobFir/6XS7UOCHR5R
 rmqFiyDmRowMw8Gbqt6EQYqz3oKaX6G9TAn714c1YAO1c0MwreRiwKHn0PdNBOSuBtAf5MDoYL/n/
 XkLpd1jdjJ5bbEtgWavGw+6w4BFO4Jm7CUDW0tbdsb+ZFPRa6wL8qRDSfB6hZ5/40qi8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kJJuq-0003pN-8Z; Fri, 18 Sep 2020 17:11:20 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kJJup-0003S0-St; Fri, 18 Sep 2020 17:11:20 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Daniel Wagner <Daniel.Wagner2@itk-engineering.de>
Subject: [PATCH] xen/arm: bootfdt: Ignore empty memory bank
Date: Fri, 18 Sep 2020 18:11:16 +0100
Message-Id: <20200918171116.29005-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

At the moment, Xen will stop processing the Device Tree if a memory
bank is empty (size == 0).

Unfortunately, some of the Device Tree (such as on Colibri imx8qxp)
may contain such a bank. This means Xen will not be able to boot
properly.

Relax the check to just ignore the banks. FWIW this also seems to be the
behavior adopted by Linux.

Reported-by: Daniel Wagner <Daniel.Wagner2@itk-engineering.de>
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/bootfdt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 08fb59f4e7a9..dcff512648a0 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -163,8 +163,9 @@ static int __init process_memory_node(const void *fdt, int node,
     for ( i = 0; i < banks && mem->nr_banks < NR_MEM_BANKS; i++ )
     {
         device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
+        /* Some DT may describe empty bank, ignore them */
         if ( !size )
-            return -EINVAL;
+            continue;
         mem->bank[mem->nr_banks].start = start;
         mem->bank[mem->nr_banks].size = size;
         mem->nr_banks++;
-- 
2.17.1


