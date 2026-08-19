Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE94C5DF86
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 11:01:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395169.1633671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwe2A-0008FG-03; Wed, 19 Aug 2026 11:00:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395169.1633671; Wed, 19 Aug 2026 11:00:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwe29-0008F8-SS; Wed, 19 Aug 2026 11:00:37 +0000
Received: by outflank-mailman (input) for mailman id 1395169;
 Wed, 19 Aug 2026 11:00:36 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wwe28-0008F2-IP
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 11:00:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwe27-00BrHg-VA
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 13:00:35 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a858cd3-8faa-0a2a0a5109dd-0a2a45059fb0-2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 13:00:35 +0200
Received: from [209.85.167.48] (helo=mail-lf1-f48.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a858cd0-4cb1-0a2a45050019-d155a730d90b-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 13:00:32 +0200
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5b021916bd3so1305524e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 04:00:32 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b4788f737fsm433190e87.79.2026.08.19.04.00.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 04:00:31 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787137232; x=1787742032; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eD5D5e29mk32kIOISPWSXEb3EOHjbKF0TWimAd1P+qg=;
        b=OLMPMORrT92g+ZrQIpBGfWeXP9mogYIWbirt+mNVqE7RF5C8JAyDoPDKc6yaLgFobr
         +9eSRx26ePzeJG4RPKTHfiFY+ameEYPQg/roo4Ez1qUTjBx3lOMWImPlTgY3znhPxYfX
         GVba4hgiff7n8IN+6xW4ZklTZqkLhw3te1nyoxN6sEYHBTRyEbB2aZ62W3sRk/DuQO7E
         W3ELeASviPvbUOm8sF1BlFDcmUnQ+p0v9dgKWPRYj01X6DC6GXj5JIaNpCg6io1CNsgq
         bijd7BEBZ0s4xIoWV0uY7YtX3o4M/iRszQ9ZnZyv03CP6ngLQZedGHSnHqpAk3w41rGI
         TXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787137232; x=1787742032;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eD5D5e29mk32kIOISPWSXEb3EOHjbKF0TWimAd1P+qg=;
        b=mlg2WYbSpcLybTCOBN6TV8zp+6CapaLO6LU4dDTxmswRhZTMOWuM0URYvMOhRn4WLz
         CUgmPOZo4U92xDZa990YAuHu9htlRdo/oj//4W7q9zEQ06UzRxoDUN8dmiUp8aAyMebN
         o1CHeRmeNwMAa7kS1o1frqRUI1ipONAOkJgCT208cx4gQ9y7yCImn9zipUNFXgPvuXvX
         JXEfDksj8/0XdLXGrNSNCqxZRiq5+7E7i6UlbSs+6JBs69hutYlcSq2tR4x1XRBam8C7
         VaDDbCm8MPTlNI510JbfIWJGbLYTt1QoESkXbiiQREbtHBmvqP+lLmDMs66yz+1ZG9Ch
         ZVRw==
X-Forwarded-Encrypted: i=1; AHgh+Rry1fcxkiEFj1cuRaiWY2CEBhk/KYxyIhuZyZXXCcGq4THW0FMF3lescV4KnSFXpmfjT+0VTSMA+0c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwuZWK11/3ogQnc/11MBiXofIVaNxSwf8SszB3migX/gJAEGTgr
	OcvZn35JCjLbzPiqJ07UMCgGWP1OLg+Vd6pI23QTOsilvQzyo6lZ1P45
X-Gm-Gg: AR+sD118vwecJuAgEFJMNdbSBFSyDfHrOSc4Z0RTG9yaBH8kJXO2l4I8PIO0Vj2bo7H
	Fz9riXIJv+khR92et0F+RtEGyov76tpms0vaxm43jjMMJFG8HHANXqxUH+pnjn/gHa4I3QGPYOC
	i3pEBtZ70GZkKheVFdFyxEj8YSn+7rOD2CNLP43oDnui4Kxv6hns7z6JTQm+8tlG3XViqwlAoEU
	fe6MJEveWqowvJbaal0JH3owpq70j0tQ+HYvUHMMKCCUhMmE9EZpyJw7kV8lfGaMT+5SP5wDTsN
	HcaSyy6cPvEGQI3rZ7k0Xx2NYC+QbpEDChZejuRnUJBv7QamHNEeHFbKkQhyZaBDJIcBxHdx7ki
	Sbws1zo3Ohw+JGHti/m2f/6EZy9apuhZZrwq4sHDEItbCR+lUshEmrh8gtERLlBR1SQMN/S4Xb7
	9qe5yMlfy2t8CsCfoxD9AjD/atKvQB1U4wr7CrgiwXU9buP0bexuNF2qcxttIJKIOXjDW2xhlbl
	2J6ZbN6llUASDbmuf7sObYNP/5s1YoWBt2hbGdj4Nd0okyozvWpaQ==
X-Received: by 2002:a05:6512:31cf:b0:5b1:5379:8b6d with SMTP id 2adb3069b0e04-5b478bcdf1fmr1165821e87.23.1787137231921;
        Wed, 19 Aug 2026 04:00:31 -0700 (PDT)
Message-ID: <abe3e920-7cbc-4714-9fb1-0553c2f539e0@gmail.com>
Date: Wed, 19 Aug 2026 13:00:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 16/17] xen/riscv: add guest load emulation for trapped
 MMIO accesses
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
 <9b18a20367754605efd6a6b5bf09d4483d9c3ab2.1784560663.git.oleksii.kurochko@gmail.com>
 <7a2e46da-5b1f-448e-aba3-7eefe0a61950@suse.com>
 <20a4599a-f14e-4c7f-a765-52c1ab667516@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20a4599a-f14e-4c7f-a765-52c1ab667516@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1787137232-738BE2A1-A04F713A/10/73395122804
