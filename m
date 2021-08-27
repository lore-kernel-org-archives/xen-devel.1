Return-Path: <SRS0=IFNi=NS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 470CEC432BE
	for <xen-devel@archiver.kernel.org>; Fri, 27 Aug 2021 00:06:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D5A660F4F
	for <xen-devel@archiver.kernel.org>; Fri, 27 Aug 2021 00:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D5A660F4F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.173241.316119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJPO1-0003zA-HQ; Fri, 27 Aug 2021 00:06:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173241.316119; Fri, 27 Aug 2021 00:06:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJPO1-0003z3-Da; Fri, 27 Aug 2021 00:06:21 +0000
Received: by outflank-mailman (input) for mailman id 173241;
 Fri, 27 Aug 2021 00:06:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CT99=NS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mJPO0-0003yx-1A
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 00:06:20 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9a92cf26-06ca-11ec-aa7e-12813bfff9fa;
 Fri, 27 Aug 2021 00:06:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4E459600CD;
 Fri, 27 Aug 2021 00:06:18 +0000 (UTC)
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
X-Inumbo-ID: 9a92cf26-06ca-11ec-aa7e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630022778;
	bh=IS7aFW2nFEtGdZpMhVEplz2+N7A6qxi7NXo5DXqKHUg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=B7tUP6dJxpQ3VZBOhPeQ8e6HVUjeUdYGoma5LUvKJiOzvtzYb+ia1PLmXMdWOt/un
	 KGJqp7MfsEEjaM5waM+1m7/+ZK6Fpi23Xk/7EKzKchMyZvPczat6LYqxJIWGqW2eqy
	 bismCD20iUvZ62mNGOt1P4FMDtbK6j4A8PKmiaPQ/e8hF51VWa2yvif3LHedI3HWox
	 18QvwxNguBc+cNWpmnhlYjr92Dnp6b83zEP5ZSvf5mwe4Jn/wR3EEF9HBxFOHWBZF7
	 /zBiSo9awcv/OPvCgIRC9sCAW7MsuCgTPb4yoG8qyw3iKq3KoJrEcSWpbIrhP3jRdX
	 Jw3CZksjEPsqQ==
Date: Thu, 26 Aug 2021 17:06:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    jbeulich@suse.com, Bertrand.Marquis@arm.com
Subject: Re: [XEN RFC PATCH 22/40] xen/arm: introduce a helper to parse device
 tree processor node
In-Reply-To: <20210811102423.28908-23-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2108261705000.24433@sstabellini-ThinkPad-T480s>
References: <20210811102423.28908-1-wei.chen@arm.com> <20210811102423.28908-23-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 Aug 2021, Wei Chen wrote:
> Processor NUMA ID information is stored in device tree's processor
> node as "numa-node-id". We need a new helper to parse this ID from
> processor node. If we get this ID from processor node, this ID's
> validity still need to be checked. Once we got a invalid NUMA ID
> from any processor node, the device tree will be marked as NUMA
> information invalid.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/arm/numa_device_tree.c | 41 +++++++++++++++++++++++++++++++--
>  1 file changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/numa_device_tree.c b/xen/arch/arm/numa_device_tree.c
> index 1c74ad135d..37cc56acf3 100644
> --- a/xen/arch/arm/numa_device_tree.c
> +++ b/xen/arch/arm/numa_device_tree.c
> @@ -20,16 +20,53 @@
>  #include <xen/init.h>
>  #include <xen/nodemask.h>
>  #include <xen/numa.h>
> +#include <xen/device_tree.h>
> +#include <asm/setup.h>
>  
>  s8 device_tree_numa = 0;
> +static nodemask_t processor_nodes_parsed __initdata;
>  
> -int srat_disabled(void)
> +static int srat_disabled(void)
>  {
>      return numa_off || device_tree_numa < 0;
>  }
>  
> -void __init bad_srat(void)
> +static __init void bad_srat(void)
>  {
>      printk(KERN_ERR "DT: NUMA information is not used.\n");
>      device_tree_numa = -1;
>  }
> +
> +/* Callback for device tree processor affinity */
> +static int __init dtb_numa_processor_affinity_init(nodeid_t node)
> +{
> +    if ( srat_disabled() )
> +        return -EINVAL;
> +    else if ( node == NUMA_NO_NODE || node >= MAX_NUMNODES ) {
> +		bad_srat();
> +		return -EINVAL;
> +	}
> +
> +    node_set(node, processor_nodes_parsed);
> +
> +    device_tree_numa = 1;
> +    printk(KERN_INFO "DT: NUMA node %u processor parsed\n", node);
> +
> +    return 0;
> +}
> +
> +/* Parse CPU NUMA node info */
> +int __init device_tree_parse_numa_cpu_node(const void *fdt, int node)
> +{
> +    uint32_t nid;
> +
> +    nid = device_tree_get_u32(fdt, node, "numa-node-id", MAX_NUMNODES);
> +    printk(XENLOG_WARNING "CPU on NUMA node:%u\n", nid);

Given that this is not actually a warning (is it?) then I would move it
to XENLOG_INFO


> +    if ( nid >= MAX_NUMNODES )
> +    {
> +        printk(XENLOG_WARNING "Node id %u exceeds maximum value\n", nid);

This could be XENLOG_ERR


> +        return -EINVAL;
> +    }
> +
> +    return dtb_numa_processor_affinity_init(nid);
> +}


