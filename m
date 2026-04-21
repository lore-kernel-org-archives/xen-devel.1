Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54589F94CB3
	for <xen-devel@archiver.kernel.org>; Tue, 21 Apr 2026 22:17:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1289513.1569454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFJPW-0000xi-UH; Tue, 21 Apr 2026 22:17:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289513.1569454; Tue, 21 Apr 2026 22:17:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFJPW-0000xb-QJ; Tue, 21 Apr 2026 22:17:38 +0000
Received: by outflank-mailman (input) for mailman id 1289513;
 Tue, 21 Apr 2026 22:17:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wFJPV-0000x3-LV
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 22:17:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFJPV-004wxQ-2Z
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 00:17:37 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69e7f77a-e002-0a2a0a5209dd-0a2a4505a99a-4
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 00:17:37 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69e7f77f-aaa8-0a2a45050019-aceafc1fbc22-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 00:17:36 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5415840ABC;
 Tue, 21 Apr 2026 22:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D01C2BCB0;
 Tue, 21 Apr 2026 22:17:34 +0000 (UTC)
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
	s=k20201202; t=1776809855;
	bh=vXU7Zt2l4M8G60BE1c8ZN9B628h/QdmUsGy42HqenXo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FNdtPAUoIer4gcLCjIByRdrBvDT6mt2BUhuh9N7PzxY3Bm6MNQblen6BwAv0C+wga
	 EWIpZR5P/KaWuWN2ETOoR7dM7HeumTUPg/2ywgYZHflZMNlTUF1q5XEdWBfarAdR/U
	 d1JZi3n17cyy/3YatGNfLk/CEVrhf0aUIw4nvgpZvNS0RYEr/jP61YgLMFMmJrD+Oo
	 MfFimqrNMYjjhTSxNxyF6yDH2L7ACDxpWIv7d3EgOSwyvY24rbpJcbU8MDGshz2vc4
	 M7jVq+yarMY0t2+R2dILVK0ZzIEn6ZUK1zYrWUtqqgcv1IA4ZuRGX4yIlQSLTFGDaj
	 5daxqncPX/U+g==
Date: Tue, 21 Apr 2026 15:17:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 2/6] xen/dt-overlay: fix rangeset leak and dead code in
 domctl path
In-Reply-To: <33C5577E-F6AE-4FC2-BE53-879BA4EB6198@arm.com>
Message-ID: <alpine.DEB.2.22.394.2604211517270.2712345@ubuntu-linux-20-04-desktop>
References: <20260415113700.107915-1-michal.orzel@amd.com> <20260415113700.107915-3-michal.orzel@amd.com> <33C5577E-F6AE-4FC2-BE53-879BA4EB6198@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-c201ff/1776809857-E8BAC443-83659651/0/0
X-purgate-type: clean
X-purgate-size: 939

On Wed, 15 Apr 2026, Luca Fancellu wrote:
> Hi Michal,
> 
> > On 15 Apr 2026, at 12:36, Michal Orzel <michal.orzel@amd.com> wrote:
> > 
> > handle_attach_overlay_nodes() unconditionally creates new rangesets
> > without checking whether they already exist from a prior attach. A
> > repeated attach for the same overlay leaks the original pair. Reject the
> > operation with -EEXIST if rangesets are already present.
> > 
> > Also, dt_overlay_domctl() early-returns -EOPNOTSUPP for any operation
> > other than ATTACH, making the if/else at the bottom unreachable. Remove
> > the dead branch.
> > 
> > Fixes: 4c733873b5c2 ("xen/arm: Add XEN_DOMCTL_dt_overlay and device attachment to domains")
> > Reported-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> > ---
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

