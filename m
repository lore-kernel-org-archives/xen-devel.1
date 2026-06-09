Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00866CD8CB9
	for <xen-devel@archiver.kernel.org>; Tue,  9 Jun 2026 17:17:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1333707.1596875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wX04a-0007wk-TX; Tue, 09 Jun 2026 17:17:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333707.1596875; Tue, 09 Jun 2026 17:17:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wX04a-0007wd-QX; Tue, 09 Jun 2026 17:17:08 +0000
Received: by outflank-mailman (input) for mailman id 1333707;
 Tue, 09 Jun 2026 17:17:07 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3j0ooagYKCR4M84HD6AIIAF8.6IGR8H-78P8FFCMNM.R8HJLID86N.ILA@flex--seanjc.bounces.google.com>)
 id 1wX04Z-0007vR-GR
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 17:17:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wX04Y-00DlQQ-I1
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 19:17:06 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3j0ooagYKCR4M84HD6AIIAF8.6IGR8H-78P8FFCMNM.R8HJLID86N.ILA@flex--seanjc.bounces.google.com>)
 id 6a284a71-2eae-0a2a0a5409dd-0a2a45078af4-30
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 19:17:06 +0200
Received: from [209.85.214.202] (helo=mail-pl1-f202.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3j0ooagYKCR4M84HD6AIIAF8.6IGR8H-78P8FFCMNM.R8HJLID86N.ILA@flex--seanjc.bounces.google.com>)
 id 6a284a90-229c-0a2a45070019-d155d6cab0a7-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 19:17:06 +0200
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-2bf08c2a24bso55542365ad.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 10:17:05 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781025424; x=1781630224; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=llq4Kn5i8ui4r4izxxTvg7cm7qJE2krNstJXZkbKQn4=;
        b=Wx9LfUlpXN4erXAxnKrm7q8Wp5xGYI9Fq2BLmo/pSj8yuJmTR+3CVRH6nlkU5QXM/g
         57yCeAI16YqMG/WKZlqW9iVID5OetMmhXJT1G3zT9N7HlrqVr6snXlu2gNng0rUtZVP4
         8nUUVbYtL6cbO9+ojR7porg99Ak+MkieTv1sRhvgDthEzkzrJMPg7b0zBYY1Sv3QKOAw
         A8SYuqldIqw2N03tN8mfAlnE7S3f3akOlsLoBJWAnBDZW5aDBQnIVAvb3zk4haO3YPNh
         v8qFRfrfJ+mc6YAa6vV594uG9XMKSjtpzk5X3TS0Ho7pW0nMn/Ewm2apbXC7evqsgXKI
         we8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781025424; x=1781630224;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=llq4Kn5i8ui4r4izxxTvg7cm7qJE2krNstJXZkbKQn4=;
        b=mKRtlQ80UDrOhIEtXSLW8dq6eFbDqoc/w9JlG3Qf8C8UeJ44esdmi7Ei2UAllWr5cP
         Pd53jKHMi3V7upS+AS/YFUoQkA4i3JDkw8TvsTBibzmKoZleRNVgfV12abTo3jj7vuHC
         VzdoL/BYupzre/GNoUYMFdPD07zWMuCSKzFnV4HSGVnUKvZwlco9pD9hntzoSBAU15Ff
         fjSHfz7ZDo74gCbyzARBqB8GIhRyuMpUVaOwZCUlVFwT6hovGOvmxrIkoUXaT5GHIzb9
         vz+fDpsgtD6b+SKOGdrUGCBEtYixjDbHi1SkAHHE04AVUZqD2om8w9iJQ/eCZMKcKdHJ
         RJrg==
X-Forwarded-Encrypted: i=1; AFNElJ+/wC5cQZU8Ht6ZD5JxiP2b4ehYAi9UFe6YhAcDTDqAQposNIviLCQIWiNkTkc5c39ARVL22TDIV1w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yza2pOB0Af/8aACEcC2NdCz2j3NKCx5QL29W3eiz/qjP9l3rZIj
	v5OGRyVG06qrG+caoQcapOR8TwNatE6qUdYf8bRntt+ziDAAYp5ewUNNsFOc2eaAMZZzbkFLimQ
	+EgNMag==
X-Received: from plpg1.prod.google.com ([2002:a17:902:9341:b0:2bd:1ca5:b928])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:196b:b0:2be:3434:4e28
 with SMTP id d9443c01a7336-2c2a1c66522mr44737215ad.19.1781025423861; Tue, 09
 Jun 2026 10:17:03 -0700 (PDT)
Date: Tue, 9 Jun 2026 10:17:03 -0700
In-Reply-To: <87a4t86a0l.ffs@fw13>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com> <20260529144435.704127-2-seanjc@google.com>
 <87fr315fq9.ffs@fw13> <aiMPxl5vkvJDldi9@google.com> <87a4t86a0l.ffs@fw13>
Message-ID: <aihKj-0nP7bUbNHH@google.com>
Subject: Re: [PATCH v4 01/47] x86/tsc: Never re-calibrate TSC frequency if its
 exact timing is known
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	David Woodhouse <dwmw2@infradead.org>, Michael Kelley <mhklinux@outlook.com>
Content-Type: text/plain; charset="us-ascii"
X-purgate-ID: tlsNG-ef75cf/1781025426-22D77C48-F8569687/0/0
X-purgate-type: clean
X-purgate-size: 954

On Fri, Jun 05, 2026, Thomas Gleixner wrote:
> On Fri, Jun 05 2026 at 11:04, Sean Christopherson wrote:
> But we also should have a check in the TSC init code somewhere which
> validates that X86_FEATURE_CONSTANT_TSC is set when
> X86_FEATURE_TSC_KNOWN_FREQ is set. X86_FEATURE_TSC_KNOWN_FREQ is useless
> w/o X86_FEATURE_CONSTANT_TSC.

Ugh, any objection to punting on this for now?  KVM and Xen guests will trigger
TSC_KNOWN_FREQ without CONSTANT_TSC, thanks to commits:

  e10f78050323 ("kvmclock: fix TSC calibration for nested guests")
  898ec52d2ba0 ("x86/xen/time: Set the X86_FEATURE_TSC_KNOWN_FREQ flag in xen_tsc_khz()")

Hyper-V guests might as well?  Hyper-V's handling of TSC is weird, even for a
hypervisor.

Even when the frequency is provided in CPUID by the hypervisor, QEMU at least
requires a fairly explicit opt-in to advertise CONSTANT_TSC, presumably to try
to prevent users from shooting themselves in the foot.

