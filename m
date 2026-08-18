Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4552C5DF7D
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 16:05:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394342.1633171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwMIv-0002ao-O5; Tue, 18 Aug 2026 16:04:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394342.1633171; Tue, 18 Aug 2026 16:04:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwMIv-0002ah-LO; Tue, 18 Aug 2026 16:04:45 +0000
Received: by outflank-mailman (input) for mailman id 1394342;
 Tue, 18 Aug 2026 16:04:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wwMIu-0002ab-MG
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 16:04:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwMIu-00FkPm-2w
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 18:04:44 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a848287-8faa-0a2a0a5109dd-0a2a450a9638-46
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 18:04:44 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a84829b-f2d2-0a2a450a0019-d155dd32acef-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 18:04:43 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-47f703a9e5dso2251976f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 09:04:43 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4999d0fb85csm188392425e9.11.2026.08.18.09.04.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 09:04:42 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787069083; x=1787673883; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R7E3RhGjcMrQEACWget1/Qhjbhr69AQstIrEKp2WYwM=;
        b=L1YkYX0wjVFThOMWbEJ1g0Rl1Zsuxn8TPql9pCR1r/sM8gI9ZXccB2MdvSYYhNjLCS
         A04bxSA+i/l+JsXFEg+jQn1fz2jZi8jCrF/MA2k9M8UEPp/imYgWqeGlGuqG8LNyOmhd
         z5F4d3yR8H8csUWO3pIku4I2zteGLyIuzGYgqEhcijMtEMDlNl7EJLFH48xpURaAMP7I
         VwY739/vW0I56oneaa4OOPS0BCol8SLNndEaKBY9/VdPuF7O1cA8g9esLFwcpS9GvD3l
         mJLmRmJKCWbv9Qe+XWOq7gwO7dR99VZDnqzA6qLh9dfGuc8G98FOs0WHRDLHyfMPVa8l
         vqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787069083; x=1787673883;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R7E3RhGjcMrQEACWget1/Qhjbhr69AQstIrEKp2WYwM=;
        b=Oty4D7PtWv+qa/3fH/K5OnrYbPRYznFsJ394f9ChW0BGXklFOxsAl1qhX+Cl3PCNAO
         hbpnFqtF3+11xYfiwj+Tk1ZmdlCH/crlpAtcaRIi4lg+VVNdElFg9Z+LGiXfNqqzGYOp
         LWUBWKl7JSDF3ygohbOV5EbDwMpKgmkCMUyOaFvzFYAeveXpbU0MBzbgNhTz91MXbCRS
         d/tP2oyLkTpdfU3Cey+BgRe3+yJAHZihoW75QwO6Vgu7lbOSey9LhQFnxXGn4BrohpDe
         uASYzEn6srFVa1lcowcj3GGzAjFj05gAER1VqA0CL4BUeF/43lvtqjnZ4VMrXBWw3KLB
         Sf/Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr90q9yDRo5v2MvD6Shz911r/S3gbhlkGWzZhSIc5UteND5vfD3oJ5qKUmNhXeyq0vBE195nBU8pR0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyxc4QDdap7dxWXXaY1H3xppUSJ8++lvncY/Ge2NpKcbvVAufOr
	O9yjSusgQFEhEMGtLr+BfzBodg4G7oIPnc7/nQvtOWkqKG6kaoC1P0YX
X-Gm-Gg: AR+sD13ovL2pcc8UW03D+x1BRKmbGAbxc7NlWOYb9ob+e5TYuAAvvH4IDclDz0vtboP
	4OveKDBoDDNsoSDiL707tXKw7gNs7lKlwffH5fa/Ea+xQPL81eWXrVLG/t6VYWDS7iPkBcKTgEO
	Wz/xDaTVvd9rP8l4IIj0BvDA3NZ2O+DoYFsKrIvL7GU7ylTpvSBvRC7q3pT2zjdB333Uc+jt0gV
	7VIIl2ZY7E438zm8LfVn8GR/u3VD1B+WzA1rQWKRbKVoRRRhMnoQ0kN+RzgpNYxGVE9ZFxzCl0e
	dZrempi7AZ+W0Wjvs1dFh7CpkqWWtJ7yhX9SRaXJQHyZUL78wgTZoFnEudKxtbv3ACoM7criXcZ
	AmOpt5EYr8Bj9tHyC7bMXd3Ig8WfdruIb4HLuNRCxcyKks9D0HH1Trrz5vMngc6sr+pWUBTEWYi
	R3LX/dPeNdWe/bC/MWpMzjtG9FHcGtF1PdycLDhHYBnZ/Je7VA3v2YhgL9euf0VzF7eWUJSrDqw
	9LBAsISa0pyGnuW3YuXTQas7y/B52rr1X+gPpeWP5U=
X-Received: by 2002:a05:600d:16:b0:499:a5c8:c6f3 with SMTP id 5b1f17b1804b1-499a5c8c74fmr84239055e9.3.1787069083162;
        Tue, 18 Aug 2026 09:04:43 -0700 (PDT)
Message-ID: <fa2924e9-139c-4cdc-9dd4-4b3a26a21fa2@gmail.com>
Date: Tue, 18 Aug 2026 18:04:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 14/17] xen/riscv: add guest page fault handling stub
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <7ef8919f12c269d180a2b56a83218cc54e0e357c.1784560663.git.oleksii.kurochko@gmail.com>
 <ab3eb1be-ec62-42ae-8966-e2801752ce4f@suse.com>
 <61b9f565-7193-4192-9f57-1b4bd258fc11@gmail.com>
 <f6e12465-dcd0-4f04-bdd4-8e1943e1ade7@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f6e12465-dcd0-4f04-bdd4-8e1943e1ade7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1787069084-504CFCFC-7FD3143D/10/73395122804
