Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22CCCD6E55
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2026 00:15:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1324277.1589893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUCn1-0005su-Ew; Tue, 02 Jun 2026 00:15:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324277.1589893; Tue, 02 Jun 2026 00:15:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUCn1-0005sn-CM; Tue, 02 Jun 2026 00:15:27 +0000
Received: by outflank-mailman (input) for mailman id 1324277;
 Tue, 02 Jun 2026 00:15:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wUCn0-0005sh-MP
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 00:15:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUCn0-001Sbh-3S
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 02:15:26 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a1e2092-e002-0a2a0a5209dd-0a2a450bb81e-10
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 02:15:26 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a1e209c-212f-0a2a450b0019-aceafc1fc888-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 02:15:25 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E8FFF401B3;
 Tue,  2 Jun 2026 00:15:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73DE41F00893;
 Tue,  2 Jun 2026 00:15:23 +0000 (UTC)
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
	s=k20260515; t=1780359323;
	bh=qQ1ROIeIgOxJKRYIpcg7ju6pIu+6nwmB71e8ShWAegw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=F4XbU20DRsp7Vcj4MNNWhwgCKhAFnrfl/C3ROcFiF0khRQSnWRuA0eCWv97E7CbSE
	 vwzWkHhpf7L1Bb0Y0pyNmAdntOXrtCut9jqiweUtCytKEl3MqOP0ZQHs3rTeyomglj
	 1OI4r0pAt02seOEIsISU14kcX37c2SLojDk2JU7xl32xzGy1bBV7kTvxRBJdpL9dPb
	 5NZ+ALxfsq5q6p1t3GMNmYEsvh50+F7c8EHCfv6Wb233MvIlN3AbD1MJIdV2CmLZc7
	 FXvQHY8RxhPR8od5YFf1XzqQ6yp/hC8EJ1pSlZUuKGo9uA9A/RISWqnc0RDb4qVrvm
	 4/uwItrcI4rmQ==
Date: Mon, 1 Jun 2026 17:15:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@ford.com
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    christopher.w.clark@gmail.com, dpsmith@apertussolutions.com, 
    Mykola Kvach <mykola_kvach@epam.com>
Subject: Re: [PATCH v3 2/6] argo: correct logline in ring_unmap()
In-Reply-To: <20260526215823.1452619-3-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2606011715150.550703@ubuntu-linux-20-04-desktop>
References: <20260526215823.1452619-1-dmukhin@ford.com> <20260526215823.1452619-3-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-42698a/1780359326-1AF76F3B-9A781E65/0/0
X-purgate-type: clean
X-purgate-size: 446

On Tue, 26 May 2026, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Drop XENLOG_ERR from the logline since argo_dprintk() already injects
> the proper log level indicator.
> 
> Also, drop "argo: " prefix, since it is also injected by argo_dprintk()
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

