Return-Path: <SRS0=o/hf=NO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A25AC432BE
	for <xen-devel@archiver.kernel.org>; Mon, 23 Aug 2021 17:58:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A96461374
	for <xen-devel@archiver.kernel.org>; Mon, 23 Aug 2021 17:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A96461374
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.170576.311405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIECz-0003ii-UB; Mon, 23 Aug 2021 17:58:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170576.311405; Mon, 23 Aug 2021 17:58:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIECz-0003ib-RG; Mon, 23 Aug 2021 17:58:05 +0000
Received: by outflank-mailman (input) for mailman id 170576;
 Mon, 23 Aug 2021 17:58:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mIECy-0003iV-4m
 for xen-devel@lists.xenproject.org; Mon, 23 Aug 2021 17:58:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIECx-00008a-0B; Mon, 23 Aug 2021 17:58:03 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIECw-0001Iv-Qk; Mon, 23 Aug 2021 17:58:02 +0000
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
	bh=T2JSAkKBRQcUO/gzCOf9uwToE5IrSjXAfVOU2gEqTA0=; b=nXBbn1+yQkjIXdBE/HOVmqcxgb
	1oRxajxCpwV1G50Rhv4/6Pv6oblLDdPQD9jmpLIcFtkQ/zgwRvLKFsr9LghXSN9LGTuqFq5U0pFDw
	NPShPfM7hApvQ0EcDxYbh0PiLuFExpEpcsPQQkW4Opo0iE/01oXsdfBA4bamkGVfg0l8=;
Subject: Re: [XEN RFC PATCH 10/40] xen/x86: Move NR_NODE_MEMBLKS macro to
 common
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, jbeulich@suse.com
Cc: Bertrand.Marquis@arm.com
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-11-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <286592b5-ea2f-f77d-14f7-b85411e3d7f7@xen.org>
Date: Mon, 23 Aug 2021 18:58:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210811102423.28908-11-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Wei,

On 11/08/2021 11:23, Wei Chen wrote:
> Not only x86 ACPI need this macro. Device tree based NUMA
> also needs this macro to present max memory block number.
AFAICT, a memory range described in DT cannot be split across multiple 
nodes. So I think we want to define NR_NODE_MEMBLKS as NR_MEM_BANKS.

> So we move it from x86 ACPI header file to common NUMA
> header file.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/include/asm-x86/acpi.h | 1 -
>   xen/include/xen/numa.h     | 1 +
>   2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/include/asm-x86/acpi.h b/xen/include/asm-x86/acpi.h
> index 7032f3a001..d347500a3c 100644
> --- a/xen/include/asm-x86/acpi.h
> +++ b/xen/include/asm-x86/acpi.h
> @@ -103,7 +103,6 @@ extern unsigned long acpi_wakeup_address;
>   
>   extern s8 acpi_numa;
>   extern int acpi_scan_nodes(u64 start, u64 end);
> -#define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
>   
>   extern struct acpi_sleep_info acpi_sinfo;
>   #define acpi_video_flags bootsym(video_flags)
> diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
> index f9769cba4b..5af74b357f 100644
> --- a/xen/include/xen/numa.h
> +++ b/xen/include/xen/numa.h
> @@ -11,6 +11,7 @@
>   #define NUMA_NO_DISTANCE 0xFF
>   
>   #define MAX_NUMNODES    (1 << NODES_SHIFT)
> +#define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
>   
>   #define vcpu_to_node(v) (cpu_to_node((v)->processor))
>   
> 

Cheers,

-- 
Julien Grall

