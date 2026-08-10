Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CBEC5B570
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 17:48:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387727.1628970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtU6X-0004IL-80; Mon, 10 Aug 2026 17:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387727.1628970; Mon, 10 Aug 2026 17:48:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtU6X-0004IE-3r; Mon, 10 Aug 2026 17:48:05 +0000
Received: by outflank-mailman (input) for mailman id 1387727;
 Mon, 10 Aug 2026 17:48:04 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <30A56agYKCTEfRNaWPTbbTYR.PbZkRa-QRiRYYVfgf.kRacebWRPg.beT@flex--seanjc.bounces.google.com>)
 id 1wtU6V-0004H0-Uq
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 17:48:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtU6V-00Bt7l-2E
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 19:48:03 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <30A56agYKCTEfRNaWPTbbTYR.PbZkRa-QRiRYYVfgf.kRacebWRPg.beT@flex--seanjc.bounces.google.com>)
 id 6a7a0eb2-e002-0a2a0a5209dd-0a2a4504d570-42
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 19:48:02 +0200
Received: from [209.85.214.199] (helo=mail-pl1-f199.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <30A56agYKCTEfRNaWPTbbTYR.PbZkRa-QRiRYYVfgf.kRacebWRPg.beT@flex--seanjc.bounces.google.com>)
 id 6a7a0ed1-b57f-0a2a45040019-d155d6c7ec70-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 19:48:02 +0200
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2cacf17c7e0so31032415ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 10:48:02 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786384081; x=1786988881; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SniDEAr8Q0oZEkC+DBXZ7AH2ONN7iandHQRV9KjayUM=;
        b=D46kqTkDEKuBRi2F4mjHWOZBsvIc0JTutWxM5i5TjMq5VBJ/RYbmr4FA0A5EeNUYBA
         SvQpaEYUlWFtksoCDmNEfsIV+n7uM/DOrMLxkNOabvesDvEycbcRuCTArvhz+iO2Tu4i
         Y4m4buNbSZTpCOW0g1sKruMMaOxXkNOATjpf69Ykdv8ELwQ96hhln9jSo27DU57YZ1os
         7avBWkPH/iz/s9QamMSmJjNw2NZUjQLX7NcMPGFvAcE6dFzJSLX30ZP+ARhcNI6w5i+N
         qgqonlFaEeRNl7Jr4skixvrhclln2q+u+nKvBPCBQC/jpEA9zAEyXAA7SpE6w7LZXprb
         iJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786384081; x=1786988881;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SniDEAr8Q0oZEkC+DBXZ7AH2ONN7iandHQRV9KjayUM=;
        b=p9TgHWasbejSZ6cRD3A+nNDESCHwukSGinpM0FCSahAT34N4N8CQLzv+3SZimR7AGK
         /jvkZSLozGumlW8cdMVLWs0m0wcq17OFtqLFu5obN3cC3zwU0Uj/eQKBzbXtf+eFVhzI
         OmAgHB0wmt1a5IBim1Y5cSmraIt9RtkDCqVXM4tDyBeEy5x49ZXfjrY5YCLJz8eWXOv7
         B1XIl3n4/5pgaTmpu8jI89fP4Rs5m7e0iIEjYfs9MBPHGN2NjzauluKMFpimPH9G7SY5
         ZjTyaOsKzEmE8ZuTNb0420TN3YlDkENi/xI4MRHMmrBi6Tl+kGWgtRPkcuZ+ExUS9Zhs
         pevQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro8V+NYJDaTB0G6Pm9GOtiuCz8oGT5+Ul7uUyjv7X23YcEHZx3r+17Cl43Wdak2762ektlSNXH1064=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxMLbDsiMF6ntgmUgbDPUOBsayZFmdIPRN8LokcDfe0xzy7dMsB
	2xORxWe08tKurIi/mug6ZEU/UDjP3tTH+OmPbg7eCM/W+WbA6tqny3pvfO26W/YsHTlPT+KpNKW
	WC48R8Q==
X-Received: from plof2.prod.google.com ([2002:a17:902:8602:b0:2ca:f171:2082])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ea0d:b0:2c6:a012:6241
 with SMTP id d9443c01a7336-2d106a7e616mr344060945ad.6.1786384080573; Mon, 10
 Aug 2026 10:48:00 -0700 (PDT)
Date: Mon, 10 Aug 2026 10:47:59 -0700
In-Reply-To: <20260728144954.355376-18-dwmw2@infradead.org>
Mime-Version: 1.0
References: <20260728144954.355376-1-dwmw2@infradead.org> <20260728144954.355376-18-dwmw2@infradead.org>
Message-ID: <anoOz2rZ02KFk1l-@google.com>
Subject: Re: [PATCH v7 17/36] KVM: x86: Allow KVM master clock mode when TSCs
 are offset from each other
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
X-purgate-ID: tlsNG-ebf023/1786384082-C1CD7B50-0587739D/0/0
X-purgate-type: clean
X-purgate-size: 2413

On Tue, Jul 28, 2026, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Previously, a guest writing different TSC values on different vCPUs could
> force KVM out of master clock mode. With this change, only a frequency
> mismatch disables master clock. The only ways for non-master-clock mode
> to happen now are archaic hardware without a TSC-based clocksource, a
> VMM that sets different TSC frequencies across vCPUs, or a guest using
> the legacy MSR_KVM_SYSTEM_TIME (which could be addressed in future by
> simply updating tsc_timestamp more frequently rather than falling out of
> master clock mode entirely).
> 
> Running at a different frequency would lead to a systemic skew between
> the clock(s) as observed by different vCPUs due to arithmetic precision
> in the scaling. So that should indeed force the clock to be based on the
> host's CLOCK_MONOTONIC_RAW instead of being in masterclock mode where it
> is defined by the guest TSC.
> 
> But when the vCPUs merely have a different TSC *offset*, that's not a
> problem. The offset is applied to that vCPU's kvmclock->tsc_timestamp
> field, and it all comes out in the wash.

It's not though?  The value stored in kvmclock->tsc_timestamp is per-VM, not
per-vCPU, when using the master clock.  It's a little easier to see once the
master clock TSC isn't shoved into host_tsc:

	do {
		seq = read_seqcount_begin(&ka->pvclock_sc);
		use_master_clock = ka->use_master_clock;
		if (!use_master_clock)
			continue;

		if (!kvm_get_time_and_clockread(&kernel_ns, &host_tsc)) {
			use_master_clock = false;
			continue;
		}

		master_tsc = ka->master_cycle_now;
		master_ns = ka->master_kernel_ns;
	} while (read_seqcount_retry(&ka->pvclock_sc, seq));

	...

	if (use_master_clock) {
		hv_clock.tsc_timestamp = kvm_read_l1_tsc(v, master_tsc);
		hv_clock.system_time = master_ns + v->kvm->arch.kvmclock_offset;
	} else {
		hv_clock.tsc_timestamp = tsc_timestamp;
		hv_clock.system_time = kernel_ns + v->kvm->arch.kvmclock_offset;
	}

To allow different offsets, KVM would need to track a per-vCPU offset to the
master clock and apply that in kvm_guest_time_update() (and maybe other places?).
Which is doable, but it's not clear to me why we'd want to support that (though
I haven't fully processed the back half ot his series, so it's very possible I'm
missing something obvious).

