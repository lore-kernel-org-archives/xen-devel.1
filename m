Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26959C531F9
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2026 21:10:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1370223.1618455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnN9r-0000cM-7i; Fri, 24 Jul 2026 21:10:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1370223.1618455; Fri, 24 Jul 2026 21:10:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnN9r-0000cE-2i; Fri, 24 Jul 2026 21:10:15 +0000
Received: by outflank-mailman (input) for mailman id 1370223;
 Fri, 24 Jul 2026 21:10:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3stRjagYKCUUzlhuqjnvvnsl.jvt4lu-kl2lsspz0z.4luwyvqlj0.vyn@flex--seanjc.bounces.google.com>)
 id 1wnN9p-0000bs-Pe
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 21:10:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wnN9p-002T3l-6b
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 23:10:13 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3stRjagYKCUUzlhuqjnvvnsl.jvt4lu-kl2lsspz0z.4luwyvqlj0.vyn@flex--seanjc.bounces.google.com>)
 id 6a63d482-e002-0a2a0a5209dd-0a2a4506dd56-38
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 23:10:13 +0200
Received: from [209.85.210.199] (helo=mail-pf1-f199.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3stRjagYKCUUzlhuqjnvvnsl.jvt4lu-kl2lsspz0z.4luwyvqlj0.vyn@flex--seanjc.bounces.google.com>)
 id 6a63d4b3-195a-0a2a45060019-d155d2c7b513-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 23:10:12 +0200
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-8486ffba174so1227956b3a.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 14:10:12 -0700 (PDT)
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
        d=google.com; s=20251104; t=1784927411; x=1785532211; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XTReVzCNP0fxj6IgppN49ZsfvNVcyjFJjPGB1HCtc6w=;
        b=IgP1N/HJUoCIoX64r8ZFkEB+9Ecos+w4IFCng2F1bAwHECymfunix5r3RRow5wnd91
         bbArZv4OTkCfiHsUISnU1EletTaatP7+LHgjdQVSISSsUACMDCC8TtIxRrgOfGOfOoXd
         sAZF2uuHr5TTWz1/JK+8NMtJmUVTxww8XrlgblCrfvTdjDHZe87ZU2KMsAhsN+KMJJUx
         IpUNnqXpOIM9SP8ZZI2q7Yq9b9lYWwSUjSc9zxRxDQWjEJDqteibfc14plPhV7SLcbuw
         a2y1hhw6bTPFuyNaLscwP2jI8LIUVufeqHhD8CnEfUHR9QakP/SQP6LKJ4UXOudeOhrN
         +FCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784927411; x=1785532211;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XTReVzCNP0fxj6IgppN49ZsfvNVcyjFJjPGB1HCtc6w=;
        b=RMNUXCanmsS6sXMjvbxbH8VpIkIAf7nrPP3TJIWWRS6QHCOqLZoI0WvHwPYtrNEg6f
         dieqdZ1qfmy+pIl1/3z3ZFZegN4ClYe1PWjePWOLPGd451O0eLWWEyzquNeMX3hsiEIs
         zXfH1VCJhtigln0sGWyTME083OxeCDKfmN3Ul63ZST36lK7nZ77kvuYOWtjqot/vtj7d
         Z0DimHdpUoEELxphaBtURPL+IZAwXnEZv5Hd83cgUopvUalW9x3/VnKDwjhDns3O5RgD
         K21Oux0YWXxr17BO+IJYREmJNHMcmxgwysNkCy9Xn26Z1Y0hBXpaI7OlSE7Lr9vtv8mj
         cZRg==
X-Forwarded-Encrypted: i=1; AHgh+Rp+bAmQWuT+AA3gi8OzzUsxnHog4hJCM+gpG6GzWRMfIbSZqzEjcylJSPoh4gGiqxnp+czQIc/Piyc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzO/T00Mk5PSMR/kLgHIsE+TqptTLs0MSgwhytYRm3a3+5ZTGbT
	kIaA8BGL+TF7A2TbG4yhAxf+HAgUo6Atnmq/Gyld1D0tcTOR27UUlUmM8qdp25ABdMANsinjW/X
	fBBcRJg==
X-Received: from pfoc20.prod.google.com ([2002:aa7:8814:0:b0:84e:1951:8efd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:a20f:b0:84e:17ef:5460
 with SMTP id d2e1a72fcca58-84e2bb396bbmr9852497b3a.40.1784927410740; Fri, 24
 Jul 2026 14:10:10 -0700 (PDT)
Date: Fri, 24 Jul 2026 14:10:10 -0700
In-Reply-To: <20260703212145.343527-3-dwmw2@infradead.org>
Mime-Version: 1.0
References: <20260703212145.343527-1-dwmw2@infradead.org> <20260703212145.343527-3-dwmw2@infradead.org>
Message-ID: <amPUsqRiVUsC4tuS@google.com>
Subject: Re: [PATCH v6 02/36] KVM: x86: Improve accuracy of KVM clock when TSC
 scaling is in force
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
Content-Type: text/plain; charset="us-ascii"
X-purgate-ID: tlsNG-16d1c6/1784927413-1EEC477B-CF795C26/0/0
X-purgate-type: clean
X-purgate-size: 1950

On Fri, Jul 03, 2026, David Woodhouse wrote:
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index f14009f25a3b..b2446c04a076 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -950,7 +950,7 @@ struct kvm_vcpu_arch {
>  	gpa_t time;
>  	s8  pvclock_tsc_shift;
>  	u32 pvclock_tsc_mul;
> -	unsigned int hw_tsc_khz;
> +	u64 hw_tsc_hz;
>  	struct gfn_to_pfn_cache pv_time;
>  	/* set guest stopped flag in pvclock flags field */
>  	bool pvclock_set_guest_stopped_request;
> diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
> index e69156b54cff..621d950ec692 100644
> --- a/arch/x86/kvm/cpuid.c
> +++ b/arch/x86/kvm/cpuid.c
> @@ -2131,7 +2131,7 @@ bool kvm_cpuid(struct kvm_vcpu *vcpu, u32 *eax, u32 *ebx,
>  				*ecx = vcpu->arch.pvclock_tsc_mul;
>  				*edx = vcpu->arch.pvclock_tsc_shift;
>  			} else if (index == 2) {
> -				*eax = vcpu->arch.hw_tsc_khz;
> +				*eax = div_u64(vcpu->arch.hw_tsc_hz, 1000);

Kinda silly, but s/1000/HZ_PER_KHZ.

>  			}
>  		}
>  	} else {
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 0550359ed798..dbcff49cd561 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -3314,7 +3314,8 @@ static void kvm_setup_guest_pvclock(struct pvclock_vcpu_time_info *ref_hv_clock,
>  int kvm_guest_time_update(struct kvm_vcpu *v)
>  {
>  	struct pvclock_vcpu_time_info hv_clock = {};
> -	unsigned long flags, tgt_tsc_khz;
> +	unsigned long flags;
> +	u64 tgt_tsc_hz;
>  	unsigned seq;
>  	struct kvm_vcpu_arch *vcpu = &v->arch;
>  	struct kvm_arch *ka = &v->kvm->arch;
> @@ -3340,8 +3341,8 @@ int kvm_guest_time_update(struct kvm_vcpu *v)
>  
>  	/* Keep irq disabled to prevent changes to the clock */
>  	local_irq_save(flags);
> -	tgt_tsc_khz = get_cpu_tsc_khz();
> -	if (unlikely(tgt_tsc_khz == 0)) {
> +	tgt_tsc_hz = (u64)get_cpu_tsc_khz() * 1000;

Here too.

