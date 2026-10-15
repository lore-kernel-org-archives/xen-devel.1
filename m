Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A05CC6B39
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 15:32:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450805.1666207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHNQy-0004pe-S9; Thu, 15 Oct 2026 15:31:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450805.1666207; Thu, 15 Oct 2026 15:31:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHNQy-0004pX-PT; Thu, 15 Oct 2026 15:31:56 +0000
Received: by outflank-mailman (input) for mailman id 1450805;
 Thu, 15 Oct 2026 15:31:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHNQx-0004pR-S7
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 15:31:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHNQx-00GAH8-8q
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 17:31:55 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ad0f1e2-2eae-0a2a0a5409dd-0a2a4504c170-22
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 17:31:55 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ad0f1ea-b57f-0a2a45040019-d155dd2cc842-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 17:31:55 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-48c4d870d54so3497853f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 08:31:55 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-67-71.play-internet.pl.
 [109.243.67.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0ac35dfsm19513354f8f.33.2026.10.15.08.31.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2026 08:31:53 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1792078314; x=1792683114; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1eQDPE7EhU4VZ2xnN6vN0Gt79m18qjKFua1mtTyLiYo=;
        b=eKpOHsSS+SJieTD5NfQbje2G4FKQE1pY0omjfhC55xxwsEOpqtQLjOyJK4wF5SQSm8
         7WacmKYWRJeBQfvlCIFE2t5rRJ6Yy0i72nx0gXSZdpe3D4aqYvUHE6MSXCKr0/OZi/ZP
         JwKA3nUnr41Behq8hxRoKvZpDvTj4lQOAj4NKZmp6ZKUZejAtEXB8I7/kIlw2Q7By9kj
         l1anf+r5S0jldj81RrXECyynwPqOAyzBOQ3pAdzeWIwd+teDZQAyQIf9I7zMfi2kjByH
         iFBLADeGm3erdIykhBRFOw79QwRTzWqg3jY7mCxN2Hd94HJJAbj9Mpy80PqbBunViq6M
         0eFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792078314; x=1792683114;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1eQDPE7EhU4VZ2xnN6vN0Gt79m18qjKFua1mtTyLiYo=;
        b=yjH6QlxYnNimyv/sMWAuT4YtkPCvwiJ++fAOZFnB4X3lJDtzxHaOsnHBUh/4SzRcE5
         TAaMg6LkRpJ1fZLXnIKJJ33UDUkcHh9fJWjxjZVo3NCGrUehiBGdMvBoZElFhXpZ4zP9
         Hj+k7m/1qKGrpkglBjX7juQqafr5DTIOR/mjsiukioaxBwF5JcFS0a3hOJ8mRMPyKQlZ
         Gjy4KLvexDacIm6+Py1ebUn8L+g1iyDKNwABSxe8AMJdlL0/+qTGsUVurs8riUlmQUew
         81TkrOGgfoULH96wlREzz9bXKfeYUnqCZNRKgo028MFgE3WUfmJpvHt/hEPFySqZ7zgh
         PihA==
X-Forwarded-Encrypted: i=1; AKwUvBziGlSyLsBqSigHVDBB+gs9fssRDdqqVudtT3285xExFwq5/f2Kh67+CqDrWoaAgYuLpgxaV3t7iqw=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIk88niA5uzJV6lj2/b1+h+KDJK4SEwg/P+VROMzzZg4RAZ4J/T
	dMb/0dsihyZFqTWnHG2eD+Sa5rIU0b9RYY6c9mTJtxreGYXcHDipaUlI
X-Gm-Gg: AYBFou2X+Bt9rq1S3g5uKdducPBDBy8h3DzSl0zsyjjEVEBn5SV7MqeH5Lit0P7304D
	IbTQnQq4zmJ4NXzam7Aby2kvRhhO/cgEwuTaTQCb6Yws7yR8+yX7OKtKkCPp1MKljSawgLpmc07
	MULfmnm+jUlbrPHRbpCpQLN0kfQZmRFcyOKWYMyqzfXljlHmrGdht1Dv6mUOW4qNixqpHWd8NTO
	GpeAKP+5wXrUj+ADjZjo28fk+w/2moX+8/76Bnz8Zhk04jTW0arBdOP/bmAepq/EKMDdb11dSnP
	K7uOU0LW8RysFr4WElRcRxfTOpFhMm1Excfq98L9OdA1hGuM6HmJprgPwlf02F7Vpoyxj8oTBii
	KC3f7g7k2pPRxmslYOUvHuhi9/OvhsAAprQVJsQk4c5u6OmC0eTt+3pUAGBnJytVCWpQaseD4p5
	TRdDd7stMyRuGQxYUDuwpHBAm197NGyBKUdzjhgVBHLsq4w7fT7FqIFgXSI4M2V1xnHuxuJX1RA
	1dSLVW3I/hzLeu3sQ0v9Wm92EtHPCD5mt2dz/RbiCgVlX0=
X-Received: by 2002:adf:e80b:0:b0:487:342:d141 with SMTP id ffacd0b85a97d-48dbaae8b8dmr28314688f8f.23.1792078314205;
        Thu, 15 Oct 2026 08:31:54 -0700 (PDT)
Message-ID: <7b8838fc-3ff7-4628-8353-d21f418870d7@gmail.com>
Date: Thu, 15 Oct 2026 17:31:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] xen/riscv: probe the PTE A/D bits update scheme at
 boot
