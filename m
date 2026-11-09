Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F159B606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 10:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yk3s3d9f
Received: from list by lists.xenproject.org with outflank-mailman.1479761.1683673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQMLG-00010l-1v; Mon, 09 Nov 2026 10:11:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479761.1683673; Mon, 09 Nov 2026 10:11:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQMLF-00010e-VW; Mon, 09 Nov 2026 10:11:09 +0000
Received: by outflank-mailman (input) for mailman id 1479761;
 Mon, 09 Nov 2026 10:11:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <rppt@kernel.org>) id 1xQMLE-0000z9-JN
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 10:11:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQMLD-00AltO-LP
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 11:11:07 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <rppt@kernel.org>)
 id 6af19c39-2eae-0a2a0a5409dd-0a2a4503c19a-6
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 11:11:07 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <rppt@kernel.org>)
 id 6af19c3a-fae8-0a2a45030019-ac6904feb15c-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 11:11:07 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8349D60D60;
 Mon,  9 Nov 2026 10:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB091F008A1;
 Mon,  9 Nov 2026 10:11:02 +0000 (UTC)
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
	s=k20260515; t=1794219065;
	bh=wbzKLdeX4uvspnezn7DDebS2QYAphq0U5j3vCU9hkMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yk3s3d9frEWJZPF2MxjOZchcesGfDugA5BuxyDVBmApifp1nrXdBpEzCpJH135Z6v
	 pGzHY0gQfwXYmSiHDmNGG3fWlgsrAVtTUjAgEKgTx+LSJq1LxyCnWmYQK598Fy7BNJ
	 mgdd5EvGuaW1u0OeZ1SxXFAJnBEWulBCMtEpZEE8NzIETSir8TkiU4PYPuX7zsN/cS
	 gvCwafWEipxdq2SZNqRTVIZMR4gtnUoPMtw8wUxI2SLTH0dYcSun490m/D2NhyjRMn
	 LUYAQV+T8Fotdet4iYmRu+ol0wEuPD/vicVi+vMhVpVwFJO7zx1mOW9LpqdhrBtznQ
	 HTzwwcKy85ODA==
Date: Mon, 9 Nov 2026 12:10:59 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xen/events: replace __get_free_pages() with kmalloc()
Message-ID: <avGcM7xJfGpOQpVV@kernel.org>
References: <20261108-b4-xen-v1-1-76095f25cbf4@kernel.org>
 <7af392b9-0cf9-46fe-a820-c994942893fe@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7af392b9-0cf9-46fe-a820-c994942893fe@suse.com>
X-purgate-ID: tlsNG-33051d/1794219067-6C4DF4E9-D8330A41/0/0
X-purgate-type: clean
X-purgate-size: 1299
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 09, 2026 at 08:53:18AM +0100, Juergen Gross wrote:
> On 08.11.26 09:42, Mike Rapoport (Microsoft) wrote:
> > set_evtchn_to_irq() allocates a page for the event channel to IRQ
> > number software lookup table.
> > 
> > This buffer can be allocated with kmalloc() as there's nothing special
> > about it to go directly to the page allocator.
> > 
> > kmalloc() provides a better API that does not require ugly casts and
> > kfree() does not need to know the size of the freed object.
> > 
> > Performance difference between kmalloc() and __get_free_pages() is not
> > measurable as both allocators take an object/page from a per-CPU list for
> > fast path allocations.
> > 
> > For the slow path the performance is anyway determined by the amount of
> > reclaim involved rather than by what allocator is used.
> > 
> > Replace use of __get_free_pages() with kmalloc() and free_pages() with
> > kfree().
> > 
> > Link: https://lore.kernel.org/all/635405e4-9423-4a25-a6e7-e03c8ea0bcbe@redhat.com
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> 
> Shouldn't you also replace __get_free_page() in xen_init_IRQ()? I don't see
> why this is being omitted.

Just an overlook, will send v2 with this too. 
 
> Juergen

-- 
Sincerely yours,
Mike.

