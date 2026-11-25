Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84AA606A327
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 08:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ihIheT3q
Received: from list by lists.xenproject.org with outflank-mailman.1501904.1697905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xW8fj-0001RZ-Eq; Wed, 25 Nov 2026 08:48:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501904.1697905; Wed, 25 Nov 2026 08:48:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xW8fj-0001RR-BZ; Wed, 25 Nov 2026 08:48:11 +0000
Received: by outflank-mailman (input) for mailman id 1501904;
 Wed, 25 Nov 2026 08:48:10 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xW8fi-0001RK-Fc
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 08:48:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xW8fh-006uPu-Og
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 09:48:09 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6b06a0c0-bab6-0a2a0a5309dd-0a2a4507e99e-16
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 09:48:05 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6b06a0c5-b4ea-0a2a45070019-d1558030e4d0-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 09:48:05 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a35a60499eso43157015e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 00:48:05 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb85399d52sm487961055e9.6.2026.11.25.00.48.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 00:48:05 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596485; x=1796201285; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FpkL0MqKrqXERerHHw3YMHVf4SApLGcBg/FEZflY4OU=;
        b=ihIheT3qpBZGjtY5kSHshVzpJ03HwCc/Gn6tbR2rilrFXTkgrxvEbyVyqP4smOaq0G
         +DkU2m/+4nl+pZ4byxXbQxQtU4jeLzCrYaO+Xl0LDh/mVxomGg7bebK35yemgbGAEANZ
         GSM2LPi3tgB6pKGGTd3K2YVCikqCZjBC+0funU8UI2vKOOexGsH4ZVen145foKuDWngR
         bwzFnkiuStCTzU9nLKxASCXruK3DU3SN7UAgcAArGUrjFMfFJGe4/uZ1UJc8m/SFUCiH
         4V7zqHdYfoT/hHa0ko0n2xR4QjT0bSeN51Nt4U+JlrsQ4LQsfO+JIkr7MSIGrU1XLzKr
         RNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596485; x=1796201285;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FpkL0MqKrqXERerHHw3YMHVf4SApLGcBg/FEZflY4OU=;
        b=N0qEbzWLbjtvnzh3ahwm0EwSLnPmZjG8KVPbmfkz2C3HrZIMuN7QKmt4OT5z+LHzl3
         VDqjaOHyIjiKd9Y5KzMH50CLbAn54MsBvSjcILiKrx+LBTUnn7WQEQuN4bXTmQkaIMuC
         x/KPuuooJlVWJmL/qzba5psh6l02AWRdDbSeY/6VlzWVzsUFQFrds/wr7dkjv45kU8uM
         n8NhlLsfqm2SQcb7TyqKj2/07qieTkVdEwZTDKwJC1a9pH7++bNoR6VjGM2TiVsT6lJ+
         EjwHSJi/fFCu9IjN2gUtXeXpjQOZttM5UacuPyF5ILU2pnk0oeHVRIHLoRoH4C4Ik0af
         cESQ==
X-Gm-Message-State: APuU4Z8bcLSzwHEU6XOcSCp4rNvoFwunZFVtyW33HVaTPFIjqL7MW83l
	glHMMYMZTP+OLQ8AU8eCQ0Sz3U1E1lASfcB5TlrukHXdvdARIP8Mz2DS
X-Gm-Gg: AZFdTZegH0s+7DE0VdsijCJr8HsrLbm8SOuldcnUhxC46VAGChubNaaTlvdysY3h4wv
	F2aLStPoASJy4kW8r+YEe2XbTLsMc+IksD4OjvBpLzpNYBJejhu6TmEOzHvCUagpfVu+fhskRxq
	aY4T2iVSLPZ3Vi2sjDxfFUON4k/YcnvRxEhTIPZuy316sn0l3YyWp6FY8AMua+R/7dFGFAejuR9
	cg067EGv8Y6YItORIkcdKaHtTG8n8VdoLziaR4l34Ettyn4DzOTPgfma82S9jSMv5WXJlYa67vI
	lkxSxwnfvXiK6/NP2Ha7E5uVGb9Do+UN7SczqZfG2T0IDsY+zxEWQ0VT3UURKrhTvk/uitQ10EL
	ZC7OlymbpaI1ap0lSs99s7dlt8jz7LgZXv79J+u3Ap+f4mHns30CEPoE5bLrng6xHAshlrJoo35
	mzdoD0byDXj9yeSS7UfiOBewkj7BBmhra8RgyMnSXIZAQxs742ZPsWG6fesg0prFlZZjvTvOkpz
	C6nuOkA9Kia7Cdj8ew4waXjyrCVrUpzdmFgijdhyKr9r4Tm/8wQVATBYN9//aE6RN3rwkZOlLgU
	q+CrRAkR9y1GbZbQLwPjP5FVsAOq4yWX0kzLhRYWk1ke9dXoO7UQcc5sJTipWBxhPrVhN3I2pKk
	HsQ==
