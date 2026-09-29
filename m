Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B6ACA5FA5
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 09:31:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436363.1655067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBUBD-0003Yw-AL; Tue, 29 Sep 2026 09:31:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436363.1655067; Tue, 29 Sep 2026 09:31:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBUBD-0003Yn-7O; Tue, 29 Sep 2026 09:31:19 +0000
Received: by outflank-mailman (input) for mailman id 1436363;
 Tue, 29 Sep 2026 09:31:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xBUBC-0003Yh-95
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 09:31:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xBUBB-004ybw-1I;
 Tue, 29 Sep 2026 09:31:17 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xBUBB-003XYH-16;
 Tue, 29 Sep 2026 09:31:17 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=ZeHgIhXcLuMvpy5tKBqgUFpXE4jbu3o2z83+apcUd2w=; b=pNNz0v9L/Dzgsse0n5v+VGeSY0
	P85Lu4gayxGkJXq94BaFgk/qBxeJqQ6kzX/TWzBhFgNTIe4/bkX4hM6G8nlnZV9uNoOM4A09LEv4c
	2Q5wWK7XYQ3o2R+yEQj3Tl3lHFioW3cFjsz5oV6sWFzop6ojJUBaPaQ5NOEQBLM85G7k=;
Date: Tue, 29 Sep 2026 11:31:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: Re: [PATCH 2/6] x86/pass-through: no locking around
 pt_irq_{create,destroy}_bind()
Message-ID: <aruFXXizfwCP3yG8@macbook.local>
References: <eb5925e4-2409-452c-8768-4ca6717eb156@suse.com>
 <92b0a72a-44df-424f-acbe-58d7167f1c4d@suse.com>
 <arOr69DIql2Mjnd7@macbook.local>
 <cc7da531-958b-4b03-9c0e-514d77ebb366@suse.com>
 <araKzmNyBCGWidBt@macbook.local>
 <dfbafb99-58cd-4be0-aa77-942c6fc916fd@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dfbafb99-58cd-4be0-aa77-942c6fc916fd@suse.com>

On Mon, Sep 28, 2026 at 02:50:41PM +0200, Jan Beulich wrote:
> On 25.09.2026 16:53, Roger Pau Monné wrote:
> > On Thu, Sep 24, 2026 at 11:57:19AM +0200, Jan Beulich wrote:
> >> On 23.09.2026 12:37, Roger Pau Monné wrote:
> >>> On Tue, Sep 08, 2026 at 03:01:51PM +0200, Jan Beulich wrote:
> >>>> The questionable use of pcidevs_lock() there was discussed more than once.
> >>>> It really is pointless: The functions synchronize primarily via the per-
> >>>> domain event lock. They also may already be called with the global PCI
> >>>> devices lock not held: See hvm/vmsi.c:vpci_msi_update(),
> >>>> hvm/vmsi.c:vpci_msi_arch_update(), and hvm/vmsi.c:vpci_msi_disable().
> >>>>
> >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>>
> >>>> --- a/xen/arch/x86/domctl.c
> >>>> +++ b/xen/arch/x86/domctl.c
> >>>> @@ -636,10 +636,7 @@ long arch_do_domctl(
> >>>>              ret = -EPERM;
> >>>>          else if ( is_iommu_enabled(d) )
> >>>>          {
> >>>> -            pcidevs_lock();
> >>>>              ret = pt_irq_create_bind(d, bind);
> >>>> -            pcidevs_unlock();
> >>>
> >>> pt_irq_create_bind() might call into msixtbl_pt_register() which
> >>> requires either the pcidevs_lock() or the per-domain d->pci_lock lock
> >>> to be taken, which I think is not the case in the context here?
> >>
> >> Hmm, indeed. Not having seen the assertion there trigger kind of worries
> >> me a little. Do you agree that the change to vioapic_hwdom_map_gsi() can,
> >> otoh, be left as is?
> > 
> > Hm, I'm borderline on that one - I can't find a path where d->pci_lock
> > will be needed for legacy PCI interrupt binding, yet at the same time
> > I feel it would be better if the locking context is uniform across
> > call sites.  I guess I'm fine with the asymmetric locking context if
> > that's your preference.  Maybe worth a mention in a comment somewhere.
> 
> Maybe it's best if I get v2 out before we settle on this. The need for a
> comment may, with how v2 is done, go away. E.g. the first of the hunks
> now is
> 
> @@ -637,9 +637,13 @@ long arch_do_domctl(
>              ret = -EPERM;
>          else if ( is_iommu_enabled(d) )
>          {
> -            pcidevs_lock();
> +            if ( bind->irq_type == PT_IRQ_TYPE_MSI )
> +                read_lock(&d->pci_lock);
> +
>              ret = pt_irq_create_bind(d, bind);
> -            pcidevs_unlock();
> +
> +            if ( bind->irq_type == PT_IRQ_TYPE_MSI )
> +                read_unlock(&d->pci_lock);
>  
>              if ( ret < 0 )
>                  printk(XENLOG_G_ERR "pt_irq_create_bind failed (%ld) for %pd\n",

Binding an unbinding is an expensive operation.  The legacy PCI
interrupt bindings are done only once when the device is assigned to a
domain, and afterwards all calls to XEN_DOMCTL_bind_pt_irq should be
for MSI interrupts.  I don't think taking the lock unconditionally
would be that bad, the extra penalty for the one-shot PCI legacy
binding is possibly likely fine if we can remove one conditional?

> While it's only a read-lock now, effects on parallelism aren't as bad
> anymore. Yet still I'm rather hesitant to acquire a lock when there's no
> need for doing so. In the case here we'd still impact any write-lock
> paths, i.e. first and foremost vpci_write().

It's unlikely (albeit not impossible) to have both
XEN_DOMCTL_bind_pt_irq hypercalls and vPCI against the same domain.
Either the domain uses vPCI for passthrough or it uses an external
device model IMO.

> There's possibly another somewhat related issue: vpci_read() only uses
> read_lock(), yet reads can in principle have side effects. Are we (once
> again) building upon Dom0 knowing what it's doing, and this - like many
> other aspect - being in need of auditing before DomU supported can be
> declared complete?

The point of taking d->pci_lock in write mode is to prevent accesses
to any pdevs assigned to the domain, so that the position of BARs
across any devices assigned to a domain cannot change as we have to
check for overlaps.  However for other accesses we so far have no need
to cross check like this against all devices assigned to a domain, and
hence just taking the pdev->vpci->lock (so a per-device lock) is
possibly enough, as per-device accesses are still serialized?

Thanks, Roger.

