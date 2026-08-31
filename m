Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1AAC61DE4
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 01:22:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1403710.1637690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0qip-0002AZ-JJ; Mon, 31 Aug 2026 01:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1403710.1637690; Mon, 31 Aug 2026 01:22:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0qip-0002AS-Gk; Mon, 31 Aug 2026 01:22:03 +0000
Received: by outflank-mailman (input) for mailman id 1403710;
 Mon, 31 Aug 2026 01:22:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1x0qio-0002AM-8i
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 01:22:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x0qin-00DBK1-2l
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 03:22:01 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a94d713-e002-0a2a0a5209dd-0a2a45079058-20
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 03:22:01 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a94d737-b4ea-0a2a45070019-ac6904fe97b2-3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 03:22:00 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 473D360120;
 Mon, 31 Aug 2026 01:21:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B39751F000E9;
 Mon, 31 Aug 2026 01:21:57 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788139319;
	bh=LM28nnXh2PAYfx3Qel8y5yFZ3jkgPhXYl/GMsr+C1zc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Fm3kddWYYmsjo5qWDk7GvvBhikST23fOJ8mVzpM2xZcUufPILGGb5FnZdigfhbgjp
	 jLrMm+hsdcKxFa84qHM+8CqGddN/3PBlyZpNATxI32R70VbDdpoySpgzcfPIz+ghRy
	 6u+S1BkXcF0Ep0Lvc3xAaNlHfRfomegxHFYLg++MyVgi8f7VEthroZa6qVm92VAMWy
	 LfDrBs6tcNysEaWQEV1XI9QTOtER3E6DqCjgJ0gQY8exTlFPn9AAzN1teGcpOibdwG
	 cCLlciEXtqVe8wctrfh0Zgw2GZurZX2OhVvr8vwASUaiixSoEqyPb+3e3hcyIWI9y2
	 sIuTCIiv1Y9XQ==
Date: Sun, 30 Aug 2026 18:21:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 08/12] Arm/GIC: add noreturn in a few more places
In-Reply-To: <afa5c348-744a-4a4b-8b00-2971ca3376cd@suse.com>
Message-ID: <73d783b8-81ef-43b5-e58f-394acf3d9183@kernel.org>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com> <afa5c348-744a-4a4b-8b00-2971ca3376cd@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-ef75cf/1788139320-350CDAE4-8EE5B7A6/0/0
X-purgate-type: clean
X-purgate-size: 2250

On Fri, 28 Aug 2026, Jan Beulich wrote:
> LPI related functions having just BUG() in them are disliked by Misra /
> Eclair, as long as they don't also have a noreturn attribute.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> >From its description "Unreachability caused by calls to the following
> functions or macros is deliberate and there is no risk of code being
> unexpectedly left out." I would have expected the respective entry in
> deviations.ecl to cover all of these cases, but clearly that isn't the
> case.
> 
> Of course having noreturn on functions returning non-void is somewhat odd.
> 
> --- a/xen/arch/arm/gic-v2.c
> +++ b/xen/arch/arm/gic-v2.c
> @@ -1315,7 +1315,7 @@ static int __init gicv2_init(void)
>      return 0;
>  }
>  
> -static void gicv2_do_LPI(unsigned int lpi)
> +static void noreturn gicv2_do_LPI(unsigned int lpi)
>  {
>      /* No LPIs in a GICv2 */
>      BUG();
> --- a/xen/arch/arm/include/asm/gic_v3_its.h
> +++ b/xen/arch/arm/include/asm/gic_v3_its.h
> @@ -229,7 +229,7 @@ static inline unsigned int vgic_v3_its_c
>      return 0;
>  }
>  
> -static inline void gicv3_do_LPI(unsigned int lpi)
> +static inline void noreturn gicv3_do_LPI(unsigned int lpi)
>  {
>      /* We don't enable LPIs without an ITS. */
>      BUG();
> --- a/xen/arch/arm/vgic-v2.c
> +++ b/xen/arch/arm/vgic-v2.c
> @@ -718,14 +718,15 @@ static void vgic_v2_domain_free(struct d
>      /* Nothing to be cleanup for this driver */
>  }
>  
> -static struct pending_irq *vgic_v2_lpi_to_pending(struct domain *d,
> -                                                  unsigned int vlpi)
> +static struct pending_irq *noreturn vgic_v2_lpi_to_pending(struct domain *d,
> +                                                           unsigned int vlpi)
>  {
>      /* Dummy function, no LPIs on a VGICv2. */
>      BUG();
>  }
>  
> -static int vgic_v2_lpi_get_priority(struct domain *d, unsigned int vlpi)
> +static int noreturn vgic_v2_lpi_get_priority(struct domain *d,
> +                                             unsigned int vlpi)
>  {
>      /* Dummy function, no LPIs on a VGICv2. */
>      BUG();
> 

