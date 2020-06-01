Return-Path: <SRS0=DHYy=7O=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46188C433E0
	for <xen-devel@archiver.kernel.org>; Mon,  1 Jun 2020 23:35:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DCF32073B
	for <xen-devel@archiver.kernel.org>; Mon,  1 Jun 2020 23:35:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XeMGKj7B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DCF32073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jftxK-0006N0-Jx; Mon, 01 Jun 2020 23:34:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zqDJ=7O=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1jftxJ-0006Mv-Bv
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 23:34:57 +0000
X-Inumbo-ID: 80488c50-a460-11ea-8993-bc764e2007e4
Received: from mail-pf1-x443.google.com (unknown [2607:f8b0:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80488c50-a460-11ea-8993-bc764e2007e4;
 Mon, 01 Jun 2020 23:34:56 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 131so4147743pfv.13
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 16:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SPELmbQOfJIxeMT9yjj8Ttxr0aEkF6JZGwDFAGf+QKo=;
 b=XeMGKj7BghBcp2AERgXZ3nTBeIoAIUH/QQeOWQNC1SpyJ1js2QYbZMbRSOUVUAt0j2
 ncfOpuATtAdTP94XpGcKXfdqMoTdPJsi9CRR9fGsJS8NL4hIycPoqMeHTRJwkCJb1Zx4
 qTobAVKXDsJVkVIa0rs0QP7WdEF+1We/S+eRQIVQrhP1cR2+K+gyzRvDFA73xoeeGgXl
 iTgkw5DkIVCBy8zLij67PnioIDXU2T4w1kxMyCiTDq66i2GWAKeGYCn5nyQXZu8vLT2p
 Ovw2B7DeBa0jZl6OU8E71U4mhttPCzWLF0KBArl4wt2PIgJ5xh4fsMTTeEp/PFZmfcgq
 ZTGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SPELmbQOfJIxeMT9yjj8Ttxr0aEkF6JZGwDFAGf+QKo=;
 b=l3tJz1pEZLOHXKuK1TcpCsG6oYPefjSDgTgxfO37m/6aWx6jkC3qdd+r5cT0UBIQld
 dCCIbajEFhojqLttK2LI9CMtmhq6yCVSh6vQ4YLC3eVNmNoVKXGS9tsOxBvIgtFxcZBi
 LO3fU1rQ5CxmiSOG4Sncc3UTG03d9+vfZvKmD6B/KGc1TtrTui9BJoXz4YEatGhqSox1
 2hmVJfahSA1UkSGz+PgHWkV0Ta2FqGuifwwBD76njnulRryTvxE6sDt+FLZiKPfzlxBE
 NZKZvZ2EHOxa3LGxxOLcArL/UFx7vKe3gsmptkZ5KhKTjkpiEqAY50q5ixE1ns1o+SoM
 u7aA==
X-Gm-Message-State: AOAM533Xil3emuiP3/balith5MdzFRGP9H+zbWlm4X+JcYx/kW50eYpY
 9urd+k/mMw+A7xs2l88EnstNnQ==
X-Google-Smtp-Source: ABdhPJy70MClJTNM3/F9rCQwlfST2nkGKHtgtJ3ON+z7WX0Mf7Rk+9MNvB5hr4p0gshkq+RehqkyPA==
X-Received: by 2002:a63:d54b:: with SMTP id v11mr8829615pgi.198.1591054495930; 
 Mon, 01 Jun 2020 16:34:55 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p8sm477466pgs.29.2020.06.01.16.34.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 16:34:54 -0700 (PDT)
Subject: Re: [PATCH v2 1/8] hw/arm/aspeed: Correct DRAM container region size
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200601142930.29408-1-f4bug@amsat.org>
 <20200601142930.29408-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0c840231-813a-20a4-62c0-a3d42c33914f@linaro.org>
Date: Mon, 1 Jun 2020 16:34:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601142930.29408-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Paul Durrant <paul@xen.org>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 6/1/20 7:29 AM, Philippe Mathieu-Daudé wrote:
> memory_region_set_size() handle the 16 Exabytes limit by
> special-casing the UINT64_MAX value. This is not a problem
> for the 32-bit maximum, 4 GiB.
> By using the UINT32_MAX value, the aspeed-ram-container
> MemoryRegion ends up missing 1 byte:
> 
>  $ qemu-system-arm -M ast2600-evb -S -monitor stdio
>  (qemu) info mtree
> 
>   address-space: aspeed.fmc-ast2600-dma-dram
>     0000000080000000-000000017ffffffe (prio 0, i/o): aspeed-ram-container
>       0000000080000000-00000000bfffffff (prio 0, ram): ram
>       00000000c0000000-ffffffffffffffff (prio 0, i/o): max_ram
> 
> Fix by using the correct value. We now have:
> 
>   address-space: aspeed.fmc-ast2600-dma-dram
>     0000000080000000-000000017fffffff (prio 0, i/o): aspeed-ram-container
>       0000000080000000-00000000bfffffff (prio 0, ram): ram
>       00000000c0000000-ffffffffffffffff (prio 0, i/o): max_ram
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


