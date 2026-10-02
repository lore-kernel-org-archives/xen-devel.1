Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7218FCA5FD9
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 07:48:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438884.1657410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCY07-0002PM-Tm; Fri, 02 Oct 2026 07:48:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438884.1657410; Fri, 02 Oct 2026 07:48:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCY07-0002PD-QO; Fri, 02 Oct 2026 07:48:15 +0000
Received: by outflank-mailman (input) for mailman id 1438884;
 Fri, 02 Oct 2026 07:48:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xCY06-0002P7-Re
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 07:48:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xCY03-00B1kv-1X;
 Fri, 02 Oct 2026 07:48:11 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xCY03-009l9C-1D;
 Fri, 02 Oct 2026 07:48:11 +0000
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
	bh=ZKMrWblqCNTqAMqI7s3TgNneWN7bB3BC9o4ufRC4cd4=; b=6QbxP3xnAoubI9HwQm/ky6Dwpj
	az/DErBko368GGQJrdNvZBtkq57zdsYc4dQUwaarhUqlv42EXoNDz+jVN3dUXlmtEo5agJIuNYCou
	GE2N3RUrbzM0/KDodYZlZ77s6HmYoS5P9xrSV/RYf/FXGT7jh0lIN/dqZwiY82GdARcg=;
Date: Fri, 2 Oct 2026 09:48:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Grygorii Strashko <grygorii_strashko@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/domain: restrict context switch hooks for the idle
 domain
Message-ID: <ar9htQD7BC6dRCRS@Mac.lan>
References: <20261001142757.98255-1-roger@xenproject.org>
 <f3754c45-7899-4e76-bb29-dc8deca0903b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f3754c45-7899-4e76-bb29-dc8deca0903b@suse.com>

On Fri, Oct 02, 2026 at 07:45:07AM +0200, Jan Beulich wrote:
> On 01.10.2026 16:27, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -813,8 +813,6 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
> >  void __init arch_init_idle_domain(struct domain *d)
> >  {
> >      static const struct arch_csw idle_csw = {
> > -        .from = paravirt_ctxt_switch_from,
> > -        .to   = paravirt_ctxt_switch_to,
> >          .tail = idle_loop,
> >      };
> 
> Leaving NULL pointers around isn't a good thing, though. May I suggest to
> at least poison the pointers then?

I don't mind doing so, but I don't think we usually do that for other
hook structures, ie: hvm_function_table for example doesn't poison
unset hooks (and it possibly can't, because there are .hook != NULL
checks).

TBH I'm missing a benefit of the poisoning here.  Using NULL or a
poisoned value will both trigger a page-fault, and NULL has the
benefit of callers easily checking whether the hook is set.

Thanks, Roger.

