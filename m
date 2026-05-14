Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63614CD37AC
	for <xen-devel@archiver.kernel.org>; Thu, 14 May 2026 01:16:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1308572.1579971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNKfm-0008Q0-4A; Thu, 14 May 2026 01:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308572.1579971; Thu, 14 May 2026 01:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNKfl-0008Ps-VI; Thu, 14 May 2026 01:15:33 +0000
Received: by outflank-mailman (input) for mailman id 1308572;
 Thu, 14 May 2026 01:15:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wNKfl-0008Pm-5c
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 01:15:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNKfk-00FiAu-Ix
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 03:15:32 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a05219e-2eae-0a2a0a5409dd-0a2a4508e5b2-42
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 03:15:32 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a052233-63b5-0a2a45080019-ac6904fedd78-3
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 03:15:32 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0307660052;
 Thu, 14 May 2026 01:15:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59FBBC19425;
 Thu, 14 May 2026 01:15:30 +0000 (UTC)
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
	s=k20201202; t=1778721330;
	bh=t5sjd5h7AhqCHvVTGxpv77qD10NFeCmZNyaIOsigFEo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XY/7cH7CDop3NhMxmyZz8HzJ7yo6jP8EL77u2LyCfOe+Xzn0DGVHhebivc1BfPg6W
	 xXtsNpSMGDi775RwTcN8TNgLZDJA9JwUxE9sR/2mk4FyC46a8uwdSsT5aMnVlNprN+
	 O1RfQx1NV9UQl73zhWnZQfFdcEpr1p6ebaQAwlWrfBwJ5daN1mo9w+h7qb+kORgsiK
	 sRCfZTNDPCY8VuS0V33cJ58/PLZEKIO1IJxord3N3lmIWJ4mw+6UJDk6o+obtp+WOX
	 Tm5v2eBXfoGtQfhklh623ILwgdglZppI5uMvz/i1YMb1TxxJavC3npqdQAlKs/ovtg
	 2cdAzDtvhOBAw==
Date: Wed, 13 May 2026 18:15:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: xen-devel@lists.xenproject.org, Denis Mukhin <dmukhin@ford.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v2 1/4] xen/public: introduce DOMID_ANY
In-Reply-To: <20260429120619.1013440-2-jgross@suse.com>
Message-ID: <alpine.DEB.2.22.394.2605131815190.3930@ubuntu-linux-20-04-desktop>
References: <20260429120619.1013440-1-jgross@suse.com> <20260429120619.1013440-2-jgross@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-c1860d/1778721332-C4E78DB1-B2C6B2D4/0/0
X-purgate-type: clean
X-purgate-size: 386

On Wed, 29 Apr 2026, Juergen Gross wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Add DOMID_ANY to xen/include/public/xen.h meant to be a wildcard for
> domids.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

