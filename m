Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E3CC54F51
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 23:18:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375086.1622365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wor3u-0005bR-HP; Tue, 28 Jul 2026 23:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375086.1622365; Tue, 28 Jul 2026 23:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wor3u-0005bK-E8; Tue, 28 Jul 2026 23:18:14 +0000
Received: by outflank-mailman (input) for mailman id 1375086;
 Tue, 28 Jul 2026 23:18:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3sjhpagYKCSMRD9MIBFNNFKD.BNLWDM-CDUDKKHRSR.WDMOQNIDBS.NQF@flex--seanjc.bounces.google.com>)
 id 1wor3t-0005bE-DA
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 23:18:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wor3s-00CViM-Em
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 01:18:12 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3sjhpagYKCSMRD9MIBFNNFKD.BNLWDM-CDUDKKHRSR.WDMOQNIDBS.NQF@flex--seanjc.bounces.google.com>)
 id 6a693873-2eae-0a2a0a5409dd-0a2a4502e124-38
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 01:18:12 +0200
Received: from [209.85.210.197] (helo=mail-pf1-f197.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3sjhpagYKCSMRD9MIBFNNFKD.BNLWDM-CDUDKKHRSR.WDMOQNIDBS.NQF@flex--seanjc.bounces.google.com>)
 id 6a6938b2-6ca4-0a2a45020019-d155d2c5cd5b-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 01:18:12 +0200
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-84857446424so628451b3a.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 16:18:11 -0700 (PDT)
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
        d=google.com; s=20251104; t=1785280690; x=1785885490; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ex04CCTVdjetODvdAROex2NhCtrMzXHsD4UUHe0nQXo=;
        b=adtgHI4VTxfFA3+lbt8slPZ7mGCUY3ovscXcqb4QhngdSTaRFKzG63rrmuSd7NMR/r
         3vTRHNLuOR4HznIpT1C6ndJzUg8pUJ7bbNVyPVlKRUJjbH/V7rSlOAGgemMP5EEYwHsc
         +tVGdSEOOtjdGtiEdOkZMjIReaxIBHNMZRa9yGrXCUGHNXMQMe//vTRj3R0mQpQ81QqJ
         ggFk8SyzND67UviFR612bb4K2FpWp/2PNjsGQiWNdxaz4V8J2SoTN+i99d1jcuKzGSnz
         CYjYn+XMVQVqd4OXikCTYm5XqfcAH7ZFVhJtXBP2bvu4HyAi3rL5x4MEjORoRDyTZE0Z
         BaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785280690; x=1785885490;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ex04CCTVdjetODvdAROex2NhCtrMzXHsD4UUHe0nQXo=;
        b=T/56qiCkEgzSxRTvBRUofCVwD3TEAO08X+uW2Kr2Z/1apENnAH21r+bexSADq/gv0F
         UI5Ss0fdrjNFrWBiAPVtMoLjvdP+GRQ+s0fYQqh9ouIJHZyXxUNJYvizvQ4e2UONSFoY
         QKy74UMcJDV/iwZ1XbMx19lfGKvppFvPb4kOKVCXPkrZR6uqiv//iPt6UaoH1dD4uj/f
         NhZD/Nocwyvc2jKn+bwsgj9St4GUlMYRUYaqd5Mvq+67zsV6/ClEf2dfzMgqOKFUldMv
         3MpT1o7ukxK4jkTklf+5sbP7oeM+LvVbM+OX+7C6wMcOrW/mTenbapRFXkL8nkM127uk
         bWfA==
X-Forwarded-Encrypted: i=1; AHgh+RobahKH/jSQIiepbb+2jJGwMgiKZe1cpqQGDzxHVowUbuRNcVrM995AbghC+/UNt+mg0zeuqT/geSw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwbERHHvIHvcpJlOafdAYjlVTNOGVgL7RCTydeIyc9XLtjoyD2J
	a8W5qsyO3bhQWwCYgUWKq465nt1one9OcwuDTePv5kNIC3FMcat2qHHTUPVcPhezRzQ+OApTHiY
	TE1qeXA==
X-Received: from pfbig4.prod.google.com ([2002:a05:6a00:8b84:b0:84b:4480:8b65])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:288e:b0:847:8250:2b2a
 with SMTP id d2e1a72fcca58-84e933f382dmr4685664b3a.60.1785280690057; Tue, 28
 Jul 2026 16:18:10 -0700 (PDT)