To: Jan Beulich <jbeulich@suse.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Zheng Zhang <zhangzheng@iscas.ac.cn>,
 xen-devel@lists.xenproject.org
References: <1791885904.8631fc262581453bbf619ec5b2062170.1a134b909b40008425@vates.tech>
 <1791886038.8631fc262581453bbf619ec5b2062170.1a134bb169d0008425@vates.tech>
 <21a48f53-385b-4f36-958c-cc82bf390c89@suse.com>
 <1791901979.8631fc262581453bbf619ec5b2062170.1a135ae53690008425@vates.tech>
 <7ed5d117-80d5-4862-af60-c3e0143564ea@suse.com>
 <1791968412.8631fc262581453bbf619ec5b2062170.1a139a403a30008425@vates.tech>
 <db0d448a-ff1f-4549-84f1-c53e3e4a711e@suse.com>
 <1791996314.8631fc262581453bbf619ec5b2062170.1a13b4dc2b50008425@vates.tech>
 <4e914f14-50ff-48a5-9f56-836913e487fb@suse.com>
 <1792052907.8631fc262581453bbf619ec5b2062170.1a13ead4e580008425@vates.tech>
 <7f5da80c-424f-49dc-8ce3-10ca2fae9f55@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <7f5da80c-424f-49dc-8ce3-10ca2fae9f55@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1792078315-C06DAB50-F63EB562/10/73395122804
X-purgate-type: spam
X-purgate-size: 4812



