Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7517C5AC67
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 21:46:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388623.1629613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtuIu-0003Nv-Af; Tue, 11 Aug 2026 21:46:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388623.1629613; Tue, 11 Aug 2026 21:46:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtuIu-0003No-7Q; Tue, 11 Aug 2026 21:46:36 +0000
Received: by outflank-mailman (input) for mailman id 1388623;
 Tue, 11 Aug 2026 21:46:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3OJh7agYKCbEjVReaTXffXcV.TfdoVe-UVmVccZjkj.oVegifaVTk.fiX@flex--seanjc.bounces.google.com>)
 id 1wtuIt-0003Ng-9G
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 21:46:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtuIs-00DCOd-ME
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 23:46:34 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3OJh7agYKCbEjVReaTXffXcV.TfdoVe-UVmVccZjkj.oVegifaVTk.fiX@flex--seanjc.bounces.google.com>)
 id 6a7b9832-bab6-0a2a0a5309dd-0a2a450ab5d0-2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 23:46:34 +0200
Received: from [209.85.215.197] (helo=mail-pg1-f197.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3OJh7agYKCbEjVReaTXffXcV.TfdoVe-UVmVccZjkj.oVegifaVTk.fiX@flex--seanjc.bounces.google.com>)
 id 6a7b9839-f2d2-0a2a450a0019-d155d7c5b50f-3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 23:46:34 +0200
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-cbb467e56aaso223346a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 14:46:34 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786484792; x=1787089592; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GNP84U5NVANNewsvSEzbCgg+MDCqvRSKiMtE5jPKweo=;
        b=Micf/Ccj7OCe7RGEQxYVcALcLKQzeHnbXv+sqv2hh5TAmfVo52vHpYTyRCnBbT1jV1
         8osw8bMFN58yaoXUbkb8E9PTcleA+hY8l3lwns9b4MBGKS9KkszAXum2ACun78nczwmV
         5D9SBi1cD5vQ503qqHo1Zf6gCTrQDLiJYaTJMrOSi5uytzu1z2UQcmhpduPKH9bDknmE
         yrYww2zsFisNCW01uGBwHOKwUniSd5qEcmxaki5D9t/z27Pz6BLaYhoIHxw5yLb8nDGh
         c/xZV+pPrbYCmEU4wkkc0wDd0pcKGYgdc6qI14LUxOl2E+SPjPVuXLdHsrxolSD3lt14
         +a7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786484792; x=1787089592;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GNP84U5NVANNewsvSEzbCgg+MDCqvRSKiMtE5jPKweo=;
        b=TT/sxcxwV7E91gUPhymwCPSHeIwBbXUzUnvc5zoNsT0iiiDd9v4Ngt0Yqo/JyVVDQ8
         GgwHtsMjRaCt1m6VpT7Ymhqmg46UK4aBWfnx778YMHs1/oHQWdZwKemA3HyytNgRQ233
         M3bwkTI/Z1JupN9gdV8BkjCUMcEqg5jawMkRMcbiHNICLI9LLeCRQnHU4FTuzg3F942I
         X27BjcMvaUFZBH9MVCRKp4Fg0C6Ncvh+GpJT1DyxrvJTb1TK4AkR2bn0kqQOLhR5nVTo
         AqIZmfHgeKiBfhBDFM0qFTf2HKUhpZ8n0VdrRf0z5t18L1hoRyF6JDgcRi837Y7ZrbK3
         1Gbg==
X-Forwarded-Encrypted: i=1; AHgh+Rq0n2jO0h7aK2HxU6mRiVtOQj0BrxeYxjFLuViObc5ACRx6SbSgzHoKKQTADRZO9OK3ndCJUUpv71o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQLFzasOmAFfhU5Nspx+uNk95/3yq0eo4H44PBhfLof5S9VTXN
	lQEocrgINc5c6zrxIaFrxUzpQo5oM1cJ5vuxB2qlAot+mJrltB0vmMhyZI9zqypv/WHWyohcilf
	o4ULuNw==
X-Received: from pfbgp12.prod.google.com ([2002:a05:6a00:3b8c:b0:84b:4480:8b65])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2ea8:b0:847:98ff:4af5
 with SMTP id d2e1a72fcca58-84fb54c5d00mr290195b3a.26.1786484792108; Tue, 11
 Aug 2026 14:46:32 -0700 (PDT)
Date: Tue, 11 Aug 2026 14:46:31 -0700
In-Reply-To: <3dc73f745b6abfd1eb53e7d3fce2067eaa3b3c92.camel@infradead.org>
Mime-Version: 1.0
References: <bb9a12cc663130eb2caa8e839d0f6ca53d722d1c.camel@infradead.org>
 <ansuqrD2KwFuLWbV@google.com> <ansywxh0VX5rtfWc@google.com>
 <e256fa4af96e916ba30019cbba501fa896025fb0.camel@infradead.org>
 <antQYJvRxJxOjtut@google.com> <f5dc701cf3319a7b3c8fd1497f26d051aa9fa3ba.camel@infradead.org>
 <antb01WqOrs-tztm@google.com> <6ab49538675d97f1f4bf01574b1b066aae0bc05c.camel@infradead.org>
 <ants4VjfAiblaWsl@google.com> <3dc73f745b6abfd1eb53e7d3fce2067eaa3b3c92.camel@infradead.org>
