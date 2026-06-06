Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABEBCD8C85
	for <xen-devel@archiver.kernel.org>; Sat,  6 Jun 2026 10:35:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1330486.1593894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVoMk-000825-R7; Sat, 06 Jun 2026 10:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1330486.1593894; Sat, 06 Jun 2026 10:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVoMk-00081x-M8; Sat, 06 Jun 2026 10:34:58 +0000
Received: by outflank-mailman (input) for mailman id 1330486;
 Sat, 06 Jun 2026 10:34:56 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <tglx@kernel.org>) id 1wVoMi-00081r-Sd
 for xen-devel@lists.xenproject.org; Sat, 06 Jun 2026 10:34:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVoMi-000DMF-9U
 for xen-devel@lists.xenproject.org; Sat, 06 Jun 2026 12:34:56 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <tglx@kernel.org>)
 id 6a23f7a3-e002-0a2a0a5209dd-0a2a450cdaec-24
 for <xen-devel@lists.xenproject.org>; Sat, 06 Jun 2026 12:34:56 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <tglx@kernel.org>)
 id 6a23f7ce-62f1-0a2a450c0019-aceafc1fe712-3
 for <xen-devel@lists.xenproject.org>; Sat, 06 Jun 2026 12:34:55 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 7ED85443A0;
 Sat,  6 Jun 2026 10:34:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EDCD1F00898;
 Sat,  6 Jun 2026 10:34:52 +0000 (UTC)
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
	s=k20260515; t=1780742093;
	bh=NtWrycsv8R2U43lwkz14BzyHb4n6w50k0ikzyF9jV3E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=IXyU/D8264eSLC2QDbXcAcYtJaBaXZQFhc3eMNaexij+8rWkr00hLcCxbU8sE+dyX
	 mA+0vh4jhmQewxXtcNgNlHzXYQxy3xltXkTXAvckzwoIzIHRe33MgJj8Z/eoKIZg7/
	 OS3AcAdgYKZfgsMlvmrE9ixBzNG2b9ZZdmXOqeb5AoGkbbvWGXnmwwu7r9FDGH7MPJ
	 /ags4E/71IJXIaZDB2vgU6XhD0IfqTYGjQGdAaEMrOXXRxdiQY3pri70AgZucTGyCC
	 26QCAArNsLQlKTvztPntE64Lex8sfSLNWgTTXMw3c1CK7vs7qdGaoXt7ZZuAKprlo6
	 2CEQuUIqJnPEA==
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
Subject: Re: [PATCH v4 10/47] x86/tsc: Consolidate forcing of
 X86_FEATURE_TSC_KNOWN_FREQ for PV code
In-Reply-To: <20260529144435.704127-11-seanjc@google.com>
References: <20260529144435.704127-1-seanjc@google.com>
 <20260529144435.704127-11-seanjc@google.com>
Date: Sat, 06 Jun 2026 12:34:50 +0200
Message-ID: <877boc554l.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
X-purgate-ID: tlsNG-d25034/1780742096-DA975CF5-EFE19639/0/0
X-purgate-type: clean
X-purgate-size: 2956

On Fri, May 29 2026 at 07:43, Sean Christopherson wrote:

> Now that all paravirt code that explicitly specifies the TSC frequency
> also sets X86_FEATURE_TSC_KNOWN_FREQ, replace all of the one-off code
> and simply set X86_FEATURE_TSC_KNOWN_FREQ if the TSC frequency is known.
>
> Do NOT force set TSC_KNOWN_FREQ if the "known" TSC frequency was provided
> by the user.  Per commit bd35c77e32e4 ("x86/tsc: Add tsc_early_khz command
> line parameter"), one of the goals of the param is to allow the refined
> calibration work "to do meaningful error checking".
>
> Note, preferring the user-provided TSC frequency over the frequency from
> the hypervisor or trusted firmware, while simultaneously not treating the
> user-provided frequency as gospel, is obviously incongruous.  Sweep the
> problem under the rug for now to avoid opening a big can of worms that
> likely doesn't have a great answer.

There is a good answer I think.

early_tsc_khz exists to cater for the overclocking crowd. On their
modded systems the firmware supplied TSC frequency (CPUID/MSR) is not
matching reality anymore. So they work around that by supplying a close
enough tsc_early_khz and then they let the refined calibration work
figure it out.

Arguably that's only relevant for bare metal systems and what's worse is
that in virtual environments the refined calibration work can fail,
which renders the TSC unstable.

So I'd rather say we change this logic to:

   if (!hypervisor_is_type(X86_HYPER_NATIVE)) {
      tsc_khz = x86_init.....();
      force(X86_FEATURE_TSC_KNOWN_FREQ);
   } else if (tsc_khz_early) {
      ....
   } else {
      ...
   }

Along with:

   if (!hypervisor_is_type(X86_HYPER_NATIVE)) {
      if (tsc_khz_early)
         pr_warn("Ignoring non-sensical tsc_early_khz command line argument\n");

or something daft like that.

The kernel has for various reasons always tried to cater for the needs
of users who are plagued by bonkers firmware, but we have to stop to
prioritize or treating equal ancient and modded out of spec hardware.

TBH, I consider that whole KVM clock nonsense to fall into the modded
out of spec hardware realm. Do a reality check:

   How many production systems are out there still which run VMs on CPUs
   with a broken TSC and the lack of VM TSC scaling?

I'm not saying that we should not support the few remaining systems
anymore, but our tendency to pretend that we can keep all of this
nonsense working and at the same time making progress is just a fallacy.

I rather want to have a more fine grained differentiation and
prioritization of:

  1) The actual real world relevant use cases which run on contemporary
     hardware.

  2) Still relevant use cases on slightly older hardware with less
     capabilities

  3) Broken firmware

  4) Modded out of spec nonsense

  5) Support for ancient museums pieces

Thanks,

        tglx


