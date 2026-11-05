Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77355606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 08:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hbNBqKnY
Received: from list by lists.xenproject.org with outflank-mailman.1474268.1681437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOt93-0002Ng-6R; Thu, 05 Nov 2026 08:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474268.1681437; Thu, 05 Nov 2026 08:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOt93-0002NY-3a; Thu, 05 Nov 2026 08:48:29 +0000
Received: by outflank-mailman (input) for mailman id 1474268;
 Thu, 05 Nov 2026 08:48:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOt92-0002NS-7H
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 08:48:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOt91-00H1ox-KK
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 09:48:27 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aec42d5-bab6-0a2a0a5309dd-0a2a450cec56-22
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 09:48:27 +0100
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aec42db-f479-0a2a450c0019-d155802dac9a-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 09:48:27 +0100
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a59100fa83so14506245e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 00:48:27 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fed55249csm7497952f8f.35.2026.11.05.00.48.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 00:48:26 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1793868507; x=1794473307; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LBSVPVna0p+ZSmL9B1Kv5sQUUfpmqGVjhu3H5D8Po38=;
        b=hbNBqKnYBvcaUyzXixjPxkWRxyCiE9qHkJ7QlwJFowD/Nxwg3BiH1ENZVo2t5kqmis
         EQMlcNhUTMW+zsMUsANSU3rY/7u0C4291oZ9F0VtoX3sPjdSzmCkO0IkYjUeeG8JLQTT
         6QsPkOYdKYA4poKsoYqPzK2lS2bWJaTTk+c1khEH462nwJfXTcjiTwfpxBU4gpCp9Owe
         Drd2xmyaZU/tXH+CgBkhklXZpGmhbg4G0ws7fGwJk1/QNBeMJEh/NFVS8aKELvlSSQo/
         J8A5UajyTmssiezBZaoTfr2QHD8UC4cfq17ieTxP9VlWOUEzc/5NX+6AaZixvtDMJeOm
         6XCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868507; x=1794473307;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LBSVPVna0p+ZSmL9B1Kv5sQUUfpmqGVjhu3H5D8Po38=;
        b=xQRpqHKVx4GLBl+qyyfQoMaW8xWsPXGwpcJvjrvWow2aEoga5NotUH2OnOSFw7iPc2
         9FhuyTjFQSPH8Hm5O+BxrlLUhmwSAOIfZO2Xbuxfojkv5KaIrNT1oHXqfk4SW+lOGUk1
         R7ANo2YFHXNjIxc3VMVi25UARBCUxN400xfQ9CWkF2zGWOOdq+MrmaGEDaFRG8fj+jGv
         FbjObj/15X2zSSH9mAyOxlxRPi87PJYRpUv1eEqliY03QGMKt3JHsRv8832+fWtuEtN3
         i0tJKtYjI+Nax7BODWwg5OI2nPIBRxi3BsMlezBQEbCcVadTZ36UjfpZtJnhd556R7mW
         LX/Q==
X-Gm-Message-State: APuU4Z8bs20nJYhoKHgRGjvOofy17/a9Mdl1Fa5+9uTzB29hnO9lwbqj
	F0ksS7sINQB9WRRQK9iZ+blK64IVt+CqzKTGk7V+aJize2L9kvm69h4d
X-Gm-Gg: AYBFou11VlElYe3CiXY+ZZHNaS1L6aFaED4HRQrzUSk2cFkClcds8WNrD2Skk4U0HIx
	ukXNVnIlRsp0iD14cF768zKpJLaTRR5FiZi+Au3X732g7K6Hj6p4zBR53pjAVVZgZCkRDXdiRJy
	ULV54VZue3Q35kcysc7I4JOX+lNpHIBEKlj11VdQasTsdpBxh7n9rYB7eJIkKO5ywkcLbBuDLK/
	trFPqr0ToJbYCWN0SPQ2HacE93gA4Mefl/Ivo9wJeKuxrIDobd/oqoHQvQdaRksafqFRPXHjhcT
	7atGZmK3Rnxbn4e0bKvwGMekzTo5K0vnXXohte3zgiiCricEn9Qm56R4rTbKWogAPXDRYfjLt8c
	9qci8NHo7nJMR4jpd8tATghk+za+pPvQXTkxnqTv+yLT8TjEyftY8/EPcKaYQfhoX44CncH9aJk
	0IiChIWUCJ4m1Oall7KapKN6iIZX0bYL+VY4VgwFlwqjBLEjqzPrFpMUnqGBL5MZ5GkASAPJCjJ
	QD2i7lpEwKtj1TMP222D1SF7wPTa807wReaYhA7T9ho3h8anL6qAL0W0gaGV+50+usQsp5YNVFc
	8f45m4G/gecUVRUkLthf0Zp6cajXn37/+SyJqsAgT4STISU5bjLCz+wI1JxirNwa371Vxb1SqHC
	V3w==
