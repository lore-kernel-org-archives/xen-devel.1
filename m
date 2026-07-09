Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696D1C43458
	for <xen-devel@archiver.kernel.org>; Thu,  9 Jul 2026 13:16:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1358150.1612400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whocA-0007bi-Rx; Thu, 09 Jul 2026 13:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358150.1612400; Thu, 09 Jul 2026 13:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whocA-0007bb-Ov; Thu, 09 Jul 2026 13:16:30 +0000
Received: by outflank-mailman (input) for mailman id 1358150;
 Thu, 09 Jul 2026 13:16:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1whoc8-0007bU-LG
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 13:16:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whoc7-003lYt-BR
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 15:16:27 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4f9f27-2eae-0a2a0a5409dd-0a2a45059988-6
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 15:16:27 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4f9f2b-4f1d-0a2a45050019-d155dd35ecbf-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 15:16:27 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-476a130c138so2110261f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 06:16:27 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa0960af0sm47183557f8f.30.2026.07.09.06.16.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2026 06:16:25 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783602987; x=1784207787; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Up++AhkTRfF68GuhCDV6zPQ8lvJqMAWBzh71XSGXVfs=;
        b=WfLPvoUYlJzmD7Z4Fq+JkNFy3cNu9xl6O9eNJPUt++fAq4wBg/VmPfqlEyCsMYcdvx
         0dMeoKjJoFys7WlO5Av3SeAEtqb3Nmjnxr/ExW9duUYnILlhibJ5r5o/5TZhTbsKJHDv
         feFr6b07xrQV6Be+PbEF2VBcZUQL1OcUh2NzrBDdZJdP/NVGV9TSyfIb0SxkkSwguWm7
         Sys5dNXoxyDE6q0s4jrDCht5SauZqdB65HqGmBTFEwpj5L+UnScSSJ/xSEIYZcFa3UID
         KSZqp5s8vlj5/YtouFIZbqTwexL6TeUgC51tvPoBO2L2NvK/MIyVxbWb2c4s3Zn+HP6h
         GBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602987; x=1784207787;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Up++AhkTRfF68GuhCDV6zPQ8lvJqMAWBzh71XSGXVfs=;
        b=bRUITilX/aEnj0QRICmzR8SwogriAi87oOnJGRdC2ERw9YheXT/Zn5WLm9tdykQ4MA
         DW/rgcSgN5gjZHVcGUbQQX2Kwto94jR6em4YUDsOVzMNdTKdlj3EX7gUpra8gMAdiloL
         D8oBnSDNGXeDHIC6ZbIfnK0HJhdu/hxAEWEF12BHobSKt9J6DN8ftJyO04YvIY+5L97w
         v6zGDK6Yg+6xwgP9cRMp/n1p3AwMJ7Sgg9B3fIDJ1GpJAAm9WvG/4oe3nzMmmMNkqIuR
         FBbxL5LULKBJq07zL6izPnNcz54QSIZN8AxhNxyafaQEMvelsh1NmTe/wWL0yz0l4yMz
         gmDg==
X-Forwarded-Encrypted: i=1; AHgh+RpeHFdyADG6sWYAdn7v6q3oxi3sBfvNJua+qsZFA3b68KGXaxEUVVdHr8oPIh5E/5QlPAReUrUPZx8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzk6saBI30GnqWijOwktuqk893s4+N0t5omHRu/+ohgoS0zEQMX
	VaW4NGLKFjaSWL0b+FLzT9iHBZ/vKbA7iquLjKyPWRPTOO50sykwgfOS
X-Gm-Gg: AfdE7clYqPV8G0dfOfPYVKrboHGcw50oZstpgkgl6QQDSB+hXgGW7u/HxLFKfsm2Pz6
	QbpNcaiMwFcnRmrBxncFQaAtAfVzzWiLqi84sKCodhYjS2K4JADxeuz01WLu0UL+8eVkaReLVcy
	QBpVJDtm4hIsnt9HO7x2gXr9At9Aqk3vZq41ESJ+GgH4MZSNeQSA41rBBM3HoUPne1k1bRD1nIm
	pESMnNImxsYZl0JvW06+iDD1Q+5a0gu/UO4dPaof9Xo82i+NRAoZ++pGWXbGVFoe+g0iWlKze8s
	weQTVAsv1V+sEoJU2506RerR/ZF18ui056595QOWrHSreP/HE+DRwJE+DHzVNX80qwTBqE5Ig4D
	n+CcqmTBsiTpHvuvmAvSZ6MP9fOYzSDwzSPtLJbKUsZ4GPB/sO773hujhYJrrAlit/e/BoFsFCt
	RZpqJI9d/gEUcKaruGxhzT5VOeyqOw4SrbWphXtG48roaHSGZSWf9QMtp1h+kb9vCFTuU=
X-Received: by 2002:a5d:5f89:0:b0:470:2fb1:3db5 with SMTP id ffacd0b85a97d-47df075c099mr7656437f8f.30.1783602986386;
        Thu, 09 Jul 2026 06:16:26 -0700 (PDT)
Message-ID: <d64e15bc-0d92-4c06-befb-6784d56983ee@gmail.com>
Date: Thu, 9 Jul 2026 15:16:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.22][PATCH v2] xen/arm: Fail domain construction if a
 secondary vCPU cannot be created
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, ayan.kumar.halder@amd.com
References: <20260709063643.11800-1-michal.orzel@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260709063643.11800-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1783602987-DAF4112E-4DB3DAF6/10/73395122804
X-purgate-type: spam
X-purgate-size: 1942



On 7/9/26 8:36 AM, Michal Orzel wrote:
> construct_domain() creates the secondary vCPUs in a loop, but on a
> vcpu_create() failure it only prints a message and breaks out of the
> loop returning success. As a result the domain can be partially
> constructed with fewer vCPUs than d->max_vcpus. This causes two contract
> violations:
>   - Xen-Guest: domain's FDT is generated before vCPU creation - Xen exposes
>     incorrect information (e.g. two vCPUs listed in a device tree while only
>     one is actually created),
>   - User-Xen: unlike x86, on Arm port we try to bail out as soon as
>     possible on unsatisfied user requests (e.g. user requested two vCPUs
>     for a domain but it was created with only one).
> 
> Return an error instead of breaking out of the loop. Both callers
> (construct_domU() and construct_hwdom()) already propagate a negative
> return value and fail domain construction.
> 
> Fixes: 6b0e8e43348a ("xen/arm: allocate secondaries dom0 vcpus")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> Changes in v2:
>   - return ENOMEM as allocation failure is most frequent cause of failure
>   - update commit msg to focus on unmet contracts
> ---
>   xen/arch/arm/domain_build.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 550617f152bb..72d531618045 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1847,7 +1847,7 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
>           if ( vcpu_create(d, i) == NULL )
>           {
>               printk("Failed to allocate d%dv%d\n", d->domain_id, i);
> -            break;
> +            return -ENOMEM;
>           }
>   
>           if ( is_64bit_domain(d) )

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

