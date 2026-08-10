Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8941CC5AD55
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 14:30:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387544.1628806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtR0z-0001hA-EB; Mon, 10 Aug 2026 14:30:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387544.1628806; Mon, 10 Aug 2026 14:30:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtR0z-0001h3-Ba; Mon, 10 Aug 2026 14:30:09 +0000
Received: by outflank-mailman (input) for mailman id 1387544;
 Mon, 10 Aug 2026 14:30:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3beB5agYKCXAgSObXQUccUZS.QcalSb-RSjSZZWghg.lSbdfcXSQh.cfU@flex--seanjc.bounces.google.com>)
 id 1wtR0y-0001gx-OA
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 14:30:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtR0y-003iou-0l
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 16:30:08 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3beB5agYKCXAgSObXQUccUZS.QcalSb-RSjSZZWghg.lSbdfcXSQh.cfU@flex--seanjc.bounces.google.com>)
 id 6a79e04b-2eae-0a2a0a5409dd-0a2a4505cff8-42
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 16:30:07 +0200
Received: from [209.85.215.197] (helo=mail-pg1-f197.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3beB5agYKCXAgSObXQUccUZS.QcalSb-RSjSZZWghg.lSbdfcXSQh.cfU@flex--seanjc.bounces.google.com>)
 id 6a79e06e-4cb1-0a2a45050019-d155d7c5e039-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 16:30:07 +0200
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-c856470fe9fso1448938a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 07:30:07 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786372206; x=1786977006; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Pt4y4GsIfgXju50y9aE1V5oqKvyqhzjPLlHBnjvlrwI=;
        b=LGFverQ9ixFZDnqSr2+C8XTmo954m86TKoh7xjZnMoyE0apo/oikqD9OPbJf9iCxxF
         oEAJZaF8FJZpbbLOXFhmr8gQrTPJDJ9A91LI9+x1TvlszL4e+8C2AxP5vy3GIeMfJh99
         O4d0ZIDHMGa0mX5zeW8A92BjpUThvha+HNDlNoguwRgvmrk4MPLZ1m/BluhGUnck94iI
         ThT2YygDWMETP/Sc0ExmZFIipC967HZqQSkhcr+pz3ZoHODUdMwLSfbAAmP50IdA6F6I
         c1vrvRMHiX6p1Os4YHYmbbpDe9cKJfJjLwocQf4L3Ehl5nhUTkGh3vxUGfdFqiXoRj3N
         JTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372206; x=1786977006;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pt4y4GsIfgXju50y9aE1V5oqKvyqhzjPLlHBnjvlrwI=;
        b=O/O0mf+yx8dPblnG9a/fLjbnMM0w7eqcJsVGamqsHt3MvcaESml/4JCgZjYL8JDYP1
         r3u5k16yEIqJ/mO62nE3MDPzE3UuVQi2Yb3rIG7qxQzEof85swHFCYNgLtv4kSO04rG2
         opqlJdiTbKjyb8WDWqp62HzgDq2klkxrIn0QxRqVwa/3EG/nf3i1Cja2jZ9mda9tMF0V
         QoyyzsJagHCSfOYbQkud1/aYWSklCT2TjzYgBubOsR7EE477kluLreMknU5UIAbDb7J+
         8ZtOhkADOllAOwg6AW1FrBp6JrS9K5rjOQSOwgElVJvs45dgFrt0PRZ1JrRUBDFzD5Tf
         NkUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rolpmiq8dKpYkrYHoODd9bdC9qWUoXJdkZu1k+jHETVQFuOnuc4D3BVc2yCfBw3MFxSQ8D8j6kxu0M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyXPK23p6rBzwedzkMxxFEHHIFsPpR9taUtksRnSUZICVsjqV0F
	jJABi7Pv3p8hSZE4+HDS6EPy6KbRwOIevhIseeex3cKVLqS8Xb0BlfIBVie1XJxSyFhPXNG8jgr
	H94NB+g==