X-purgate-type: spam
X-purgate-size: 5466



On 8/18/26 10:29 AM, Jan Beulich wrote:
> On 17.08.2026 18:10, Oleksii Kurochko wrote:
>> On 8/12/26 5:48 PM, Jan Beulich wrote:
>>> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/traps.c
>>>> +++ b/xen/arch/riscv/traps.c
>>>> @@ -191,6 +191,67 @@ static void timer_interrupt(void)
>>>>        raise_softirq(TIMER_SOFTIRQ);
>>>>    }
>>>>    
>>>> +static always_inline unsigned long get_faulting_gpa(void)
>>>
>>> May I suggest to use always_inline only when inlining is _functionally_
>>> required?
>>
>> Sure. But it ins't clear to me why it isn't a case here? Is it connected
>> to that function is static and too simple so a compiler will do by itself?
> 
> Counter question: What is it that would functionally break if the function
> ended up not being inlined? (This is the question you generally need to
> answer to justify use of always_inline. Of course there's the additional
> case of performance being affected, but I don't view that as applicable
> here; I'm open to be proven wrong, though.)

Now it is clear how to identrify if function should be always_inline.

I put it only for the purpose to be sure that this function won't be 
called with prologue/epilogue but I agree that compiler will do that by 
itself.

> 
>>>> +{
>>>> +    /*
>>>> +     * According to RISC-V spec:
>>>> +     *  18.2.8. Hypervisor Trap Value Register (htval)
>>>> +     *   ...
>>>> +     *   A guest physical address written to htval is shifted right by 2 bits
>>>> +     *   to accommodate addresses wider than the current XLEN.
>>>> +     *   ...
>>>> +     *   If the least-significant two bits of a faulting guest physical address
>>>> +     *   are needed, these bits are ordinarily the same as the
>>>> +     *   least-significant two bits of the faulting virtual address in stval.
>>>> +     *   For faults due to implicit memory accesses for VS-stage address
>>>> +     *   translation, the least-significant two bits are instead zeros. These
>>>> +     *   cases can be distinguished using the value provided in register htinst.
>>>> +     */
>>>> +    return (csr_read(CSR_HTVAL) << 2) | (csr_read(CSR_STVAL) & 0x3);
>>>
>>> Well, okay, but instead of not losing the bottom two bits you're now losing
>>> the top two ones.
>>
>> Oh, right, I will add a cast ((uint64_t)csr_read(CSR_HTVAL) << 2) | ...
>>
>> It will cover all the cases RV32 which has 34-bit guest address and it
>> will be enough for RV64 where GPA is 59bit (the highest possible for Sv59).
> 
> Only if the function return type then also changes.
> 
>>> Also the spec reads as if htval only _may_ hold the original address of the
>>> faulting access. What if htval ends up 0?
>>
>> good point. then we have to emulate fault instruction and get an address
>> from an instruction. I think that for now it will be enough just to
>> support platforms which always write GPA to HTVAL.
>>
>> If I understand correctly if htval is supported by platform then htval
>> will be always filled for guest page fault. To verify if HTVAL is
>> supported we could do:
>>
>> 'Unless it has reason to assume otherwise (such as a platform standard),
>> software that writes a value to htval should read back from htval to
>> confirm the stored value.'
> 
> How does this matter here? It's one thing for htval to be capable of
> holding (all?) non-zero values, and another that it would always be
> written. If the platform doesn't indicate the behavior, I fear you have
> to assume that you may (perhaps even randomly) observe 0.

So to be very sure we could check for two extensions: Sstval and Shtval.
They will guarantee that under any circumstances it will be filled.

Also, as an option we could check that htinst value isn't zero as 
according to the spec:

For guest-page faults, the trap instruction register is written with a 
special pseudoinstruction value if:
(a) the fault is caused by an implicit memory access for VS-stage 
address translation, and (b) a nonzero
value (the faulting guest physical address) is written to mtval2 or htval.

So if htinst != 0 then htval is filled with GPA and a nonzero guest 
physical address written to mtval2/htval shall correspond to the exact 
virtual address written to mtval/stval.

But if htinst is 0 then we have to do VS-stage software pagewalk to get 
GPA and also we will need to decode instruction to get GVA.

I am thinking if it will be okay for now to cover the case htinst != 0 
and have BUG_ON(!htinst) to not miss that the possible future case when 
VS-stage s/w page walks and parsing of GVA from an instruction are 
needed. I think it is fine as all real boards on which I was able to 
test Xen has htval and stval properly filled and of course QEMU code 
guarantees that htval and stval will be properly filled in the case of QEMU.
Also, KVM is based also only htval and stval and I assume that they 
tested it on real hardware too so it seems like it is okay to go with 
solution that for now we are using htval + stval to get faulty address.

> 
>> And is it true because:
>> ```
>> A value of zero in mtval signifies either that the feature is not
>> supported, or an illegal zero instruction was fetched.
>> ```
>> (yes, it is about mtval but I asssume that htval has the same behaviour').
> 
> Right, but what you quote is specific to illegal instruction exceptions.

Oh, right.

~ Oleksii

