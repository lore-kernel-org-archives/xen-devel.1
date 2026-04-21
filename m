Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D969F327C5
	for <xen-devel@archiver.kernel.org>; Tue, 21 Apr 2026 08:37:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1288616.1568870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF6bB-0005KZ-2p; Tue, 21 Apr 2026 08:36:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288616.1568870; Tue, 21 Apr 2026 08:36:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF6bB-0005KQ-04; Tue, 21 Apr 2026 08:36:49 +0000
Received: by outflank-mailman (input) for mailman id 1288616;
 Tue, 21 Apr 2026 08:36:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wF6bA-0005J8-3B
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 08:36:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wF6b9-00CeQV-22;
 Tue, 21 Apr 2026 08:36:47 +0000
Received: from [2a02:8012:3a1:0:3d55:1646:9f87:e5f0]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wF6b9-00DygZ-1L;
 Tue, 21 Apr 2026 08:36:47 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=3x7ZA5fd2nnuA0ufHxBALV6fxOVywYgqzpL+x6BowS4=; b=37blrnjxrZzjQ66cGJQLvVEPQJ
	hGt2pTzeFAoOMrbaUh0iuzB7jRSS7/IDYRHD+yuTUWGi5QUVmTJUs+y28oZxLtY7/pAfJzhhVwWma
	Myi3pH4qgl4HTLqjwqHMwHskLJwfCWXzUjU9ZwIv9ZGMdNzDOA6zp94b91WGAjxfZt80=;
Message-ID: <3708372f-c2e9-4d84-89eb-ab9845ac4798@xen.org>
Date: Tue, 21 Apr 2026 09:36:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] plat/rcar: Add region id support for PCI
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1776756291.git.mykyta_poturai@epam.com>
 <ad5caa92e36b0e0f104a14b46396037505080f4f.1776756291.git.mykyta_poturai@epam.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <ad5caa92e36b0e0f104a14b46396037505080f4f.1776756291.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mykyta,

On 21/04/2026 08:57, Mykyta Poturai wrote:
> diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
> index 888d0b85d5..db096952c8 100644
> --- a/xen/arch/arm/platforms/Kconfig
> +++ b/xen/arch/arm/platforms/Kconfig
> @@ -64,6 +64,27 @@ config NO_PLAT
>   
>   endchoice
>   
> +menu "RCar Region ID Support"
> +    visible if RCAR4
> +
> +config RCAR_REGION_ID_SUPPORT
> +	bool "Renesas Region ID support for R-Car Gen4 platforms" if EXPERT
> +	depends on RCAR4
> +	help
> +	  Enable experimental Region ID support for R-Car Gen4 platforms
> +
> +config RCAR_RGID
> +	int "Region ID encoded in physical address"
> +	depends on RCAR_REGION_ID_SUPPORT
> +	default 0
> +
> +config RCAR_PA_BITS
> +	int "Physical address space size"
> +	depends on RCAR_REGION_ID_SUPPORT
> +	default 36

The 3 configs above implies that the value will change per-board. Is 
that correct? If so, this should be described in the firmware table so a 
single Xen binary can boot on all the platforms.

Cheers,

-- 
Julien Grall


