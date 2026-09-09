Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4211EC79FB6
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 12:42:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412968.1643240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4HdL-0002Et-BG; Wed, 09 Sep 2026 12:42:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412968.1643240; Wed, 09 Sep 2026 12:42:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4HdL-0002Em-8V; Wed, 09 Sep 2026 12:42:35 +0000
Received: by outflank-mailman (input) for mailman id 1412968;
 Wed, 09 Sep 2026 12:42:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4HdK-0002Ee-4v
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 12:42:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4HdJ-002mwj-HH
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 14:42:33 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa15433-2eae-0a2a0a5409dd-0a2a450abaac-14
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 14:42:33 +0200
Received: from [209.85.218.42] (helo=mail-ej1-f42.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa15439-f2d2-0a2a450a0019-d155da2ad04e-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 14:42:33 +0200
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-c2544ff970dso856439666b.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 05:42:33 -0700 (PDT)
Received: from [172.19.143.248] (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c260d57fd88sm739635066b.44.2026.09.09.05.42.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 05:42:32 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788957753; x=1789562553; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c1ynL1CBn4CZNWbSyyocQzxmKFO9Hsc7Fep/W5P+d2M=;
        b=qe7M4gsgOK5TIAtXRCDYVaYY9T+0VVoOKjOOi0MPtt/+elJkSAPDS87weInZ36YS+H
         tCPadfGCRXfi9zJrrYBdKq4iVXBJlhxJ5apanSro9dN2aHxvJsLE9wpEMYXPZZKuNOEW
         mUL/dNnkHGEPRs7RiyL6MbjWHXDtsHOt7gVnqRIOFlGt/riqCtjc2ynwQowyqXmZT0SL
         s8G4JmblI8L0VTR7xiJsy4y1Gw/sVc+WZSAx/WbR9JCLUDdOmabKWXi1q5KxN+CKr+eK
         QayCrfejIdKvclQ9uaHaPJQ5oLLa8lPz36vqVZfGcMpQIyqXYoTqagOX/lbbWCHdbQP6
         AQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957753; x=1789562553;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c1ynL1CBn4CZNWbSyyocQzxmKFO9Hsc7Fep/W5P+d2M=;
        b=PTiLlQtQtaMYPZEVH1Dhm7wnvVVoZOpAi24EwKVbG0NWL68Ena3raWL6Kk7d88koOV
         BJcu+FSaDEVQZP0zFCHtNPcZjisqkyE/FaM4JFl6/RoubHsEqJ1b7PRERUPwDWEL3Gi2
         qwgJetPqNIUifxGDEIsW3bC9N7+k4tzRUnco8c0vQUCz1uaTN2C2MjWutsK96ecVgmrW
         JtvdbWn2nxxQCfCU4TXD7yno1OqYzl7luWsipQjdOlUimCpV+6EQCkOPlM1TO18ghuVE
         W/Eu+bbDtlNZI4nRz9gPBOEoxO3biPKyH6iA4oXT+OCNSi7kYKwWEXuYrUreXWu4ybjO
         vRXA==
X-Forwarded-Encrypted: i=1; AKwUvBz1sHhJ6mTUNX7YQuURbL3TBJeP2V1mBgMivJfbLJ7ILi/jA+PEoENvXDq7wPKGWL6FTaCqAZeoHHI=@lists.xenproject.org
X-Gm-Message-State: AFuF++m3/kwpU/V8ibkhMUuq6ROR6TdXGIKv9Al+2GYcnf6HyZ2AXnVC
	/5B/nwXOEQ06L/Fy/tBodPfI9t5dXiW5EuLuTgHLiIQ/7sWaNVjltQyb
X-Gm-Gg: AYBFou0i4kg+GdcjbJc2he6AUL6e/HqNGQgm2Ai2MYTccXMD4K+v1bIYBZmiYmpsCN/
	+xexhZSN29I8w3fgmEL3jrXqJfSJqr1BsFAu8fzItwZADR95wFzX9i8K76CJoMs9JjONXJshs7f
	GZbRFDCjo69iBZjH5EDOnNsBomC2XGDRKGQrHalrvxYKZDmA6/j13JlzgcdGYaEtc5BDSswJWtC
	7fXry0QU1K7Dz4tLKeZexrHUd90hT1Zb5d4LZeFWf3vNewuJLcI1IkWN9+szHRcmjz2PFnRPvkw
	t7oHBRduQAJtOo51QI/+SQGr1BWh3v27hcFDQ70z8L5fpt9pRhAOpRMCLLMaqVg3xfGACRBl0Dl
	Hp2IfEAGq8Hai5KWimOCsHDfkeSMpstM3cMwQeGeqRgRl9SwujfaPJ06jAFx2yYejDwVsiORWa5
	wrpDhBsqeB3XBo90wiYedpoU8+tx+W3pfxt16p6Z4bniTbByKI7kyb5L8/GMOVO+zOkpQN/Ehbd
	oce+kRqcuZ7KXeWtjQFSt4YMYO1ocDv
X-Received: by 2002:a17:907:3f88:b0:c26:1649:47b3 with SMTP id a640c23a62f3a-c2616495639mr1228111666b.41.1788957752467;
        Wed, 09 Sep 2026 05:42:32 -0700 (PDT)
Message-ID: <7ee299ac-7ed3-4e37-92bc-ba8ee5bec3bd@gmail.com>
Date: Wed, 9 Sep 2026 14:42:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/39] xen/riscv: extend exception tables with type and
 data fields
To: Jan Beulich <jbeulich@suse.com>
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
 <8aef9dfabe1d485abe4c48fd7499e09dbd8e0c27.1787838835.git.oleksii.kurochko@gmail.com>
 <39841f44-2b18-4368-a9f8-7c0db307ff6d@suse.com>
 <09c883b1-38fd-423c-b516-d39865729e18@gmail.com>
 <40c2524b-ab7e-461a-9113-ceee0560a918@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <40c2524b-ab7e-461a-9113-ceee0560a918@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1788957753-536D6CFC-973C0FA6/10/73395122804
X-purgate-type: spam
X-purgate-size: 2815



On 9/9/26 2:22 PM, Jan Beulich wrote:
> On 09.09.2026 13:20, Oleksii Kurochko wrote:
>> On 9/8/26 3:44 PM, Jan Beulich wrote:
>>> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>>>> @@ -59,7 +67,49 @@ static void ex_handler_fixup(const struct exception_table_entry *ex,
>>>>        regs->sepc = ex_fixup(ex);
>>>>    }
>>>>    
>>>> -bool fixup_exception(struct cpu_user_regs *regs)
>>>> +#define CHECK_GPR_INDEX(num, name)                      \
>>>> +    BUILD_BUG_ON(offsetof(struct cpu_user_regs, name)   \
>>>> +                 != (num) * sizeof(unsigned long));
>>>
>>> Nit: Placement of the !=. Also there should be no semicolon here; it wants
>>> to ...
>>>
>>>> +static unsigned long regs_get_gpr(const struct cpu_user_regs *regs,
>>>> +                                  unsigned int num)
>>>> +{
>>>> +    /*
>>>> +     * The GPR number -> struct index mapping below relies on x0..x31 being
>>>> +     * laid out at the start of struct cpu_user_regs in architectural order,
>>>> +     * matching the register numbers GPR_LIST() hands to the assembler.
>>>> +     */
>>>> +    GPR_LIST(CHECK_GPR_INDEX)
>>>
>>> ... appear here instead, for this to actually look like a statement.
>>
>> I will apply that.
>>
>>>
>>>> +    ASSERT(num < 32);
>>>> +
>>>> +    return ((const unsigned long *)regs)[num];
>>>
>>> What about release builds? You'd happily overrun the array there. Maybe
>>> (ab)use array_index_nospec() here?
>>
>> num is coming not from guest, not from calculation in runtume, it is
>> generated by assembler at the build time. So it should be always correct.
>>
>> So just having the following looks okay to me:
>>
>> static unsigned long regs_get_gpr(const struct cpu_user_regs *regs,
>>                                     unsigned int num)
>> {
>> #define CHECK_GPR_INDEX(num, name) \
>>       BUILD_BUG_ON(offsetof(struct cpu_user_regs, name) != \
>>                    (num) * sizeof(unsigned long))
>>
>> #define GPR_CASE(nr, name) case nr: return regs->name;
>>
>>       /*
>>        * The GPR number -> struct index mapping below relies on x0..x31 being
>>        * laid out at the start of struct cpu_user_regs in architectural
>> order,
>>        * matching the register numbers GPR_LIST() hands to the assembler.
>>        */
>>       GPR_LIST(CHECK_GPR_INDEX);
>>
>> #undef CHECK_GPR_INDEX
>>
>>       switch ( num )
>>       {
>>       GPR_LIST(GPR_CASE)
>>       }
>>
>> #undef GPR_CASE
>>
>>       ASSERT_UNREACHABLE();
>>
>>       return 0;
>> }
>>
>> Any thoughts on that regard?
> 
> Depends very much on how efficiently the compiler translates this (as opposed
> to the other variant).

It is worthier. I will follow then your original suggestion and use 
array_index_nospec().

~ Oleksii

