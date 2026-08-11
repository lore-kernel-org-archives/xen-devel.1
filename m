Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF60C5B56A
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 16:40:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388372.1629542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtpWH-0007ps-8W; Tue, 11 Aug 2026 16:40:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388372.1629542; Tue, 11 Aug 2026 16:40:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtpWH-0007pF-4b; Tue, 11 Aug 2026 16:40:05 +0000
Received: by outflank-mailman (input) for mailman id 1388372;
 Tue, 11 Aug 2026 16:40:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3YVB7agYKCUo4qmzvos00sxq.o0y9qz-pq7qxxu454.9qz130vqo5.03s@flex--seanjc.bounces.google.com>)
 id 1wtpWG-0007bM-6T
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 16:40:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtpWF-00CfYX-Iy
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 18:40:03 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3YVB7agYKCUo4qmzvos00sxq.o0y9qz-pq7qxxu454.9qz130vqo5.03s@flex--seanjc.bounces.google.com>)
 id 6a7b504c-8faa-0a2a0a5109dd-0a2a45039cf6-24
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 18:40:03 +0200
Received: from [209.85.210.197] (helo=mail-pf1-f197.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3YVB7agYKCUo4qmzvos00sxq.o0y9qz-pq7qxxu454.9qz130vqo5.03s@flex--seanjc.bounces.google.com>)
 id 6a7b5062-fae8-0a2a45030019-d155d2c5ec51-3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 18:40:03 +0200
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-848544a8496so79316b3a.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 09:40:02 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786466401; x=1787071201; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1rxRzhkW3E+GRLBK4lU1PGGkM/l3GS9nXng7CK7oPdQ=;
        b=iFb4TgM0doope1zjZ1ISSZoZb5Yj7YA9tgnIZUAoBZ36QvDkrR+WqvKud5etyN6Ecu
         S3Xrfpxcya7dh2bUgN4juNYHqyEPzNTmFiwG+VQl6S4bWmR9nSOX++ChiHSnBKvW+lJu
         VWdDDhaFoyAF+dukZFzdAKqtY/IJQPUi82g//gwvp0HYg6yUNrNzHLipiI8AXj5xhIkf
         1HJN9k6qRHyAjfW7i8pjx9ZGmFBBVFgfoTwSMgeQunBFYQoyUa3K1zaH0Lk17wvT5zwn
         W7kJX0ns2eHnFph7Ht2uZujDeJ5Pacsb7dp5vaFLWiLJU/+8VPcfxJLUKtUhHvOfwdDU
         j/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786466401; x=1787071201;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1rxRzhkW3E+GRLBK4lU1PGGkM/l3GS9nXng7CK7oPdQ=;
        b=PIkKPY8n0YnIWFl4djRbFLwzy1qtgU/Vy+vE2kR9WWEGezBpxpi5MZlqd0H4arwcNa
         J6e+mhWUZk0rbJiOZHP4OPlo56rS8SV/JLOnGlcYHCt80+K3Fd4gTzKXGXGErtRSwHQ8
         VX3YAWQguANaeX0QHTkOxa0eSTYn9TgTXnK0LsQMEzttWL0987eE5YUjNIUlWEH3NYTl
         1BprqRXi76DgFv23tmxan6V6iORZaGqaYxJKfiAekYzNSHDSFU6WSZGMg+7UjDXEsKbx
         hTSa7JxfsG8ODvtYwPLUds7ZK8S0quhMdJsmcTTa+Mq2VM5ev3eVFXPyH2hVKVvGlvdO
         /R0Q==
X-Forwarded-Encrypted: i=1; AHgh+RqhuNBFvdfM6Si5v8n+EPmNJ3jiedLjldhKKHwq/YPkAZYSN9Z+YAvMeVvznxO1bJVGZ/EsZ3mYfjw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXOgosu4KiVeqJE19E0lPzX/7aPVs0qDAzhsAuEdnH/lSum+z/
	HCmOnifV6wR8CGqKz550PYSicoEGbeUBL837hJMsMKbkAajO1M44k/2uc4TBfEMMv4tCf0MFLCO
	Eln+/AA==
