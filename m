Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49E7C5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 22:26:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393320.1632123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ww5mP-0002T8-IS; Mon, 17 Aug 2026 22:26:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393320.1632123; Mon, 17 Aug 2026 22:26:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ww5mP-0002T1-Ev; Mon, 17 Aug 2026 22:26:05 +0000
Received: by outflank-mailman (input) for mailman id 1393320;
 Mon, 17 Aug 2026 22:26:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jmattson@google.com>) id 1ww5mN-0002Sq-SR
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 22:26:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ww5mN-000Tg6-1i
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 00:26:03 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jmattson@google.com>)
 id 6a838a6f-2eae-0a2a0a5409dd-0a2a4509ea6e-8
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 00:26:02 +0200
Received: from [209.85.208.43] (helo=mail-ed1-f43.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jmattson@google.com>)
 id 6a838a7a-be1a-0a2a45090019-d155d02b8cbb-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 00:26:02 +0200
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-69fec8b4638so3712a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 15:26:02 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1787005562; cv=none;
        d=google.com; s=arc-20260327;
        b=sWCiS0tcUQEsHgjIjWOzoFvGbU/8RD2FC/S9ExUrG2MnDlp8OIg5CsMYTSrqMd2V4P
         CvoX49AfHI6V9rrR4HcPnjctBhOwaFdJQnY+qG8pwxU0wgQD5nvP3Y4Vhw/b7FXbA15x
         IPoLj229hU5HQj1zHtGVSUu1GNuLenXOU06H8Pvzznf/AkpjCHgmsip3JVV/c6ZbFCac
         LZHGJ/ZeVJJjTcEcTgXS1C8JX5ydIQ94vSdaBPqqY8i3bvqKrjksItsCYNbBxk3tq/Jt
         7siwoFZKWioPrHQGQ+T3s1BLRHYDR00GzIWxlj1n7eI8ohaCJtElQa9quoRPIfaba26P
         Af+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hENxuN5mzaES0wxF2BepwjZBV79XeYKjjyJElzU8XaI=;
        fh=XDdWa2L7dmoQEvgDRagQwfUFhzYUD8dnu++QNaWdEII=;
        b=OVKfBaeDWrGekKD9yVXganr5n+yIevG7ukFLnjMGqBp5KxicK9fGPIjGz3EaJmKEHa
         1v76+3P1FKZZphMnR9ALVrs9qceqZZ3MohCzS52c43+iBif63xsyJoyZr+ZjQwgoxrFW
         HYam3F/tonA+GgNm4t+cjkw7MdtF722ih8m8w2eaGOzArYYOkJAM0D+zfP0ceW/11UIT
         A6COhcH74IkMrQXzNyyUlQVP7uONk52AJjyZF4TJWDVRsL3fqPP2hlUagnM75M7xvTku
         6/883nsV1Itiza4XLsqk/W1f+nMbZuLTSzwc9FzthMovw1Y8soegwKzT1aLEHgOSJGxb
         ubJA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787005562; x=1787610362; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hENxuN5mzaES0wxF2BepwjZBV79XeYKjjyJElzU8XaI=;
        b=MHQaMFjs3yO4SRttpWxSDtJn0Mq349MPn9KtGePNc9tAiD7p2p6zsCLaaayTPjloTd
         hLfOEiGrX6i9hhSkYwL5bqKi7+2R1YF/+OV8IaJKUeApsmwPoG17+diB6duSraUGlBj9
         Ng8kwozapcA+z+yWMduPS8cSbSjl38v4cYzUmzY0vQSqpj32W3NwMcL/rDh1CoswrQvU
         Q/dI5Fv0Iyl9AJ2uoW3HVIvq41X0sO9XSaoaB2ker2ztaSHzyR02ahgIfNKuJzfQguDl
         Fy4zGcaViItwYPnfmIFJ/hTsMPFIXK1IWgUY4W2Pe/jymoI1uz8711pKEy0q62swpOIU
         c4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787005562; x=1787610362;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hENxuN5mzaES0wxF2BepwjZBV79XeYKjjyJElzU8XaI=;
        b=smrl3pxwUai6PVbiRka47mFaZGsSoLW5+5etdX+Nn69mOpcUR8L0LquXGRvtufzcDd
         CDkfIVGT+jsOcrHhH++C1/NCDmkyn3gSP6CEZqDqXSfX/kh+zpGCzzVBP5SrhMTCHWgG
         YP8bwrakcAkjxXM27vrm23yIQGN6MIRHI0J56Bzt86wDQTu71wham01+2mfp3oJlDlYw
         PXyUtWms+XKiRA2vkxxO3h6r6PFqTlY67BEO8EuMZKlHY5wwiSVwnqYasKNZFCNP+WLq
         MuxD0UkeLNPhAJosT7ffwPJYiOmqGnuw7GgzGmvrNdj287dL8XQOxPY5yBgfMsMBb2QI
         KEng==
