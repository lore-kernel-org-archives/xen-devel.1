Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C25F436A4
	for <xen-devel@archiver.kernel.org>; Fri, 17 Apr 2026 13:48:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1284370.1566176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDjYA-0000jx-Qg; Fri, 17 Apr 2026 13:48:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284370.1566176; Fri, 17 Apr 2026 13:48:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDjYA-0000jq-Mk; Fri, 17 Apr 2026 13:48:02 +0000
Received: by outflank-mailman (input) for mailman id 1284370;
 Fri, 17 Apr 2026 13:48:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wDjY9-0000jk-FW
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 13:48:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDjY8-0051Ce-G4
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 15:48:00 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e239ef-e002-0a2a0a5209dd-0a2a4507a2a0-46
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 15:48:00 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e23a10-229c-0a2a45070019-d155802ec95c-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 15:48:00 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-488b8bc6bc9so5022825e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 06:48:00 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fbc92a9dsm26669985e9.1.2026.04.17.06.47.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2026 06:47:59 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776433680; x=1777038480; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Aa1LWwdxzqYrVnza1lGExQ9a9dICBpPyuXLYZjCE2U4=;
        b=SESmSKgUWmB/Lz+hC8QXxqI+WTJvcqJk3hNmpa+6iHOMBxbH8bcvo7ox237N4PMMuq
         RAedebUDyyhgdYDYPlOKZ3aOlkEFTVG4pUDltH6a+OAFRdMLf816VfoooU96IAk/yYZs
         Lbv6Iyl4OAy/Z2beILrgPoNaD+rKia3MlOqpZP7F50iObUw1arnx8/SbaVn1kK7bDRnB
         x+O1HSAiMJinx5imZl+UvGpm5OY22Mm3uELOQGiUo+cENIWge8MMUm9i2IAAnrlHssHD
         E5q87ZtZqwCedJOCkuPE+azpKoro7IzzNgTgNLTntHEa0xtZIM3P90wCPTBYH8jxMN/w
         ERhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776433680; x=1777038480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aa1LWwdxzqYrVnza1lGExQ9a9dICBpPyuXLYZjCE2U4=;
        b=QrPn5AW2ib2Ag06bBlIpAqq/8nkeO+lvxHftFe1jZG/PSyfTnbG9sp/Iw86IAMWbPA
         4rgU3VDOln6zb6stuChrtW7Z6DBYLmJhh6oJpy7SJkp2XkXaZftmwUNqFwmPjikVo9Ug
         E6NSD+lzBX6MouxBFjcoRUBhdWjFEFCIKx1mDQvGvjyrP2OwZ4LmbADWsMCRDPGWGnDE
         052+5KHrjZDLi2Zh6ZXB4f5g9xUYvRbkomywZVJ+A7iQaQxRaWGoBGuy6hmddZYvA8F/
         o2O2kKe6tOwZ5kpgueU4w9nYK6lA6ITIKjtiqRjfagMhrTLheHTDJRrgPI+DfYpvn8F9
         orqg==
X-Forwarded-Encrypted: i=1; AFNElJ+/o02V9+E46F51gyaycFC69NcMaNDX05vVALLSwq62Ww4JBgdRbeMdmMW7D4gKKnMSF0//oH/qLjU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGiIsNu2V+3xztqtnNZfWRXodK1XDfpTGlwV0OBJI7OxY69zlR
	hDROivAHaABeIw8Kf8w4RfyKJIkkg14POo+zssIjKn7tJM8N27BCYwGn
X-Gm-Gg: AeBDies1eHSExaTH11gZQKxqgiCZz34TfT622OgChugzpM3j8LOJrNxidQeFa7jjjiS
	G9Q1hhEgXsFkH+66ImRXYfmSoGVi00T4X9sbAX0WLjRmHnB9IAysBEvTRftIE7yScqUxiTmqmCz
	ojpevuFj8Nj1/ZzO2wx+KAMg/uzzhhdygdc/6ayZRd2bTCT8gackWUi4bKcK1up6KA4H2ifgBfE
	FYZ3zOFwf7Ks7vwUMWNVWs56uBTvJYvm2/VR+145bnxh2BGGnC+jkCaAFNJklAyiwjTaN4yS4ts
	BUlnk0CW/ETpjKomYLc1NUfi85S/eZ0MCUFZnbrwfTtVulaz9vynW5W0iTbVV1VpJpyahgjIMZc
	kU/nnOTiFldgYuv4ECaNDQHiGsgKRBV+fLf8wSvCEn+C9Q0GYo+w6FwgE/RkP9SLsL6u1powzsQ
	k2njNpR4pGezCoysBwiIFCnTpXFRyW7sL8CSTxdfbYd0V2lJ74YoNE4fa0Jx/a6PQNK905ZekFG
	j0sfjLdY/u5TO5bjfC5uNgi
