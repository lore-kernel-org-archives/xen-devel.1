Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A394DC5B56A
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 18:42:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388435.1629578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtrQ0-0001VB-5E; Tue, 11 Aug 2026 18:41:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388435.1629578; Tue, 11 Aug 2026 18:41:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtrQ0-0001V4-1c; Tue, 11 Aug 2026 18:41:44 +0000
Received: by outflank-mailman (input) for mailman id 1388435;
 Tue, 11 Aug 2026 18:41:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <342x7agYKCQYykgtpimuumrk.ius3kt-jk1krroyzy.3ktvxupkiz.uxm@flex--seanjc.bounces.google.com>)
 id 1wtrPy-0001Uy-Kj
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 18:41:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtrPx-00CtZ6-Og
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 20:41:41 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <342x7agYKCQYykgtpimuumrk.ius3kt-jk1krroyzy.3ktvxupkiz.uxm@flex--seanjc.bounces.google.com>)
 id 6a7b6cc1-8faa-0a2a0a5109dd-0a2a4507bc5c-16
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 20:41:41 +0200
Received: from [209.85.210.199] (helo=mail-pf1-f199.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <342x7agYKCQYykgtpimuumrk.ius3kt-jk1krroyzy.3ktvxupkiz.uxm@flex--seanjc.bounces.google.com>)
 id 6a7b6ce4-b4ea-0a2a45070019-d155d2c7bca8-3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 20:41:41 +0200
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-848d21bbb55so290973b3a.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 11:41:41 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786473699; x=1787078499; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fJOzqFK/vfJSw1ado9uoaagkeuADN2fLa/8s2FkuGPk=;
        b=inzUb2pIGixCuZQ6srCLxR8knMdOLzFg7fWEDT2kx83KyRG8nmjoV58pwVm0W8P3gY
         S1J5f+i3vpaFiDlxSiXa6z6KRZy4wvGn2J1j4P4mLKEmjo+UhEUH26KFH1Yf2QoyEFhj
         /Dn/cfftinBuPITSibSYaefhtoxlO3vkV/YH13IuchaSPhpjCZHPoGgu5jjd9efT3F2i
         HYwpmSoHjRD2nYV1BA/1ywDEQgbdcx2xV+tPwF3YlbyI2rRUiH7Y84FJEtN5YsXwjopS
         kzzCvOWqrhv1eQ8JMfo0fdYZRVkVgSb3V0TngbDZwHZHlq6vNbHbBBxO5dQxAm08dn8M
         IkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786473699; x=1787078499;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fJOzqFK/vfJSw1ado9uoaagkeuADN2fLa/8s2FkuGPk=;
        b=hdkVs32Meb9S+llZrxkDx0dOdSc8FPhWfpq0DzWVO6OWGbGmSsmReu7V17+Y1tQu/P
         UpIgZKzkJw/0Shcr1UjRnQRyAq2qucHuagWj2LME+Xqy2ztqWPi5Cvq2JwIjOGHDbJzt
         BY0QBub55MkxGOhzuh3kb3XcybL07fKE7nSvjDsilVILBpJWjLmo+kjZtdowd/uP70hV
         rrf1rM3LUcguJ1EBIkRE1Vj5dMiG5dkXuhCY9uzyZsRmRJkN8VwN+h05bvKlZrmwdaBh
         tdMTx0YcK+6d3R3rgXi3+dYbQlzoFlT6vd8QE+4OrjFQ6GE9MxdcsKCsN38pKJZNWtbC
         zfdg==
X-Forwarded-Encrypted: i=1; AHgh+Rrd52zgiKJNbowc2EWfRSwu5YStF3WcZHY1jujGs9BCDeLOFIh8jqOM/Z4mCDiWWXvswEXUqOWyEDA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzB19O6gbOSCywJYBfJ8MUwfK5dtaLvPS4GoZlufhDAYw4t2kNH
	IMa6hRN+SEkw2kaKyglJLPS6+2uQYNjumMVf98nDBdZ/G4EO2x4diTS6cZpoZyuH1XbHuPSGEsG
	d+coC1A==
