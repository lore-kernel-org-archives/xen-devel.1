Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296E1C53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 01:15:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372003.1619414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woWPs-0001AI-3i; Tue, 28 Jul 2026 01:15:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372003.1619414; Tue, 28 Jul 2026 01:15:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woWPs-0001AB-0R; Tue, 28 Jul 2026 01:15:32 +0000
Received: by outflank-mailman (input) for mailman id 1372003;
 Tue, 28 Jul 2026 01:15:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3rgJoagYKCa0fRNaWPTbbTYR.PbZkRa-QRiRYYVfgf.kRacebWRPg.beT@flex--seanjc.bounces.google.com>)
 id 1woWPq-0001A5-Or
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 01:15:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woWPp-009Wlk-Hc
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 03:15:29 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3rgJoagYKCa0fRNaWPTbbTYR.PbZkRa-QRiRYYVfgf.kRacebWRPg.beT@flex--seanjc.bounces.google.com>)
 id 6a680288-2eae-0a2a0a5409dd-0a2a450bafde-26
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 03:15:29 +0200
Received: from [209.85.214.197] (helo=mail-pl1-f197.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3rgJoagYKCa0fRNaWPTbbTYR.PbZkRa-QRiRYYVfgf.kRacebWRPg.beT@flex--seanjc.bounces.google.com>)
 id 6a6802af-b7e8-0a2a450b0019-d155d6c5c59d-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 03:15:28 +0200
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2cd01a14e81so46593575ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 18:15:28 -0700 (PDT)
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
        d=google.com; s=20251104; t=1785201327; x=1785806127; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c0xvxXA1DaICzQTJ/i8SO6Ba9ZbY1wPwU/bxHtjqVsI=;
        b=qDk9E5xZLhM87DgWquFTgM9X2MMUTLdWZyMAMpQu8HvIxv9e18QbcQGkbiXic2u+Uz
         lXIBxzKQvNmg5hRlfcFsGfA16yrV3pJayH/y3PGP4MfnKSoDEe9IHeX/jXjdoohAzu00
         ijyGiM97u7yF93nX7ERBdVSmyl4rUW8jXbBjQMQ07ibkhreD15BxXAkzh+t/GAMWhThs
         0X/NbsDzDrErJNvMjXq2eBoQli28LyYiT8w7saP0NdzgkCFW7udDiP4jGNplRKpiNqrT
         YUIJkQmabro0oP2cTIWVqgPj3IS+cWhXXKCQGEc5oHt7eIJc926J7/qLFzQ+EgFPkFP3
         U8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785201327; x=1785806127;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c0xvxXA1DaICzQTJ/i8SO6Ba9ZbY1wPwU/bxHtjqVsI=;
        b=ZGlNL48Otzp0whsfFwF3HTSqUp/YxDd7un/SIK+XzlrQD+PRaVbX8392nF2qBD6v3G
         sGkG2lZPSJ8MppC977aMc4UbBRdyTa3KurUZJRARAQwlX25B1QEDZIAVB3qre4/qklXS
         rpeEIiWQed88Re63+RKRpgMRqsyvGyoGaB2fM5aDmt08XB8SUPN5flUZBxlI8MW1CQzv
         VPBncFr4z1pgGL0hzp3mlAnc/kwTMx0nwaKXnN8l7CH4eDU/zuT/nfNC0eRhWvHHtg+K
         4I3u1HxESXuSAeJzjnPU3mH6vGRfqzTXgVHKT689+17klPq+qcRx8PvPb02qBdn5aMRn
         aW/w==
X-Forwarded-Encrypted: i=1; AHgh+Rpg0dmB3DmEJdj81k7I/5zvKF3rC5vIXgUqnjY6/k1gLNdfan5iMoUgvgRG/2wFOi1Oxko26HKWvCw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YznAz7fSCt3bnZVeRlpwLyKCtL15Diem1yWjK5X8xt0Mr/3OM2u
	oEs+8M6+HFgY8mJIM6czk73MW+g7PN3YjyhizjmPwz/BDsUcEPuJbkZAjH/gyt9ZHgnin784wFD
	RvXW1ow==
