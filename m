Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19489C61DD6
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2026 07:53:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404549.1638222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1JIb-0000pO-Kd; Tue, 01 Sep 2026 07:52:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404549.1638222; Tue, 01 Sep 2026 07:52:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1JIb-0000pH-H9; Tue, 01 Sep 2026 07:52:53 +0000
Received: by outflank-mailman (input) for mailman id 1404549;
 Tue, 01 Sep 2026 07:52:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x1JIZ-0000pB-Ma
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 07:52:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1JIX-007Duw-UF
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 09:52:49 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a96844e-8faa-0a2a0a5109dd-0a2a4503bf38-6
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 09:52:49 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a968451-fae8-0a2a45030019-d155dd2eac14-3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 09:52:49 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-48444ec4fe2so147624f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 00:52:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48442d6e826sm3117389f8f.19.2026.09.01.00.52.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 00:52:48 -0700 (PDT)
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
        d=suse.com; s=google; t=1788249169; x=1788853969; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVYNqUMt5NqrmKcdYt4k7AXKHi7zEjXkuK3vr+rlOhY=;
        b=ZJAqSkhDnBAOdBteFYleaY786pkf5csdsMpRLCcBcfqbPtgn8Fjf8DeduRjNjfo7Yr
         jvuz55mfRvXhgVifCZ8WjNq2UY2lZ8RECdjQ0ObGvX8dTJfl7Ejc9wnvQvIYT+eHxirs
         YQY53R1c4zlxhzAuYFtjSoea/SZPEKDVYc66o3X4j5/oP1U1Gq/eg5T7uhOX2hX2HZ3s
         9zKik2MZQHZuB01lD5St6i714tiGXfqs16yGMHbuyorf7MjfvpIg/SSGqY1O7m7JB71t
         PHuIiqckL7vQ7UBVMn+MxcG9LqV/OTHL84zPmqW7uOH9i+a3iva4n4Z6JiwAC0aFbxa/
         tiAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249169; x=1788853969;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVYNqUMt5NqrmKcdYt4k7AXKHi7zEjXkuK3vr+rlOhY=;
        b=HhweC9jOJqBrEKI0xnYJffyhG9/ZAwKmDZ/1CYtR62Y/gL9KmggB3Uqc9RMQ9L7T4C
         ofo/4wyBH2jyJ80YfTUlDpOVORVw6SGr/qkwGkINwiYXvWBUEbNt4wKwtemU+BmGp7Jn
         gjv1ZW2Hz8yXl806xbHMsVf2+fvwykP86RdtxY/DdOCKiimI06ZwxicFNokFPjai/1bx
         1T6dZifWSz/CE8mIEc08nT6I0K7IfBJRwemd+9DS3xJ/r59Rc4IU7Oaqav/kEM8YLnwQ
         cNbwP6LRabVN2nsA8ZBjJOFcDCGkAWLJf6Jh+K8pNt0KkJVN0jUOsIlz+nQDedpMC+oE
         3piA==
X-Forwarded-Encrypted: i=1; AKwUvByo9GMLeIMwg2Qyxo1vWMyYxcbm3PdbEPKF7lxRFGooYK18+BggRj+pRMpyvdp7K17TIY5vhM+pJVM=@lists.xenproject.org
X-Gm-Message-State: AFuF++mFw3g7sKn22wG/k9kX+wbRdcPm5fq8DcYT/NYrVBhFMJjMQGnG
	3JXpvWP9nQI43LPKegLbeGwtJEK7WB+CXWbFdq9VtpvGLgQmb/Y31mnJUKDJO1AL+Q==
X-Gm-Gg: AYBFou1jdJ0F37nTSu6fIQCRV1gAiJf6NUCUu4fTpJnSRYKtecnhUAlNKlVVsyXpaM6
	tKsTELYyC02NlNFiCnV9cnk8ZcGdVeOdon3gXA2PBqzafuoNS3z01wvwejr2F9ZSE+rCHQ7C1zo
	CEtShDV/hU3hsYXJol+tKwnNEz51fbRIK6UFItyvgc8Pr8QjSDFdlN7CG7eSdsBMjHtAoMRVZf4
	0+c50mnMFegW2x1tq5y7kb/5uvikiSg/hdmIBxb2u/m9hmLoTUzHV9JEMtYrAwORq9QgrYtQ4P0
	XIw7+/gnwRnWJGbd2zFjwVFHLU+7n+RIzAi9leiNruTsl6RLIse3nHHpWiOUtqwvUur5CpcZmXy
	gsSUCjA1s/PyGKfjjk/QuGASz4cgMShNNDNjUqFViRprBLubJjabFombs23Wz+k8bSlXf32FDSe
	csUMyGE3g1mDowRivLnOwhyrEJb+35Cba7oUwPdX67Brqas8uoD5TzP0bEPP9cnkF1z6c6DaDqA
	QK4jsMy1lGQ6bcePyC104wKEkc+sudELXORzdq7BQnqiKdfbs+S
