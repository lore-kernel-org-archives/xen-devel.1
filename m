Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBB8C5DF85
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 14:09:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396612.1634395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx3S3-0002WD-Vg; Thu, 20 Aug 2026 14:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396612.1634395; Thu, 20 Aug 2026 14:09:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx3S3-0002W6-Rb; Thu, 20 Aug 2026 14:09:03 +0000
Received: by outflank-mailman (input) for mailman id 1396612;
 Thu, 20 Aug 2026 14:09:03 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wx3S3-0002W0-0i
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 14:09:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wx3S1-00FXxb-VQ
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 16:09:01 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a870a6f-bab6-0a2a0a5309dd-0a2a4502ed04-48
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 16:09:01 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a870a7d-6ca4-0a2a45020019-d155802cb94a-3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 16:09:01 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-499b2981a7bso9498185e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 07:09:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa0d6721sm189202335e9.11.2026.08.20.07.08.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 07:08:51 -0700 (PDT)
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
        d=suse.com; s=google; t=1787234941; x=1787839741; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iP3exa7q+yUmtHIF2lquYm5BmWxm+URZQXH/m7lx+E4=;
        b=I0/yJ71OMPb5o+swBxTNulF7I+RCn0bbwoiRHpc+V4qf3tO36CuKjX8yKXh50mGKqV
         upasSz0rRYJ3w56+YT+zCOSY2j8LoO+7k/Hx+hPvChhG0osAzHpU40lxKwt2b4mUi9GT
         v6xSYRoQ5qmSH6jHs6YiuDYCjRl8EIY5zwmjtGsfCD4EBnCcUKNCbnv9g+nFnqZeq+W7
         h49BgfvYM9ONio9oy6z30VsewE3zZBaB3BGD97VhbK1KtrA/s29wyzP6iam6y8Oc7QR0
         70b4ph17SIc4fRJrMVj8U2Fc9f26PQCcVh6yWn368VRQcKWbA8JU5rXUY4/WU7trzwSl
         VAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787234941; x=1787839741;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iP3exa7q+yUmtHIF2lquYm5BmWxm+URZQXH/m7lx+E4=;
        b=F3VkyVJPalTWuthtsOTFr/Qky2ikT8qIXhHmUj54ooV8HsdIpHxlV0HNHShk0Bvhl7
         JEfLGAewFp62HxmFeVDnQSNhB3B05Sh8AVN0/r4MGtKglnp0LqNKH7A6AQkZR175OFtw
         rNnPBTFX4Kq2z+1q+CwoQGVicqbpQuRQ7XivRmjSmkrK1wYEWVWSXXhxJG4VOdZxn7CQ
         6x0zJEkNjsCo/4uyn7xI2/qJdqcfa6MpBx3SqxvGJpdauCSSS70gWuIUjKCa7pAzgwXl
         ZyUIH6N4UoLeLQOEkJIB5CMoWTRhiUf/58uMz8uaC1TsiTtkWRLsyk05lNpvfOU2BQfX
         N22g==
X-Forwarded-Encrypted: i=1; AHgh+RqkDjrLAMToYrjzxa3FqlnkakosoFuE3EkhhLXSNPNTmx8x9GtM3rK2F8GIvWyLFuEv3bDrAGWVF9o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/2Z4hRMLeYjSYLkjkrgq6h37wZy4nl+UvKT/5Xz4B45E1Bl3N
	YF7+t+hT4B8hEiyW/jYTYSFMSQQR5xipTk0f8aNMkK7t26i3t+HGGcRLEd4hR1dg+A==
X-Gm-Gg: AR+sD13cwye5MOE9dKg1vZEKlYQxgR6dgIucGXWKC0K0dugDZfn1olptlLfSUb0UkW8
	jQv1MFtPLvSd9bKSEweX6efihxWvGySGZNoZ1+UQRhLdGpjk5saRDFDn8m2fp4tZ9b/u1ft+TmX
	Eiv+74NV+knSXp19IMi3XBi5tsOKCoqfGRaCaTAvxqgHIP7lSDUSXcgImiMcOKKO20+/k4+8QoA
	YOOq6yBv2TJ6RCUINHsMEs6MegTAdtuUdBl9Ft7RLnYx4fUMOhDGfqaDy3loF/dwk+JB+IaRssV
	nExii8XYuO5m2unpHmvXR/xhy4Rz7Y0lSdKsmzgJKHqK/lmN4slyK9dmWiRBU237sHTsao5INqW
	1G82AdLKiKxZS3t5B3I9Eh+L7VNXSDN8aUirl1pxgEJcQ1oS5gLMKm8bfMXlZMRRHlI3Y2iVXtP
	KXTVePidRL5XRrpyMpFyYiZl6WYROtItx7SLugE1WXpEt5vswimpCk3FflsN6a9l+Q/aOjWXcSm
	MQxMsvdF0wWoCD9+NVfMG274X2WC7T0MNHMVkKsJ7hQX8dQvOLBFErpIAtsEzk=
