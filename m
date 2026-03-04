Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A6BEFCE4D
	for <xen-devel@archiver.kernel.org>; Wed,  4 Mar 2026 23:58:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1246077.1545358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxw6h-0000Mt-4r; Wed, 04 Mar 2026 23:58:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246077.1545358; Wed, 04 Mar 2026 23:58:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxw6h-0000Mm-1U; Wed, 04 Mar 2026 23:58:23 +0000
Received: by outflank-mailman (input) for mailman id 1246077;
 Wed, 04 Mar 2026 23:58:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l5iH=BE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vxw6f-0000Md-EH
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 23:58:21 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03e2b7d0-1826-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 00:58:18 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2403A44100;
 Wed,  4 Mar 2026 23:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241F4C4CEF7;
 Wed,  4 Mar 2026 23:58:16 +0000 (UTC)
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
X-Inumbo-ID: 03e2b7d0-1826-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772668697;
	bh=DPt5htaOCfcgqP4MO7Lq2RngC1FbWjZzqXZYuC57Qy8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=c5S9RKS4ZjuSN0YHIAeMDXCJyy8MzdXORIQXJew3n0sUik9MbmfH9yqGvq1d4/xxz
	 PAC4Lrb69SAI8lHjtSQUCl8NgfS70S348p4d0ActpJkbWGlM92PplCAUXXk9NRBuiJ
	 zq9W2mQ2t/nVIFfq0nFcy+XyDBNdJBp2k54cN2frZt9i0JtodIxBFAN4dA+bYhj28d
	 4KLyMl+Jmcl5u0yhRzUTl628lxOWl3pOLkRnuD5dLn3dbnN6qx3vQGSH1sqQ9K33Vd
	 bApM1gpqiLc+1QHLXwtxMZXvz0wFYhiY8nxrq0MvabSeKOzPdCrQmP8TTtql++xZmn
	 BEIo81ePGzN5g==
Date: Wed, 4 Mar 2026 15:58:12 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>, 
    edgar.iglesias@amd.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 1/5] xen: mapcache: Assert mapcache existance
In-Reply-To: <20260304015222.979224-2-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2603041558040.250016@ubuntu-linux-20-04-desktop>
References: <20260304015222.979224-1-edgar.iglesias@gmail.com> <20260304015222.979224-2-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 4 Mar 2026, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Assert that the mapcache was created prior to being used.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


