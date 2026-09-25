Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF93C9830D
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 14:53:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1434048.1654224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA7IV-0008Q7-23; Fri, 25 Sep 2026 14:53:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1434048.1654224; Fri, 25 Sep 2026 14:53:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA7IU-0008Q0-Un; Fri, 25 Sep 2026 14:53:10 +0000
Received: by outflank-mailman (input) for mailman id 1434048;
 Fri, 25 Sep 2026 14:53:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xA7IU-0008Pu-FA
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 14:53:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xA7IT-00HK5S-1q;
 Fri, 25 Sep 2026 14:53:09 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xA7IU-00E3ET-01;
 Fri, 25 Sep 2026 14:53:09 +0000
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
	bh=cKgd+tI4dxOZUQqh15UU0xyjZst2EIx2YSicB8gJbcI=; b=fkpxkoQuIHR0ZC/Ac26cY3edIr
	tySKk0IMRh1ATvBFCcv8dfWykJZ4h3VuVJtlGv3hioGrJpISWVWf47kN0/MuA81JHAOe31V62Dajf
	qlRrkrOEfJI9mXRZcB1MlrIlJyjHfAr+iEI9nidhKW3x0DqPnf2IgAHJ7/827xbVtcWA=;
Date: Fri, 25 Sep 2026 16:53:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: Re: [PATCH 2/6] x86/pass-through: no locking around
 pt_irq_{create,destroy}_bind()
Message-ID: <araKzmNyBCGWidBt@macbook.local>
References: <eb5925e4-2409-452c-8768-4ca6717eb156@suse.com>
 <92b0a72a-44df-424f-acbe-58d7167f1c4d@suse.com>
 <arOr69DIql2Mjnd7@macbook.local>
 <cc7da531-958b-4b03-9c0e-514d77ebb366@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc7da531-958b-4b03-9c0e-514d77ebb366@suse.com>

On Thu, Sep 24, 2026 at 11:57:19AM +0200, Jan Beulich wrote:
> On 23.09.2026 12:37, Roger Pau Monné wrote:
> > On Tue, Sep 08, 2026 at 03:01:51PM +0200, Jan Beulich wrote:
> >> The questionable use of pcidevs_lock() there was discussed more than once.
> >> It really is pointless: The functions synchronize primarily via the per-
> >> domain event lock. They also may already be called with the global PCI
> >> devices lock not held: See hvm/vmsi.c:vpci_msi_update(),
> >> hvm/vmsi.c:vpci_msi_arch_update(), and hvm/vmsi.c:vpci_msi_disable().
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>
> >> --- a/xen/arch/x86/domctl.c
> >> +++ b/xen/arch/x86/domctl.c
> >> @@ -636,10 +636,7 @@ long arch_do_domctl(
> >>              ret = -EPERM;
> >>          else if ( is_iommu_enabled(d) )
> >>          {
> >> -            pcidevs_lock();
> >>              ret = pt_irq_create_bind(d, bind);
> >> -            pcidevs_unlock();
> > 
> > pt_irq_create_bind() might call into msixtbl_pt_register() which
> > requires either the pcidevs_lock() or the per-domain d->pci_lock lock
> > to be taken, which I think is not the case in the context here?
> 
> Hmm, indeed. Not having seen the assertion there trigger kind of worries
> me a little. Do you agree that the change to vioapic_hwdom_map_gsi() can,
> otoh, be left as is?

Hm, I'm borderline on that one - I can't find a path where d->pci_lock
will be needed for legacy PCI interrupt binding, yet at the same time
I feel it would be better if the locking context is uniform across
call sites.  I guess I'm fine with the asymmetric locking context if
that's your preference.  Maybe worth a mention in a comment somewhere.

> In turn I will then extend patch 3 to also tighten the assertions in
> msixtbl_pt_{,un}register(), as each of them has only this one call site.
> Would you mind indicating whether in doing so I may retain you A-b there?

Please keep the A-b there.

Thanks, Roger.

