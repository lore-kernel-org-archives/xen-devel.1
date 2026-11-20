Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F01606A325
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 08:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FEOtZUSA
Received: from list by lists.xenproject.org with outflank-mailman.1497867.1695903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUKRr-00043U-9r; Fri, 20 Nov 2026 08:58:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497867.1695903; Fri, 20 Nov 2026 08:58:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUKRr-00043N-7E; Fri, 20 Nov 2026 08:58:23 +0000
Received: by outflank-mailman (input) for mailman id 1497867;
 Fri, 20 Nov 2026 08:58:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jarkko@kernel.org>) id 1xUKRq-00043H-21
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 08:58:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUKRp-003LZ0-Cj
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 09:58:21 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jarkko@kernel.org>)
 id 6b000bad-e002-0a2a0a5209dd-0a2a450ca844-0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 09:58:21 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jarkko@kernel.org>)
 id 6b000bab-f479-0a2a450c0019-aceafc1fc638-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 09:58:21 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with UTF8SMTP id 15926457E1;
 Fri, 20 Nov 2026 08:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 6392D1F000CA;
 Fri, 20 Nov 2026 08:58:18 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795165099;
	bh=wJJ66nNQpcMyefwThqFqyGAbNuFBfeb0zsYpY7qs5v4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FEOtZUSAm6tMQHi5f4rO2i0R+ytSrgTxut/s2rZj69rnTpXQtslaS8K3SVMa4WurC
	 5dUthyPbpAdg2RKAYdBzCw10xq/IxmZ+UFLUqe0NVWXwDdZ42b8UftiELTxeRMLczY
	 GYZ7QqnVQQNSrcGZSPEqrbB0l9toG61oAYVutLMujEiYVNImtTUZ77K4dyjgUJ2h1g
	 NSPxNi84moaVHy9B29yifH0lGjMHgHIrpEZdIHonzFA3N/uFt83rKQSHFOfa4yCn5y
	 OFNDoFgIe2cZ2v2QXh4NOlYZk2sHAGkhdjTxfg36df1VLwSYiRhKb7ACRI2y60xn5s
	 eFKRQ5/sdP+mQ==
Date: Fri, 20 Nov 2026 10:58:15 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: shyckless@gmail.com
Cc: jgg@ziepe.ca, sstabellini@kernel.org, jgross@suse.com,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org
Subject: Re: [PATCH v3] tpm: xen-tpmfront: fix use-after-free in
 backend_changed()
Message-ID: <awALp-m9n07zxwfj@kernel.org>
References: <20261120-xen-tpmfront-v3-1-3ea2e3fd8611@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-xen-tpmfront-v3-1-3ea2e3fd8611@gmail.com>
X-purgate-ID: tlsNG-d25034/1795165101-022C0A5B-AE6563FA/0/0
X-purgate-type: clean
X-purgate-size: 1743
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 04:26:16AM +0000, Suyuan Wang via B4 Relay wrote:
> From: Suyuan Wang <stevewong@hust.edu.cn>
> 
> When the backend moves to Closing or Closed, backend_changed()
> unregisters the device and then keeps using it:
> 
> 	device_unregister(&dev->dev);
> 	xenbus_frontend_closed(dev);
> 
> The xenbus watch callback that calls backend_changed() does not hold a
> reference to the device. The tpm_chip registered by xen-tpmfront has dev
> as its parent and holds a reference to it, but tpmfront_remove() drops
> that reference when it unregisters the chip. So device_unregister() can
> release the last reference and free the xenbus_device, and
> xenbus_frontend_closed(dev) then accesses freed memory.
> 
> The stubdom based vTPM backend, the only one in use today, never
> switches to Closing or Closed, so this path is not reached with it. It
> is reached with any backend that follows the normal xenbus state
> machine on shutdown.
> 
> Take a temporary reference before unregistering and drop it after
> xenbus_frontend_closed(). This keeps dev alive for the last access and
> keeps the existing order, in which TPM operations are stopped before
> the frontend is marked Closed.
> 
> Found with a static analysis tool and checked by hand.
> 
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
> ---
> Changes in v3:
> - Drop the Fixes tag (Jarkko). No code change.
> 
> Changes in v2:
> - Say that the stubdom vTPM backend never reaches this path, and don't
>   ask for a stable backport (Juergen, Jarkko). No code change.

There's no use-after-free to fix.

Br, Jarkko

