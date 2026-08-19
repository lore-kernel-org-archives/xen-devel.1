Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E89C5DF86
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 09:58:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395025.1633568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwd3y-000200-Fy; Wed, 19 Aug 2026 09:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395025.1633568; Wed, 19 Aug 2026 09:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwd3y-0001zt-CV; Wed, 19 Aug 2026 09:58:26 +0000
Received: by outflank-mailman (input) for mailman id 1395025;
 Wed, 19 Aug 2026 09:58:25 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wwd3w-0001zn-Oo
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 09:58:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwd3w-00EKAH-5P
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 11:58:24 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a857e28-bab6-0a2a0a5309dd-0a2a450aa33e-44
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 11:58:24 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a857e3f-f2d2-0a2a450a0019-d155802bd528-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 11:58:24 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so7293155e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 02:58:24 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14c45d1sm4022125f8f.30.2026.08.19.02.58.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 02:58:22 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787133503; x=1787738303; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WwE3QN3aeSi+hrmkACfe8EjgEbp/hhVhsQ8C2TOXVNk=;
        b=FJSSBK7N3fgIjkiO9j/9C/qY2Cw6h793sCLkv/ZEfFfKT8OFXiky09TSF34Z1Yyg71
         vknC5A8q1VQPNRFYhuszFqdfud4sLcqb8+5JjAldhJLEtqmZQ0yj8/zwF/wQr2v3it/u
         9Ozm87boFNcfQ/bV16T9tHcd8D+eMKJC2g8QReZGpP8/zO71LMmXptt69KNYpYhmflc0
         3n8iD47mVDjawUCuAh+8lBsl5O0tGUnqHS/Nq707ESBOQHsA8MiovuFKcfiP8a5WoTWE
         CcA0PaarSPmVc6XzvIHcwTpTh/X1KVTzEwjWLerNOaiE8a5IhdT7Y2PLY2NluqdbKjwd
         VaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787133503; x=1787738303;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WwE3QN3aeSi+hrmkACfe8EjgEbp/hhVhsQ8C2TOXVNk=;
        b=p9ETjk7d+JmhBgQ9D5HzgYtrbHZScRZ45S2sjjlQnqeQu40GWNRPdRAi7Mrtav6ssH
         2plADj9VnQab0cAF45R1ga7UjfH08+3t8whCA6KGZ2IFcpAvkIJMEIVQaFevpsq0+r9M
         fjqQXFoqRjU5Dk5B5ogqhM422ihAgcppbyYWoiO+Ld/5anEC4b8G3LuX8TDhd5c005lu
         l5Q9rkri0rSr5ZNwEojfhbi8vkKSw5Tf8cXFN69z1TTHyV/Q0WlkOALkvG1yitAUn1OO
         dhVOxh5Xry0xl7InmI8KVneSQQFVNFtipZSvgWgGHruk3tnB6JcBvjWq01PHYQnwhI1Y
         gzUg==
X-Forwarded-Encrypted: i=1; AHgh+RqOE1CvkN8mj97PGdgpdEATQKRohcYWt2Qw3ZCyDni2HOEt+hBUu3rWNbSnndR9OaXkYSSGQDxpJ9A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6GaQxw+sODtzhOcS8vb9TVMyoVrWYjWGHSBiE/p3D9kVVcTBo
	4xKQjP+a4nHCBe8wn+CdyjPSM4wsRzM0lDSHJOGLlyHX0tohbKWgzLOI
X-Gm-Gg: AR+sD10FhpSQckOb8F+n2oeO86ORcu8I1q5VaDPhPL6AkGg74+h7IioARCC7u0abN8j
	GDsemqohxgctIbgllcA7SPmnVddfFJ+HIUvB+IlnoPcGgIiqounjTXKgzNSHuwPMW8cL36UAsVZ
	sMo+p0yfzWgoj/1QaBS4DNlAd37XO/WhglfNUiOB1z1rFf1ecQQ4X+6mLeqwk27pivoEkMc+HfN
	M9uu5rWPNkcEFpncEPj8ku1V4NxdYD18lIwCGZi1n7otzPyD30RchKJXU4EI9jJ0N9Hg4gndW5H
	iYmSR7Wewe3ULzsW/AnndseHZXgBK436MrMelprYjwVDGhLRIsIu06+nAUZeXzequyOezIyYUWJ
	bYb5FAUdX/cN60nt//SUQz+3xVzv1sPc4y+wWXjqddtGD1N4QNjVPNCipo8cwoJazCa8e5q4DGa
	vdx0AyGGMTy3QmuB43TjaAC9fUamOnGTFfi8LcvPpBYQigRLSb+To7cwFyJNioRLHY2r40o7yPO
	yJaS0xb64OjUW1zN4EFmPKq1nTxPg8Mk7Ex7T7S9jw=
X-Received: by 2002:a05:600c:524f:b0:499:795a:c5fc with SMTP id 5b1f17b1804b1-499aa17baafmr53213415e9.7.1787133503360;
        Wed, 19 Aug 2026 02:58:23 -0700 (PDT)
