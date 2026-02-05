Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2291ECD9AA
	for <xen-devel@archiver.kernel.org>; Thu,  5 Feb 2026 22:09:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1222540.1530363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo7XO-0001BK-Oo; Thu, 05 Feb 2026 22:09:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222540.1530363; Thu, 05 Feb 2026 22:09:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo7XO-0001BD-MM; Thu, 05 Feb 2026 22:09:22 +0000
Received: by outflank-mailman (input) for mailman id 1222540;
 Thu, 05 Feb 2026 22:09:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l0Ed=AJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vo7XN-0001B6-F8
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 22:09:21 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e7341f9-02df-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Feb 2026 23:09:15 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AFC6D60010;
 Thu,  5 Feb 2026 22:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0486EC4CEF7;
 Thu,  5 Feb 2026 22:09:10 +0000 (UTC)
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
X-Inumbo-ID: 4e7341f9-02df-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770329353;
	bh=V9dFLTZQkqWpJ3YszT3cuHPxhfkzSeZqTHI4J6BzA/w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=chKqnAXC1YmgMSWLq9I7uASagoeYHlcrQaEuqMn7uPD5Xj4AX6WFiG3JBiwa34Hq+
	 91xHgt5vjyYTDD0DCoDOA5a9dnZbQ96dteNWLq6XJUKWHc0BJr2BMFK90/MZVSpd2B
	 PyJkkgfEQPkVk9npJKlw/SitrNGb9ao9ZEtyHOOxvWfXtMhQ1w95JD9Cp0nmTr1lfp
	 RD6RycqR2CJCY1TF0+2dvsBMt3k0SmLM0Xj29HdFw5k4/emyPqsRzRczmm7u5XoPny
	 SCWo5hE5NMGWEYF6dy2O0ugbRiBg9dKggTFKI0tcq3nh00U4/bjyyE4cOLLO1yUUqE
	 9Z93+3V6f8E1A==
Date: Thu, 5 Feb 2026 14:09:07 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@xen.org
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org, grygorii_strashko@epam.com, 
    anthony.perard@vates.tech, michal.orzel@amd.com, julien@xen.org, 
    roger.pau@citrix.com, jason.andryuk@amd.com, victorm.lira@amd.com, 
    andrew.cooper3@citrix.com, jbeulich@suse.com, sstabellini@kernel.org
Subject: Re: [PATCH v10 5/5] xen: enable dom0less guests to use console_io
 hypercalls
In-Reply-To: <aYP76EsG3bf3Yp4I@kraken>
Message-ID: <alpine.DEB.2.22.394.2602051403060.3397030@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2602041533440.3175371@ubuntu-linux-20-04-desktop> <20260204233712.3396752-5-stefano.stabellini@amd.com> <aYP76EsG3bf3Yp4I@kraken>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 4 Feb 2026, dmukhin@xen.org wrote:
> On Wed, Feb 04, 2026 at 03:37:12PM -0800, Stefano Stabellini wrote:
> > Enable dom0less guests on ARM to use console_io hypercalls:
> > - set input_allow = true for dom0less domains
> > - update the in-code comment in console.c
> > - prioritize the VUART check to retain the same behavior as today
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> The code looks good, just one remark wrt prioritizing VUART check.
> 
> > ---
> >  xen/common/device-tree/dom0less-build.c |  2 ++
> >  xen/drivers/char/console.c              | 16 ++++++++++------
> >  2 files changed, 12 insertions(+), 6 deletions(-)
> > 
> > diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> > index 840d14419d..cb7026fa7e 100644
> > --- a/xen/common/device-tree/dom0less-build.c
> > +++ b/xen/common/device-tree/dom0less-build.c
> > @@ -829,6 +829,8 @@ static int __init construct_domU(struct kernel_info *kinfo,
> >  
> >      rangeset_destroy(kinfo->xen_reg_assigned);
> >  
> > +    d->console->input_allowed = true;
> > +
> >      return rc;
> >  }
> >  
> > diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> > index d3ce925131..7f0c3d8376 100644
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -610,11 +610,20 @@ static void __serial_rx(char c)
> >      if ( ACCESS_ONCE(console_rx) == 0 )
> >          return handle_keypress(c, false);
> >  
> > +    /* Includes an is_focus_domain() check. */
> >      d = console_get_domain();
> >      if ( !d )
> >          return;
> >  
> > -    if ( is_hardware_domain(d) )
> 
> Hardware domain on x86 may have an emulated UART (not in upstream, through,
> I need to send v8 for NS16550 series...). The patch which illustrates the
> idea:
>    https://lore.kernel.org/xen-devel/20250908211149.279143-2-dmukhin@ford.com/
> 
> So this code (hopefully soon) will need adjustment again.
>
> I would update the code to something like:
> 
> 
> 
>     if ( is_hardware_domain(d) && !domain_has_vuart(d) )
>     {
>         // handle hardware domain
>     }
> #ifdef CONFIG_SBSA_VUART_CONSOLE
>     else if ( domain_has_vuart(d) )
>         /* Deliver input to the emulated UART. */
>         rc = vpl011_rx_char_xen(d, c);
> #endif
> 
> 
> 
> But domain_has_vuart() needs to be defined for all architectures
> (currently it is hidden in arch/arm/vuart.c).
> 
> Or perhaps it is possible to postpone the change?

This change is needed to avoid regressions on ARM.

However, while I wouldn't be surprised if we need a change here for your
upcoming patch series, at the same time at the moment I don't see why
this check wouldn't work as it is for you as well.

On x86, CONFIG_SBSA_VUART_CONSOLE will never be set. It is OK to do this
first:

#ifdef CONFIG_SBSA_VUART_CONSOLE
    /* Prioritize vpl011 if enabled for this domain */
    if ( d->arch.vpl011.base_addr )
    {
        /* Deliver input to the emulated UART. */
        rc = vpl011_rx_char_xen(d, c);
    }
    else
#endif

It shouldn't hurt. The is_hardware_domain() check is also not necessary
anymore because any necessary check would be part of this check above: 

      d = console_get_domain();
      if ( !d )
          return;

So I am guessing that your series might actually leave this code
unchanged and instead might modify console_get_domain() or
max_console_rx.



> > +#ifdef CONFIG_SBSA_VUART_CONSOLE
> > +    /* Prioritize vpl011 if enabled for this domain */
> > +    if ( d->arch.vpl011.base_addr )
> > +    {
> > +        /* Deliver input to the emulated UART. */
> > +        rc = vpl011_rx_char_xen(d, c);
> > +    }
> > +    else
> > +#endif
> >      {
> >          unsigned long flags;
> >  
> > @@ -633,11 +642,6 @@ static void __serial_rx(char c)
> >           */
> >          send_guest_domain_virq(d, VIRQ_CONSOLE);
> >      }
> > -#ifdef CONFIG_SBSA_VUART_CONSOLE
> > -    else
> > -        /* Deliver input to the emulated UART. */
> > -        rc = vpl011_rx_char_xen(d, c);
> > -#endif
> >  
> >      if ( consoled_is_enabled() )
> >          /* Deliver input to the PV shim console. */
> > -- 
> > 2.25.1
> > 
> > 
> 

