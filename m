Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5DEC55171
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2026 23:24:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1379676.1624092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpwaX-0007ew-OR; Fri, 31 Jul 2026 23:24:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1379676.1624092; Fri, 31 Jul 2026 23:24:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpwaX-0007ep-Le; Fri, 31 Jul 2026 23:24:25 +0000
Received: by outflank-mailman (input) for mailman id 1379676;
 Fri, 31 Jul 2026 23:24:24 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3pS5tagYKCRIAws51uy66y3w.u64Fw5-vwDw330ABA.Fw57961wuB.69y@flex--seanjc.bounces.google.com>)
 id 1wpwaW-0007eg-E5
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 23:24:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpwaV-00Ae5K-J9
 for xen-devel@lists.xenproject.org; Sat, 01 Aug 2026 01:24:23 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3pS5tagYKCRIAws51uy66y3w.u64Fw5-vwDw330ABA.Fw57961wuB.69y@flex--seanjc.bounces.google.com>)
 id 6a6d2dad-5cb7-0a2a0a5109dd-0a2a4501a054-48
 for <xen-devel@lists.xenproject.org>; Sat, 01 Aug 2026 01:24:23 +0200
Received: from [209.85.216.71] (helo=mail-pj1-f71.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3pS5tagYKCRIAws51uy66y3w.u64Fw5-vwDw330ABA.Fw57961wuB.69y@flex--seanjc.bounces.google.com>)
 id 6a6d2ea6-5984-0a2a45010019-d155d847e42a-3
 for <xen-devel@lists.xenproject.org>; Sat, 01 Aug 2026 01:24:23 +0200
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-38e7b87ce77so3728412a91.0
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 16:24:23 -0700 (PDT)
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
        d=google.com; s=20251104; t=1785540261; x=1786145061; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fun1HisIe61fwc36HWwP0mEpqtzKSpu6BfRxhF/FWAM=;
        b=aeYgOs/Kpgt36kelxa4mOjHJNQQ6GuPxv8Oj36ZYN1d5/ESRRSPKGi1qY/bL3eAVhX
         XpKDhzHjcocxJ5uzOG8wD9w7Dco4ZpEP43LBXkkpgQBNL3wQ3ZyNdaVYVcti4XKIUJJN
         cI5AdymyUpgXf4zzztZKaKrr6vfVo4tRcGLYj8IYTtv52zuTAcxpm4M73aGDhMF2OqVn
         qCfPFnlwL8CckE98KVQUZUNlJfbMwBnHst/hqilyCfx5qPJkYZSD6zaK30cnEK4QMA9B
         QPfmhOe04AbYAY9ENLZU27GtVAlFf0ru8xKd8tsJQtHsk67c2rZD4lr0dQypbyDh8oMA
         tRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785540261; x=1786145061;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fun1HisIe61fwc36HWwP0mEpqtzKSpu6BfRxhF/FWAM=;
        b=GP7esI5D8DfROgK0Nds6yUm86yfISL1pVmxEemckcs3uFLzu37WQDnYe9/MXm9yInv
         pU9bX9vR3+lcokw7mM14IlmcCHe3f/SajPK1Ba8njpr5qJbh8o9Zx6E2V9/W4RogqXmu
         F9X6OfOU2S931/e5mneYPSty/wxcki2PAKRC3HaTjkU9BuN/F82jiN06A94jbbpdJlBK
         Ky3KQIUHJ/errWqJOx3Qoc0gmdpdG/Ix6TgR8Kozz2R8U/nyzaagCl6qpsSJvCmoMd60
         BVNiHbXRtp3csZaV02jUs27NAvangrEUncKljHDuos64vSvvnBCYrbic2D2pwbP01wCY
         bsLQ==
X-Forwarded-Encrypted: i=1; AHgh+RqYws6QoHXO10kAjTQc8vu1UqqHqyriydZYUPyUeVKedCUIFpjfNgsTThUtUD2hFFjnw2WK/cddaF0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz8/dH3trh0sK7dmDtqqTlCMMVWArJSIdALeFh3QBqHKD2ov8WR
	EZaLaHmo/hrasYDltAHIRMnWx46o0iJogDMj53l+bxM8443Y+T9wtUBJi1BQfq/jRMY9+sqbS0h
	IKJzRZA==
