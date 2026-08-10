Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04991C5AD55
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 20:56:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387877.1629104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtX2v-0005TC-1q; Mon, 10 Aug 2026 20:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387877.1629104; Mon, 10 Aug 2026 20:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtX2u-0005T5-VK; Mon, 10 Aug 2026 20:56:32 +0000
Received: by outflank-mailman (input) for mailman id 1387877;
 Mon, 10 Aug 2026 20:56:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3-zp6agYKCbQmYUhdWaiiafY.WigrYh-XYpYffcmnm.rYhjlidYWn.ila@flex--seanjc.bounces.google.com>)
 id 1wtX2t-0005Sz-Ne
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 20:56:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtX2r-00FPvO-Nv
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 22:56:29 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3-zp6agYKCbQmYUhdWaiiafY.WigrYh-XYpYffcmnm.rYhjlidYWn.ila@flex--seanjc.bounces.google.com>)
 id 6a7a3ac0-8faa-0a2a0a5109dd-0a2a4503986e-32
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 22:56:29 +0200
Received: from [209.85.215.200] (helo=mail-pg1-f200.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3-zp6agYKCbQmYUhdWaiiafY.WigrYh-XYpYffcmnm.rYhjlidYWn.ila@flex--seanjc.bounces.google.com>)
 id 6a7a3afc-fae8-0a2a45030019-d155d7c8bd58-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 22:56:29 +0200
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-cab041eced3so3914743a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 13:56:29 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786395388; x=1787000188; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LCgbuv6Vd7zF2bZTNz0VWHu3WJNY8tSX432zegD8YdU=;
        b=u+UO2xODGCGgUrlf/Mr5d0z+0HcYJ0lJhHAi6HmU2+L+FqX2t/v5Sx/lVOeYoXrKiW
         1H+Hy/MwZuEG7glfm8EzJw23z9TtABPeIoyuvR5D+qr5HJleaHMpFExpI5j55bxcEtfM
         TZGNhJb0UG+n63ir7dvKXwew5PninTo36AswGFXS1gjX3wA/vVYkhCg8rzZVeL1635nf
         ufEw5vOrbM7KXtRG+2qzWgjcYoBCuUWBZWEpVrCCTo4HmE1c/bOhllSDHogP89NONUWY
         9aiVKiZIkzOQeRVUgx70/+pSBklp+H0+XBRPfRB/bEwOXPXhQ3b/WCsmD/XsHManELMe
         7bEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786395388; x=1787000188;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCgbuv6Vd7zF2bZTNz0VWHu3WJNY8tSX432zegD8YdU=;
        b=rICatsTJsTU0C2t2lQmeWvF/daPXwuRAOlfJtZeg5b1jSMYz4W+ZUg31uf6iyWfVmn
         gfC919tHnl6lmQbEI7bxEjbp3ntBPtNeMgPs2paa5ChOWenN2D6zjRioYT7hXlDfgjq8
         j/lXXVhoP6/tFMBa+FLQXI0u/xoRLzc0Joq18yRPePV9k5wbFE8YUxPCkokjAoxyL0J/
         UpITmmp0AhxOpYvWHN3qrQxRXzi0/OBkv5L+5Z4U5FAhJLi216tXEOa2HGg6hMKLuHhP
         WNlFN9dnRFBgo4WWwiFzFC6xZXJoeEwgdAZhpZsfPdN8wq+txp9gpy1KD1LG3z6LIZa6
         dLFA==
X-Forwarded-Encrypted: i=1; AHgh+Rpn75V9jjDQVWOgDSDZA1YZ1lmZXvVj1Z5wYtSqmQ4p4DJMsj4pM3WDGZwvHYdcv5KSXNbLQ72WCdk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwAhg7vtRNfJYns70KO/McAoxNEi3zUzjwzAD29ovr8HvvqWOcA
	c8x2NxGP2AV9oVegzG3M4Po05bWeBxzFjAuRdoMcTkwKg6OBQu8obO+vKO+Y8ez7VmTB2PUx+aI
	8Rz1UXA==
X-Received: from pgmc19.prod.google.com ([2002:a63:1c53:0:b0:c98:2639:852e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:ad1:b0:848:4d1a:9556
 with SMTP id d2e1a72fcca58-84f9c8f6a11mr4384666b3a.11.1786395387317; Mon, 10
 Aug 2026 13:56:27 -0700 (PDT)
Date: Mon, 10 Aug 2026 13:56:26 -0700
In-Reply-To: <acd9b32617f75d188c370a464a922af0d650d4f5.camel@infradead.org>
Mime-Version: 1.0
References: <20260728144954.355376-1-dwmw2@infradead.org> <20260728144954.355376-18-dwmw2@infradead.org>
 <anoOz2rZ02KFk1l-@google.com> <acd9b32617f75d188c370a464a922af0d650d4f5.camel@infradead.org>
Message-ID: <ano6-gIZtqMfipiD@google.com>
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
X-purgate-ID: tlsNG-33051d/1786395389-6CEDA4E9-3C117D72/0/0
X-purgate-type: clean
X-purgate-size: 2288

On Mon, Aug 10, 2026, David Woodhouse wrote:
> On Mon, 2026-08-10 at 10:47 -0700, Sean Christopherson wrote:
> > =C2=A0
> > > But when the vCPUs merely have a different TSC *offset*, that's not a
> > > problem. The offset is applied to that vCPU's kvmclock->tsc_timestamp
> > > field, and it all comes out in the wash.
> >=20
> > It's not though?=C2=A0 The value stored in kvmclock->tsc_timestamp is p=
er-VM, not
> > per-vCPU, when using the master clock.=C2=A0 It's a little easier to se=
e once the
> > master clock TSC isn't shoved into host_tsc:
> >=20
> > 	do {
> > 		seq =3D read_seqcount_begin(&ka->pvclock_sc);
> > 		use_master_clock =3D ka->use_master_clock;
> > 		if (!use_master_clock)
> > 			continue;
> >=20
> > 		if (!kvm_get_time_and_clockread(&kernel_ns, &host_tsc)) {
> > 			use_master_clock =3D false;
> > 			continue;
> > 		}
> >=20
> > 		master_tsc =3D ka->master_cycle_now;
> > 		master_ns =3D ka->master_kernel_ns;
> > 	} while (read_seqcount_retry(&ka->pvclock_sc, seq));
> >=20
> > 	...
> >=20
> > 	if (use_master_clock) {
> > 		hv_clock.tsc_timestamp =3D kvm_read_l1_tsc(v, master_tsc);
> > 		hv_clock.system_time =3D master_ns + v->kvm->arch.kvmclock_offset;
> > 	} else {
> > 		hv_clock.tsc_timestamp =3D tsc_timestamp;
> > 		hv_clock.system_time =3D kernel_ns + v->kvm->arch.kvmclock_offset;
> > 	}
>=20
> Meh. I shall have to build a better test case for that one. Thanks.
>=20
> > To allow different offsets, KVM would need to track a per-vCPU offset t=
o the
> > master clock and apply that in kvm_guest_time_update() (and maybe other=
 places?).
> > Which is doable, but it's not clear to me why we'd want to support that=
 (though
> > I haven't fully processed the back half ot his series, so it's very pos=
sible I'm
> > missing something obvious).
>=20
> Because I want to reduce the number of cases where we have to fall back
> to non-masterclock mode. Especially the ones which are driven by
> *guests* rather than weird choices on the VMM's part.

But why though?  What is the harm to the host or guest?  E.g. does it make =
it more
difficult to accurately migrate the VM?  I'm not opposed to allowing master=
-clock
mode with diverging offsets, just trying to understand why it matters.


