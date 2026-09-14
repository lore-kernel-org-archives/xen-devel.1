Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E6FC88E75
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 15:15:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1421083.1647212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x68P0-0001SA-E4; Mon, 14 Sep 2026 15:15:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1421083.1647212; Mon, 14 Sep 2026 15:15:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x68P0-0001S3-B1; Mon, 14 Sep 2026 15:15:26 +0000
Received: by outflank-mailman (input) for mailman id 1421083;
 Mon, 14 Sep 2026 15:15:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x68Oz-0001Rx-5x
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 15:15:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x68Oy-00HFR2-1S
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 17:15:24 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa80f7c-e002-0a2a0a5209dd-0a2a4508e680-26
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 17:15:23 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa80f8b-f659-0a2a45080019-4a7de14cb474-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 17:15:23 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-485984ebf5cso1731564f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 08:15:23 -0700 (PDT)
Received: from [172.18.123.208] ([185.104.138.149])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb32e8d1sm28048390f8f.11.2026.09.14.08.15.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 08:15:22 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789398923; x=1790003723; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NuF/cpRbw+GzcHinI5yNpRgxXswL5i7y2FE8bwjfAKY=;
        b=c/T8N/ezeRO+0sn3gec80chBKgNkMY9Ezi2Cg82DB7ASWv97jhTAHuTGdUUaIYVMF1
         xJZjq0cZFujjpd8h8T+xtijnFvXj35X4YE717RGzE00b79voyCvZSEhlIZgTVHNAGrvq
         pqPdpYxqlP88H/W+MmNfR54zrG0wWaCzNa904StXQ0fdeFevvUFJJmQanjFKmOIs+UcB
         3TKCvdg+Sm4fxmx1u2tEvH13du+/TQ2wlSfq/BbQhvVbKqnAwSS480FgTuoBBQfQNxHU
         vYEJCaN3dayDLfgjhnY9p0o3p/pegthx+ZkqNE3w7whrjkDR3UxuW1T8/CkO9TOEGVqS
         C9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398923; x=1790003723;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NuF/cpRbw+GzcHinI5yNpRgxXswL5i7y2FE8bwjfAKY=;
        b=p/+chJAmoHnAj51IdJGB9SljmYIR8197McIpNqjSSvTdU3HXxrLdz62YetpMRjQwRO
         hrnVXiXlNTJPzQykiB02sJiDz6F1RUFXFQ0rt+7e/CQoROnDLj4Yu0mIPq9g032grHsC
         7gylDDdu27R2M1oP0ZhPTJzyCOtKXTOF8BY5dnu23Qv7nDEd67M16t9rlwfcN06yqhDd
         eE8ztMG52rUJj46NmOwR9BBDPkxnmYUboc+joGGSnxaFob6j+GksCIMIUbASh/8PLLzL
         kkeUchNdtMfm09V2m5/G0iZeGf/YUoGnuMS53m0KRlLdp98YSPEIFhsDs6Dtt2Ele8+x
         QddA==
X-Forwarded-Encrypted: i=1; AKwUvBxw1VrjcFnLaLxX+UZvD4nMNX0zyZcDXvvsL+yG+/x/ZRa15+COVMSdqmZ1OEiGTlAEaAE2pHaBAbQ=@lists.xenproject.org
X-Gm-Message-State: AFuF++n3RC1UbjzydDU0L/4wrYHXoGj1/YjgJLCVxRGGc7w4jH5XwJBC
	WYfJHI2u4J2CbaSo4ApW1MB9l/yVNajhoPkJSXSDWy8hNQqt/ylQ2z9jFpe68IkYJQ==
X-Gm-Gg: AYBFou23JTksErlh61izXNdTAsS9kXgrWSKvgQzy75wbCU6Omy7bmBUfZsuG1yh4Tqe
	pHMJHGO39QkSqFBJe65rp74qJbL68YCxK0tS/L8t1nRvmVkbnJ6d5uVFmlS14KpTf+9h0MQaPs8
	Y2bStucgBrx+kXQ/Pu/YmamTsxzHJU0bkHn/LNfPcnpr9E2W/f8Mp4wQB1gWFA3N53iA9GEfXFE
	URZomd4Bvf43RzESGkJoooxf7Qew5ssdvExOmnuFE+UVAlOKccJZk2Hpkum6Z8qHeMWMjhl+GmM
	tOUQu/t/MEC89UWISokwjsbZfSZ3zWwcmhdPmpA87xxVLn0UO0+uTw6jmIBgc9aMGcDL1dTnmwJ
	p5EkRAa7grtgKPbfJB//xrWp7CILVaPCneQFHy2A8zHpNZoftZd362RpMPhOjBZEl+WjjpYNebt
	GPvxyZ1ZZqixHk6Iq4SAbojo4qGniK3Vew7tHLszlCMCRhTFpVKnNPt3ajfLch+BahngdgU9ZGM
	HM6hhFl45Et