X-Received: from pjbms10.prod.google.com ([2002:a17:90b:234a:b0:38e:b9dd:4f3f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b02:b0:38e:bbf1:de34
 with SMTP id 98e67ed59e1d1-38fbc3e7e39mr1464539a91.7.1785540261077; Fri, 31
 Jul 2026 16:24:21 -0700 (PDT)
Date: Fri, 31 Jul 2026 16:24:20 -0700
In-Reply-To: <20260728144954.355376-32-dwmw2@infradead.org>
Mime-Version: 1.0
References: <20260728144954.355376-1-dwmw2@infradead.org> <20260728144954.355376-32-dwmw2@infradead.org>
Message-ID: <am0upFND1r93HPxq@google.com>
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
X-purgate-ID: tlsNG-d62444/1785540263-C5146757-07AAE748/0/0
X-purgate-type: clean
X-purgate-size: 5279

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
> +
> +		srcu_read_unlock(&v->kvm->srcu, idx);

		guard(srcu)(&vcpu->kvm->srcu);

		if (kvm_guest_time_update(v))
			return -EBUSY;

> +		if (ret)
> +			return -EINVAL;

This should be -EBUSY, because KVM_REQ_CLOCK_UPDATE is a transient condition.
And that's why a capability is needed: if userspace goes with the "probe" method,
it could get a temporary failure, and then a naive userspace could stop using
the ioctl entirely.

> +	}
> +
> +	/*
> +	 * Reconstruct the pvclock from the master clock state, matching
> +	 * exactly what kvm_guest_time_update() writes to the guest.
> +	 */
> +	do {
> +		seq = read_seqcount_begin(&ka->pvclock_sc);
> +
> +		if (!ka->use_master_clock)
> +			return -EINVAL;

EINVAL also feels wrong, userspace hasn't done anything wrong.  Maybe -ENODATA?
Not sure what the right returnis.

> +
> +		hv_clock.tsc_timestamp = kvm_read_l1_tsc(v, ka->master_cycle_now);
> +		hv_clock.system_time = ka->master_kernel_ns + ka->kvmclock_offset;
> +	} while (read_seqcount_retry(&ka->pvclock_sc, seq));
> +
> +	hv_clock.tsc_shift = vcpu->pvclock_tsc_shift;
> +	hv_clock.tsc_to_system_mul = vcpu->pvclock_tsc_mul;
> +	hv_clock.flags = ka->all_vcpus_matched_tsc ? PVCLOCK_TSC_STABLE_BIT : 0;
> +
> +	if (copy_to_user(argp, &hv_clock, sizeof(hv_clock)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
> +/*
> + * Reverse the calculation in the hv_clock definition.
> + *
> + * time_ns = ( (cycles << shift) * mul ) >> 32;
> + * (although shift can be negative, so that's bad C)
> + *
> + * So for a single second,
> + * NSEC_PER_SEC = ( ( FREQ_HZ << shift) * mul ) >> 32
> + * NSEC_PER_SEC << 32 = ( FREQ_HZ << shift ) * mul
> + * ( NSEC_PER_SEC << 32 ) / mul = FREQ_HZ << shift
> + * ( NSEC_PER_SEC << 32 ) / mul ) >> shift = FREQ_HZ
> + */
> +static u64 hvclock_to_hz(u32 mul, s8 shift)
> +{
> +	u64 tm = NSEC_PER_SEC << 32;
> +
> +	/* Maximise precision. Shift right until the top bit is set */
> +	tm <<= 2;
> +	shift += 2;
> +
> +	/* While 'mul' is even, increase the shift *after* the division */
> +	while (!(mul & 1)) {
> +		shift++;
> +		mul >>= 1;
> +	}
> +
> +	tm /= mul;
> +
> +	if (shift >= 64)
> +		return 0;
> +	if (shift > 0)
> +		return tm >> shift;
> +	if (shift <= -64)
> +		return 0;
> +	return tm << -shift;
> +}
> +
> +static int kvm_vcpu_ioctl_set_clock_guest(struct kvm_vcpu *v, void __user *argp)
> +{
> +	struct pvclock_vcpu_time_info user_hv_clock;
> +	struct kvm *kvm = v->kvm;
> +	struct kvm_arch *ka = &kvm->arch;
> +	u64 curr_tsc_hz, user_tsc_hz;
> +	u64 user_clk_ns;
> +	u64 guest_tsc;
> +	int rc = 0;
> +
> +	if (copy_from_user(&user_hv_clock, argp, sizeof(user_hv_clock)))
> +		return -EFAULT;
> +
> +	if (user_hv_clock.pad0 || user_hv_clock.pad[0] || user_hv_clock.pad[1])
> +		return -EINVAL;
> +
> +	if (!user_hv_clock.tsc_to_system_mul)
> +		return -EINVAL;
> +
> +	if (user_hv_clock.tsc_shift < -31 || user_hv_clock.tsc_shift > 31)
> +		return -EINVAL;
> +
> +	user_tsc_hz = hvclock_to_hz(user_hv_clock.tsc_to_system_mul,
> +				    user_hv_clock.tsc_shift);
> +
> +	kvm_hv_request_tsc_page_update(kvm);
> +
> +	/*
> +	 * kvm_start_pvclock_update() takes tsc_write_lock and opens
> +	 * the pvclock seqcount; kvm_end_pvclock_update() closes both.
> +	 * All clock state modifications between them are atomic with
> +	 * respect to readers in kvm_guest_time_update().
> +	 */
> +	kvm_start_pvclock_update(kvm);
> +	pvclock_update_vm_gtod_copy(kvm);
> +
> +	if (!ka->use_master_clock) {
> +		rc = -EINVAL;
> +		goto out;
> +	}
> +
> +	curr_tsc_hz = (u64)get_cpu_tsc_khz() * HZ_PER_KHZ;
> +	if (unlikely(curr_tsc_hz == 0)) {
> +		rc = -EINVAL;

Same comments here regarding return codes.

> +		goto out;
> +	}
> +
> +	if (kvm_caps.has_tsc_control)
> +		curr_tsc_hz = kvm_scale_tsc(curr_tsc_hz,
> +					    v->arch.l1_tsc_scaling_ratio);
> +
> +	/*
> +	 * Allow for a discrepancy of 1 kHz either way between the TSC
> +	 * frequency used to generate the user's pvclock and the current
> +	 * host's measured frequency, since they may not precisely match.
> +	 */
> +	if (user_tsc_hz < curr_tsc_hz - 1000 ||
> +	    user_tsc_hz > curr_tsc_hz + 1000) {

I don't follow, why is KVM restricting what frequency userspace can set?

> +		rc = -ERANGE;
> +		goto out;
> +	}

