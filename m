Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48D4C43327
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 21:39:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1350951.1608320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf2e4-0004SW-Qp; Wed, 01 Jul 2026 21:39:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350951.1608320; Wed, 01 Jul 2026 21:39:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf2e4-0004SP-Ns; Wed, 01 Jul 2026 21:39:00 +0000
Received: by outflank-mailman (input) for mailman id 1350951;
 Wed, 01 Jul 2026 21:38:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <38IhFagYKCXEhTPcYRVddVaT.RdbmTc-STkTaaXhih.mTcegdYTRi.dgV@flex--seanjc.bounces.google.com>)
 id 1wf2e3-0004SJ-K9
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:38:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf2e3-005e8D-1E
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 23:38:59 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <38IhFagYKCXEhTPcYRVddVaT.RdbmTc-STkTaaXhih.mTcegdYTRi.dgV@flex--seanjc.bounces.google.com>)
 id 6a4588a6-5cb7-0a2a0a5109dd-0a2a4504a638-48
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 23:38:59 +0200
Received: from [209.85.215.201] (helo=mail-pg1-f201.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <38IhFagYKCXEhTPcYRVddVaT.RdbmTc-STkTaaXhih.mTcegdYTRi.dgV@flex--seanjc.bounces.google.com>)
 id 6a4588f1-a01d-0a2a45040019-d155d7c9c8c2-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 23:38:58 +0200
Received: by mail-pg1-f201.google.com with SMTP id
 41be03b00d2f7-c8952346bb9so839563a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 14:38:58 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782941937; x=1783546737; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GRkq9jmjNuS5m4BJgbbAEXZCpunnA1N0v1XvrStDBgY=;
        b=sPbG4zjZ7nph/qSvllrKdz9+BE1npx1Z8wkgMQQkpJHImUF3kHIzZqygL1F75sXVDA
         fo8yegwkEByAAOSNMejvPmB+0hrgildk0lybSSXOAVjH/kwYkZNrkUs5qNOAHkn08OUI
         XYZtGplWzJW+5psweY8vxiC86VL48a0kyGMSJiLz8cg6JoPmxaCaSLowa5eBNi6WdiRc
         vA+S5smlzRQoiF5cnTSIkyISQRY6nFN2x8vEIRJmH+7z7VIiMNoYlFsF8ojmx+YYcsT0
         zvz4GDnGzAKgAaBg7RSBGvqTwzcERA8iR97zj+d3txQlqSG4uYxLGFWktKlX+geSaHHX
         xwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782941937; x=1783546737;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GRkq9jmjNuS5m4BJgbbAEXZCpunnA1N0v1XvrStDBgY=;
        b=eFx0jwTna15ovg0gEL4h+cpjCPsWLeRo3GAoJ1jAawwgVe+jdLxZ+HlVgfIsOuGXci
         ZJj0MZZsJMTC5eb4Wvttiuod01piKQ4bD50zYsL+LuVKN+TG0kApqQnBr1Jb3wn+4uku
         4r7OgcLOMW3b07eNvIBujKRprygmlpsZ/9Yd6Kc3u0TnJE0wrEFAqESL4Is8snAcLUu5
         qYUDrlq/w8Mf4pI7WAABK6Hs9Tg1irXhHu6r7yKjNzmKizhx0DYORwCRJ9jWkqo4UJeC
         T+U48ZCgT6QTNCHNUHGzomFAbmPNOBGa9rtjgfYP/T28zG2wlGxhLRaL8lqHNN0wM9QL
         Ny3g==
X-Forwarded-Encrypted: i=1; AHgh+RqnUqf98PSXVqzwQXTO9eMSxnyZ7mtIPUiz1mkV/mmHAUur292KF6sB4QHWdt/gnNFZ1ek1v8xuppU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLirdRA16vLP/xDssI4VJotuU+M1d9ts+B1XuV5bSbc6COGPJW
	byfeS+d55xaUUnOS+yFGoms0NYSLH21VeYo1jDosH9sqojp2w5bAnqtk2MPlFGjy5ctZgck7p5A
	F6FjMrw==
