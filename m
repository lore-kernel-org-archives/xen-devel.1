Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2683EC5AC67
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 23:40:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388699.1629685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtw58-0006Dq-P2; Tue, 11 Aug 2026 23:40:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388699.1629685; Tue, 11 Aug 2026 23:40:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtw58-0006Dj-MR; Tue, 11 Aug 2026 23:40:30 +0000
Received: by outflank-mailman (input) for mailman id 1388699;
 Tue, 11 Aug 2026 23:40:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <36rJ7agYKCZkL73GC59HH9E7.5HFQ7G-67O7EEBLML.Q7GIKHC75M.HK9@flex--seanjc.bounces.google.com>)
 id 1wtw57-0006DZ-HA
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 23:40:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtw56-00FmZa-HL
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 01:40:28 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <36rJ7agYKCZkL73GC59HH9E7.5HFQ7G-67O7EEBLML.Q7GIKHC75M.HK9@flex--seanjc.bounces.google.com>)
 id 6a7bb2e0-8faa-0a2a0a5109dd-0a2a450ae2ec-8
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 01:40:28 +0200
Received: from [209.85.210.197] (helo=mail-pf1-f197.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <36rJ7agYKCZkL73GC59HH9E7.5HFQ7G-67O7EEBLML.Q7GIKHC75M.HK9@flex--seanjc.bounces.google.com>)
 id 6a7bb2eb-f2d2-0a2a450a0019-d155d2c5a9bd-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 01:40:28 +0200
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-84a251c2e3eso1729439b3a.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 16:40:27 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786491626; x=1787096426; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=45PzVi6GlKpHz3+ZRxW2EDnuD1UWmkJmuMSYxMTtVTA=;
        b=bOODZudoKzFHy8Or+ccgMCyQHNA5B8BWzCI3FZUxAt8ohsrCXKjRelnQdB+K+JTMa8
         SR601cGfS6kDP0ZqJo1lK0xplvG3Op4TkyEpxlVArPKH8laAn7hilrGA+844uG1X3UyA
         5iUhKUNPGr/rUimQdNDweFwONnbhz2VUdx7YwwxFxzd5CTp8DoNAUvyfxUg3MrH/SroM
         7CgIepEXbEG7EsaegkuS6imyTnqSyelfc7utPB6IJPwbrSSLB6nTWMP6dDLkbCsI+YBL
         01giiJUeayAKXj2PBjKXsniZS259/ll085NlxJ7Ffx1lxEa/xnlRZuu7g5EEqv0I4QcT
         AEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786491626; x=1787096426;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=45PzVi6GlKpHz3+ZRxW2EDnuD1UWmkJmuMSYxMTtVTA=;
        b=YOWJXX80gTHLmKPtv+chDhZ1MovLFBIFC6hA/rEIxgE6XY5yjQK8EO8r1rG9clcS1a
         Cu0ujmhjPJaagc7xoxt0qu96pdJsemHRppaBdL1027fD1dnPSJWnluhDcP1PwaHriIyl
         Tx10sQNoqOau453WMkA5BEJqr/q6/ASEKaSwNystl2hmpxiJk5up1hIQQ+tbqI1lZE7G
         sAExVtpXjK3zjDDClc3jtrHnzIj/ibJd5526t9cDYvhmoIFGR8MILD0WqC+lnWBWudcN
         zo7ROn2MiJfzZYxdLgWKSXZuY+ytzdXCKO5XsaplGsERGVqCoxOHPA17EZsGCQHFOrxH
         X/uQ==
X-Forwarded-Encrypted: i=1; AHgh+RpZ0d+qKOR8j3JwrU+u7pZo33J4P2qNTTUORcmGCMcKT0fatgHnjq8Mhl9XqJvhgATMcTLWSoAtQNs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJS3VqGI6dLdPVOEEwVeq9JO3bIZc5ZrexXUkoPPloPsMSM2cx
	3uDXez8KDtBM6HeHwyb5DfpeI8qJw0kTK8RNzKJ1rWo2eXQAG9xllEV37QSfRlbGYs4vuAc/O0a
	k4kArLQ==
X-Received: from pghr4.prod.google.com ([2002:a63:e504:0:b0:cbe:3df6:a1aa])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3d1c:b0:3c4:1916:9d44
 with SMTP id adf61e73a8af0-3cc3f913cbfmr444625637.16.1786491626070; Tue, 11
 Aug 2026 16:40:26 -0700 (PDT)
Date: Tue, 11 Aug 2026 16:40:25 -0700
In-Reply-To: <20260728144954.355376-32-dwmw2@infradead.org>
Mime-Version: 1.0
References: <20260728144954.355376-1-dwmw2@infradead.org> <20260728144954.355376-32-dwmw2@infradead.org>
Message-ID: <anuy6QxUVLcSSVCn@google.com>
Subject: Re: [PATCH v7 31/36] KVM: x86: Add KVM_[GS]ET_CLOCK_GUEST for
 accurate KVM clock migration
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
X-purgate-ID: tlsNG-4011c0/1786491628-5A3DCCFC-FE3E35B0/0/0
X-purgate-type: clean
X-purgate-size: 2208

On Tue, Jul 28, 2026, David Woodhouse wrote:
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 5c78dd1e4c69..0680332d7d45 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -3435,6 +3435,169 @@ static int kvm_vcpu_ioctl_enable_cap(struct kvm_vcpu *vcpu,
>  	}
>  }
>  
> +#ifdef CONFIG_X86_64
> +static int kvm_vcpu_ioctl_get_clock_guest(struct kvm_vcpu *v, void __user *argp)
> +{
> +	struct pvclock_vcpu_time_info hv_clock = {};
> +	struct kvm_vcpu_arch *vcpu = &v->arch;
> +	struct kvm_arch *ka = &v->kvm->arch;
> +	unsigned int seq;
> +
> +	/*
> +	 * If KVM_REQ_CLOCK_UPDATE is already pending, or if the pvclock
> +	 * has never been generated at all, call kvm_guest_time_update().
> +	 */
> +	if (kvm_check_request(KVM_REQ_CLOCK_UPDATE, v) || !vcpu->hw_tsc_hz) {
> +		int idx = srcu_read_lock(&v->kvm->srcu);
> +		int ret = kvm_guest_time_update(v);

Invoking kvm_guest_time_update() here is probably a deal-breaker.  Updating the
master clock and other internal state is far from ideal, but should be ok.

However, writing guest memory is not.  Specifically, dirtying memory after the
last KVM_RUN is a non-starter for many usecases, as is modifying state that is
visible via other GET uAPI (though I don't think that applies here?).  E.g. see
commits:

  118964562969 ("KVM: Mark a vCPU as preempted/ready iff it's scheduled out while running")
  e800decd9c0a ("KVM: x86: Only reset TSC Deadline Timer in apic_timer_expired on KVM_RUN")

One idea would be to simply punt to userspace, i.e. return -EBUSY without trying
to update guest time.  Which is pretty darn ugly, but might be tolerable?  And a
slightly crazy idea to lessen the pain would be to process select requests in
KVM_RUN before bailing for vcpu->run->immediate_exit==true.

That doesn't completely solve things as it's still possible for KVM_REQ_CLOCK_UPDATE
to be set after KVM_RUN, but I think they're mutually exlusive with the majority
of relevant use cases?  And we'd probably want to build on my idea to report that
KVM_RUN needs completion[*], but that'd be a good thing overall.

https://lore.kernel.org/all/20250111012450.1262638-1-seanjc@google.com 

