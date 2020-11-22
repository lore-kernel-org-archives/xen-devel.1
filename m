Return-Path: <SRS0=Rr0c=E4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E125DC5519F
	for <xen-devel@archiver.kernel.org>; Sun, 22 Nov 2020 21:45:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F3772074B
	for <xen-devel@archiver.kernel.org>; Sun, 22 Nov 2020 21:45:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2o1jrHuQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F3772074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.33503.64560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgxAW-0002hm-3O; Sun, 22 Nov 2020 21:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 33503.64560; Sun, 22 Nov 2020 21:45:12 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgxAW-0002hf-0J; Sun, 22 Nov 2020 21:45:12 +0000
Received: by outflank-mailman (input) for mailman id 33503;
 Sun, 22 Nov 2020 21:45:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ookb=E4=kernel.org=luto@srs-us1.protection.inumbo.net>)
 id 1kgxAU-0002ha-Ik
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2020 21:45:10 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 11f79419-10fd-421e-b73e-843b6a0110a1;
 Sun, 22 Nov 2020 21:45:08 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C9B702084C
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2020 21:45:07 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id c198so14291657wmd.0
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2020 13:45:07 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Ookb=E4=kernel.org=luto@srs-us1.protection.inumbo.net>)
	id 1kgxAU-0002ha-Ik
	for xen-devel@lists.xenproject.org; Sun, 22 Nov 2020 21:45:10 +0000
X-Inumbo-ID: 11f79419-10fd-421e-b73e-843b6a0110a1
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 11f79419-10fd-421e-b73e-843b6a0110a1;
	Sun, 22 Nov 2020 21:45:08 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C9B702084C
	for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2020 21:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606081508;
	bh=j8kQr1sqydOsvjEY9shLB0wmUrzUic9iCe1dNmPahV0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=2o1jrHuQqj+owOO+c9Zeqxrd9M6szemlUmJSqcWPhibowyO6pXzhHfe+VU2CVHSEx
	 6i9l1pH/OrjB/ycgmevivnDyFQfhPd0sDLvyPdoRmGLzLfeZdce65//c9hJPyiAb0C
	 IF/2dwA3JwvzN2WhaDRzodNq4IxJJOJIIJXD3gjA=
Received: by mail-wm1-f41.google.com with SMTP id c198so14291657wmd.0
        for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2020 13:45:07 -0800 (PST)
X-Gm-Message-State: AOAM533aLK3TddNWrYmdGe/ittJtb8tAeZ89VQTsA44PWNYO9rwBaUy/
	D/RkMYsx6mfVzVXgVJFBbKJ1I5M96is8nUhLtvwsng==
X-Google-Smtp-Source: ABdhPJwifakpgwUVTLbeDBYdoVmnAfRpiEVwGa2XrrCKUuyY/SYxT6I31Kv43oa6WFJkbjZ+4GFZn5n4pemXbXWt+C8=
X-Received: by 2002:a1c:2781:: with SMTP id n123mr3937832wmn.49.1606081506352;
 Sun, 22 Nov 2020 13:45:06 -0800 (PST)
MIME-Version: 1.0
References: <20201120114630.13552-1-jgross@suse.com> <20201120114630.13552-6-jgross@suse.com>
 <20201120115943.GD3021@hirez.programming.kicks-ass.net> <eb05e878-6334-8d19-496b-6572df67fc56@suse.com>
In-Reply-To: <eb05e878-6334-8d19-496b-6572df67fc56@suse.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Sun, 22 Nov 2020 13:44:53 -0800
X-Gmail-Original-Message-ID: <CALCETrXOGhXoOJpzhAMqD7iibi09WzbGk9SWVH7JzA=d5uarWA@mail.gmail.com>
Message-ID: <CALCETrXOGhXoOJpzhAMqD7iibi09WzbGk9SWVH7JzA=d5uarWA@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] x86: rework arch_local_irq_restore() to not use popf
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	"VMware, Inc." <pv-drivers@vmware.com>, X86 ML <x86@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linux Virtualization <virtualization@lists.linux-foundation.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Andrew Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2020 at 10:55 PM J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wr=
ote:
>
> On 20.11.20 12:59, Peter Zijlstra wrote:
> > On Fri, Nov 20, 2020 at 12:46:23PM +0100, Juergen Gross wrote:
> >> +static __always_inline void arch_local_irq_restore(unsigned long flag=
s)
> >> +{
> >> +    if (!arch_irqs_disabled_flags(flags))
> >> +            arch_local_irq_enable();
> >> +}
> >
> > If someone were to write horrible code like:
> >
> >       local_irq_disable();
> >       local_irq_save(flags);
> >       local_irq_enable();
> >       local_irq_restore(flags);
> >
> > we'd be up some creek without a paddle... now I don't _think_ we have
> > genius code like that, but I'd feel saver if we can haz an assertion in
> > there somewhere...
> >
> > Maybe something like:
> >
> > #ifdef CONFIG_DEBUG_ENTRY // for lack of something saner
> >       WARN_ON_ONCE((arch_local_save_flags() ^ flags) & X86_EFLAGS_IF);
> > #endif
> >
> > At the end?
>
> I'd like to, but using WARN_ON_ONCE() in include/asm/irqflags.h sounds
> like a perfect receipt for include dependency hell.
>
> We could use a plain asm("ud2") instead.

How about out-of-lining it:

#ifdef CONFIG_DEBUG_ENTRY
extern void warn_bogus_irqrestore();
#endif

static __always_inline void arch_local_irq_restore(unsigned long flags)
{
       if (!arch_irqs_disabled_flags(flags)) {
               arch_local_irq_enable();
       } else {
#ifdef CONFIG_DEBUG_ENTRY
               if (unlikely(arch_local_irq_save() & X86_EFLAGS_IF))
                    warn_bogus_irqrestore();
#endif
}

