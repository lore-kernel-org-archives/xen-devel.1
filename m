Return-Path: <SRS0=STq+=6T=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F52C47254
	for <xen-devel@archiver.kernel.org>; Tue,  5 May 2020 14:01:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE46F20661
	for <xen-devel@archiver.kernel.org>; Tue,  5 May 2020 14:01:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="zxNSDZ16"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE46F20661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVy8Y-0000y0-CZ; Tue, 05 May 2020 14:01:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Sfw0=6T=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jVy8W-0000xq-RN
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 14:01:28 +0000
X-Inumbo-ID: ea4b69c6-8ed8-11ea-b07b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea4b69c6-8ed8-11ea-b07b-bc764e2007e4;
 Tue, 05 May 2020 14:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j/16uOTQEqCwgl++GGTs/nDrWl9pSAixBruWvTsWLr4=; b=zxNSDZ16cd14dAzwrlMkywDFQP
 c0wtyJbR9LgD6rsgA9f+0uysV1k3GzHNWL+YYnC3mfvtTaKAUWQ3mVaNE7/o0oQZR4FWrIYNXRrVz
 IGWBi9WofPOeBg8cnbYWNs4IT21RHddLsONhR09yXxFnoCy37E1qJqxHfY8XwfHhfyoI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jVy8V-0003WJ-Da; Tue, 05 May 2020 14:01:27 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=freeip.amazon.com) by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jVy8V-0006Oc-2k; Tue, 05 May 2020 14:01:27 +0000
Message-ID: <45b6e79141e638c2930ccdfbc26a0de54034c525.camel@xen.org>
Subject: Re: [PATCH] x86/traps: fix an off-by-one error
From: Hongyan Xia <hx242@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Date: Tue, 05 May 2020 15:01:25 +0100
In-Reply-To: <8c3d6a2c-316c-f7fc-a2b0-3ea12721867d@suse.com>
References: <37b7ec049ff82f92cc6724a743867e1cd9365f5b.1588676790.git.hongyxia@amazon.com>
 <8c3d6a2c-316c-f7fc-a2b0-3ea12721867d@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 2020-05-05 at 15:38 +0200, Jan Beulich wrote:
> On 05.05.2020 13:06, Hongyan Xia wrote:
> > --- a/xen/arch/x86/traps.c
> > +++ b/xen/arch/x86/traps.c
> > @@ -300,6 +300,7 @@ static void show_guest_stack(struct vcpu *v,
> > const struct cpu_user_regs *regs)
> >      int i;
> >      unsigned long *stack, addr;
> >      unsigned long mask = STACK_SIZE;
> > +    void *stack_page = NULL;
> >  
> >      /* Avoid HVM as we don't know what the stack looks like. */
> >      if ( is_hvm_vcpu(v) )
> > @@ -328,7 +329,7 @@ static void show_guest_stack(struct vcpu *v,
> > const struct cpu_user_regs *regs)
> >          vcpu = maddr_get_owner(read_cr3()) == v->domain ? v :
> > NULL;
> >          if ( !vcpu )
> >          {
> > -            stack = do_page_walk(v, (unsigned long)stack);
> > +            stack_page = stack = do_page_walk(v, (unsigned
> > long)stack);
> >              if ( (unsigned long)stack < PAGE_SIZE )
> >              {
> >                  printk("Inaccessible guest memory.\n");
> > @@ -358,7 +359,7 @@ static void show_guest_stack(struct vcpu *v,
> > const struct cpu_user_regs *regs)
> >      if ( mask == PAGE_SIZE )
> >      {
> >          BUILD_BUG_ON(PAGE_SIZE == STACK_SIZE);
> > -        unmap_domain_page(stack);
> > +        unmap_domain_page(stack_page);
> >      }
> 
> With this I think you want to change the whole construct here to
> 
>     if ( stack_page )
>         unmap_domain_page(stack_page);
> 
> i.e. with the then no longer relevant BUILD_BUG_ON() also dropped.

I wonder if such a construct is better with UNMAP_DOMAIN_PAGE(), since
it deals with NULL and will nullify it to prevent misuse.

> What's more important though - please also fix the same issue in
> compat_show_guest_stack(). Unless I'm mistaken of course, in which
> case it would be nice if the description could mention why the
> other similar function isn't affected.

Compat suffers from the same problem. Thanks for pointing that out.

Hongyan


