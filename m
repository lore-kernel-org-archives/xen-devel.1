Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F686CC6B1D
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 09:31:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448619.1664634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGvKU-0005ZR-Hs; Wed, 14 Oct 2026 09:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448619.1664634; Wed, 14 Oct 2026 09:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGvKU-0005ZK-ES; Wed, 14 Oct 2026 09:31:22 +0000
Received: by outflank-mailman (input) for mailman id 1448619;
 Wed, 14 Oct 2026 09:31:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xGvKS-0005ZE-PR
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 09:31:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xGvKS-00000004zBf-3JrG;
 Wed, 14 Oct 2026 09:31:20 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xGvKR-00000000Zuj-3KsW;
 Wed, 14 Oct 2026 09:31:20 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=uqlkspI5h3a7q80iQ4A4lXYxdBNbl2qBw0pCXIrI0mU=; b=LFj/gZcAczwCAQJ676PPv7aK/V
	NDejSZb9QeiVdmU00GBIofvo/R7kMxZfEAvE7C3cu5ZTGjnGRjvHbI/2wZCSKuD1yX3HF6Ten9Znn
	wQM27ly/Cp0mfqwhuDEQ1H8qY384HC3D1JbLA9UzzLYM1nL72gKpArBKkuuBqwXccadI=;
Date: Wed, 14 Oct 2026 11:31:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 08/15] x86/PVH: split pvh_setup_acpi()
Message-ID: <as9L5sT6SXfBWlkg@Mac.lan>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <d0f1a88b-66a0-4bf9-9dd2-ea0cc48bc3ae@suse.com>
 <as5TyD0ZX1HnN578@Mac.lan>
 <f79d68c4-271b-44a9-950f-a6a85f4ea7ff@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f79d68c4-271b-44a9-950f-a6a85f4ea7ff@suse.com>

On Tue, Oct 13, 2026 at 06:04:37PM +0200, Jan Beulich wrote:
> On 13.10.2026 17:52, Roger Pau Monné wrote:
> > On Mon, Oct 12, 2026 at 10:23:16AM +0200, Jan Beulich wrote:
> >> All E820 manipulations want to happen before the initrd is placed, or else
> >> pvh_steal_ram() may steal from the tail part of it. As a second step,
> >> split placing ACPI data from actually populating it.
> > 
> > Would it be less intrusive to duplicate the memory map (like it's done
> > in a change ahead of this one), and subtract the kernel and initrd
> > region from that memory map, then use it as the basis for
> > pvh_steal_ram()?
> > 
> > We could adjust/replace pvh_add_mem_range() so it allows changing
> > regions from RAM to other types.  That would seem to be less churn
> > overall.  Maybe you did already consider this and found further
> > problem with this approach that I'm failing to see?
> 
> No, I didn't try that route. In fact despite the order now this patch
> (and maybe also the VMX one) pre-dates the E820-copying one. The one
> aspect I consider problematic with the suggested alternative is that
> then two E820 maps need updating: The one with kernel (not sure about
> initrd; see below) subtracted out, and the one we actually mean to hand
> to Dom0.
> 
> As to overall churn: I'm not sure which one would cause less. Certainly
> the patch here would remain largely unaltered, as the splitting is
> going to be necessary no matter what.

I'm possibly missing something, but the splitting won't be strictly
necessary?

We could do:

 * Populate p2m
 * Place kernel
 * Place ACPI (also VMX metadata)
 * Place initrd

There's no need to split the ACPI between allocation and placement,
and we could place the kernel just after having populated the p2m.
However we then need to keep a separated memory map (or rangeset?) to
signal available memory in the p2m.  It would require changes to
pvh_steal_ram() and pvh_add_mem_range(), won't won't require splitting
ACPI allocation vs loading.

We would also need to split the VMX stuff out of pvh_populate_p2m(),
but that doesn't seem overly complicated; the logic is already
isolated at the tail of the function.

Thanks, Roger.

