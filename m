Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A32CD4F25
	for <xen-devel@archiver.kernel.org>; Thu, 14 May 2026 07:20:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1308680.1580052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNQMQ-0002AQ-0E; Thu, 14 May 2026 07:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308680.1580052; Thu, 14 May 2026 07:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNQMP-0002AJ-Th; Thu, 14 May 2026 07:19:57 +0000
Received: by outflank-mailman (input) for mailman id 1308680;
 Thu, 14 May 2026 07:19:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wNQMO-0002AD-Ax
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 07:19:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNQMN-00GLUF-DH
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 09:19:55 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a05779b-e002-0a2a0a5209dd-0a2a450c9666-0
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 09:19:55 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a05779b-62f1-0a2a450c0019-d155dd32bc07-3
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 09:19:55 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-43d7e23defbso4531889f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 00:19:55 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fd6276741sm21345245e9.0.2026.05.14.00.19.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2026 00:19:54 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778743195; x=1779347995; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SbrOmt9u4LFfWWNLKP728x6vD5BVfjv8IKO/Jqosws4=;
        b=ioYPqmqfhfuivBOB5k7NOShF6TDd/ZV9VLSkPcO/DIUiHP+4IQfFc/gbOU4cQDxbec
         LY24GDigYwG2diTy5OEVyIyOokFP67CHTFBqM8Povku1O/acmXeZTD/JaR+7s83TiUsb
         fwnfx/7XxH+8HIBWX3V8PM/n4thrIbU0vlvXXYl/eIvT6cPptThfQygRBwATDJxFBkzz
         hFGtsviX8+3DOmrY3cPvesuqkfai205ZNu58G4HVThHLiE2F9I5ej/lqWiuGFUA96Nj4
         3sK77/IK2NNUe3SUHbHX3wUAL2LrZLf5ZZV43KCcIO5uwSezShiTc5gfCawQfY+HcEYu
         YVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778743195; x=1779347995;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SbrOmt9u4LFfWWNLKP728x6vD5BVfjv8IKO/Jqosws4=;
        b=BhNJyqEy0TvmqQSAJdzvZEAR2SQOsWZSjGErn44Hht0fEO9ebMpaM9xZBkbvg4xQmX
         X+5+XitJC3ytHaCFtP0ESJlL2JzY467BTnmjg6eSKd6w1GwbOML2BMi0gUWeceCha2qq
         bxj55Bj0O3vwSN//j60UISI0JBQpc35IGYPwxnbRDDGdJwJ86XGpk5Byp5md1mYsSF4F
         jDdgTaE0TIllHN7aNICEKEgnJEddFIjyoYhtcoKj3tzdNZc2VSO6ki+M8XbjrDPqUXS+
         +ySBOoCWAWA7s5Oxq2KQgJ8b/xxCeVNhMyFohw3xtolYE4G0dZLIJjYWexnRqa3BcPSR
         PEpQ==
X-Forwarded-Encrypted: i=1; AFNElJ+FBRUUiOGEfUgZAiqq7mNcViyTr4nbAFYbJNPBDXfK1t+4cV7NKxIYBvDRI4G1lHm7XMZAZvHcIic=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0BU7vnsBizCKdCu8iFzfmznpYgMXf4EkiiQv1mhGi71xALHEy
	xIoG4lBj+dmpFV0WMUMZyqY2+Qs9ofIn6+nLPbmC7qBfjnb+4O3mdDVh
