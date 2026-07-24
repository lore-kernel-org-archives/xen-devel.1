Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB7EC531C9
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2026 21:29:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1370262.1618501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnNSl-0004XV-HR; Fri, 24 Jul 2026 21:29:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1370262.1618501; Fri, 24 Jul 2026 21:29:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnNSl-0004XN-DO; Fri, 24 Jul 2026 21:29:47 +0000
Received: by outflank-mailman (input) for mailman id 1370262;
 Fri, 24 Jul 2026 21:29:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3R9ljagYKCeIWIERNGKSSKPI.GSQbIR-HIZIPPMWXW.bIRTVSNIGX.SVK@flex--seanjc.bounces.google.com>)
 id 1wnNSk-0004XH-Dk
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 21:29:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wnNSj-00CuM6-GT
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 23:29:45 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3R9ljagYKCeIWIERNGKSSKPI.GSQbIR-HIZIPPMWXW.bIRTVSNIGX.SVK@flex--seanjc.bounces.google.com>)
 id 6a63d917-2eae-0a2a0a5409dd-0a2a450692e8-48
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 23:29:45 +0200
Received: from [209.85.215.197] (helo=mail-pg1-f197.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3R9ljagYKCeIWIERNGKSSKPI.GSQbIR-HIZIPPMWXW.bIRTVSNIGX.SVK@flex--seanjc.bounces.google.com>)
 id 6a63d948-195a-0a2a45060019-d155d7c5ccc4-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 23:29:45 +0200
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-c85798977dcso1314594a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 14:29:44 -0700 (PDT)
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
        d=google.com; s=20251104; t=1784928583; x=1785533383; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LeEjIRradrtHITbFsKRpe0yq9gWXW7YqA8y6Nt7MYfg=;
        b=vwvmg3+u/1yZewrDzfRLZB3xI6efUsrIGDcBsPdesWcEFo2IzQvK5CHGXTYXIVGXWB
         xO5KpAt1s/Ae6D2iELDJ+W+m1byTn80DBsLD3GXzShBAUhPbGfUWJQzOecVNc/Tdi4/w
         xyZe05SLvvicz9FGOJ6pvYzL8yIeaVz7jN96q0TXTb63Rck0HoGnd28yVxL9lOOPiK3M
         5kqN+py5y0IXXvfJo3V3MVrIqkMu8H5B3nC+Thj0znEsmkfLp/aN1Lcg4/2yLrrWB12w
         sXapSkofKDQSigtskXU3MCvWHy9r/bspTcTokrtJ9kPnRc6DM0fcFD2Oa7Q0iebcRu+H
         Znyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784928583; x=1785533383;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LeEjIRradrtHITbFsKRpe0yq9gWXW7YqA8y6Nt7MYfg=;
        b=k02e7H2tKPEuoWO/o3SLBHA25rLVzr5PoQyp+Oa3ggzO4wT9s9EFKJeGitEqLi83j7
         jrs7bit+1fc5+PiKtwEoOsH7Fw07G2ysNWxXrrwAYMkV5SnkbZuoNWX9JJ8U8dma4fWe
         Sdc4HZk0W/HFwnIafcKhF7QqVcQz7e7AN5XNp4kRdgtzRqzasakwy6tE8paioUrx3vW6
         EPdLxWdjM2j17p/OLIbrmZ/53vprLnBlUCxcmWauoYwjk2Ls8QMfPhGJvg+l24KakSZl
         xHAtWOuYSz1Wc9YLqJe2/WnPKoTb2VFop2gn9zOXXinwlTWSEWPsGNxLifqGWtMVu160
         4BgQ==
X-Forwarded-Encrypted: i=1; AHgh+RrpEkyBzE37JMa/pBWnh22fJCEabsoo5VrB3XanbBnA7GrLYNK5G1EkWhBSs4lEC3HjoF8lHsFSwog=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw5t6KxPsc5gn/p8sJC61IwPT+yByfYGDSsvdlxXqZSYRGEQ0ad
	voHdIZ059+zeCH155LtixCjTV3fDExtu2yWUNjwOZGbL3gsTD2a/4l4FXaOO+zek05V0XlLxDuA
	lBXQXYA==
X-Received: from pgbcm9.prod.google.com ([2002:a05:6a02:a09:b0:c85:8035:8b21])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:d52b:b0:3c3:e411:418a
 with SMTP id adf61e73a8af0-3c67e164e76mr39234637.70.1784928583222; Fri, 24
 Jul 2026 14:29:43 -0700 (PDT)
Date: Fri, 24 Jul 2026 14:29:42 -0700
In-Reply-To: <20260703212145.343527-13-dwmw2@infradead.org>
Mime-Version: 1.0
References: <20260703212145.343527-1-dwmw2@infradead.org> <20260703212145.343527-13-dwmw2@infradead.org>
Message-ID: <amPZRkxTLE-rZcJf@google.com>
Subject: Re: [PATCH v6 12/36] KVM: x86: Restructure get_kvmclock()
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
X-purgate-ID: tlsNG-16d1c6/1784928585-FEA7477B-C1BFE47A/0/0
X-purgate-type: clean
X-purgate-size: 4002

