Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8D2C5DF97
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 15:48:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400017.1635956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzFr8-0006R5-Pj; Wed, 26 Aug 2026 15:48:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400017.1635956; Wed, 26 Aug 2026 15:48:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzFr8-0006Qy-N5; Wed, 26 Aug 2026 15:48:02 +0000
Received: by outflank-mailman (input) for mailman id 1400017;
 Wed, 26 Aug 2026 15:48:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1wzFr7-0006Qs-5u
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 15:48:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzFr6-008cOu-J5
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 17:48:00 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6a8f0aaf-e002-0a2a0a5209dd-0a2a4508a264-6
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 17:48:00 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6a8f0ab0-f659-0a2a45080019-d155802ab0f7-3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 17:48:00 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-49b0dbfbf7bso366025e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 08:48:00 -0700 (PDT)
Received: from [10.17.80.122] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499dc981bf3sm31219935e9.8.2026.08.26.08.47.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 08:47:58 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787759280; x=1788364080; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XReb/tURPpSv7wHa2G008+5hJ+djpIqcqcy5gPwUZsM=;
        b=h/4cSV1zs54cHvOCjP1yuHhg7OG5y2ScODkmNbWujKyseLLp1WCfDNXkGYid9LI+jN
         giMPRuTkn6p8Sr1G3b+FWI42fFz6tKe2S3FJAEf5CRPqkZ2gMorDS0jZUVTse8DiiO+w
         akxiMNVdsAABrBKHXpRrQFLQuZ6OLC/Jti8wQlph3phkyvdqeyzHDIA2yOm3+L35mDXA
         lNnDYljV1/7wCwM00n8YknbEM+HXllCsjJLuzaaaUurzc+Gd4/IoeBKLDnFI9ILRpaJw
         gSy97K7ZGU832cPWjtQpo+pEtq+NmIWnFbZxaLgrKlpVSJkCzoiQHFkBSwmFhNODSAOm
         EjSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787759280; x=1788364080;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XReb/tURPpSv7wHa2G008+5hJ+djpIqcqcy5gPwUZsM=;
        b=YduvQt9FtwF+xlB/3u+glh/GqkLG7QLDKBm5eVP/k3a964ijUF8we/EX5B5vlaGTW3
         xaU2g4742GyIdHF2+VRiA1R7GDcvaMcn9O3jrfu8yDH3hEcfaF1VxWY4b6TGDzKv6/Kx
         /2uTJ/JgBOTGs0szkKuSj3uI/sW7iqrt1IeC34JWqtRFcrRfkEHcUykLK2m/ubRV3U9n
         LqAhDgbGXjubSDfdFhiEeYxpTFwkiktyMf/DyscANG6uut3cQWKktxNXupfYeZrXKnNM
         +ZcxW5Bp0NhuJTUIujN4sNvvfseN6T0WRJZvkLEF1vSI/Pd1aWHdgOV/VXDm1AKiMDvD
         FKTA==
X-Forwarded-Encrypted: i=1; AHgh+RrnU26Sl92Mld2bHJ9lYuY81HYAlNdd/J491NAgGWD2KkTaeqpmGW0VZwbl913VT9Sl/jE72tfuXNY=@lists.xenproject.org
X-Gm-Message-State: AFuF++lAYJpToAUp8GaExnvTb8s2h2hiuLuzBeAhoNYNubVLwAZOoE0D
	Lv7F8Ei2MUMSJnYCZgsqd73O8D+Fo+RfKNR8ZsnfvEGdZ4/dWdzeFYGy
X-Gm-Gg: AR+sD10NU9RjekcIwu0+5SRub831PttGBZRJbNT6v08xS5fVW95Z8emLmrTwRoy9poh
	DH8e+9J5LxEiMF+l8tFBBDaENzjpUU/n3/+Lpzxo1l3XRg+RYv0zdGMEroqePGG4XeC0/HEIwqy
	NRZ0me0eVzadsVc2uRHswyJ2gxAXqLN3Wsn25Csn7ij1flo+ZvA9dLq8DlWj+GEC+9XGajN/KXv
	vLEzcxtFNJhtDcQmYcVP7zoZz4jQaYBgncgvAs7DiWH1HIVVFxOnVJZn76Z21VsAVv56XWm4pyO
	ULdop6K3PB7orxeTjKg05gbYMmzOzg3aYYB0Wq+6MjgjSiNbrY4vu5/CrCAf8ME1WojuQjO06IK
	spuQbn3ME/x/6jPASVfx+jRbGfVcnqtIDuZSIRA/ePolQZvnhD/JdNaCBm453fPZtBt7ilBlNjB
	9sRu0vZgyuQ+c4BxAr7O5BpfCrDSfzgPxIuPYhjVKgpcJ8LDlXvP4f087ny64hMKLbgQNQPALmw
	DWaA8IDfClOF7FqxFtOkg==