X-Forwarded-Encrypted: i=1; AHgh+RrGwwqAf2Wu+P1ZRmFswQ9IfWtTFnj4PvpYukmgTnNsR1Er+mQstTmAocV5y2gu7aeiHT+lrNzkuxg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1ROXtWUar3ampynbw5lZD8cpTcVzfhDwtjrDcZz2FfqCGO0P1
	wNXFsWHf2910wxx9reN6UoLw/xV63yB3yss6m8Um2cvtb+fVfIXhi03koJWksQP+Uyyinm6vSUS
	Jh+lSSlfHut1ZFOxe8xtqUxLeOLCTZ17V8NieZrUk
X-Gm-Gg: AR+sD12/apxM/nUVFTmr1IaKUlPCoE/D/A1ZrK33tI/JTuUbmI3QlRfLqxgdatQ8zNk
	FAF5Zd/97ZppTzR0m4U0UXyLFeITBJgKdSGwkzaYzVwb8WKHYwJwQl687fjHcXdYiO53o0aJna6
	EgEf7gVM+voOegmKF2PJzvDWa3Ho4MRtdtoKxI7MKazkOi4Uvb0/9SHusH62oDnFygbi+bYW1aJ
	UEW2CkXSNq47OGcRdFoRfGXdK4QIdj0eNY0nsukJIdfIqDLdp5mcSIX8m/nyN4zEpZNqONXedGo
	+opKLl7xWU6IDa8msR15al1Tp5Uc5PXnSHtF5tNY8bs/
X-Received: by 2002:aa7:db55:0:b0:698:ac70:31b9 with SMTP id
 4fb4d7f45d1cf-6a3eb34835bmr2896a12.5.1787005561938; Mon, 17 Aug 2026 15:26:01
 -0700 (PDT)
MIME-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com> <20260806233609.212337-22-seanjc@google.com>
 <ef3b56bf-8df0-4a40-82c7-bd2d65eec71e@yandex-team.ru> <aoMVy4VB1sq4T-ys@google.com>
 <0d1f0afe-74f0-4adb-a7cf-2d4efd001de3@yandex-team.ru>
In-Reply-To: <0d1f0afe-74f0-4adb-a7cf-2d4efd001de3@yandex-team.ru>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 17 Aug 2026 15:25:50 -0700
X-Gm-Features: AcwNN1WdnB6ezAOkUjWvrMa9sQkEiE5NQZNmLUZ6exeGRBIrQHFr5mGJRwWtIb4
Message-ID: <CALMp9eQRW22S6zSrhkxc+8PgSuOJJOB-jh_W1iyr7c0j5SBLow@mail.gmail.com>
Subject: Re: [PATCH v6 21/51] x86/kvm: Obtain TSC frequency from PV CPUID if present
To: Maksim Davydov <davydov-max@yandex-team.ru>
Cc: Sean Christopherson <seanjc@google.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	John Stultz <jstultz@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, x86@kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Michael Kelley <mhklinux@outlook.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, David Woodhouse <dwmw2@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-bad1c0/1787005562-BD6C2034-38BF12EF/0/0
X-purgate-type: clean
X-purgate-size: 3357

