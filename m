Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03593EA7950
	for <xen-devel@archiver.kernel.org>; Thu,  5 Feb 2026 02:10:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1221413.1529677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnooW-0001hx-BZ; Thu, 05 Feb 2026 02:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221413.1529677; Thu, 05 Feb 2026 02:09:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnooW-0001hp-92; Thu, 05 Feb 2026 02:09:48 +0000
Received: by outflank-mailman (input) for mailman id 1221413;
 Thu, 05 Feb 2026 02:09:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1vnooU-0001hj-8Z
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 02:09:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vnooU-003xaS-0I;
 Thu, 05 Feb 2026 02:09:45 +0000
Received: from [140.209.201.102] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vnooT-00HXSU-1c;
 Thu, 05 Feb 2026 02:09:45 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:Date:From; bh=JZ0IqeUKiUvpVv+1LWGj3tiNHEiiBwZMVorXIjS40XI=; b=
	tXfpl84aIdmnOxa40xWzSwR+VIG4gGMx5WCItzxtZCu68VeKdFSYwbGhA3PpvW/eQh6MT7WFsu+RL
	a1UtFaI+gnGxyicIdnM8fYnaaIIxf15+JZxlf38hnIQrYIYd/3X2BUuGMAz6owjSF0YzaOy09u47N
	WN2A7phPz0CUOBWfU=;
From: dmukhin@xen.org
Date: Wed, 4 Feb 2026 18:09:44 -0800
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: xen-devel@lists.xenproject.org, grygorii_strashko@epam.com,
	anthony.perard@vates.tech, michal.orzel@amd.com, julien@xen.org,
	roger.pau@citrix.com, jason.andryuk@amd.com, victorm.lira@amd.com,
	andrew.cooper3@citrix.com, jbeulich@suse.com,
	sstabellini@kernel.org
Subject: Re: [PATCH v10 5/5] xen: enable dom0less guests to use console_io
 hypercalls
Message-ID: <aYP76EsG3bf3Yp4I@kraken>
References: <alpine.DEB.2.22.394.2602041533440.3175371@ubuntu-linux-20-04-desktop>
 <20260204233712.3396752-5-stefano.stabellini@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204233712.3396752-5-stefano.stabellini@amd.com>

On Wed, Feb 04, 2026 at 03:37:12PM -0800, Stefano Stabellini wrote:
> Enable dom0less guests on ARM to use console_io hypercalls:
> - set input_allow = true for dom0less domains
> - update the in-code comment in console.c
> - prioritize the VUART check to retain the same behavior as today
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

The code looks good, just one remark wrt prioritizing VUART check.

> ---
>  xen/common/device-tree/dom0less-build.c |  2 ++
>  xen/drivers/char/console.c              | 16 ++++++++++------
>  2 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index 840d14419d..cb7026fa7e 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -829,6 +829,8 @@ static int __init construct_domU(struct kernel_info *kinfo,
>  
>      rangeset_destroy(kinfo->xen_reg_assigned);
>  
> +    d->console->input_allowed = true;
> +
>      return rc;
>  }
>  
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index d3ce925131..7f0c3d8376 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -610,11 +610,20 @@ static void __serial_rx(char c)
>      if ( ACCESS_ONCE(console_rx) == 0 )
>          return handle_keypress(c, false);
>  
> +    /* Includes an is_focus_domain() check. */
>      d = console_get_domain();
>      if ( !d )
>          return;
>  
> -    if ( is_hardware_domain(d) )

Hardware domain on x86 may have an emulated UART (not in upstream, through,
I need to send v8 for NS16550 series...). The patch which illustrates the
idea:
   https://lore.kernel.org/xen-devel/20250908211149.279143-2-dmukhin@ford.com/

So this code (hopefully soon) will need adjustment again.

I would update the code to something like:



    if ( is_hardware_domain(d) && !domain_has_vuart(d) )
    {
        // handle hardware domain
    }
#ifdef CONFIG_SBSA_VUART_CONSOLE
    else if ( domain_has_vuart(d) )
        /* Deliver input to the emulated UART. */
        rc = vpl011_rx_char_xen(d, c);
#endif



But domain_has_vuart() needs to be defined for all architectures
(currently it is hidden in arch/arm/vuart.c).

Or perhaps it is possible to postpone the change?

What do you think?

> +#ifdef CONFIG_SBSA_VUART_CONSOLE
> +    /* Prioritize vpl011 if enabled for this domain */
> +    if ( d->arch.vpl011.base_addr )
> +    {
> +        /* Deliver input to the emulated UART. */
> +        rc = vpl011_rx_char_xen(d, c);
> +    }
> +    else
> +#endif
>      {
>          unsigned long flags;
>  
> @@ -633,11 +642,6 @@ static void __serial_rx(char c)
>           */
>          send_guest_domain_virq(d, VIRQ_CONSOLE);
>      }
> -#ifdef CONFIG_SBSA_VUART_CONSOLE
> -    else
> -        /* Deliver input to the emulated UART. */
> -        rc = vpl011_rx_char_xen(d, c);
> -#endif
>  
>      if ( consoled_is_enabled() )
>          /* Deliver input to the PV shim console. */
> -- 
> 2.25.1
> 
> 