X-Received: by 2002:a05:600c:4ecf:b0:488:caed:5cc7 with SMTP id 5b1f17b1804b1-488fb76fddcmr42514015e9.15.1776433679570;
        Fri, 17 Apr 2026 06:47:59 -0700 (PDT)
Message-ID: <9bee01f5-8275-4d8e-b217-1b2d2f8fa2e8@gmail.com>
Date: Fri, 17 Apr 2026 15:47:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 14/27] xen/riscv: introduce per-vCPU IMSIC state
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <8196fa8f000e384af697a44cb3d50ece966e82a7.1773157782.git.oleksii.kurochko@gmail.com>
 <1f5e262d-da1f-49a2-8e89-87fb714e51bf@suse.com>
 <2f555a8b-d058-41ca-80f8-ce3dc08edfbe@gmail.com>
 <bd50afd3-6399-4c6b-b05d-d86ee4b8643e@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <bd50afd3-6399-4c6b-b05d-d86ee4b8643e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1776433680-1585EC48-A9AFF383/10/73395122804
X-purgate-type: spam
X-purgate-size: 3202



On 4/16/26 2:31 PM, Jan Beulich wrote:
> On 14.04.2026 11:22, Oleksii Kurochko wrote:
>> On 4/2/26 1:31 PM, Jan Beulich wrote:
>>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/imsic.c
>>>> +++ b/xen/arch/riscv/imsic.c
>>>> @@ -59,6 +59,29 @@ do {                            \
>>>>        csr_clear(CSR_SIREG, v);    \
>>>>    } while (0)
>>>>    
>>>> +unsigned int vcpu_guest_file_id(const struct vcpu *v)
>>>> +{
>>>> +    struct imsic_state *imsic_state = v->arch.imsic_state;
>>>> +    unsigned long flags;
>>>> +    unsigned int vsfile_id;
>>>> +
>>>> +    read_lock_irqsave(&imsic_state->vsfile_lock, flags);
>>>> +    vsfile_id = imsic_state->guest_file_id;
>>>> +    read_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
>>>
>>> What purpose does this locking have? Already ...
>>>
>>>> +    return vsfile_id;
>>>
>>> ... here the value can be stale, if indeed there is a chance of races.
>>> Did you perhaps mean to use ACCESS_ONCE() here and where the value is
>>> set?
>>
>> ACCESS_ONCE() isn't guarantee only compiler re-ordering (as basically it
>> is just volatile-related stuff inisde the macros)?
>>
>> Generally, I think that that guest_file_id is needed to be updated only
>> during migration of vCPU from one pCPU to another and I expect that
>> during this migration vCPU isn't active, so no one will want to read
>> imsic_state->guest_file_id. But on the other hand, there is:
>>     bool imsic_has_interrupt(const struct vcpu *vcpu)
>>     {
>>     ...
>>       /*
>>        * The IMSIC SW-file directly injects interrupt via hvip so
>>        * only check for interrupt when IMSIC VS-file is being used.
>>        */
>>
>>       read_lock_irqsave(&imsic_state->vsfile_lock, flags);
>>       if ( imsic_state->vsfile_pcpu != NR_CPUS )
>>           ret = !!(csr_read(CSR_HGEIP) & BIT(imsic_state->guest_file_id,
>> UL));
>>       read_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
>>     ...
>>     }
>> which I think could be called in parallel with with migration, so then
>> still lock are needed.
> 
> None of this addresses my pointing out that the returned value will be
> stale by the point the caller gets to look at it.

Yes, I agree that lock in vcpu_guest_file_id() is useless and it should 
be on the caller side and used for the whole IMSIC state access. But ...

> Which in turn raises
> said question about the use of a lock. If you read
> imsic_state->guest_file_id atomically (i.e. excluding tearing of reads),
> the value seen / used will be stale as with the lock in use. Unless of
> course there's yet another aspect hidden somewhere in what is not being
> explained.

... I am not sure that I get this part.

If I am somewhere in migration code where I took write lock to update 
imsic state (and of course ->guest_file_id as part of it) then if 
someone else in parallel calls imsic_has_interrupt() then it won't enter 
critical section where ->guest_file_id is trying to be read so no stale 
->guest_file_id will be read.

Then does it make sense to use ACCESS_ONCE() during read and write of
->guest_file_id in such use cases?

~ Oleksii

