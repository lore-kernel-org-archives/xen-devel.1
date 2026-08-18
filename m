Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E28C5DF70
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 09:40:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393830.1632649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwGJ8-0007jF-Oc; Tue, 18 Aug 2026 09:40:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393830.1632649; Tue, 18 Aug 2026 09:40:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwGJ8-0007j6-KU; Tue, 18 Aug 2026 09:40:34 +0000
Received: by outflank-mailman (input) for mailman id 1393830;
 Tue, 18 Aug 2026 09:40:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wwGJ7-0007j0-JP
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 09:40:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwGJ7-006Hcu-0A
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 11:40:33 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a842880-e002-0a2a0a5209dd-0a2a4509eb28-36
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 11:40:32 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a842890-be1a-0a2a45090019-d155802adce2-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 11:40:32 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-49978908b35so33438255e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 02:40:32 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49996109652sm294496935e9.4.2026.08.18.02.40.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 02:40:31 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787046032; x=1787650832; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kSyrNZbnHBXHQgc5+cdGaQ7lQ041+r8gtibycrCKihM=;
        b=TcaVqBHf1dgkoCUFUPlZhYu0HtMcrghgVR20fCxEJEwi4asOe+TiH7yGB03ucv+jWa
         QTNbJ6O0FkobcKC1/v6+FwhRLzIDx9Pg1mAphvlP3lMz8vl2xHHbPTwi08F76o+3hrjM
         WKdtjfjOO6QIeHFShbuPff78cwixriV5piGwwF1ErkYJV1Q04BZ89xo6e8ee9QZRyJxk
         ypPKbVQLGTvY49mSNvc0r3pDdUFtD7H1ZLrbnxxgNyS/Ehpl21yyw+DEYEae9ShDOuuV
         tbLk66LEXPJpPuulQY/asHOe8/66xfG+wiZ1Qbrh6nTzEBkDfjf0WfiXK04D4ZU68QNc
         j/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787046032; x=1787650832;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kSyrNZbnHBXHQgc5+cdGaQ7lQ041+r8gtibycrCKihM=;
        b=gmvwGHn00JukkpL44uPnbNmNKI6Tg3k+xcSDU+heZvGu9YGlm+upaZbvrzNoJXXqsn
         JPqpxhsxnKIkK0qMVWW6GhZf7z2yChp0gs3mZCEFVyjNlExUN90CeounSyaQM4jRSGyQ
         vlk79ABWNY6x/KxXvCOHGe1ewTWTWX5OGVU5aQPR+k/GHBRvOgcaXGCOCDOum41YlYOW
         w7hgkUsdpXp5bxDY8zhOfXI0XqYSWmbN6cU5mYoKahv2yzfALxkVXhol+JSuBV5ZJGQA
         NiL1BMfuOfaFvgBVvNTu/uATbAyCfDiorKUmonVsbSc+3LbkPeEDK4XUwYS4G/eso7yf
         vj2A==
X-Forwarded-Encrypted: i=1; AHgh+Rr48si9Pr8LkJl0LEclCSK2eogaLgx4bK6gt6XGW3LlhmnQSl7Qs64EQQxTeHrV87FomzUC5lNWs5o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0mvLbRU/zPi1HbE4mVgGBch3m0cQoDa0XUaxHy5JUYu2mDPrE
	cOIhqlirjrR6nXFyQBw+9gzYVD661QRHyWgEOmhMqTruYWa8hDA9Y8c6
X-Gm-Gg: AR+sD137Ug0LFtKBeMTwg7pYbxNyuPszU/HERC2wzoZ/6fW88r+fYovbjUPd5qjLAvx
	eLFASuOT1FrPW3/z8qfChavmTvkwBNLn8uMgIYJTb+leXiAT1eWZdo6VDSaOWKcyCO4/GTa80mu
	F5D2MSzF/DFVuI7qyjDn8lS72uFoM4V8MmZPhpLvtIbXdkP6rM5JgWXL4hEfQkJd/ifxiX1vJGn
	sRBKvi0iUk5mW2J6dLRGC4R/vMlC8pJ150K57sWi9iPkWfbfQR3wldI21n0q2wpwYYxi57bTQIa
	iT79zZq97TbnHH2S/zoDecbfHRuTBemlwJnzS1UX4OWNCgmKe3g/CNs0SLwOlQ03jOC8ZZjZGFF
	o4OuxERBhBKJgY7VVGplcHrXga+poWVOdl0nqfxNgfQrSe7p72YBywG0dr9ffEphYcuZkfbrFXF
	UhM0ng7XRUVAj/1vIBHw7Z3FQdZFV7NU/ByqfLa4LeLcpM8hBk6Wb1OFd2M8DB9AHnDU12dt0oG
	u9bc5ImVoXLM4iD2tTtjeGq1xq5gfoJ41yMc7LCRW4=
X-Received: by 2002:a7b:cbd3:0:b0:493:cefc:d113 with SMTP id 5b1f17b1804b1-4998794c02emr330877545e9.5.1787046032260;
        Tue, 18 Aug 2026 02:40:32 -0700 (PDT)
Message-ID: <5005ead1-b7e2-4edc-8359-c2a9a89e5b4d@gmail.com>
Date: Tue, 18 Aug 2026 11:40:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/17] xen/riscv: extend exception tables with type and
 data fields
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <1eb9050ff6632f91682151471440990bd718ed90.1784560663.git.oleksii.kurochko@gmail.com>
 <be932384-6661-4c92-9137-8f6a9cd54057@suse.com>
 <3c9ef195-a8d4-489c-8daf-5635d3b53063@gmail.com>
 <b8b794ec-c86a-4a82-9d3a-b3ffcaa802f3@suse.com>
 <4a707c58-2225-477f-936e-9f99ae616c44@gmail.com>
 <eabb8190-51a9-4c25-b377-c25cd23af044@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <eabb8190-51a9-4c25-b377-c25cd23af044@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1787046032-3AEDE034-1372C4F9/10/73395122804