Message-ID: <anuYNxD81OE3MrQw@google.com>
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
X-purgate-ID: tlsNG-4011c0/1786484794-58DC7CFC-57CBBD08/0/0
X-purgate-type: clean
X-purgate-size: 5174

On Tue, Aug 11, 2026, David Woodhouse wrote:
> On Tue, 2026-08-11 at 11:41 -0700, Sean Christopherson wrote:
> > OMG, I hate this code.=C2=A0 After literally hours of staring at this, =
and even typing
> > up a lengthy example of why guest time would go off the rails, I finall=
y spotted
> > that l1_tsc_offset is accounted for by the call to kvm_read_l1_tsc().=
=C2=A0 FML.
> >=20
> > Thanks for being patient and not flaming me too much :-)
>=20
> Haha, no judgement. We *all* hate this code. That's why I threw my toys
> out of the pram and went on this crusade to clean it up a bit.
>=20
> > > > > And your variant just added a dependency on wallclock time back i=
nto it
> > > >=20
> > > > Can you elaborate?=C2=A0 I'm guessing I don't entirely understand w=
hat you mean by
> > > > wallclock time.
> > >=20
> > > The system_time field? The unspecified might-be-UTC-might-have-leap-s=
econds one :)
> >=20
> > Ok, I think I finally understand the goal.=C2=A0 I got turned around by=
 the combination
> > of the name SET_CLOCK_GUEST and the full pvclock structure being passed=
 to the
> > guest.=C2=A0 I was expecting SET_CLOCK_GUEST to literally set the entir=
e clock, e.g.
> > mul+shift, timestamp, etc.
>=20
> That's an implementation detail.=C2=A0

Yes and no.  If the payload didn't literally have all the assets needed to =
set
the kvmclock fields, then I wouldn't care.  But I don't think I'd be the on=
ly
person to see a GET+SET pair and expect GET to return exactly what was writ=
ten
via SET.

> It is literally getting the clock as the guest sees it, and setting it
> again on the destination from the same guest-ABI pvclock structure.
> From the userspace point of view those actions *are* symmetrical.

Only if userspace holds it just so.

> I'd actually *like* it to just be a memcpy at both ends, even on the
> SET side, just copying what userspace provides into what we offer to
> the guest as its pvclock.
>=20
> But as well as wanting to do some sanity checking, we also live in a
> world where we might have to switch to the non-masterclock mode at any
> time, and we have to ingest the information into the per-VM kvmclock
> setup in a way that the kernel "understands", and that's why it ends up
> implemented the way it is.
>=20
> I looked at rewriting the masterclock base information from what
> userspace is providing, but there are *host* TSC values in there, and
> it ended up in some cases wanting to set ka->master_cycle_now to a
> value which is *negative* on the new host, and I didn't want to
> exercise that wrap-around path. So instead we just adjust
> ka->kvmclock_offset to give appropriate results based on the existing
> masterclock base.
>=20
> Each vCPU's pvclock is then *regenerated* from the VM-side kvmclock
> data, giving rise to that annoying =C2=B11ns discrepancy that I whined ab=
out
> a while back, but didn't give in to my perfectionism and eliminate...
> yet.
>=20
> As far as userspace is concerned, KVM_SET_CLOCK_GUEST *does* set the
> entire clock (at least the relationship between guest TSC and kvmclock
> nanoseconds, which is what it's for). It's just that the kernel then
> "tweaks" it a little bit to give a slightly different y=3Dm(x-x')+c
> equation which is still within the noise of the original.

Again, if and only if the fields match what has been written previoiusly.  =
To
me, that's not a SET operation given the full inputs.

I completely agree that conceptually this is intended to SET the entire clo=
ck,
but as you note above, reality doesn't allow for that.

> And the kernel actually does that kind of 'tweak' all the time.
> Although we're working on narrowing them down because "within the
> noise" is in the eye of the beholder; Dongli had some patches for that
> which I think I rounded up and included?
>=20
> > But all of that metadata is just a means to an end: the one and only go=
al is to
> > calculate the per-VM kvmclock_offset for the "new" host's TSC+time snap=
shot, by
> > computing the nanoseconds delta for the new snapshot as if it the guest=
 observed
> > the TSC while running on the old host.
>=20
> That is currently how it is implemented. It isn't the API contract.
>=20
> > And that is done in the kernel instead of in userspace to minimize the =
amount of
> > slop introduced due to delay between taking the snapshot and computing =
the offset.
>=20
> Huh? There should be no delays here. If *anything* in this new code is
> done with something other than a *simultaneous* reading of TSC and
> ktime that I sweated blood and tears and got shouted at by Thomas for,
> then that *is* something I care about...

Sorry, I didn't mean to imply there would be delay on the SET side.  What I=
 was
trying to say is that if this were punted to userspace, then there _would_ =
be a
ton of slop because it would be practically impossible for userspace to pro=
vide
the correct offset. (I was walking myself through why KVM needed to provide=
 uAPI
to compute the offset, as opposed to provide uAPI to let userspace jam in w=
hatever
value it wanted).

