Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90DAC53209
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 00:52:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371994.1619406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woW39-0006vJ-Bm; Tue, 28 Jul 2026 00:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371994.1619406; Tue, 28 Jul 2026 00:52:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woW39-0006vC-8u; Tue, 28 Jul 2026 00:52:03 +0000
Received: by outflank-mailman (input) for mailman id 1371994;
 Tue, 28 Jul 2026 00:52:02 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3L_1nagYKCSQSEANJCGOOGLE.COMXEN-DEVELLISTS.XENPROJECT.ORG@flex--seanjc.bounces.google.com>)
 id 1woW38-0006v4-Iv
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 00:52:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woW37-001585-WA
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 02:52:02 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3L_1nagYKCSQSEANJCGOOGLE.COMXEN-DEVELLISTS.XENPROJECT.ORG@flex--seanjc.bounces.google.com>)
 id 6a67fcfd-5cb7-0a2a0a5109dd-0a2a4502d044-22
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 02:52:01 +0200
Received: from [209.85.214.197] (helo=mail-pl1-f197.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3L_1nagYKCSQSEANJCGOOGLE.COMXEN-DEVELLISTS.XENPROJECT.ORG@flex--seanjc.bounces.google.com>)
 id 6a67fd30-6ca4-0a2a45020019-d155d6c5e900-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 02:52:01 +0200
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2caf4173b1cso63831015ad.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 17:52:01 -0700 (PDT)
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
        d=google.com; s=20251104; t=1785199920; x=1785804720; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GQi7x436nDykBGBr3THdmSxZ/qUpCFOrJDr01TocQQI=;
        b=Dr8jyTbPgiDhmm5ibgLdNjss2MSWy74eUmfcGsCRYP1ThCldKF2ZIzWlVEkDDYMK27
         WOFsZGZKUYpGVd67PVcF5Y9rIRzU3DiwEySm4YcQYFpiqe5UW5H5tCuPUwroyw19S8u2
         b5o3YJ8qXF8gkJX6fqPwIPc2Scw1pEDO9byJRneSQCgS31bf/Rp+VYXGwFECYXcolDbG
         NxBPC1y36EmnJv1YqANQhcpgLZh123hZgDS+tkoDkK8Hcct/dLrUvXBD+qMdiycrcK0V
         6GW3J6YxnfOmq3qde7WfuY8aKiikWP3wmNQLHluwsPEwsRkXR439wl0P0zio0Xq/8D2l
         QxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785199920; x=1785804720;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQi7x436nDykBGBr3THdmSxZ/qUpCFOrJDr01TocQQI=;
        b=dhCzKLo8U6/IwMfzGHb1DecVTpZBcWCFmUGTl/4jrHkvlE3N7JL1n6LeP5lrUOI8kX
         T4V4Opkhxj+0vfZhPfeD5thfEDYF8RrtrTrcuU1MOR4H4xQjA5sfUyioBlgaIVPfjKSw
         ZeRf70C2DvJMuT1YIeUBg3nBNF2kHAz4mo/3mdwddZguaenR3iJSZpG6Iu7r8c5ysn6P
         z3QbtYIQclXguAdhjDg0J6pyGVAe+z389THpxGhDfcmXW2sJ7zVDHtB+2wE9Pvzgofv1
         /BQao0x4wLkkSb4minju0VXtgMsXWmg5XYpa1EmFJQRub5EIt5fvpSmaycNvgiT4TvRj
         PThw==
X-Forwarded-Encrypted: i=1; AHgh+RqeWokM06q9iDOGcqjC3eoHDR1GchUd7cSMTdL2K/VgYdGZXAhsvG3ffQVnd9bTnv98L+7HOq9mYYs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUYe9/d7mVat61ZBQN8UqN+IkT4FJMHshdY1DQRdM6JGgnp6Dc
	tdZ5B6ROM/ceUJEIVNG9UXlbbcCJlpsxqoLnCAsr+moNwBym4eaFjHmKYhYMl6DDr7Y0AB/FnZr
	HcfiB8A==
X-Received: from plig13.prod.google.com ([2002:a17:903:458d:b0:2cc:ed0e:f302])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ce11:b0:2c9:e5ff:995d
 with SMTP id d9443c01a7336-2d015f01e44mr1928135ad.31.1785199919741; Mon, 27
 Jul 2026 17:51:59 -0700 (PDT)
Date: Mon, 27 Jul 2026 17:51:59 -0700
In-Reply-To: <b38f67187d3312c4bf2c9eddf89e14e8b10573d6.camel@infradead.org>
Mime-Version: 1.0
References: <20260703212145.343527-1-dwmw2@infradead.org> <20260703212145.343527-16-dwmw2@infradead.org>
 <amPYq48J9TPbmFNl@google.com> <b38f67187d3312c4bf2c9eddf89e14e8b10573d6.camel@infradead.org>
Message-ID: <amf9L65ZlPOqJm7A@google.com>
Subject: Re: [PATCH v6 15/36] KVM: x86: Fix compute_guest_tsc() to handle
 negative time deltas
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
X-purgate-ID: tlsNG-720697/1785199921-F16AF2AC-76DF51DC/0/0
X-purgate-type: clean
X-purgate-size: 1683

On Sat, Jul 25, 2026, David Woodhouse wrote:
> On Fri, 2026-07-24 at 14:27 -0700, Sean Christopherson wrote:
> > On Fri, Jul 03, 2026, David Woodhouse wrote:
> > > From: David Woodhouse <dwmw@amazon.co.uk>
> > >=20
> > > The compute_guest_tsc() function computes the guest TSC at a given
> > > kernel_ns timestamp. When the master clock reference point
> > > (master_kernel_ns) is earlier than vcpu->arch.this_tsc_nsec, the delt=
a
> > > is negative. Since pvclock_scale_delta() takes a u64, the negative
> > > value wraps to a huge positive number, producing a wildly wrong resul=
t.
> > >=20
> > > Handle negative deltas explicitly by negating the delta, scaling it,
> > > and subtracting from this_tsc_write.
> >=20
> > Does this need=20
> >=20
> > =C2=A0 Cc: stable@vger.kernel.org
> >=20
> > or is this a "technically a bug fix, but can't happen in practice" sort=
 of thing?
>=20
> Honestly, there's so much hosed in kvmclock that we could debate a
> cc:stable for half of this series. I'm not doing *any* of this to
> actually add new features. For this one I'm not sure it's reachable in
> practice; I think I did it mostly to shut Sashiko up.

Heh, in that case, throw a blurb in the changelog stating as much.  Knowing=
 that
a bug is likely unreachable in practice is helpful, e.g. in the super unlik=
ely
case that this change breaks someone.

> I think even in the KVM_SET_CLOCK_GUEST it can't trigger, although I
> have fantasies about changing the way KVM_SET_CLOCK_GUEST works to fix
> that final =C2=B11ns imprecision (which requires separate work on the
> timekeeping core), that *might* trigger the negative delta here...