On Fri, Jul 03, 2026, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Simplify the use_master_clock condition: the open-coded CONSTANT_TSC ||
> cpu_tsc_khz check is unnecessary since use_master_clock can only be true
> when the host clocksource is TSC based, which in turn requires a stable,
> constant and synchronised TSC across all CPUs.
> 
> Given that, the get_cpu()/put_cpu() pinning is not needed either: both
> the TSC read and get_cpu_tsc_khz() are CPU-independent when the master
> clock is in use, so drop them.
> 
> Wrap the entire use_master_clock block in #ifdef CONFIG_X86_64, since
> use_master_clock is never true on 32-bit (host_tsc_clocksource is only
> set under CONFIG_X86_64), and declare hv_clock inside the block so it is
> not left as an unused variable on 32-bit.
> 
> Use 'continue' on the master-clock success path so the non-master-clock
> computation becomes the common tail, avoiding a goto and label. When the
> clock read fails (e.g. clocksource transitioning away from TSC), fall
> back to that path rather than proceeding with uninitialised data or
> spinning in the seqcount loop.

Please split this up.  The changelog suggests there are at least three logical
changes here.  Yeah, the series is big, but smaller patches helps with review,
even if it results in more total patches.

> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  arch/x86/kvm/x86.c | 42 ++++++++++++++++++++----------------------
>  1 file changed, 20 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 50f088570dab..37b1f8192842 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -3203,40 +3203,38 @@ static unsigned long get_cpu_tsc_khz(void)
>  static void get_kvmclock(struct kvm *kvm, struct kvm_clock_data *data)
>  {
>  	struct kvm_arch *ka = &kvm->arch;
> -	struct pvclock_vcpu_time_info hv_clock;
>  	unsigned int seq;
>  
>  	do {
>  		seq = read_seqcount_begin(&ka->pvclock_sc);
>  
> -		/* both __this_cpu_read() and rdtsc() should be on the same cpu */
> -		get_cpu();
> -
>  		data->flags = 0;
> -		if (ka->use_master_clock &&
> -		    (static_cpu_has(X86_FEATURE_CONSTANT_TSC) || __this_cpu_read(cpu_tsc_khz))) {
>  #ifdef CONFIG_X86_64
> +		if (ka->use_master_clock) {
> +			struct pvclock_vcpu_time_info hv_clock;
>  			struct timespec64 ts;
>  
>  			if (kvm_get_walltime_and_clockread(&ts, &data->host_tsc)) {
>  				data->realtime = ts.tv_nsec + NSEC_PER_SEC * ts.tv_sec;
> -				data->flags |= KVM_CLOCK_REALTIME | KVM_CLOCK_HOST_TSC;
> -			} else
> -#endif
> -			data->host_tsc = rdtsc();
> -
> -			data->flags |= KVM_CLOCK_TSC_STABLE;
> -			hv_clock.tsc_timestamp = ka->master_cycle_now;
> -			hv_clock.system_time = ka->master_kernel_ns + ka->kvmclock_offset;
> -			kvm_get_time_scale(NSEC_PER_SEC, get_cpu_tsc_khz() * 1000LL,
> -					   &hv_clock.tsc_shift,
> -					   &hv_clock.tsc_to_system_mul);
> -			data->clock = __pvclock_read_cycles(&hv_clock, data->host_tsc);
> -		} else {
> -			data->clock = get_kvmclock_base_ns() + ka->kvmclock_offset;
> -		}
> +				data->flags |= KVM_CLOCK_REALTIME | KVM_CLOCK_HOST_TSC | KVM_CLOCK_TSC_STABLE;
> +
> +				hv_clock.tsc_timestamp = ka->master_cycle_now;
> +				hv_clock.system_time = ka->master_kernel_ns + ka->kvmclock_offset;
> +				kvm_get_time_scale(NSEC_PER_SEC, get_cpu_tsc_khz() * 1000LL,
> +						   &hv_clock.tsc_shift,
> +						   &hv_clock.tsc_to_system_mul);
> +				data->clock = __pvclock_read_cycles(&hv_clock, data->host_tsc);
> +				continue;
> +			}
>  
> -		put_cpu();
> +			/*
> +			 * Clock read failed (e.g. clocksource is transitioning
> +			 * away from TSC). Fall back to the non-master-clock path
> +			 * rather than spinning.
> +			 */
> +		}
> +#endif
> +		data->clock = get_kvmclock_base_ns() + ka->kvmclock_offset;
>  	} while (read_seqcount_retry(&ka->pvclock_sc, seq));
>  }
>  
> -- 
> 2.54.0
> 

