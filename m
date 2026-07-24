Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679DAC531F9
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2026 21:27:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1370254.1618490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnNQH-0003rN-4w; Fri, 24 Jul 2026 21:27:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1370254.1618490; Fri, 24 Jul 2026 21:27:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnNQH-0003rG-21; Fri, 24 Jul 2026 21:27:13 +0000
Received: by outflank-mailman (input) for mailman id 1370254;
 Fri, 24 Jul 2026 21:27:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3rNhjagYKCUc1njwslpxxpun.lxv6nw-mn4nuur121.6nwy0xsnl2.x0p@flex--seanjc.bounces.google.com>)
 id 1wnNQF-0003rA-Ic
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 21:27:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wnNQE-007pcT-Qq
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 23:27:10 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3rNhjagYKCUc1njwslpxxpun.lxv6nw-mn4nuur121.6nwy0xsnl2.x0p@flex--seanjc.bounces.google.com>)
 id 6a63d881-bab6-0a2a0a5309dd-0a2a4508c37a-24
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 23:27:10 +0200
Received: from [209.85.214.197] (helo=mail-pl1-f197.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3rNhjagYKCUc1njwslpxxpun.lxv6nw-mn4nuur121.6nwy0xsnl2.x0p@flex--seanjc.bounces.google.com>)
 id 6a63d8ad-f659-0a2a45080019-d155d6c5a98e-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 23:27:10 +0200
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2ce7dff6253so18347505ad.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 14:27:10 -0700 (PDT)
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
        d=google.com; s=20251104; t=1784928429; x=1785533229; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d2YqZmtuvGxd8cFmldbiTst55L0tz2Lc3p3TSw+Vcco=;
        b=tszXOeNDk58ySM/s5lrRWgqju9a9w+oRGLGZkmcoERwyX7nwVLccjNTEm25okbXrIu
         P7KTHHazLXzNtZ3vI2N0xyhwUzkX8ZgiAFV+tyNSgTQApeP5lw2ZvZuEy0/GGBG8m+gQ
         ZS+yE1Ok3ksyGNXenQ6bczMZICnVcwCYapNgAp+frOUSQtLuKQSxyiQsyYGO9lWnj94M
         LomaAPNhHNVFMoEal9HYx9M1cJKoXUsf7FHLqjjvczR8YF/7E83gR+NvZ1AytadlVWPa
         rox4AJlZkMAdIj8nrgddbMMMBfumrrAzkoK0Ey0DB6xK2IAlQmkXyPoIcxma7ceW/S3r
         e13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784928429; x=1785533229;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d2YqZmtuvGxd8cFmldbiTst55L0tz2Lc3p3TSw+Vcco=;
        b=hLKkyqujw/cSaqalrCOSesyagaCS/90i/qvxttP9Y/BC2eZ9n/lqLsYy2nHK7jQOzb
         VyiKr/BC4W6PrY8rsKQHKKpYAUF4yB3W11Ra83PggoL0vo2Un6cDlkwCx+GYZp7CkEFw
         wSBRUNw7x/91svtmtSy1TLL/2XPpsLVheIMt3eUpMa4BxxqOJq8OAT5CCvuh9J0gMbyw
         KC6WbfLoTAvp4ZamJ5KX0t+oQPB6hIRUzVFu/qTMdT2Ii+KNGxsq2hYUz/g7eOswMmMo
         LyB+lqmaXRuBVsEWyG6I/xcPc5zMph3Ea9CVzdQYJJDAWbpea5gXDvCqJv1fZvMu+3p+
         PVTw==
X-Forwarded-Encrypted: i=1; AHgh+RpedR36ut/1d5oFXLYu1dSTTCXkjnqLyDMpgE9XRQHOuwEd7/OYN+kmmaGBJQWWlSguHLAx9XFi7oM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwIFIDvgvQZazb6mcjYl3jUUr10LPp9NLumIM5/eDCX2Jao37Dl
	z+sP0NAyvEkwF06R0ksvDRvs062iQlzs9upsG5PJtkmmdXd6c1kEi6pGbfIJE0+rSwhp7/4cmbg
	g8WKQ8w==
