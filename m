Return-Path: <SRS0=CWmW=OO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00199C433EF
	for <xen-devel@archiver.kernel.org>; Fri, 24 Sep 2021 02:09:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9ED061108
	for <xen-devel@archiver.kernel.org>; Fri, 24 Sep 2021 02:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9ED061108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.194750.347006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTaec-0001Rq-AQ; Fri, 24 Sep 2021 02:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194750.347006; Fri, 24 Sep 2021 02:09:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTaec-0001Rj-6k; Fri, 24 Sep 2021 02:09:34 +0000
Received: by outflank-mailman (input) for mailman id 194750;
 Fri, 24 Sep 2021 02:09:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTaeb-0001Rd-1g
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 02:09:33 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f0eb23e-c6bf-4278-8105-caf39900c3fe;
 Fri, 24 Sep 2021 02:09:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21A6E60F6F;
 Fri, 24 Sep 2021 02:09:31 +0000 (UTC)
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
X-Inumbo-ID: 7f0eb23e-c6bf-4278-8105-caf39900c3fe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632449371;
	bh=4jZPYpku3wEyw6MbydFbpZitaGb3nPMzTYyK/u6mYqE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=M88FS1ww3E6oPisAhKI6Qo/04ZW6UYWgzpw5eIz24IUkn54BvYA38BBPYuktDiMhk
	 RiAZO1HZVzVxGoWHTCIP496DrucCLGYa8x/cTdmlPwJiTR79MZiAKxiEuD76g++exJ
	 8M3C5KpyW0z+MybcZZDQcw1dYbYyZby1qPMnevmerd8w4jPFIZ6UIv+dhu8tj+z7j1
	 pe9wklR5EZCbs8juAOZ9fE8/okGgBRwLgXVvHMHp3dQVloUjgzOihaS/4/+0/NvLAz
	 fUlSloj7GQyW7YXjjr+1eE0Il94HxZGhO5B/TcfYST37sHR4AvZf4wfz/7w1+v4o/c
	 Ab7LXnjhJhkTQ==
Date: Thu, 23 Sep 2021 19:09:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, wl@xen.org
Subject: Re: [PATCH 25/37] xen/arm: implement bad_srat for Arm NUMA
 initialization
In-Reply-To: <20210923120236.3692135-26-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2109231906570.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-26-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Sep 2021, Wei Chen wrote:
> NUMA initialization will parse information from firmware provided
> static resource affinity table (ACPI SRAT or DTB). bad_srat if a
> function that will be used when initialization code encounters
> some unexcepted errors.
> 
> In this patch, we introduce Arm version bad_srat for NUMA common
> initialization code to invoke it.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/arm/numa.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
> index 3755b01ef4..5209d3de4d 100644
> --- a/xen/arch/arm/numa.c
> +++ b/xen/arch/arm/numa.c
> @@ -18,6 +18,7 @@
>   *
>   */
>  #include <xen/init.h>
> +#include <xen/nodemask.h>
>  #include <xen/numa.h>
>  
>  static uint8_t __read_mostly
> @@ -25,6 +26,12 @@ node_distance_map[MAX_NUMNODES][MAX_NUMNODES] = {
>      { 0 }
>  };
>  
> +__init void bad_srat(void)
> +{
> +    printk(KERN_ERR "NUMA: Firmware SRAT table not used.\n");
> +    fw_numa = -1;
> +}

I realize that the series keeps the "srat" terminology everywhere on DT
too. I wonder if it is worth replacing srat with something like
"numa_distance" everywhere as appropriate. I am adding the x86
maintainers for an opinion.

If you guys prefer to keep srat (if nothing else, it is concise), I am
also OK with keeping srat although it is not technically accurate.

