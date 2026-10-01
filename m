Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E2ECA5FA5
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 08:30:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438029.1656895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCCAW-0002iV-D1; Thu, 01 Oct 2026 08:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438029.1656895; Thu, 01 Oct 2026 08:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCCAW-0002iO-9L; Thu, 01 Oct 2026 08:29:32 +0000
Received: by outflank-mailman (input) for mailman id 1438029;
 Thu, 01 Oct 2026 08:29:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xCCAU-0002iI-V3
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 08:29:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xCCAR-009L3t-05;
 Thu, 01 Oct 2026 08:29:27 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xCCAQ-001qM0-2u;
 Thu, 01 Oct 2026 08:29:27 +0000
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
	bh=ERCkGy06F6WaYlQs1OJpg1kfBZNvGF0EFHPqMlyYbZw=; b=WHzvazPuYkujEX6olOCjuiM2ib
	d6hRd2lY5ZQn+kK9IlJM0H9X3N4DjYpaC3SGDfDex8aHSJQM/0UkaTwvo5yM8jA4Aztk1vfVArkH9
	rjmQv+9cA1+qwo8PzBldO5NwY1ooHgeVI/be8LtsrwpLQFCn/svM+yJf8YY+FP5R0Z4Q=;
Date: Thu, 1 Oct 2026 10:29:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/x86: restrict XENFEAT_pae_pgdir_above_4gb setting to
 PV guests
Message-ID: <ar4Z4EQo7FulrZXF@Mac.lan>
References: <20260930191104.78141-1-roger@xenproject.org>
 <a9d59bc1-6e21-4a8b-84e5-6daac02997c3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a9d59bc1-6e21-4a8b-84e5-6daac02997c3@suse.com>

On Thu, Oct 01, 2026 at 09:34:34AM +0200, Jan Beulich wrote:
> On 30.09.2026 21:11, Roger Pau Monne wrote:
> > @@ -692,7 +690,9 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> >              if ( is_pv_domain(d) )
> >                  fi.submap |= (1U << XENFEAT_mmu_pt_update_preserve_ad) |
> >                               (1U << XENFEAT_highmem_assist) |
> > -                             (1U << XENFEAT_gnttab_map_avail_bits);
> > +                             (1U << XENFEAT_gnttab_map_avail_bits) |
> > +                             (VM_ASSIST(d, pae_extended_cr3) ?
> > +                              (1U << XENFEAT_pae_pgdir_above_4gb) : 0);
> 
> Nit: Unlike binary operators, which we want to have placed at the end of
> wrapped lines, we generally prefer the ternary operator to be wrapped
> differently. E.g.
> 
>                              (VM_ASSIST(d, pae_extended_cr3)
>                               ? (1U << XENFEAT_pae_pgdir_above_4gb) : 0);
> 
> or 
> 
>                              (VM_ASSIST(d, pae_extended_cr3)
>                               ? (1U << XENFEAT_pae_pgdir_above_4gb)
>                               : 0);
> 
> This isn't written down anywhere, so I'm not going to insist.

I had it written as your first proposal, but then moved the ternary
operator at the end of the line as I've assumed it would be prefer to
match the position of the binary ones.

> Furthermore, wouldn't it be plausible to also add IS_ENABLED(CONFIG_PV32)
> (or, imo less desirably, opt_pv32)?

I could do:

if ( IS_ENABLED(CONFIG_PV32) && VM_ASSIST(d, pae_extended_cr3) )
    fi.submap |= 1U << XENFEAT_pae_pgdir_above_4gb

As I think adding the IS_ENABLED(CONFIG_PV32) check to the previous
expression is too much.

Let me know your preference.

Thanks, Roger.