X-Received: from pfst18.prod.google.com ([2002:aa7:8f92:0:b0:848:8d8a:9463])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:b42:b0:848:30c3:45dd
 with SMTP id d2e1a72fcca58-84fa86e1489mr4667146b3a.11.1786466401012; Tue, 11
 Aug 2026 09:40:01 -0700 (PDT)
Date: Tue, 11 Aug 2026 09:40:00 -0700
In-Reply-To: <e256fa4af96e916ba30019cbba501fa896025fb0.camel@infradead.org>
Mime-Version: 1.0
References: <20260728144954.355376-1-dwmw2@infradead.org> <20260728144954.355376-18-dwmw2@infradead.org>
 <anoOz2rZ02KFk1l-@google.com> <acd9b32617f75d188c370a464a922af0d650d4f5.camel@infradead.org>
 <ano6-gIZtqMfipiD@google.com> <bb9a12cc663130eb2caa8e839d0f6ca53d722d1c.camel@infradead.org>
 <ansuqrD2KwFuLWbV@google.com> <ansywxh0VX5rtfWc@google.com> <e256fa4af96e916ba30019cbba501fa896025fb0.camel@infradead.org>
Message-ID: <antQYJvRxJxOjtut@google.com>
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
X-purgate-ID: tlsNG-33051d/1786466403-6CEDA4E9-E8CA63EC/0/0
X-purgate-type: clean
X-purgate-size: 5347

On Tue, Aug 11, 2026, David Woodhouse wrote:
> On Tue, 2026-08-11 at 07:33 -0700, Sean Christopherson wrote:
> >=20
> > Actually, why are KVM_{G,S}ET_CLOCK_GUEST vCPU-scoped?=C2=A0 Per the do=
cumentation,
> > the API "Sets the KVM clock (for the whole VM) in terms of the vCPU TSC=
".=C2=A0 If
> > the APIs are VM-scoped instead of vCPU-scoped, then KVM can simply save=
/restore
> > what's in the per-VM masterclock state, no?
>=20
> They're vCPU-scoped because they need to be tied to a guest TSC (on
> live migration, neither ka->master_cycle_now nor ka->master_kernel_ns
> are useful =E2=80=94 those are the "per-VM masterclock state").

But master clock is also tied to guest TSC.

> Theoretically, guest TSCs can be different on each vCPU (different
> offset, different *rate* even. Not that we allow KVM_[GS]ET_CLOCK_GUEST
> at different rates, I concede).

Sure, but not masterclock, and if we're saying that KVM_[GS]ET_CLOCK_GUEST =
is
for migrating masterclock state, then as you concede, vCPUs with TSCs at di=
fferent
frequencies is completely out of scope.

> So they operate in the context of a given vCPU, and *its* TSC.

Yes, but KVM_[GS]ET_CLOCK_GUEST aren't saving/restoring vCPU state, they're
saving/restoring masterclock state, which is VM-scoped.  What I don't like =
about
the proposed uAPI is that it implicitly consumes state, from an arbitrary v=
CPU,
that KVM very explicitly tracks in masterclock.  And AFAICT, there's zero r=
eason
to do so.

E.g. as a strawman, I would expect something like this to migrate masterclo=
ck
state (deliberately avoiding "master" in the uAPI, because checkpatch is al=
ready
screaming too much).  I didn't try too hard to get the math right, I just w=
anted
to highlight that all the state needed to restore the masterclock is availa=
ble
in the masterclock (which seems comically obvious when I type it out).

struct kvm_pvclock {
	__u64 tsc_timestamp;
	__u64 tsc_scaling_ratio;
	__u64 tsc_offset;
	__u64 system_time;
	__u32 tsc_to_system_mul;
	__s8  tsc_shift;
	__u8  pad0;
	__u16 pad1;
	__u32 pad2;
};

