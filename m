Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26341CC6B1F
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 09:39:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448627.1664644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGvRh-0006bF-79; Wed, 14 Oct 2026 09:38:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448627.1664644; Wed, 14 Oct 2026 09:38:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGvRh-0006b8-2r; Wed, 14 Oct 2026 09:38:49 +0000
Received: by outflank-mailman (input) for mailman id 1448627;
 Wed, 14 Oct 2026 09:38:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xGvRf-0006Zx-LJ
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 09:38:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xGvRf-00000004zKD-2wfF;
 Wed, 14 Oct 2026 09:38:47 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xGvRe-00000000lG7-2zdI;
 Wed, 14 Oct 2026 09:38:47 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=kC0UHRoom6bNbAsITqxVGNMRutUqVopLCO5sqKYshd0=; b=oULrsqCnHKVTVpArqc4km4m6GZ
	5WsKJU8Awlb0KLB+eJNDwZc6YELAI/aRNawGMzvDmYWvUOb3ECATwdEf2lUClktvkckz3ChBSIjTU
	s0h5VqWMisEK308AN8gPQkKmcYriv7pahcfqrn2ATDn82JvHOLwTf3h9JiaVf49a3z74=;
Date: Wed, 14 Oct 2026 11:38:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 09/15] x86/PVH: split pvh_setup_vmx_realmode_helpers()
Message-ID: <as9NpQPi-zNFDFiY@Mac.lan>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <e2a520da-9dcf-4e04-9e17-add8b12d9a0d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e2a520da-9dcf-4e04-9e17-add8b12d9a0d@suse.com>

On Mon, Oct 12, 2026 at 10:24:07AM +0200, Jan Beulich wrote:
> All E820 manipulations want to happen before the initrd is placed, or else
> pvh_steal_ram() may steal from the tail part of it. While this is
> currently suitably ordered, mapping the initrd directly into Dom0 will
> want to happen ahead of pvh_populate_p2m(). Hence as a third step, split
> placing VMX data (if needed at all) from actually populating it.
> 
> Also move the invocation of pvh_setup_vmx_realmode_helpers() out of
> pvh_populate_p2m(). Make it unconditional as well, instead bailing from
> the function when pvh_place_vmx_realmode_helpers() wasn't called.

I'm overall happy with the idea of moving
pvh_setup_vmx_realmode_helpers() out of pvh_populate_p2m(), however I
would much rather prefer for us to keep two memory maps (the real one
in the domain struct), plus a temporary one that signals used memory,
rather than doing allocation vs placement in two steps.  Having to
add custom {acpi,vmx}_info structures for each metadata we want to
place seems strictly worse than keeping two memory maps.

Thanks, Roger.

