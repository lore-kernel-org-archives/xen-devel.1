Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD9E606A319
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 20:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PaKDTjMR
Received: from list by lists.xenproject.org with outflank-mailman.1456499.1669793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJGcw-0003dN-Q8; Tue, 20 Oct 2026 20:40:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456499.1669793; Tue, 20 Oct 2026 20:40:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJGcw-0003dF-NE; Tue, 20 Oct 2026 20:40:06 +0000
Received: by outflank-mailman (input) for mailman id 1456499;
 Tue, 20 Oct 2026 20:40:06 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1xJGcw-0003XU-56
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 20:40:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJGcv-00GSue-II
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 22:40:05 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6ad7d19a-bab6-0a2a0a5309dd-0a2a4503c3ca-4
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 22:40:00 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6ad7d19f-fae8-0a2a45030019-aceafc1fcbec-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 22:40:00 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 92A8F415FC;
 Tue, 20 Oct 2026 20:39:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B7E1F000CC;
 Tue, 20 Oct 2026 20:39:57 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792528798;
	bh=53M2qSXMc7SnZSiMV+QqkK+Sw+wyCmkqw7MJ0K3TR8c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=PaKDTjMRAsn6NTNMMK9pjPi1pes1zSuYpw3UZvsxXnJNYkUej4Tk3Pq8ieQm9Pwns
	 kdzGLH5KPXi+A0YIi4k3BbctSqjQ1+1KPpL6n2lihz5c7mSaC1naP9r6lF0aPRJUzf
	 LtItny56GQReMk+8w8QdIYUWdl1kHsqKqcWqZxnU9xKHFG/xwIfZnIYAVd8bcduLpn
	 aym1C02Ls81IhN6OhoACuds2h2OfquqaHx6CD4ouWoR99Ct2c2iBjYVG5Qrw9PCuWV
	 5q4KCZip0vifSexb02b7FRP4SZ3lCeiSI30cf9qZx9o8f97R/M6/KdslPGoNJ5YMtu
	 C63LNBjvu8Lig==
Date: Tue, 20 Oct 2026 13:39:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: validate max grant frames against the grant
 table region
In-Reply-To: <20261019145726.648111-1-michal.orzel@amd.com>
Message-ID: <727cd372-04c2-0df1-3758-3c86c9673642@kernel.org>
References: <20261019145726.648111-1-michal.orzel@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-33051d/1792528800-6DAD44E9-EF3F89DA/0/0
X-purgate-type: clean
X-purgate-size: 1478
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 19 Oct 2026, Michal Orzel wrote:
> Per the binding (docs/misc/arm/device-tree/guest.txt), region 0 for
> mapping grant table is large enough to map the whole grant table. Xen
> never checks that this holds:
>  - enhanced dom0less domUs are given GUEST_GNTTAB_SIZE (4096 frames),
>    while their limit comes from the max_grant_frames DT property or, if
>    absent, from the gnttab_max_frames command line option or default,
>    neither of which is bounded by the region size,
>  - a dom0less hardware domain is given gnttab_dom0_frames() frames,
>    while the max_grant_frames DT property can raise its limit above
>    that.
> 
> A guest growing its grant table past the end of the region ends up
> mapping grant frames over whatever follows it in its address space,
> e.g. the magic pages at GUEST_MAGIC_BASE for a domU.
> 
> Validate that the configured max frames can actually fit in the region
> Xen exposes in make_hypervisor_node().
> 
> Fix find_gnttab_region() logic of setting the gnttab_size for hardware
> domain to allow the max frames up until the size of the text section.
> Otherwise, the DT setting would only allow to shrink it from the
> default.
> 
> Fixes: 79eb2871f25e ("xen/arm: configure dom0less domain for enabling xenstore after boot")
> Fixes: df68a4cb7ed9 ("xen/arm: Add capabilities to dom0less")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

