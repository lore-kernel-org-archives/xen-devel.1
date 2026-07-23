Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE00C531D1
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2026 14:57:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369293.1618138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmurJ-0000gs-Cj; Thu, 23 Jul 2026 14:57:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369293.1618138; Thu, 23 Jul 2026 14:57:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmurJ-0000gl-9I; Thu, 23 Jul 2026 14:57:13 +0000
Received: by outflank-mailman (input) for mailman id 1369293;
 Thu, 23 Jul 2026 14:57:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1wmurH-0000gf-VV
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 14:57:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wmurF-004LIe-2B;
 Thu, 23 Jul 2026 14:57:09 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wmurF-006qpV-0I;
 Thu, 23 Jul 2026 14:57:09 +0000
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
	bh=y4AMp33c3kQPVhVUZO2NWq3KBZgkqNPLkIPWXCc29mY=; b=Y+A+aGSWsjizJxi/8ZhVlsr9Kr
	xBNeVyhrizC/ZCmifPBB0PSi5ZFYZMuDQBi+z6SDqLZvfRoRzK77I64q2j8BU53gGnGrXfLRTMkza
	iiGoVCn9ynj5FNajKHCafxCx3ClM+LI+TyH+IOm7KyGXbleA8xKIiwKz15MeIvqDWGHk=;
Date: Thu, 23 Jul 2026 16:57:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 1/9] vpci: move BAR mapping permissions checks
Message-ID: <amIrwLuIdOBaAi9d@macbook.local>
References: <20260708210233.922275-1-stewart.hildebrand@amd.com>
 <20260708210233.922275-2-stewart.hildebrand@amd.com>
 <0255d2bf-748e-444b-8c09-f69925ec88c4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0255d2bf-748e-444b-8c09-f69925ec88c4@suse.com>

On Thu, Jul 23, 2026 at 04:44:26PM +0200, Jan Beulich wrote:
> On 08.07.2026 23:02, Stewart Hildebrand wrote:
> > There's no need to defer the permissions checks. Perform them right away
> > in modify_bars().
> > 
> > As a result of the move, the permissions checks will now cover the whole
> > BAR before any holes are removed.
> 
> Is this a good idea though? A really good toolstack would avoid granting
> access to e.g. the MSI-X table.
> 
> > Carry over the domain_crash() in the error path for domUs.
> 
> I don't think this is warranted.
> 
> > --- a/xen/drivers/vpci/header.c
> > +++ b/xen/drivers/vpci/header.c
> > @@ -58,24 +58,6 @@ static int cf_check map_range(
> >           * offset of the current address from the BAR start.
> >           */
> >          unsigned long map_mfn = start_mfn + s - start_gfn;
> > -        unsigned long m_end = map_mfn + size - 1;
> > -
> > -        if ( !iomem_access_permitted(map->d, map_mfn, m_end) )
> > -        {
> > -            printk(XENLOG_G_WARNING
> > -                   "%pd denied access to MMIO range [%#lx, %#lx]\n",
> > -                   map->d, map_mfn, m_end);
> > -            return -EPERM;
> > -        }
> > -
> > -        rc = xsm_iomem_mapping_vpci(XSM_HOOK, map->d, map_mfn, m_end, map->map);
> > -        if ( rc )
> > -        {
> > -            printk(XENLOG_G_WARNING
> > -                   "%pd XSM denied access to MMIO range [%#lx, %#lx]: %d\n",
> > -                   map->d, map_mfn, m_end, rc);
> 
> I realize you literally only take what's here, but ...
> 
> > @@ -369,6 +351,28 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >              return -EINVAL;
> >          }
> >  
> > +        if ( !iomem_access_permitted(pdev->domain, start, end) )
> > +        {
> > +            printk(XENLOG_G_WARNING
> > +                   "%pd denied access to MMIO range [%#lx, %#lx]\n",
> > +                   pdev->domain, start, end);
> > +            if ( !is_hardware_domain(pdev->domain) )
> > +                domain_crash(pdev->domain);
> > +            return -EPERM;
> > +        }
> > +
> > +        rc = xsm_iomem_mapping_vpci(XSM_HOOK, pdev->domain, start, end,
> > +                                    !!(cmd & PCI_COMMAND_MEMORY));
> > +        if ( rc )
> > +        {
> > +            printk(XENLOG_G_WARNING
> > +                   "%pd XSM denied access to MMIO range [%#lx, %#lx]: %d\n",
> > +                   pdev->domain, start, end, rc);
> 
> ... is the logging of rc actually useful? Afaict it's only ever going to be
> -EPERM.

I think Flask can also return -EACCES, not that it's very relevant I'm
afraid.  It's likely too late now, but those XSM checks should instead
return a bool to avoid this kind of confusion with the returned
error? (or whether diverse return codes are indeed expected).

Thanks, Roger.

