Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E591ECA5FC5
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 13:56:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437312.1656168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBunY-0001St-QG; Wed, 30 Sep 2026 13:56:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437312.1656168; Wed, 30 Sep 2026 13:56:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBunY-0001Sm-MS; Wed, 30 Sep 2026 13:56:40 +0000
Received: by outflank-mailman (input) for mailman id 1437312;
 Wed, 30 Sep 2026 13:56:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBunW-0001Q1-KL
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 13:56:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBunV-00CbA4-IN
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 15:56:37 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd1500-2eae-0a2a0a5409dd-0a2a4509c584-36
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 15:56:37 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd1515-be1a-0a2a45090019-d155802da528-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 15:56:37 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a01b560392so2309145e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 06:56:37 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b029be71csm4162887f8f.9.2026.09.30.06.56.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 06:56:31 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790776597; x=1791381397; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ffDnjrv5gtZeAI6GHrZp9yvaTY/ZRPVjxIMSX8/YOkI=;
        b=NR/D02AOQM/FjdBmMCwjos9+yT1aTjHqwBNJWSGTZS93Kc0JURMoKDRCQtdx5wCfMr
         gMbQ7WqbS3YmDcbzGQi0HJqwDlitW7mjUPaL723XvgYQ9Kb2lNW/i43xgx6iP1m91zkL
         XWIERuAA9E4BqXQosTdq9Kdc5aEJcLMl0/fvi1vHKmX1jxzrLH8zlUefW21YuDIiG2qz
         PzXWfOyQ2SrbpNc4JiNP7OVPyEVQyzthLxgcV9w2MDXNiwb9rK/9oHW9cytwNGdO/wzG
         afdoumJksSWoJjn6RC6FqNHmFG5/K6gO7vscekJ+DQDYH3w7Kku0PgMI2/mrXgEzOCAJ
         V5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790776597; x=1791381397;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ffDnjrv5gtZeAI6GHrZp9yvaTY/ZRPVjxIMSX8/YOkI=;
        b=g7Z45JhIWOY+0p2FuaJ2O55zifpnC0VMl+U8Wvt/uDSp7nOJCW9BGvjUDMNFW2LWLF
         97M4cRl9FVH4TMk/0E3Q/LzYu1j3/ks+z8JIjeDc2uAz8DbNiiJB4eEChoJ3Zcv4AiF9
         8hJCZPZeRSqsLvFpnOEBuH5T6o1pAbPLEP4nt6n+u170zMKpxZufdsh+b1tgrzubB8gU
         IN2ZHC7vFawZZCkorbNz7nyKJcvyBSATknbxB4c/RAw2f4DN/TFEm9EFUfbb02IBpk2e
         3tCPW2cU8i/g9CLlTtJsb2AhNyhT9pShvpmhpDA22arWCylhQ2wyRJcBdYg2MqUlQcN4
         iziw==
X-Forwarded-Encrypted: i=1; AKwUvBwC3g//x5V1gmS3h+ZuBiFlcG9fbbKrUzVCirPtHUGVxkZxaW17IE6YCNSjZwz53y1EvEZmQHixZzU=@lists.xenproject.org
X-Gm-Message-State: AFuF++mx/IXYsujYEuQ/Yp7cTNhLo1cZ0opABKgiUpoG5f0xx0OlZbKN
	Uona8Jz0Y+8H7Dds6M+gIBD/zqAUaMGRZDdHqP0/0HKqk9SfOjNQ/FJ9
X-Gm-Gg: AYBFou3zNjl6O/+i+v/qQhmGw+OMHN8b1+vM1sVijTuLWo1H/e0KsNSoT4gNsWS41CM
	+ijPhEGVlH1Zh7rjfP24qGNjh4jq4c8s+X9kTu9XhdvwI7VsZwgf81z0HCU9f7PUUxw4ekvjr7U
	ZCVYUmJNQ75c3Hq6ivg3XMPniw2f3gaJctV2AtIkQyATPF4gqZEscJ3A5tvGGBboIZeruFlGV3Q
	0tC3OCLQGAx8Iys7vt+N3dvyGVLojAT2FMLvl9JMGg8wZ9f/aSKHpTlKY4GBuLXgi1XbiVjhtj2
	YdHlRZqagAUS5mY2wD3S1v143g4nv7sKJI3pEI8jmUsnRHEfu7+mWc5ubX/oHTEs2fdvwY6PwfS
	WOcQHdODhZWlg/IKOqOXUOX4oTDE92WDDx4Xt8EkVduyIDxKYC6LbpdU4Q+y28CLdQoQi//eSmB
	oosS/pI6lWkQsIkJJ6yVhVwQ4j1+eV+UgCqM9YzjRDYeE9WdvKNJGEQharx9jKxt88JrpG5tRfQ
	o5VJskvpGxNzfO98nafqKMh3+TK8DZcecbRTbJos3DM+TSVPw==
