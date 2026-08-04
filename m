Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50803C55182
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 01:26:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381844.1625314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wr3v3-0000X4-FM; Tue, 04 Aug 2026 01:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381844.1625314; Tue, 04 Aug 2026 01:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wr3v3-0000Ww-C0; Tue, 04 Aug 2026 01:26:13 +0000
Received: by outflank-mailman (input) for mailman id 1381844;
 Tue, 04 Aug 2026 01:26:12 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3sD9xagYKCU89vr40tx55x2v.t53Ev4-uvCv22z9A9.Ev46850vtA.58x@flex--seanjc.bounces.google.com>)
 id 1wr3v2-0000Wq-He
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 01:26:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wr3v1-00CvVm-7u
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 03:26:11 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3sD9xagYKCU89vr40tx55x2v.t53Ev4-uvCv22z9A9.Ev46850vtA.58x@flex--seanjc.bounces.google.com>)
 id 6a713f9c-bab6-0a2a0a5309dd-0a2a4502e7c8-16
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 03:26:11 +0200
Received: from [209.85.215.198] (helo=mail-pg1-f198.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3sD9xagYKCU89vr40tx55x2v.t53Ev4-uvCv22z9A9.Ev46850vtA.58x@flex--seanjc.bounces.google.com>)
 id 6a713fb1-6ca4-0a2a45020019-d155d7c6c1e2-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 03:26:11 +0200
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-cbb6433e9d4so5366091a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 18:26:10 -0700 (PDT)
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
        d=google.com; s=20251104; t=1785806769; x=1786411569; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6RexsWdhj3mVsIfZtSBkyTeZ2lUaorlH2urK3kzEKiI=;
        b=LQ5wEqUBm3MDYN6aB73gurgjp8JaXG4ZJ2nvHxYEF9wurXESSukvRYuRg2Lsjq9f1D
         iYAodCQaNtVIQTBRVjdpNX/Vm60uiYIkObBVyF0rzG/3L9ZyDut5IxcfLB+NEE1iEw4n
         JRPCgEn48zeysyOCWuR6hHd05E+wA26w3rOk+GHlcLFSIFo2qCJPD0KX2l1r5B4Wca6j
         VXvXUPNojf9AVnduoyfSngUBimCGQieyR0CfUi5q7h/8YXU6H4akzMa78z5UOjOC6O57
         1Fx8GxHCSMnw31VBCpoJx7dg0pdYYgKn+fFK77M4ZKB4P/y7aQRS8wRJ0oYL9HEs0sUD
         tHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785806769; x=1786411569;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6RexsWdhj3mVsIfZtSBkyTeZ2lUaorlH2urK3kzEKiI=;
        b=lEkAI3boh2PF0SO7aliqQazqZZ+8tz10XGXFQZARKttHXIQ5uXq27WSW/Mn7LUKfN1
         UuM8HBW4cnfhzmaahotC3gSO6H6x4BJaTPAKItezGoK4xqtqEbLMqoLXdPWDnEsic0rB
         GvjHT1CdVT4xL4r0ohfNIdtHJ46YybmbTaL7hBPa6+RdMMUdkdCIEzYD5wkMOVb/nDJj
         pxBB7W4+xa6vZbN58FJ6aauMoxujOcVR4UzvlPf5Y8BujZQaONjLPdY1Kii8pbYGpiiw
         wnvBrWnMz1mDiu2Dy8J1Tit3gPgQj8aJRz06LS67iCefK17z2fJXpxpT1sMIID9rs4YP
         JtxQ==
X-Forwarded-Encrypted: i=1; AHgh+RpRy4DpdcLATkPmfEs++AwTppcQcfNyiuXsQXRgmOu/2vY701zUz/eqqBtf4WD4NgB6Qtgtubvt9AU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwfsZQox8P32pPgS9WS0Gf6mAHWNEi2Jnx3frCkxznz/L0bFMxS
	Fx7v7zLkNidP0dRg2lxno3ks7r1u8ek9s3zGJ4ilGn9tJTRbWntGO6YN6BPoy61p7VP2V6Pt8N6
	W2+f3Gg==
