Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E82C55162
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 14:36:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1377920.1623634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpRrg-00022I-SK; Thu, 30 Jul 2026 14:36:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1377920.1623634; Thu, 30 Jul 2026 14:36:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpRrg-00022B-PF; Thu, 30 Jul 2026 14:36:04 +0000
Received: by outflank-mailman (input) for mailman id 1377920;
 Thu, 30 Jul 2026 14:36:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1wpRrf-000225-6b
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 14:36:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wpRrb-00H74k-1B;
 Thu, 30 Jul 2026 14:35:59 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wpRra-009ZGf-1y;
 Thu, 30 Jul 2026 14:35:58 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From;
	bh=iBt3Kyqbv5Z8niQb94/bnv7WIopzIJAkOYfQitXwDUA=; b=6bMq+RwCzioKwM9/j3L+CUqTvb
	2tBMandGo3nMfI5kirBaoBeRA3pMaFevseyi2Lip1eekTPNZORCDsJQMrpkjI10Wsse+HTG3WzW3J
	RGGspv0ahsygIeSSsKYgfJDPJcnxBKKYOuMpFN/75+ZizX4MAI3uoKHZXyppteFEFxOY=;
From: Roger Pau Monne <roger@xenproject.org>
To: Juergen Gross <jgross@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Roger Pau Monne <roger@xenproject.org>,
	Yannick Martin <yannick.martin@okazoo.eu>,
	"Thorsten Leemhuis" <regressions@leemhuis.info>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH] x86/xen: fix init of balloon stats for PV guests with memory != maxmem
Date: Thu, 30 Jul 2026 16:35:47 +0200
Message-ID: <20260730143548.39320-1-roger@xenproject.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The handling of extra memory regions done in balloon_add_regions() is not
correct for PV guests, since the initial target is set to reflect the real
memory the system has, not what's described on the memory map, which can be
higher if memory != maxmem.

Introduce separate logic for PV vs HVM in balloon_add_regions() and handle
the extra region correctly by adding them to the total amount of pages,
instead of subtracting from the current and target pages amounts.

Fixes: 87af633689ce ("x86/xen: fix balloon target initialization for PVH dom0")
Signed-off-by: Roger Pau Monné <roger@xenproject.org>
---
Cc: Yannick Martin <yannick.martin@okazoo.eu>
Cc: "Thorsten Leemhuis" <regressions@leemhuis.info>
---
 drivers/xen/balloon.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index e7f1d4ca6d75..c20a1ff8292d 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -703,19 +703,26 @@ static int __init balloon_add_regions(void)
 			balloon_append(pfn_to_page(pfn));
 
 		/*
-		 * Extra regions are accounted for in the physmap, but need
-		 * decreasing from current_pages and target_pages to balloon
-		 * down the initial allocation, because they are already
-		 * accounted for in total_pages.
+		 * For HVM domains: extra regions are accounted for in the
+		 * physmap, but need decreasing from current_pages and
+		 * target_pages to balloon down the initial allocation, because
+		 * they are already accounted for in total_pages.
+		 *
+		 * For PV domains: extra regions are not accounted for in the
+		 * initial memory target, and hence need adding to the stats as
+		 * additional unpopulated regions.
 		 */
 		pages = extra_pfn_end - start_pfn;
-		if (pages >= balloon_stats.current_pages ||
-		    pages >= balloon_stats.target_pages) {
+		if (xen_pv_domain()) {
+			balloon_stats.total_pages += pages;
+		} else if (pages >= balloon_stats.current_pages ||
+		           pages >= balloon_stats.target_pages) {
 			WARN(1, "Extra pages underflow current target");
 			return -ERANGE;
+		} else {
+			balloon_stats.current_pages -= pages;
+			balloon_stats.target_pages -= pages;
 		}
-		balloon_stats.current_pages -= pages;
-		balloon_stats.target_pages -= pages;
 	}
 
 	return 0;
-- 
2.53.0


