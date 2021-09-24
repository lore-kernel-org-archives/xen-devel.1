Return-Path: <SRS0=CWmW=OO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0075CC433EF
	for <xen-devel@archiver.kernel.org>; Fri, 24 Sep 2021 03:19:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8DC961164
	for <xen-devel@archiver.kernel.org>; Fri, 24 Sep 2021 03:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A8DC961164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.194798.347105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTbkD-0006r4-Pf; Fri, 24 Sep 2021 03:19:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194798.347105; Fri, 24 Sep 2021 03:19:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTbkD-0006qx-MC; Fri, 24 Sep 2021 03:19:25 +0000
Received: by outflank-mailman (input) for mailman id 194798;
 Fri, 24 Sep 2021 03:19:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTbkC-0006qr-62
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 03:19:24 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 36e9d6fe-1ce6-11ec-ba9e-12813bfff9fa;
 Fri, 24 Sep 2021 03:19:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB31161211;
 Fri, 24 Sep 2021 03:19:22 +0000 (UTC)
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
X-Inumbo-ID: 36e9d6fe-1ce6-11ec-ba9e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632453562;
	bh=798yw/5WSiC7yw35GxgVS2qF173BV6xPb14iN2pYQKw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pUR2YtwzZPJpnqaUzEenRow7j02u4ykhB329rbUuxR72NxIkFv9op6OFMsIQ71OMt
	 YPUe/GsnElgKz2Z8A5VFvd0c7Hu/6dpwBWwjy8e+tSrYT7Pf+SC9CddWxuTcFstak4
	 9Ub0CStlk8FXM7RFfp6OxpWoijv2LNb2J7Ms4ExkNtV1B4pAn+GqlDCUpqoM4ZMmoy
	 IPGMQt0orWgYuySWSF9armc2LuaY6izaiBGAnsqIe3cUA4vVkYYImCbDSPjrc46MwM
	 jc+qkb+TUXrPl65C/Af4MW4PbbI+0TjKCAcqRVJz9nNPQZ3ScnQlMlycXy/uVTqhZA
	 XLJy4jra9xrDw==
Date: Thu, 23 Sep 2021 20:19:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com
Subject: Re: [PATCH 33/37] xen/arm: keep guest still be NUMA unware
In-Reply-To: <20210923120236.3692135-34-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2109232018070.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-34-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Sep 2021, Wei Chen wrote:
> The NUMA information provided in the host Device-Tree
> are only for Xen. For dom0, we want to hide them as they
> may be different (for now, dom0 is still not aware of NUMA)
> The CPU and memory nodes are recreated from scratch for the
> domain. So we already skip the "numa-node-id" property for
> these two types of nodes.
> 
> However, some devices like PCIe may have "numa-node-id"
> property too. We have to skip them as well.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/arm/domain_build.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index d233d634c1..6e94922238 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -737,6 +737,10 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>                  continue;
>          }
>  
> +        /* Guest is numa unaware in current stage */

I would say: "Dom0 is currently NUMA unaware"

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> +        if ( dt_property_name_is_equal(prop, "numa-node-id") )
> +            continue;
> +
>          res = fdt_property(kinfo->fdt, prop->name, prop_data, prop_len);
>  
>          if ( res )
> @@ -1607,6 +1611,8 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
>          DT_MATCH_TYPE("memory"),
>          /* The memory mapped timer is not supported by Xen. */
>          DT_MATCH_COMPATIBLE("arm,armv7-timer-mem"),
> +        /* Numa info doesn't need to be exposed to Domain-0 */
> +        DT_MATCH_COMPATIBLE("numa-distance-map-v1"),
>          { /* sentinel */ },
>      };
>      static const struct dt_device_match timer_matches[] __initconst =
> -- 
> 2.25.1
> 