On Mon, Aug 17, 2026 at 3:20=E2=80=AFPM Maksim Davydov
<davydov-max@yandex-team.ru> wrote:
>
>
>
> On 8/17/26 17:08, Sean Christopherson wrote:
> > On Mon, Aug 17, 2026, Maksim Davydov wrote:
> >> On 8/7/26 02:35, Sean Christopherson wrote:
> >>> diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
> >>> index 29ca37e9a3bc..f55d0305d1f3 100644
> >>> --- a/arch/x86/kernel/kvmclock.c
> >>> +++ b/arch/x86/kernel/kvmclock.c
> >>> @@ -342,8 +342,10 @@ void __init kvmclock_init(void)
> >>>     flags =3D pvclock_read_flags(&hv_clock_boot[0].pvti);
> >>>     kvm_sched_clock_init(flags & PVCLOCK_TSC_STABLE_BIT);
> >>>
> >>> -   x86_init.hyper.get_tsc_khz =3D kvmclock_get_tsc_khz;
> >>> -   x86_init.hyper.get_cpu_khz =3D kvmclock_get_tsc_khz;
> >>> +   if (!x86_init.hyper.get_tsc_khz)
> >>> +           x86_init.hyper.get_tsc_khz =3D kvmclock_get_tsc_khz;
> >>> +   if (!x86_init.hyper.get_cpu_khz)
> >>> +           x86_init.hyper.get_cpu_khz =3D kvmclock_get_tsc_khz;
> >>>     x86_platform.get_wallclock =3D kvm_get_wallclock;
> >>>     x86_platform.set_wallclock =3D kvm_set_wallclock;
> >>>  #ifdef CONFIG_X86_LOCAL_APIC
> >>
> >>
> >> I cannot test this right now as I lack two servers with different CPU
> >> base frequencies, but it seems that this patch might break something i=
n
> >> guests:
> >> After migrating a VM (QEMU + KVM) from a host with one base frequency =
to
> >> another host with a different base frequency, the value in CPUID leaf
> >> 0x40000010 EAX changes and becomes the same as the destination host ba=
se
> >> frequency instead of remaining the source base frequency.
> >
> > That's a bug in whatever is orchestrating the migration, and/or QEMU if=
 QEMU is
> > handing the upper layers a loaded footgun.
> >
> >> The main reason for this behaviour is that setting the TSC frequency v=
ia
> >> ioctl(KVM_SET_TSC_KHZ) doesn't change the value in CPUID leaf 0x400000=
10
> >> EAX and these two entities are still not connected.
> >
> > And they never will be.  It's userspace's responsibility to fill the co=
rrect
> > values for 0x40000010.
> >
> > But AFAICT, QEMU does the right thing.  env->tsc_khz is used for both t=
he CPUID
> > leaf and for KVM_SET_TSC_KHZ.
> >
> > kvm_arch_init_vcpu():
> >
> >         c =3D &cpuid_data.entries[cpuid_i++];
> >         c->function =3D KVM_CPUID_SIGNATURE | 0x10;
> >         c->eax =3D env->tsc_khz;
> >         c->ebx =3D env->apic_bus_freq / 1000; /* Hz to KHz */
> >         c->ecx =3D c->edx =3D 0;
> >
> > kvm_arch_set_tsc_khz():
> >
> >     r =3D set_ioctl ?
> >         kvm_vcpu_ioctl(cs, KVM_SET_TSC_KHZ, env->tsc_khz) :
> >         -ENOTSUP;
> >
>
> Agreed.
> However, kvm_arch_set_tsc_khz() is also used at the end of migration
> (qemu_loadvm_state -> cpu_synchronize_post_init).
> So, the new value of env->tsc_khz from the source host can be loaded
> during migration via KVM_SET_TSC_KHZ. However, the frequency in CPUID
> leaf 0x40000010 remains the same as on the destination host (the TSC
> frequency can differ from the source host's frequency). Thus, it's
> possible to have unsynchronized CPUID leaf 0x40000010 when using default
> QEMU parameters.

I don't use qemu, but isn't the qemu solution for this general
situation to mark leaf 40000010H as 'unmigratable'?

