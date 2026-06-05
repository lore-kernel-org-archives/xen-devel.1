Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BB5CD6E77
	for <xen-devel@archiver.kernel.org>; Fri,  5 Jun 2026 12:37:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1329452.1593579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVTna-0003Me-KI; Fri, 05 Jun 2026 12:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329452.1593579; Fri, 05 Jun 2026 12:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVTna-0003MW-H6; Fri, 05 Jun 2026 12:37:18 +0000
Received: by outflank-mailman (input) for mailman id 1329452;
 Fri, 05 Jun 2026 12:37:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <tglx@kernel.org>) id 1wVTnY-0003MG-Uc
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 12:37:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVTnW-009rQn-Ky
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 14:37:14 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <tglx@kernel.org>)
 id 6a22c2de-5cb7-0a2a0a5109dd-0a2a450b9c38-42
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 14:37:14 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <tglx@kernel.org>)
 id 6a22c2f9-212f-0a2a450b0019-ac6904fecc5e-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 14:37:14 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 529DF601F5;
 Fri,  5 Jun 2026 12:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17B0B1F00893;
 Fri,  5 Jun 2026 12:37:11 +0000 (UTC)
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
	s=k20260515; t=1780663032;
	bh=5W6FiCPw6sX6Mb9wMs7Y8uennTDZr6e1xX3L0BW5MJY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=YEmTZWq3dmUMH12jc/DFu/P4OzcULMgWKzk+y8GZ2rhlb8n7qhyCDBCHw3xHKlFm9
	 KVFiUJuI8WqYf4gVlg0KIfDVESYWvU9coOvSXxaaEpQGfqw86+RrMazwrYVG7phoWz
	 8ULdotuRnveudrTehApXe/p3rsX97IhOHfDklWPuNSP8QP7jgjeqf9ReklwS9qgISR
	 s6UYCikKByY1nzH3/pR4dS8lA5/wXlDQiziSmJdE2KUBdAvlGGUFeSOJ/pgA9SUGOA
	 QKppWOWpDZWGMhV4kceQk+T/u8V6Uy/xLJZAj2+XZUEShBrRSDpJ+Eq5uMTH3UgVmT
	 lWqJi0DUTsDgQ==
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
Subject: Re: [PATCH v4 02/47] x86/tsc: Add a standalone helpers for getting
 TSC info from CPUID.0x15
In-Reply-To: <20260529144435.704127-3-seanjc@google.com>
References: <20260529144435.704127-1-seanjc@google.com>
 <20260529144435.704127-3-seanjc@google.com>
Date: Fri, 05 Jun 2026 14:37:09 +0200
Message-ID: <87cxy55fka.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
X-purgate-ID: tlsNG-42698a/1780663034-22D77F3B-0CF458A2/0/0
X-purgate-type: clean
X-purgate-size: 362

On Fri, May 29 2026 at 07:43, Sean Christopherson wrote:
>  		cpuid(CPUID_LEAF_FREQ, &eax_base_mhz, &ebx, &ecx, &edx);
> -		crystal_khz = eax_base_mhz * 1000 *
> -			eax_denominator / ebx_numerator;
> +		info.crystal_khz = eax_base_mhz * 1000 *
> +			info.denominator / info.numerator;

Please get rid of this ugly line break. You have 100 characters.


