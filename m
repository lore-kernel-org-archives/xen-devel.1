Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17FB5C5DF97
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 16:49:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400053.1635984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzGnq-0008Jp-Ht; Wed, 26 Aug 2026 16:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400053.1635984; Wed, 26 Aug 2026 16:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzGnq-0008Ji-F5; Wed, 26 Aug 2026 16:48:42 +0000
Received: by outflank-mailman (input) for mailman id 1400053;
 Wed, 26 Aug 2026 16:48:40 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1wzGno-0008Jc-S2
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 16:48:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzGno-00ChQL-8S
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 18:48:40 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6a8f18d1-8faa-0a2a0a5109dd-0a2a45098cc4-8
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 18:48:40 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6a8f18e8-be1a-0a2a45090019-d155dd2de0c1-3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 18:48:40 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-47f3b39f2a1so923113f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 09:48:40 -0700 (PDT)
Received: from [10.17.80.122] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e2756112sm3487300f8f.0.2026.08.26.09.48.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 09:48:38 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787762920; x=1788367720; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NgE/O1AZRzshLUk9BL0AEIhrigcYhGm+DM3i7xBTKOQ=;
        b=Nw6s9rRkmrYfLIQm1wXBNxFydGi5z2RIbCsYMFOkMSeLObhY+e+3R8EhepGo8XYz7e
         eMsIHKafqK09jYqgI+lPvUW5cplXlAWaIyow5vWlzGqlyMB3piDthAmTFMWWwU5+y5kf
         En3b7bxOugHCXx8Eu0thBjqO/i7TtMzMETz6kCogTQ4t+BhwWrUBhvDw1Q5iC1clP2ot
         o7efg5dDIrU6WekLb3616qwwN4VOFyD38YKreKqkGrPWi4f+HQaC8FjdrCeuNnctoBuU
         WG9SKSdeoMq8lEPeIwtB9OYS9lRaTFXcHjVsY3FAfCF9mR9Yg0Nv+zQIdEwWb2kz8bCK
         m93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762920; x=1788367720;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NgE/O1AZRzshLUk9BL0AEIhrigcYhGm+DM3i7xBTKOQ=;
        b=Yuu0ANgvNYbfiywqdN+JXA/0Zd7fCFsD4UW2tSgVDMOd8W56wxBdqxH5lNGdDEN/ZW
         HlofbCrrK+YsFF51b1aEDYSQs+DueLuOg6LD/V1c3e9X2Ed9dzHyL0XfYjMeCBI7LM73
         EdYAq0aPSd7HmthrGSjGRt+eef76ifO11JTfIcUR5kSyLNHKdvFb+1qJNqwW87zKy3hC
         Lnrq1EM0Gp6CCrvLqr2OCYlqysH3CHqH5rSOlrssQ3Wx9myvE8wfMoYEFwLYUhvt54rg
         ZB/g3sJWkDmrPUn7T8oBzIJ1nzIcsqujhsALGhBX8cwHqNiLfr/SfiY+P3i9UlMU4VBr
         snWw==
X-Forwarded-Encrypted: i=1; AHgh+RpA05NquZHjPdPfBQRU2JW6vgpAXEJrvzBEPjqukWcgT82rG7mZ6flSFAUDGWdNFvNdEBdNYM2GAmU=@lists.xenproject.org
X-Gm-Message-State: AFuF++nt00e3a6Hcjr++d7sAywfhoxeWR5pno5sHXYlFWpuVoYdv9UCT
	pIs9CQGjkcYejW6QbLeqrYg6RTXksmVsBQhnV4hOiaStifaO7epVCOuz
X-Gm-Gg: AR+sD106dnjZN29i3wmijZiiQ3kLIRtgfHhtmzKMrxVtZ1/E9mxGODlbt1pRIPUXny1
	IPCEHUVEOH11vCmInH5xV9O1anfiTA/5ZTbCJXzNFoXHjwKyGRi2NdhkVhQDpmCLn02ZBP1QEQG
	+jMhsWEVezfrqoyYVWKqPuD8rpnOmcKhnVMgpWQIFxHbWauuE+T/Owju2149mkCrT1xq3GlyVVA
	sCXMyua4O1V091IILwbs3hHJaqn5LTUUDHr8qSSj3CCPBQhNQlJZiN82ChTpu+y7ayQRckEZvaI
	HDTGfR1Ttgk5GL7uQSFpeFk0EnlfOyBS+MqFESDy19y+XatRYE7mQPBxfxMFq5feqU0QB3S/wWz
	xqR05l60YgkTPa5rd3ZDRpWIQ+NO3LKcDYE5AMg4I+spjqCtBLpvChEgAdj38klZgLoszLitBF9
	P6uFPSWAsJWNx2yRNYN1EfjW1S5Ihtw/KN0pwP/oXuSypLjlkyM7TQ72LGxhu90mk/RK/h1LkDW
	YvqT5ozMORAo1rL3OF+J09j++LTa5A=
