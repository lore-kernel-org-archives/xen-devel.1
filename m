Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADE6C531C9
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2026 21:19:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1370237.1618473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnNIh-0001mT-58; Fri, 24 Jul 2026 21:19:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1370237.1618473; Fri, 24 Jul 2026 21:19:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnNIh-0001mM-2B; Fri, 24 Jul 2026 21:19:23 +0000
Received: by outflank-mailman (input) for mailman id 1370237;
 Fri, 24 Jul 2026 21:19:22 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <31tZjagYKCW0dPLYUNRZZRWP.NZXiPY-OPgPWWTded.iPYacZUPNe.ZcR@flex--seanjc.bounces.google.com>)
 id 1wnNIf-0001mD-VD
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 21:19:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wnNIf-007ok2-1x
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 23:19:21 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <31tZjagYKCW0dPLYUNRZZRWP.NZXiPY-OPgPWWTded.iPYacZUPNe.ZcR@flex--seanjc.bounces.google.com>)
 id 6a63d6d4-2eae-0a2a0a5409dd-0a2a4504ba58-4
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 23:19:21 +0200
Received: from [209.85.210.198] (helo=mail-pf1-f198.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <31tZjagYKCW0dPLYUNRZZRWP.NZXiPY-OPgPWWTded.iPYacZUPNe.ZcR@flex--seanjc.bounces.google.com>)
 id 6a63d6d7-b57f-0a2a45040019-d155d2c6ec83-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 23:19:20 +0200
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-848544a8496so873838b3a.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 14:19:20 -0700 (PDT)
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
        d=google.com; s=20251104; t=1784927959; x=1785532759; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=676jeBy0EAQIqzdr2xZT677bczXPwQb8CdOlVs2oUJg=;
        b=ErX5XhbHtMmVnMX66xLkIHnW7mkoMq4NAoTwe+QbOk7njW1nWMBea8YCaGkFgAkjB+
         aUHb3lPwzftPeyVBjt2K69MZFwH+OyhHSCeBIEpQN8bz0Slj6Akc88N6Udns9poxzmZ9
         LPu+H6btR+0Gqr9Yj0icPxusV8g5ifDUtoe1GLIFnCuTS4yxzP5kAcaX5AoeEF3SaApg
         8r0WVVRvVA2qUcYeAfiuU3A/L8v7G1eI+gowJRDDbAcibhiH7U56fvMlqYbH3bOf/Ssg
         kx9e7u9zCvm9CT6N+so81p2uVrMENfvn1K9EEOXQx1oNfZStmqh/nZCP8jSW77TVKGqI
         bB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784927959; x=1785532759;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=676jeBy0EAQIqzdr2xZT677bczXPwQb8CdOlVs2oUJg=;
        b=C+HidLFNmUz3vGAb3PT706f3njPZ7t9RsCZipPJ8DmSLcl20PKDZ2btYxlPSRFcnIQ
         15OvES+TpFjzr4wgYGZJsD02xMkN86dnk0vTocx/BDLLMM9qgPANQPfNSdyIQAjE+Mgx
         9c1WWRdxAjxrtns2Hibjb5ocJJPkxygG6n+dgXmrnA2DWc7fqEpQ8daYCydM0SPLYzlS
         sOQO0/yT3Y9wiNXV4rKQYifaX1pDuwHWtje5F/zuDU4OveM54JLGhQ2FF+XS80HFYYj8
         OkswhCtqYA30fYsjnd9xcNxYjkltyuYelZxbtwVf+NYREXpax1KxojfIJ55RNPxEWR6C
         qXGg==
X-Forwarded-Encrypted: i=1; AHgh+RqAj/1tr1iywr8ZVip+V3ZgygTWszEzrzBnSP0ct10QJok9P0CAG11Vi4FP7kE23n1woj1cqzD1Ej8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzjz7VJmT74qd0UywGZSC2z3gkJJOJc/pKZzdvZxpbobOdr/Pce
	NpmxtV2c0v+uSJdGIXhU2YFTeeJzuC1hurer8ax4L7b2PvdZRC3OJPNQz7XL4WDgbo3GzwcC5o2
	zQEJfTw==
X-Received: from pgbf36.prod.google.com ([2002:a63:5124:0:b0:c99:aff5:708e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:a8e:b0:3c0:9c19:b275
 with SMTP id adf61e73a8af0-3c67e027041mr22595637.67.1784927958810; Fri, 24
 Jul 2026 14:19:18 -0700 (PDT)
Date: Fri, 24 Jul 2026 14:19:17 -0700
In-Reply-To: <20260703212145.343527-9-dwmw2@infradead.org>
Mime-Version: 1.0
References: <20260703212145.343527-1-dwmw2@infradead.org> <20260703212145.343527-9-dwmw2@infradead.org>
Message-ID: <amPW1eAPpUuxLoj_@google.com>
Subject: Re: [PATCH v6 08/36] KVM: x86: Activate master clock immediately on
 vCPU creation
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
X-purgate-ID: tlsNG-ebf023/1784927961-510DDB50-9194D1EA/0/0
X-purgate-type: clean
X-purgate-size: 1608

On Fri, Jul 03, 2026, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Previously, the master clock was only activated when the first vCPU
> processed KVM_REQ_MASTERCLOCK_UPDATE during KVM_RUN. This meant that
> KVM_GET_CLOCK could not return the host_tsc field until after the
> first KVM_RUN, making it impossible for userspace to follow the
> documented TSC migration procedure without a dummy vCPU run.
> 
> Fix this by calling kvm_update_masterclock() directly from
> kvm_arch_vcpu_postcreate(), after kvm_synchronize_tsc() has already
> set all_vcpus_matched_freq. This ensures the master clock is active
> immediately, and KVM_GET_CLOCK returns a valid {host_tsc, realtime}
> pair as soon as a vCPU exists.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  arch/x86/kvm/x86.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index ff45577ed90c..2039bd8518fb 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -13110,6 +13110,8 @@ void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
>  		return;
>  	vcpu_load(vcpu);
>  	kvm_synchronize_tsc(vcpu, NULL);
> +	if (!vcpu->kvm->arch.use_master_clock)

Any reason this can't be?

	if (kvm_check_request(KVM_REQ_MASTERCLOCK_UPDATE, vcpu))
		kvm_update_masterclock(vcpu->kvm);

> +		kvm_update_masterclock(vcpu->kvm);

I don't love doing work outside of KVM_RUN that is typically handled by KVM_RUN,
but this seems fine?

>  	vcpu_put(vcpu);
>  
>  	/* poll control enabled by default */
> -- 
> 2.54.0
> 

