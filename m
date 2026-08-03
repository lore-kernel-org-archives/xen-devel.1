Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2411C55175
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 07:05:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381204.1624763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqmjP-00052l-MY; Mon, 03 Aug 2026 07:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381204.1624763; Mon, 03 Aug 2026 07:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqmjP-00052d-JE; Mon, 03 Aug 2026 07:05:03 +0000
Received: by outflank-mailman (input) for mailman id 1381204;
 Mon, 03 Aug 2026 07:05:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wqmjO-00052T-Is
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 07:05:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wqmjO-0035os-0W;
 Mon, 03 Aug 2026 07:05:01 +0000
Received: from [2a02:8012:3a1:0:1c3d:3a3f:6f77:bb54]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wqmjN-00Gr4G-21;
 Mon, 03 Aug 2026 07:05:01 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=GRSGqypqbk2k3z4aWHq7GUzYwzK35klZeVSvhyZvPNc=; b=Ty9zn0siBEbLWY4HQB7ljilVUl
	zaTS8dQlcQcmNOVcT03q9Zo+W48o68nZdie7p112YRjVx8/sKwa4iuxtvG924gZSDD6MwyQfHmurv
	rmKNrgJKxb8oWIYflUGpsAj/n/3eGYWzbDNvjMtXEZI0xuQ7wJf3efNjahI6vN3H9vWY=;
Message-ID: <dbb32862-b3d2-4fb5-b4ef-49675fa243b2@xen.org>
Date: Mon, 3 Aug 2026 08:04:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Hide PMU feature
To: Hirokazu Takahashi <taka@valinux.co.jp>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260803004245.693844-1-taka@valinux.co.jp>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <20260803004245.693844-1-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 03/08/2026 01:42, Hirokazu Takahashi wrote:
> On ARMv8.4-A and newer platforms, booting Dom0 Linux with ACPI enabled
> causes the domain to probe advanced PMU feature based on system ID
> register ID_AA64DFR0_EL1.
> 
> During this probe, Linux accesses PMMIR_EL1, which causes unhandled
> register traps and crashes the domain. Merely adding emulation code
> for PMMIR_EL1 in Xen is insufficient to fix the issue, as the guest
> PMU driver subsequently stalls during its initialization sequence.
> 
> Fix this by explicitly masking PMU capability fields in
> create_domain_cpuinfo(). Additionally, preemptively mask other
> capability fields to prevent similar potential issues.

While I agree Xen doesn't support PMU capability for every guest, I 
believe we are still allowing to expose the PMU in some cases (see 
commit dbb948110a "xen: Expose the PMU to the guests"). So we can't 
simply mask the features. So I think ...

> 
> Fixes: 3669a1cb9598 "xen/arm: create a cpuinfo structure for guest"
> Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
> ---
>   xen/arch/arm/cpufeature.c             | 16 ++++++++++++++++
>   xen/arch/arm/include/asm/cpufeature.h | 10 ++++++----
>   2 files changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> index 94d14fb6a9..71d745d3cb 100644
> --- a/xen/arch/arm/cpufeature.c
> +++ b/xen/arch/arm/cpufeature.c
> @@ -219,8 +219,24 @@ static int __init create_domain_cpuinfo(void)
>       domain_cpuinfo.isa64.api = 0;
>       domain_cpuinfo.isa64.gpa = 0;
>       domain_cpuinfo.isa64.gpi = 0;
> +
> +    /* Hide PMUv3 support as Xen does not support it */
> +    domain_cpuinfo.dbg64.pmu_ver = 0;
> +    domain_cpuinfo.dbg64.mtpmu = 0;
> +    domain_cpuinfo.dbg64.pmss = 0;

... this section needs to be conditional.

> +
> +    /* Hide SPE, TRBE, BRBE, and Trace Extensions */
> +    domain_cpuinfo.dbg64.pms_ver = 0;
> +    domain_cpuinfo.dbg64.trace_ver = 0;
> +    domain_cpuinfo.dbg64.trace_filt = 0;
> +    domain_cpuinfo.dbg64.trace_buffer = 0;
> +    domain_cpuinfo.dbg64.ext_trc_buff = 0;
> +    domain_cpuinfo.dbg64.brbe = 0;

This section should be fine to unconditionally mask.

>   #endif
>   
> +    /* Hide PMUv1,v2 support as Xen does not support it */
> +    domain_cpuinfo.dbg32.perfmon = 0;
> +
>       /* Hide AMU support */
>   #ifdef CONFIG_ARM_64
>       domain_cpuinfo.pfr64.amu = 0;
> diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
> index bf902a3970..c92b2651c7 100644
> --- a/xen/arch/arm/include/asm/cpufeature.h
> +++ b/xen/arch/arm/include/asm/cpufeature.h
> @@ -216,16 +216,18 @@ struct cpuinfo_arm {
>               unsigned long trace_ver:4;
>               unsigned long pmu_ver:4;
>               unsigned long brps:4;
> -            unsigned long __res0:4;
> +            unsigned long pmss:4;
>               unsigned long wrps:4;
> -            unsigned long __res1:4;
> +            unsigned long sebep:4;
>               unsigned long ctx_cmps:4;
>               unsigned long pms_ver:4;
>               unsigned long double_lock:4;
>               unsigned long trace_filt:4;
> -            unsigned long __res2:4;
> +            unsigned long trace_buffer:4;
>               unsigned long mtpmu:4;
> -            unsigned long __res3:12;
> +            unsigned long brbe:4;
> +            unsigned long ext_trc_buff:4;
> +            unsigned long hpmn0:4;
>   
>               /* DFR1 */
>               unsigned long __res4:64;

Cheers,

-- 
Julien Grall


