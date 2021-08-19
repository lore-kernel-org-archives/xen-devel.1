Return-Path: <SRS0=TguT=NK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1309C4338F
	for <xen-devel@archiver.kernel.org>; Thu, 19 Aug 2021 17:35:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8847D6109E
	for <xen-devel@archiver.kernel.org>; Thu, 19 Aug 2021 17:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8847D6109E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.169011.308709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGlwk-0004Ke-7x; Thu, 19 Aug 2021 17:35:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169011.308709; Thu, 19 Aug 2021 17:35:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGlwk-0004KW-4S; Thu, 19 Aug 2021 17:35:18 +0000
Received: by outflank-mailman (input) for mailman id 169011;
 Thu, 19 Aug 2021 17:35:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mGlwj-0004KM-0l
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 17:35:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGlwi-0005V3-2R; Thu, 19 Aug 2021 17:35:16 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGlwh-0000Yx-Rt; Thu, 19 Aug 2021 17:35:16 +0000
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
	bh=PIEJQ3q7Wp7wvOA+y5B3+3eJzwWCC+WVPRMqjxvsVHc=; b=rtxyKsYpCkCJMeIf/QBteoiY3P
	4kbVX56HaTO4QqXoO1CPPohtdNU9/u4/ooWLhXAZ6mxRWvj8jSugIXXWZIJn7MR1V528s5cgR6QkP
	BygC7hWZ5O99wq/FL59hd6kvF67HhHQNV+p0qKV6u5PCbjtPE7TxcBhKOeNeqXoWXO1k=;
Subject: Re: [XEN RFC PATCH 18/40] xen/arm: Keep memory nodes in dtb for NUMA
 when boot from EFI
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, jbeulich@suse.com
Cc: Bertrand.Marquis@arm.com
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-19-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <bfcfa593-60ac-43a7-4f1f-a7a3ab04a1ff@xen.org>
Date: Thu, 19 Aug 2021 18:35:13 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210811102423.28908-19-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Wei,

On 11/08/2021 11:24, Wei Chen wrote:
> EFI can get memory map from EFI system table. But EFI system
> table doesn't contain memory NUMA information, EFI depends on
> ACPI SRAT or device tree memory node to parse memory blocks'
> NUMA mapping.
> 
> But in current code, when Xen is booting from EFI, it will
> delete all memory nodes in device tree. So in UEFI + DTB
> boot, we don't have numa-node-id for memory blocks any more.
> 
> So in this patch, we will keep memory nodes in device tree for
> NUMA code to parse memory numa-node-id later.
> 
> As a side effect, if we still parse boot memory information in
> early_scan_node, bootmem.info will calculate memory ranges in
> memory nodes twice. So we have to prvent early_scan_node to

s/prvent/prevent/

> parse memory nodes in EFI boot.
> 
> As EFI APIs only can be used in Arm64, so we introduced a wrapper
> in header file to prevent #ifdef CONFIG_ARM_64/32 in code block.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/arm/bootfdt.c      |  8 +++++++-
>   xen/arch/arm/efi/efi-boot.h | 25 -------------------------
>   xen/include/asm-arm/setup.h |  6 ++++++
>   3 files changed, 13 insertions(+), 26 deletions(-)
> 
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index 476e32e0f5..7df149dbca 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -11,6 +11,7 @@
>   #include <xen/lib.h>
>   #include <xen/kernel.h>
>   #include <xen/init.h>
> +#include <xen/efi.h>
>   #include <xen/device_tree.h>
>   #include <xen/libfdt/libfdt.h>
>   #include <xen/sort.h>
> @@ -335,7 +336,12 @@ static int __init early_scan_node(const void *fdt,
>   {
>       int rc = 0;
>   
> -    if ( device_tree_node_matches(fdt, node, "memory") )
> +    /*
> +     * If system boot from EFI, bootinfo.mem has been set by EFI,

"If the system boot". Although, I would suggest to write:

"If Xen has been booted via UEFI, the memory banks will already be 
populated. So we should skip the parsing."

> +     * so we don't need to parse memory node from DTB.
> +     */
> +    if ( device_tree_node_matches(fdt, node, "memory") &&
> +         !arch_efi_enabled(EFI_BOOT) )

arch_efi_enabled() is going to be less expensive than 
device_tree_node_matches(). So I would suggest to re-order the operands.

>           rc = process_memory_node(fdt, node, name, depth,
>                                    address_cells, size_cells, &bootinfo.mem);
>       else if ( depth == 1 && !dt_node_cmp(name, "reserved-memory") )
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index cf9c37153f..d0a9987fa4 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -197,33 +197,8 @@ EFI_STATUS __init fdt_add_uefi_nodes(EFI_SYSTEM_TABLE *sys_table,
>       int status;
>       u32 fdt_val32;
>       u64 fdt_val64;
> -    int prev;
>       int num_rsv;
>   
> -    /*
> -     * Delete any memory nodes present.  The EFI memory map is the only
> -     * memory description provided to Xen.
> -     */
> -    prev = 0;
> -    for (;;)
> -    {
> -        const char *type;
> -        int len;
> -
> -        node = fdt_next_node(fdt, prev, NULL);
> -        if ( node < 0 )
> -            break;
> -
> -        type = fdt_getprop(fdt, node, "device_type", &len);
> -        if ( type && strncmp(type, "memory", len) == 0 )
> -        {
> -            fdt_del_node(fdt, node);
> -            continue;
> -        }
> -
> -        prev = node;
> -    }
> -
>      /*
>       * Delete all memory reserve map entries. When booting via UEFI,
>       * kernel will use the UEFI memory map to find reserved regions.
> diff --git a/xen/include/asm-arm/setup.h b/xen/include/asm-arm/setup.h
> index c4b6af6029..e4fb5f0d49 100644
> --- a/xen/include/asm-arm/setup.h
> +++ b/xen/include/asm-arm/setup.h
> @@ -123,6 +123,12 @@ void device_tree_get_reg(const __be32 **cell, u32 address_cells,
>   u32 device_tree_get_u32(const void *fdt, int node,
>                           const char *prop_name, u32 dflt);
>   
> +#if defined(CONFIG_ARM_64)
> +#define arch_efi_enabled(x) efi_enabled(x)
> +#else
> +#define arch_efi_enabled(x) (0)
> +#endif

I would prefer if we introduce CONFIG_EFI that would stub efi_enabled 
for architecture not supporting EFI.

Cheers,

-- 
Julien Grall

