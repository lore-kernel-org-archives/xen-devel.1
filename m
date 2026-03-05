Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4842CEFCE53
	for <xen-devel@archiver.kernel.org>; Thu,  5 Mar 2026 00:26:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1246118.1545398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxwXZ-0006lq-2L; Thu, 05 Mar 2026 00:26:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246118.1545398; Thu, 05 Mar 2026 00:26:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxwXY-0006lj-W0; Thu, 05 Mar 2026 00:26:08 +0000
Received: by outflank-mailman (input) for mailman id 1246118;
 Thu, 05 Mar 2026 00:26:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PFhh=BF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vxwXX-0006WK-TX
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 00:26:07 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e66c7057-1829-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 01:26:07 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D149361340;
 Thu,  5 Mar 2026 00:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B08C4CEF7;
 Thu,  5 Mar 2026 00:26:04 +0000 (UTC)
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
X-Inumbo-ID: e66c7057-1829-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772670365;
	bh=UepqIuLUKCKQnNwC65D5tmrrRilTbI7Lk7HQcWTAN+4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GX9WQERhXAUVKacd6EkeI8nb+Eudhlsnoe568bmhGvFi6Voe8M/SE7e9joocIU7Ue
	 tpds6qLTJ6kOcdokTG6vze9TUGMi6C8iRBAIuXiqJpx97XQnR6BdP/mJhbPD6p1/zc
	 tCKv+eR6PXo28O1KK2bAaE7+8e/568CXRLbKT9cSQgb9i80yDwlFMye2kdaBpMmntG
	 3+C1IH/p2yeMcgDKPKMx1i7pAQUxVvtBV6RkLJ7Ug8tR7y55hU9ERqISqYHfN51BOB
	 lapA0cqHweXRseVGeyPZBufXX2aYq1ERfUsG3gxR7ObAJEZZcoENcRjAIDOIqvvUd6
	 V5A30nL6s3F3Q==
Date: Wed, 4 Mar 2026 16:26:03 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>, 
    edgar.iglesias@amd.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 5/5] hw/xen: xenpvh: Add prop to enable/disable the
 mapcache
In-Reply-To: <20260304015222.979224-6-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2603041625580.250016@ubuntu-linux-20-04-desktop>
References: <20260304015222.979224-1-edgar.iglesias@gmail.com> <20260304015222.979224-6-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 4 Mar 2026, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add a machine property to enable/disable the mapcache.
> Default it to enabled for backwards compatibility.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

