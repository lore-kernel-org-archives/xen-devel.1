Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A05CD4F54
	for <xen-devel@archiver.kernel.org>; Wed, 20 May 2026 20:44:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1314378.1584324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPnmR-0007NB-9d; Wed, 20 May 2026 20:44:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314378.1584324; Wed, 20 May 2026 20:44:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPnmR-0007N4-60; Wed, 20 May 2026 20:44:39 +0000
Received: by outflank-mailman (input) for mailman id 1314378;
 Wed, 20 May 2026 20:44:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3MR0OagYKCfougcpleiqqing.eqozgp-fgxgnnkuvu.zgprtqlgev.qti@flex--seanjc.bounces.google.com>)
 id 1wPnmP-0007My-AG
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 20:44:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPnmO-008mdr-J8
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 22:44:36 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3MR0OagYKCfougcpleiqqing.eqozgp-fgxgnnkuvu.zgprtqlgev.qti@flex--seanjc.bounces.google.com>)
 id 6a0e1cfb-bab6-0a2a0a5309dd-0a2a4505c6fa-26
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 22:44:36 +0200
Received: from [209.85.210.202] (helo=mail-pf1-f202.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3MR0OagYKCfougcpleiqqing.eqozgp-fgxgnnkuvu.zgprtqlgev.qti@flex--seanjc.bounces.google.com>)
 id 6a0e1d32-aaa8-0a2a45050019-d155d2cac95f-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 22:44:36 +0200
Received: by mail-pf1-f202.google.com with SMTP id
 d2e1a72fcca58-837cc5bc6deso3220402b3a.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 13:44:35 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Transfer-Encoding:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779309874; x=1779914674; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mknx5aOiI2gHqgCD2H8iHmrBA38hthuUh1cz4/8g/LE=;
        b=F9UplH9ufJsEwqikRDE+yfo68yFWGyhWzKlBT+hSm4aH6RjdJiSsyLCLfS8Hh7yzRK
         ph4IXU7WD/QaZbxMWqHEpPWOCmU4X85sOVN2dM03gJuLQWUMpsiKe1RE/cEq21oyVXIe
         7WfXfjgN78rzIguxFKb9NHXFnChfI9oy1McvDtSNOzeT7T41/FhmAqDH2CUboYKK7JTF
         ziTvVqdMMmTFr8MOUIm3srWqJdNQHuWabHZvH4C2xEPOe+0mIub9KZPxCBTcddgbZEed
         fxbmc4Icx5iONQGSN1M/JqE6hcYyvX23CHGBcg/wePHkBkhbLjTTScmt6procYUNWn9T
         nR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779309874; x=1779914674;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Mknx5aOiI2gHqgCD2H8iHmrBA38hthuUh1cz4/8g/LE=;
        b=bLMggOMq1QR8YQiju/99VgIBnGfbjXUu3EQciI2jjgoPX3dHqp4kfBOZ4oVCtgJpTE
         g0oiPqXhyJmeIWrc/lruoVds4h9J5m+FzogukiGti07CPSRSJUfq5+DMXB0gWdOFqO3E
         0WAMFP1uO+kvgcl1MMrB0KIa/vkTK4pQLoern+fmxI4V7Mjb5FPnp+fRve/e0w+f2TWI
         duLMn3Nt2aoRc12DYZJZu7av2Xi/g9KVWcJLhkgyJ8/dQeQSuQ9L2mLpdppqJImdWh9f
         WtYhMaiFXj4TjbRgqbWjRSKv3bwzjP/0XE0KdGQX+UhENvh1a4IisnUBjTafGbxtRgkV
         r8Eg==
X-Forwarded-Encrypted: i=1; AFNElJ9Rwfc794+93YnPd2vEyGJQbv0tFqs2oJnR6h2GNWOaU1h5arHObOEqYoLsM8rRCRk4twLIo55Kz9U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxuqw4fnDYGsns+O5/8D/LAvQyD+kEkkon3Xnobc0Zswfxq350n
	h4d2nhs/jHuDd1UxYSrdUv+ZnBU1+4v6NW5PG7hfhLC0Vp0wyX1Sc08H9hWU7CG7WGMTfAgQ+AN
	pCd8ZFQ==
X-Received: from pfbmd16.prod.google.com ([2002:a05:6a00:7710:b0:838:4903:1f13])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:c86:b0:837:eaa9:381f
 with SMTP id d2e1a72fcca58-8414aaf9e7emr187969b3a.0.1779309873801; Wed, 20
 May 2026 13:44:33 -0700 (PDT)
Date: Wed, 20 May 2026 13:44:33 -0700
In-Reply-To: <44e0d60548d317fd59895f18bd17220dfb2f834b.camel@infradead.org>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com> <20260515191942.1892718-3-seanjc@google.com>
 <44e0d60548d317fd59895f18bd17220dfb2f834b.camel@infradead.org>
Message-ID: <ag4dMc2B3JQi4vxU@google.com>
Subject: Re: [PATCH v3 02/41] x86/tsc: Add helper to register CPU and TSC freq
 calibration routines
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	John Stultz <jstultz@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, x86@kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Michael Kelley <mhklinux@outlook.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c201ff/1779309876-D3D67443-AD6A1377/0/0
X-purgate-type: clean
X-purgate-size: 5371

