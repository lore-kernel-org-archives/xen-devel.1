Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC7AC531D0
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 16:51:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371817.1619261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woOY1-0006uy-3h; Mon, 27 Jul 2026 16:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371817.1619261; Mon, 27 Jul 2026 16:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woOY1-0006ur-0S; Mon, 27 Jul 2026 16:51:25 +0000
Received: by outflank-mailman (input) for mailman id 1371817;
 Mon, 27 Jul 2026 16:51:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1woOXz-0006ul-S9
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 16:51:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger.pau@citrix.com>) id 1woOXx-00BgNb-1r;
 Mon, 27 Jul 2026 16:51:21 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger.pau@citrix.com>) id 1woOXw-00FxMZ-3B;
 Mon, 27 Jul 2026 16:51:21 +0000
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
Date: Mon, 27 Jul 2026 18:51:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Juergen Gross <jgross@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Linux kernel regressions list <regressions@lists.linux.dev>,
	yannick.martin+kernelorg@okazoo.eu
Subject: Re: [regression] Bug 221745 - PV DomU ballooning driver init issue
Message-ID: <ameMgwuUIhZbslHh@macbook.local>
References: <f7fe5959-f0c6-430c-8404-927d7944c836@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f7fe5959-f0c6-430c-8404-927d7944c836@leemhuis.info>

On Mon, Jul 27, 2026 at 10:42:25AM +0200, Thorsten Leemhuis wrote:
> Hi Roger! FYI, it seems your change 0949c646d64697 ("Partial revert
> "x86/xen: fix balloon target initialization for PVH dom0"") [v7.0-rc1]
> caued a regression. For details see
> https://bugzilla.kernel.org/show_bug.cgi?id=221745
> 
> To quote the initial comment:
> 
> > Since commit db8c4b1 (Partial revert "x86/xen: fix balloon target initialization for PVH dom0"), xen ballooning fails to init correctly on domU (on amd64 arch) with the following configuration:
> > 
> > -- xl.cfg
> > ...
> > memory      = '2048'
> > maxmem      = '4096'
> > ...
> > --
> > 
> > -- domU balloon dmesg (init fails)
> > [    0.908337] xen:balloon: Initialising balloon driver
> > [    0.940721] Extra pages underflow current target

Yeah, I'm afraid the original fix commit didn't fully fix the issues,
so there's the following change (chunk below) that's needed
additionally to cope with memory != maxmem on PV guests.

I've done some basic testing and it seems to solve the issue, could
you give it a spin also?  (just to make sure I'm not missing anything
else).

Thanks, Roger.
---
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

