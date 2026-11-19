Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AED606A33B
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 21:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eMHt/lV8
Received: from list by lists.xenproject.org with outflank-mailman.1497481.1695776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUA7t-0000uq-4U; Thu, 19 Nov 2026 21:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497481.1695776; Thu, 19 Nov 2026 21:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUA7t-0000uj-1y; Thu, 19 Nov 2026 21:57:05 +0000
Received: by outflank-mailman (input) for mailman id 1497481;
 Thu, 19 Nov 2026 21:57:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jarkko@kernel.org>) id 1xUA7r-0000ud-E8
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 21:57:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUA7q-00Ajy6-Qy
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 22:57:02 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jarkko@kernel.org>)
 id 6aff704f-8faa-0a2a0a5109dd-0a2a450aab6a-42
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 22:57:02 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jarkko@kernel.org>)
 id 6aff70ad-f2d2-0a2a450a0019-ac6904fea2a8-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 22:57:02 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with UTF8SMTP id E016B62C10;
 Thu, 19 Nov 2026 21:57:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 1639A1F000C0;
 Thu, 19 Nov 2026 21:56:59 +0000 (UTC)
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
	s=k20260515; t=1795125420;
	bh=VpqsGc+T35woZ/9RFQSmMof8XlqRoyY6yDjeJFEmX+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eMHt/lV8RKHshp6iibV7q9GzLNJmfkgxO6NM49SSIWDiVynFw2MsU0jZn/oQDnBD0
	 MWdnGIKPe+dFL601NpqIEWK/Btf3UUToiAANJViwgCo6oa+i+znALOknmmbm2HNy97
	 gIR9gDg9a3v7zCYfou9QHx5/kGTDIWAREWfLrT364A/dIIP8CO+aOdGq5T5gZDbImq
	 UBM0xfwuDqlvyiNE6HmJj27C6JGoLph/rDwuGs8duXWbEGbluuoxckkELcg5hHrlGb
	 fGF2/dlzTx1osDdUiAxJdNVB0o/dt91zARFi9YWM6/9+6OwKjMy+tYZ+EKtlbI6ACX
	 /NZllpbWYOVJA==
Date: Thu, 19 Nov 2026 23:56:56 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: shyckless@gmail.com
Cc: jgg@ziepe.ca, sstabellini@kernel.org, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org,
	jgross@suse.com
Subject: Re: [PATCH v2] tpm: xen-tpmfront: fix use-after-free in
 backend_changed()
Message-ID: <av9wqIwiZRUywhNU@kernel.org>
References: <20261119-xen-tpmfront-v2-1-e0e51c36360d@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119-xen-tpmfront-v2-1-e0e51c36360d@gmail.com>
X-purgate-ID: tlsNG-4011c0/1795125422-597C2CFC-28ECC862/0/0
X-purgate-type: clean
X-purgate-size: 1411
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 09:36:02PM +0000, Suyuan Wang via B4 Relay wrote:
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
> Fixes: e2683957fb26 ("drivers/tpm: add xen tpmfront interface")

This should not have a fixes tag.

Br, Jarkko

