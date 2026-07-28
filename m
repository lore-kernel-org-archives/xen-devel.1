Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A526C53209
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 00:50:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371988.1619397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woW0w-0005Rb-0v; Tue, 28 Jul 2026 00:49:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371988.1619397; Tue, 28 Jul 2026 00:49:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woW0v-0005RT-ST; Tue, 28 Jul 2026 00:49:45 +0000
Received: by outflank-mailman (input) for mailman id 1371988;
 Tue, 28 Jul 2026 00:49:44 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3ovxnagYKCZUH3zC815DD5A3.1DBM3C-23K3AA7HIH.M3CEGD831I.DG5@flex--seanjc.bounces.google.com>)
 id 1woW0u-0005RN-GF
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 00:49:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woW0r-009Yu5-4v
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 02:49:41 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3ovxnagYKCZUH3zC815DD5A3.1DBM3C-23K3AA7HIH.M3CEGD831I.DG5@flex--seanjc.bounces.google.com>)
 id 6a67fc45-bab6-0a2a0a5309dd-0a2a4505c8e2-30
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 02:49:41 +0200
Received: from [209.85.210.198] (helo=mail-pf1-f198.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3ovxnagYKCZUH3zC815DD5A3.1DBM3C-23K3AA7HIH.M3CEGD831I.DG5@flex--seanjc.bounces.google.com>)
 id 6a67fca3-4cb1-0a2a45050019-d155d2c6d594-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 02:49:40 +0200
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-8485b7e18b4so765064b3a.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 17:49:40 -0700 (PDT)
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
        d=google.com; s=20251104; t=1785199779; x=1785804579; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Rh58w/CoC195RwMUiGs5mRBV6pN+0fX10aJLkQo2qUM=;
        b=HspG83XKTe2fm177sypY5qoLcwTMmj3qC9UCY6vmVnU1Njsp+0j+uYOv9r0isaxsnA
         oWva8YkaW9YIJLBqdWeH6PLWF384+t8DcQ+fLYnMXORZkjm2ZrDk6x1+eWwT2meaQh/8
         GHkaDqznbpofAQhRHTnCTCk1VHCoYRtmhLfiwoh/Or+McsbzRgeEHcHC78q8bKBbEN4X
         ObQcKR4xZnTdHJJhDL/V56g1kCo7htgT++ENELqNhQByB7Hzjb4G0gg+4zc+3CcSF0JR
         NN6fO3vLN78unQh242uVjsMPCd/xtAUkpLvD/P29Qm/PgsnYVIZoc7AOpkcov17zN/2v
         xDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785199779; x=1785804579;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rh58w/CoC195RwMUiGs5mRBV6pN+0fX10aJLkQo2qUM=;
        b=J+1EP2T1q8NArC+JjeZPAKJpn4/Zl4OXEK3O5M6tZg8/YEefeoLIfn6q7dMV4Ivjgq
         rswCrjcUgzA7l9cp/XbwtPyn8diBz5m93kKl6st+m5mY8jZ8npqy0CXFpEQ4UhDQlr3a
         4NXrKSfLu97RxRY2QQUbL/M5FdVBvc4PLoKICHIe/MMAL3OHZrYFbOlrpP+UNpAmvq23
         IXamOFuZrQX0RZq1x0Y4EoyslEEX68CbYLM2OFwFlPMtZltEupJbDFGdHLFSCFX+hPJL
         a+Zu071DWaYOpBJ/roJr4H9TClgn4zgHD4oDA/QDAoa/yhCkA1s5HQ8DYlBS+Ai6g8uX
         dzVg==
X-Forwarded-Encrypted: i=1; AHgh+Rp5vIY1pCNarNir3rEvkbURDhmaIy2MLpKxsXjrqby5yF08/evfBAYNzkQzEzD10As1W/RgJe0t2t8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKvUXP1lS9aUyAFRwlpVe4YN2hqHLvltGhy8n+pmif8C1u6MYl
	l1fq+EfkdDxUfWtL7Nu/vwTcuOhI0lel34MsU/QFB77iFG7k+byIszhyZxa1suBzfi8EjPTjc0D
	2bvnG/g==
X-Received: from pfjd8.prod.google.com ([2002:a05:6a00:2448:b0:848:416d:e7f3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1743:b0:84a:2d5c:528c
 with SMTP id d2e1a72fcca58-84e93338791mr163480b3a.61.1785199778667; Mon, 27
 Jul 2026 17:49:38 -0700 (PDT)
Date: Mon, 27 Jul 2026 17:49:38 -0700
In-Reply-To: <19ec3f984a494a0d5e97b8d2fa843668b953a212.camel@infradead.org>
Mime-Version: 1.0
References: <20260703212145.343527-1-dwmw2@infradead.org> <20260703212145.343527-13-dwmw2@infradead.org>
 <amPZRkxTLE-rZcJf@google.com> <19ec3f984a494a0d5e97b8d2fa843668b953a212.camel@infradead.org>
Message-ID: <amf8okZRWIL2mds7@google.com>
Subject: Re: [PATCH v6 12/36] KVM: x86: Restructure get_kvmclock()
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Paul Durrant <paul@xen.org>, 
	Jonathan Cameron <jic23@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, Jack Allister <jalliste@amazon.com>, 
	Dongli Zhang <dongli.zhang@oracle.com>, joe.jin@oracle.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c201ff/1785199781-F44A42A1-65588D86/0/0
X-purgate-type: clean
X-purgate-size: 1708

On Sat, Jul 25, 2026, David Woodhouse wrote:
> On Fri, 2026-07-24 at 14:29 -0700, Sean Christopherson wrote:
> > =C2=A0
> > > Given that, the get_cpu()/put_cpu() pinning is not needed either: bot=
h
> > > the TSC read and get_cpu_tsc_khz() are CPU-independent when the maste=
r
> > > clock is in use, so drop them.
> > >=20
> > > Wrap the entire use_master_clock block in #ifdef CONFIG_X86_64, since
> > > use_master_clock is never true on 32-bit (host_tsc_clocksource is onl=
y
> > > set under CONFIG_X86_64), and declare hv_clock inside the block so it=
 is
> > > not left as an unused variable on 32-bit.
> > >=20
> > > Use 'continue' on the master-clock success path so the non-master-clo=
ck
> > > computation becomes the common tail, avoiding a goto and label. When =
the
> > > clock read fails (e.g. clocksource transitioning away from TSC), fall
> > > back to that path rather than proceeding with uninitialised data or
> > > spinning in the seqcount loop.
> >=20
> > Please split this up.=C2=A0 The changelog suggests there are at least t=
hree logical
> > changes here.=C2=A0 Yeah, the series is big, but smaller patches helps =
with review,
> > even if it results in more total patches.
>=20
> I don't think the latter two are separable; the refactoring of the
> ifdef and the loop and the way it breaks out to the tail are all
> intertwined. I may be able to pull the get_cpu()/get_cpu_tsc_khz() part
> out into a preliminary commit though. I'll take a look.

Yeah, that's totally fine.  I specifically want to isolate the removal
of get_cpu()/put_cpu() and the removal of __this_cpu_read(cpu_tsc_khz), if =
the
rest is an interwined mess, then so be it.


