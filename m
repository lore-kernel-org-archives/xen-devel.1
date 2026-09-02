Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFEAC61DFD
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 08:35:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405344.1638846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1gRX-0003xv-Td; Wed, 02 Sep 2026 08:35:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405344.1638846; Wed, 02 Sep 2026 08:35:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1gRX-0003xo-Qq; Wed, 02 Sep 2026 08:35:39 +0000
Received: by outflank-mailman (input) for mailman id 1405344;
 Wed, 02 Sep 2026 08:35:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x1gRW-0003xf-4k
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 08:35:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x1gRV-001onq-2k;
 Wed, 02 Sep 2026 08:35:37 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x1gRV-003Q2B-0l;
 Wed, 02 Sep 2026 08:35:37 +0000
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
	bh=B2ZLczSkBh7ovVRgcn6NoJrswNl57crVurA5ZVl5Ob0=; b=PSLWhrqsG4Tv3dUAMJzofKb9M8
	4Y0u8WojJtfXQxqpLq+lOqdbJvzmU/ySz/Vlz3YJD4iN0+Ou3ICaMFMgtbEuLO3GpCnUztVhoADME
	hMJy8cM7WQAobe7LL+HW6WbazPJ+VHfzTLCelNvG33aNpAe5jwt3by6NAII8ji2bXfMw=;
Date: Wed, 2 Sep 2026 10:35:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/alternatives: mark .altinstructions r/w
Message-ID: <apff1A7GdGHsQDqV@macbook.local>
References: <a16d4079-cd8c-4eca-8a60-3cef40173cfd@suse.com>
 <apfPz0njzKVwJ22s@macbook.local>
 <89352ea0-7284-4f6f-bba4-5a6a334b1551@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <89352ea0-7284-4f6f-bba4-5a6a334b1551@suse.com>

On Wed, Sep 02, 2026 at 10:31:56AM +0200, Jan Beulich wrote:
> On 02.09.2026 09:27, Roger Pau Monné wrote:
> > On Wed, Sep 02, 2026 at 09:15:46AM +0200, Jan Beulich wrote:
> >> Forever since the introduction of the .priv member it has been wrong to
> >> record the section as r/o.
> >>
> >> .alt_call_sites, otoh, is legitimately r/o, hence
> >> __alt_call_sites_{start,end}[] would better reflect that.
> > 
> > Right, we don't however have a .init.rodata section, and hence it gets
> > placed in the .init.data section which is r/w.  No objection about the
> > addition of const, it's the right thing.
> > 
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Acked-by: Roger Pau Monné <roger@xenproject.org>
> 
> Thanks.
> 
> > I think you want:
> > 
> > Fixes: 4008c71d7af2 ("x86/alt: Support for automatic padding calculations")
> 
> I was pondering to add this, but then decided against (it's an inconsistency,
> not really a bug). Since you ask for it, let me add it then.

I agree it's not a functional bug, but since the commit message
mentions "it has been wrong", I was assuming we might want to signal
when the inconsistency was introduced.  No strong opinion really.

Thanks, Roger.

