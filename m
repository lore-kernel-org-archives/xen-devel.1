Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEB4C55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 08:47:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383054.1626325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrXHH-0003oI-Fd; Wed, 05 Aug 2026 08:47:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383054.1626325; Wed, 05 Aug 2026 08:47:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrXHH-0003o8-AX; Wed, 05 Aug 2026 08:47:07 +0000
Received: by outflank-mailman (input) for mailman id 1383054;
 Wed, 05 Aug 2026 08:47:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1wrXHG-0003nU-5P
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 08:47:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wrXHE-006HEQ-0g;
 Wed, 05 Aug 2026 08:47:03 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wrXHD-00EwxE-1o;
 Wed, 05 Aug 2026 08:47:03 +0000
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
	bh=iNMWi0XtRBKOmYDv/Tp647cKGq+rA0jxZoCfmdFSxzg=; b=NJUzcebrvZ2GAaVE3sdR/cw3jG
	amx6gjPYPB8x1GFQdlD6blgf30WK4vhrJM7wwnk9y++g/YjLcVLOuMrlUnaqjiZjVE17Kd1+Aep8Y
	KS8UBxDvfc9Pm+N3pfcd+mVXJJbii6bb5cFfURvvdGSzF54f+eZppiv9E8Bx3iPVmaUE=;
Date: Wed, 5 Aug 2026 10:43:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Yannick Martin <yannick.martin@okazoo.eu>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH] x86/xen: fix init of balloon stats for PV guests with
 memory != maxmem
Message-ID: <anL3sbvftMybnwBG@macbook.local>
References: <20260730143548.39320-1-roger@xenproject.org>
 <20260805044607.2564210-1-matthias.goergens@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260805044607.2564210-1-matthias.goergens@gmail.com>

On Wed, Aug 05, 2026 at 12:46:07PM +0800, Matthias Goergens wrote:
> Hi Roger,
> 
> thanks for picking this up, and Juergen, thanks for the quick review.  Two
> things I believe are still worth addressing; the Fixes: tag can of course
> also be fixed up on application.
> 
> I think the Fixes: tag should point to 0949c646d646 ("Partial revert
> \"x86/xen: fix balloon target initialization for PVH dom0\"").  Commit
> 87af633689ce changed the initial-page calculation and the extra-region
> subtraction together, so those two operations were coherent: the PV initial
> count then came from get_num_physpages(), which includes the extra regions.
> 0949c646d646 restored the PV start_info->nr_pages calculation, which
> excludes the extra regions, but retained the subtraction.

I've got the same doubts about which commit to reference in the Fixes
tag.  Here is my reasoning for picking the original bogus commit, and
not the subsequent attempt at fixing it:

Even if 87af633689ce was coherent in the usage of initial pages vs
extra regions, it was still wrong, and that's why it was (partially)
reverted.  I assume that anyone who picks the change in this patch
will also have picked 0949c646d646, otherwise they have a problem with
how they do backports.

> Its 6.12.y
> backport is also the reporter's identified regression, first seen in
> 6.12.75.  Applying this patch in a tree that has 87af633689ce but not
> 0949c646d646 (for example a 6.17-based distro tree) would double-account
> the extra region.

Why would someone apply this fix but not the preceding one?  It makes
no sense, you either pick backports consistently, or need to be very
careful at knowing what to pick (and assume that sometimes stuff will
break).

> This likely also wants Cc: stable@vger.kernel.org, since
> both 6.12.y and 6.18.y carry the 0949c646d646 regression.
> 
> Separately, and not something this patch introduces: PVH dom0 has the same
> shape of problem on mainline since b13cd24c15d7.  A successful
> XENMEM_current_reservation supplies current_pages for both PV and PVH dom0,
> and that count excludes the unpopulated xen_extra_mem, so the
> xen_pv_domain()-only branch leaves PVH dom0 subtracting those pages again
> (-ERANGE, or a silently wrong target, when CONFIG_XEN_UNPOPULATED_ALLOC=n
> leaves the regions for the balloon driver).  I am happy to pursue that as
> its own thread once this one lands.

Hm, I see.  Running a PVH dom0 without CONFIG_XEN_UNPOPULATED_ALLOC
will be a very bad idea anyway, as the kernel would likely end up
triggering an OOM as all pages would be ballooned out to create
grant/foreign mappings.

> Would it be safer to pass balloon_add_regions() an explicit indication of
> whether the chosen initial-page count includes the extra physmap regions?
> That would cover PV, PVH dom0, and the XENMEM_current_reservation fallback
> without deriving the accounting rule solely from the domain type.  On
> hypercall failure PVH dom0 falls back to get_num_physpages(), which
> includes the extra regions, so keying the accounting on the source of the
> count keeps the fallback correct as well.

Possibly, this has grown organically to accommodate for the
lack of proper interface to do memory balloon accounting.

I will send v2 attempting to take care of the PVH corner case and the
error fallback.  It's IMO best if we can get all the related fixes
here in a single patch to backport.

Thanks, Roger.

