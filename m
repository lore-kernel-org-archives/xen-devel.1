Return-Path: <SRS0=+ia2=JK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 108BBC43460
	for <xen-devel@archiver.kernel.org>; Tue, 13 Apr 2021 17:02:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4D99613B6
	for <xen-devel@archiver.kernel.org>; Tue, 13 Apr 2021 17:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4D99613B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.109999.209946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWMQe-0008Tr-L3; Tue, 13 Apr 2021 17:02:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109999.209946; Tue, 13 Apr 2021 17:02:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWMQe-0008Tk-Gb; Tue, 13 Apr 2021 17:02:20 +0000
Received: by outflank-mailman (input) for mailman id 109999;
 Tue, 13 Apr 2021 17:02:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lWMQc-0008Td-Tr
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 17:02:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lWMQX-0008Dk-VI; Tue, 13 Apr 2021 17:02:13 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lWMQX-0006OA-N5; Tue, 13 Apr 2021 17:02:13 +0000
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
	bh=DhazNOICkI7Ky79rqcMRK/X26f7ux6q+SiOjb1P5lQI=; b=6XozFQ9wrJyyZmpaiGJoh3rsd6
	lFPY4/5LTJrO0pVbTf19SC+IQBntX+iOypr9TT7FQC1IkOsSG9H2lqs/Ig0nd5SDnGq6YRCrAWj+a
	g0rhj7Voru6TLSg3phNCD3Yr3nkxsux4lLW4c0Hc9gLnDlpjfftOUoqLFf+widbIdocs=;
Subject: Re: [PATCH v3 4/4] xen/arm: Prevent Dom0 to be loaded when using
 dom0less
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210412105243.23354-1-luca.fancellu@arm.com>
 <20210412105243.23354-5-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <250ee5c2-93c9-a7ae-4038-746fa569166d@xen.org>
Date: Tue, 13 Apr 2021 18:02:10 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210412105243.23354-5-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 12/04/2021 11:52, Luca Fancellu wrote:
> This patch prevents the dom0 to be loaded skipping its
> building and going forward to build domUs when the dom0
> kernel is not found and at least one domU is present.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v3 changes:
> - Rephrase documentation
> ---
>   docs/features/dom0less.pandoc |  7 +++---
>   xen/arch/arm/setup.c          | 42 ++++++++++++++++++++++++++++++++---
>   2 files changed, 43 insertions(+), 6 deletions(-)
> 
> diff --git a/docs/features/dom0less.pandoc b/docs/features/dom0less.pandoc
> index d798596cdf..c9edb529e1 100644
> --- a/docs/features/dom0less.pandoc
> +++ b/docs/features/dom0less.pandoc
> @@ -16,9 +16,10 @@ Multiboot specification has been extended to allow for multiple domains
>   to be passed to Xen. See docs/misc/arm/device-tree/booting.txt for more
>   information about the Multiboot specification and how to use it.
>   
> -Currently, a control domain ("dom0") is still required, but in the
> -future it will become unnecessary when all domains are created
> -directly from Xen. Instead of waiting for the control domain to be fully
> +Currently, a control domain ("dom0") is still required to manage the DomU
> +domains, but the system can start also without dom0 if the Device Tree
> +doesn't specify the dom0 kernel and it declares one or more domUs.
> +Instead of waiting for the control domain (when declared) to be fully
>   booted and the Xen tools to become available, domains created by Xen
>   this way are started right away in parallel. Hence, their boot time is
>   typically much shorter.
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index b405f58996..ecc4f0ae98 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -793,6 +793,38 @@ static void __init setup_mm(void)
>   }
>   #endif
>   
> +static bool __init is_dom0less_mode(void)
> +{
> +    struct bootmodules *mods = &bootinfo.modules;
> +    struct bootmodule *mod;
> +    unsigned int i;
> +    bool dom0found = false;
> +    bool domUfound = false;
> +
> +    /* Look into the bootmodules */
> +    for ( i = 0 ; i < mods->nr_mods ; i++ )
> +    {
> +        mod = &mods->module[i];
> +        /* Find if dom0 and domU kernels are present */
> +        if ( mod->kind == BOOTMOD_KERNEL )
> +        {
> +            if ( mod->domU == false )
> +            {
> +                dom0found = true;
> +                break;
> +            }
> +            else
> +                domUfound = true;
> +        }
> +    }
> +
> +    /*
> +     * If there is no dom0 kernel but at least one domU, then we are in
> +     * dom0less mode

NIT: missing full stop.

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