X-Received: from pgmo14.prod.google.com ([2002:a63:5d4e:0:b0:cbe:7df7:35b0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7fa0:b0:3c3:76a8:c0f
 with SMTP id adf61e73a8af0-3cbce6f17b9mr20503675637.4.1786372205374; Mon, 10
 Aug 2026 07:30:05 -0700 (PDT)
Date: Mon, 10 Aug 2026 07:30:04 -0700
In-Reply-To: <b8c0e3537904e29f233cbb03f4d3ddb5247e2af7.camel@infradead.org>
Mime-Version: 1.0
References: <20260806233609.212337-11-seanjc@google.com> <b8c0e3537904e29f233cbb03f4d3ddb5247e2af7.camel@infradead.org>
Message-ID: <anngbOavdPam2kKy@google.com>
Subject: Re: [PATCH v6 10/51] x86/tdx: Force TSC frequency with CPUID-based
 info provided by the TDX-Module
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: kas@kernel.org, rick.p.edgecombe@intel.com, pbonzini@redhat.com, 
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org, 
	decui@microsoft.com, longli@microsoft.com, ajay.kaher@broadcom.com, 
	alexey.makhalov@broadcom.com, jan.kiszka@siemens.com, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, 
	jgross@suse.com, daniel.lezcano@kernel.org, tglx@kernel.org, 
	jstultz@google.com, x86@kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c201ff/1786372207-71CA82A1-EC93AD19/0/0
X-purgate-type: clean
X-purgate-size: 2896

On Sat, Aug 08, 2026, David Woodhouse wrote:
> On Thu, 2026-08-06 at 16:35 -0700, Sean Christopherson wrote:
> > When running as a TDX guest, explicitly set the TSC frequency to a know=
n
> > value, using CPUID-based information, instead of potentially relying on=
 a
> > hypervisor-controlled PV routine.  For TDX guests, CPUID.0x15 is always
> > emulated by the TDX-Module, i.e. the information from CPUID is more
> > trustworthy than the information provided by the hypervisor.
> >
> > To maintain backwards compatibility with TDX guest kernels that use nat=
ive
> > calibration, and because it's the least awful option, retain
> > native_calibrate_tsc()'s stuffing of the local APIC bus period using th=
e
> > core crystal frequency.  While it's entirely possible for the hyperviso=
r
> > to emulate the APIC timer at a different frequency than the core crysta=
l
> > frequency, the commonly accepted interpretation of Intel's SDM is that =
APIC
> > timer runs at the core crystal frequency when that latter is enumerated=
 via
> > CPUID:
> >
> >   The APIC timer frequency will be the processor's bus clock or core
> >   crystal clock frequency (when TSC/core crystal clock ratio is enumera=
ted
> >   in CPUID leaf 0x15).
> >
> > If the hypervisor is malicious and deliberately runs the APIC timer at =
the
> > wrong frequency, nothing would stop the hypervisor from modifying the
> > frequency at any time, i.e. attempting to manually calibrate the freque=
ncy
> > out of paranoia would be futile.
> >
> > Deliberately leave CPU frequency calibration as is, since the TDX-Modul=
e
> > doesn't provide any guarantees with respect to CPUID.0x16.
> >
> > Expose and use cpuid_get_tsc_info() instead of providing a wrapper to
> > get the TSC and core crystal frequency, as TDX is the only anticipated
> > user outside of the TSC code, i.e. adding a helper to dedup the math wo=
n't
> > actually dedup anything.  Having TDX use "struct cpuid_tsc_info" also
> > avoids the temptation of declaring a local "tsc_khz" variable and thus
> > unintentionally creating a shadow of the global "tsc_khz".
> >
> > Cc: Kiryl Shutsemau (Meta) <kas@kernel.org>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
>=20
> I don't know if we should set X86_FEATURE_TSC_RELIABLE before bailing
> out in the case where cpuid_get_tsc_info() fails, or just not care
> about that because it Can Never Happen=E2=84=A2? Previously it was set
> unconditionally from tdx_early_init().
>=20
> Whatever...

Heh, yeah, "whatever" is about my thought exactly.  I could go either way. =
 I
would buy an argument that the TSC itself is still reliable even if the fre=
quency
isn't known.  On the other hand, the frequency could be computed via calibr=
ation,
at which point the frequency is no longer reliable and arguably should be s=
anity
checked.