X-Received: from plas11.prod.google.com ([2002:a17:903:200b:b0:2ca:eea9:9845])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ef11:b0:2cc:670d:9b2f
 with SMTP id d9443c01a7336-2d015d57715mr2698085ad.33.1785201326747; Mon, 27
 Jul 2026 18:15:26 -0700 (PDT)
Date: Mon, 27 Jul 2026 18:15:26 -0700
In-Reply-To: <e8e7554debef481d13265f0870e847e2fa37f7c2.camel@infradead.org>
Mime-Version: 1.0
References: <20260703212145.343527-1-dwmw2@infradead.org> <20260703212145.343527-6-dwmw2@infradead.org>
 <amPWX8lKXw2KS_kZ@google.com> <e8e7554debef481d13265f0870e847e2fa37f7c2.camel@infradead.org>
Message-ID: <amgCrqyqg0zFbhO4@google.com>
Subject: Re: [PATCH v6 05/36] KVM: x86: Add KVM_[GS]ET_CLOCK_GUEST for
 accurate KVM clock migration
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
X-purgate-ID: tlsNG-42698a/1785201329-1AAD89EA-B38FD0B1/0/0
X-purgate-type: clean
X-purgate-size: 2520

On Sat, Jul 25, 2026, David Woodhouse wrote:
> On Fri, 2026-07-24 at 14:17 -0700, Sean Christopherson wrote:
> > Please post this as a standalone mini-series.=C2=A0 AFAICT, the only de=
pendency of
> > any kind is a minor conflict with the s/hw_tsc_khz/hw_tsc_hz change, an=
d that's
> > trivial to sort out later on.
>=20
> Hm? The calculations in kvm_vcpu_ioctl_set_clock_guest() are all Hz-
> based, not kHz. This *was* the start of the series (Jack posted it on
> its own in 2024), and I thought I'd moved the khz/hz thing to live
> before it on purpose?
>=20
> The kvm_xen_shared_info_init() one could be later, I guess. But is also
> trivial (and its commit message sets the stage for a bunch of the
> cleanups by analysing the various *different* ways that kvmclock gets
> derived).=20
>=20
> I confess I'm not stunningly keen on breaking the series up.

Can the KVM_[GS]ET_CLOCK_GUEST changes be moved to the end of the series?  =
The
total size of the series doesn't scare me, I just don't want to end up with=
 all
the fixes and cleanups stuck behind a patch that isn't a hard dependency.  =
E.g.
AFAICT, none of the following changes, include selftests updates, actualy r=
ely
on KVM_[GS]ET_CLOCK_GUEST existing.

> How about we just do it in stages? Merge patch 1 as it's fairly trivial,=
=20

Ya, I pushed that to kvm-x86 last week, though I rebased it today because o=
f an
unrelated goof.  It's currently commit 710b3a30f407 ("KVM: x86/xen: Do not =
corrupt
KVM clock in kvm_xen_shared_info_init()").  If nothing blows up in the next=
 or two,
that should be the stable hash going forward.

> and then I can use its commit ID when I refer to its taxonomy later. Then=
 we
> can do patches 2-6 which are the KVM_[GS]ET_CLOCK_GUEST support. And I ca=
n
> repost the remainder on top of that?
>=20
> > > +4.145 KVM_GET_CLOCK_GUEST
> > > +----------------------------
> > > +
> > > +:Capability: none
> >=20
> > Why not add a CAP?=C2=A0 The check in the subsequent selftest is quite =
gross.
>=20
> Because nobody would ever use it in practice anyway. Even if the ioctl
> is present, you *still* have to try it and fall back to the old method
> because there are ways that a *guest* can force master clock mode off.

Hmm, I can see setups where a single entity controls both the host and the =
guest
wanting to assert that KVM_SET_CLOCK_GUEST succeeds, though I suppose it's
unlikely such setups would use KVM_SET_CLOCK_GUEST in the first place.

