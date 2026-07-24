Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25479C531C9
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2026 21:17:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1370230.1618464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnNGm-0001FU-Re; Fri, 24 Jul 2026 21:17:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1370230.1618464; Fri, 24 Jul 2026 21:17:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnNGm-0001FN-O0; Fri, 24 Jul 2026 21:17:24 +0000
Received: by outflank-mailman (input) for mailman id 1370230;
 Fri, 24 Jul 2026 21:17:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3X9ZjagYKCfQoaWjfYckkcha.Ykitaj-Zarahheopo.tajlnkfaYp.knc@flex--seanjc.bounces.google.com>)
 id 1wnNGl-0001FH-Df
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 21:17:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wnNGk-0056Ay-FY
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 23:17:22 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3X9ZjagYKCfQoaWjfYckkcha.Ykitaj-Zarahheopo.tajlnkfaYp.knc@flex--seanjc.bounces.google.com>)
 id 6a63d630-5cb7-0a2a0a5109dd-0a2a4502851e-16
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 23:17:22 +0200
Received: from [209.85.215.198] (helo=mail-pg1-f198.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3X9ZjagYKCfQoaWjfYckkcha.Ykitaj-Zarahheopo.tajlnkfaYp.knc@flex--seanjc.bounces.google.com>)
 id 6a63d660-6ca4-0a2a45020019-d155d7c6d1e5-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 23:17:22 +0200
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-ca7c1e22995so1299815a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 14:17:21 -0700 (PDT)
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
        d=google.com; s=20251104; t=1784927840; x=1785532640; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qaDJGo3QzvQFzPZvOWzcRrVUb5WUbdae9wGlen05sOY=;
        b=gVt74gOMkphkrR0XjG4epZt50AYFCuWbJ2sRM3Xodl8P/lDae/anCA+Srj0hn832Mh
         qNgrXtyStDcOLguW7UIO0wPzkzFBTE4LvDy4+h1kSyxfG+GPY0GXtiiC8Vqc6MUZ1bQg
         M3nsbz9qCwg4W7djOnSsIEEcCYrQk0fwvzeG/PQEiglmzs3CETMKmIe4VuwkoKkQfoiX
         3E+sq7NszRdpDf2UWOVkgdZv9lwcj8BBPVfOh++vOMKY/4SANYwnUankkF4g6jnSIQpY
         Uran2s0eLo/srR78oOza3oq69VVjaM1PnI9JWsnaELXSFBqCds1aMFqZ2R//7nJI49RM
         hhzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784927840; x=1785532640;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qaDJGo3QzvQFzPZvOWzcRrVUb5WUbdae9wGlen05sOY=;
        b=E8jZsomV1Du+9EWbYekJ3RhbNiyqMb2u6Oh4H5kaJeOd8/Izu+9/HU2G285td/JoCO
         MDEEAy5EY0poQqUgqyyuklJL4zxqibUPckEoA6tcjFOropea4D7iFYxG4dbjuP8jVW5P
         xrUUeSc9kMHKTb+BkwWjo0+t6FornfsGPAzc9nLemeKsiM6v383BDVCu7kZe8+2JEnOY
         +kwncI1JT1ykspiMCRzHisxYvSxyzF+EM6xYUutW5hAVzdrcrcr3A+YBEvoJbEnbb5t7
         4Rv/RioFuz0wyVvI+fZQeuHZRS6cGZIbYcjSGabu9pM5KmJujJM4P3kSm9xQbRUEuROp
         4avA==
X-Forwarded-Encrypted: i=1; AHgh+Rq6ppUcp19XjRnT8v0+aGpSI/+ZZRGX6VLPiBG1Qp/wxkgCm7I7ERds5wfcaAaM5F3KlbK4yj1opGM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSZxlndJO9uchPOj4IdLS0FJW3Vx+GdwUE33jxvHO/V9UKPMO0
	2IapsB+cXIlfbcwyL0F7SfqUx53cDU6aV8EOY3l1qKgCtxFe2UHQ+VxaOF0g2dpFBz2sPBynUL6
	blzXHFQ==
X-Received: from pgac25.prod.google.com ([2002:a05:6a02:2959:b0:c8d:62a8:ee35])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3993:b0:3c0:9c19:65b4
 with SMTP id adf61e73a8af0-3c67e19bcedmr3486637.76.1784927839948; Fri, 24 Jul
 2026 14:17:19 -0700 (PDT)
