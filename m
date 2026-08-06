Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3026AC5AC67
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 22:18:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385234.1627674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws6Pi-0006qM-I3; Thu, 06 Aug 2026 22:18:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385234.1627674; Thu, 06 Aug 2026 22:18:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws6Pi-0006qE-Er; Thu, 06 Aug 2026 22:18:10 +0000
Received: by outflank-mailman (input) for mailman id 1385234;
 Thu, 06 Aug 2026 22:18:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3HQh1agYKCVwM84HD6AIIAF8.6IGR8H-78P8FFCMNM.R8HJLID86N.ILA@flex--seanjc.bounces.google.com>)
 id 1ws6Pg-0006q7-QR
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 22:18:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws6Pg-00Bhhc-79
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 00:18:08 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3HQh1agYKCVwM84HD6AIIAF8.6IGR8H-78P8FFCMNM.R8HJLID86N.ILA@flex--seanjc.bounces.google.com>)
 id 6a7507d5-e002-0a2a0a5209dd-0a2a450181b4-42
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 00:18:08 +0200
Received: from [209.85.210.197] (helo=mail-pf1-f197.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3HQh1agYKCVwM84HD6AIIAF8.6IGR8H-78P8FFCMNM.R8HJLID86N.ILA@flex--seanjc.bounces.google.com>)
 id 6a75081e-5984-0a2a45010019-d155d2c5c0cd-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 00:18:07 +0200
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-84eccf9d899so3597352b3a.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 15:18:07 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786054686; x=1786659486; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/BEVvi4/7i6XDSu/QYDIwcuZoEPs9pbAb29S0DeOBes=;
        b=MyQHE4rFqyN3m4oFV5xa7RNhfCtFhVjlKYGIK0a6ZRDBcuC2ZO0BIsmG0Wloe8j4st
         ejAUwT6Y5q/EoIbebz/BZ4gjgBhQAzR6EuyWkuN9Tazjzo2uANonA30vIU0BNZoY4OzT
         9h3ohjJMbN9xkIgJOUrN3NfKP+HRBFAtmkel30D9O0wFRVKjjdsrq7b4uAjYvT6fKmJm
         M/116vDGMLT7gzo89YXWdn93m0oshXZe5onSQJjnlhCW2JLGK5FKSTn5ZxhC+CSU4s1u
         nxlYe5GyRwVXUb18JFd5srq+QUIXCtoArfBLw3M4+XuUYWYW1dwH4r71fuafxTNR0m5o
         M43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786054686; x=1786659486;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/BEVvi4/7i6XDSu/QYDIwcuZoEPs9pbAb29S0DeOBes=;
        b=sejdI5255W3AWBybJU0QBV9Ucv1hcANohmmto+YT7s5P4dVfjRb5F5yG5wW5jBZeIZ
         tExJVbO5/akNw/mJrPByzAgIbsA08VpEfx+DNm4ghbGE2RBLgnO6QcgxoxVmJgY83jIE
         yxKHnzJqW1hZr567yQqTmsZ3sPJlTsNYaizrs3j7XD0StFgAlGS32B41HOEQJ8sj6xbT
         3TnC3yLgc0NYpgM1uNZbVuFC89xJQdSjPqFdzDeK5lEJda/O68Fi6AaGRJpoTHkH1/Gw
         +2PwoulwVgPeXdtDAB2ARnHdgeYXcJVAqy6eKyiCrP+js9P1gg71rxblnbQYPUKFUCIt
         c9ng==
X-Forwarded-Encrypted: i=1; AHgh+RrFnw5PHqidxRYUsrHDoF5OcfDQVW6SqieHSjuS7oLcSX0ZY3UocY6YR+40UeHUs36NWNPkZ7CniqY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3TuYDJIzb/xjyVmnIkJqGRrAjgqdoJumMgVabgI+FoaQ7TiYl
	roT6YyB8Kv8c5tRYY46bBl/30qJoEU6jkIbKXUY0ZUYU8bYPxj2Me0H3OHztTs2wj2SkPVWoDSP
	Vvv03ww==
X-Received: from pfbln15.prod.google.com ([2002:a05:6a00:3ccf:b0:848:5415:1869])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3a0f:b0:848:3f07:c5a2
 with SMTP id d2e1a72fcca58-84f2dfd0a06mr18297213b3a.4.1786054685697; Thu, 06
 Aug 2026 15:18:05 -0700 (PDT)
Date: Thu, 6 Aug 2026 15:18:05 -0700
In-Reply-To: <SN6PR02MB4157453D405AB80859B12DF9D4F52@SN6PR02MB4157.namprd02.prod.outlook.com>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com> <20260701193212.749551-48-seanjc@google.com>
 <SN6PR02MB4157453D405AB80859B12DF9D4F52@SN6PR02MB4157.namprd02.prod.outlook.com>
Message-ID: <anUIHY-1_q3oVFPf@google.com>
Subject: Re: [PATCH v5 47/51] x86/paravirt: Don't use a PV sched_clock in CoCo
 guests with trusted TSC
From: Sean Christopherson <seanjc@google.com>
To: Michael Kelley <mhklinux@outlook.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, 
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
X-purgate-ID: tlsNG-d62444/1786054688-C5146757-6D791EC4/0/0
X-purgate-type: clean
X-purgate-size: 2223

On Thu, Jul 02, 2026, Michael Kelley wrote:
> From: Sean Christopherson <seanjc@google.com> Sent: Wednesday, July 1, 2026 12:32 PM
> > 
> > Silently ignore attempts to switch to a paravirt sched_clock when running
> > as a CoCo guest with trusted TSC.  In hand-wavy theory, a misbehaving
> > hypervisor could attack the guest by manipulating the PV clock to affect
> > guest scheduling in some weird and/or predictable way.  More importantly,
> > reading TSC on such platforms is faster than any PV clock, and sched_clock
> > is all about speed.
> > 
> > Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/x86/kernel/tsc.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
> > index 012321fed5e5..a146fc7b5e74 100644
> > --- a/arch/x86/kernel/tsc.c
> > +++ b/arch/x86/kernel/tsc.c
> > @@ -283,6 +283,15 @@ bool using_native_sched_clock(void)
> >  int __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
> >  				      void (*save)(void), void (*restore)(void))
> >  {
> > +	/*
> > +	 * Don't replace TSC with a PV clock when running as a CoCo guest and
> > +	 * the TSC is secure/trusted; PV clocks are emulated by the hypervisor,
> > +	 * which isn't in the guest's TCB.
> > +	 */
> > +	if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC) ||
> > +	    boot_cpu_has(X86_FEATURE_TDX_GUEST))
> > +		return -EPERM;
> 
> Do a pr_warn() in the error case? Your commit message says to do the ignore
> silently, but I wonder if that's a good idea. At least for Hyper-V, the error
> case shouldn't happen.

I agree it's not a great idea, but unfortunately it's pretty much guaranteed to
fire on KVM-based setups.  The KVM world hasn't been anywhere near as aggressive
as Hyper-V in terms of killing off PV features when running SNP/TDX guests (which
is largely how this series came to be in the first place).

So while I'm conceptually not opposed to the idea of printing an error message,
in practice I'm pretty strong against it because odds are very good I'll end up
dealing with "bug" reports due to less-than-awesome setups.

