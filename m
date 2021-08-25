Return-Path: <SRS0=ian9=NQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 788C0C4338F
	for <xen-devel@archiver.kernel.org>; Wed, 25 Aug 2021 17:16:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3989A61008
	for <xen-devel@archiver.kernel.org>; Wed, 25 Aug 2021 17:16:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3989A61008
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.172562.314881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIwVz-0001mq-Nc; Wed, 25 Aug 2021 17:16:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172562.314881; Wed, 25 Aug 2021 17:16:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIwVz-0001mj-Kc; Wed, 25 Aug 2021 17:16:39 +0000
Received: by outflank-mailman (input) for mailman id 172562;
 Wed, 25 Aug 2021 17:16:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mIwVy-0001md-6i
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 17:16:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIwVw-0002EQ-UD; Wed, 25 Aug 2021 17:16:36 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIwVw-0004Qf-Nb; Wed, 25 Aug 2021 17:16:36 +0000
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
	bh=czQZjnRKbT0Gdk/6gkh3uz1p/pOFuLtmIqvNaLUGAKc=; b=FdmRkj5HSPk2A2MJb1qYQ4m8f4
	go1UsIkTInVoGDkxTi266US4xmhInf8gzQA2kX82/Aayh0Le7XKb6+mYgislUPwq4qOa26KkNo+VT
	RqMlGy8E/2V1C1rlSG3j4gKbV2QYvqsd9Id0yuhsyQ4b+ME8bDWkHDmgweoTECFBsM/w=;
Subject: Re: [XEN RFC PATCH 30/40] xen: move NUMA memory and CPU parsed
 nodemasks to common
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, jbeulich@suse.com
Cc: Bertrand.Marquis@arm.com
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-31-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e97b705f-3bf6-9a01-a24b-ad2840a7c8a8@xen.org>
Date: Wed, 25 Aug 2021 18:16:34 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210811102423.28908-31-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Wei,

On 11/08/2021 11:24, Wei Chen wrote:
> Both memory_nodes_parsed and processor_nodes_parsed are using
> for Arm and x86 to record parded NUMA memory and CPU. So we
> move them to common.

Looking at the usage, they both call:

numa_set...(..., bitmap)

So rather than exporting the two helpers, could we simply add helpers to 
abstract it?


> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/arm/numa_device_tree.c | 2 --
>   xen/arch/x86/srat.c             | 3 ---
>   xen/common/numa.c               | 3 +++
>   xen/include/xen/nodemask.h      | 2 ++
>   4 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/numa_device_tree.c b/xen/arch/arm/numa_device_tree.c
> index 27ffb72f7b..f74b7f6427 100644
> --- a/xen/arch/arm/numa_device_tree.c
> +++ b/xen/arch/arm/numa_device_tree.c
> @@ -25,8 +25,6 @@
>   #include <asm/setup.h>
>   
>   s8 device_tree_numa = 0;
> -static nodemask_t processor_nodes_parsed __initdata;
> -static nodemask_t memory_nodes_parsed __initdata;

This is code that was introduced in a previous patch. In general, it is 
better to do the rework first and then add the new code. This makes 
easier to follow series as the code added is not changed.

>   
>   static int srat_disabled(void)
>   {
> diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
> index 2298353846..dd3aa30843 100644
> --- a/xen/arch/x86/srat.c
> +++ b/xen/arch/x86/srat.c
> @@ -24,9 +24,6 @@
>   
>   static struct acpi_table_slit *__read_mostly acpi_slit;
>   
> -static nodemask_t memory_nodes_parsed __initdata;
> -static nodemask_t processor_nodes_parsed __initdata;
> -
>   struct pxm2node {
>   	unsigned pxm;
>   	nodeid_t node;
> diff --git a/xen/common/numa.c b/xen/common/numa.c
> index 26c0006d04..79ab250543 100644
> --- a/xen/common/numa.c
> +++ b/xen/common/numa.c
> @@ -35,6 +35,9 @@ int num_node_memblks;
>   struct node node_memblk_range[NR_NODE_MEMBLKS];
>   nodeid_t memblk_nodeid[NR_NODE_MEMBLKS];
>   
> +nodemask_t memory_nodes_parsed __initdata;
> +nodemask_t processor_nodes_parsed __initdata;
> +
>   bool numa_off;
>   
>   /*
> diff --git a/xen/include/xen/nodemask.h b/xen/include/xen/nodemask.h
> index 1dd6c7458e..29ce5e28e7 100644
> --- a/xen/include/xen/nodemask.h
> +++ b/xen/include/xen/nodemask.h
> @@ -276,6 +276,8 @@ static inline int __cycle_node(int n, const nodemask_t *maskp, int nbits)
>    */
>   
>   extern nodemask_t node_online_map;
> +extern nodemask_t memory_nodes_parsed;
> +extern nodemask_t processor_nodes_parsed;
>   
>   #if MAX_NUMNODES > 1
>   #define num_online_nodes()	nodes_weight(node_online_map)
> 

Cheers,

-- 
Julien Grall

