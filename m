Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80044C44501
	for <xen-devel@archiver.kernel.org>; Wed, 21 Jan 2026 11:03:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1209602.1521559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viVzp-0007lP-Fj; Wed, 21 Jan 2026 11:03:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209602.1521559; Wed, 21 Jan 2026 11:03:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viVzp-0007lI-Bh; Wed, 21 Jan 2026 11:03:33 +0000
Received: by outflank-mailman (input) for mailman id 1209602;
 Wed, 21 Jan 2026 11:03:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uHQp=72=dingwall.me.uk=james@srs-se1.protection.inumbo.net>)
 id 1viVzo-0007lC-GG
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 11:03:32 +0000
Received: from smarthost01c.ixn.mail.zen.net.uk
 (smarthost01c.ixn.mail.zen.net.uk [212.23.1.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d13409b8-f6b8-11f0-b15e-2bf370ae4941;
 Wed, 21 Jan 2026 12:03:29 +0100 (CET)
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
 by smarthost01c.ixn.mail.zen.net.uk with esmtpsa (TLS1.0) tls
 TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (Exim 4.95)
 (envelope-from <james@dingwall.me.uk>) id 1viVzh-00DBO0-Dx;
 Wed, 21 Jan 2026 11:03:25 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id E2887DF39CA;
 Wed, 21 Jan 2026 11:03:24 +0000 (GMT)
Received: from mail0.xen.dingwall.me.uk ([127.0.0.1])
 by localhost (mail0.xen.dingwall.me.uk [127.0.0.1]) (amavis, port 10024)
 with ESMTP id LBUjXomlv6gY; Wed, 21 Jan 2026 11:03:24 +0000 (GMT)
Received: from behemoth.dingwall.me.uk (behemoth.dingwall.me.uk
 [IPv6:2a02:8010:698e:302::c0a8:105])
 by dingwall.me.uk (Postfix) with ESMTP id 90D7FDF39C7;
 Wed, 21 Jan 2026 11:03:24 +0000 (GMT)
Received: by behemoth.dingwall.me.uk (Postfix, from userid 1000)
 id 5284E10CB0F3; Wed, 21 Jan 2026 11:03:23 +0000 (GMT)
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
X-Inumbo-ID: d13409b8-f6b8-11f0-b15e-2bf370ae4941
X-Virus-Scanned: Debian amavis at dingwall.me.uk
Date: Wed, 21 Jan 2026 11:03:23 +0000
From: James Dingwall <james@dingwall.me.uk>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH] Partial revert "x86/xen: fix balloon target
 initialization for PVH dom0"
Message-ID: <aXCye2DXtX1U89bl@dingwall.me.uk>
References: <20260120140648.25977-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260120140648.25977-1-roger.pau@citrix.com>
X-Originating-smarthost01c-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189

On Tue, Jan 20, 2026 at 03:06:47PM +0100, Roger Pau Monne wrote:
> This partially reverts commit 87af633689ce16ddb166c80f32b120e50b1295de so
> the current memory target for PV guests is still fetched from
> start_info->nr_pages, which matches exactly what the toolstack sets the
> initial memory target to.
> 
> Using get_num_physpages() is possible on PV also, but needs adjusting to
> take into account the ISA hole and the PFN at 0 not considered usable
> memory depite being populated, and hence would need extra adjustments.
> Instead of carrying those extra adjustments switch back to the previous
> code.  That leaves Linux with a difference in how current memory target is
> obtained for HVM vs PV, but that's better than adding extra logic just for
> PV.
> 
> Also, for HVM the target is not (and has never been) accurately calculated,
> as in that case part of what starts as guest memory is reused by hvmloader
> and possibly other firmware to store ACPI tables and similar firmware
> information, thus the memory is no longer being reported as RAM in the
> memory map.
> 
> Reported-by: James Dingwall <james@dingwall.me.uk>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  drivers/xen/balloon.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
> index 49c3f9926394..e799650f6c8c 100644
> --- a/drivers/xen/balloon.c
> +++ b/drivers/xen/balloon.c
> @@ -724,6 +724,7 @@ static int __init balloon_add_regions(void)
>  static int __init balloon_init(void)
>  {
>  	struct task_struct *task;
> +	unsigned long current_pages;
>  	int rc;
>  
>  	if (!xen_domain())
> @@ -731,12 +732,15 @@ static int __init balloon_init(void)
>  
>  	pr_info("Initialising balloon driver\n");
>  
> -	if (xen_released_pages >= get_num_physpages()) {
> +	current_pages = xen_pv_domain() ? min(xen_start_info->nr_pages, max_pfn)
> +	                                : get_num_physpages();
> +
> +	if (xen_released_pages >= current_pages) {
>  		WARN(1, "Released pages underflow current target");
>  		return -ERANGE;
>  	}
>  
> -	balloon_stats.current_pages = get_num_physpages() - xen_released_pages;
> +	balloon_stats.current_pages = current_pages - xen_released_pages;
>  	balloon_stats.target_pages  = balloon_stats.current_pages;
>  	balloon_stats.balloon_low   = 0;
>  	balloon_stats.balloon_high  = 0;
> -- 
> 2.51.0
> 

Thank you Roger, I tested this patch on the system which originally showed
the error and the pci passthrough now works as expected.

Regards,
James

