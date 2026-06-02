Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFA8CD6E55
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2026 00:17:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1324290.1589912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUCoa-0006rb-2P; Tue, 02 Jun 2026 00:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324290.1589912; Tue, 02 Jun 2026 00:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUCoZ-0006rU-W7; Tue, 02 Jun 2026 00:17:03 +0000
Received: by outflank-mailman (input) for mailman id 1324290;
 Tue, 02 Jun 2026 00:17:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wUCoY-0006rG-QM
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 00:17:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUCoY-001jEH-7F
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 02:17:02 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a1e20e3-e002-0a2a0a5209dd-0a2a4505c834-18
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 02:17:02 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a1e20fc-aaa8-0a2a45050019-aceafc1fa816-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 02:17:02 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 39ADE41A47;
 Tue,  2 Jun 2026 00:17:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B14C91F00893;
 Tue,  2 Jun 2026 00:16:59 +0000 (UTC)
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
	s=k20260515; t=1780359420;
	bh=BJxsBqAi8+VE+3mmq5Wh+HjFYd6vHIoCh0n2ee9RFSY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Y57Pcu7X59VJumaOVsghTCEpfYoQ3FQlWauIZQM4V223rVVYrAZjLe+WH1akmDVFA
	 3rkQ5yAeYXF7MXt02slHxiVjdQoqH1gPcWmQ/maAJW+oLiUSpWgnZpELTkOduu2Y3R
	 VA3HEv4eoaLU2laMlYxtrB6mywkM+G9VgqTZfFXnFYHB/5PZ7587gLRfmNsv7vMM+g
	 nceBpl0TMlNh77Z0NTKgfovzs7/r8I9mam1Up8flBLrfuaT3wIeRKai3GqkqE5CHiq
	 m/IYM3KZUTpHWYDJYtwN7nvK7GA5HRtwncpqguIbgFc8H4TJujWvULJe6lPrrCkPg1
	 RrOhmcSz7gS4Q==
Date: Mon, 1 Jun 2026 17:16:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@ford.com
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    christopher.w.clark@gmail.com, dpsmith@apertussolutions.com, 
    Mykola Kvach <mykola_kvach@epam.com>
Subject: Re: [PATCH v3 3/6] argo: drop argo prefix from argo_dprintk()
 calls
In-Reply-To: <20260526215823.1452619-4-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2606011716380.550703@ubuntu-linux-20-04-desktop>
References: <20260526215823.1452619-1-dmukhin@ford.com> <20260526215823.1452619-4-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-c201ff/1780359422-DB16D443-F9E7D2BC/0/0
X-purgate-type: clean
X-purgate-size: 464

On Tue, 26 May 2026, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> argo_dprintk() prefixes all log lines with "argo: " automatically.
> 
> Remove duplicate prefixes from log messages in the Argo module where
> applicable.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>

I meant review-by, so resending my reply

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

