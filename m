Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DACDC88E5C
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 05:15:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1422326.1647777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6hzJ-0004dE-V0; Wed, 16 Sep 2026 05:15:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1422326.1647777; Wed, 16 Sep 2026 05:15:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6hzJ-0004d6-RO; Wed, 16 Sep 2026 05:15:17 +0000
Received: by outflank-mailman (input) for mailman id 1422326;
 Wed, 16 Sep 2026 05:15:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x6hzI-0004d0-NH
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 05:15:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6hzH-00E96A-Nm
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 07:15:15 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aaa25cf-bab6-0a2a0a5309dd-0a2a4504de50-16
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 07:15:12 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aaa25e0-b57f-0a2a45040019-4a7de14cbd9e-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 07:15:12 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-4843172bff4so193398f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 22:15:12 -0700 (PDT)
Received: from [10.59.3.202] ([146.0.124.57]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf43511sm4128146f8f.33.2026.09.15.22.15.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2026 22:15:11 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789535712; x=1790140512; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lxewp+tTZQXrODK7DvbcdNn3QRHocyOZLU3+rzgQEyI=;
        b=IDTDhVhn9WMSBhUaUuvTFi+bmpdlNuIjQHf9J/MfkvMKymSK4mkpSb+i1VyKh91Wet
         eywXlJm/pKMEU2a1cUb6pTQxnbEorq3qyVpPxJmg9RDnJ+e5hmZwAtmQidgabnhP+Us0
         uR9pUV6AT9n6I1hx4ubwqkF7V9TlBykyYXmbxg1e6g1m+NfGvacder2Cm8LC4WQDA9qJ
         eO3dc15hR6tMjSn14SJP5dUpe9CP1/at4jolSIkKtm1GyJSq2sdFxQ/PA4nNklQ5kgWl
         MByZh191l83H+SaUI7Vuuk8aX1Q57EQA6yf7/VX6ajz0fO2k/Cg7b0+HWjtGKWQ4//cK
         n8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789535712; x=1790140512;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lxewp+tTZQXrODK7DvbcdNn3QRHocyOZLU3+rzgQEyI=;
        b=XxbczWUdLK5u5vnjhuSw8JWcniPw2CAqOYNTTzI/d9jCDKnobjdC9qXLzoHvarZjDt
         KhHCKbm0Pa7DbohOx/+lSKz5T5qXLhbF3T15LVC/SCnsvynopGIwLGz9bGnWFxhBTzNM
         Xe79i4eXo7zsb5f9pffybgFLp8w4sOd9Wdx++T1u67hgHfSUh2MapRB6Tcz0rFCZYIbG
         ImupJlkXCh5jpgxWjXjuAuLnFpDvagbx2rE7Be3IeWYqaJlOSNupQ7alV4/IBPmxM90u
         FgozMlUtTbJ1WU4BQcLJBnZcN0oywYK9pe1y1dp7tf0TorbXlx/Sn2Mw94ZsiHMFP8XA
         IH8w==
X-Forwarded-Encrypted: i=1; AKwUvBx5o8S0OK12IzUsgp0nDTkSF42wnkXOqlXe7uqwl4g9rbCS+7Q0VqKuCBVj43Lr7TwKN1Uh2IdqJI0=@lists.xenproject.org
X-Gm-Message-State: AFuF++kdj0EFZifS0BpaMZphmkDLfejUGGh33F4d1245YiB/rsozN0n8
	l2x90bc474I7mI2fnByckbBa5tckbKuL9dn8mab07QPPBdqpPWygr+w5bPRPuQAm/A==
X-Gm-Gg: AYBFou0EPqSJWFHJvcISKHAmUTEksG4+YzJZDNvN39BIWUHIegajkcdgJdvDXpt37yy
	iVIlx/YtDPnyPaeJV5PSeebP2JEU7Mnk62Q7pywb2AmfqboGteccjiAmDs5Yw5y7nGcYN+dOI6x
	imheSGjYNjq2Aj5hgfT/WtPlVliWA7H1FbqNeyK3ZtQ3oh9r4UXft3PiPfzUqOx/fi+53QI9GjD
	Y92jUvGrR12XQnWJvKJBQLmxQ4rJlPrKBfU9qJTvvgodbQbi3xmhwbY7G/fVOnyteIrMPU8BZ2i
	HC4sVe2Iipm+JvWbByOXBMidGTRnHXm+KwGKH/I/AVMqvFnyDcA8Wow4QCg6gHqtyIf7VSyeSQH
	ltLU8++vZk6imV5ngJCRxfqNN9TOsyAN7Zv2uCvJfgOGPYxOj3qFdWbUOHMcJnko6chKnsyZ+In
	PzBKpgAgxx94dj4Y6JxJQLz7L9BELx7kQCoJ9DnVG70GXLwkS4dkHAPuL4I65K+tLGJrRcr1glt
	B8=
X-Received: by 2002:a05:6000:24c6:b0:487:a15:b4cc with SMTP id ffacd0b85a97d-4870cf1acd3mr1172083f8f.23.1789535711568;
        Tue, 15 Sep 2026 22:15:11 -0700 (PDT)
Message-ID: <68b71d51-3784-472b-ab1c-b24b98ccdd27@suse.com>
Date: Wed, 16 Sep 2026 07:15:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 26/39] xen/riscv: add guest store emulation for trapped
 MMIO accesses
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 <230c35550edff0b2b8480b6728614305951fe5cd.1787838835.git.oleksii.kurochko@gmail.com>
 <9d4600c6-258e-4990-b1f1-3c86037227b3@suse.com>
 <900ec227-8960-4033-90f1-054180ad56b3@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <900ec227-8960-4033-90f1-054180ad56b3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1789535712-536C2B50-42CFDE75/0/0
