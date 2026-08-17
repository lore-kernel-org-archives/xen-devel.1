Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B73C5DF66
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 14:08:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393036.1631941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvy0g-00071i-1q; Mon, 17 Aug 2026 14:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393036.1631941; Mon, 17 Aug 2026 14:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvy0f-00071b-UR; Mon, 17 Aug 2026 14:08:17 +0000
Received: by outflank-mailman (input) for mailman id 1393036;
 Mon, 17 Aug 2026 14:08:17 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3zBWDagYKCV8PB7KG9DLLDIB.9LJUBK-ABSBIIFPQP.UBKMOLGB9Q.LOD@flex--seanjc.bounces.google.com>)
 id 1wvy0f-00071V-AI
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 14:08:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvy0d-00HJwc-4d
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 16:08:15 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3zBWDagYKCV8PB7KG9DLLDIB.9LJUBK-ABSBIIFPQP.UBKMOLGB9Q.LOD@flex--seanjc.bounces.google.com>)
 id 6a8315cf-8faa-0a2a0a5109dd-0a2a450b8562-0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 16:08:15 +0200
Received: from [209.85.215.198] (helo=mail-pg1-f198.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3zBWDagYKCV8PB7KG9DLLDIB.9LJUBK-ABSBIIFPQP.UBKMOLGB9Q.LOD@flex--seanjc.bounces.google.com>)
 id 6a8315cd-b7e8-0a2a450b0019-d155d7c6ed57-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 16:08:14 +0200
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-cbef1d25500so3633759a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 07:08:14 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786975693; x=1787580493; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+H/tJA5lC7k+sRi7jSoRnwTUnMixNT0suJnv/pAfq4=;
        b=iPMx71jhH1nU/w+KcwU6+8eXzO2/L7L3kx1bJNrZd52+FAibsIIlDK2vLlwecqN08Y
         sQyx7ot/5dSxUZMtWG9QjpQ+fQVupC7ClPV7WHKaudKh7JuvaR8NmZ2pyriN7CMV2RgQ
         9P0A3AI1oNZPtGjbVXBuVkJoXZbYYDN+1Pil/Ii5akjAFl8LPmOPcDLagtiwMcW2PKQi
         X18T61FOxwzXG5MZbukYdE6K06TMOarkhQBBHrXYjDEZKgPHH6qk9D5ZowUjal9UMk5a
         rJigCu14ykyPjIIcHM95eZgsg52Qakx5321tBfX8fI0LjhkfIYXIUmT0BMPH3PGt+Cqr
         FVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786975693; x=1787580493;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K+H/tJA5lC7k+sRi7jSoRnwTUnMixNT0suJnv/pAfq4=;
        b=K0nIOfHRXRWLwDsmFD8/aEUNLSkvtYzSrKHwpFtfcqXWDZx6H1aCD0ebYtsIn3BKym
         KXrziNs3I7b2MJ7gcieH4l5DJRQ1YQIrTrFJwabmWREcRi7OatmmgblBxAH+1ZkMqQjl
         WdE9oqmf8SG03J/B4V7LbrEs9JimxxqAF2Qy7d4r/9jqdCPOgcDtcx+v6HO+7yyWJPHP
         J1CyMjfsJ1Vs3z+qc7E+ABb1vls0PQClBX/xAN1qskgSL0nfGxDlwjmeqyqJ+GLsSZ7j
         xgDoX1UISomEsampy1FzF9G7vFtDX6yt+vnEcf13M/T1NUv3roa+FYkUHj1CZDeRc//8
         /FDA==
X-Forwarded-Encrypted: i=1; AHgh+Rro+szerAKrBIFwLl7VAeuucTGOc9xoB09aShGlA/a0YmApNPj86baqLq3ll54D/eJl9JlQT7PEWYw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxm255XA/5fFX9WZH7mSamVslfUVqAMViTR0mp3eVeGF2SOTK4L
	B10TSyB5ioHvaLav5LnOTAdmAnwiJXOsi51B6aOzshcuxCwIy55wHzk/6s1MFL1EJu2R17yG2q8
	btp9zFA==
X-Received: from pgcz4.prod.google.com ([2002:a63:7e04:0:b0:c92:29d5:1f29])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:12d2:b0:3c3:9746:1fcb
 with SMTP id adf61e73a8af0-3cc71dc524bmr27787783637.35.1786975692489; Mon, 17
 Aug 2026 07:08:12 -0700 (PDT)
