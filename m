Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29C8C43458
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 21:47:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1350962.1608330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf2mZ-00033y-L1; Wed, 01 Jul 2026 21:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350962.1608330; Wed, 01 Jul 2026 21:47:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf2mZ-00033r-Hn; Wed, 01 Jul 2026 21:47:47 +0000
Received: by outflank-mailman (input) for mailman id 1350962;
 Wed, 01 Jul 2026 21:47:45 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3_opFagYKCYMzlhuqjnvvnsl.jvt4lu-kl2lsspz0z.4luwyvqlj0.vyn@flex--seanjc.bounces.google.com>)
 id 1wf2mX-000317-Mp
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:47:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf2mW-0045QV-RX
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 23:47:44 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3_opFagYKCYMzlhuqjnvvnsl.jvt4lu-kl2lsspz0z.4luwyvqlj0.vyn@flex--seanjc.bounces.google.com>)
 id 6a458a95-e002-0a2a0a5209dd-0a2a45049b16-42
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 23:47:44 +0200
Received: from [209.85.214.202] (helo=mail-pl1-f202.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3_opFagYKCYMzlhuqjnvvnsl.jvt4lu-kl2lsspz0z.4luwyvqlj0.vyn@flex--seanjc.bounces.google.com>)
 id 6a458aff-a01d-0a2a45040019-d155d6cad861-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 23:47:44 +0200
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-2c804e38c65so21351355ad.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 14:47:44 -0700 (PDT)
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
        d=google.com; s=20251104; t=1782942463; x=1783547263; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zcs7QN5Kd/BsLm+PUgFcojzf1bXkoGYIJwLkqkM7zHA=;
        b=rJXdqcxoOReWbjPjAvzoua4BR8NVKYONSvkt91FW4CQXEUdlRjl2ditOJ+2XQQHc3q
         cr8M1yBu5xnju9LfKRDYHTilGuHvHGgsRRf/yelZhI4212H9XRcCIRyh4IpduDzz0Ee0
         mcDGn7cLPkkoJfu5hDerAwB/UlK4kiQLxteZlg8/LnP7xZ9NIhTRDylwB/GfhPCa98Wz
         bG20gvB7Ou7X/6AryzK0FbuinuyF1fs76ATjeEo6rAprvXXMBOgQ5w5M8kzvULPcRx2u
         TM6z70QJXd+jxsXFiIIH6XJTICDNuXIf0Ah3WR49n+uCYv3yW6y9AI0IBbHiK2CLcq65
         RffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782942463; x=1783547263;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zcs7QN5Kd/BsLm+PUgFcojzf1bXkoGYIJwLkqkM7zHA=;
        b=kVLANmLrXMVZghCerqzPb/34B0w8wxL1HVT756/rcA/Vj5ERkoyKOxv8E0I8irs/bE
         T0ELxM5DMFuPfgmlBw+dJ8QyTjgeanL85a1We1qoEw6zUTO2U6Q2w+meO661bIMgd3cq
         E1pS2Pxu1JIOuril3ZIv+N3S9QIo3boQxkeB6+FSeE5DL4Q/2mLdBPfTtzo5RiVyRLzj
         XLwgVKeFesTe+GbdmIiaPzsVa9cTiDw+3L41hwAzk8vaBtYuLGaQPypduzr/kOQyprrN
         vzz0ay/Bq3JnpW3d5/CrvzXVimVJ+FSV1ZHZVWUYBLim5hj3RcJCchf3M6OUP30Hwzq8
         PxdA==
X-Forwarded-Encrypted: i=1; AHgh+RrWuMVYkt6u0MJ295PeIhA0RB3ol40raN2lfiHQvUroQTTuV/t9JHoIlxYIXzEzeKuw5iqIcPIGn9E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+Ap4YY67MlkCcXtP1L+IoW5m0DxSQH7P/yR9kwhOl4ngvemx0
	MrAHx078hsTfQfi2s5oGjO//ePk4+etZJ9KgPWyF98+31FSJgbgSLNKKtJazsXS86pAUI2Zt7H6
	j4wu6sg==
X-Received: from plzv3.prod.google.com ([2002:a17:902:b7c3:b0:2c8:7fe:29ac])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:32cc:b0:2c9:c083:cd49
 with SMTP id d9443c01a7336-2ca7e69dfe3mr34635215ad.14.1782942462488; Wed, 01
 Jul 2026 14:47:42 -0700 (PDT)
Date: Wed, 1 Jul 2026 14:47:41 -0700
In-Reply-To: <20260608145455.89187-9-dwmw2@infradead.org>
Mime-Version: 1.0
References: <20260608145455.89187-1-dwmw2@infradead.org> <20260608145455.89187-9-dwmw2@infradead.org>
Message-ID: <akWK_duG7ZsIekt7@google.com>
Subject: Re: [PATCH v5 08/34] KVM: x86: Add KVM_VCPU_TSC_SCALE and fix the
 documentation on TSC migration
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
X-purgate-ID: tlsNG-ebf023/1782942464-77B231CC-3D2A1459/0/0
X-purgate-type: clean
X-purgate-size: 1638

On Mon, Jun 08, 2026, David Woodhouse wrote:
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index c1897d939da9..6337f9b9d7ac 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -5930,6 +5930,9 @@ static int kvm_arch_tsc_has_attr(struct kvm_vcpu *vcpu,
>  	case KVM_VCPU_TSC_OFFSET:
>  		r = 0;
>  		break;
> +	case KVM_VCPU_TSC_SCALE:
> +		r = kvm_caps.has_tsc_control ? 0 : -ENXIO;
> +		break;
>  	default:
>  		r = -ENXIO;
>  	}
> @@ -5950,6 +5953,22 @@ static int kvm_arch_tsc_get_attr(struct kvm_vcpu *vcpu,
>  			break;
>  		r = 0;
>  		break;
> +	case KVM_VCPU_TSC_SCALE: {
> +		struct kvm_vcpu_tsc_scale scale;
> +
> +		if (!kvm_caps.has_tsc_control) {
> +			r = -ENXIO;
> +			break;
> +		}

Uber nit.  For consistency with KVM's bizarre pattern here:

		r = -ENXIO;
		if (!kvm_caps.has_tsc_control)
			break;

> +
> +		scale.tsc_ratio = vcpu->arch.l1_tsc_scaling_ratio;
> +		scale.tsc_frac_bits = kvm_caps.tsc_scaling_ratio_frac_bits;
> +		r = -EFAULT;
> +		if (copy_to_user(uaddr, &scale, sizeof(scale)))
> +			break;
> +		r = 0;
> +		break;
> +	}
>  	default:
>  		r = -ENXIO;
>  	}
> @@ -5989,6 +6008,9 @@ static int kvm_arch_tsc_set_attr(struct kvm_vcpu *vcpu,
>  		r = 0;
>  		break;
>  	}
> +	case KVM_VCPU_TSC_SCALE:

Another stupid consistency nit.  Probably do this?

		/*
		 * TSC scaling information is read-only (it's a reflection of
		 * the TSC frequency, which can be set by userspace).
		 */
		r = kvm_caps.has_tsc_control ? -EINVAL : -ENXIO;

> +		r = -EINVAL; /* Read only */
> +		break;
>  	default:
>  		r = -ENXIO;
>  	}

