Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8DCC54EFC
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 08:17:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372231.1619613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wod0S-0006tc-48; Tue, 28 Jul 2026 08:17:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372231.1619613; Tue, 28 Jul 2026 08:17:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wod0S-0006tV-0V; Tue, 28 Jul 2026 08:17:44 +0000
Received: by outflank-mailman (input) for mailman id 1372231;
 Tue, 28 Jul 2026 08:17:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1wod0Q-0006tL-Q4
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 08:17:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wod0P-00DJt1-38;
 Tue, 28 Jul 2026 08:17:41 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wod0O-002cFs-1j;
 Tue, 28 Jul 2026 08:17:41 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=/cpPESGMrq1pMBtG/Prd4+n4WCvgO59CbBPcrJSQi0M=; b=Qe8fTj44MFXBQsXbU8rUgWQEJ2
	i3SQ5lIYRMCqjgITdsLqF6hlUwkqU+oloZ9TkGGOgRp78iNYTdiV33qRD/YVJJJvyFO8p4fVOuq6T
	NQApb3YCRNDxRdTo2yFisK8uTTKoZOnCRz1fRtmFUFgKi87h6gcgUWBcudwFfxGuETNk=;
Date: Tue, 28 Jul 2026 10:17:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v4 1/3] time: add "NOW() good" indicator
Message-ID: <amhlnWAwF-AS_sH7@macbook.local>
References: <f5040939-b166-4050-9a27-117b772547d4@suse.com>
 <b7513795-9e4b-4358-9d46-6c7036d64b81@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b7513795-9e4b-4358-9d46-6c7036d64b81@suse.com>

On Tue, Jun 30, 2026 at 04:06:00PM +0200, Jan Beulich wrote:
> printk_start_of_line() checks for a value of 0 right now. In order to be
> able to have NOW() return at least monotonically increasing values, that
> needs replacing by an explicit indicator.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Arm and RISC-V may want to consider whether their initial get_cycles()
> can't be moved yet earlier, such that the indicator also can be set
> yet earlier.
> ---
> v4: Add barriers.
> v3: New.
> 
> --- a/xen/arch/arm/time.c
> +++ b/xen/arch/arm/time.c
> @@ -145,6 +145,8 @@ void __init preinit_xen_time(void)
>          panic("Timer: Cannot initialize platform timer\n");
>  
>      boot_count = get_cycles();
> +    smp_wmb();
> +    NOW_good = true;
>  }
>  
>  static void __init init_dt_xen_time(void)
> --- a/xen/arch/riscv/time.c
> +++ b/xen/arch/riscv/time.c
> @@ -87,6 +87,8 @@ void __init preinit_xen_time(void)
>          panic("%s: ACPI isn't supported\n", __func__);
>  
>      boot_clock_cycles = get_cycles();
> +    smp_wmb();
> +    NOW_good = true;
>  
>      /* set_xen_timer must have been set by sbi_init() already */
>      ASSERT(set_xen_timer);
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -2660,6 +2660,7 @@ void __init early_time_init(void)
>  
>      set_time_scale(&t->tsc_scale, tmp);
>      t->stamp.local_tsc = boot_tsc_stamp;
> +    NOW_good = true;

Would you need a barrier here to ensure compiler doesn't re-order the
writes?  Maybe using ACCESS_ONCE(), or a smp_wmb() like it's used in
other arches?

Thanks, Roger.

