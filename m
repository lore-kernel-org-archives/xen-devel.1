Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E96C61DD6
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 07:55:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405243.1638776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1foJ-0001em-SB; Wed, 02 Sep 2026 07:55:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405243.1638776; Wed, 02 Sep 2026 07:55:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1foJ-0001ee-Nk; Wed, 02 Sep 2026 07:55:07 +0000
Received: by outflank-mailman (input) for mailman id 1405243;
 Wed, 02 Sep 2026 07:55:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x1foI-0001eX-5b
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 07:55:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x1foH-001nUu-2h;
 Wed, 02 Sep 2026 07:55:05 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x1foH-000Bhn-0o;
 Wed, 02 Sep 2026 07:55:05 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=33bY+Pa+vCB3mUBZSbOk3D2VYDai91OBIYy5CuGPQ4I=; b=CtO4Qo0qqdndZOEmSxXz5JJJ8O
	tJhUG7K6RfXMq4y4WIpj979q/Xe0er05pPgFQlbF/rfdFBQxHtDV0C5y52pmAB/Np5gRTbv56Ovev
	Ia6EEo6SEc8N2scmjWhGWIXMkj9DkFj63UtC7bNLIzbAu2+JwTgy9MLFaSJNl9k56Mts=;
Date: Wed, 2 Sep 2026 09:54:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v5 2/2] x86/time: avoid early uses of NOW() to return zero
Message-ID: <apfWTzVihQi5LX9x@macbook.local>
References: <ec25e838-6bf6-496c-abbe-0fd71e2fb0d9@suse.com>
 <cb8d9a90-64ce-4e86-a188-36a32fe02970@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb8d9a90-64ce-4e86-a188-36a32fe02970@suse.com>

On Wed, Aug 19, 2026 at 01:45:56PM +0200, Jan Beulich wrote:
> Waiting loops like the one in flush_command_buffer() will degenerate to
> infinite ones when used early enough for NOW() to still return constant
> zero. Make sure the returned value at least monotonically increases. When
> available, use nominal frequency values as initial approximation.
> 
> Do this only in get_s_time(), as producing a sane value in
> get_s_time_fixed() for non-zero inputs won't be reasonably possible.
> Put an assertion there.
> 
> Reported-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger@xenporject.org>

One minor comment below.

> ---
> RFC: While generally the mentioned waiting loops will take longer to time
>      out, on a very fast CPU tight loops may time out too early.
> 
> With "x86/time: set AP's TSC scale estimate earlier" the counter update
> may not need to be atomic anymore, as then only the BSP can reasonably hit
> that path.
> 
> I don't think Fixes: tags should be put here. If we did, we'd have to
> enumerate all introductions of early uses of NOW() (or get_s_time()), with
> the exception of those dealing with getting back 0 (which I expect is only
> printk_start_of_line()). Will want backporting nevertheless (unless deemed
> too risky).

I agree with backporting, current behavior of getting stuck in an
infinite loop is worse than timing out earlier than expected (which is
the worse outcome of this patch).

