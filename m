Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3535C606A328
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 09:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=1Jy/e28f
Received: from list by lists.xenproject.org with outflank-mailman.1474321.1681465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOtqG-0001FJ-Sv; Thu, 05 Nov 2026 09:33:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474321.1681465; Thu, 05 Nov 2026 09:33:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOtqG-0001FB-PI; Thu, 05 Nov 2026 09:33:08 +0000
Received: by outflank-mailman (input) for mailman id 1474321;
 Thu, 05 Nov 2026 09:33:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xOtqF-0001F5-6H
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 09:33:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xOtqE-0000000GdLA-2RU9;
 Thu, 05 Nov 2026 09:33:06 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xOtqE-0000000Fkek-0s7z;
 Thu, 05 Nov 2026 09:33:06 +0000
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
	bh=SSu2u3TTGTfxlPdCWYnat/sB07TSGCobe47oH9L2kv4=; b=1Jy/e28fK6CFV+I7jKjPaaXoys
	PJ+Yas79Eqs5Sk5qkI6spfYB09Sz3aceGPmealycjrabS6VNVr7S+JQ323jS0FP64PHWHAF3jIoHL
	ytjyS3R0cjYYpYrfEmnQxj89gBOy+2P6K5hzRQ8bghqaZv0ZryyACRGMuw7LioS60RIo=;
Date: Thu, 5 Nov 2026 10:33:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 11/15] x86/PVH: try to map initrd directly into Dom0
Message-ID: <auxNUJMOXVx1yJMt@Mac.lan>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <78cd46cc-84ed-46df-96c9-26ce97ed0da0@suse.com>
 <atEADbxD4mL_bXy6@Mac.lan>
 <ac9eb028-6585-4318-b0ee-e6c86624722f@suse.com>
 <auxARAN_1uokz3Kp@Mac.lan>
 <1d458862-d4d1-4b5a-8a38-983a725900c3@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d458862-d4d1-4b5a-8a38-983a725900c3@suse.com>
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 09:45:56AM +0100, Jan Beulich wrote:
> On 05.11.2026 09:37, Roger Pau Monné wrote:
> > On Thu, Nov 05, 2026 at 09:06:15AM +0100, Jan Beulich wrote:
> >> On 15.10.2026 18:32, Roger Pau Monné wrote:
> >>> On Mon, Oct 12, 2026 at 10:25:11AM +0200, Jan Beulich wrote:
> >>>> Why does find_memory() go upwards, while find_kernel_memory() goes
> >>>> downwards? And why do we use the lowest part of the region found by
> >>>> find_memory() rather than the highest part?
> >>>
> >>> find_memory() should probably start downwards from 4G.
> >>
> >> In the course of replacing that find_memory() by pvh_steal_ram() (while
> >> converting to rangeset-based tracking) I learned the hard way that this
> >> isn't possible, even if it ought to be. Linux won't cope with parts of
> >> start-info (at least the module array) living outside of the first Gb
> >> (in 32-bit Linux it may go farther, depending on CONFIG_PAGE_OFFSET).
> > 
> > I assume start_info itself also needs to be < 1G then?
> 
> Looks like it isn't, as that's getting copied before enabling paging.
> 
> >> See pvh_level3_ident_pgt[] having only its first direct-map entry
> >> populated, and pvh_start_xen() also only updating that one entry. Which
> >> causes xen_prepare_pvh() -> init_pvh_bootparams() to fall over anything
> >> living beyond the 1Gb boundary. (.memmap_paddr would apparently have
> >> the same issue, just that for Dom0 we don't set that.)
> > 
> > Hm, that's unfortunate.  We should fix Linux to the bootstrap
> > page-tables identity map the whole low 4G.
> 
> Blindly mapping the first Gb as Linux does is already a problem imo:
> In the first Mb there very likely is MMIO, which shouldn't be mapped WB.
> Further up there may be MMIO as well, yet maybe that's unlikely. Up from
> 1Gb and below 4Gb there definitely is MMIO again.

Possibly more problematic on AMD than Intel: on Intel we use iPAT to
force UC for MMIO regardless of what the guest has in the gmtrr or the
guest PAT (as nasty as iPAT is).

Hm, since we create those bootstrap page-tables using superpages,
there's also the possibility of a page-table entry overlapping two
MTRR regions, at which will result in undefined caching attributes.

> >  In the meantime, we keep
> > allocating upwards, and hope we don't cross the 1G boundary.
> 
> A hope which breaks with an initrd big enough to fit below 4Gb, but too
> bit to fit in the first Gb.

Building a more complete boostrap page-tables will be complex.

Thanks, Roger.

