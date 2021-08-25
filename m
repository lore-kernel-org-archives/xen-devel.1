Return-Path: <SRS0=ian9=NQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6061EC4338F
	for <xen-devel@archiver.kernel.org>; Wed, 25 Aug 2021 16:58:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 090FD61052
	for <xen-devel@archiver.kernel.org>; Wed, 25 Aug 2021 16:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 090FD61052
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.172546.314849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIwEQ-0006ML-IY; Wed, 25 Aug 2021 16:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172546.314849; Wed, 25 Aug 2021 16:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIwEQ-0006ME-FR; Wed, 25 Aug 2021 16:58:30 +0000
Received: by outflank-mailman (input) for mailman id 172546;
 Wed, 25 Aug 2021 16:58:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mIwEP-0006M8-CJ
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 16:58:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIwEO-0001sD-DJ; Wed, 25 Aug 2021 16:58:28 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIwEO-0001rD-6Z; Wed, 25 Aug 2021 16:58:28 +0000
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
	bh=+ItNExPETyGzz7ay1fIfIIYWQICjRvpwT6obiQ3Pciw=; b=YG6bI+aPbjisp2qAcN9hlMGH40
	MYw3fvNKARCghHEUQrHiGBdCoDnAL9/YnBKkqshA9YqQQysvx0KMo2EIzsth4Vdirjo5qtOcJKtwy
	blQiN8XC/rg834S3Cy/ukbURWnIdidSDnjZS1X82Z+NqsoLTEhoDavrfT2PlZvS7k5WI=;
Subject: Re: [XEN RFC PATCH 26/40] xen/arm: Add boot and secondary CPU to NUMA
 system
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, jbeulich@suse.com
Cc: Bertrand.Marquis@arm.com
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-27-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <35a57b18-4fab-522d-f39a-de21017abe57@xen.org>
Date: Wed, 25 Aug 2021 17:58:26 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210811102423.28908-27-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Wei,

On 11/08/2021 11:24, Wei Chen wrote:
> When cpu boot up, we have add them to NUMA system. In current
> stage, we have not parsed the NUMA data, but we have created
> a fake NUMA node. So, in this patch, all CPU will be added
> to NUMA node#0. After the NUMA data has been parsed from device
> tree, the CPU will be added to correct NUMA node as the NUMA
> data described.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/arm/setup.c       | 6 ++++++
>   xen/arch/arm/smpboot.c     | 6 ++++++
>   xen/include/asm-arm/numa.h | 1 +
>   3 files changed, 13 insertions(+)
> 
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 3c58d2d441..7531989f21 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -918,6 +918,12 @@ void __init start_xen(unsigned long boot_phys_offset,
>   
>       processor_id();
>   
> +    /*
> +     * If Xen is running on a NUMA off system, there will
> +     * be a node#0 at least.
> +     */
> +    numa_add_cpu(0);
> +
>       smp_init_cpus();
>       cpus = smp_get_max_cpus();
>       printk(XENLOG_INFO "SMP: Allowing %u CPUs\n", cpus);
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index a1ee3146ef..aa78958c07 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -358,6 +358,12 @@ void start_secondary(void)
>        */
>       smp_wmb();
>   
> +    /*
> +     * If Xen is running on a NUMA off system, there will
> +     * be a node#0 at least.
> +     */
> +    numa_add_cpu(cpuid);
> +

On x86, numa_add_cpu() will be called before the pCPU is brought up. I 
am not quite too sure why we are doing it differently here. Can you 
clarify it?

>       /* Now report this CPU is up */
>       cpumask_set_cpu(cpuid, &cpu_online_map);
>   
> diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
> index 7a3588ac7f..dd31324b0b 100644
> --- a/xen/include/asm-arm/numa.h
> +++ b/xen/include/asm-arm/numa.h
> @@ -59,6 +59,7 @@ extern mfn_t first_valid_mfn;
>   #define __node_distance(a, b) (20)
>   
>   #define numa_init(x) do { } while (0)
> +#define numa_add_cpu(x) do { } while (0)

This is a stubs for a common helper. So I think this wants to be moved 
in the !CONFIG_NUMA in xen/numa.h.

>   #define numa_set_node(x, y) do { } while (0)
>   
>   #endif
>

Cheers,

-- 
Julien Grall

