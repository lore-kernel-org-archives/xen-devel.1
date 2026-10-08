Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88759CA6007
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 08:31:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443047.1660423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEjWv-0007Oo-ME; Thu, 08 Oct 2026 08:31:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443047.1660423; Thu, 08 Oct 2026 08:31:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEjWv-0007Oh-JR; Thu, 08 Oct 2026 08:31:09 +0000
Received: by outflank-mailman (input) for mailman id 1443047;
 Thu, 08 Oct 2026 08:31:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xEjWu-0007Oa-PO
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 08:31:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xEjWr-0038XL-0o;
 Thu, 08 Oct 2026 08:31:05 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xEjWq-008pcY-31;
 Thu, 08 Oct 2026 08:31:05 +0000
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
	bh=+Zfd5bWUL6y9OaDmX7F2SX+mtHZ1F7rKvNIwuDLzKP8=; b=sjjMMm8zylE5QNyFr8hzUO4Yvw
	qXJf1v6GMyrYJZe14XTlmTHzyyBAzcghY2Yl44v/8ZOFN0hGLeBVJu2Smr9ZAs0wR6NDSuLY7OruB
	NKRXnxgiQ/3v8eBu8W4vtgmU8e5y46oWosugoiIYhzFQWgr1mDUT/DogRCqPwk65CSiM=;
Date: Thu, 8 Oct 2026 10:31:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <gwd@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 02/18] x86/mm: purge unneeded
 destroy_perdomain_mapping()
Message-ID: <asdUxkAsGq-6iXvm@Mac.lan>
References: <20261007104051.48841-1-gwd@xenproject.org>
 <20261007104051.48841-3-gwd@xenproject.org>
 <0149f2e4-e35c-4593-b2d2-0358913d353f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0149f2e4-e35c-4593-b2d2-0358913d353f@suse.com>

On Thu, Oct 08, 2026 at 09:55:46AM +0200, Jan Beulich wrote:
> On 07.10.2026 12:40, George Dunlap wrote:
> > --- a/xen/arch/x86/x86_64/mm.c
> > +++ b/xen/arch/x86/x86_64/mm.c
> > @@ -737,6 +737,11 @@ int setup_compat_arg_xlat(struct vcpu *v)
> >                                      NULL, NIL(struct page_info *));
> >  }
> >  
> > +/*
> > + * Besides vCPU teardown, which free_perdomain_mappings() would cover, this
> > + * serves switch_compat()'s undo path: the domain lives on as a 64-bit one
> > + * there, so the translation area has to go right away.
> > + */
> 
> Is it really "has to"? The xlat area is simply unused for 64-bit guests,
> so it would be merely "needlessly occupying resources" if we deferred
> freeing until domain destruction.

I wondered the same, but pv_vcpu_destroy() won't free the xlat are if
is_pv_32bit_vcpu() returns false, which would be the case if
switch_compat() fails.  All this could be adjusted, but it seemed more
churn than benefit.

Roger.