Message-ID: <e800e7f3-bd42-4e79-9d5f-9f46f3a2437b@gmail.com>
Date: Wed, 19 Aug 2026 11:58:21 +0200
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
 <fa2924e9-139c-4cdc-9dd4-4b3a26a21fa2@gmail.com>
 <38fd0ba7-562f-49e2-8453-be14f79f1c3c@gmail.com>
 <0d0d45b2-8682-4ae3-9f64-bdcb4add09b1@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0d0d45b2-8682-4ae3-9f64-bdcb4add09b1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1787133504-526DECFC-F47D1AEC/10/73395122804
X-purgate-type: spam
X-purgate-size: 4512



On 8/19/26 11:52 AM, Jan Beulich wrote:
> On 19.08.2026 10:59, Oleksii Kurochko wrote:
>> On 8/18/26 6:04 PM, Oleksii Kurochko wrote:
>>> On 8/18/26 10:29 AM, Jan Beulich wrote:
>>>> On 17.08.2026 18:10, Oleksii Kurochko wrote:
>>>>> On 8/12/26 5:48 PM, Jan Beulich wrote:
>>>>>> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>>>>>>> +{
>>>>>>> +    /*
>>>>>>> +     * According to RISC-V spec:
>>>>>>> +     *  18.2.8. Hypervisor Trap Value Register (htval)
>>>>>>> +     *   ...
>>>>>>> +     *   A guest physical address written to htval is shifted
>>>>>>> right by 2 bits
>>>>>>> +     *   to accommodate addresses wider than the current XLEN.
>>>>>>> +     *   ...
>>>>>>> +     *   If the least-significant two bits of a faulting guest
>>>>>>> physical address
>>>>>>> +     *   are needed, these bits are ordinarily the same as the
>>>>>>> +     *   least-significant two bits of the faulting virtual
>>>>>>> address in stval.
>>>>>>> +     *   For faults due to implicit memory accesses for VS-stage
>>>>>>> address
>>>>>>> +     *   translation, the least-significant two bits are instead
>>>>>>> zeros. These
>>>>>>> +     *   cases can be distinguished using the value provided in
>>>>>>> register htinst.
>>>>>>> +     */
>>>>>>> +    return (csr_read(CSR_HTVAL) << 2) | (csr_read(CSR_STVAL) & 0x3);
>>>>>>
>>>>>> Well, okay, but instead of not losing the bottom two bits you're now
>>>>>> losing
>>>>>> the top two ones.
>>>>>
>>>>> Oh, right, I will add a cast ((uint64_t)csr_read(CSR_HTVAL) << 2) | ...
>>>>>
>>>>> It will cover all the cases RV32 which has 34-bit guest address and it
>>>>> will be enough for RV64 where GPA is 59bit (the highest possible for
>>>>> Sv59).
>>>>
>>>> Only if the function return type then also changes.
>>>>
>>>>>> Also the spec reads as if htval only _may_ hold the original address
>>>>>> of the
>>>>>> faulting access. What if htval ends up 0?
>>>>>
>>>>> good point. then we have to emulate fault instruction and get an address
>>>>> from an instruction. I think that for now it will be enough just to
>>>>> support platforms which always write GPA to HTVAL.
>>>>>
>>>>> If I understand correctly if htval is supported by platform then htval
>>>>> will be always filled for guest page fault. To verify if HTVAL is
>>>>> supported we could do:
>>>>>
>>>>> 'Unless it has reason to assume otherwise (such as a platform standard),
>>>>> software that writes a value to htval should read back from htval to
>>>>> confirm the stored value.'
>>>>
>>>> How does this matter here? It's one thing for htval to be capable of
>>>> holding (all?) non-zero values, and another that it would always be
>>>> written. If the platform doesn't indicate the behavior, I fear you have
>>>> to assume that you may (perhaps even randomly) observe 0.
>>>
>>> So to be very sure we could check for two extensions: Sstval and Shtval.
>>> They will guarantee that under any circumstances it will be filled.
>>>
>>> Also, as an option we could check that htinst value isn't zero as
>>> according to the spec:
>>>
>>> For guest-page faults, the trap instruction register is written with a
>>> special pseudoinstruction value if:
>>> (a) the fault is caused by an implicit memory access for VS-stage
>>> address translation, and (b) a nonzero
>>> value (the faulting guest physical address) is written to mtval2 or htval.
>>>
>>> So if htinst != 0 then htval is filled with GPA and a nonzero guest
>>> physical address written to mtval2/htval shall correspond to the exact
>>> virtual address written to mtval/stval.
>>
>> I've re-read SPEC again and it looks like htinst != 0 doesn't guarantee
>> that htval and stval will contain necessary for me here faulty
>> instruction. What I wrote above guarantee that if a fault during
>> VS-stage translation failed then it htval will contatain GPA of PTE with
>> which was an issue.
>>
>> So I have to blindly believe that HTVAL and STVAL will always contain
>> necessary for me data as KVM and other hypervisor does or introduce here
>> software guest page table walker if Sstvala and Shtvala aren't provided
>> by platform.
> 
> Why "blindly believe"? Checking for the necessary extension(s) should be
> an option. Adding fallback code for when an extension isn't available can
> come later, can't it?

It can be an option. It is what I planned to do.

~ Oleksii