X-Received: by 2002:a05:600d:c:b0:4af:83ad:8f70 with SMTP id 5b1f17b1804b1-4af83ad8fa7mr243283015e9.35.1793868506911;
        Thu, 05 Nov 2026 00:48:26 -0800 (PST)
Message-ID: <8926ec18-5aea-483a-97ba-10e4759ec8b6@gmail.com>
Date: Thu, 5 Nov 2026 09:48:25 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 23/39] xen/riscv: add helpers for decoding a trapped
 load or store
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <bac190288e65f82ef51d85e32c939558c21776d0.1790779209.git.oleksii.kurochko@gmail.com>
 <1792663384.8631fc262581453bbf619ec5b2062170.1a1631070d2000f79f@vates.tech>
 <8f6c0cd1-f5fc-4a1d-8752-3da42a52a710@gmail.com>
 <c121b7cc-30c2-4ba9-b9c9-a52076d25f22@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <c121b7cc-30c2-4ba9-b9c9-a52076d25f22@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1793868507-51339A5B-007A6789/10/73395122804
X-purgate-type: spam
X-purgate-size: 2918
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/5/26 9:17 AM, Jan Beulich wrote:
> On 04.11.2026 17:38, Oleksii Kurochko wrote:
>> On 10/22/26 12:02 PM, Baptiste Le Duc wrote:
>>>> + * It is needed to decode a trapped instruction: the encodings which exist only
>>>> + * for XLEN=64 must not be recognized for a 32-bit guest. Besides those simply
>>>> + * being reserved there, the compressed ones are ambiguous: C.LD and C.FLW
>>>> + * share the encoding 0x6000 (mask 0xe003), and likewise C.SD/C.FSW,
>>>> + * C.LDSP/C.FLWSP and C.SDSP/C.FSWSP.
>>>> + *
>>>> + * IS_ENABLED() can't be used here as HSTATUS_VSXL is defined for
>>>> + * __riscv_xlen == 64 only, the field not existing on RV32 in the first place.
>>>> + */
>>>> +static unsigned int guest_xlen(const struct cpu_user_regs *regs)
>>>> +{
>>>> +#ifdef CONFIG_RISCV_32
>>>> +    return 32;
>>>> +#else
>>>> +    unsigned long xl = MASK_EXTR(regs->hstatus, HSTATUS_VSXL);
>>> xl only ever holds a 2-bit field, so unsigned int would be better here.
>>
>> MASK_EXTR() yields the type of its operands, unsigned long here (and
>> unsigned long long for the UXL extraction), as do the XLEN_FIELD_*
>> constants xl is compared against. Making xl unsigned int would add an
>> implicit narrowing conversion: harmless value-wise but I think it will
>> violate one of MISRA rules at least if build everything with
>> -Wconversion then it will tell: conversion from 'long unsigned int' to
>> 'unsigned int' may change value.
> 
> If we were to follow that Misra rule, we'd have violations all over the
> place. Hence imo where unsigned int is sufficient for a value, that's
> what should be used.

Fair enough, I'll switch xl to unsigned int.

The one thing which isn't fully clear IMO is that in misra/rules.rst it 
is mentioned for Rule 10.3:
      - Please beware that this rule has many violations in the Xen
        codebase today, and its adoption is aspirational. However, when
        submitting new patches please try to decrease the number of
        violations when possible.
then it isn't  clear when it is needed to apply second sentence and when 
no.

> 
>>>> [ ... 49 lines skipped ... ]
>>>> +static unsigned long *guest_gpr(struct cpu_user_regs *regs,
>>>> +                                const struct decoded_insn *di)
>>>> +{
>>>> +    /*
>>>> +     * decode_ldst_insn() is what fills @di in, and it rejects an access
>>>> +     * wider than a guest register.
>>>> +     */
>>>> +    ASSERT(di->len <= (guest_xlen(regs) / BITS_PER_BYTE));
>>> Nit: the parentheses around the division aren't needed.
>>
>> I can drop them but I think it improves readability here a little bit.
> 
> That's subjective. Personally I agree with Baptiste, yet project-wide
> we don't do things consistently in this regard, and hence either form
> is (supposedly) okay.

Probably then it will be nice to update CODING_STYLE document.

~ Oleksii

