Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741A8CCF2D6
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 09:34:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1454044.1667525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIjl6-00023I-AC; Mon, 19 Oct 2026 09:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454044.1667525; Mon, 19 Oct 2026 09:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIjl6-00023B-7a; Mon, 19 Oct 2026 09:34:20 +0000
Received: by outflank-mailman (input) for mailman id 1454044;
 Mon, 19 Oct 2026 09:34:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xIjl5-000233-Ju
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 09:34:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xIjl5-00000001qk0-1n0l;
 Mon, 19 Oct 2026 09:34:19 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xIjl5-0000000BJAc-0BzJ;
 Mon, 19 Oct 2026 09:34:19 +0000
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
	bh=7tolprFTLBdJHIEY5/o5KnfiBKSnnxCUD1lV+vnqJ5E=; b=yX5HCYx6v0x5F/Rl/1+llcS5h+
	CzjP0HHc/bVwc9ndYvSPIe9YmufoGFrAIKYn+g3htejQp8XplZMNpjA3r0p0EsxgDeLkz5/6izT70
	fEZE9Yc7vJ4Jxgm4Uhehkbr/euz3G9QYVLUoOtf2aYA7eNXaarsCL82F4G5CY4iwe+aE=;
Date: Mon, 19 Oct 2026 11:34:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>,
	alejandro.garciavallejo@amd.com
Subject: Re: [PATCH v4 3/3] x86: short-circuit certain cpu_has_* when
 x86-64-v{2,3} are in effect
Message-ID: <atXkGLicylXMQ8_H@Mac.lan>
References: <b6ae837e-293a-4c06-aefa-02a5b9cd2c3f@suse.com>
 <18b38bd8-bc6b-4925-8880-234c7d2b9497@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <18b38bd8-bc6b-4925-8880-234c7d2b9497@suse.com>

On Thu, Oct 15, 2026 at 11:11:39AM +0200, Jan Beulich wrote:
> Certain fallback code can be made subject to DCE this way. Note that
> CX16 has no compiler provided manifest constant, so CONFIG_* are used
> there instead. Note also that we don't have cpu_has_movbe nor
> cpu_has_lzcnt (aka cpu_has_abm), and we no longer have
> cpu_has_{popcnt,bmi1,bmi2}.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> ---
> Of course we could use IS_ENABLED(CONFIG_X86_64_V<n>) everywhere, but as
> CX16 shows this isn't necessarily better than the #if/#else approach
> based on compiler-provided manifest symbols. While not really intended
> to be used that way, it looks as if we could also use
> IS_ENABLED(__POPCNT__) and alike if we thought this would end up neater
> (because of avoiding the #ifdef).
> 
> We could go further and also short-circuit SSE*, AVX and alike, which we
> don't use outside of the emulator. This then would of course call for
> also having a way to select x86-64-v4.
> ---
> v4: Re-base (over dropped cpu_has_{popcnt,bmi1,bmi2}).
> v2: Also cover XSAVE.
> 
> --- a/xen/arch/x86/include/asm/cpufeature.h
> +++ b/xen/arch/x86/include/asm/cpufeature.h
> @@ -132,11 +132,17 @@ static inline bool boot_cpu_has(unsigned
>  #define cpu_has_monitor         boot_cpu_has(X86_FEATURE_MONITOR)
>  #define cpu_has_vmx             boot_cpu_has(X86_FEATURE_VMX)
>  #define cpu_has_eist            boot_cpu_has(X86_FEATURE_EIST)
> -#define cpu_has_cx16            boot_cpu_has(X86_FEATURE_CX16)
> +#define cpu_has_cx16            (IS_ENABLED(CONFIG_X86_64_V2) || \
> +                                 IS_ENABLED(CONFIG_X86_64_V3) || \
> +                                 boot_cpu_has(X86_FEATURE_CX16))
>  #define cpu_has_pdcm            boot_cpu_has(X86_FEATURE_PDCM)
>  #define cpu_has_pcid            boot_cpu_has(X86_FEATURE_PCID)
>  #define cpu_has_x2apic          boot_cpu_has(X86_FEATURE_X2APIC)
> +#ifdef __XSAVE__
> +#define cpu_has_xsave           true
> +#else
>  #define cpu_has_xsave           boot_cpu_has(X86_FEATURE_XSAVE)
> +#endif
>  #define cpu_has_avx             boot_cpu_has(X86_FEATURE_AVX)
>  #define cpu_has_rdrand          boot_cpu_has(X86_FEATURE_RDRAND)
>  #define cpu_has_hypervisor      boot_cpu_has(X86_FEATURE_HYPERVISOR)

Alejandro (now added on Cc) is working on something that achieves the
same end, but it's more transparent and doesn't require modifying
individual cpu_has_ macros every time we want to short-circuit one of
those.  I think it would be helpful here also.

Regards, Roger.

