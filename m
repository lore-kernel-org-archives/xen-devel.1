Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6AB606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 15:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=40aNsRgw
Received: from list by lists.xenproject.org with outflank-mailman.1463429.1674317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM5hq-0003Ti-Du; Wed, 28 Oct 2026 15:36:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463429.1674317; Wed, 28 Oct 2026 15:36:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM5hq-0003Tb-BT; Wed, 28 Oct 2026 15:36:50 +0000
Received: by outflank-mailman (input) for mailman id 1463429;
 Wed, 28 Oct 2026 15:36:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xM5ho-0003TN-HG
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 15:36:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xM5ho-00000000gHc-25mD;
 Wed, 28 Oct 2026 15:36:48 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xM5hn-00000009ZFs-3vYd;
 Wed, 28 Oct 2026 15:36:48 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=KSYyiEkb3HRvGWRoSzNKtIyaBWL4LjRnypc2Pf5Vodc=; b=40aNsRgwimd2KU4clov4dEsRIX
	nx+HEsxaGaycGF6Lq8y+mSm7BQPeWEjTF+tMo16rAndjwMnsRHFkqeHryg9N35Pi7Z2oL6DoG1A6R
	i6ESP7AbDqPaN6FSaAa0HBFkbsDDx6zHakwqn06YSfeIrJ1/yYAGW3Bc382lAf3JEq/c=;
Date: Wed, 28 Oct 2026 16:36:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: Re: [PATCH v2 1/5] x86/pass-through: alter locking around
 pt_irq_{create,destroy}_bind()
Message-ID: <auIWjQ9hXuHFHwJb@Mac.lan>
References: <e34484a9-03f8-40f7-8627-7d5e668dbd63@suse.com>
 <e3f82d25-42b1-467b-93b7-902bf6c1bf15@suse.com>
 <auIHqfrpdFnmgoMq@Mac.lan>
 <3bd58966-9ca8-484f-acb8-cda56df565a6@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3bd58966-9ca8-484f-acb8-cda56df565a6@suse.com>
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 04:21:15PM +0100, Jan Beulich wrote:
> On 28.10.2026 15:33, Roger Pau Monné wrote:
> > On Wed, Sep 30, 2026 at 01:42:29PM +0200, Jan Beulich wrote:
> >> --- a/xen/arch/x86/hvm/vioapic.c
> >> +++ b/xen/arch/x86/hvm/vioapic.c
> >> @@ -197,8 +197,9 @@ static int vioapic_hwdom_map_gsi(unsigne
> >>          return ret;
> >>      }
> >>  
> >> -    pcidevs_lock();
> >> +    read_lock(&currd->pci_lock);
> >>      ret = pt_irq_create_bind(currd, &pt_irq_bind);
> >> +    read_unlock(&currd->pci_lock);
> > 
> > I think you need to extend the ->pci_lock'ed region so it also covers
> > unmap_domain_pirq(), otherwise the ASSERT_PDEV_LIST_IS_READ_LOCKED()
> > in there will trigger?  IE: the read_unlock() needs to be where the
> > pcidevs_unlock() is?
> 
> Oh, indeed. That would only be an issue if an error arose, so it's
> clear why I didn't hit that assertion.
> 
> This being the only change (which I've made locally) necessary for
> the entire series - shall I re-send, or would you mind giving an ack
> for the patch with said adjustment made?

I'm happy for you do do the change locally and commit:

Reviewed-by: Roger Pau Monné <roger@xenproject.org>

Thanks, Roger.

