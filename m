Return-Path: <SRS0=QTwr=6P=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D53F9C4724C
	for <xen-devel@archiver.kernel.org>; Fri,  1 May 2020 01:31:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1847206C0
	for <xen-devel@archiver.kernel.org>; Fri,  1 May 2020 01:31:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKgFLzK8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1847206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUKWO-0001Nz-BD; Fri, 01 May 2020 01:31:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J7As=6P=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jUKWM-0001Ns-QI
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 01:31:18 +0000
X-Inumbo-ID: 747b58c2-8b4b-11ea-9ad8-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 747b58c2-8b4b-11ea-9ad8-12813bfff9fa;
 Fri, 01 May 2020 01:31:18 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C9CC206C0;
 Fri,  1 May 2020 01:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588296677;
 bh=ristXRsVtwg5JAi2xLjOMlOfg89wsdnLx7DmfQWqDFg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=eKgFLzK8zzpdo1H+Bpx5WnfbmvLlAn09VObEJNZKnqoiuHEHqZx8MFFPjqgb98d3F
 zzH9hLBA8X0MGNTOER4HLyP54q7tWm4Nd7/JqYC3lVBLO6DXnGBkbPlTmmsHHwKPLR
 V+BnxdVYliJMECjPB92jx0vA6SDVNGTtmSEOBNbI=
Date: Thu, 30 Apr 2020 18:31:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 09/12] xen/arm: if is_domain_direct_mapped use native
 addresses for GICv3
In-Reply-To: <923411c5-37d4-c86e-c5a8-8acd8a6830e7@xen.org>
Message-ID: <alpine.DEB.2.21.2004301613220.28941@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-9-sstabellini@kernel.org>
 <923411c5-37d4-c86e-c5a8-8acd8a6830e7@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr_Babchuk@epam.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 15 Apr 2020, Julien Grall wrote:
> > diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> > index 4e60ba15cc..4cf430f865 100644
> > --- a/xen/arch/arm/vgic-v3.c
> > +++ b/xen/arch/arm/vgic-v3.c
> > @@ -1677,13 +1677,25 @@ static int vgic_v3_domain_init(struct domain *d)
> 
> 
> I think you also want to modify vgic_v3_max_rdist_count().

I don't think so: domUs even direct-mapped still only get 1 rdist
region. This patch is not changing the layout of the domU gic, it is
only finding a "hole" in the physical address space to make sure there
are no conflicts (or at least minimize the chance of conflicts.)


> >        * Domain 0 gets the hardware address.
> >        * Guests get the virtual platform layout.
> 
> This comment needs to be updated.

Yep, I'll do


> >        */
> > -    if ( is_hardware_domain(d) )
> > +    if ( is_domain_direct_mapped(d) )
> >       {
> >           unsigned int first_cpu = 0;
> > +        unsigned int nr_rdist_regions;
> >             d->arch.vgic.dbase = vgic_v3_hw.dbase;
> >   -        for ( i = 0; i < vgic_v3_hw.nr_rdist_regions; i++ )
> > +        if ( is_hardware_domain(d) )
> > +        {
> > +            nr_rdist_regions = vgic_v3_hw.nr_rdist_regions;
> > +            d->arch.vgic.intid_bits = vgic_v3_hw.intid_bits;
> > +        }
> > +        else
> > +        {
> > +            nr_rdist_regions = 1;
> 
> What does promise your the rdist region will be big enough to cater all the
> re-distributors for your domain?

Good point. I'll add an explicit check for that with at least a warning.
I don't think we want to return error because the configuration it is
still likely to work. 

It might be better to continue this conversation on the next version of
the patch -- it is going to be much clearer.