X-purgate-type: spam
X-purgate-size: 2219



On 8/13/26 9:28 AM, Jan Beulich wrote:
> On 13.08.2026 09:15, Jan Beulich wrote:
>> On 29.07.2026 15:40, Oleksii Kurochko wrote:
>>>   static int emulate_load(unsigned long fault_addr, unsigned long htinst)
>>>   {
>>> -    return -EOPNOTSUPP;
>>> +    struct cpu_user_regs *regs = vcpu_guest_cpu_user_regs(current);
>>> +    mmio_info_t info = { .is_write = false };
>>> +    unsigned long insn;
>>> +    unsigned int shift = 0, len, insn_len;
>>> +    bool is_unsigned = false;
>>> +    int rc;
>>> +
>>> +    if ( decode_trapped_insn(htinst, &insn, &insn_len) )
>>> +        return 0;
>>> +
>>> +    /* Decode length of MMIO and whether it is a sign- or zero-extending load */
>>> +    if ( (insn & INSN_MASK_LB) == INSN_MATCH_LB )
>>> +        len = 1;
>>> +    else if ( (insn & INSN_MASK_LBU) == INSN_MATCH_LBU )
>>> +    {
>>> +        len = 1;
>>> +        is_unsigned = true;
>>> +    }
>>> +    else if ( (insn & INSN_MASK_LH) == INSN_MATCH_LH )
>>> +        len = 2;
>>> +    else if ( (insn & INSN_MASK_LHU) == INSN_MATCH_LHU )
>>> +    {
>>> +        len = 2;
>>> +        is_unsigned = true;
>>> +    }
>>> +    else if ( (insn & INSN_MASK_LW) == INSN_MATCH_LW )
>>> +        len = 4;
>>
>> Already up to here this demonstrates a weakness of the INSN_MASK_*
>> set of #define-s (which I similarly observe in binutils, and I expect it
>> all has the same questionable origin). All INSN_MASK_L* and INSN_MASK_FL*
>> (also INSN_MASK_S* and INSN_MASK_FS*) are identical, allowing for a nice
>> switch() to be used here in principle. That said, with access width
>> nicely encoded in FUNCT3, it's not even clear whether a switch() would
>> end up being needed / efficient.
>>
>> Otoh none of these masks cover the pseudoinsns that htinst may supply.
>>
>> Further, what about A-extension insns? Some (if not all) of them can
>> plausibly be used on MMIO, I think.
> 
> Because of the further additions that are going to be needed, may I also
> suggest to consider putting emulation code in its own file (emulate.c
> perhaps), rather than directly in traps.c?

Good point. It really makes sense to move emulation now to emulate.c.

Thanks.

~ Oleksii

