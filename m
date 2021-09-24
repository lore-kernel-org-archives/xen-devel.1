Return-Path: <SRS0=CWmW=OO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3BF0C433EF
	for <xen-devel@archiver.kernel.org>; Fri, 24 Sep 2021 03:17:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99E4660F44
	for <xen-devel@archiver.kernel.org>; Fri, 24 Sep 2021 03:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 99E4660F44
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.194794.347094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTbhj-0005rG-Bd; Fri, 24 Sep 2021 03:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194794.347094; Fri, 24 Sep 2021 03:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTbhj-0005r9-8n; Fri, 24 Sep 2021 03:16:51 +0000
Received: by outflank-mailman (input) for mailman id 194794;
 Fri, 24 Sep 2021 03:16:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTbhi-0005r3-GM
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 03:16:50 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id daf8d1ce-1ce5-11ec-ba9e-12813bfff9fa;
 Fri, 24 Sep 2021 03:16:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A60660F44;
 Fri, 24 Sep 2021 03:16:48 +0000 (UTC)
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
X-Inumbo-ID: daf8d1ce-1ce5-11ec-ba9e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632453408;
	bh=ltAcXF8jHCCBFR25qG2ATZFsI5V5NFZLpl2oTefcOCY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=C8V3hPJbB4qCRJ5bmSu2RuhnpmiAHQ3Jc10IObpcxKQe+ng8P6CFHHdVf3YE8g9X/
	 ZT4RFGM2kXnMlGEh6I3MEKbL4lOwQUoGrsXFcUFU9RJfN1gHXqDP6GRfCpBicf5HqW
	 cocyMF0byPiwQZIXx/p2NOFktoRN2/Oxkzs9IDH9ZKDeHaQXAHJMGUB+XOVI9ZCWwc
	 g5pGxz6NwP/b9XsR3aek7STtVATgAcgFLErgiHFdgDyTgZihFnDURAIHhtwXmoFeZh
	 ER4yIX3kWWb8u9Ma+mOOiYJSwQK8fOyCVVJQXwIeTzh3c6rgo/WQt1h7m7qCaCCdMh
	 aS4CgN+NZLfeg==
Date: Thu, 23 Sep 2021 20:16:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com
Subject: Re: [PATCH 32/37] xen/arm: unified entry to parse all NUMA data from
 device tree
In-Reply-To: <20210923120236.3692135-33-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2109232007160.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-33-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Sep 2021, Wei Chen wrote:
> In this API, we scan whole device tree to parse CPU node id, memory
          ^ function   ^ the whole

> node id and distance-map. Though early_scan_node will invoke has a
> handler to process memory nodes. If we want to parse memory node id
> in this handler, we have to embeded NUMA parse code in this handler.
                              ^ embed

> But we still need to scan whole device tree to find CPU NUMA id and
> distance-map. In this case, we include memory NUMA id parse in this
> API too. Another benefit is that we have a unique entry for device
  ^ function

> tree NUMA data parse.

Ah, that's the explanation I was asking for earlier!


> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/arm/numa_device_tree.c | 30 ++++++++++++++++++++++++++++++
>  xen/include/asm-arm/numa.h      |  1 +
>  2 files changed, 31 insertions(+)
> 
> diff --git a/xen/arch/arm/numa_device_tree.c b/xen/arch/arm/numa_device_tree.c
> index e7fa84df4c..6a3fed0002 100644
> --- a/xen/arch/arm/numa_device_tree.c
> +++ b/xen/arch/arm/numa_device_tree.c
> @@ -242,3 +242,33 @@ static int __init fdt_parse_numa_distance_map_v1(const void *fdt, int node)
>  
>      return 0;
>  }
> +
> +static int __init fdt_scan_numa_nodes(const void *fdt,
> +                int node, const char *uname, int depth,
> +                u32 address_cells, u32 size_cells, void *data)

Please align parameters


> +{
> +    int len, ret = 0;
> +    const void *prop;
> +
> +    prop = fdt_getprop(fdt, node, "device_type", &len);
> +    if (prop)

code style


> +    {
> +        len += 1;
> +        if ( memcmp(prop, "cpu", len) == 0 )
> +            ret = fdt_parse_numa_cpu_node(fdt, node);
> +        else if ( memcmp(prop, "memory", len) == 0 )
> +            ret = fdt_parse_numa_memory_node(fdt, node, uname,
> +                                address_cells, size_cells);

I realize that with the inclusion of '\0' in the check, the usage of
memcmp should be safe, but I would prefer if we used strncmp instead.


> +    }
> +    else if ( fdt_node_check_compatible(fdt, node,
> +                                "numa-distance-map-v1") == 0 )
> +        ret = fdt_parse_numa_distance_map_v1(fdt, node);
> +
> +    return ret;
> +}
> +
> +/* Initialize NUMA from device tree */
> +int __init numa_device_tree_init(const void *fdt)
> +{
> +    return device_tree_for_each_node(fdt, 0, fdt_scan_numa_nodes, NULL);
> +}
> diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
> index 7675012cb7..f46e8e2935 100644
> --- a/xen/include/asm-arm/numa.h
> +++ b/xen/include/asm-arm/numa.h
> @@ -23,6 +23,7 @@ typedef u8 nodeid_t;
>  #define NR_NODE_MEMBLKS NR_MEM_BANKS
>  
>  extern void numa_set_distance(nodeid_t from, nodeid_t to, uint32_t distance);
> +extern int numa_device_tree_init(const void *fdt);
>  
>  #else
>  
> -- 
> 2.25.1
> 

