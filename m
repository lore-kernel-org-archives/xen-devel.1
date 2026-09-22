Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C47C982FF
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 13:37:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428857.1651773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x90go-0002Xu-Mq; Tue, 22 Sep 2026 13:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428857.1651773; Tue, 22 Sep 2026 13:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x90go-0002Xn-Jr; Tue, 22 Sep 2026 13:37:42 +0000
Received: by outflank-mailman (input) for mailman id 1428857;
 Tue, 22 Sep 2026 13:37:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x90gn-0002Xd-7m
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 13:37:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x90gm-00B6Mr-1m;
 Tue, 22 Sep 2026 13:37:40 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x90gn-00FBgx-01;
 Tue, 22 Sep 2026 13:37:40 +0000
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
	bh=bBfMPPDgDvbZEKlPYABncFvyU5Uu7LoimSa/PokQfPo=; b=KtPJ0e+KF1ciHuB234M/KO484f
	TD1ZFtKqEtsPPaUislqqW04ZIwPW6NAo49aNDLvUECHT47gTMrUmZWjlzx947s+fozjr1HgTjYmuP
	cNIJWpVpj/X5FCIYDbFlkhadog7rn/3Q5kTCdryGoPjFL9nLeCRA4T+2JCpUlY7EWIhY=;
Date: Tue, 22 Sep 2026 15:37:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 1/6] x86/pass-through: defer event unlock in
 pt_irq_create_bind()
Message-ID: <arKEnIuApXKre4IF@macbook.local>
References: <eb5925e4-2409-452c-8768-4ca6717eb156@suse.com>
 <7618c144-2f4a-483c-b078-0d9100b9f251@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7618c144-2f4a-483c-b078-0d9100b9f251@suse.com>

On Tue, Sep 08, 2026 at 03:01:27PM +0200, Jan Beulich wrote:
> The radix tree holding struct pirq * as obtained by pirq_get_info() is
> protected by the domain's event lock. The result ("info") and the derived
> "pirq_dpci" therefore may not be de-referenced past the dropping of that
> lock. Moving the unlock down is safe, but perhaps not obviously so:
> - vector_hashing_dest() does a memory allocation, but core event channel
>   code does so too while holding the lock; the call to
>   vlapic_match_dest() doesn't involve any further locking,
> - hvm_migrate_pirq() operates on the corresponding IRQ descriptor, where
>   obtaining of its lock is of course fine (those locks always nest inside
>   the event lock),
> - {hvm,vmx}_pi_update_irte() are very similar to hvm_migrate_pirq()
>   locking-wise,
> - the locking around guest_mask_msi_irq() is the same as in the earlier
>   two bullet points.
> 
> As long as the PCI-devs lock is held around both
> pt_irq_{create,destroy}_bind(), this is only a latent issue.
> 
> Fixes: 35a1caf8b6b5 ("pass-through: update IRTE according to guest interrupt config changes")
> Fixes: 1066331913c9 ("passthrough: don't migrate pirq when it is delivered through VT-d PI")
> Fixes: 782cf8ba4678 ("pass-through: adjust pIRQ migration")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

> ---
> The last two unlocks could be done a little more efficiently, but then
> also in a little less straightforward a way:
> 
>         if ( pt_irq_bind->u.msi.gflags & XEN_DOMCTL_VMSI_X86_UNMASKED )
>         {
>             unsigned long flags;
>             struct irq_desc *desc = pirq_spin_lock_irq_desc(info, &flags);
> 
>             write_unlock(&d->event_lock);
> 
>             if ( !desc )
>             {
>                 pt_irq_destroy_bind(d, pt_irq_bind);
>                 return -EINVAL;
>             }
> 
>             guest_mask_msi_irq(desc, false);
>             spin_unlock_irqrestore(&desc->lock, flags);
>         }
>         else
>             write_unlock(&d->event_lock);
> 
>         break;

I think your proposed approach is easier to follow, I'm happy with it.

> 
> Seeing that the IRQ descriptor lock is taken up to three times in a row,
> I wonder whether we shouldn't consolidate this (by obtaining desc once and
> then passing it into hvm_migrate_pirq() (or a suitable new sibling
> thereof) and hvm_pi_update_irte()).

Possibly?  I haven't looked what would be the adjustment needed on
other callers.  Just passing the locked irq_desc?

Thanks, Roger.