X-Received: by 2002:a05:600c:46d3:b0:4bb:6687:5394 with SMTP id 5b1f17b1804b1-4bb888097b0mr355083575e9.9.1795596485290;
        Wed, 25 Nov 2026 00:48:05 -0800 (PST)
Message-ID: <9e48d67a-42fb-46e4-92b1-fb6fcc2bab18@gmail.com>
Date: Wed, 25 Nov 2026 09:48:04 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/42] xen/riscv: introduce csr_volatile_read64()
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
 <a5a546afe987f3f040c5b942ae01579c4854b94c.1794562488.git.oleksii.kurochko@gmail.com>
 <1794995418.8631fc262581453bbf619ec5b2062170.1a1ee10758e0006d3f@vates.tech>
 <cb819638-8a44-4485-8e50-9c1408f9ef28@suse.com>
 <09ed219f-5b4f-45f3-944a-b65c446d3274@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <09ed219f-5b4f-45f3-944a-b65c446d3274@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1795596485-372DCAE4-3805066A/10/78276251493
X-purgate-type: spam
X-purgate-size: 2944
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/18/26 11:57 AM, Jan Beulich wrote:
> On 18.11.2026 11:49, Jan Beulich wrote:
>> On 18.11.2026 10:50, Baptiste Le Duc wrote:
>>>> On RV32 a 64-bit CSR is accessed as two halves, <csr> and <csr>H. Reading
>>>> the halves with two separate instructions isn't always safe: for a CSR
>>>> which hardware increments, a carry from the low half into the high one can
>>>> happen in between, so a plain pair of reads can produce a value the CSR
>>>> never held. Therefore the high half is re-read and the sequence retried if
>>>> it changed in the meantime.
>>>>
>>>> Only CSRs which change under Xen's feet need that, hence the name. The
>>>> majority can be read with a plain pair of csr_read()s, so no helper for
>>>> those is introduced here as there would be no user for it.
>>>>
>>>> Use it for CSR_TIME, which is exactly such a counter, and widen cycles_t to
>>>> uint64_t. Otherwise get_cycles() would still truncate the time counter to
>>>> 32 bits on RV32.
>>>>
>>>> No functional change on RV64.
>>>>
>>>> Fixes: a541ddadec0a ("xen/riscv: introduce time.h")
>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>> ---
>>>> Changes in v4:
>>>>   - Take the CSR name without the CSR_ prefix, so that the macro parameter
>>>>     is used as an operand of ## only (MISRA C Rule 20.12).
>>>>   - Drop the (void) of the ...H constant on RV64.
>>>>   - Initialise hi_ in its declaration.
>>>
>>> Jan gave his Reviewed-by on v3. It is gone in v4. Dropping it may be
>>> fine given the macro rework, but please say so in the changelog :)
>>>
>>>> [ ... 45 lines skipped ... ]
>>>>   #else
>>>>   #define csr_write64(name, val) csr_write(CSR_ ## name, val)
>>>> +
>>>> +#define csr_volatile_read64(name) csr_read(CSR_ ## name)
>>>
>>> Nit: On v3 Jan suggested "#define csr_volatile_read64 csr_read64", and you
>>> answered you would then move csr_read64() into this patch. In v4
>>> csr_read64() still only comes with "xen/riscv: implement vCPU context
>>> switching".
>>>
>>> On RV64 I think it would read better like that:
>>> #define csr_read64(name) csr_read(CSR_ ## name)
>>> #define csr_volatile_read64(name) csr_read64(name)
>>
>> #define csr_read64(name) csr_read(CSR_ ## name)
>> #define csr_volatile_read64 csr_read64
>>
>> i.e. matching what I suggested earlier. Otherwise what is passed into
>> csr_volatile_read64() would be macro-expanded before further
>> expanding csr_read64(), thus prepending CSR_ only to the result of
>> that expansion. (In the common case there'll be no difference, but
>> things can go wrong if some unexpected new #define appears.)
> 
> Oh, and - happy to fold this in while committing (perhaps with an adjustment
> to subject and description), if you agree. With that
> Acked-by: Jan Beulich <jbeulich@suse.com>
Sorry, for the so long response.

I will be happy if it could be done while committing.

Thanks.

~ Oleksii