Date: Tue, 28 Jul 2026 16:18:09 -0700
In-Reply-To: <20260728144954.355376-1-dwmw2@infradead.org>
Mime-Version: 1.0
References: <20260728144954.355376-1-dwmw2@infradead.org>
Message-ID: <amk4sX57FwapIp9B@google.com>
Subject: Re: [PATCH v7 00/36] Cleaning up the KVM clock mess
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
X-purgate-ID: tlsNG-720697/1785280692-67CBA2AC-293417E6/0/0
X-purgate-type: clean
X-purgate-size: 3373

On Tue, Jul 28, 2026, David Woodhouse wrote:
> This is v7 of the series to clean up the KVM clock, rebased onto
> kvm-x86/next (patch 1 of v6 is already merged there as commit
> 710b3a30f407).

FYI, I'm going to rebase that commit again, to put all of this in a dedicated
topic branch.  But I'll also take care of updating references in commit messages.
More below.

> David Woodhouse (33):
>       KVM: x86: Improve accuracy of KVM clock when TSC scaling is in force
>       KVM: x86: Explicitly disable TSC scaling without CONSTANT_TSC
>       KVM: x86: Activate master clock immediately on vCPU creation
>       KVM: x86: Avoid NTP frequency skew for KVM clock on 32-bit host
>       KVM: x86: Fold __get_kvmclock() into get_kvmclock()
>       KVM: x86: Drop CPU pinning in get_kvmclock()
>       KVM: x86: Restructure get_kvmclock()
>       KVM: x86: Fix KVM clock precision in get_kvmclock() with TSC scaling
>       KVM: x86: Use get_kvmclock() in kvm_get_wall_clock_epoch()
>       KVM: x86: Fix compute_guest_tsc() to handle negative time deltas
>       KVM: x86: Restructure kvm_guest_time_update() for TSC upscaling
>       KVM: x86: Simplify and comment kvm_get_time_scale()

I'll post a new version up through here, get it applied soon-ish, and then get
back to chipping away at the rest of the series.  It'd obviously be nice to get
all the cleanups (and the tests) into 7.3, but I suspect the rest will take a
bit of back and worth (with Sashiko, if not me :-D).

I may punt on "Restructure kvm_guest_time_update() for TSC upscaling" if I have
trouble sorting through Sashiko's feedback, but I'll give it a shot.  I need to
page that all back in anyways.

>       KVM: x86: Remove implicit rdtsc() from kvm_compute_l1_tsc_offset()
>       KVM: x86: Improve synchronization in kvm_synchronize_tsc()
>       KVM: x86: Kill last_tsc_{nsec,write,offset} fields
>       KVM: x86: Replace nr_vcpus_matched_tsc count with all_vcpus_matched_tsc bool
>       KVM: x86: Allow KVM master clock mode when TSCs are offset from each other
>       KVM: x86: Factor out kvm_use_master_clock()
>       KVM: x86: Avoid gratuitous global clock updates
>       KVM: x86/xen: Prevent runstate times from becoming negative
>       KVM: x86: Avoid redundant masterclock updates from multiple vCPUs
>       KVM: x86: Remove runtime Xen TSC frequency CPUID update
>       KVM: x86: Re-synchronize TSC after KVM_SET_TSC_KHZ
>       KVM: x86: Use ktime_get_snapshot_id() for master clock
>       KVM: x86: Compute kvmclock base without pvclock_gtod_data
>       KVM: x86: Cache host vclock_mode for masterclock eligibility checks
>       KVM: x86: Remove pvclock_gtod_data and private timekeeping code
>       KVM: x86: Activate master clock from kvm_arch_init_vm()
>       KVM: selftests: Use UAPI pvclock-abi.h in xen_shinfo_test
>       KVM: x86: Add KVM_VCPU_TSC_SCALE and fix the documentation on TSC migration
>       KVM: selftests: Add master clock offset test
>       KVM: selftests: Add Xen/generic CPUID timing leaf test
>       KVM: selftests: Add Xen runstate migration test
> 
> Jack Allister (3):
>       UAPI: x86: Move pvclock-abi to UAPI for x86 platforms
>       KVM: x86: Add KVM_[GS]ET_CLOCK_GUEST for accurate KVM clock migration
>       KVM: selftests: Add KVM/PV clock selftest to prove timer correction