X-Received: by 2002:a05:6000:104b:b0:484:3200:b7a1 with SMTP id ffacd0b85a97d-48440ff9366mr9577704f8f.13.1788249169278;
        Tue, 01 Sep 2026 00:52:49 -0700 (PDT)
Message-ID: <c0aa91db-4346-4093-9590-1bf972322f4f@suse.com>
Date: Tue, 1 Sep 2026 09:52:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] RISC-V: place .sdata / .srodata /
 .riscv.attributes
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9a78fdea-08ba-4e04-bfa1-ba09730a300b@suse.com>
 <f26f80e3-0b2d-429a-895c-b8003d1c5a38@suse.com>
 <0d0c6a5b-94a5-49c6-a150-3bb6a0dc3b93@gmail.com>
 <8eebbdd6-d414-49eb-83e6-668f187e6f93@suse.com>
 <e4652848-4923-49e1-ad2f-c3c46b8ce5d9@gmail.com>
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
In-Reply-To: <e4652848-4923-49e1-ad2f-c3c46b8ce5d9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1788249169-6F8C54E9-A10EB7F6/10/73395122804
X-purgate-type: spam
X-purgate-size: 2336

On 27.08.2026 18:07, Oleksii Kurochko wrote:
> On 8/27/26 5:56 PM, Jan Beulich wrote:
>> On 27.08.2026 17:40, Oleksii Kurochko wrote:
>>> On 8/26/26 2:04 PM, Jan Beulich wrote:
>>>> --- a/xen/arch/riscv/xen.lds.S
>>>> +++ b/xen/arch/riscv/xen.lds.S
>>>> @@ -44,6 +44,8 @@ SECTIONS
>>>>    
>>>>            BUGFRAMES
>>>>    
>>>> +        *(.srodata)
>>>> +        *(.srodata.*)
>>>>            *(.rodata)
>>>>            *(.rodata.*)
>>>>            VPCI_ARRAY
>>>> @@ -92,6 +94,7 @@ SECTIONS
>>>>            SCHEDULER_ARRAY
>>>>            HYPFS_PARAM
>>>>    
>>>> +        *(.sdata .sdata.*)
>>>>            *(.data .data.*)
>>>>            CONSTRUCTORS
>>>>        } :text
>>>> @@ -162,6 +165,8 @@ SECTIONS
>>>>        /* Section for the device tree blob (if any). */
>>>>        .dtb : { *(.dtb) } :text
>>>>    
>>>> +    .riscv.attributes : { *(.riscv.attributes) } :text
>>>> +
>>>
>>> Nit: .riscv.attributes is SHT_RISCV_ATTRIBUTES, i.e. non-alloc.
>>> :text on it is misleading, and without an explicit address it gets
>>> sh_addr from .(location counter) after .dtb. Could we use matching the
>>> idiom used for every other non-alloc section in xen.lds.h:
>>>     .riscv.attributes 0 : { *(.riscv.attributes) }
>>> No functional difference either way (objcopy -O binary drops it, and I
>>> verified a non-alloc output section doesn't advance dot, so nothing
>>> downstream shifts), so purely consistency.
>>
>> Well, I compare attributes rather with notes, which we make part of a
>> segment (on x86 at least). I can drop the :text if it's that what's
>> needed to get this in, but I'm not fully convinced. But my knowledge
>> on the purpose and use of attributes also is still somewhat limited.
> 
> As I mentioned from functional point of view I don't think that it will 
> be an issue so generally you could keep :text here.
> 
> That why I wrote "Nit:".
> 
> Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks. I decided to drop :text, after all. The linker actively ignores
it, producing a PT_RISCV_ATTRIBUTES segment which the linker script
doesn't even ask for. That likely is a linker quirk, yet at the same
time the linker script likely means to actually spell out an attributes
segment (to which this section then should be assigned).

Jan