> ---
> v5: Move addition to early_cpu_init() down. Adjust commentary there.
> v3: Use "high" / "max" freq if "nominal" isn't available. Set NOW_good.
> v2: Add assertion to get_s_time_fixed(). Use nominal frequencies for very
>     early setting, if available.
> 
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -19,6 +19,7 @@
>  #include <asm/random.h>
>  #include <asm/setup.h>
>  #include <asm/shstk.h>
> +#include <asm/time.h>
>  #include <asm/xstate.h>
>  
>  #include <public/sysctl.h>
> @@ -444,6 +445,39 @@ void __init early_cpu_init(bool verbose)
>  
>  	if (!(c->vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
>  		park_offline_cpus = opt_mce;
> +
> +	/*
> +	 * If nominal freq isn't available, use highest, thus causing NOW()
> +	 * output to move more slowly.  See preset_tsc_scale().
> +	 */
> +	if (c->cpuid_level >= 0x15) {
> +		cpuid(0x15, &eax, &ebx, &ecx, &edx);
> +
> +		if (ecx && ebx && eax)
> +			preset_tsc_scale(DIV_ROUND_UP(ecx * 1UL * ebx, eax));
> +		else if (c->cpuid_level >= 0x16) {
> +			/* Assume CPU base freq ≈ TSC freq. */
> +			cpuid(0x16, &eax, &ebx, &ecx, &edx);
> +			if (eax)
> +				preset_tsc_scale(eax * 1000000UL);
> +			else if (ebx)
> +				preset_tsc_scale(ebx * 1000000UL);
> +		}
> +	} else if (c->vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) {
> +		unsigned int nom_mhz = 0, hi_mhz = 0;
> +
> +		amd_process_freq(c, NULL, &nom_mhz, &hi_mhz);
> +		if (nom_mhz)
> +			preset_tsc_scale(nom_mhz * 1000000UL);
> +		else if (hi_mhz)
> +			preset_tsc_scale(hi_mhz * 1000000UL);
> +	} else if (c->vendor & X86_VENDOR_INTEL) {
> +		unsigned int hi_mhz = 0;
> +
> +		intel_process_freq(c, NULL, &hi_mhz);
> +		if (hi_mhz)
> +			preset_tsc_scale(hi_mhz * 1000000UL);
> +	}
>  }
>  
>  void reset_cpuinfo(struct cpuinfo_x86 *c, bool keep_basic)
> --- a/xen/arch/x86/include/asm/time.h
> +++ b/xen/arch/x86/include/asm/time.h
> @@ -23,6 +23,7 @@ mktime (unsigned int year, unsigned int
>  int time_suspend(void);
>  int time_resume(void);
>  
> +void preset_tsc_scale(unsigned long freq);
>  void init_percpu_time(void);
>  void time_latch_stamps(void);
>  
> --- a/xen/arch/x86/cpu/intel.c
> +++ b/xen/arch/x86/cpu/intel.c
> @@ -476,8 +476,8 @@ static int num_cpu_cores(struct cpuinfo_
>  		return 1;
>  }
>  
> -static void intel_process_freq(const struct cpuinfo_x86 *c,
> -                               unsigned int *min_mhz, unsigned int *max_mhz)
> +void intel_process_freq(const struct cpuinfo_x86 *c,
> +                        unsigned int *min_mhz, unsigned int *max_mhz)
>  {
>      uint64_t msrval;
>      uint8_t max_ratio, min_ratio;
> --- a/xen/arch/x86/include/asm/processor.h
> +++ b/xen/arch/x86/include/asm/processor.h
> @@ -417,6 +417,9 @@ static inline uint8_t get_cpu_family(uin
>      return fam;
>  }
>  
> +void intel_process_freq(const struct cpuinfo_x86 *c,
> +                        unsigned int *min_mhz, unsigned int *max_mhz);
> +
>  #ifdef CONFIG_INTEL
>  extern int8_t opt_tsx;
>  extern bool rtm_disabled;
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -1664,6 +1664,9 @@ s_time_t get_s_time_fixed(uint64_t at_ts
>      const struct cpu_time *t = &this_cpu(cpu_time);
>      uint64_t tsc, delta;
>  
> +    /* scale_delta() degenerates when the scale wasn't set yet. */
> +    ASSERT(t->tsc_scale.mul_frac);
> +
>      if ( at_tsc )
>          tsc = at_tsc;
>      else
> @@ -1679,6 +1682,20 @@ s_time_t get_s_time_fixed(uint64_t at_ts
>  
>  s_time_t get_s_time(void)
>  {
> +    /*
> +     * Before the TSC scale is set, avoid returning constant 0 (or whatever
> +     * this_cpu(cpu_time).stamp.local_stime is set to).  While the returned
> +     * value is in no way representing time, it at least increases
> +     * monotonically, thus avoiding e.g. waiting loops to degenerate to
> +     * entirely infinite ones.
> +     */
> +    if ( unlikely(!this_cpu(cpu_time).tsc_scale.mul_frac) )
> +    {
> +        static s_time_t counter;

Not that it matters much, but counter can probably be __initdata?

Thanks, Roger.

