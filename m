Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6A1C43458
	for <xen-devel@archiver.kernel.org>; Mon,  6 Jul 2026 18:01:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1355785.1610545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgncZ-00030w-Hb; Mon, 06 Jul 2026 18:00:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355785.1610545; Mon, 06 Jul 2026 18:00:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgncZ-00030p-DI; Mon, 06 Jul 2026 18:00:43 +0000
Received: by outflank-mailman (input) for mailman id 1355785;
 Mon, 06 Jul 2026 18:00:41 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3N-1LagYKCZoM84HD6AIIAF8.6IGR8H-78P8FFCMNM.R8HJLID86N.ILA@flex--seanjc.bounces.google.com>)
 id 1wgncX-00030i-FR
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 18:00:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgncW-00Ap2d-5l
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 20:00:40 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3N-1LagYKCZoM84HD6AIIAF8.6IGR8H-78P8FFCMNM.R8HJLID86N.ILA@flex--seanjc.bounces.google.com>)
 id 6a4bed32-2eae-0a2a0a5409dd-0a2a450587de-24
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 20:00:40 +0200
Received: from [209.85.210.201] (helo=mail-pf1-f201.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3N-1LagYKCZoM84HD6AIIAF8.6IGR8H-78P8FFCMNM.R8HJLID86N.ILA@flex--seanjc.bounces.google.com>)
 id 6a4bed38-3cb2-0a2a45050019-d155d2c9ed33-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 20:00:26 +0200
Received: by mail-pf1-f201.google.com with SMTP id
 d2e1a72fcca58-8478e9c4bd2so3477344b3a.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 11:00:25 -0700 (PDT)
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
        d=google.com; s=20251104; t=1783360824; x=1783965624; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eYcfhMi5NCPMduPSvGqKtbO87FaKSq3RfhmI47bcB1U=;
        b=C1CT7qcMpykNYW2n4oWTUAdRG0Hs3YAhyA3hp1NG5nD+X/Bh9aYDjQmgYCgSLgxZpJ
         QpAYg6JHJZjdtfGLpwq/mBA1aQ4yRBandYbHF6VwO9g7ajnMmhCCapudKeSvLgnCo3Yu
         DwE5rrWdai9el1xBxBjXbTtTRVErophhkywW+h+Rz4Hikfad+rzExvlr7KMNREZqZbEB
         UM6gVQyWaAomMial7xTYfcBvHVhoWAmMWD7FiXewCIo90ldETpYRFyc0YovaSrMQNbs0
         dRroBkDL0YC6Pqs314kQN6wOskO+10tDNRh4p63xpOVH8QcVO+lc6sk4S7043G+09str
         H8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360824; x=1783965624;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eYcfhMi5NCPMduPSvGqKtbO87FaKSq3RfhmI47bcB1U=;
        b=RAaNNsDVMTF+p1Vzaodkmr7WdECDKl87OEykflgJcfzugQdUTTNelWi9YoSPPeROst
         qkuenBHaasCUYf36jRcKmGoRxKJkjPY+9el3f+oezmMEZ49gtyecOP5fiMmnX57Ug+A4
         XP3ct/M5EvwGpMJTi4jTYRatdWhPHMaO6/6AXz8ga3AjEJE8qEt439NtX5rTtWPNnd2v
         AsYdqDNfyUlpUe9B3HYR4GWMnjB/avgny42Ln3htWX6PF50nJM+OTFFOA4WbmjWhaRc3
         PlzejQILcZh1gvit31WxntHwdIQgMpQWgyWCuUTfhvqqgfQjJ3slDa/UkBPHEjBVBtI0
         h0eA==
X-Forwarded-Encrypted: i=1; AHgh+RpHHaWiKnC0GOGFQ4+XCSfSO+ko/+AsRRP3Qq5KJDylNnIN1XivRn6fZzp4ma2azgic+HSY9VhT8UU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzf5Dkouz/QgrHSyJVLSq6B/fqY/g2jT3+9abthE+ptShRFARgh
	XL/l8rTDLR+d6YUrsQR8iL8LR+uvTzPT3rWaGd8ZfoGOlOKJKX8vLWYTkQEK7EZVHlvPZR1U1fW
	Kkpw6Wg==
X-Received: from pgam14.prod.google.com ([2002:a05:6a02:2b4e:b0:c92:460e:4f73])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4307:b0:847:8c6d:2f24
 with SMTP id d2e1a72fcca58-84826ec2591mr1691676b3a.56.1783360823962; Mon, 06
 Jul 2026 11:00:23 -0700 (PDT)
Date: Mon, 6 Jul 2026 11:00:23 -0700
In-Reply-To: <SN6PR02MB41578D3C34AB283B892C27A4D4F52@SN6PR02MB4157.namprd02.prod.outlook.com>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com> <20260701193212.749551-2-seanjc@google.com>
 <SN6PR02MB41578D3C34AB283B892C27A4D4F52@SN6PR02MB4157.namprd02.prod.outlook.com>
Message-ID: <akvtN7aIjZ7gOq4o@google.com>
Subject: Re: [PATCH v5 01/51] x86/apic: Provide helpers to set local APIC
 timer period in hz and khz
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
X-purgate-ID: tlsNG-c201ff/1783360826-15B092B8-3A6E25E6/0/0
X-purgate-type: clean
X-purgate-size: 1089

On Thu, Jul 02, 2026, Michael Kelley wrote:
> > @@ -796,6 +796,16 @@ bool __init apic_needs_pit(void)
> >  	return lapic_timer_period == 0;
> >  }
> > 
> > +void apic_set_timer_period_khz(u64 period_khz, const char *source)
> > +{
> > +	lapic_timer_period = mul_u64_u32_div(period_khz, 1000, HZ);
> > +}
> > +
> > +void apic_set_timer_period_hz(u64 period_hz, const char *source)
> > +{
> > +	lapic_timer_period = div_u64(period_hz, HZ);
> > +}
> 
> A string "source" argument is passed in, but not used. Is there an
> envisioned future use? Also, this function doesn't output a pr_info()
> message like the existing Hyper-V and VMware code does. 

It was a complete goof on my part (Sashiko also pointed out the oddity[*]).  I
fully intended to log a message and provide equivalent Hyper-V/VMware behavior,
and totally spaced it.

[*] https://lore.kernel.org/all/20260701194621.4BD691F000E9@smtp.kernel.org

> I don't know that the message is all that useful, though I do remember one
> case where I was debugging some clock/timer issue when I looked at it. 