X-Received: by 2002:a05:6000:1861:b0:485:9b35:a20e with SMTP id ffacd0b85a97d-48702b30773mr3580941f8f.56.1789398923193;
        Mon, 14 Sep 2026 08:15:23 -0700 (PDT)
Message-ID: <f8a2c7b7-7872-424c-89e0-5d81a29b77f4@suse.com>
Date: Mon, 14 Sep 2026 17:15:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 33/39] xen/riscv: dump old interrupt file to memory
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <efecffa9cd7c4bb6e9ed51b7fd084328fcd4611e.1787838835.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <efecffa9cd7c4bb6e9ed51b7fd084328fcd4611e.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1789398923-D694287B-276EDC7B/0/0
X-purgate-type: clean
X-purgate-size: 3213

On 27.08.2026 17:21, Oleksii Kurochko wrote:
> At the old interrupt file, dump to memory all the eip and eie arrays).
> After this step is done, the old interrupt file is no longer in use so
> old intrrupt file VGEIN could be released.
> 
> Restoring of old interrupt file state will be done in follow-up
> patch.
> 
> There are cases where it is needed to specify on which cpu it is
> necessary to VGEIN should be released so update vgein_release() to
> deal with that.

Beside this being difficult to parse, it looks like it is inapplicable? As
said ...

> Keep BUG_ON("unimplemented") placeholder in imsic_migrate_vcpu() to guard
> against silent incorrect behaviour or unexpected panics in guest VMs until
> the function is fully implemented.
> 
> vgein_release() is stub for now and will be introduced later.

... also here?

> --- a/xen/arch/riscv/imsic.c
> +++ b/xen/arch/riscv/imsic.c
> @@ -56,6 +56,24 @@ static unsigned int __ro_after_init guest_num_msis;
>   */
>  #define GUEST_IMSIC_MAX_MSIS 255U
>  
> +/*
> + * The interrupt identities an IMSIC interrupt file provides are 0 (which is
> + * never valid, but still occupies a bit) up to IMSIC_MAX_ID inclusive, so
> + * IMSIC_MAX_ID + 1 bits have to be covered.
> + */
> +#define IMSIC_MAX_EIX DIV_ROUND_UP(IMSIC_MAX_ID + 1, BITS_PER_TYPE(uint64_t))

As before - plain 64 please, or it needs to become clear where the uint64_t
is actually coming from.

> +struct imsic_mrif_eix {
> +    unsigned long eip[BITS_PER_TYPE(uint64_t) / BITS_PER_LONG];
> +    unsigned long eie[BITS_PER_TYPE(uint64_t) / BITS_PER_LONG];

Same here. Yet better may be to use DECLARE_BITMAP()?

> @@ -85,6 +103,15 @@ do {                            \
>      csr_clear(CSR_SIREG, v);    \
>  } while (0)
>  
> +#define imsic_vs_csr_swap(c, v)     \
> +({                                  \
> +    unsigned long r_;               \
> +                                    \
> +    csr_write(CSR_VSISELECT, (c));  \
> +    r_ = csr_swap(CSR_VSIREG, (v)); \
> +    r_;                             \
> +})

Excess parentheses again. Plus - what use is r_ here?

> @@ -130,6 +157,21 @@ do {                                \
>      imsic_switchcase_32(F, ireg + 0, ##__VA_ARGS__) \
>      imsic_switchcase_32(F, ireg + 32, ##__VA_ARGS__)
>  
> +static unsigned long imsic_eix_swap(unsigned int ireg, unsigned long val)
> +{
> +    switch ( ireg )
> +    {
> +    imsic_switchcase_64(imsic_switchcase_ret, IMSIC_EIP0,
> +                        imsic_vs_csr_swap, val)
> +    imsic_switchcase_64(imsic_switchcase_ret, IMSIC_EIE0,
> +                        imsic_vs_csr_swap, val)
> +    default:
> +        ASSERT_UNREACHABLE();
> +    }

There still wants to "break" in the default case.

> @@ -973,5 +1071,11 @@ void imsic_migrate_vcpu(struct vcpu *v)
>       * to the new IMSIC VS-file.
>       */
>  
> +    /* Read and clear register state from old IMSIC VS-file */
> +    imsic_vsfile_read_clear(old_vsfile_id, old_vsfile_cpu, nr_hw_eix, &tmrif);

Why is &tmrif being passed into the function, when it's not otherwise used
here? The function could itself have a suitable local var.

Jan