On Wed, May 20, 2026, David Woodhouse wrote:
> On Fri, 2026-05-15 at 12:19 -0700, Sean Christopherson wrote:
> > diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
> > index b5991d53fc0e..e9e7394140dd 100644
> > --- a/arch/x86/kernel/kvmclock.c
> > +++ b/arch/x86/kernel/kvmclock.c
> > @@ -321,8 +321,8 @@ void __init kvmclock_init(void)
> > =C2=A0	flags =3D pvclock_read_flags(&hv_clock_boot[0].pvti);
> > =C2=A0	kvm_sched_clock_init(flags & PVCLOCK_TSC_STABLE_BIT);
> > =C2=A0
> > -	x86_platform.calibrate_tsc =3D kvm_get_tsc_khz;
> > -	x86_platform.calibrate_cpu =3D kvm_get_tsc_khz;
> > +	tsc_register_calibration_routines(kvm_get_tsc_khz, kvm_get_tsc_khz);
> > +
> > =C2=A0	x86_platform.get_wallclock =3D kvm_get_wallclock;
> > =C2=A0	x86_platform.set_wallclock =3D kvm_set_wallclock;
> > =C2=A0#ifdef CONFIG_X86_LOCAL_APIC
>=20
> Can we move those (and maybe everything in the context there too) up
> *before* the check for no-kvmclock at the top of the function?

Oof, I was going to say "no", but disabling kvmclock is exactly the workaro=
und
I've told people to use to get the kernel to use the TSC instead of kvmcloc=
k.

> Probably in a separate patch.

Ya.  I think this?

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 08ee4bc304c8..92a1ebf31e4d 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -27,6 +27,7 @@ static int kvmclock_vsyscall __initdata =3D 1;
 static int msr_kvm_system_time __ro_after_init;
 static int msr_kvm_wall_clock __ro_after_init;
 static u64 kvm_sched_clock_offset __ro_after_init;
+static unsigned int kvm_tsc_khz_cpuid __ro_after_init;
=20
 static int __init parse_no_kvmclock(char *arg)
 {
@@ -207,7 +208,7 @@ static unsigned long kvm_get_tsc_khz(void)
                lapic_timer_period =3D apic_khz * 1000 / HZ;
 #endif
=20
-       return kvm_para_tsc_khz() ? : pvclock_tsc_khz(this_cpu_pvti());
+       return kvm_tsc_khz_cpuid ? : pvclock_tsc_khz(this_cpu_pvti());
 }
=20
 static unsigned long kvm_get_cpu_khz(void)
@@ -387,9 +388,39 @@ void __init kvmclock_init(void)
        enum tsc_properties tsc_properties =3D TSC_FREQUENCY_KNOWN;
        bool stable =3D false;
=20
-       if (!kvm_para_available() || !kvmclock)
+       if (!kvm_para_available())
                return;
=20
+       /*
+        * If the TSC counts at a constant frequency across P/T states, cou=
nts
+        * in deep C-states, and the TSC hasn't been marked unstable, treat=
 the
+        * TSC reliable, as guaranteed by KVM.  Note, the TSC unstable chec=
k
+        * exists purely to honor the TSC being marked unstable via command
+        * line, any runtime detection of an unstable will happen after thi=
s.
+        */
+       if (boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
+           boot_cpu_has(X86_FEATURE_NONSTOP_TSC) &&
+           !check_tsc_unstable())
+               tsc_properties =3D TSC_FREQ_KNOWN_AND_RELIABLE;
+
+       kvm_tsc_khz_cpuid =3D kvm_para_tsc_khz();
+
+       /*
+        * If provided, use the TSC (and APIC bus) frequency provided in KV=
M's
+        * PV CPUID leaf even if kvmclock itself is disabled via command li=
ne.
+        * The PV CPUID information isn't dependent on kvmclock in any way,=
 and
+        * in fact using the precise information is *more* important when t=
he
+        * user has explicitly disabled kvmclock to force the kernel to use=
 the
+        * TSC as its clocksource.
+        */
+       if (!kvmclock) {
+               if (kvm_tsc_khz_cpuid)
+                       tsc_register_calibration_routines(kvm_get_tsc_khz,
+                                                         kvm_get_cpu_khz,
+                                                         tsc_properties);
+               return;
+       }
+
        if (kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE2)) {
                msr_kvm_system_time =3D MSR_KVM_SYSTEM_TIME_NEW;
                msr_kvm_wall_clock =3D MSR_KVM_WALL_CLOCK_NEW;
@@ -424,21 +455,14 @@ void __init kvmclock_init(void)
        }
=20
        /*
-        * If the TSC counts at a constant frequency across P/T states, cou=
nts
-        * in deep C-states, and the TSC hasn't been marked unstable, prefe=
r
-        * the TSC over kvmclock for sched_clock and drop kvmclock's rating=
 so
-        * that TSC is chosen as the clocksource.  Note, the TSC unstable c=
heck
-        * exists purely to honor the TSC being marked unstable via command
-        * line, any runtime detection of an unstable will happen after thi=
s.
+        * If the TSC is reliable (see above), prefer the TSC over kvmclock=
 for
+        * sched_clock and drop kvmclock's rating so that TSC is chosen as =
the
+        * clocksource.
         */
-       if (boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
-           boot_cpu_has(X86_FEATURE_NONSTOP_TSC) &&
-           !check_tsc_unstable()) {
+       if (tsc_properties & TSC_RELIABLE)
                kvm_clock.rating =3D 299;
-               tsc_properties =3D TSC_FREQ_KNOWN_AND_RELIABLE;
-       } else {
+       else
                kvm_sched_clock_init(stable);
-       }
=20
        tsc_register_calibration_routines(kvm_get_tsc_khz, kvm_get_cpu_khz,
                                          tsc_properties);

