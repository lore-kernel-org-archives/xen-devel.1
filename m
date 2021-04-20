Return-Path: <SRS0=xmOv=JR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C01D1C433ED
	for <xen-devel@archiver.kernel.org>; Tue, 20 Apr 2021 13:38:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55D8F61264
	for <xen-devel@archiver.kernel.org>; Tue, 20 Apr 2021 13:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55D8F61264
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.113690.216655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYqZo-0005c8-1Q; Tue, 20 Apr 2021 13:38:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113690.216655; Tue, 20 Apr 2021 13:38:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYqZn-0005c1-UZ; Tue, 20 Apr 2021 13:38:03 +0000
Received: by outflank-mailman (input) for mailman id 113690;
 Tue, 20 Apr 2021 13:38:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lYqZm-0005bw-A8
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 13:38:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lYqZl-0001nK-18; Tue, 20 Apr 2021 13:38:01 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lYqZk-00036D-N0; Tue, 20 Apr 2021 13:38:00 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=aDF2ZM7ZhQmHgmMCzkRssTmsv1yK+Pq+O91N7Z6Wek8=; b=6Pps4ucd11Y38g9ZrtXznEHGLI
	yuMZqIZ7FTOFisdCEIYMr6u6XeYwPpldY0Y4n+uQveBlISAzxwo2GxbF/OSiHwR/2fhaLfiRgWWT4
	IRcuaKG65YKYrDqEewvwpniS8RxEU7HVUDgiz7V5z5vkNIAjAVIgiI9YYPviM3nEZnFQ=;
Subject: Re: [PATCH 5/9] arm/mm: Get rid of READ/WRITE_SYSREG32
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20210420070853.8918-1-michal.orzel@arm.com>
 <20210420070853.8918-6-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <32bfa7d7-33cb-0deb-32bb-fa7d2052e0d9@xen.org>
Date: Tue, 20 Apr 2021 14:37:58 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210420070853.8918-6-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Michal,

On 20/04/2021 08:08, Michal Orzel wrote:
> AArch64 system registers are 64bit whereas AArch32 ones
> are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
> we should get rid of helpers READ/WRITE_SYSREG32
> in favour of using READ/WRITE_SYSREG.
> We should also use register_t type when reading sysregs
> which can correspond to uint64_t or uint32_t.
> Even though many AArch64 sysregs have upper 32bit reserved
> it does not mean that they can't be widen in the future.
> 
> Modify SCTLR_EL2 accesses to use READ/WRITE_SYSREG.

SCTLR_EL2 already has bits defined in the range [32:63]. So this change 
is going to have a side effect as AFAICT head.S will not touch those 
bits. So they are now going to be preserved.

The Arm Arm defines them as unknown if implemented. Therefore shouldn't 
we zero them somewhere else?

In any case, I think the commit message ought to contain an analysis for 
system registers that happened to have bits defined in the range [32:63].

> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> ---
>   xen/arch/arm/mm.c    | 2 +-
>   xen/arch/arm/traps.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 59f8a3f15f..0e07335291 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -613,7 +613,7 @@ void __init remove_early_mappings(void)
>    */
>   static void xen_pt_enforce_wnx(void)
>   {
> -    WRITE_SYSREG32(READ_SYSREG32(SCTLR_EL2) | SCTLR_Axx_ELx_WXN, SCTLR_EL2);
> +    WRITE_SYSREG(READ_SYSREG(SCTLR_EL2) | SCTLR_Axx_ELx_WXN, SCTLR_EL2);
>       /*
>        * The TLBs may cache SCTLR_EL2.WXN. So ensure it is synchronized
>        * before flushing the TLBs.
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index c7acdb2087..e7384381cc 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -915,7 +915,7 @@ static void _show_registers(const struct cpu_user_regs *regs,
>       printk(" VTTBR_EL2: %016"PRIx64"\n", ctxt->vttbr_el2);
>       printk("\n");
>   
> -    printk(" SCTLR_EL2: %08"PRIx32"\n", READ_SYSREG32(SCTLR_EL2));
> +    printk(" SCTLR_EL2: %"PRIregister"\n", READ_SYSREG(SCTLR_EL2));
>       printk("   HCR_EL2: %"PRIregister"\n", READ_SYSREG(HCR_EL2));
>       printk(" TTBR0_EL2: %016"PRIx64"\n", READ_SYSREG64(TTBR0_EL2));
>       printk("\n");
> 

Cheers,

-- 
Julien Grall

