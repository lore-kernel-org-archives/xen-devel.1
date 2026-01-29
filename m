Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEE0D46C16
	for <xen-devel@archiver.kernel.org>; Thu, 29 Jan 2026 02:43:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1216037.1526025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlHzj-00008L-FA; Thu, 29 Jan 2026 02:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216037.1526025; Thu, 29 Jan 2026 02:42:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlHzj-00007t-9k; Thu, 29 Jan 2026 02:42:55 +0000
Received: by outflank-mailman (input) for mailman id 1216037;
 Thu, 29 Jan 2026 02:42:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+fBE=AC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vlHzi-00007n-D9
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 02:42:54 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33f2eaeb-fcbc-11f0-b160-2bf370ae4941;
 Thu, 29 Jan 2026 03:42:51 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9430D60054;
 Thu, 29 Jan 2026 02:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0D17C4CEF1;
 Thu, 29 Jan 2026 02:42:47 +0000 (UTC)
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
X-Inumbo-ID: 33f2eaeb-fcbc-11f0-b160-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769654569;
	bh=WAi5BgVh2BpUxZlRop1qIplkxyvXAXUqVblVJqIdQG4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fGV42+wECr9y3+gljw7cdJUVmhk4RV8U+AvFZ6XsX4PRuKme8UkpwAi2j427gzwzv
	 8T617g3jac9qaqYODhvWWV+uJussAdlN/1oT2rl146ff29hkBKaySVxbG8ihGqfGmd
	 HqvVqVmJCByq2t3K4m6Aqqzp5oVmHdZwHxMbK004cw65pNJq7rtZauHp1zSm+BVVGf
	 MOLXzz97Pny7XWb4EF4x8GyL7YMdUbGGLSkBiVIeWWD7y4+YOSuM93w3PFTLasYmo4
	 /DSNS/ysi7qpEHTLj/1O4bHu+Qi68Aey5ODiD+4E3q0S/qIA2qL8uG+OG/dTg/cKYs
	 +clwIVmQPSgQA==
Date: Wed, 28 Jan 2026 18:42:45 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    grygorii_strashko@epam.com, anthony.perard@vates.tech, 
    michal.orzel@amd.com, julien@xen.org, roger.pau@citrix.com, 
    jason.andryuk@amd.com, victorm.lira@amd.com, andrew.cooper3@citrix.com, 
    sstabellini@kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v7 2/2] xen: enable dom0less guests to use console_io
 hypercalls
In-Reply-To: <91c71a0c-4345-4fae-912b-ae7c9d2160e7@suse.com>
Message-ID: <alpine.DEB.2.22.394.2601281823460.2238666@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2601221704110.7192@ubuntu-linux-20-04-desktop> <20260123010640.1194863-2-stefano.stabellini@amd.com> <91c71a0c-4345-4fae-912b-ae7c9d2160e7@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 28 Jan 2026, Jan Beulich wrote:
> On 23.01.2026 02:06, Stefano Stabellini wrote:
> > --- a/xen/common/device-tree/dom0less-build.c
> > +++ b/xen/common/device-tree/dom0less-build.c
> > @@ -829,6 +829,8 @@ static int __init construct_domU(struct kernel_info *kinfo,
> >  
> >      rangeset_destroy(kinfo->xen_reg_assigned);
> >  
> > +    d->console->input_allowed = true;
> 
> Why for all of the domains? Shouldn't this be a per-domain setting?

For all dom0less domains. No, I don't think it should be a per-domain
setting. If you are running dom0less you only have two options: this
one, or vuart and both of them work the same way and require
input_allowed = true.


> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -612,10 +612,18 @@ static void __serial_rx(char c)
> >      if ( !d )
> >          return;
> >  
> > -    if ( is_hardware_domain(d) )
> 
> This check is fully lost; shouldn't it be replaced by ...
> 
> > +#ifdef CONFIG_SBSA_VUART_CONSOLE
> > +    /* Prioritize vpl011 if enabled for this domain */
> > +    if ( d->arch.vpl011.base_addr )
> > +    {
> > +        /* Deliver input to the emulated UART. */
> > +        rc = vpl011_rx_char_xen(d, c);
> > +    }
> > +    else
> > +#endif
> 
> ...
> 
>     if ( d->input_allowed )
> 
> the latest here (not sure about the vpl011 intentions in this regard)?

No because vuart has already input_allowed


> >      {
> >          /*
> > -         * Deliver input to the hardware domain buffer, unless it is
> > +         * Deliver input to the focus domain buffer, unless it is
> >           * already full.
> >           */
> 
> As said there, imo this change belongs in the earlier patch.

I can move them there

