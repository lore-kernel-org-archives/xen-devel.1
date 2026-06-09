Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4297BCD8CB2
	for <xen-devel@archiver.kernel.org>; Tue,  9 Jun 2026 19:27:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1333809.1596974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wX26e-0004TF-5G; Tue, 09 Jun 2026 19:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333809.1596974; Tue, 09 Jun 2026 19:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wX26e-0004T8-1K; Tue, 09 Jun 2026 19:27:24 +0000
Received: by outflank-mailman (input) for mailman id 1333809;
 Tue, 09 Jun 2026 19:27:23 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <tglx@kernel.org>) id 1wX26d-0004T2-63
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 19:27:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wX26c-008uUt-JH
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 21:27:22 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <tglx@kernel.org>)
 id 6a2868d6-2eae-0a2a0a5409dd-0a2a4502ebb4-38
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 21:27:22 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <tglx@kernel.org>)
 id 6a286918-af86-0a2a45020019-aceafc1fa4ae-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 21:27:22 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 0412F42AE7;
 Tue,  9 Jun 2026 19:27:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2361F0089A;
 Tue,  9 Jun 2026 19:27:19 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="From:To:Cc:Subject:In-Reply-To:References:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781033239;
	bh=NlG5HlDElQCbuP6bN10xR/q116+/zHdLSEjJOyQFwVw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=oStFu7N1msk7hGRxaIGxcPhSkCbArM8aV/psZO+WarZaxilvwF2cpbMRAt4n7Fpb8
	 jdoLMC/Us2am6UlMm/XjVRtHxd9CKSOXzbAPqtoDlCiOpZbpOFQ+SdLvuk0GQ7AACZ
	 3CmrygZjXjo8BSZ2RdYoEHPzauVhH2OoyWisV2Oubk42MoerR11HkIf28Ex0JbwmFs
	 FQo5z4rMOOXRCRjhYFFjZN0UvGaCt0DcbGJcLs9foFY3WZlZjLxuhnEKgDEnd+uRNU
	 itpIBzoF6ZpH4lsa9xtkX9k8gZsXaOt9VgUNb/27eAHzLLvBE62W766RQhGapY7M0m
	 b9tzm1j9ME+sA==
From: Thomas Gleixner <tglx@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Kiryl Shutsemau <kas@kernel.org>, "K. Y. Srinivasan"
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu
 <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Long Li
 <longli@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, Alexey
 Makhalov <alexey.makhalov@broadcom.com>, Jan Kiszka
 <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, Daniel
 Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>, "H.
 Peter Anvin" <hpa@zytor.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org, David
 Woodhouse <dwmw@amazon.co.uk>, Tom Lendacky <thomas.lendacky@amd.com>,
 Nikunj A Dadhania <nikunj@amd.com>, David Woodhouse <dwmw2@infradead.org>,
 Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v4 01/47] x86/tsc: Never re-calibrate TSC frequency if
 its exact timing is known
In-Reply-To: <aihKj-0nP7bUbNHH@google.com>
References: <20260529144435.704127-1-seanjc@google.com>
 <20260529144435.704127-2-seanjc@google.com> <87fr315fq9.ffs@fw13>
 <aiMPxl5vkvJDldi9@google.com> <87a4t86a0l.ffs@fw13>
 <aihKj-0nP7bUbNHH@google.com>
Date: Tue, 09 Jun 2026 21:27:17 +0200
Message-ID: <87pl1z346i.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
X-purgate-ID: tlsNG-720697/1781033242-A937C161-A7F8227D/0/0
X-purgate-type: clean
X-purgate-size: 1349

On Tue, Jun 09 2026 at 10:17, Sean Christopherson wrote:

> On Fri, Jun 05, 2026, Thomas Gleixner wrote:
>> On Fri, Jun 05 2026 at 11:04, Sean Christopherson wrote:
>> But we also should have a check in the TSC init code somewhere which
>> validates that X86_FEATURE_CONSTANT_TSC is set when
>> X86_FEATURE_TSC_KNOWN_FREQ is set. X86_FEATURE_TSC_KNOWN_FREQ is useless
>> w/o X86_FEATURE_CONSTANT_TSC.
>
> Ugh, any objection to punting on this for now?  KVM and Xen guests will trigger
> TSC_KNOWN_FREQ without CONSTANT_TSC, thanks to commits:
>
>   e10f78050323 ("kvmclock: fix TSC calibration for nested guests")
>   898ec52d2ba0 ("x86/xen/time: Set the X86_FEATURE_TSC_KNOWN_FREQ flag in xen_tsc_khz()")
>
> Hyper-V guests might as well?  Hyper-V's handling of TSC is weird, even for a
> hypervisor.

Hypervisors are ranked by weirdness? I ranked them by insanity so far.

> Even when the frequency is provided in CPUID by the hypervisor, QEMU at least
> requires a fairly explicit opt-in to advertise CONSTANT_TSC, presumably to try
> to prevent users from shooting themselves in the foot.

Bah. We really should have enforced the dependency when we introduced
KNOWN_FREQ. But that ship has sailed.

Though for correctness sake this should be fixed at some point in the
foreseeable future.

Thanks,

        tglx

