Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADE9FD45F9
	for <xen-devel@archiver.kernel.org>; Wed, 25 Feb 2026 23:55:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1241134.1542316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvOiT-0001gJ-4S; Wed, 25 Feb 2026 23:54:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241134.1542316; Wed, 25 Feb 2026 23:54:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvOiT-0001gA-1M; Wed, 25 Feb 2026 23:54:53 +0000
Received: by outflank-mailman (input) for mailman id 1241134;
 Wed, 25 Feb 2026 23:54:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Asp=A5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vvOiQ-0001g2-Vk
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 23:54:51 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5afe18f1-12a5-11f1-9ccf-f158ae23cfc8;
 Thu, 26 Feb 2026 00:54:43 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8338760053;
 Wed, 25 Feb 2026 23:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1947EC116D0;
 Wed, 25 Feb 2026 23:54:40 +0000 (UTC)
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
X-Inumbo-ID: 5afe18f1-12a5-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772063682;
	bh=yPy12zc4UT/9IGd37Ke3EDqkNAhEgrZTHrp39HK2zhQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nfDQHxIwRzrEunr5AtByS7RhUbrmAhX2uD9PMvTbuP8539ydakB4Pc/T+CKxDb2SH
	 JkjBGnc96c6lkSYpSkjiAznOHedirpSIfbNRAOOIRGr9XQlYyQx6uTSinW2z/iVWnM
	 sOUaEJiah9MAmV3coDNGTAZdwXSJbGl0Vtj/rAGKTLCQ4vegIRtws8WaTmPVBw4gr8
	 z20m1uFDjUNdmd0Ukh/n9RtcBFNeWkb7EAkffiR/4BiiM/8CkoxjbyVBHgWfnelMco
	 ObGLgyoHDdJRVFUctEDf0jpARJZlUBhoZkhbsAifit0vCM8hCrhDSaXgp6u82TGTTQ
	 a4aUFxjMkQTZA==
Date: Wed, 25 Feb 2026 15:54:35 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: anthony.perard@vates.tech
cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, 
    andrew.cooper3@citrix.com, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org
Subject: Re: [PATCH v5] xen/domain: introduce DOMID_ANY
In-Reply-To: <alpine.DEB.2.22.394.2602170731160.359097@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2602251553270.1536420@ubuntu-linux-20-04-desktop>
References: <20260205235126.3764953-1-dmukhin@ford.com> <alpine.DEB.2.22.394.2602170731160.359097@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Anthony, we need to tools ack for this patch

On Tue, 17 Feb 2026, Stefano Stabellini wrote:
> On Thu, 5 Feb 2026, dmukhin@ford.com wrote:
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
> > Amends: 2d5065060710 ("xen/domain: unify domain ID allocation")
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> 
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 

