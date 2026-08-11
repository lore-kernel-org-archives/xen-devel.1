Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7573C5AC67
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 23:14:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388665.1629650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtvfg-0000X5-1x; Tue, 11 Aug 2026 23:14:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388665.1629650; Tue, 11 Aug 2026 23:14:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtvff-0000Wy-VD; Tue, 11 Aug 2026 23:14:11 +0000
Received: by outflank-mailman (input) for mailman id 1388665;
 Tue, 11 Aug 2026 23:14:11 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3wKx7agYKCWMTFBOKDHPPHMF.DPNYFO-EFWFMMJTUT.YFOQSPKFDU.PSH@flex--seanjc.bounces.google.com>)
 id 1wtvff-0000Ws-4W
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 23:14:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtvfe-00CNle-Cf
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 01:14:10 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3wKx7agYKCWMTFBOKDHPPHMF.DPNYFO-EFWFMMJTUT.YFOQSPKFDU.PSH@flex--seanjc.bounces.google.com>)
 id 6a7baca6-8faa-0a2a0a5109dd-0a2a4502e3d8-14
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 01:14:10 +0200
Received: from [209.85.210.199] (helo=mail-pf1-f199.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3wKx7agYKCWMTFBOKDHPPHMF.DPNYFO-EFWFMMJTUT.YFOQSPKFDU.PSH@flex--seanjc.bounces.google.com>)
 id 6a7bacc0-6ca4-0a2a45020019-d155d2c7d108-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 01:14:10 +0200
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-84e048a801dso507382b3a.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 16:14:09 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786490048; x=1787094848; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eTsKS/p1yVC2Lax9wd0GxNhGxmDx0nu+r7cGaHMy4LY=;
        b=iQmIwmk9E0vYHZJ1fWufOQdD6SS2j0lCYKDaQJFEcthvOS7mu3bxSV3HVQJZ5EnWRl
         ENiYmzdk8QswpdGtJG1lWmMeOKM/l0HLH6SDHvJJI7LVVEPT93YR+8CRRrNVOvXSfVgO
         2nwZMEQKsqzEKT3WuLPvUQTueaDCiX7tzBPzskG4+6zAAv3a9aalih7qu4dAelO8NI7f
         VwhnpTty3WSmJ1sygsUKx86bnBx9xkitJHIh3EgbOdohv3MF8gv/4eoUI5sBBByR8ski
         C4lmF8nWCTmPvBUBnO2xKtPzNrmh9jLQa4zYqh1pbQNdLBo1FVn5BLtiBY7Mk50MEDD2
         nlAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786490048; x=1787094848;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eTsKS/p1yVC2Lax9wd0GxNhGxmDx0nu+r7cGaHMy4LY=;
        b=LLRWj/IeJfGXNlR3WWenoZ/deQ/wNRZ9VioOkSv8w3GOY2zb4yUgnegZpQxY+K1L6c
         9WS5qVObRtXpP8Dm8tewQ2gvJqJwN3RHUm06rVuSXXG5UFIBPPDb7BOjvVNMV03B3e/E
         nhVHzSLHq7fRPuoWKD23lS/CQrS8kWAIYPtLYGFLRq6tm0dUh1hId7h+D56CP5Hq/Iht
         PA5Xq/a747baJiUvB5KF0MA+7/3D8CmW665BcWYNBPEH7B2JX1tMu+k55WQ0AjU71KTQ
         mvCcvqWWTuIxDbFsQDEsT7e+4lrw5KD1CICGxi6nbNRxQwPo6xoAuMIcMtnMuB97twA+
         0AeQ==
X-Forwarded-Encrypted: i=1; AHgh+RrQH8qimuaU+rqB5/pntVdqfxyuMQu6kuSYdN9kgj2+BET9oNUFCGcfnpy1s2/UtqeExu5Bbe2K8C4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxp0hgNbG1YcdgfcL95wxNRvNktlHWTYTtU7jeD2I5zFIv30z7l
	8cjFtVuCkJN3toKp+dBrR2xwnNVMoCP9NJ5CqBpwWFe5EAQuY9df/Mbghih3UsbeHt7XFGCeQGo
	MoI1f1Q==