Date: Fri, 24 Jul 2026 14:17:19 -0700
In-Reply-To: <20260703212145.343527-6-dwmw2@infradead.org>
Mime-Version: 1.0
References: <20260703212145.343527-1-dwmw2@infradead.org> <20260703212145.343527-6-dwmw2@infradead.org>
Message-ID: <amPWX8lKXw2KS_kZ@google.com>
Subject: Re: [PATCH v6 05/36] KVM: x86: Add KVM_[GS]ET_CLOCK_GUEST for
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
X-purgate-ID: tlsNG-720697/1784927842-67ABD2AC-1E3D6D05/0/0
X-purgate-type: clean
X-purgate-size: 4244

On Fri, Jul 03, 2026, David Woodhouse wrote:
> From: Jack Allister <jalliste@amazon.com>
> 
> In the common case (where kvm->arch.use_master_clock is true), the KVM
> clock is defined as a simple arithmetic function of the guest TSC, based
> on a reference point stored in kvm->arch.master_kernel_ns and
> kvm->arch.master_cycle_now.
> 
> The existing KVM_[GS]ET_CLOCK functionality does not allow for this
> relationship to be precisely saved and restored by userspace. All it can
> currently do is set the KVM clock at a given UTC reference time, which
> is necessarily imprecise.
> 
> So on live update, the guest TSC can remain cycle accurate at precisely
> the same offset from the host TSC, but there is no way for userspace to
> restore the KVM clock accurately.
> 
> Even on live migration to a new host, where the accuracy of the guest
> time-keeping is fundamentally limited by the accuracy of wallclock
> synchronization between the source and destination hosts, the clock jump
> experienced by the guest's TSC and its KVM clock should at least be
> *consistent*. Even when the guest TSC suffers a discontinuity, its KVM
> clock should still remain the *same* arithmetic function of the guest
> TSC, and not suffer an *additional* discontinuity.
> 
> To allow for accurate migration of the KVM clock, add per-vCPU ioctls
> which save and restore the actual PV clock info in
> pvclock_vcpu_time_info.
> 
> The restoration in KVM_SET_CLOCK_GUEST works by creating a new reference
> point in time just as kvm_update_masterclock() does, and calculating the
> corresponding guest TSC value. This guest TSC value is then passed
> through the user-provided pvclock structure to generate the *intended*
> KVM clock value at that point in time, and through the *actual* KVM
> clock calculation. Then kvm->arch.kvmclock_offset is adjusted to
> eliminate the difference.
> 
> Where kvm->arch.use_master_clock is false (because the host TSC is
> unreliable, or the guest TSCs are configured strangely), the KVM clock
> is *not* defined as a function of the guest TSC so KVM_GET_CLOCK_GUEST
> returns an error. In this case, as documented, userspace shall use the
> legacy KVM_GET_CLOCK ioctl. The loss of precision is acceptable in this
> case since the clocks are imprecise in this mode anyway.
> 
> On *restoration*, if kvm->arch.use_master_clock is false, an error is
> returned for similar reasons and userspace shall fall back to using
> KVM_SET_CLOCK. This does mean that, as documented, userspace needs to
> use *both* KVM_GET_CLOCK_GUEST and KVM_GET_CLOCK and send both results
> with the migration data (unless the intent is to refuse to resume on a
> host with bad TSC).

Please post this as a standalone mini-series.  AFAICT, the only dependency of
any kind is a minor conflict with the s/hw_tsc_khz/hw_tsc_hz change, and that's
trivial to sort out later on.

I'm comfortable stumbling my way through the clock fixes, but I want Paolo (and
others) eyeballs on new uAPI like this.  And because this series is plenty big
without this one :-)

> Co-developed-by: David Woodhouse <dwmw@amazon.co.uk>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Signed-off-by: Jack Allister <jalliste@amazon.com>
> Reviewed-by: Paul Durrant <paul@xen.org>
> Cc: Dongli Zhang <dongli.zhang@oracle.com>
> Tested-by: Dongli Zhang <dongli.zhang@oracle.com>
> ---
>  Documentation/virt/kvm/api.rst  |  37 +++++++
>  arch/x86/include/uapi/asm/kvm.h |   1 +
>  arch/x86/kvm/x86.c              | 171 ++++++++++++++++++++++++++++++++
>  include/uapi/linux/kvm.h        |   3 +
>  4 files changed, 212 insertions(+)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 52bbbb553ce1..2268b4442df6 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6553,6 +6553,43 @@ KVM_S390_KEYOP_SSKE
>    Sets the storage key for the guest address ``guest_addr`` to the key
>    specified in ``key``, returning the previous value in ``key``.
>  
> +4.145 KVM_GET_CLOCK_GUEST
> +----------------------------
> +
> +:Capability: none

Why not add a CAP?  The check in the subsequent selftest is quite gross.

