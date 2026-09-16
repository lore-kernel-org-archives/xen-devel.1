Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E359C88E5C
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 05:23:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1422340.1647785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6i7C-0006J4-Lo; Wed, 16 Sep 2026 05:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1422340.1647785; Wed, 16 Sep 2026 05:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6i7C-0006Ix-IZ; Wed, 16 Sep 2026 05:23:26 +0000
Received: by outflank-mailman (input) for mailman id 1422340;
 Wed, 16 Sep 2026 05:23:24 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x6i7A-0006Ir-H0
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 05:23:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6i79-0019RN-E8
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 07:23:23 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aaa27a2-bab6-0a2a0a5309dd-0a2a4508c694-30
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 07:23:23 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aaa27cb-f659-0a2a45080019-4a7de14ca049-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 07:23:23 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-482f6350f91so220532f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 22:23:23 -0700 (PDT)
Received: from [10.250.112.129] (h-213.61.72.154.host.de.colt.net.
 [213.61.72.154]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf37e69sm4246357f8f.29.2026.09.15.22.23.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2026 22:23:22 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789536203; x=1790141003; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7qFLGsBMWm6xJEgJYQAHZtHzOXRYDMZ+HdX9upL3PYA=;
        b=hFOT3mG6Z4EbGXp9g7JX2IGqwrUf/t0osnjIkBlYyMhR1psER5jh1ZUrBevTmQTLGu
         EwvK7iG1A+y4PE2d4xN7f9xoXcS2SyKT/0j37QhLqMmOU1PGyuNmHZTr5+aAcct4PMXf
         SICWD1gQ6bvIujYXZYKKMk+AoG5DrvPyTx7bbUbU9iJewjZqaP8ou8rEc+KIJSWqG9xA
         ymsgD0R5X4egslNtYemufEFn2EJpPbXktMAqaS0MkBme0SE0Flb6gqAsTvmsvFAkAqQz
         gCxxkQ9SzJSDsPCT6xYUMKCRo9RUehS++LB7mvPJDQwwEg4H7MA/590yY5HgrzDUjW5O
         eKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789536203; x=1790141003;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7qFLGsBMWm6xJEgJYQAHZtHzOXRYDMZ+HdX9upL3PYA=;
        b=ZlmijKe36GSg7XVN/x15l2Ix21PeJIkEdZOkH8qOcnPelH+zk7dJyBNcgWTTQkvz7h
         DUTGDi3QX0Afm79sVzaPbOPM4R81WRlNzmsmBXpoJm9hYgpTyTu0vqoJnz+lAirffAxq
         3L1CNmcbW6LCF5saRUYgTNSgvYVF7wVy6801u4SwQhG/vEfS2qPfRcsTbMEjAIPFac1R
         3uSTiBnvulSTlsQ4IRv82IgGz2AGi5y1+gFtxvBhX2RJjg1CoLKkLw12nryVzqi/O0RT
         /5wI2xVEHvD3z9CFkBgcmFWCa96Q3CEi5jFw87Mc4rcQk7eXnAoEBM67rZYn7dWzQQar
         m3FA==
X-Forwarded-Encrypted: i=1; AKwUvBxA4zqQGZ0sPKqUZziqx0FGvHMKPPaSuquyE8VtRdrNQX6VknFbC1HeKP6tuttxX7ele2XKIBGUWt8=@lists.xenproject.org
X-Gm-Message-State: AFuF++lxvRjq3UvT6Ku9F/Y1Jnt5z0iLSNEsgu0gs9HziorTMZnYpHy5
	bfhO0ybOi4jGDuUmEhKXNeIRyO+SKzHvwbHtHrWnOIMJuSBfaSN67WgW
X-Gm-Gg: AYBFou2U0AEjN9C89s+hHxyktK81Y4e9we4GtuuFBrOAfo4J9gwlEdWlGc7+euYHUjq
	3Uw2p8zchInzgzow4OqVqw+LVNOu7zK06ndPEUWdhsd9O8gGOCUY8LK4mGKq9vXjwaoofTdzsDH
	/15DlMvF8VgFYwKf0Kf1EU0ieLzOp3YNbO2UHu3rW0KlK8UtdQU1txhJWrTn/1jUitCCOTNTvtd
	nHw1i3allysE/uKQlPOhPfJvGap4I3xLpPGia8nbRACRFlIT6PjfznHL14/HyzjQXX3PZtdaVBf
	Pbc4vQSGyFR1n1zsthI2Nm/jOfXkajp5f1RURalnsQyLJAunkwoUOt48DD+stdceg7zOGbaspm6
	M7gBN5gngV0dKPt9BH6QI4kitdI+LLvginVIARO8sAL3LKEXJjR6+yMMXr23owZQgkZEzOojWG0
	zlPDDVm+5by6o7Jwrk7f6XZZu0SKD0EI6+G7ogD2y8sKFJZVdSoDnpY/iDQrn4cklb2zdyJFBxO
	fR/mHBiS37TjRgEuVJCHH/mc50GNYFDdZSyNudF/IYkrtJS
X-Received: by 2002:a05:6000:2901:b0:487:aa6:c90d with SMTP id ffacd0b85a97d-4870cf09f05mr1350827f8f.1.1789536202786;
        Tue, 15 Sep 2026 22:23:22 -0700 (PDT)
Message-ID: <c0a45e21-9add-46d5-89cd-786ebae9040e@gmail.com>
Date: Wed, 16 Sep 2026 07:23:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 26/39] xen/riscv: add guest store emulation for trapped
 MMIO accesses
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
 <230c35550edff0b2b8480b6728614305951fe5cd.1787838835.git.oleksii.kurochko@gmail.com>
 <9d4600c6-258e-4990-b1f1-3c86037227b3@suse.com>
 <900ec227-8960-4033-90f1-054180ad56b3@gmail.com>
 <68b71d51-3784-472b-ab1c-b24b98ccdd27@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <68b71d51-3784-472b-ab1c-b24b98ccdd27@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1789536203-CD14E87B-EDD98216/10/73395122804
