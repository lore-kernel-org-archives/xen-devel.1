Return-Path: <SRS0=eVLD=NW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB9BC432BE
	for <xen-devel@archiver.kernel.org>; Tue, 31 Aug 2021 17:48:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2890610E9
	for <xen-devel@archiver.kernel.org>; Tue, 31 Aug 2021 17:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B2890610E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.175928.320312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL7rU-0002Ok-TA; Tue, 31 Aug 2021 17:47:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175928.320312; Tue, 31 Aug 2021 17:47:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL7rU-0002Od-QD; Tue, 31 Aug 2021 17:47:52 +0000
Received: by outflank-mailman (input) for mailman id 175928;
 Tue, 31 Aug 2021 17:47:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mL7rT-0002OX-QI
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 17:47:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mL7rT-0003N4-GT; Tue, 31 Aug 2021 17:47:51 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mL7rT-0006JA-9Z; Tue, 31 Aug 2021 17:47:51 +0000
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
	bh=zUpjQpGYvmjFqqaAEZxW8q94P148I9bTUhhObHYqBaQ=; b=tjvLnNAy3UluN5KBQB4ASYlXPt
	dWl9RKs71bW00qr0k1MeV8SJ6K6m/wHhJqgaMOe1ZBz2F2Gw9BmMgXKdhbU0EKFZ03KUZuDl4CEHE
	3JNcKbty2OmHzwW17tEBYhrqrMlTt4I1o5n0nVJlVFO2DnnY+jdn8S+CU1WUPdE9mEQA=;
Subject: Re: [XEN RFC PATCH 25/40] xen/arm: unified entry to parse all NUMA
 data from device tree
To: Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <wei.chen@arm.com>
Cc: xen-devel@lists.xenproject.org, jbeulich@suse.com,
 Bertrand.Marquis@arm.com
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-26-wei.chen@arm.com>
 <alpine.DEB.2.21.2108301752501.17851@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <088e4b16-afea-8248-55f1-a081bba7f80c@xen.org>
Date: Tue, 31 Aug 2021 18:47:49 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2108301752501.17851@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 31/08/2021 01:54, Stefano Stabellini wrote:
> On Wed, 11 Aug 2021, Wei Chen wrote:
>> In this API, we scan whole device tree to parse CPU node id, memory
>> node id and distance-map. Though early_scan_node will invoke has a
>> handler to process memory nodes. If we want to parse memory node id
>> in this handler, we have to embeded NUMA parse code in this handler.
>> But we still need to scan whole device tree to find CPU NUMA id and
>> distance-map. In this case, we include memory NUMA id parse in this
>> API too. Another benefit is that we have a unique entry for device
>> tree NUMA data parse.
>>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> ---
>>   xen/arch/arm/numa_device_tree.c | 31 ++++++++++++++++++++++++++++---
>>   xen/include/asm-arm/numa.h      |  1 +
>>   2 files changed, 29 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/arm/numa_device_tree.c b/xen/arch/arm/numa_device_tree.c
>> index 6e0d1d3d9f..27ffb72f7b 100644
>> --- a/xen/arch/arm/numa_device_tree.c
>> +++ b/xen/arch/arm/numa_device_tree.c
>> @@ -131,7 +131,8 @@ save_memblk:
>>   }
>>   
>>   /* Parse CPU NUMA node info */
>> -int __init device_tree_parse_numa_cpu_node(const void *fdt, int node)
>> +static int __init
>> +device_tree_parse_numa_cpu_node(const void *fdt, int node)
>>   {
>>       uint32_t nid;
>>   
>> @@ -147,7 +148,7 @@ int __init device_tree_parse_numa_cpu_node(const void *fdt, int node)
>>   }
>>   
>>   /* Parse memory node NUMA info */
>> -int __init
>> +static int __init
>>   device_tree_parse_numa_memory_node(const void *fdt, int node,
>>       const char *name, uint32_t addr_cells, uint32_t size_cells)
>>   {
>> @@ -202,7 +203,7 @@ device_tree_parse_numa_memory_node(const void *fdt, int node,
>>   }
>>   
>>   /* Parse NUMA distance map v1 */
>> -int __init
>> +static int __init
>>   device_tree_parse_numa_distance_map_v1(const void *fdt, int node)
>>   {
>>       const struct fdt_property *prop;
>> @@ -267,3 +268,27 @@ device_tree_parse_numa_distance_map_v1(const void *fdt, int node)
>>   
>>       return 0;
>>   }
>> +
>> +static int __init fdt_scan_numa_nodes(const void *fdt,
>> +                int node, const char *uname, int depth,
>> +                u32 address_cells, u32 size_cells, void *data)
>> +{
>> +    int ret = 0;
>> +
>> +    if ( fdt_node_check_type(fdt, node, "cpu") == 0 )
>> +        ret = device_tree_parse_numa_cpu_node(fdt, node);
>> +    else if ( fdt_node_check_type(fdt, node, "memory") == 0 )
>> +        ret = device_tree_parse_numa_memory_node(fdt, node, uname,
>> +                                address_cells, size_cells);
>> +    else if ( fdt_node_check_compatible(fdt, node,
>> +                                "numa-distance-map-v1") == 0 )
>> +        ret = device_tree_parse_numa_distance_map_v1(fdt, node);
>> +
>> +    return ret;
>> +}
> 
> Julien, do you have an opinion on whether it might be worth reusing the
> existing early_scan_node function for this to avoiding another full FDT
> scan (to avoid another call to device_tree_for_each_node)?

I don't like the full FDT scan and actually drafted an e-mail in 
reply-to [1] to suggest parse all the NUMA information from 
early_scan_node().

However, we don't know whether ACPI or DT will be used at the time 
early_scan_node() is called. So we will need to revert any change which 
can make the code a little more awkward.

So I decided to drop my e-mail because I prefer the full DT scan for 
now. We can look at optimizing later if this becomes a pain point.

Cheers,

[1] 
https://lore.kernel.org/xen-devel/DB9PR08MB6857604B3D4B690F2B8832BD9EC79@DB9PR08MB6857.eurprd08.prod.outlook.com/

-- 
Julien Grall

