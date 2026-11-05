Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F426606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 08:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=f3AgnYkh
Received: from list by lists.xenproject.org with outflank-mailman.1474247.1681420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOsyV-0005iX-3X; Thu, 05 Nov 2026 08:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474247.1681420; Thu, 05 Nov 2026 08:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOsyV-0005iQ-0F; Thu, 05 Nov 2026 08:37:35 +0000
Received: by outflank-mailman (input) for mailman id 1474247;
 Thu, 05 Nov 2026 08:37:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xOsyT-0005iK-G0
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 08:37:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xOsyT-0000000Gblo-0E7G;
 Thu, 05 Nov 2026 08:37:33 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xOsyS-0000000FHLE-2wxh;
 Thu, 05 Nov 2026 08:37:32 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=Nn4//D6l0ZafuWlVYQzZg6C+hV6hNYzTFiAR/+dOFxM=; b=f3AgnYkhfJ7ACpawNXqLOGnt1O
	Rnvd+LHBimHiQ+GJesZrJqljm+tTWEdjgXx4FEXqgNh5EKq6nvRxCg4+8ZzQnYqM1VERHvNOwCMHr
	RVsm9R5ugiPX0/7juIdXbeORiQ6gJzP9t56+IBqofKh/KDA9XzwgT2UPn1gdx+N9eUrM=;
Date: Thu, 5 Nov 2026 09:37:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 11/15] x86/PVH: try to map initrd directly into Dom0
Message-ID: <auxARAN_1uokz3Kp@Mac.lan>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <78cd46cc-84ed-46df-96c9-26ce97ed0da0@suse.com>
 <atEADbxD4mL_bXy6@Mac.lan>
 <ac9eb028-6585-4318-b0ee-e6c86624722f@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac9eb028-6585-4318-b0ee-e6c86624722f@suse.com>
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 09:06:15AM +0100, Jan Beulich wrote:
> On 15.10.2026 18:32, Roger Pau Monné wrote:
> > On Mon, Oct 12, 2026 at 10:25:11AM +0200, Jan Beulich wrote:
> >> Why does find_memory() go upwards, while find_kernel_memory() goes
> >> downwards? And why do we use the lowest part of the region found by
> >> find_memory() rather than the highest part?
> > 
> > find_memory() should probably start downwards from 4G.
> 
> In the course of replacing that find_memory() by pvh_steal_ram() (while
> converting to rangeset-based tracking) I learned the hard way that this
> isn't possible, even if it ought to be. Linux won't cope with parts of
> start-info (at least the module array) living outside of the first Gb
> (in 32-bit Linux it may go farther, depending on CONFIG_PAGE_OFFSET).

I assume start_info itself also needs to be < 1G then?

> See pvh_level3_ident_pgt[] having only its first direct-map entry
> populated, and pvh_start_xen() also only updating that one entry. Which
> causes xen_prepare_pvh() -> init_pvh_bootparams() to fall over anything
> living beyond the 1Gb boundary. (.memmap_paddr would apparently have
> the same issue, just that for Dom0 we don't set that.)

Hm, that's unfortunate.  We should fix Linux to the bootstrap
page-tables identity map the whole low 4G.  In the meantime, we keep
allocating upwards, and hope we don't cross the 1G boundary.

Thanks, Roger.

