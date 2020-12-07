Return-Path: <SRS0=Mf7K=FL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD2DC433FE
	for <xen-devel@archiver.kernel.org>; Mon,  7 Dec 2020 18:08:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 750082371F
	for <xen-devel@archiver.kernel.org>; Mon,  7 Dec 2020 18:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 750082371F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.46912.83111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmKvO-0004sC-Ep; Mon, 07 Dec 2020 18:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46912.83111; Mon, 07 Dec 2020 18:07:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmKvO-0004s5-Bq; Mon, 07 Dec 2020 18:07:50 +0000
Received: by outflank-mailman (input) for mailman id 46912;
 Mon, 07 Dec 2020 18:07:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KVsS=FL=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kmKvM-0004s0-BN
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 18:07:48 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ac7b0a4-287c-43b6-922c-4baa9742175d;
 Mon, 07 Dec 2020 18:07:47 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 0B7I7UMW033564
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 7 Dec 2020 13:07:36 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 0B7I7TJq033563;
 Mon, 7 Dec 2020 10:07:29 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 3ac7b0a4-287c-43b6-922c-4baa9742175d
Message-Id: <202012071807.0B7I7TJq033563@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Date: Mon, 7 Dec 2020 07:36:11 -0800
Subject: [RFC PATCH] xen/arm: domain_build: Ignore empty memory bank

Previously Xen had stopped processing Device Trees if an empty
(size == 0) memory bank was found.

Commit 5a37207df52066efefe419c677b089a654d37afc changed this behavior to
ignore such banks.  Unfortunately this means these empty nodes are
visible to code which accesses the device trees.  Have domain_build also
ignore these entries.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---

Looking at this, I think the problem is likely even larger than this and
really needs a proper solution closer to the core of the device-tree
code.  Likely either all device-tree handling code needs to be audited
for ignoring zero-size entries, or the core should take care of these and
nothing outside of xen/common/device_tree.c should ever see these (except
perhaps to confirm such entries exist as flags).  Notably this is the
*second* location where zero-size device-tree entries need to be ignored,
action might be worthwhile before a third is confirmed.
---
 xen/arch/arm/domain_build.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index e824ba34b0..0b83384bd3 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1405,6 +1405,11 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
     {
         struct map_range_data mr_data = { .d = d, .p2mt = p2mt };
         res = dt_device_get_address(dev, i, &addr, &size);
+
+        /* Some DT may describe empty bank, ignore them */
+        if ( !size )
+            continue;
+
         if ( res )
         {
             printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
-- 


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




