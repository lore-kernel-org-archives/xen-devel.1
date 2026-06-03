Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDFAECD6E57
	for <xen-devel@archiver.kernel.org>; Wed,  3 Jun 2026 01:42:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1325560.1590905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUacC-00038C-Qp; Wed, 03 Jun 2026 01:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325560.1590905; Wed, 03 Jun 2026 01:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUacC-00037z-Kd; Wed, 03 Jun 2026 01:41:52 +0000
Received: by outflank-mailman (input) for mailman id 1325560;
 Wed, 03 Jun 2026 01:41:51 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wUacB-00037t-B1
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 01:41:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUacA-004mis-G8
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 03:41:50 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a1f863e-5cb7-0a2a0a5109dd-0a2a450ba794-14
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 03:41:50 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a1f865d-212f-0a2a450b0019-ac6904fed0b8-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 03:41:49 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 5E0F060208;
 Wed,  3 Jun 2026 01:41:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF42B1F00898;
 Wed,  3 Jun 2026 01:41:47 +0000 (UTC)
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
	s=k20260515; t=1780450908;
	bh=4VkB5kc3PN84M5JMJ/MIzDthVmbG3h6t64cl1Hk3kTE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=YytALTjDOod/BeokbH9WLm6Uh3fBHOjA3SKuFa5fPJyu3yKfWM+Fk8p51JP/2b9ge
	 shdpWpicgocamF29uyll8w1hDMnWRTcRhX9YGqgVd6HRYQ2bKqqycbwlg2cN1x2VJg
	 tGoFgFPUBundy9FMk8tu5PZEIJ6623G+U8XwLOsW4gVhvemzV0m+CJIkhvEUGfjG/g
	 u8O1VWJrwYuXdiJcWZW0AhLRV1WHjf6T7aG5WmFrSxlDev0hJTGvMu+MTmYBkCos09
	 OaJwk5KCJykM9TfuKtghPFGMD/+kiSxMV+Kxa3xOs1iOcsdjbwR9Rqmv51EqR/dhlT
	 VflUlLq6PWK2A==
Date: Tue, 2 Jun 2026 18:41:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stewart Hildebrand <stewart.hildebrand@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] vPCI: resolve MISRA R10.1 boolean arithmetic type
 violation
In-Reply-To: <62abdafd-a49c-46e0-b529-0646a8d2425a@suse.com>
Message-ID: <alpine.DEB.2.22.394.2606021840110.550703@ubuntu-linux-20-04-desktop>
References: <e23266191a366abe66d8104783d97578aa8734a4.1779428826.git.dmytro_prokopchuk1@epam.com> <984c91b8-3d2c-4431-bdf1-4a333ac341d1@suse.com> <alpine.DEB.2.22.394.2605261508390.182011@ubuntu-linux-20-04-desktop>
 <62abdafd-a49c-46e0-b529-0646a8d2425a@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-42698a/1780450910-20678F3B-68DE4BF8/0/0
X-purgate-type: clean
X-purgate-size: 2537

On Tue, 2 Jun 2026, Jan Beulich wrote:
> On 27.05.2026 00:12, Stefano Stabellini wrote:
> > On Fri, 22 May 2026, Jan Beulich wrote:
> >> (extending Cc list)
> >>
> >> On 22.05.2026 08:13, Dmytro Prokopchuk1 wrote:
> >>> --- a/xen/drivers/vpci/header.c
> >>> +++ b/xen/drivers/vpci/header.c
> >>> @@ -586,7 +586,7 @@ static void cf_check bar_write(
> >>>          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
> >>>              gprintk(XENLOG_WARNING,
> >>>                      "%pp: ignored BAR %zu write while mapped\n",
> >>> -                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
> >>> +                    &pdev->sbdf, bar - pdev->vpci->header.bars + (hi ? 1 : 0));
> >>>          return;
> >>>      }
> >>>  
> >>> @@ -647,7 +647,7 @@ static void cf_check guest_mem_bar_write(const struct pci_dev *pdev,
> >>>          if ( guest_addr != bar->guest_addr )
> >>>              gprintk(XENLOG_WARNING,
> >>>                      "%pp: ignored guest BAR %zu write while mapped\n",
> >>> -                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
> >>> +                    &pdev->sbdf, bar - pdev->vpci->header.bars + (hi ? 1 : 0));
> >>>          return;
> >>>      }
> >>>      bar->guest_addr = guest_addr;
> >>
> >> Well. If I'm not mistaken we had discussed situations like this (long ago).
> >> Imo the added verbosity gets in the way of readability. If we absolutely
> >> cannot or don't want to deviate such constructs (of which I expect we have
> >> more), then we ought to consider alternatives (like changing the variables'
> >> types in the case here).
> >>
> >> As to deviating: rules.rst, according to my reading, says that &, |, ^, or
> >> shifts would be okay to use with a bool operand. What's wrong with also
> >> permitting this for other operators?
> > 
> > In my opinion, if we are going to treat bool as its own type, it makes
> > sense not to silently mix bools into arithmetic with int types. I also
> > do not find this patch less readable -- I actually find it more
> > readable, since it makes it more obvious that hi is a bool.
> 
> Well, okay, we have different opinions there. This reply of yours applies
> to the first paragraph of my earlier reply though, despite its placement.
> What about the aspect mentioned in the second paragraph?

You mean "then we ought to consider alternatives (like changing the
variables' types in the case here)" ?

Other alternatives could be OK, but also this patch as-is is OK to me.