Date: Mon, 17 Aug 2026 07:08:11 -0700
In-Reply-To: <ef3b56bf-8df0-4a40-82c7-bd2d65eec71e@yandex-team.ru>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com> <20260806233609.212337-22-seanjc@google.com>
 <ef3b56bf-8df0-4a40-82c7-bd2d65eec71e@yandex-team.ru>
Message-ID: <aoMVy4VB1sq4T-ys@google.com>
Subject: Re: [PATCH v6 21/51] x86/kvm: Obtain TSC frequency from PV CPUID if present
From: Sean Christopherson <seanjc@google.com>
To: Maksim Davydov <davydov-max@yandex-team.ru>
Cc: Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
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
Content-Type: text/plain; charset="us-ascii"
X-purgate-ID: tlsNG-42698a/1786975695-2C59A9EA-EF93815E/0/0
X-purgate-type: clean
X-purgate-size: 3137

On Mon, Aug 17, 2026, Maksim Davydov wrote:
> On 8/7/26 02:35, Sean Christopherson wrote:
> > diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
> > index 29ca37e9a3bc..f55d0305d1f3 100644
> > --- a/arch/x86/kernel/kvmclock.c
> > +++ b/arch/x86/kernel/kvmclock.c
> > @@ -342,8 +342,10 @@ void __init kvmclock_init(void)
> >  	flags = pvclock_read_flags(&hv_clock_boot[0].pvti);
> >  	kvm_sched_clock_init(flags & PVCLOCK_TSC_STABLE_BIT);
> >  
> > -	x86_init.hyper.get_tsc_khz = kvmclock_get_tsc_khz;
> > -	x86_init.hyper.get_cpu_khz = kvmclock_get_tsc_khz;
> > +	if (!x86_init.hyper.get_tsc_khz)
> > +		x86_init.hyper.get_tsc_khz = kvmclock_get_tsc_khz;
> > +	if (!x86_init.hyper.get_cpu_khz)
> > +		x86_init.hyper.get_cpu_khz = kvmclock_get_tsc_khz;
> >  	x86_platform.get_wallclock = kvm_get_wallclock;
> >  	x86_platform.set_wallclock = kvm_set_wallclock;
> >  #ifdef CONFIG_X86_LOCAL_APIC
> 
> 
> I cannot test this right now as I lack two servers with different CPU
> base frequencies, but it seems that this patch might break something in
> guests:
> After migrating a VM (QEMU + KVM) from a host with one base frequency to
> another host with a different base frequency, the value in CPUID leaf
> 0x40000010 EAX changes and becomes the same as the destination host base
> frequency instead of remaining the source base frequency.

That's a bug in whatever is orchestrating the migration, and/or QEMU if QEMU is
handing the upper layers a loaded footgun.

> The main reason for this behaviour is that setting the TSC frequency via
> ioctl(KVM_SET_TSC_KHZ) doesn't change the value in CPUID leaf 0x40000010
> EAX and these two entities are still not connected.

And they never will be.  It's userspace's responsibility to fill the correct
values for 0x40000010.

But AFAICT, QEMU does the right thing.  env->tsc_khz is used for both the CPUID
leaf and for KVM_SET_TSC_KHZ.

kvm_arch_init_vcpu():

        c = &cpuid_data.entries[cpuid_i++];
        c->function = KVM_CPUID_SIGNATURE | 0x10;
        c->eax = env->tsc_khz;
        c->ebx = env->apic_bus_freq / 1000; /* Hz to KHz */
        c->ecx = c->edx = 0;

kvm_arch_set_tsc_khz():

    r = set_ioctl ?
        kvm_vcpu_ioctl(cs, KVM_SET_TSC_KHZ, env->tsc_khz) :
        -ENOTSUP;

> I saw this behaviour with QEMU 7, but I've checked the code of the
> latest version and it seems that the described behaviour still exists.
> So, in that case, it's possible that with these changes a VM will use
> the wrong TSC frequency from CPUID leaf 0x40000010 EAX if it's migrated
> and then rebooted.
> 
> Putting it all together, after the previous patch ("KVM: x86: Officially
> define CPUID 0x40000010 as PV Timing Info (TSC and Bus)") a new way to
> show the guest that CPUID leaf 0x40000010 is valid should be implemented
> and only then this leaf can be used to get the TSC frequency.

No, there are already non-Linux kernels that consume 0x40000010, e.g. FreeBSD.
In my very strong opinion, if this problematic for a deployment, then that
deployment needs to urgently fix their broken setup.

