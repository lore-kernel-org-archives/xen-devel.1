Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F6AF01814
	for <xen-devel@archiver.kernel.org>; Fri,  6 Mar 2026 09:24:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1247485.1546079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyRPr-0008Ut-5a; Fri, 06 Mar 2026 09:24:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247485.1546079; Fri, 06 Mar 2026 09:24:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyRPr-0008Um-2a; Fri, 06 Mar 2026 09:24:15 +0000
Received: by outflank-mailman (input) for mailman id 1247485;
 Fri, 06 Mar 2026 09:24:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vyRPp-0008UN-PH
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 09:24:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vyRPp-008BQo-17;
 Fri, 06 Mar 2026 09:24:13 +0000
Received: from [2a02:8012:3a1:0:f0b8:207:419e:3d8a]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vyRPp-001fEE-0R;
 Fri, 06 Mar 2026 09:24:13 +0000
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
	bh=cdn80RzxzOqsgPuCqGcvDiArU6Lg0jBJMFIuE9EfUvg=; b=nrmELLSb1WF/XtIyDxwA41SMQy
	r2TNJ3JtBbj1Bd6QUTH9+hihAEsTEUEFp+Wx1y076g2ledpAV4s4Vyd+atBfCQImZSdzb48XGttvh
	Y/WAym3kcrgfYfVSIeP4zept/JpCHPkowdmSktbQGqS939LRuoatKRBe/g+RSHLhyXYw=;
Message-ID: <f1a5a509-bc6d-4616-872c-c5bb1ecf9da7@xen.org>
Date: Fri, 6 Mar 2026 09:24:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen: gic-v3: Introduce CONFIG_GICV3_NR_LRS
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260305194358.2564387-1-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20260305194358.2564387-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 05/03/2026 19:43, Ayan Kumar Halder wrote:
> Set GICV3_NR_LRS as per the number of list registers in the supported
> hardware. This ensures:
> 
> 1. In gicv3_save_lrs()/gicv3_restore_lrs(), use the number of list
> registers from GICV3_NR_LRS (if defined) instead of gicv3_info.nr_lrs.
> This ensures that if the hardware does not support more than 4 LRs
> (for example), the code accessing LR 4-15 is never reached. The
> compiler can eliminate the unsupported cases as the switch case uses a
> constant conditional.
> 
> 2. Similarly In gicv3_ich_read_lr()/gicv3_ich_write_lr() , we can
> justify that the unsupported LRs (4-15) will never be reached as Xen
> will panic if the runtime value (lr) exceeds GICV3_NR_LRS. Some
> compiler can eliminate the code accessing LR 4-15.
> In this situation, using panic() is better than accessing a list
> register which is not present in the hardware
> 
> 3. Whenever GICV3_NR_LRS is defined, the default condition and the
> related BUG() cannot be reached at all.

I am not sure how this is better. You will still crash Xen is 'lr' >= 
GICV3_NR_LRS. Can you provide some details?

 > > As part of functional safety effort, we are trying to enable system
> integrator to configure Xen for a specific platform with a predefind
> set of GICv3 list registers. So that we can minimize the chance of
> runtime issues and reduce the codesize that will execute.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>   xen/arch/arm/Kconfig  |  9 +++++++++
>   xen/arch/arm/gic-v3.c | 12 ++++++++++--
>   2 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 2f2b501fda..6540013f97 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -276,6 +276,15 @@ config PCI_PASSTHROUGH
>   
>   endmenu
>   
> +config GICV3_NR_LRS
> +	int "Number of GICv3 Link Registers supported" if EXPERT
> +	depends on GICV3
> +	range 0 16
> +	default 0
> +	help
> +	  Controls the number of Link registers to be accessed.
> +	  Keep it set to 0 to use a value obtained from a hardware register.
> +
>   menu "ARM errata workaround via the alternative framework"
>   	depends on HAS_ALTERNATIVE
>   
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index bc07f97c16..fb2985fd52 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -51,6 +51,8 @@ static DEFINE_PER_CPU(void __iomem*, rbase);
>   #define GICD                   (gicv3.map_dbase)
>   #define GICD_RDIST_BASE        (this_cpu(rbase))
>   #define GICD_RDIST_SGI_BASE    (GICD_RDIST_BASE + SZ_64K)
> +#define lrs                    (CONFIG_GICV3_NR_LRS ?: \
> +                                gicv3_info.nr_lrs)

We should avoid lowercase define, in particular with generic names like 
'lrs'. I think in this case, I would rather update gicv3_info.nr_lrs:

gicv3_info.nr_lrs = min(gv3_info.nr_lrs, CONFIG_GICV3_NR_LRS);

This would solve another problem where you don't sanity check that the 
system effectively support CONFIG_GICV3_NR_LRS.

> @@ -121,7 +123,7 @@ static inline void gicv3_save_lrs(struct vcpu *v)
>   static inline void gicv3_restore_lrs(const struct vcpu *v)
>   {
>       /* Fall through for all the cases */
> -    switch ( gicv3_info.nr_lrs )
> +    switch ( lrs )
>       {
>       case 16:
>           WRITE_SYSREG_LR(v->arch.gic.v3.lr[15], 15);
> @@ -178,6 +180,9 @@ static inline void gicv3_restore_lrs(const struct vcpu *v)
>   
>   static uint64_t gicv3_ich_read_lr(int lr)
>   {
> +    if ( lr >= lrs )
> +        panic("Unsupported number of LRs\n");

Do we really have to panic in production build? Wouldn't it be better to 
return '0' and maybe use ASSERT for a crash in debug build? Same below.

> +
>       switch ( lr )
>       {
>       case 0: return READ_SYSREG_LR(0);
> @@ -203,6 +208,9 @@ static uint64_t gicv3_ich_read_lr(int lr)
>   
>   static void gicv3_ich_write_lr(int lr, uint64_t val)
>   {
> +    if ( lr >= lrs )
> +        panic("Unsupported number of LRs\n");
> +
>       switch ( lr )
>       {
>       case 0:

Cheers,

-- 
Julien Grall