X-Received: from pgvt1.prod.google.com ([2002:a65:64c1:0:b0:c9e:63b8:11b5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6cc4:b0:3b4:61f:1fec
 with SMTP id adf61e73a8af0-3c92a4c4549mr11840955637.2.1785806768677; Mon, 03
 Aug 2026 18:26:08 -0700 (PDT)
Date: Mon, 3 Aug 2026 18:26:08 -0700
In-Reply-To: <20260728144954.355376-12-dwmw2@infradead.org>
Mime-Version: 1.0
References: <20260728144954.355376-1-dwmw2@infradead.org> <20260728144954.355376-12-dwmw2@infradead.org>
Message-ID: <anE_sD1a0ycJBAEv@google.com>
Subject: Re: [PATCH v7 11/36] KVM: x86: Restructure kvm_guest_time_update()
 for TSC upscaling
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
X-purgate-ID: tlsNG-720697/1785806771-319CB2AC-62EB56ED/0/0
X-purgate-type: clean
X-purgate-size: 7127

On Tue, Jul 28, 2026, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Restructure kvm_guest_time_update() so that kernel_ns/host_tsc are
> always "now" when doing TSC catchup, then swap in the master clock
> reference values afterward for the hv_clock.
> 
> This makes the TSC upscaling code considerably simpler: the catchup
> adjustment is computed as the delta between what the guest TSC *should*
> be at "now" and what it actually is, rather than mixing "now" and
> "master clock reference" timestamps.
> 
> The seqcount loop now also contains the kvm_get_time_and_clockread()
> call (matching get_kvmclock's pattern).
> 
> Based on a suggestion by Sean Christopherson.

Looking at this with fresh eyes, it wasn't a very good suggestion.  In addition
to the goof Sashiko reported, propagating master_host_tsc/master_kernel_ns to
host_tsc/kernel_ns is completely unnecessary and convoluted, it's much easier to
simply use master_{host_tsc,kernel_ns} when stuffing hv_clock.

> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  arch/x86/kvm/x86.c | 78 ++++++++++++++++++++++++++++++++--------------
>  1 file changed, 54 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 52c9268007f8..12c3d7d503ca 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -1793,45 +1793,60 @@ static void kvm_setup_guest_pvclock(struct pvclock_vcpu_time_info *ref_hv_clock,
>  int kvm_guest_time_update(struct kvm_vcpu *v)
>  {
>  	struct pvclock_vcpu_time_info hv_clock = {};
> -	unsigned long flags;
>  	u64 tgt_tsc_hz;
>  	unsigned seq;
>  	struct kvm_vcpu_arch *vcpu = &v->arch;
>  	struct kvm_arch *ka = &v->kvm->arch;
>  	s64 kernel_ns;
>  	u64 tsc_timestamp, host_tsc;
> +	u64 master_host_tsc = 0;
> +	s64 master_kernel_ns = 0;
> +	s64 kvmclock_offset = 0;
>  	bool use_master_clock;
>  
> -	kernel_ns = 0;
> -	host_tsc = 0;
> -
>  	/*
>  	 * If the host uses TSC clock, then passthrough TSC as stable
>  	 * to the guest.
>  	 */
>  	do {
>  		seq = read_seqcount_begin(&ka->pvclock_sc);
> +
>  		use_master_clock = ka->use_master_clock;
> +
> +		/*
> +		 * The TSC read and the call to get_cpu_tsc_khz() must happen
> +		 * on the same CPU.
> +		 */
> +		get_cpu();
> +
> +		tgt_tsc_hz = (u64)get_cpu_tsc_khz() * HZ_PER_KHZ;
> +
> +#ifdef CONFIG_X86_64
> +		if (use_master_clock &&
> +		    !kvm_get_time_and_clockread(&kernel_ns, &host_tsc) &&
> +		    !read_seqcount_retry(&ka->pvclock_sc, seq))
> +			use_master_clock = false;
> +#endif

Actually, the entire use_master_clock code can be thrown under CONFIG_X86_64=y
(in a separate prep patch).

> @@ -1841,17 +1856,32 @@ int kvm_guest_time_update(struct kvm_vcpu *v)
>  	 *      entry to avoid unknown leaps of TSC even when running
>  	 *      again on the same CPU.  This may cause apparent elapsed
>  	 *      time to disappear, and the guest to stand still or run
> -	 *	very slowly.
> +	 *      very slowly.
>  	 */
>  	if (vcpu->tsc_catchup) {
> -		u64 tsc = compute_guest_tsc(v, kernel_ns);
> -		if (tsc > tsc_timestamp) {
> -			adjust_tsc_offset_guest(v, tsc - tsc_timestamp);
> -			tsc_timestamp = tsc;
> -		}
> +		s64 adjustment;
> +
> +		/*
> +		 * Calculate the delta between what the guest TSC *should* be
> +		 * and what it actually is according to kvm_read_l1_tsc().
> +		 */
> +		adjustment = compute_guest_tsc(v, kernel_ns) -
> +			     kvm_read_l1_tsc(v, host_tsc);
> +		if (adjustment > 0)
> +			adjust_tsc_offset_guest(v, adjustment);
>  	}
>  
> -	local_irq_restore(flags);
> +	/*
> +	 * Now that TSC upscaling is out of the way, the remaining calculations
> +	 * are all relative to the reference time that's placed in hv_clock.
> +	 * If the master clock is NOT in use, the reference time is "now".  If
> +	 * master clock is in use, the reference time comes from there.
> +	 */
> +	if (use_master_clock) {
> +		host_tsc = master_host_tsc;
> +		kernel_ns = master_kernel_ns;
> +	}
> +	tsc_timestamp = kvm_read_l1_tsc(v, host_tsc);

And the big reason my suggestion was bad: this is wrong for vcpu->last_guest_tsc,
because vcpu->last_guest_tsc needs to be updated to "now" (it's the same TSC
that's shoved into TSC_OFFSET in the tsc_catchup path).

This is what I have locally for the change this patch really cares about.  This,
and several prep cleanup patches, pass your selftests with the rest of the series
piled on top.

Assuming my other testing doesn't explode, I'll get a sub-series through
"KVM: x86: Remove implicit rdtsc() from kvm_compute_l1_tsc_offset()" posted
tomorrow, with the plan of landing all of that in 7.3.  That'd leave about half
the patches for 7.4, which certainly isn't ideal, but it's not too shabby either.

---
 arch/x86/kvm/x86.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 793340292d39..e826d1f8cabe 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -1796,12 +1796,11 @@ static void kvm_setup_guest_pvclock(struct pvclock_vcpu_time_info *ref_hv_clock,
 
 int kvm_guest_time_update(struct kvm_vcpu *v)
 {
+	u64 tgt_tsc_hz, tsc_timestamp, host_tsc, master_tsc, master_ns;
 	struct kvm_arch *ka __maybe_unused = &v->kvm->arch;
 	struct pvclock_vcpu_time_info hv_clock = {};
-	u64 tgt_tsc_hz;
 	struct kvm_vcpu_arch *vcpu = &v->arch;
 	s64 kernel_ns;
-	u64 tsc_timestamp, host_tsc;
 
 	/*
 	 * If the host uses TSC clock, then passthrough TSC as stable
@@ -1814,10 +1813,16 @@ int kvm_guest_time_update(struct kvm_vcpu *v)
 	do {
 		seq = read_seqcount_begin(&ka->pvclock_sc);
 		use_master_clock = ka->use_master_clock;
-		if (use_master_clock) {
-			host_tsc = ka->master_cycle_now;
-			kernel_ns = ka->master_kernel_ns;
+		if (!use_master_clock)
+			continue;
+
+		if (!kvm_get_time_and_clockread(&kernel_ns, &host_tsc)) {
+			use_master_clock = false;
+			continue;
 		}
+
+		master_tsc = ka->master_cycle_now;
+		master_ns = ka->master_kernel_ns;
 	} while (read_seqcount_retry(&ka->pvclock_sc, seq));
 #else
 	const bool use_master_clock = false;
@@ -1883,8 +1888,18 @@ int kvm_guest_time_update(struct kvm_vcpu *v)
 
 	hv_clock.tsc_shift = vcpu->pvclock_tsc_shift;
 	hv_clock.tsc_to_system_mul = vcpu->pvclock_tsc_mul;
-	hv_clock.tsc_timestamp = tsc_timestamp;
-	hv_clock.system_time = kernel_ns + v->kvm->arch.kvmclock_offset;
+	/*
+	 * If the master clock is NOT in use, the reference time placed in the
+	 * hv_clock is "now".  If master clock is in use, the reference time is
+	 * the master clock's snapshot from some time in the past, not "now".
+	 */
+	if (use_master_clock) {
+		hv_clock.tsc_timestamp = kvm_read_l1_tsc(v, master_tsc);
+		hv_clock.system_time = master_ns + v->kvm->arch.kvmclock_offset;
+	} else {
+		hv_clock.tsc_timestamp = tsc_timestamp;
+		hv_clock.system_time = kernel_ns + v->kvm->arch.kvmclock_offset;
+	}
 
 	/* If the host uses TSC clocksource, then it is stable */
 	hv_clock.flags = 0;
-- 

