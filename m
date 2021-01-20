Return-Path: <SRS0=FMYz=GX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4CC7C433E0
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 15:12:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 742592336D
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 15:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 742592336D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.71550.128182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2F9v-0004Bi-Je; Wed, 20 Jan 2021 15:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71550.128182; Wed, 20 Jan 2021 15:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2F9v-0004Bb-GH; Wed, 20 Jan 2021 15:12:35 +0000
Received: by outflank-mailman (input) for mailman id 71550;
 Wed, 20 Jan 2021 15:12:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l2F9u-0004BW-98
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 15:12:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2F9s-00032r-Ui; Wed, 20 Jan 2021 15:12:32 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2F9s-0002hY-Mr; Wed, 20 Jan 2021 15:12:32 +0000
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
	bh=U+OhN+94E24VyjWt5Gh3oE7VskapI4soYT35Y4uA7CQ=; b=FE9hFvPPAV5yyhuUNqUAVJCtjb
	jLqyJ6/Zu+GkBdQ4YIP4rHidp11pSsvJdFWG4/jW7Mq9KTv9AZTnvY5pyWFh++x2NB0Qb4y7DUqRr
	1gAHyp5kbTIVdsKvIYaEBSlNDh1vg+QKezq5ODIs+qDdmlmCtYrDArSGDtvXLrBZh4Uo=;
Subject: Re: [XEN PATCH] xen/arm: Relax GIC version check
To: Vladimir Murzin <vladimir.murzin@arm.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Volodymyr_Babchuk@epam.com,
 Ian Jackson <iwj@xenproject.org>
References: <20210120112644.8882-1-vladimir.murzin@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5df5270d-216b-3f14-5416-bd3a12da3650@xen.org>
Date: Wed, 20 Jan 2021 15:12:31 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210120112644.8882-1-vladimir.murzin@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

(+ Ian)

Hi Vladimir,

On 20/01/2021 11:26, Vladimir Murzin wrote:
> Supported values are
> 
> 0b0000 GIC CPU interface system registers not implemented.
> 
> 0b0001 System register interface to versions 3.0 and 4.0 of the GIC
>         CPU interface is supported.
> 
> 0b0011 System register interface to version 4.1 of the GIC CPU
>         interface is supported.
> 
> 4.1 is still backward compatible with 4.0/3.0, moreover ARM ARM
> guarantees that future versions of the GIC CPU interface retain
> backwards compatible.
> 
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

@Ian: I would like your put as the RM for 4.15.

Technically, it could be consider as a new "feature" because Xen would 
fail to boot on such HW.

However, I think the change is small enough and doesn't introduce risk 
on existing supported HW.

Therefore, I would like to merge it for 4.15. @Ian does it sounds good 
to you?

> ---
>   xen/include/asm-arm/cpufeature.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
> index 13a2739a6..c6e5711b2 100644
> --- a/xen/include/asm-arm/cpufeature.h
> +++ b/xen/include/asm-arm/cpufeature.h
> @@ -17,7 +17,7 @@
>   #define cpu_has_el3_64    (boot_cpu_feature64(el3) >= 1)
>   #define cpu_has_fp        (boot_cpu_feature64(fp) < 8)
>   #define cpu_has_simd      (boot_cpu_feature64(simd) < 8)
> -#define cpu_has_gicv3     (boot_cpu_feature64(gic) == 1)
> +#define cpu_has_gicv3     (boot_cpu_feature64(gic) >= 1)
>   #endif
>   
>   #define cpu_feature32(c, feat)         ((c)->pfr32.feat)
> 

-- 
Julien Grall