X-Received: by 2002:a05:600c:47c9:b0:4a0:1c92:f989 with SMTP id 5b1f17b1804b1-4a01c92f9c2mr9406055e9.12.1790776596879;
        Wed, 30 Sep 2026 06:56:36 -0700 (PDT)
Message-ID: <aff1e60a-0420-4c44-8c65-b05f9e21a0b5@gmail.com>
Date: Wed, 30 Sep 2026 15:56:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] xen/riscv: rename PTE "permissions" to "pte_flags"
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, xen-devel@lists.xenproject.org
References: <1790699381.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@vates.tech>
 <1790699585.8631fc262581453bbf619ec5b2062170.1a0ee033eb9000b504@vates.tech>
 <9f94af4b-f122-46e0-bbc4-7fecd51d4348@gmail.com>
 <f93e6f0d-0ceb-4db6-91f8-d571503ca58c@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f93e6f0d-0ceb-4db6-91f8-d571503ca58c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1790776597-BFCD7034-45D54B9B/10/78276251493
X-purgate-type: spam
X-purgate-size: 2362



On 9/30/26 3:54 PM, Jan Beulich wrote:
> On 30.09.2026 15:42, Oleksii Kurochko wrote:
>> On 9/29/26 6:32 PM, Baptiste Le Duc wrote:
>>> paddr_to_pte()'s "permissions" parameter, the matching local in
>>
>> Nit: s/the matching local/the matching local variable?
> 
> What else could "local" on its own mean here? I think it's common
> shorthand for "local variable".

I didn't think in that way. Now I agree that it is fine.

> 
>>> setup_initial_mapping() and p2m_set_permission() don't only deal with
>>> permission bits: they also handle PTE_VALID, PTE_USER, PTE_ACCESSED and
>>> PTE_DIRTY.
>>>
>>> Rename them to "pte_flags" and p2m_set_pte_flags() respectively.
>>>
>>> No functional change.
>>>
>>> Requested-by: Jan Beulich <jbeulich@suse.com>
>>> Assisted-by: Claude:claude-opus-5
>>> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>>> ---
>>> Changes since v2:
>>> - new patch
>>> ---
>>>    xen/arch/riscv/include/asm/mm.h | 5 +++--
>>>    xen/arch/riscv/mm.c             | 8 ++++----
>>>    xen/arch/riscv/p2m.c            | 4 ++--
>>>    3 files changed, 9 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
>>> index 9e28c24954..1ac66283ec 100644
>>> --- a/xen/arch/riscv/include/asm/mm.h
>>> +++ b/xen/arch/riscv/include/asm/mm.h
>>> @@ -22,9 +22,10 @@ extern vaddr_t directmap_virt_start;
>>>    #define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
>>>    
>>>    static inline pte_t paddr_to_pte(paddr_t paddr,
>>> -                                 unsigned int permissions)
>>> +                                 unsigned int pte_flags)
>>>    {
>>> -    return (pte_t) { .pte = (paddr_to_pfn(paddr) << PTE_PPN_SHIFT) | permissions };
>>> +    return (pte_t) { .pte = (paddr_to_pfn(paddr) << PTE_PPN_SHIFT) |
>>> +                            pte_flags };
>>
>> Nit: it could be one line.
> 
> Not if all the blanks are to be kept.
> 
>> I am okay to go without last two Nit(s):
>>
>> Reveiwed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Please clarify whether you insist on the description change for the tag
> to be applied.
> 
Considering the your comment above, I agree local is just shorthand for 
'local variable' so I am not insisting on the description change.

~ Oleksii