X-Received: by 2002:a05:600c:8518:b0:499:a5c8:c6f3 with SMTP id 5b1f17b1804b1-499dc6e998cmr83031495e9.3.1787759279703;
        Wed, 26 Aug 2026 08:47:59 -0700 (PDT)
Message-ID: <c576b8de-b149-4d60-bc7d-436e06039832@gmail.com>
Date: Wed, 26 Aug 2026 18:47:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/arm: traps: report level 0 faults in panic_PAR()
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260825062329.16762-1-michal.orzel@amd.com>
 <20260825062329.16762-2-michal.orzel@amd.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <20260825062329.16762-2-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1787759280-CD94A87B-040E9015/0/0
X-purgate-type: clean
X-purgate-size: 3260



On 8/25/26 09:23, Michal Orzel wrote:

Hello Michal


> decode_fsc() derives the fault level from the low two bits of the FSC, so
> level 0 is a valid output: FSC_FLT_TRANS is 0x04, i.e. "translation fault,
> level 0".
> 
> This is reachable on arm64 because xen_pgtable is the zeroeth-level root,
> but fsc_level_str() has no case for it and prints " (level invalid)"
> instead. At the time the function was created Xen used only three levels.
> 
> Add the missing case. On arm32 the zeroeth level does not exist, hence
> guard the case by CONFIG_ARM_64.
> 
> While at it, make decode_fsc() decode also address size faults.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>


Patch looks ok to me, so:
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

but I have a comment below:

> ---
>   xen/arch/arm/include/asm/processor.h | 2 ++
>   xen/arch/arm/traps.c                 | 8 ++++++++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
> index a3753c317fff..509040a1cdc0 100644
> --- a/xen/arch/arm/include/asm/processor.h
> +++ b/xen/arch/arm/include/asm/processor.h
> @@ -521,6 +521,7 @@ extern register_t __cpu_logical_map[];
>   /*
>    * 543210 BIT
>    * 00XXLL -- XX Fault Level LL
> + * ..00LL -- Address Size Fault LL
>    * ..01LL -- Translation Fault LL
>    * ..10LL -- Access Fault LL
>    * ..11LL -- Permission Fault LL
> @@ -534,6 +535,7 @@ extern register_t __cpu_logical_map[];
>   #define FSC_TYPE_OTH   (_AC(0x02,U)<<4)
>   #define FSC_TYPE_IMPL  (_AC(0x03,U)<<4)
>   
> +#define FSC_FLT_ADDR_SIZE (0x00)
>   #define FSC_FLT_TRANS  (0x04)
>   #define FSC_FLT_ACCESS (0x08)
>   #define FSC_FLT_PERM   (0x0c)
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 0c01f37ad6b4..dc0ec8a345ed 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -307,6 +307,10 @@ static const char *decode_fsc(uint32_t fsc, int *level)
>   
>       switch ( fsc & 0x3f )
>       {
> +    case FSC_FLT_ADDR_SIZE ... FSC_FLT_ADDR_SIZE + 3:
> +        msg = "Address size fault";
> +        *level = fsc & FSC_LL_MASK;
> +        break;
>       case FSC_FLT_TRANS ... FSC_FLT_TRANS + 3:
>           msg = "Translation fault";
>           *level = fsc & FSC_LL_MASK;
> @@ -363,6 +367,10 @@ static const char *fsc_level_str(int level)
>       switch ( level )
>       {
>       case -1: return "";
> +#ifdef CONFIG_ARM_64
> +    /* On arm32 the zeroeth level does not exist */
> +    case 0:  return " at level 0";
> +#endif


NIT: Before this patch fsc of 0x00 fell through to default, so it 
printed "Unknown Failure" and level stayed -1. After the patch Arm32 
decodes 0x00 as an address size fault and sets *level = 0, while case 0: 
in fsc_level_str() is compiled out there, so the print becomes "Address 
size fault (level invalid)". So I would either drop the #ifdef (to keep 
the two hunks consistent), or not set the level on Arm32.

That said, I will not insist on the change, my R-b stands either way.


>       case 1:  return " at level 1";
>       case 2:  return " at level 2";
>       case 3:  return " at level 3";


