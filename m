Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEBC606D836
	for <xen-devel@archiver.kernel.org>; Sat,  7 Nov 2026 14:14:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1478127.1683075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPhBX-0002ZL-Qd; Sat, 07 Nov 2026 14:14:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1478127.1683075; Sat, 07 Nov 2026 14:14:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPhBX-0002ZD-MJ; Sat, 07 Nov 2026 14:14:23 +0000
Received: by outflank-mailman (input) for mailman id 1478127;
 Sat, 07 Nov 2026 14:14:22 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien.grall.oss@gmail.com>) id 1xPhBW-0002Z7-NS
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2026 14:14:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPhBW-004Yn9-4H
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2026 15:14:22 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <julien.grall.oss@gmail.com>)
 id 6aef3223-bab6-0a2a0a5309dd-0a2a450be040-12
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 15:14:21 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <julien.grall.oss@gmail.com>)
 id 6aef323d-b7e8-0a2a450b0019-d1558033c8ca-3
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 15:14:21 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4ac95761c85so10272935e9.2
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 06:14:21 -0800 (PST)
Received: from [10.0.0.150] (gw1.octic.net. [88.97.20.152])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d7700224sm9949440f8f.33.2026.11.07.06.14.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Nov 2026 06:14:20 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794060861; x=1794665661;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EYfic+ErV0k2GxDlyiMpLBqxzLX4Eizzx2y73VP38rM=;
        b=ab2cpJm1C0JMFMUQn/BPZ03wdEWKhXcmpvYkHoF038ywZARxR3pWoAx8amDfjvE8Xd
         PT6bP8zWeJs3iB+qyZ/nnO0w0niwsWnkHs9AiK8c0mLAvzZVr0jKDcr9tefruR5p0H77
         vnNVzrdpkFZD41Ox7xJnWlEaf22fsTQhUutUwc898UIIXoBZNcLlFundsMFad8ZW/1mB
         3KOA2PMQyLhHtF/vJE2TJYxKtqM2mIqniy5/j7RNNZEZwX/5OxaFGPx2Qs0MiutBqiih
         yjeTEV8UqEs4AMMtMvZSKu95RHztSApvIMAFDztJUp7CTrc5Lu9IyBKUVzioZ5DvdGKe
         5H/g==
X-Forwarded-Encrypted: i=1; AKwUvBxhxVruyqnGMJO/ZC1Eo26Ak6Demm4BGNkBcrMvdGqRhlL3MIqjJW7snd+ug67MovIuyYIXzl6cSxg=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8VwgbREtT5mANCBFY/Fp9Y2e8sAoHywocsm6vpq0GADUpGHRIb
	62x4i/vciFTp3o5x80ARpg7EnaVS47sZGuMi3u3KkYiqRJ6hoHTQ89/B
X-Gm-Gg: AYBFou2vqqMzD588Ks5nZEFOgvR2MlW46ho0gwjVaKkjqpsJ+NBebk6gdW34GETME9U
	vRwE9SmYBq3ZbZey4X0F1PHOeSpgNcqM0MsVPlmUfDPW2mZZ2d7cxMRFRpl1SODbEHRWK7QsxgA
	tr4MYieFPlF47yzvxxPfUGJzEZrsiSWqP52DSkfO00M2jvUdCp7Yg43IL6ObYFVaVE5a+9AAndo
	qlIWsIDWpkh9R+g/wfUC4PBboU/pJw3pTSEu6L8zV0+CRVW2ohsHhYXPWB+fc3oKO2/6qyuyUXS
	n7Nava+t9L87gZodJCn1WkHzByCp6vLm2NssRbYXZvtz6ioawaebV9DhPmw2RNfqy6ymKKqI4x7
	QFvZiMd8bw8YNnepn2pryZKhPunYxq4hev/mUPc0Hqw2CkbKFHUMVuosClqGE7g3CgA8gOcibQ8
	qulOMRyEO+Ach6tuEeAXhPQSUn8GoObPoCBaQupJwP3quPuRVDm1gg2DAEr5ehmi9nNac7B007V
	WYnkmUQGRRs+pU3CABblQcWrtbovyfe7Z53IdnXDcOzQsAWOuERUQDdie5Ukt1wPv3fb07d0tTY
	dw9aAMrVH8QEqI0tf+yRsMHmf5KTb2PPkjwuLouf65sn
X-Received: by 2002:a05:600c:5391:b0:4b1:4da2:ca99 with SMTP id 5b1f17b1804b1-4b6dd82a9aamr94230635e9.10.1794060861076;
        Sat, 07 Nov 2026 06:14:21 -0800 (PST)
Message-ID: <2f9ea791-5422-42a3-8c04-4203336109f5@xen.org>
Date: Sat, 7 Nov 2026 14:13:05 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] xen/arm: guest_walk: refuse a block descriptor where
 the granule has none
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20261107021442.253612-1-stefano.stabellini@amd.com>
Content-Language: en-GB
From: "Grall, Julien" <julien@xen.org>
In-Reply-To: <20261107021442.253612-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1794060861-1AAD89EA-623A101A/0/0
X-purgate-type: clean
X-purgate-size: 2430
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Stefano,

On 07/11/2026 02:14, Stefano Stabellini wrote:
> guest_walk_ld() accepted a block descriptor at any level. No granule has
> level 0 blocks, and the 16KB and 64KB granules have no level 1 blocks
> (ARM DDI 0487A.k D4.3.1): the translation table walk makes such an entry

It would be good to quote a specification that is a bit newer (A.k was 
release in 2016!). In recent spec (M.d), it seems you can have level 1 
blocks for 16KiB and 64KiB when 52-bit is supported.

Looking at the logic in get_ipa_output_size() we are rejecting 52-bit at 
the moment. So the check you add is fine as-is. I think it would be made 
more clear in the commit message and ...

> a Translation fault (AArch64.TranslationTableWalk(), J1.1.5). Refuse it.
> 
> Fixes: 7d623b358a45 ("arm/mem_access: Add long-descriptor based gpt")
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Bertrand Marquis <bertrand.marquis@arm.com>
> Cc: Michal Orzel <michal.orzel@amd.com>
> Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> ---
>   xen/arch/arm/guest_walk.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/xen/arch/arm/guest_walk.c b/xen/arch/arm/guest_walk.c
> index 09fe486598..e23457869b 100644
> --- a/xen/arch/arm/guest_walk.c
> +++ b/xen/arch/arm/guest_walk.c
> @@ -533,6 +533,15 @@ static bool guest_walk_ld(const struct vcpu *v,
>       if ( !lpae_is_valid(pte) || !lpae_is_mapping(pte, level) )
>           return false;
>   
> +    /*
> +     * A block descriptor is only supported at level 1 and level 2 with the
> +     * 4KB granule, and only at level 2 with the 16KB and 64KB granules (ARM
> +     * DDI 0487A.k D4.3.1). The block encoding at any other level generates a
> +     * Translation fault (AArch64.TranslationTableWalk(), J1.1.5).

... the comment that this is only valid for 48-bit. I would also 
recommend to update the comment in get_ipa_output_size() to mention this 
check would need to be updated. Alternatively, you could check the 
ipa_sizes now.

> +     */
> +    if ( level == 0 || (level == 1 && gran != GRANULE_SIZE_INDEX_4K) )
> +        return false;
> +
>       /* Make sure that the lower bits of the PTE's base address are zero. */
>       mask = GENMASK_ULL(47, grainsizes[gran]);
>       *ipa = (pfn_to_paddr(pte.walk.base) & mask) |

Cheers,

-- 
Julien Grall