X-Received: from plbka15.prod.google.com ([2002:a17:903:334f:b0:2bd:9574:2958])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d2c2:b0:2c9:fa36:ab73
 with SMTP id d9443c01a7336-2ca7e6f0b6emr36500665ad.8.1782941936636; Wed, 01
 Jul 2026 14:38:56 -0700 (PDT)
Date: Wed, 1 Jul 2026 14:38:55 -0700
In-Reply-To: <20260608145455.89187-7-dwmw2@infradead.org>
Mime-Version: 1.0
References: <20260608145455.89187-1-dwmw2@infradead.org> <20260608145455.89187-7-dwmw2@infradead.org>
Message-ID: <akWI72WrPKy-PBqo@google.com>
Subject: Re: [PATCH v5 06/34] KVM: x86: Explicitly disable TSC scaling without CONSTANT_TSC
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
X-purgate-ID: tlsNG-ebf023/1782941938-2C5A91CC-7830281A/0/0
X-purgate-type: clean
X-purgate-size: 2698

On Mon, Jun 08, 2026, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> KVM does make an attempt to cope with non-constant TSC, and has
> notifiers to handle host TSC frequency changes. However, it *only*
> adjusts the KVM clock, and doesn't adjust TSC frequency scaling when
> the host changes.
> 
> This is presumably because non-constant TSCs were fixed in hardware
> long before TSC scaling was implemented, so there should never be real
> CPUs which have TSC scaling but *not* CONSTANT_TSC.
> 
> Such a combination could potentially happen in some odd L1 nesting
> environment, but it isn't worth trying to support it. Just make the
> dependency explicit.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Paul Durrant <paul@xen.org>
> ---
>  arch/x86/kvm/svm/svm.c | 3 ++-
>  arch/x86/kvm/vmx/vmx.c | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index e7fdd7a9c280..7817752533fe 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -5546,7 +5546,8 @@ static __init int svm_hardware_setup(void)
>  				     XFEATURE_MASK_BNDCSR);
>  
>  	if (tsc_scaling) {
> -		if (!boot_cpu_has(X86_FEATURE_TSCRATEMSR)) {
> +		if (!boot_cpu_has(X86_FEATURE_TSCRATEMSR) ||
> +		    !boot_cpu_has(X86_FEATURE_CONSTANT_TSC)) {
>  			tsc_scaling = false;
>  		} else {
>  			pr_info("TSC scaling supported\n");
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index a29896a9ef14..ed207cc7692d 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -8672,7 +8672,7 @@ __init int vmx_hardware_setup(void)
>  	if (!enable_apicv || !cpu_has_vmx_ipiv())
>  		enable_ipiv = false;
>  
> -	if (cpu_has_vmx_tsc_scaling())
> +	if (cpu_has_vmx_tsc_scaling() && boot_cpu_has(X86_FEATURE_CONSTANT_TSC))

We should clear SECONDARY_EXEC_TSC_SCALING in setup_vmcs_config().  Failure to
clear the vmcs_config bit will advertise the feature to L2 and allow it to be
enabled in vmcs12, but KVM will ultimately not honor the scaling in vmcs02:

	if (kvm_caps.has_tsc_control)
		vmcs_write64(TSC_MULTIPLIER, vcpu->arch.tsc_scaling_ratio);

This series kinda sorta gets there with "KVM: x86: Remove pvclock_gtod_data and
private timekeeping code", but that change looks misplaced?  And I think clearing
the bit this late will lead to false failures in vmx_check_processor_compat() due
to the golden config clearing the bit, but the local config having it set.


>  		kvm_caps.has_tsc_control = true;
>  
>  	kvm_caps.max_tsc_scaling_ratio = KVM_VMX_TSC_MULTIPLIER_MAX;
> -- 
> 2.54.0
> 

