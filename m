Return-Path: <SRS0=EOea=HE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 748F4C433E0
	for <xen-devel@archiver.kernel.org>; Tue,  2 Feb 2021 17:48:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3115464F5F
	for <xen-devel@archiver.kernel.org>; Tue,  2 Feb 2021 17:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3115464F5F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.80675.147715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6zmY-0000vn-5G; Tue, 02 Feb 2021 17:48:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80675.147715; Tue, 02 Feb 2021 17:48:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6zmY-0000vg-1Q; Tue, 02 Feb 2021 17:48:06 +0000
Received: by outflank-mailman (input) for mailman id 80675;
 Tue, 02 Feb 2021 17:48:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TyQM=HE=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1l6zmW-0000vb-Fy
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 17:48:04 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5c730fc-f88f-4553-aaf0-ffa11e86cc42;
 Tue, 02 Feb 2021 17:48:01 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 112HllcC022963
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 2 Feb 2021 12:47:53 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 112HllHT022962;
 Tue, 2 Feb 2021 09:47:47 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: c5c730fc-f88f-4553-aaf0-ffa11e86cc42
Date: Tue, 2 Feb 2021 09:47:47 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: domain_build: Ignore device nodes with invalid
 addresses
Message-ID: <YBmQQ3Tzu++AadKx@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The handle_device() function has been returning failure upon
encountering a device address which was invalid.  A device tree which
had such an entry has now been seen in the wild.  As it causes no
failures to simply ignore the entries, ignore them.

Signed-off-by: Elliott Mitchell <ehem+xenn@m5p.com>

---
I'm starting to suspect there are an awful lot of places in the various
domain_build.c files which should simply ignore errors.  This is now the
second place I've encountered in 2 months where ignoring errors was the
correct action.  I know failing in case of error is an engineer's
favorite approach, but there seem an awful lot of harmless failures
causing panics.

This started as the thread "[RFC PATCH] xen/arm: domain_build: Ignore
empty memory bank".  Now it seems clear the correct approach is to simply
ignore these entries.

This seems a good candidate for backport to 4.14 and certainly should be
in 4.15.
---
 xen/arch/arm/domain_build.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 374bf655ee..c0568b7579 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1407,9 +1407,9 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
         res = dt_device_get_address(dev, i, &addr, &size);
         if ( res )
         {
-            printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
-                   i, dt_node_full_name(dev));
-            return res;
+            printk(XENLOG_ERR "Unable to retrieve address of %s, index %u\n",
+                   dt_node_full_name(dev), i);
+            continue;
         }
 
         res = map_range_to_domain(dev, addr, size, &mr_data);
-- 
2.20.1


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



