Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E69CD6E52
	for <xen-devel@archiver.kernel.org>; Sat, 30 May 2026 03:09:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1322839.1589027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTA3u-0004xi-LO; Sat, 30 May 2026 03:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322839.1589027; Sat, 30 May 2026 03:08:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTA3u-0004xa-Gd; Sat, 30 May 2026 03:08:34 +0000
Received: by outflank-mailman (input) for mailman id 1322839;
 Sat, 30 May 2026 03:08:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bp@alien8.de>) id 1wTA3t-0004xB-22
 for xen-devel@lists.xenproject.org; Sat, 30 May 2026 03:08:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wTA3s-002GII-Cu
 for xen-devel@lists.xenproject.org; Sat, 30 May 2026 05:08:32 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bp@alien8.de>)
 id 6a1a5408-2eae-0a2a0a5409dd-0a2a4509ab9e-32
 for <xen-devel@lists.xenproject.org>; Sat, 30 May 2026 05:08:32 +0200
Received: from [65.109.113.108] (helo=mail.alien8.de)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bp@alien8.de>)
 id 6a1a54af-2497-0a2a45090019-416d716cb6a6-3
 for <xen-devel@lists.xenproject.org>; Sat, 30 May 2026 05:08:32 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A8F6540E015B; 
 Sat, 30 May 2026 03:08:30 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id PuzC0Ft-HHGf; Sat, 30 May 2026 03:08:20 +0000 (UTC)
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00:b8a3:f58e:8829:9ca6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8255040E015A;
 Sat, 30 May 2026 03:07:41 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=alien8 header.d=alien8.de header.i="@alien8.de" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1780110500; bh=xvvniitijThI5M/vzeUngJ2o5o2bAFGL6v1h1J/weaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RlZugvf28JewjKobWij+z7qIEzuJleC7UW1AkwP8rIPfgHvDVyKCrVyw/Qymrp83Z
	 oMbgDR2FbH11di++QnPPImwLEX2QWfLIIXSP1ypHOZXuL8uzhRYviGTB6dzv+qnCeb
	 Gpjy/sGySdR+2Du+p++dlzJkZH9f7yDl1Iu2Fre6FT/CcfHszYCqFtrvvnC9mv0qHc
	 VeeoN4BaHXjs2/UWNE6zir9SYUOs75Xg4Of1T4uw5yhGpFM4a3E1cmNVNmJaKIUq6R
	 yPy/Ir3fplxnFBnCyQR1Mih6ew0Q+bN5yquZw+MmRi4V8Lj+CiVHxa20Vu+5eKSmYk
	 giEEXZB1RSLVAV6SsDTp793DrNhxj4wm0EvU2xn+GoJTqXtQ7jCQ/UV7q72yZwrhw6
	 Hr/fzxFzU2n0bEEtOtOgL6M+OPmeiiF9CNlohP/WUUTGr0G7qVWyY3IBL6L60qHrmi
	 G28aB2e/4cv56a+4WyUu0hncXyyo8wJb54Pd1OOsv3eUOm/6ojaoKm4aTJ7E2o38BY
	 +wUXFuMdzDYShBipYVX8+o8FNNEGBfWyPWxpIXqjj6tOadHwHan4leJuqlNl1iFQ/z
	 P8Ic44MZ/AWAUKuhucIKSKuYuKaxZPvVv03zf0laMmYz+Zwgn1PGjB2t4S2+q2afEM
	 hP4TtO4p/8Y97d14SV7L5qrs=
Date: Fri, 29 May 2026 20:07:31 -0700
From: Borislav Petkov <bp@alien8.de>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Kiryl Shutsemau <kas@kernel.org>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Juergen Gross <jgross@suse.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	John Stultz <jstultz@google.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stephen Boyd <sboyd@kernel.org>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Nikunj A Dadhania <nikunj@amd.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Michael Kelley <mhklinux@outlook.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v4 01/47] x86/tsc: Never re-calibrate TSC frequency if
 its exact timing is known
Message-ID: <20260530030731.GBahpUcwWXdKCf1lJO@fat_crate.local>
References: <20260529144435.704127-1-seanjc@google.com>
 <20260529144435.704127-2-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260529144435.704127-2-seanjc@google.com>
X-purgate-ID: tlsNG-bad1c0/1780110512-89377A53-8E890EDD/0/0
X-purgate-type: clean
X-purgate-size: 1168

On Fri, May 29, 2026 at 07:43:48AM -0700, Sean Christopherson wrote:
> Don't re-calibrate the TSC frequency if the TSC is known to run at a fixed
> frequency.  In practice, this is likely one big nop, as re-calibration is
> used only for SMP=n kernels, and only for hardware that is 20+ years old,
> i.e. is extremely unlikely to collide with TSC_KNOWN_FREQ.

Why do we care?

So what if it recalibrates once on UP?

Look where it is called - all old rust which no one uses anymore.

> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kernel/tsc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
> index c5110eb554bc..08cf6625d484 100644
> --- a/arch/x86/kernel/tsc.c
> +++ b/arch/x86/kernel/tsc.c
> @@ -946,7 +946,8 @@ void recalibrate_cpu_khz(void)
>  		return;
>  
>  	cpu_khz = x86_platform.calibrate_cpu();
> -	tsc_khz = x86_platform.calibrate_tsc();
> +	if (!boot_cpu_has(X86_FEATURE_TSC_KNOWN_FREQ))

cpu_feature_enabled() everywhere please.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