On 10/15/26 10:41 AM, Jan Beulich wrote:
> On 15.10.2026 10:28, Baptiste Le Duc wrote:
>> On 2026-10-15 09:14 +0200, Jan Beulich wrote:
>>> On 14.10.2026 18:45, Baptiste Le Duc wrote:
>>>> On 2026-10-14 11:09:58+02:00, Jan Beulich wrote:
>>>>> On 14.10.2026 11:00, Baptiste Le Duc wrote:
>>>>>
>>>>> In which case it would need to be
>>>>>
>>>>>      if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) ||
>>>>>           !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu) )
>>>>>          e->pte |= PTE_ACCESSED | PTE_DIRTY;
>>>>>
>>>>> albeit I have to admit that permitting two contradicting extensions to
>>>>> be exposed at the same time is irritating.
>>>>>
>>>>>> I see two ways to address this:
>>>>>>
>>>>>> 1) Keep checking Svade:
>>>>>>
>>>>>>      if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
>>>>>>          e->pte |= PTE_ACCESSED | PTE_DIRTY;
>>>>>>
>>>>>>      After resolve_ad_scheme(), the Svade bit is set in every case where
>>>>>>      software has to preset the A/D bits. The only imprecise case is both
>>>>>>      extensions advertised with hardware updating already enabled by
>>>>>>      firmware, where presetting A/D is unnecessary but harmless.
>>>>>>
>>>>>> 2) Record the probe result in a global, e.g.
>>>>>>
>>>>>>      static bool __ro_after_init hw_ad_update;
>>>>>>
>>>>>>      and use:
>>>>>>
>>>>>>      if ( !hw_ad_update )
>>>>>>          e->pte |= PTE_ACCESSED | PTE_DIRTY;
>>>>>>
>>>>>>      This is exact in all cases, at the cost of a new global that mostly
>>>>>>      duplicates what resolve_ad_scheme() already records in the ISA bitmap.
>>>>>>
>>>>>> I discussed with Oleksii and we are fine with either. What do you prefer?
>>>>>
>>>>> As to 1), see above. For 2), while maybe okay, I think we're better off
>>>> Sorry, I don't fully follow the issue with 1). Compared to what you proposed,
>>>> it only differs when neither Svade nor Svadu is recorded, which cannot
>>>> happen as resolve_ad_scheme() runs before and always records one of the
>>>> two.
>>>
>>> Yet previously we said that recording extensions (as such, i.e. later also
>>> possibly exposing them to guests) when they weren't really advertised may
>>> not be the right thing to do. I.e. imo the probing may be used to drive
>> But we also said that platforms (such as the P550) may implement an
>> extension without advertising it, as a RISC-V spec maintainer
>> confirmed in [1].
>>
>> [1] https://github.com/riscv/riscv-isa-manual/issues/3450#issuecomment-6076851535
> 
> What Andrew says there suggests to me that the behavior you observe on P550

What was mentioned in [1]:
```
Implementations that trap when A/D bits are not set do implement Svade, 
whether or not they explicitly say they do.
```

Sounds like a default behavior for our case and so Svade should be taken 
as a default.

> is against the spec. That shouldn't really be the case though, as nothing
> was said in the spec at all until Svade and Svadu were actually introduced.

Actually, earlier versions of the Privileged ISA specification (e.g., 
v1.11 and v1.12) already explicitly described both behaviors:
"Two schemes to manage the A and D bits are permitted:
1. When a virtual page is accessed and the A bit is clear, or is written 
and the D bit is clear, a page-fault exception is raised.
2. When a virtual page is accessed and the A bit is clear, or is written 
and the D bit is clear, the implementation sets the corresponding bit(s) 
in the PTE. The PTE update must be atomic with respect to other accesses 
to the PTE, and must atomically check that the PTE is valid and grants 
sufficient permissions. Updates of the A bit may be performed as a 
result of speculation, but updates to the D bit must be exact..."
What is now formalized as Svade corresponds to the first scheme 
(software management via page faults), while the second scheme 
(hardware-managed updates) became Svadu.

~ Oleksii

> An update to the spec should imo never invalidate previously conforming
> implementations. I guess I'll comment there.
> 
>>> Xen's internal behavior, but I'm unconvinced that it should also lead to
>>> marking extensions as available.
>>
>> Therefore, as far as I understood, you're not convinced of this:
>>
>>      /* Neither advertised: trust the probe. */
>>      __set_bit(has_hw_update ? RISCV_ISA_EXT_svadu : RISCV_ISA_EXT_svade,
>>                riscv_isa);
>>
>> If so, then, the only solution I have in mind in what I proposed in 2)
>> with the global variable that store the result of the real probe.
>> Am I correct?
> 
> Possibly. What I'm missing is some clarification towards the underlying
> principle which we want to follow not just here.
> 
> Jan


