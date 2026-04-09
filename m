Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE2910FC465
	for <xen-devel@archiver.kernel.org>; Thu,  9 Apr 2026 01:43:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1276634.1561993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAeQ9-0000al-4h; Thu, 09 Apr 2026 01:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276634.1561993; Thu, 09 Apr 2026 01:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAeQ9-0000ae-1s; Thu, 09 Apr 2026 01:43:01 +0000
Received: by outflank-mailman (input) for mailman id 1276634;
 Thu, 09 Apr 2026 01:43:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wAeQ8-0000aY-2z
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 01:43:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAeQ6-007il5-9Z
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 03:42:58 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69d703bc-e002-0a2a0a5209dd-0a2a4505a344-38
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 03:42:58 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <sstabellini@kernel.org>)
 id 69d70421-3760-0a2a45050019-ac6904feddd6-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 03:42:58 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8D41F600AD;
 Thu,  9 Apr 2026 01:42:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805F3C19421;
 Thu,  9 Apr 2026 01:42:55 +0000 (UTC)
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
	s=k20201202; t=1775698976;
	bh=IDbGrUYW1qx3z77VZ3kqZ5LKwaE7kx9+w/skuTHAltM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XybisJgRQ3EAAJXHnGoEZDOt4Fk6mszHaP69xkbaVBwYl1b/wU6Hu8qlEhgV6PQRj
	 E4j9fcEXSE/yjjpniPaD3AzRK/DDAVzpODFsyVba15BXImQyvrAp8PSHXffLdOlDVJ
	 dJ1IRR0RwDySXrx64m74/nBRQu+ffvlPFhEncYwuYTndF2/ot6iu9sxZsaWJtRXFRT
	 UUcfrJ+GmZiOmWfgCwCcPGxPTjazub1hHOjXs1mgpraq6D4qaduJ/8Loyyqhv7O7C5
	 3jWItOzyjRtif4nvTGB6i9zg/rowMPQTxb7nBO46BE7esdxFBsJCCfmpdbSoJOrT14
	 gi6PaQ/ZB0tqg==
Date: Wed, 8 Apr 2026 18:42:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: GuoHan Zhao <zhaoguohan@kylinos.cn>
cc: jgross@suse.com, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xen/manage: unwind partial shutdown watcher setup on
 error
In-Reply-To: <20260407022443.12971-1-zhaoguohan@kylinos.cn>
Message-ID: <alpine.DEB.2.22.394.2604081842470.2873990@ubuntu-linux-20-04-desktop>
References: <20260407022443.12971-1-zhaoguohan@kylinos.cn>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-c201ff/1775698978-3173A96F-FF6118A3/0/0
X-purgate-type: clean
X-purgate-size: 892

On Tue, 7 Apr 2026, zhaoguohan@kylinos.cn wrote:
> From: GuoHan Zhao <zhaoguohan@kylinos.cn>
> 
> setup_shutdown_watcher() registers shutdown_watch first, then the sysrq
> watch, and finally publishes the supported feature-* nodes in xenstore.
> If sysrq watch registration fails, or xenbus_printf() fails after one or
> more feature nodes were created, the function returns immediately without
> undoing the earlier setup.
> 
> This leaves the system in a partially initialized state, with registered
> watches and/or stale xenstore entries despite the function reporting
> failure.
> 
> Unwind the partial setup before returning an error by unregistering any
> watches that were already registered and removing feature nodes that were
> already published.
> 
> Signed-off-by: GuoHan Zhao <zhaoguohan@kylinos.cn>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

