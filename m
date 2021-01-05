Return-Path: <SRS0=UuSr=GI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF6FC433E0
	for <xen-devel@archiver.kernel.org>; Tue,  5 Jan 2021 11:01:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 167FC229C6
	for <xen-devel@archiver.kernel.org>; Tue,  5 Jan 2021 11:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 167FC229C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.61799.108872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwk5I-0002W4-2o; Tue, 05 Jan 2021 11:01:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61799.108872; Tue, 05 Jan 2021 11:01:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwk5H-0002Vx-Vt; Tue, 05 Jan 2021 11:01:03 +0000
Received: by outflank-mailman (input) for mailman id 61799;
 Tue, 05 Jan 2021 11:01:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kwk5G-0002VZ-Py
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 11:01:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kwk5G-0007BU-Ja; Tue, 05 Jan 2021 11:01:02 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kwk5G-0007bP-DG; Tue, 05 Jan 2021 11:01:02 +0000
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
	bh=91sGRpex+PTuhSXmNa1taCMfZfJjuZTKzsFqlNGbBqM=; b=kx4wYaDgaFj7hPjmPxavJ3Jc1n
	sJTi6XBjarAqUxvEKP7LcyhZ0vrBtecJow1otjxaj8TEv4cofyklgbL2ZhcJJb79xaA1GpIBMm+tg
	e26muC+X+BFMG6Sg0zHnzFdBeGvrjlSxOA3L7jhMcqGMME5tUS7Lr9ppdE77ZY+dST9A=;
Subject: Re: [PATCH] xen/arm: Using unsigned long for arm64 MPIDR mask
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Penny.Zheng@arm.com, Jiamei.Xie@arm.com,
 nd@arm.com
References: <20210105101751.1972883-1-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c3896575-a256-add3-2603-71e627bceba7@xen.org>
Date: Tue, 5 Jan 2021 11:01:00 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105101751.1972883-1-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Wei,

On 05/01/2021 10:17, Wei Chen wrote:
> Curretly, Xen is using UINT32 for MPIDR mask to retrieve

s/Curretly/Currently/

> affinity[0,1,2,3] values for MPIDR_EL1 register. The value
> of MPIDR_EL1 is 64-bit unsigned long. The operation of 64-bit
> and 32-bit integers are compiler related. This means the value
> is unpredictable.

So I agree that ~MPIDR_AFF0_MASK will do the negation in 32-bit rather 
than 64-bit. However, I disagree that this is unpredicable or compiler 
specific.

> 
> For example, when we are using MPIDR_AFF0_MASK to get
> cluster_id from a 64-bit integer in gic-v3 driver:
> uint64_t cluster_id = cpu_logical_map(cpu) & ~MPIDR_AFF0_MASK;
> 
> When MPIDR_AFF0_MASK is UINT32, compiler output:
>      f7c: 92785c16 and x22, x0, #0xffffff00
> When MPIDR_AFF0_MASK is unsigned long, compiler output:
>      f88: 9278dc75 and x21, x3, #0xffffffffffffff00
> 
> If we have a cpu_logical_map(cpu)= 0x1,00000000. We except
> to get a cluster_id 1, but with UINT32 MPIDR_AFF0_MASK, we
> will get 0.

Something doesn't match here. If the cluster_id were 1, then it should 
surely be 1 as well even with the 32-bit mask because there is no shift.

So did you intend to say 0x1,00000000?

> 
> So, in this patch, we force aarch64 to use unsigned long
> as MPIDR mask to avoid such unpredictable operations.

Per above, I don't think this is unpredictable.

> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/include/asm-arm/processor.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/include/asm-arm/processor.h b/xen/include/asm-arm/processor.h
> index 87c8136022..5c1768cdec 100644
> --- a/xen/include/asm-arm/processor.h
> +++ b/xen/include/asm-arm/processor.h
> @@ -75,11 +75,11 @@
>   
>   /* MPIDR Multiprocessor Affinity Register */
>   #define _MPIDR_UP           (30)
> -#define MPIDR_UP            (_AC(1,U) << _MPIDR_UP)
> +#define MPIDR_UP            (_AC(1,UL) << _MPIDR_UP)
>   #define _MPIDR_SMP          (31)
> -#define MPIDR_SMP           (_AC(1,U) << _MPIDR_SMP)
> +#define MPIDR_SMP           (_AC(1,UL) << _MPIDR_SMP)
>   #define MPIDR_AFF0_SHIFT    (0)
> -#define MPIDR_AFF0_MASK     (_AC(0xff,U) << MPIDR_AFF0_SHIFT)
> +#define MPIDR_AFF0_MASK     (_AC(0xff,UL) << MPIDR_AFF0_SHIFT)
>   #ifdef CONFIG_ARM_64
>   #define MPIDR_HWID_MASK     _AC(0xff00ffffff,UL)
>   #else
> 

-- 
Julien Grall