X-Received: from plbv14.prod.google.com ([2002:a17:903:44ce:b0:2ca:d6eb:2a36])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:440c:b0:2cf:41ba:96c2
 with SMTP id d9443c01a7336-2cfd795e2acmr17770105ad.12.1784928428452; Fri, 24
 Jul 2026 14:27:08 -0700 (PDT)
Date: Fri, 24 Jul 2026 14:27:07 -0700
In-Reply-To: <20260703212145.343527-16-dwmw2@infradead.org>
Mime-Version: 1.0
References: <20260703212145.343527-1-dwmw2@infradead.org> <20260703212145.343527-16-dwmw2@infradead.org>
Message-ID: <amPYq48J9TPbmFNl@google.com>
Subject: Re: [PATCH v6 15/36] KVM: x86: Fix compute_guest_tsc() to handle
 negative time deltas
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
X-purgate-ID: tlsNG-c1860d/1784928430-D594A87B-1B8F9513/0/0
X-purgate-type: clean
X-purgate-size: 2392

On Fri, Jul 03, 2026, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The compute_guest_tsc() function computes the guest TSC at a given
> kernel_ns timestamp. When the master clock reference point
> (master_kernel_ns) is earlier than vcpu->arch.this_tsc_nsec, the delta
> is negative. Since pvclock_scale_delta() takes a u64, the negative
> value wraps to a huge positive number, producing a wildly wrong result.
> 
> Handle negative deltas explicitly by negating the delta, scaling it,
> and subtracting from this_tsc_write.

Does this need 

  Cc: stable@vger.kernel.org

or is this a "technically a bug fix, but can't happen in practice" sort of thing?

> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  arch/x86/kvm/x86.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 376b8dc2ade9..55fb19fb7a88 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -2588,11 +2588,21 @@ static int kvm_set_tsc_khz(struct kvm_vcpu *vcpu, u32 user_tsc_khz)
>  
>  static u64 compute_guest_tsc(struct kvm_vcpu *vcpu, s64 kernel_ns)
>  {
> -	u64 tsc = pvclock_scale_delta(kernel_ns-vcpu->arch.this_tsc_nsec,
> -				      vcpu->arch.virtual_tsc_mult,
> -				      vcpu->arch.virtual_tsc_shift);
> -	tsc += vcpu->arch.this_tsc_write;
> -	return tsc;
> +	s64 delta_ns = kernel_ns - vcpu->arch.this_tsc_nsec;
> +	u64 tsc;
> +
> +	/* Handle negative deltas gracefully (master clock ref may be earlier) */
> +	if (delta_ns < 0) {
> +		tsc = pvclock_scale_delta(-delta_ns,
> +					  vcpu->arch.virtual_tsc_mult,
> +					  vcpu->arch.virtual_tsc_shift);
> +		return vcpu->arch.this_tsc_write - tsc;
> +	}
> +
> +	tsc = pvclock_scale_delta(delta_ns,
> +				  vcpu->arch.virtual_tsc_mult,
> +				  vcpu->arch.virtual_tsc_shift);
> +	return vcpu->arch.this_tsc_write + tsc;

To cut down on the duplicate code, and IMO to make it easier to identify the
differences, how about this?

	s64 delta_ns = kernel_ns - vcpu->arch.this_tsc_nsec;
	u64 tsc;
	
	/* Handle negative deltas gracefully (master clock ref may be earlier) */
	tsc = pvclock_scale_delta(abs(-delta_ns),
				  vcpu->arch.virtual_tsc_mult,
				  vcpu->arch.virtual_tsc_shift);

	return vcpu->arch.this_tsc_write + (delta_ns >= 0 ? tsc : -tsc);

