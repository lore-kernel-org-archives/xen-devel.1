Return-Path: <SRS0=O1tB=FO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A1CC433FE
	for <xen-devel@archiver.kernel.org>; Thu, 10 Dec 2020 02:30:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED8FE23D20
	for <xen-devel@archiver.kernel.org>; Thu, 10 Dec 2020 02:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED8FE23D20
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.48923.86573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knBij-0003ox-Hd; Thu, 10 Dec 2020 02:30:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48923.86573; Thu, 10 Dec 2020 02:30:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knBij-0003oo-Dv; Thu, 10 Dec 2020 02:30:17 +0000
Received: by outflank-mailman (input) for mailman id 48923;
 Thu, 10 Dec 2020 02:30:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JUBE=FO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1knBih-0003oG-SB
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 02:30:15 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60240eae-14cd-464b-8292-29a1952fbf7a;
 Thu, 10 Dec 2020 02:30:15 +0000 (UTC)
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
X-Inumbo-ID: 60240eae-14cd-464b-8292-29a1952fbf7a
Date: Wed, 9 Dec 2020 18:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607567414;
	bh=ed5jc+mIWtIVT1XojWkam9DBGIYbXtUNab+lKWwMA+0=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=rM2ba7IaiEiImZuBlJeOxwdHw91iTBTmVndc3yYoAgoY5tvGV7iuyH8r8QnSIDGqP
	 Vw3UhK4WPUfROU/j4ASwNVahNwX7qt53OVL1KXDA07A1WyGtPdsI2SuXtb1hdrud6v
	 mBZzEGUeWPzZFpw94lGAnYaDrzqjNb9weF4nniROpfIIVWjjGS1w8Ufjh7YnufCwxt
	 QsetyxW/E7CqIkXt6LKQTQTuBalJtU16NHNKCXLsUvxjD7lEJdkKZbfiZRvcvsJUcR
	 dIqMPaOn4wY1MB6BrFou8eXG02slqkREBEONGv6tH9gytWUZhlqHO5FuueBp7TiW2W
	 51t4N9s/r0aTQ==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr <olekstysh@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Paul Durrant <paul@xen.org>, Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH V3 13/23] xen/ioreq: Use guest_cmpxchg64() instead of
 cmpxchg()
In-Reply-To: <e9ba97b2-01e4-f657-fceb-ccf4857e91c2@gmail.com>
Message-ID: <alpine.DEB.2.21.2012091750230.20986@sstabellini-ThinkPad-T480s>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com> <1606732298-22107-14-git-send-email-olekstysh@gmail.com> <alpine.DEB.2.21.2012091329480.20986@sstabellini-ThinkPad-T480s> <e9ba97b2-01e4-f657-fceb-ccf4857e91c2@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Dec 2020, Oleksandr wrote:
> > On Mon, 30 Nov 2020, Oleksandr Tyshchenko wrote:
> > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > 
> > > The cmpxchg() in ioreq_send_buffered() operates on memory shared
> > > with the emulator domain (and the target domain if the legacy
> > > interface is used).
> > > 
> > > In order to be on the safe side we need to switch
> > > to guest_cmpxchg64() to prevent a domain to DoS Xen on Arm.
> > > 
> > > As there is no plan to support the legacy interface on Arm,
> > > we will have a page to be mapped in a single domain at the time,
> > > so we can use s->emulator in guest_cmpxchg64() safely.
> > > 
> > > Thankfully the only user of the legacy interface is x86 so far
> > > and there is not concern regarding the atomics operations.
> > > 
> > > Please note, that the legacy interface *must* not be used on Arm
> > > without revisiting the code.
> > > 
> > > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > CC: Julien Grall <julien.grall@arm.com>
> > > 
> > > ---
> > > Please note, this is a split/cleanup/hardening of Julien's PoC:
> > > "Add support for Guest IO forwarding to a device emulator"
> > > 
> > > Changes RFC -> V1:
> > >     - new patch
> > > 
> > > Changes V1 -> V2:
> > >     - move earlier to avoid breaking arm32 compilation
> > >     - add an explanation to commit description and hvm_allow_set_param()
> > >     - pass s->emulator
> > > 
> > > Changes V2 -> V3:
> > >     - update patch description
> > > ---
> > > ---
> > >   xen/arch/arm/hvm.c | 4 ++++
> > >   xen/common/ioreq.c | 3 ++-
> > >   2 files changed, 6 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/xen/arch/arm/hvm.c b/xen/arch/arm/hvm.c
> > > index 8951b34..9694e5a 100644
> > > --- a/xen/arch/arm/hvm.c
> > > +++ b/xen/arch/arm/hvm.c
> > > @@ -31,6 +31,10 @@
> > >     #include <asm/hypercall.h>
> > >   +/*
> > > + * The legacy interface (which involves magic IOREQ pages) *must* not be
> > > used
> > > + * without revisiting the code.
> > > + */
> > This is a NIT, but I'd prefer if you moved the comment a few lines
> > below, maybe just before the existing comment starting with "The
> > following parameters".
> > 
> > The reason is that as it is now it is not clear which set_params
> > interfaces should not be used without revisiting the code.
> OK, but maybe this comment wants dropping at all? It was actual when the
> legacy interface was the part of the common code (V2). Now the legacy
> interface is
> x86 specific so I am not sure this comment should be here.

Yeah, fine by me.

 
> > 
> > With that:
> > 
> > Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Thank you