X-purgate-type: clean
X-purgate-size: 3464

On 16.09.2026 06:53, Oleksii Kurochko wrote:
> On 9/14/26 2:01 PM, Jan Beulich wrote:
>> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/emulate.c
>>> +++ b/xen/arch/riscv/emulate.c
>>> @@ -453,9 +453,28 @@ static int emulate_load(const struct guest_fault *gf)
>>>       return 0;
>>>   }
>>>   
>>> -static int emulate_store(struct guest_fault *gf)
>>> +static int emulate_store(const struct guest_fault *gf)
>>>   {
>>> -    return -EOPNOTSUPP;
>>> +    struct cpu_user_regs *regs = gf->regs;
>>> +    mmio_info_t info = { .is_write = true };
>>> +    struct decoded_insn di;
>>> +    int rc;
>>> +
>>> +    if ( insn_fetch_faulted(gf, &di) )
>>> +        return 0;
>>> +
>>> +    if ( !decode_ldst_insn(&di, guest_xlen(regs)) || !di.is_write )
>>> +        return -EOPNOTSUPP;
>>> +
>>> +    info.data = *guest_gpr(regs, di.reg);
>>
>> This came to mind only here, but applies to the earlier patch as well:
>> There's no checking of di.len, not even by an assertion. The above is
>> fragile as to extensions like Zilsd. Zilsd itself may still be okay as
>> the overrun of the register field will hit the correct one, but the
>> general concern remains (plus of course that moving across fields is
>> UB).
> 
> Nothing can produce di.len > sizeof(register_t) today, as the 8-byte 
> cases are all gated on xlen == 64, so I'd add the assertion at the point 
> where the lengths are assigned, covering both emulate_load() (where the 
> shift calculation would underflow) and emulate_store() at once:
>    ASSERT(di->len <= sizeof(register_t));
> right before decode_ldst_insn()'s final "return true".
> 
> Probably it makes sense to have just "if (di->len >= sizeof(register_t) 
> )" with the comment and then return false in deocde_lst_insn():
> 
> +    /*
> +     * An access wider than a register could not be carried through: the
> +     * register operand guest_gpr() hands out is register_t-wide, as is the
> +     * value an emulated access moves. None of the encodings above yields
> +     * such an access, the 8-byte ones all being gated on XLEN=64, but a
> +     * future extension might (Zilsd, say, whose 8-byte accesses exist 
> for a
> +     * 32-bit guest).
> +     */
> +    if ( di->len > sizeof(register_t) )
> +        return false;
> 
> (i think that the same could be also true for D and Zdinx but I will 
> mention only Zilsd as an example)

Since you don't support floating point extensions so far, that's probably
best. I don't quite understand the mentioning of Zdinx, though: That
extension (by itself) doesn't add any memory access insns.

> Also, I think it make sense to add the comment to guest_gpr() than 
> di->len is checked in decode_ldst_insn(). Alternative will be to update 
> the proto of guest_gpr() and pass `di` and then have extra ASSERT() in 
> guest_gpr() for the case if someone will try to use guest_gpr() without 
> using insn_fetch_faulted() & decode_ldst_insn() before guest_gpr().
> I will apply this alternative way, it looks to me better for now and 
> then will add the following ASSERT:
> 
>      /*
>       * decode_ldst_insn() is what fills @di in, and it rejects an access
>       * wider than a register.
>       */
>      ASSERT(di->len <= sizeof(register_t));

Here and above using register_t won't help with Zilsd. The type is tied
to Xen's xlen, but you mean to check against the guest's here.

Jan