#define KVM_SET_PVCLOCK		_IOW(KVMIO, 0xd6, struct kvm_pvclock)
#define KVM_GET_PVCLOCK		_IOR(KVMIO, 0xd7, struct kvm_pvclock)

static int kvm_vcpu_ioctl_set_pvclock(struct kvm *kvm, void __user *argp)
{
	struct kvm_pvclock user_hv_clock;
	struct kvm_arch *ka =3D &kvm->arch;
	u64 curr_tsc_hz, user_tsc_hz;
	u64 user_clk_ns;
	u64 guest_tsc;
	int rc =3D 0;

	if (copy_from_user(&user_hv_clock, argp, sizeof(user_hv_clock)))
		return -EFAULT;

	if (user_hv_clock.pad0 || user_hv_clock.pad1 || user_hv_clock.pad2)
		return -EINVAL;

	if (!user_hv_clock.tsc_scaling_ratio || !user_hv_clock.tsc_to_system_mul)
		return -EINVAL;

	if (user_hv_clock.tsc_shift < -31 || user_hv_clock.tsc_shift > 31)
		return -EINVAL;

	user_tsc_hz =3D hvclock_to_hz(user_hv_clock.tsc_to_system_mul,
				    user_hv_clock.tsc_shift);

	kvm_hv_request_tsc_page_update(kvm);

	/*
	 * kvm_start_pvclock_update() takes tsc_write_lock and opens
	 * the pvclock seqcount; kvm_end_pvclock_update() closes both.
	 * All clock state modifications between them are atomic with
	 * respect to readers in kvm_guest_time_update().
	 */
	kvm_start_pvclock_update(kvm);
	pvclock_update_vm_gtod_copy(kvm);

	if (!ka->use_master_clock) {
		rc =3D -ENODATA;
		goto out;
	}

	curr_tsc_hz =3D (u64)get_cpu_tsc_khz() * HZ_PER_KHZ;
	if (unlikely(curr_tsc_hz =3D=3D 0)) {
		rc =3D -EBUSY;
		goto out;
	}

	if (kvm_caps.has_tsc_control)
		curr_tsc_hz =3D kvm_scale_tsc(curr_tsc_hz,
					    user_hv_clock.tsc_scaling_ratio);

	/*
	 * The mul/shift in the provided pvclock structure encode the guest TSC
	 * frequency at which it was generated. Sanity-check that it is
	 * consistent with the existing pvclock information, and by extension
	 * all vCPUs' effective TSC frequenies.  Allow a discrepancy of 1 kHz
	 * either way since independently calibrated hosts will not measure
	 * precisely the same value even for the same nominal frequency.
	 */
	if (user_tsc_hz < curr_tsc_hz - 1000 ||
	    user_tsc_hz > curr_tsc_hz + 1000) {
		rc =3D -ERANGE;
		goto out;
	}

	/*
	 * Calculate the guest TSC at the new reference point, and the
	 * corresponding KVM clock value according to user_hv_clock.
	 * Adjust kvmclock_offset so both definitions agree.
	 */
	guest_tsc =3D user_hv_clock.tsc_offset +
		    kvm_scale_tsc(user_hv_clock.system_time,
				  user_hv_clock.tsc_scaling_ratio);

	if (guest_tsc !=3D user_hv_clock.tsc_timestamp +- ???) {
		rc =3D -EINVAL;
		goto out;
	}

	<fill in masterclock>

out:
	kvm_end_pvclock_update(kvm);
	return rc;
}

> And I think I'm going to defend that 'theoretical they can be
> different', because I *would* like to eliminate the ways that a *guest*
> can force non-masterclock mode, and that does mean allowing the offset-
> TSC case.
>=20
> FWIW in my local tree I've just extended the pvclock_migration_test to
> test precisely the thing you were concerned about: three vCPUs with
> divergent TSC offsets, migrated by setting each vCPU's TSC and then
> invoking KVM_SET_CLOCK_GUEST once, through vCPU0.=20

I wasn't actually concerned about migration, I was concerned about time goi=
ng
backwards from the guest's perspective.