X-Gm-Gg: Acq92OG8tTxbiN4i3DXtXVm5W3eFZHAXO71D53jlG7NDDfu6VIPVH0N3TEcxsP3N+6q
	IZ8AJIghvl8KIa9VlWzfe0xcdVadxgn/opDXeaIDE4oKKPZ/vwJLuZMpKqxgxe0YZlDjyBE/Yvj
	Rbw+VFxEuAi3Xbat0EWpBJC+PlG6uK7+Fu89BTpOQbnBvAAub4Yj8I7iJZkUXqtsORNVyIZ8CJK
	YBoiyr2c12pxeejuuxwSx4NmNOyBpUZvpCxYnEzV6noT2siIOYRZDcOKXLiBykemlVKrDqvQQuI
	mTRJvsqxkgJNLSaNgZCp4vZOO1pieruE2NWppgChR2Tc6ZKl67j+eh6iNnOkRuBMmN479P08l5f
	QjaO08R5qq3sOtJnchRA/buDQPkJ1UOtRrOoGEJxhPOEGr3MJxZQQsZ2yeo+W+vEkNEOw9dZ0lD
	Sw4uFkeiHrmm32wjihrWFVNJrgMzXPNYHuyBw1eeeZBlQCOT3ppM4cEJeBqdbvFC5rf3XSG76jk
	3I=
X-Received: by 2002:a05:600c:1547:b0:489:1f04:96c3 with SMTP id 5b1f17b1804b1-48fc9a02834mr94395215e9.2.1778743194606;
        Thu, 14 May 2026 00:19:54 -0700 (PDT)
Message-ID: <a06f6f51-7355-4770-90be-6867530c2bd0@gmail.com>
Date: Thu, 14 May 2026 09:19:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/11] xen/device-tree: use p2m_gpa_bits in common code
To: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>, Jan Beulich <jbeulich@suse.com>
References: <cover.1778140240.git.oleksii.kurochko@gmail.com>
 <da9139f28ec72a7a2b9be949e67d57693af8b780.1778140240.git.oleksii.kurochko@gmail.com>
 <46c3f430-77a6-4baf-9597-17873e0782c4@amd.com>
 <7c75dce1-f0e9-44f6-bda5-9d18435b882d@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <7c75dce1-f0e9-44f6-bda5-9d18435b882d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1778743195-E2F72CF5-4C41460D/10/73395122804
X-purgate-type: spam
X-purgate-size: 1920



On 5/13/26 1:16 PM, Orzel, Michal wrote:
> 
> 
> On 13-May-26 13:14, Orzel, Michal wrote:
>>
>>
>> On 07-May-26 10:58, Oleksii Kurochko wrote:
>>> The IPA terminology is Arm-specific, so rename p2m_ipa_bits to
>>> p2m_gpa_bits to use architecture-neutral naming in
>>> xen/common/device-tree/ code.
>>>
>>> No functional changes.
>>>
>>> Reported-by: Jan Beulich <jbeulich@suse.com>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>> Changes in v5:
>>>   - Rephraze commit subject.
>>>   - Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>.
>>> ---
>>> Changes in v4:
>>>   - Nothing changed only rebase.
>>> ---
>>> Changes in v3:
>>>   - Introduce #define p2m_gpa_bits p2m_ipa_bits for Arm instead of
>>>     renaming of p2m_ipa_bits to p2m_gpa_bits to keep Arm part of
>>>     changes clearer and keep using Arm-specific terminolgy inside
>>>     Arm code.
>>> ---
>>> Changes in v2:
>>>   - New patch.
>>> ---
>>> ---
>>>   xen/arch/arm/include/asm/p2m.h        | 2 ++
>>>   xen/common/device-tree/domain-build.c | 2 +-
>>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
>>> index 010ce8c9ebbd..7957dbd96e57 100644
>>> --- a/xen/arch/arm/include/asm/p2m.h
>>> +++ b/xen/arch/arm/include/asm/p2m.h
>>> @@ -14,6 +14,8 @@
>>>   /* Holds the bit size of IPAs in p2m tables.  */
>>>   extern unsigned int p2m_ipa_bits;
>>>   
>>> +#define p2m_gpa_bits p2m_ipa_bits
>> This deserves the comment e.g.:
>> /* Common-code alias; ARM keeps the IPA spelling internally */
>>
>> With that:
>> Acked-by: Michal Orzel <michal.orzel@amd.com>

Thanks!

> Forgot to mention that I'm ok to do this change on commit (patches 1-5 are ready
> from this series).

I would be happy with that.

~ Oleksii