X-purgate-type: spam
X-purgate-size: 4625



On 8/18/26 11:26 AM, Jan Beulich wrote:
> On 18.08.2026 11:14, Oleksii Kurochko wrote:
>> On 8/18/26 9:56 AM, Jan Beulich wrote:
>>> On 17.08.2026 13:33, Oleksii Kurochko wrote:
>>>> On 8/12/26 4:37 PM, Jan Beulich wrote:
>>>>> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>>>>>> @@ -60,6 +68,40 @@ static void ex_handler_fixup(const struct exception_table_entry *ex,
>>>>>>         regs->sepc = ex_fixup(ex);
>>>>>>     }
>>>>>>     
>>>>>> +static inline unsigned long regs_get_gpr(struct cpu_user_regs *regs,
>>>>>> +                                         unsigned int offset)
>>>>>> +{
>>>>>> +    /*
>>>>>> +     * The GPR number -> offset arithmetic below relies on x0..x31 being
>>>>>> +     * laid out at the start of struct cpu_user_regs in architectural
>>>>>> +     * order.
>>>>>> +     */
>>>>>> +    BUILD_BUG_ON(offsetof(struct cpu_user_regs, ra) !=
>>>>>> +                 sizeof(unsigned long));
>>>>>> +    BUILD_BUG_ON(offsetof(struct cpu_user_regs, t6) !=
>>>>>> +                 31 * sizeof(unsigned long));
>>>>>> +
>>>>>> +    if ( unlikely(!offset || (offset > MAX_REG_OFFSET)) )
>>>>>> +        return 0;
>>>>>
>>>>> And an offset not divisible by sizeof(unsigned long) is okay?
>>>>
>>>> No, it isn't okay. I will apply your comment ...
>>>>
>>>>>
>>>>> Returning 0 as error indicator also feels fragile.
>>>>
>>>> With what I suggested below returning could be just dropped.
>>>>
>>>>>
>>>>>> +    return *(unsigned long *)((unsigned long)regs + offset);
>>>>>> +}
>>>>>> +
>>>>>> +static void ex_handler_trap_info(const struct exception_table_entry *ex,
>>>>>> +                                 struct cpu_user_regs *regs)
>>>>>> +{
>>>>>> +    struct trap_info *trap_info =
>>>>>> +        (struct trap_info *)regs_get_gpr(regs, ex->data * sizeof(unsigned long));
>>>>>
>>>>> Related to the earlier comment: Simply pass just ex->data here, leaving the
>>>>> multiplication to regs_get_gpr()?
>>>>
>>>> ... It would be better to move the multiplication inside regs_get_gpr().
>>>>
>>>> Your comment made me think about whether the multiplication is needed at
>>>> all (regardless of where it is done). In other words, ex->data contains
>>>> the register number, so we could just write:
>>>>
>>>> static unsigned long regs_get_gpr(const struct cpu_user_regs *regs,
>>>>                                      unsigned int num)
>>>> {
>>>>        /*
>>>>         * The GPR number -> offset arithmetic below relies on x0..x31 being
>>>>         * laid out at the start of struct cpu_user_regs in architectural
>>>> order.
>>>>         */
>>>>        BUILD_BUG_ON(offsetof(struct cpu_user_regs, ra) != sizeof(unsigned
>>>> long));
>>>>        BUILD_BUG_ON(offsetof(struct cpu_user_regs, t6) != 31 *
>>>> sizeof(unsigned long));
>>>>
>>>>        ASSERT(num && (num < 32));
>>>>
>>>>        return ((const unsigned long *)regs)[num];
>>>> }
>>>>
>>>> Probably, we want to consider this function out of context (for now
>>>> context is that we use it to recieve a pointer to trap_info which can't
>>>> be obviously stored in x0 as it should be always hardwired zero). In
>>>> that case, there is no need to check that num is 0.
>>>>
>>>> So, it probably makes sense to just have:
>>>>      ASSERT(num < 32);
>>>>
>>>> ASSERT() is fine here as I don't think that compiler will use incorrect
>>>> number during register allocation.
>>>
>>> I agree.
>>>
>>> However, the x0 aspect is still odd. Why again is it that struct cpu_user_regs
>>> has a field for it, when the register value is always 0?
>>
>> zero field isn't there to hold a value, it's there so the first 32 slots
>> form an x0..x31 array indexed by GPR number. It is useful for SET_RD()
>> implementation, for example.
> 
> But SET_RD() will need to avoid touching .zero anyway. Why waste the space,
> when something useful can be put there?

For SET_RD() agree, it doesn't make sense. Bad example. But it could be 
somehow a "protection" to not clobber something useful if SET_RD 
arguments won't handled correctly.

SET_RD() is only half of it. The read accessors matter more: sd x0, 
0(a0) to an MMIO address is the normal way a guest writes 0 to a device 
register, and emulate_store() fetches the operand with GET_RS2(), which 
is a plain index by register number. If something useful lived at offset 
0, that store would hand the device that value instead of zero. So 
whatever we put there would have to survive being read as a source 
operand and being clobbered by SET_RD(), which means nothing can go there.

~ Oleksii