X-purgate-type: spam
X-purgate-size: 3657



On 9/16/26 7:15 AM, Jan Beulich wrote:
> On 16.09.2026 06:53, Oleksii Kurochko wrote:
>> On 9/14/26 2:01 PM, Jan Beulich wrote:
>>> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/emulate.c
>>>> +++ b/xen/arch/riscv/emulate.c
>>>> @@ -453,9 +453,28 @@ static int emulate_load(const struct guest_fault *gf)
>>>>        return 0;
>>>>    }
>>>>    
>>>> -static int emulate_store(struct guest_fault *gf)
>>>> +static int emulate_store(const struct guest_fault *gf)
>>>>    {
>>>> -    return -EOPNOTSUPP;
>>>> +    struct cpu_user_regs *regs = gf->regs;
>>>> +    mmio_info_t info = { .is_write = true };
>>>> +    struct decoded_insn di;
>>>> +    int rc;
>>>> +
>>>> +    if ( insn_fetch_faulted(gf, &di) )
>>>> +        return 0;
>>>> +
>>>> +    if ( !decode_ldst_insn(&di, guest_xlen(regs)) || !di.is_write )
>>>> +        return -EOPNOTSUPP;
>>>> +
>>>> +    info.data = *guest_gpr(regs, di.reg);
>>>
>>> This came to mind only here, but applies to the earlier patch as well:
>>> There's no checking of di.len, not even by an assertion. The above is
>>> fragile as to extensions like Zilsd. Zilsd itself may still be okay as
>>> the overrun of the register field will hit the correct one, but the
>>> general concern remains (plus of course that moving across fields is
>>> UB).
>>
>> Nothing can produce di.len > sizeof(register_t) today, as the 8-byte
>> cases are all gated on xlen == 64, so I'd add the assertion at the point
>> where the lengths are assigned, covering both emulate_load() (where the
>> shift calculation would underflow) and emulate_store() at once:
>>     ASSERT(di->len <= sizeof(register_t));
>> right before decode_ldst_insn()'s final "return true".
>>
>> Probably it makes sense to have just "if (di->len >= sizeof(register_t)
>> )" with the comment and then return false in deocde_lst_insn():
>>
>> +    /*
>> +     * An access wider than a register could not be carried through: the
>> +     * register operand guest_gpr() hands out is register_t-wide, as is the
>> +     * value an emulated access moves. None of the encodings above yields
>> +     * such an access, the 8-byte ones all being gated on XLEN=64, but a
>> +     * future extension might (Zilsd, say, whose 8-byte accesses exist
>> for a
>> +     * 32-bit guest).
>> +     */
>> +    if ( di->len > sizeof(register_t) )
>> +        return false;
>>
>> (i think that the same could be also true for D and Zdinx but I will
>> mention only Zilsd as an example)
> 
> Since you don't support floating point extensions so far, that's probably
> best. I don't quite understand the mentioning of Zdinx, though: That
> extension (by itself) doesn't add any memory access insns.
> 
>> Also, I think it make sense to add the comment to guest_gpr() than
>> di->len is checked in decode_ldst_insn(). Alternative will be to update
>> the proto of guest_gpr() and pass `di` and then have extra ASSERT() in
>> guest_gpr() for the case if someone will try to use guest_gpr() without
>> using insn_fetch_faulted() & decode_ldst_insn() before guest_gpr().
>> I will apply this alternative way, it looks to me better for now and
>> then will add the following ASSERT:
>>
>>       /*
>>        * decode_ldst_insn() is what fills @di in, and it rejects an access
>>        * wider than a register.
>>        */
>>       ASSERT(di->len <= sizeof(register_t));
> 
> Here and above using register_t won't help with Zilsd. The type is tied
> to Xen's xlen, but you mean to check against the guest's here.

Oh, you are right, it should be guest's xlen.


Thanks.

~ Oleksii