X-Received: from pgcc19.prod.google.com ([2002:a63:1c13:0:b0:cbe:9dc7:9ef6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3497:b0:845:e8b9:347
 with SMTP id d2e1a72fcca58-84fb5404a23mr903157b3a.13.1786490048024; Tue, 11
 Aug 2026 16:14:08 -0700 (PDT)
Date: Tue, 11 Aug 2026 16:14:07 -0700
In-Reply-To: <5efe7a3914a3610ee00a487379caff84af6aa731.camel@infradead.org>
Mime-Version: 1.0
References: <ansywxh0VX5rtfWc@google.com> <e256fa4af96e916ba30019cbba501fa896025fb0.camel@infradead.org>
 <antQYJvRxJxOjtut@google.com> <f5dc701cf3319a7b3c8fd1497f26d051aa9fa3ba.camel@infradead.org>
 <antb01WqOrs-tztm@google.com> <6ab49538675d97f1f4bf01574b1b066aae0bc05c.camel@infradead.org>
 <ants4VjfAiblaWsl@google.com> <3dc73f745b6abfd1eb53e7d3fce2067eaa3b3c92.camel@infradead.org>
 <anuYNxD81OE3MrQw@google.com> <5efe7a3914a3610ee00a487379caff84af6aa731.camel@infradead.org>
Message-ID: <anusv0DloFhLMMoW@google.com>
Subject: Re: [PATCH v7 17/36] KVM: x86: Allow KVM master clock mode when TSCs
 are offset from each other
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
X-purgate-ID: tlsNG-720697/1786490050-F20A82AC-09EAEFCC/0/0
X-purgate-type: clean
X-purgate-size: 1948

On Tue, Aug 11, 2026, David Woodhouse wrote:
> On Tue, 2026-08-11 at 14:46 -0700, Sean Christopherson wrote:
> > On Tue, Aug 11, 2026, David Woodhouse wrote:
> > > On Tue, 2026-08-11 at 11:41 -0700, Sean Christopherson wrote:
> > >=20
> > > >=20
> > > > Ok, I think I finally understand the goal.=C2=A0 I got turned aroun=
d by the combination
> > > > of the name SET_CLOCK_GUEST and the full pvclock structure being pa=
ssed to the
> > > > guest.=C2=A0 I was expecting SET_CLOCK_GUEST to literally set the e=
ntire clock, e.g.
> > > > mul+shift, timestamp, etc.
> > >=20
> > > That's an implementation detail.=C2=A0
> >=20
> > Yes and no.=C2=A0 If the payload didn't literally have all the assets n=
eeded to set
> > the kvmclock fields, then I wouldn't care.=C2=A0 But I don't think I'd =
be the only
> > person to see a GET+SET pair and expect GET to return exactly what was =
written
> > via SET.
>=20
> Sure, but right now, even a sequence of GET+GET+GET won't necessarily ret=
urn
> the same answer three times in a row =E2=80=94 not just because we haven'=
t fully
> eliminated the non-masterclock mode (which we might never do) but because=
 the
> masterclock mode itself isn't truly the first-class citizen =E2=80=94 so =
we have to
> kind of reverse-engineer it into the per-VM clock data, and then build ea=
ch
> vCPU's pvclock back out of that again.

True.

> We *ought* to live in a world where that pvclock information *is* the
> canonical source of truth, and any series of GET/SET/GET/GET/SET should n=
ever
> see it change. And we can build our future-looking API around that model.
>=20
> I think I do stand by my claim that SET/GET/GET potentially having *three=
*
> slightly different sets of data is an implementation detail that we will
> strive to eliminate.

I'm not totally opposed to a broader GET, but we should definitely get Paol=
o's
eyes on this sooner than later.

