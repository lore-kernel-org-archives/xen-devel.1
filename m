Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693DAC5AE49
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 13:06:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387461.1628717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtPiD-0007ro-QA; Mon, 10 Aug 2026 13:06:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387461.1628717; Mon, 10 Aug 2026 13:06:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtPiD-0007rg-Mb; Mon, 10 Aug 2026 13:06:41 +0000
Received: by outflank-mailman (input) for mailman id 1387461;
 Mon, 10 Aug 2026 13:06:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1wtPiD-0007rS-2u
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 13:06:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wtPiC-00Eima-1A;
 Mon, 10 Aug 2026 13:06:40 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wtPiB-00EPaK-2b;
 Mon, 10 Aug 2026 13:06:40 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=i4Ix+U9e9KBV/c/msUl5WKDJGozI83ZXi5f8mrs4zgM=; b=sv93cXzy6g7FwRkbsdP1K1OHjC
	wjvE6+E5n5+vJMz0GQQQ7n9/HnA5vh3xh03Zox94MZVLg7hMyEuMXmg9gEY7KizF0ToKnqXgrr/3g
	0ARLvunHlGM7Y5SIdhH44MLTlRCLuKPI9ivchEymACicF2m/H8HAiaQ4aLRnOvtClycQ=;
Date: Mon, 10 Aug 2026 15:06:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, sstabellini@kernel.org
Subject: Re: [PATCH v4 2/2] xen/console: add compile-time rate-limiting
 controls
Message-ID: <annM2322Ig23p4RG@Mac.lan>
References: <20260729072520.1556970-1-dmukhin@ford.com>
 <20260729072520.1556970-3-dmukhin@ford.com>
 <annMNjOodiS3hHp7@macbook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <annMNjOodiS3hHp7@macbook.local>

On Wed, Jul 29, 2026 at 12:25:20AM -0700, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Introduce CONFIG_PRINTK_RATELIMIT_MS and CONFIG_PRINTK_RATELIMIT_BURST
> for configuring rate-limiting policy at the compile time.
> 
> Use symbols for global rate-limiting initialization in the console driver.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v3:
> - added note on security support for non-standard configurations
> - gated menu with EXPERT
> 
> I kept both settings for now.
> ---
>  xen/common/Kconfig         | 36 ++++++++++++++++++++++++++++++++++++
>  xen/drivers/char/console.c |  6 ++++--
>  2 files changed, 40 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index da80fdba8469..749d3bfb08e0 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -672,4 +672,40 @@ config PM_STATS
>  	  Enable collection of performance management statistics to aid in
>  	  analyzing and tuning power/performance characteristics of the system
>  
> +menu "Console rate-limiting"
> +	visible if EXPERT

No strong opinion, but there's a drivers/char/Kconfig which might be a
more natural place for those option to live, and then there's no
reason for the extra menu?

> +
> +config PRINTK_RATELIMIT_MS
> +	int "printk rate-limiting time window (milliseconds)"
> +	default 5000
> +	help
> +	  Specifies the time window, in milliseconds, for rate-limited [*] printk
> +	  messages. No more than `CONFIG_PRINTK_RATELIMIT_BURST` messages will be
> +	  printed within this window.
> +
> +	  Setting this value to 0 disables rate-limiting entirely.
> +
> +	  Configurations using a value other than the default of 5000 are not
> +	  security supported.
> +
> +	  [*] Rate-limited messages are those controlled by the `loglvl` and
> +	  `guest_loglvl` command-line parameters.
> +
> +config PRINTK_RATELIMIT_BURST
> +	int "printk rate-limited message burst size"
> +	default 10
> +	help
> +	  Defines the maximum number of rate-limited [*] printk messages that may
> +	  be printed within each `CONFIG_PRINTK_RATELIMIT_MS` time window.
> +
> +	  Setting this value to 0 disables rate-limiting entirely.
> +
> +	  Configurations using a value other than the default of 10 are not
> +	  security supported.
> +
> +	  [*] Rate-limited messages are those controlled by the `loglvl` and
> +	  `guest_loglvl` command-line parameters.

Is it common to use footnotes in Kconfig options?  It seems a bit
weird to me, I would probably just expand inside parenthesis if
needed.

Also, I'm a bit confused by the mention of loglvl and guest_loglvl
explicitly here: messages outside of the selected level are just
discarded, and hence it's kind of obvious that just messages inside
the selected level are controlled by this rate-limiting.

