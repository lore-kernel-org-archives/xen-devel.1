Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC54AC5DF6D
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 09:52:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395006.1633558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwcyC-0001Nb-SP; Wed, 19 Aug 2026 09:52:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395006.1633558; Wed, 19 Aug 2026 09:52:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwcyC-0001NU-Pl; Wed, 19 Aug 2026 09:52:28 +0000
Received: by outflank-mailman (input) for mailman id 1395006;
 Wed, 19 Aug 2026 09:52:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwcyB-0001NO-Gc
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 09:52:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwcyA-005902-TD
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 11:52:26 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a857cd7-2eae-0a2a0a5409dd-0a2a450cc9e6-10
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 11:52:26 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a857cda-f479-0a2a450c0019-d155dd2db834-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 11:52:26 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-47362928f65so734224f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 02:52:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14c338dsm3901352f8f.25.2026.08.19.02.52.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 02:52:25 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787133146; x=1787737946; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTSnvSUpkyd3JhkthQ4Vco9aYiTArRzCCgBbmokvk/4=;
        b=UmuLXpJi3VoM5+OOEJUfvkQCRDOaEvUC3SN6mbPXOkrrrVcadxpRseLaDVOu0CgMNo
         udnjD86E/qtVXj8sGVvEHUoOcz5AfWVSbuQoOfCKUWqckCOOKgICvRJ8o1PXpvQ/HD6c
         8PbY1C1LMWl2A3Jb3If3IZbpuRIt4YJzDuyzGdtPRU8YjgorIyCdUxEeRwMEK7DuSP2C
         MN8Urc56YcObzFC59vB/BeiCNvmk1FmBP71xuQv1pmlkLFd36ByIz/q/GiQkw1wGkvsk
         lmDOXNKpET7Czx6hWj7tnCoUAbVbNM2P684F+7gCP9wiLF6PbdvgXMHx+Bg26xtt6TYl
         2zZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787133146; x=1787737946;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTSnvSUpkyd3JhkthQ4Vco9aYiTArRzCCgBbmokvk/4=;
        b=ULGpmevyCSbS5SNBArhoRoa2c6k9eP7hkvI3z0/aoqgbK2GX+yK/Kqr7VL4z9rRxrE
         ZCh2ddpp65pOdVZmv1xqQ5cIuls3JW04E/NexGUxg6kge8Tmy+nphLatrq3FQjOke8E+
         1LkMqiqsbVdxkwQksTo1eIptYIXtnvkpF60EejlgXKOIAZBoGwD0nQLw/DcR2qN67ENd
         kMdUCUk2W/E9+v7jj8v5+NeBojoPbTr6Tz5DROgiTPay+k9lkwxN9N7xaknnrKgdkerm
         RCB3gYvWq2prJ3+5kQn4KeADMD17BmOKJJB9OAzEKyP8IDTgjQOLs1mPU2wzd4+QQDMv
         qVDQ==
X-Forwarded-Encrypted: i=1; AHgh+RoNzfJmvSfVTB4Bb6xxkWnTAfT75DpZLLDCWVDhmmfib15fmW1CVnLUQDhB3j8Xz/TUmuHiuE8BOec=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywhkc0KpuC1VTiowuKxrClRpjJoBU31+LXCDeL8j1PSattRTRR6
	kTBOcXUiseP/IH3o2zHz/2uHW4tG9uK5Jsp4wpy4XYL/uu+RYml3bcPFQR3OXYty4Q==
X-Gm-Gg: AR+sD10rdO/IjhpAiDmZ+nK8rBMS5wN2c+enGzkzQBEo9/o5NyEOdRVqYk1y7oT23jN
	dXryI0yZ3M75ZTymYAHqA6wk1bxwtb9K35S94kA0olyStWKBAVu99C3k/RhdrTYtvs+GYah+3RR
	Ka76qJSydOVMrsCLk2hXYsbB56V3WKJC50OTY/VziH+cr7MypndVjbDZPg21qimUAqmczz253+F
	2eGv5k+HaTzBZV81K58Fp7pHcwK2iOzUbQi8FtcqckvgFVhAp6pUpNzpyFRq/r6f5FmKaAsEJVU
	2yvsbyMC/Sh7AvQC7WqW4iRg9Y2pyU3I3nmoF7w/DNeuc/d3+c114JhvHHkXb7TGUVvZIhLl58L
	T2Jrx/Koi7z9YtOfyJZVI0z5I/sg0bjAv+GsuW0hFcdqK5RJn+UtmPyO1qli65sO2A/m5EiUrSi
	11aOafo3MZjqCpb2se0Pard7RzluB74QhNDwd8OHimJXY+tqD8zcsTzOq1+X+h2q77GJBky07ml
	HPlwlTJYJmksr2IPOzG0Az/J/OgHvtT+ZBkbz+6dC/pEgPO590Y