X-Received: by 2002:a05:6000:2f89:b0:47f:d011:f644 with SMTP id ffacd0b85a97d-482e26963f8mr9485572f8f.4.1787762919527;
        Wed, 26 Aug 2026 09:48:39 -0700 (PDT)
Message-ID: <621ee1f0-1ccf-4e6c-909b-4c0ebf594bf0@gmail.com>
Date: Wed, 26 Aug 2026 19:48:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/arm: traps: drop unreachable stage 2 decoding
 from panic_PAR()
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260825062329.16762-1-michal.orzel@amd.com>
 <20260825062329.16762-3-michal.orzel@amd.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <20260825062329.16762-3-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1787762920-3BED6034-517480DE/0/0
X-purgate-type: clean
X-purgate-size: 2811



On 8/25/26 09:23, Michal Orzel wrote:

Hello Michal

> panic_PAR() is only called from va_to_par(), which translates using
> __va_to_par(), i.e. "at s1e2r" on arm64 and ATS1HR on arm32. Both
> perform an EL2 stage 1 only translation, so PAR.S (PAR_STAGE2) and
> PAR.PTW (PAR_STAGE21) can never be set.
> 
> This has been the case since commit a14447dbcf171 ("xen: arm: do not
> panic when failing to translate a guest address"), which made
> gva_to_par() and gva_to_ipa() return -EFAULT instead of calling
> panic_PAR() for guest translations.
> 
> Print stage 1 unconditionally and keep an ASSERT() to document the
> invariant. PAR_STAGE21 has no user left, so drop it. While at it, fix
> the spacing in the decode_fsc() call.
> 
> No functional change intended.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>


> ---
>   xen/arch/arm/include/asm/processor.h |  1 -
>   xen/arch/arm/traps.c                 | 17 +++++++++--------
>   2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
> index 509040a1cdc0..8ee8f88fb4cb 100644
> --- a/xen/arch/arm/include/asm/processor.h
> +++ b/xen/arch/arm/include/asm/processor.h
> @@ -507,7 +507,6 @@ extern register_t __cpu_logical_map[];
>   /* .... If F == 1 */
>   #define PAR_FSC_SHIFT   (1)
>   #define PAR_FSC_MASK    (_AC(0x3f,U)<<PAR_FSC_SHIFT)
> -#define PAR_STAGE21     (_AC(1,U)<<8)     /* Stage 2 Fault During Stage 1 Walk */
>   #define PAR_STAGE2      (_AC(1,U)<<9)     /* Stage 2 Fault */
>   
>   /* If F == 0 */
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index dc0ec8a345ed..1c2bdb7d02c7 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -382,16 +382,17 @@ void panic_PAR(uint64_t par)
>   {
>       const char *msg;
>       int level = -1;
> -    int stage = par & PAR_STAGE2 ? 2 : 1;
> -    int second_in_first = !!(par & PAR_STAGE21);
>   
> -    msg = decode_fsc( (par&PAR_FSC_MASK) >> PAR_FSC_SHIFT, &level);
> +    /*
> +     * The only caller translates using "at s1e2r" (arm64) or ATS1HR
> +     * (arm32), i.e. an EL2 stage 1 only translation.
> +     */
> +    ASSERT(!(par & PAR_STAGE2));
> +
> +    msg = decode_fsc((par & PAR_FSC_MASK) >> PAR_FSC_SHIFT, &level);
>   
> -    printk("PAR: %016"PRIx64": %s stage %d%s%s\n",
> -           par, msg,
> -           stage,
> -           second_in_first ? " during second stage lookup" : "",
> -           fsc_level_str(level));
> +    printk("PAR: %016"PRIx64": %s stage 1%s\n",
> +           par, msg, fsc_level_str(level));
>   
>       panic("Error during Hypervisor-to-physical address translation\n");
>   }


