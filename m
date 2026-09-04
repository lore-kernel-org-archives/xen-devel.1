Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B918CC624D3
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 10:35:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408144.1640822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2RFv-0003ak-Bo; Fri, 04 Sep 2026 10:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408144.1640822; Fri, 04 Sep 2026 10:34:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2RFv-0003ad-8x; Fri, 04 Sep 2026 10:34:47 +0000
Received: by outflank-mailman (input) for mailman id 1408144;
 Fri, 04 Sep 2026 10:34:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x2RFu-0003aX-FG
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 10:34:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x2RFp-005Byc-1n;
 Fri, 04 Sep 2026 10:34:41 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x2RFn-00691q-2j;
 Fri, 04 Sep 2026 10:34:40 +0000
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
	bh=+WrzhoduP1bP6kQ8Lwg20f+ZXsuoOWUee0/yquDukw0=; b=40UD1XPxdhaAjx4kZTNkJrRbOb
	eQ6r1NVU88MzVRaUoCPx0Pqh+4bcLnA0IPb9SW09wHTEg/B8VvhTtVa3RTTCvtq+c7sw+36jUEWu+
	UcsM9HNWcMVNag+efU3TGNdzJIULtHCoC8slqEp0TeHI7gx1rOJqfimtRA6RAaL+amTg=;
Date: Fri, 4 Sep 2026 12:34:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: George Dunlap <dunlapg@umich.edu>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Alejandro Vallejo <agarciav@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v2 03/14] x86/pv: use populate_perdomain_mapping() to map
 the Xen GDT
Message-ID: <apqevSM60s2g-mtE@macbook.local>
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
 <20260901-asi-part2-3-ecc269f268b7@xenproject.org>
 <554687e3-1fab-4d23-9a4e-0bdc3bc1fc60@suse.com>
 <CAFLBxZYqOWkd60As00ytcNqTZg99Gu220OMrse5MXYgOHfx0Pw@mail.gmail.com>
 <07d332a4-a5a3-44d4-95ce-fc67d86edacf@suse.com>
 <050f44ec-47e5-4754-b73b-1173458736b0@suse.com>
 <CAFLBxZZ+-GsTLDMoiBpAda6U-T-M70wHjAK9EqKZCZdK2VAknw@mail.gmail.com>
 <f413cc9c-cef5-4f85-b232-15e3c64f2a45@suse.com>
 <CAFLBxZY=37WMc2+7Sc8zRSFcLCe5RdAwsPuyKUpMrQm87kvPeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFLBxZY=37WMc2+7Sc8zRSFcLCe5RdAwsPuyKUpMrQm87kvPeg@mail.gmail.com>

On Fri, Sep 04, 2026 at 09:50:02AM +0100, George Dunlap wrote:
> On Fri, Sep 4, 2026 at 9:29 AM Jan Beulich <jbeulich@suse.com> wrote:
> > > your position here is really inconsistent:  You wave
> > > away a partial pagetable walk with three map/unmap operations on the
> > > context switch path as something we'll have to do in the interim, and
> > > can optimize later, but are now threatening to make me add in
> > > special-case codepaths and run tests to save a few memory reads and
> > > shifts.
> >
> > I think you misunderstood. There was a concern raised already on v1,
> > and that concern wasn't covered by the patch description. In my initial
> > reply I said "Functionally the change looks okay to me" for a reason,
> > after all.
> 
> To quote Andy's mail:
> 
> <<<
> 
> So what this patch is doing is still keeping the double copy (the
> fragility) but reintroducing the expensive part of the operation into
> the context switch path.  If you can't keep it being L1e, there's
> probably no point keeping the optimisation at all.
> 
> >>>
> 
> Basically what I took from this is;
> 
> - Andy thinks stashing any intermediate form (whether L1E or MFN) has
> a technical cost (two copies that could potentially go out of sync,
> thus "fragility")
> 
> - Andy thinks that the expensive part of the conversion is the MFN ->
> L1E conversion, not the vaddr -> MFN conversion

We later discussed this, and the assumption was that the expensive
part was the vaddr -> MFN translation, as that's where PDX is
involved.  I expect crafting a PTE shouldn't be expensive at all, but
maybe there's something I'm missing here.

The original patch cached the MFN in an attempt to not remove the
optimization, because my understanding was that the possible expensive
part was the PDX translation.  Then again I don't have real
measurements to back up any of the claims above, and hence it might
all be plain wrong.

Regards, Roger.

