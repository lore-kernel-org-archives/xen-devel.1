Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED72CD6E77
	for <xen-devel@archiver.kernel.org>; Fri,  5 Jun 2026 12:34:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1329442.1593570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVTks-0002nI-6k; Fri, 05 Jun 2026 12:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329442.1593570; Fri, 05 Jun 2026 12:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVTks-0002nB-3Y; Fri, 05 Jun 2026 12:34:30 +0000
Received: by outflank-mailman (input) for mailman id 1329442;
 Fri, 05 Jun 2026 12:33:40 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <tglx@kernel.org>) id 1wVTk4-0002k3-Fr
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 12:33:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVTk3-00DBbS-Lo
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 14:33:39 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <tglx@kernel.org>)
 id 6a22c1fc-5cb7-0a2a0a5109dd-0a2a4507af4a-48
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 14:33:39 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <tglx@kernel.org>)
 id 6a22c221-229c-0a2a45070019-aceafc1fd0cc-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 14:33:39 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 380E6435B4;
 Fri,  5 Jun 2026 12:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3511F00898;
 Fri,  5 Jun 2026 12:33:36 +0000 (UTC)
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
	s=k20260515; t=1780662817;
	bh=Bt6OT0/VKhphh3HzvyFQdhPrJoF2vdMvqgs31u2+MPI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=biVHvO6L31ky0DbhkuxtmImICmlXKP2o3OOF5xVHa1tc098wBX1/8D0U6NRSAf9rU
	 UlsP63nvrDyBlVYwUJcuAnujyoNQ95whuvY+bxaawMtNzpCnwEgWQG9+8u42DTkSSe
	 9hyPT7fEUrW04s8KALcwsFNNMbFDLxDgZq1Nb08Kj94hN23fq7QZ7Y7h9I6l9dbKdO
	 8bFYyDz3BH1KgWZzgZlBp9yzM5NPcwaf0meH8bgEH3e2pkctUJ/aFFBRVz2loNKWNl
	 BrCqWfY0ReG2TSOUagWxFiBQP66Fg2udQzTY+TxTNPa5tbV+j0qLaLI1k8ShJ/LI0K
	 XOACtKWJ8Suxw==
From: Thomas Gleixner <tglx@kernel.org>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Kiryl Shutsemau <kas@kernel.org>, Sean Christopherson <seanjc@google.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang
 <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui
 <decui@microsoft.com>, Long Li <longli@microsoft.com>, Ajay Kaher
 <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz
 <jstultz@google.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Rick Edgecombe
 <rick.p.edgecombe@intel.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org, David
 Woodhouse <dwmw@amazon.co.uk>, Tom Lendacky <thomas.lendacky@amd.com>,
 Nikunj A Dadhania <nikunj@amd.com>, David Woodhouse <dwmw2@infradead.org>,
 Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v4 01/47] x86/tsc: Never re-calibrate TSC frequency if
 its exact timing is known
In-Reply-To: <20260529144435.704127-2-seanjc@google.com>
References: <20260529144435.704127-1-seanjc@google.com>
 <20260529144435.704127-2-seanjc@google.com>
Date: Fri, 05 Jun 2026 14:33:34 +0200
Message-ID: <87fr315fq9.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
X-purgate-ID: tlsNG-ef75cf/1780662819-0A573C48-91A172F9/0/0
X-purgate-type: clean
X-purgate-size: 883

On Fri, May 29 2026 at 07:43, Sean Christopherson wrote:
> Don't re-calibrate the TSC frequency if the TSC is known to run at a fixed
> frequency.

That's misleading because fixed frequency means that the frequency does
not change, i.e. X86_FEATURE_CONSTANT_TSC is set. But
X86_FEATURE_CONSTANT_TSC does not imply that the frequency can be read
from CPUID/MSRs.

> In practice, this is likely one big nop, as re-calibration is
> used only for SMP=n kernels, and only for hardware that is 20+ years old,
> i.e. is extremely unlikely to collide with TSC_KNOWN_FREQ.

recalibrate_cpu_khz() is only invoked from Intel P4 and AMD K7 CPU
frequency drivers, which means that's absolutely not interesting and
neither X86_FEATURE_CONSTANT_TSC nor X86_FEATURE_TSC_KNOWN_FREQ can be
set on those systems.

IOW, this patch is pointless voodoo ware.

Thanks,

        tglx

