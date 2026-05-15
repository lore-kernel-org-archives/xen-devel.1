Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB89BCD343F
	for <xen-devel@archiver.kernel.org>; Fri, 15 May 2026 21:26:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1310557.1581397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wO02X-00067G-D9; Fri, 15 May 2026 21:25:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1310557.1581397; Fri, 15 May 2026 21:25:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wO02X-000679-A6; Fri, 15 May 2026 21:25:49 +0000
Received: by outflank-mailman (input) for mailman id 1310557;
 Fri, 15 May 2026 21:25:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wO02W-000673-GD
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 21:25:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wO02V-001VIl-RL
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 23:25:47 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a078f5b-2eae-0a2a0a5409dd-0a2a4504c264-0
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 23:25:47 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a078f5a-1dec-0a2a45040019-ac6904fedd2e-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 23:25:47 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 433F5601DD;
 Fri, 15 May 2026 21:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F035C2BCB0;
 Fri, 15 May 2026 21:25:45 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778880346;
	bh=GhW4Dk2BgygGXnxKS9gHnxr20HQ2i5f7n46m6kjDIEk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=t+qUiEUEkNnz2SZyftvVKlnyhn5hFUtZo4glrBGv83wT4DxIpRAazqVPnyZLzmA30
	 zYy5ielb0nGV0LBSpJ8JGMPPukToEup398D/P5eTBrxs4h+w2NmvpuJidiW8Pgqz00
	 dSRM24lOhccSg+Wsj/MUfV2eBMwirT2V3SaJAFB8f/K2Q78n74Opbs6xlcrDhD5y4/
	 qPJh8sMgVGgc8jqRk2wN5twAiCUoDHyfMrENFbmdP0OQkC2XQCxwYueLB0FnDzkYGE
	 LvjZQNjdWRbPacm1W7cOBbrX5rv7N2SsY+NKgbUUet+5qs8HF8AcmCq/w5AOzY1uDm
	 oUw1HWM1JiLbw==
Date: Fri, 15 May 2026 14:25:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, 
    andrew.cooper3@citrix.com, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    anthony.perard@vates.tech
Subject: Re: [PATCH v8] xen/domain: introduce DOMID_ANY
In-Reply-To: <1778680300.8631fc262581453bbf619ec5b2062170.19e219b849d000f373@vates.tech>
Message-ID: <alpine.DEB.2.22.394.2605151424030.52999@ubuntu-linux-20-04-desktop>
References: <20260507202840.293269-1-dmukhin@ford.com> <1778680300.8631fc262581453bbf619ec5b2062170.19e219b849d000f373@vates.tech>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-ebf023/1778880347-2BD6C3FF-C6A3EBE2/0/0
X-purgate-type: clean
X-purgate-size: 1572

This patch has been around for a long time and has gone through the
ci-loop multiple times. I think it is low risk.

Oleksii, can we have a release ack for this?


On Wed, 13 May 2026, Anthony PERARD wrote:
> On Thu, May 07, 2026 at 01:28:40PM -0700, dmukhin@ford.com wrote:
> > From: Denis Mukhin <dmukhin@ford.com> 
> > 
> > Add a new symbol DOMID_ANY to improve the readability of the code.
> > 
> > Update all relevant domid_alloc() call sites and harden the domid_alloc()
> > input value check.
> > 
> > Also, fix problem with passing invalid domain IDs in
> > XEN_DOMCTL_createdomain: turns out libxl__domain_make() (toolstack)
> > uses 0xffff as domain ID.
> > 
> > Fix failing tools tests too.
> > 
> > Amends: 2d5065060710 ("xen/domain: unify domain ID allocation")
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v7:
> > - aligned the DOMID_ANY comment with another patch sent separately to
> >   unblock xenstore series: https://lore.kernel.org/xen-devel/20260429120619.1013440-2-jgross@suse.com/
> > - added fixups to mem-claim, paging-mempool, resource and tsx tests.
> > - Link to v7: https://lore.kernel.org/xen-devel/20260408234046.1314021-1-dmukhin@ford.com/
> > - Link to full CI: https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/2508345752
> 
> For the tools part:
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
> 
> Thanks,
> 
> 
> --
> Anthony Perard | Vates XCP-ng Developer
> 
> XCP-ng & Xen Orchestra - Vates solutions
> 
> web: https://vates.tech

