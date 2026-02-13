Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5329EF99E9
	for <xen-devel@archiver.kernel.org>; Fri, 13 Feb 2026 23:44:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1232132.1536968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr2q3-0001Tr-PO; Fri, 13 Feb 2026 23:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1232132.1536968; Fri, 13 Feb 2026 23:44:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr2q3-0001Tk-Lu; Fri, 13 Feb 2026 23:44:43 +0000
Received: by outflank-mailman (input) for mailman id 1232132;
 Fri, 13 Feb 2026 23:44:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9cwp=AR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vr2q2-0001Te-1g
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 23:44:42 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3d874d3-0935-11f1-9ccf-f158ae23cfc8;
 Sat, 14 Feb 2026 00:44:36 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9850B60054;
 Fri, 13 Feb 2026 23:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E460C116C6;
 Fri, 13 Feb 2026 23:44:33 +0000 (UTC)
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
X-Inumbo-ID: f3d874d3-0935-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771026274;
	bh=7ybNqTcUHO8ZiSFSuBf2rA9uzkzo6uQ289HcDJfEiuY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=M3g1rmmnNi6R0mw7lDz68kt4nR3xYO5sm8M2JiEqmRFTNGDRRhYymfMqI987+L9pV
	 7OjoX4dQixTBwrblMe6vj9G+xihpzqlTGkgzxFPsHizDdsH3AOsRR6fOKGq7S9vWIx
	 4E9fSFJQStk+Ny1ZM7c25Ad4XqN+hEAoGgR4FXLpFg/D6GMitxdLbE9YIAd4TIc4tI
	 WhhulUL6xl4IfBflvgX+bQW61nJGIjNJFgVfDqG/u92fPSdJgljE9RgmhrhJ5++/YI
	 W2mFDnbxiblnXpR3kmAvYn9yhVzjowU9BXa5z1I7v9fo2/RidI9U0OE7yfF/0kJaVp
	 tX3IiUmcpdGjg==
Date: Fri, 13 Feb 2026 15:44:31 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org, jbeulich@suse.com, roger.pau@citrix.com, 
    jason.andryuk@amd.com, alejandro.garciavallejo@amd.com
Subject: Re: [PATCH v3] x86/cpufreq: Add Kconfig option for CPU frequency
 scaling
In-Reply-To: <d1765cd9-b95a-4032-bc0b-ada50e1a05d6@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2602131532400.6031@ubuntu-linux-20-04-desktop>
References: <20260213222818.271685-1-stefano.stabellini@amd.com> <d1765cd9-b95a-4032-bc0b-ada50e1a05d6@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1737345080-1771025601=:6031"
Content-ID: <alpine.DEB.2.22.394.2602131535080.6031@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1737345080-1771025601=:6031
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2602131535081.6031@ubuntu-linux-20-04-desktop>

On Fri, 13 Feb 2026, Andrew Cooper wrote:
> On 13/02/2026 10:28 pm, Stefano Stabellini wrote:
> > diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
> > index c6c5135806..a4669090e0 100644
> > --- a/xen/arch/x86/platform_hypercall.c
> > +++ b/xen/arch/x86/platform_hypercall.c
> > @@ -485,6 +485,7 @@ ret_t do_platform_op(
> >          ret = acpi_enter_sleep(&op->u.enter_acpi_sleep);
> >          break;
> >  
> > +#ifdef CONFIG_CPUFREQ
> >      case XENPF_change_freq:
> >          ret = -ENOSYS;
> >          if ( cpufreq_controller != FREQCTL_dom0_kernel )
> > @@ -544,6 +545,7 @@ ret_t do_platform_op(
> >              ret = -EFAULT;
> >          break;
> >      }
> > +#endif
> 
> You must not hide case labels like this.  Instead, use:
> 
>     case XENPF_change_freq:
>         ret = -ENOSYS;
>         if ( !IS_ENABLED(CONFIG_CPUFREQ) )
>             break;
>         ...
> 
> which in turn ...
> 
> >  
> >      case XENPF_set_processor_pminfo:
> >          switch ( op->u.set_pminfo.type )
> > @@ -936,7 +938,7 @@ ret_t do_platform_op(
> >          break;
> >      }
> >  
> > - out:
> > + out: __maybe_unused;
> >      spin_unlock(&xenpf_lock);
> 
> ... removes the need for this hunk.

I can do that


> > diff --git a/xen/drivers/acpi/pm-op.c b/xen/drivers/acpi/pm-op.c
> > index 07bddc58d9..f5caeebb9a 100644
> > --- a/xen/drivers/acpi/pm-op.c
> > +++ b/xen/drivers/acpi/pm-op.c
> > @@ -367,7 +367,8 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
> >          return ret;
> >      }
> >  
> > -    if ( op->cpuid >= nr_cpu_ids || !cpu_online(op->cpuid) )
> > +    if ( op->cpuid >= nr_cpu_ids || !cpu_online(op->cpuid) ||
> > +         !IS_ENABLED(CPUFREQ) )
> 
> Everywhere else in this patch, CONFIG_CPUFREQ.
> 
> You won't get a compile error for typo-ing a name inside IF_ENABLED(),
> but it won't function correctly either.

Oh man now that I have seen it I cannot unsee it. I'll respin it
immediately.
--8323329-1737345080-1771025601=:6031--

