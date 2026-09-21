Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD57C982E1
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 14:07:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427584.1650381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8efh-0003Rc-8f; Mon, 21 Sep 2026 14:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427584.1650381; Mon, 21 Sep 2026 14:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8efh-0003RV-4y; Mon, 21 Sep 2026 14:07:05 +0000
Received: by outflank-mailman (input) for mailman id 1427584;
 Mon, 21 Sep 2026 14:07:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x8eff-0003RP-F1
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 14:07:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x8efd-008yZX-1w;
 Mon, 21 Sep 2026 14:07:01 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x8efe-00EEH3-0F;
 Mon, 21 Sep 2026 14:07:01 +0000
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
	bh=AW89nSFl2DlhdpwtKR1mRTOJ8GHcG2o4/yDHd1XsqHc=; b=PBWUV/WT4EOEW/NSTX5LjT6LLP
	QWjvnjCLKqe0zed9m3hn6/LxCziUnPLCYOnP6M9B7U1AZ9+PR9uNA/rCWEn7VA7Fh/LbB/MQTmBYt
	wh+k+giBqcL/XnJSptNmxJ/+T8j3E4pNH4xX1EmeTsl51wVlmlIlpL1ictEB6OyKjVbc=;
Date: Mon, 21 Sep 2026 16:06:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/HVM: replace paging_mode_hap() uses
Message-ID: <arE5_-rKgHavu5hz@macbook.local>
References: <f456b455-bcae-46a0-b68b-cebf31afa38f@suse.com>
 <DLL1G8IR03BR.3KDSA5APZ73TY@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DLL1G8IR03BR.3KDSA5APZ73TY@amd.com>

On Mon, Sep 21, 2026 at 03:45:29PM +0200, Alejandro Vallejo wrote:
> On Mon Sep 21, 2026 at 3:19 PM CEST, Jan Beulich wrote:
> > HVM guests cannot run without either HAP or shadow enabled. While
> > paging_mode_shadow() is compile-time-constant when SHADOW_PAGING=n,
> > paging_mode_hap() isn't. Hence the former is preferred to leverage DCE.
> >
> > In svm_update_guest_cr() combine two adjacent conditionals.
> >
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Yes, please.
> 
>   Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> 
> A couple of nits below. Take them or leave them.
> 
> > --- a/xen/arch/x86/hvm/svm/svm.c
> > +++ b/xen/arch/x86/hvm/svm/svm.c
> > @@ -113,7 +113,8 @@ static void cf_check svm_update_guest_cr
> >      switch ( cr )
> >      {
> >      case 0:
> > -        if ( paging_mode_hap(v->domain) )
> > +        value = v->arch.hvm.guest_cr[0];
> > +        if ( !paging_mode_shadow(v->domain) )
> >          {
> >              uint32_t intercepts = vmcb_get_cr_intercepts(vmcb);
> >  
> > @@ -122,9 +123,7 @@ static void cf_check svm_update_guest_cr
> >                   monitor_ctrlreg_bitmask(VM_EVENT_X86_CR3) )
> >                 vmcb_set_cr_intercepts(vmcb, intercepts | CR_INTERCEPT_CR3_WRITE);
> >          }
> > -
> > -        value = v->arch.hvm.guest_cr[0];
> > -        if ( paging_mode_shadow(v->domain) )
> > +        else
> >              value |= X86_CR0_PG | X86_CR0_WP;
> 
> nit: This would be clearer with the polarity reversed. Check shadow
> first and have hap later. It'd also make the diff (marginally) smaller too.
> 
> >          vmcb_set_cr0(vmcb, value);
> >          break;
> > --- a/xen/arch/x86/hvm/vmx/vmcs.c
> > +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> 
> [snip]
> 
> >      v->arch.hvm.vmx.exception_bitmap = HVM_TRAP_MASK
> > -              | (paging_mode_hap(d) ? 0 : (1U << X86_EXC_PF));
> > +        | (!paging_mode_shadow(d) ? 0 : (1U << X86_EXC_PF));
> 
> nit: Shouldn't | be on the prior line? It was there before, but seeing
> how you're adjusting indentation might as well move that char.
> 
> In the same vein as before, it'd be a bit clearer with the polarity
> inverted (shadow() ? bit : 0 )

I agree with both suggestions in principle, always better if we can
avoid negations.

Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks, Roger.