X-Received: from pfbih2.prod.google.com ([2002:a05:6a00:8c02:b0:84e:530a:923a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2355:b0:848:2c6c:dfe3
 with SMTP id d2e1a72fcca58-84fa86c28d9mr5596667b3a.17.1786473699196; Tue, 11
 Aug 2026 11:41:39 -0700 (PDT)
Date: Tue, 11 Aug 2026 11:41:37 -0700
In-Reply-To: <6ab49538675d97f1f4bf01574b1b066aae0bc05c.camel@infradead.org>
Mime-Version: 1.0
References: <acd9b32617f75d188c370a464a922af0d650d4f5.camel@infradead.org>
 <ano6-gIZtqMfipiD@google.com> <bb9a12cc663130eb2caa8e839d0f6ca53d722d1c.camel@infradead.org>
 <ansuqrD2KwFuLWbV@google.com> <ansywxh0VX5rtfWc@google.com>
 <e256fa4af96e916ba30019cbba501fa896025fb0.camel@infradead.org>
 <antQYJvRxJxOjtut@google.com> <f5dc701cf3319a7b3c8fd1497f26d051aa9fa3ba.camel@infradead.org>
 <antb01WqOrs-tztm@google.com> <6ab49538675d97f1f4bf01574b1b066aae0bc05c.camel@infradead.org>
Message-ID: <ants4VjfAiblaWsl@google.com>
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
X-purgate-ID: tlsNG-ef75cf/1786473701-376D2AE4-FA9516AF/0/0
X-purgate-type: clean
X-purgate-size: 3744

On Tue, Aug 11, 2026, David Woodhouse wrote:
> On Tue, 2026-08-11 at 10:28 -0700, Sean Christopherson wrote:
> > On Tue, Aug 11, 2026, David Woodhouse wrote:
> > > On Tue, 2026-08-11 at 09:40 -0700, Sean Christopherson wrote:
> > > >=20
> > > > >=20
> > > > > FWIW in my local tree I've just extended the pvclock_migration_te=
st to
> > > > > test precisely the thing you were concerned about: three vCPUs wi=
th
> > > > > divergent TSC offsets, migrated by setting each vCPU's TSC and th=
en
> > > > > invoking KVM_SET_CLOCK_GUEST once, through vCPU0.=20
> > > >=20
> > > > I wasn't actually concerned about migration, I was concerned about =
time going
> > > > backwards from the guest's perspective.
> > >=20
> > > But KVM_[SG]ET_CLOCK_GUEST is *purely* for migration.=20
> >=20
> > Huh?=C2=A0 I raised my concern in the context of "Allow KVM master cloc=
k mode when
> > TSCs are offset from each other", and AFAICT, nothing ensures that won'=
t cause
> > problems.
> >=20
> > Aaah, it clears PVCLOCK_TSC_STABLE_BIT and relies on the guest to clean=
 up the
> > mess.=C2=A0 So the guest won't see time go backwards, but it could see =
time stop for
> > an extended duration, or jump forward.
>=20
> It shouldn't. Each vCPU gets its *own* pvclock structure, tailored to
> *its* offset. They should all see *identical* results.

OMG, I hate this code.  After literally hours of staring at this, and even =
typing
up a lengthy example of why guest time would go off the rails, I finally sp=
otted
that l1_tsc_offset is accounted for by the call to kvm_read_l1_tsc().  FML.

Thanks for being patient and not flaming me too much :-)

> But yeah, if the guest does that then we can't set the
> PVCLOCK_TSC_STABLE_BIT.
> >=20
> > > And your variant just added a dependency on wallclock time back into =
it
> >=20
> > Can you elaborate?=C2=A0 I'm guessing I don't entirely understand what =
you mean by
> > wallclock time.
>=20
> The system_time field? The unspecified might-be-UTC-might-have-leap-secon=
ds one :)

Ok, I think I finally understand the goal.  I got turned around by the comb=
ination
of the name SET_CLOCK_GUEST and the full pvclock structure being passed to =
the
guest.  I was expecting SET_CLOCK_GUEST to literally set the entire clock, =
e.g.
mul+shift, timestamp, etc.

But all of that metadata is just a means to an end: the one and only goal i=
s to
calculate the per-VM kvmclock_offset for the "new" host's TSC+time snapshot=
, by
computing the nanoseconds delta for the new snapshot as if it the guest obs=
erved
the TSC while running on the old host.

And that is done in the kernel instead of in userspace to minimize the amou=
nt of
slop introduced due to delay between taking the snapshot and computing the =
offset.
And for similar reasons, it's undesirable for userspace to redo the GET on =
the
target to compute the explicit offset, because there would be a massive TOC=
TOU
issue, e.g. if KVM took a new masterclock snapshot between GET and SET.

After working through that, I feel quite strongly that we should have asymm=
etric
names for the GET vs. SET flows, because the actually functionality is also=
 very
asymmetric.  And setting a field, and only that field, that's doesn't have =
a
direct association in the userspace payload is very surprising when the nam=
e of
the ioctl suggests a restoration of the entire payload.

E.g. KVM_GET_REFERENCE_PVCLOCK and then KVM_SET_REFERENCE_PVCLOCK_OFFSET?  =
Or
maybe UPDATE, CALCULATE, REFRESH, or COMPUTE instead of SET?  I think I'd v=
ote
for SET even though it's convoluted, because pretty much everyone associate=
s SET
with the restore side of save/restore.

