Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5CFF94CB3
	for <xen-devel@archiver.kernel.org>; Tue, 21 Apr 2026 22:17:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1289511.1569445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFJPL-0000g7-Mi; Tue, 21 Apr 2026 22:17:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289511.1569445; Tue, 21 Apr 2026 22:17:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFJPL-0000g0-K1; Tue, 21 Apr 2026 22:17:27 +0000
Received: by outflank-mailman (input) for mailman id 1289511;
 Tue, 21 Apr 2026 22:17:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wFJPK-0000IM-Ml
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 22:17:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFJPH-00FslP-TK
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 00:17:23 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69e7f6ec-5cb7-0a2a0a5109dd-0a2a450285d8-48
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 00:17:23 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69e7f772-af86-0a2a45020019-aceafc1fa924-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 00:17:23 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C9D7C4027F;
 Tue, 21 Apr 2026 22:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B88C2BCB0;
 Tue, 21 Apr 2026 22:17:21 +0000 (UTC)
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
	s=k20201202; t=1776809841;
	bh=xn3A0NuiXervtpsnojkWIHY+IxM7mxFsV2qRaCcwuBw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KtkGvelEDf1hG0x8PyI9REg7xzzQaxMRvWbeJOoOnx1VK9XlOV/dnFn9qBOFQSmRX
	 9JqSmfS+j1Tu48/gjLu+/w1V0p0eEfX0H4KYeJ/RfGnktJ7aCGn/8Kfe6fTif0YHmF
	 ry2VzX72a4Bo7ZmGOZKA8dhKg481w6hqJDtc6Lnr7pFwWsiRau27MzI9eTNPyTZKKU
	 XREwupqJbtttt/HVlvxSP8TGrrFKd3ruUgd+hBE5tMEXJHtLQwzdi5AiDJAOVMWcuR
	 sHuxp1PTJgo8GdYDOHO4Yel17ObEmwI/zQMuGDtDnDP+w87Qtpsr3IeWXGczP8a4q1
	 fCYMiFIscQ/Jg==
Date: Tue, 21 Apr 2026 15:17:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Gyujeong Jin <wlsrbwjd7232@gmail.com>
Subject: Re: [PATCH 1/6] xen/dt-overlay: fix double-free of rangesets on
 attach failure
In-Reply-To: <A0CD5D33-67D7-4A69-A5C3-C7C37F72830C@arm.com>
Message-ID: <alpine.DEB.2.22.394.2604211517140.2712345@ubuntu-linux-20-04-desktop>
References: <20260415113700.107915-1-michal.orzel@amd.com> <20260415113700.107915-2-michal.orzel@amd.com> <A0CD5D33-67D7-4A69-A5C3-C7C37F72830C@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-720697/1776809843-82B68161-A53F0E86/0/0
X-purgate-type: clean
X-purgate-size: 1002

On Wed, 15 Apr 2026, Luca Fancellu wrote:
> Hi Michal,
> 
> > On 15 Apr 2026, at 12:36, Michal Orzel <michal.orzel@amd.com> wrote:
> > 
> > handle_attach_overlay_nodes() destroys the IRQ and IOMEM rangesets on
> > failure but leaves the pointers dangling in the tracker entry. A
> > subsequent handle_remove_overlay_nodes() for the same overlay will call
> > rangeset_consume_ranges() on freed memory followed by a second
> > rangeset_destroy(), resulting in use-after-free and double-free.
> > 
> > NULL the pointers after rangeset_destroy() so that remove_nodes() and
> > handle_remove_overlay_nodes() skip the stale entries.
> > 
> > Fixes: 4c733873b5c2 ("xen/arm: Add XEN_DOMCTL_dt_overlay and device attachment to domains")
> > Reported-by: Gyujeong Jin <wlsrbwjd7232@gmail.com>
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> > ---
> 
> Looks ok to me
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

