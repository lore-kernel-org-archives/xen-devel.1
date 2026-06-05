Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC0ACD6E7C
	for <xen-devel@archiver.kernel.org>; Fri,  5 Jun 2026 19:46:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1330013.1593854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVaUP-0003oG-Vd; Fri, 05 Jun 2026 19:45:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1330013.1593854; Fri, 05 Jun 2026 19:45:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVaUP-0003o9-Sq; Fri, 05 Jun 2026 19:45:57 +0000
Received: by outflank-mailman (input) for mailman id 1330013;
 Fri, 05 Jun 2026 19:45:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wVaUO-0003o3-Sl
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 19:45:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVaUO-00Eegb-5h
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 21:45:56 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a232756-e002-0a2a0a5209dd-0a2a4502bcce-6
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 21:45:56 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a232772-af86-0a2a45020019-ac6904fea748-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 21:45:55 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 4A2FB600AE;
 Fri,  5 Jun 2026 19:45:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62451F00893;
 Fri,  5 Jun 2026 19:45:53 +0000 (UTC)
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
	s=k20260515; t=1780688754;
	bh=Kk3yalXw/Zjb+ZFxw7VyA8/YZvJpX/XMO+CbkVa4MW8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=hQzNKRhrYkIKGwVWxP8KBbVVeKwG1UYVcZBgzB6nkPWe+hmvpt6mK9xl4bF3K+ciM
	 5p5coh1vIRnHhtFBy6X0YNncfXAvPcsyCQbbSZsxaS8hOHtz2Cy1MCaeecHXr5YGG4
	 rlS4JLiPu824H+0XMEVeAkcjp5ECI6DkMRUfWh3pEYgj4GWd4HwQux3BF7v4gL6pgB
	 /mRpyG4IWLJpqKTkkFXAsjZKkNf/4Myv0q7M8jmHxVyDdPUdbVhMaGa1faAjGNAIr5
	 DaYZ4zALLGtI9vUNH6pXBp9ZXPZnO6pE/cobXGCNYBsYQ+1MklhK2t0BllgLApbUor
	 qoFFJg14DML0Q==
Date: Fri, 5 Jun 2026 12:45:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@ford.com
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Juergen Gross <jgross@suse.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22 0/6] CI: Update distros for build tests
In-Reply-To: <aiMPqmCphM3RW8ol@kraken>
Message-ID: <alpine.DEB.2.22.394.2606051245450.3299@ubuntu-linux-20-04-desktop>
References: <20260605144213.2749656-1-andrew.cooper3@citrix.com> <aiMPqmCphM3RW8ol@kraken>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-720697/1780688756-80D7F161-2842E4E8/0/0
X-purgate-type: clean
X-purgate-size: 670

On Fri, 5 Jun 2026, dmukhin@ford.com wrote:
> On Fri, Jun 05, 2026 at 03:42:07PM +0100, Andrew Cooper wrote:
> > Refresh which distros we do build testing with
> > 
> > https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2579549654
> > 
> > Andrew Cooper (6):
> >   CI: Drop test-artefacts/Makefile
> >   CI: Swap ocaml-nox for ocaml in newer Debian/Ubuntu
> >   CI: Drop Ubuntu 16.04
> >   CI: Add Ubuntu 26.04
> >   CI: Update Fedora to 43
> >   CI: Update Opensuse 15.6 to 16.0
> 
> Please consider:
> 
> Reviewed-by: Denis Mukhin <dmukhin@ford.com> 
> 
> for the entire series.

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

