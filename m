Return-Path: <SRS0=j2vx=45=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50305C10DCE
	for <xen-devel@archiver.kernel.org>; Thu, 12 Mar 2020 15:17:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 263562067C
	for <xen-devel@archiver.kernel.org>; Thu, 12 Mar 2020 15:17:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 263562067C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCPa9-0004L6-1C; Thu, 12 Mar 2020 15:17:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=780U=45=suse.cz=mbenes@srs-us1.protection.inumbo.net>)
 id 1jCPa7-0004L1-K8
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 15:17:07 +0000
X-Inumbo-ID: 88d3f6ec-6474-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88d3f6ec-6474-11ea-bec1-bc764e2007e4;
 Thu, 12 Mar 2020 15:17:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A62CCABF4;
 Thu, 12 Mar 2020 15:17:05 +0000 (UTC)
Date: Thu, 12 Mar 2020 16:17:04 +0100 (CET)
From: Miroslav Benes <mbenes@suse.cz>
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <dc55b23b-c0d2-3be0-222f-d104548c8cf4@citrix.com>
Message-ID: <alpine.LSU.2.21.2003121616190.28317@pobox.suse.cz>
References: <20200312142007.11488-1-mbenes@suse.cz>
 <20200312142007.11488-2-mbenes@suse.cz>
 <dc55b23b-c0d2-3be0-222f-d104548c8cf4@citrix.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="1678380546-1273645187-1584026225=:28317"
Subject: Re: [Xen-devel] [PATCH 1/2] x86/xen: Make the boot CPU idle task
 reliable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: jgross@suse.com, sstabellini@kernel.org, xen-devel@lists.xenproject.org,
 jpoimboe@redhat.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 mingo@redhat.com, bp@alien8.de, hpa@zytor.com, live-patching@vger.kernel.org,
 boris.ostrovsky@oracle.com, jslaby@suse.cz, tglx@linutronix.de
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1678380546-1273645187-1584026225=:28317
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Thu, 12 Mar 2020, Andrew Cooper wrote:

> On 12/03/2020 14:20, Miroslav Benes wrote:
> > The unwinder reports the boot CPU idle task's stack on XEN PV as
> > unreliable, which affects at least live patching. There are two reasons
> > for this. First, the task does not follow the x86 convention that its
> > stack starts at the offset right below saved pt_regs. It allows the
> > unwinder to easily detect the end of the stack and verify it. Second,
> > startup_xen() function does not store the return address before jumping
> > to xen_start_kernel() which confuses the unwinder.
> >
> > Amend both issues by moving the starting point of initial stack in
> > startup_xen() and storing the return address before the jump.
> >
> > Signed-off-by: Miroslav Benes <mbenes@suse.cz>
> > ---
> >  arch/x86/xen/xen-head.S | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
> > index 1d0cee3163e4..642f346bfe02 100644
> > --- a/arch/x86/xen/xen-head.S
> > +++ b/arch/x86/xen/xen-head.S
> > @@ -35,7 +35,7 @@ SYM_CODE_START(startup_xen)
> >  	rep __ASM_SIZE(stos)
> >  
> >  	mov %_ASM_SI, xen_start_info
> > -	mov $init_thread_union+THREAD_SIZE, %_ASM_SP
> > +	mov $init_thread_union+THREAD_SIZE-SIZEOF_PTREGS, %_ASM_SP
> >  
> >  #ifdef CONFIG_X86_64
> >  	/* Set up %gs.
> > @@ -51,7 +51,9 @@ SYM_CODE_START(startup_xen)
> >  	wrmsr
> >  #endif
> >  
> > +	push $1f
> >  	jmp xen_start_kernel
> > +1:
> 
> Hang on.  Isn't this just a `call` instruction written in longhand?

It is (as far as I know). I wanted to keep it opencoded for a reason I 
don't remember now. I'll change it. Thanks.

Miroslav
--1678380546-1273645187-1584026225=:28317
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--1678380546-1273645187-1584026225=:28317--