X-Received: by 2002:a05:600c:c08f:b0:499:afcb:24c1 with SMTP id 5b1f17b1804b1-499afcb24demr138394505e9.5.1787234931745;
        Thu, 20 Aug 2026 07:08:51 -0700 (PDT)
Message-ID: <9c006636-cc33-45ae-85cc-800568e6dcf9@suse.com>
Date: Thu, 20 Aug 2026 16:08:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 16/17] xen/riscv: add guest load emulation for trapped
 MMIO accesses
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
 <9b18a20367754605efd6a6b5bf09d4483d9c3ab2.1784560663.git.oleksii.kurochko@gmail.com>
 <7a2e46da-5b1f-448e-aba3-7eefe0a61950@suse.com>
 <aff1f879-48c6-4047-a6c1-237a350e0f35@gmail.com>
 <a64d4714-2215-4bff-9dfa-2cbcc36ce3f2@suse.com>
 <417b2b37-d805-49a4-a23d-46dd8363a751@gmail.com>
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
In-Reply-To: <417b2b37-d805-49a4-a23d-46dd8363a751@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1787234941-67CBA2AC-800133BF/0/0
X-purgate-type: clean
X-purgate-size: 2611

On 20.08.2026 15:38, Oleksii Kurochko wrote:
> On 8/20/26 9:34 AM, Jan Beulich wrote:
>> On 19.08.2026 18:06, Oleksii Kurochko wrote:
>>> On 8/13/26 9:15 AM, Jan Beulich wrote:
>>>> On 29.07.2026 15:40, Oleksii Kurochko wrote:
>>>>> +        /*
>>>>> +         * Bit[0] == 0 implies trapped instruction value is
>>>>> +         * zero or special value.
>>>>> +         */
>>>>
>>>> How come you get away without dealing with pseudoinsns? The insn pointed at
>>>> by regs->sepc is of no interest for faults caused by implicit memory accesses
>>>> originating from VS-stage address translation.
>>>
>>> It is really problem but I think it should be resolved much earlier in
>>> handle_guest_page_fault(). I will add the following:
>>>
>>> /*
>>>        * A guest page fault taken on an implicit memory access performed for
>>>        * VS-stage address translation (reading a PTE, or updating its A/D
>>> bits)
>>>        * reports a pseudoinstruction in htinst rather than a transformed
>>>        * instruction. Such a fault can't be emulated: htval holds the guest
>>>        * physical address of a VS-stage PTE rather than of any access the
>>> guest
>>>        * itself performed (and its two least significant bits are zero
>>> instead
>>>        * of matching stval), while the instruction at sepc is unrelated
>>> to the
>>>        * access which actually faulted.
>>>        *
>>>        * Report an access fault to the guest at the original virtual address,
>>>        * which is what stval already holds and what hardware would raise
>>> for a
>>>        * page table walk hitting an inaccessible address.
>>>        */
>>>       if ( (htinst == INSN_PSEUDO_VS_LOAD) || (htinst ==
>>> INSN_PSEUDO_VS_STORE) )
>>>       {
>>>           struct cpu_user_regs *regs = vcpu_guest_cpu_user_regs(current);
>>>           struct trap_info utrap = {
>>>               .scause = (htinst == INSN_PSEUDO_VS_LOAD) ? CAUSE_LOAD_ACCESS
>>>                                                         : CAUSE_STORE_ACCESS,
>>>               .sepc = regs->sepc,
>>>               .stval = csr_read(CSR_STVAL),
>>>           };
>>>
>>>           riscv_trap_redirect(&utrap);
>>>           return;
>>>       }
>>
>> That's not what would happen on bare hardware though, aiui. At least I don't
>> think I ever found it being spelled out anywhere what the supposed behavior
>> is when a page table resides in unpopulated space.
> 
> What do you mean here by "unpopulated space"?

A physical address range neither populated by RAM nor used by MMIO of any device.

Jan