X-Received: by 2002:a05:6000:2507:b0:47e:81aa:3832 with SMTP id ffacd0b85a97d-482b1fe7f68mr5261938f8f.16.1787133146151;
        Wed, 19 Aug 2026 02:52:26 -0700 (PDT)
Message-ID: <0d0d45b2-8682-4ae3-9f64-bdcb4add09b1@suse.com>
Date: Wed, 19 Aug 2026 11:52:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 14/17] xen/riscv: add guest page fault handling stub
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <38fd0ba7-562f-49e2-8453-be14f79f1c3c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1787133146-76CDBA5B-2E5AD7FB/0/0
X-purgate-type: clean
X-purgate-size: 4335

On 19.08.2026 10:59, Oleksii Kurochko wrote:
> On 8/18/26 6:04 PM, Oleksii Kurochko wrote:
>> On 8/18/26 10:29 AM, Jan Beulich wrote:
>>> On 17.08.2026 18:10, Oleksii Kurochko wrote:
>>>> On 8/12/26 5:48 PM, Jan Beulich wrote:
>>>>> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>>>>>> +{
>>>>>> +    /*
>>>>>> +     * According to RISC-V spec:
>>>>>> +     *  18.2.8. Hypervisor Trap Value Register (htval)
>>>>>> +     *   ...
>>>>>> +     *   A guest physical address written to htval is shifted 
>>>>>> right by 2 bits
>>>>>> +     *   to accommodate addresses wider than the current XLEN.
>>>>>> +     *   ...
>>>>>> +     *   If the least-significant two bits of a faulting guest 
>>>>>> physical address
>>>>>> +     *   are needed, these bits are ordinarily the same as the
>>>>>> +     *   least-significant two bits of the faulting virtual 
>>>>>> address in stval.
>>>>>> +     *   For faults due to implicit memory accesses for VS-stage 
>>>>>> address
>>>>>> +     *   translation, the least-significant two bits are instead 
>>>>>> zeros. These
>>>>>> +     *   cases can be distinguished using the value provided in 
>>>>>> register htinst.
>>>>>> +     */
>>>>>> +    return (csr_read(CSR_HTVAL) << 2) | (csr_read(CSR_STVAL) & 0x3);
>>>>>
>>>>> Well, okay, but instead of not losing the bottom two bits you're now 
>>>>> losing
>>>>> the top two ones.
>>>>
>>>> Oh, right, I will add a cast ((uint64_t)csr_read(CSR_HTVAL) << 2) | ...
>>>>
>>>> It will cover all the cases RV32 which has 34-bit guest address and it
>>>> will be enough for RV64 where GPA is 59bit (the highest possible for 
>>>> Sv59).
>>>
>>> Only if the function return type then also changes.
>>>
>>>>> Also the spec reads as if htval only _may_ hold the original address 
>>>>> of the
>>>>> faulting access. What if htval ends up 0?
>>>>
>>>> good point. then we have to emulate fault instruction and get an address
>>>> from an instruction. I think that for now it will be enough just to
>>>> support platforms which always write GPA to HTVAL.
>>>>
>>>> If I understand correctly if htval is supported by platform then htval
>>>> will be always filled for guest page fault. To verify if HTVAL is
>>>> supported we could do:
>>>>
>>>> 'Unless it has reason to assume otherwise (such as a platform standard),
>>>> software that writes a value to htval should read back from htval to
>>>> confirm the stored value.'
>>>
>>> How does this matter here? It's one thing for htval to be capable of
>>> holding (all?) non-zero values, and another that it would always be
>>> written. If the platform doesn't indicate the behavior, I fear you have
>>> to assume that you may (perhaps even randomly) observe 0.
>>
>> So to be very sure we could check for two extensions: Sstval and Shtval.
>> They will guarantee that under any circumstances it will be filled.
>>
>> Also, as an option we could check that htinst value isn't zero as 
>> according to the spec:
>>
>> For guest-page faults, the trap instruction register is written with a 
>> special pseudoinstruction value if:
>> (a) the fault is caused by an implicit memory access for VS-stage 
>> address translation, and (b) a nonzero
>> value (the faulting guest physical address) is written to mtval2 or htval.
>>
>> So if htinst != 0 then htval is filled with GPA and a nonzero guest 
>> physical address written to mtval2/htval shall correspond to the exact 
>> virtual address written to mtval/stval.
> 
> I've re-read SPEC again and it looks like htinst != 0 doesn't guarantee 
> that htval and stval will contain necessary for me here faulty 
> instruction. What I wrote above guarantee that if a fault during 
> VS-stage translation failed then it htval will contatain GPA of PTE with 
> which was an issue.
> 
> So I have to blindly believe that HTVAL and STVAL will always contain 
> necessary for me data as KVM and other hypervisor does or introduce here 
> software guest page table walker if Sstvala and Shtvala aren't provided 
> by platform.

Why "blindly believe"? Checking for the necessary extension(s) should be
an option. Adding fallback code for when an extension isn't available can
come later, can't it?

Jan

