Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F30ACD4F5B
	for <xen-devel@archiver.kernel.org>; Tue, 19 May 2026 14:53:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1313139.1583361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPLpJ-0000HW-9T; Tue, 19 May 2026 14:53:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313139.1583361; Tue, 19 May 2026 14:53:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPLpJ-0000HP-5f; Tue, 19 May 2026 14:53:45 +0000
Received: by outflank-mailman (input) for mailman id 1313139;
 Tue, 19 May 2026 14:53:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPLpH-0000HJ-UO
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 14:53:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPLpH-002awr-5f
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 16:53:43 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c7964-e002-0a2a0a5209dd-0a2a450b9060-36
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 16:53:42 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c7976-212f-0a2a450b0019-d155dd29e9d2-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 16:53:42 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-44509921fbcso2280201f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 07:53:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ed2ffdfsm42971590f8f.15.2026.05.19.07.53.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 07:53:41 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779202422; x=1779807222; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O7K9R9TrNAFbW06NGLwSDhYJGfDwvo0BPfnDY40GzO0=;
        b=a3o8daNgmqqfYmPKLvUj901082w1N+T7iWJQYOjf5XCYXNsM6vYJVPZcKNG8iZVVCq
         hh6QWn4T7HCglkIm35s/AgXU22q7KBhkoOs2JUdVcDgGQ80JNXj3wIvpeFq1jn8/yRl/
         IHTbm5mA86o3OBb//7ENtftkVIabhBu16Yr0/vmj/Wj7IyVd0trE5fj6nzyO5yPF/ITo
         QXaN6dE/n/z3ux3+k9NLWVkuqStZwwvgfh2hnv1vsszci9hs7SBv9kk+xjXIDZSoZklc
         DtWyJ0BOfE6mE4mOt/EsgpwuFyb0Fg5uDIe5wLTUu+O44SkRpGex3pnkjxBEElLe8Prz
         fHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779202422; x=1779807222;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7K9R9TrNAFbW06NGLwSDhYJGfDwvo0BPfnDY40GzO0=;
        b=RmfGId5vTsA8blUdRMtRBq//U0yLfGsoPz8JWx8kgC3kYFQqf/XVstOEr3v0RXbn5M
         yQMvbsS1qlul9OSKfoum6KjDYFMaEhTPKLaKmlAcL+kEwPkI+kq7/cuPSXRN83I7z5Pg
         4Xn2b9BokS9VCSis/K1um5qdjdV3qTMkBytVlWuk23cQiL1ZXQSYw6g72vekI+ZnvJ2R
         RqIaK+3rtPwa8oUN8kB8D7dShsasWLWmBQvAS6cJu8XPQx4BTQCdos4ixVHpvMNaRFKl
         1JvjSAHdLCeT62jWPskAEG6fkRPYqhkV2Dmhfhj3jcTVGfsZxFf9JNwgVQBmDC8T/VwN
         g/kA==
X-Forwarded-Encrypted: i=1; AFNElJ+817V3pI3dT3taVlvQvaf5qKAShdmsvW5mKltNSMSnIp7FMbAVNWzIASWFtbLxLpgPFegbEvDVwUs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHqAiArxaWNuoJRUumzDfsF2WKHNId3UNGimavdvi+C4e2+1VK
	ECKtH+CPPYOTuePC35lHXZC0pLiTPp6/vsHh6ZKiYonkMa5+klF9vZ85yAHGq3XZVQ==
X-Gm-Gg: Acq92OGQNg7PBiFbP5p0mKX6vR4YQ9nh2qDJhGleTNo65jNlttOnWzoDO9KwFShOQOg
	zCZpdvNO0BrpM0hwKG/kqccogaxHoLRZ/0NZd+7iU8I0JjbyrHJiAJt7vQPXngjfHBwMrPDjf5X
	VuTcTu9xoI2RGSLXqu6JYf6bC2jHjQZSA+OpH1PXUvUhvctdPOUtY7DrJzjS2jY7Mw7GTbqSTkI
	ulT/AMlky2TiogrwVunLj2SI+pboRzxOdjpGBmTpTj+i4fTIhsle2q1Pn9A+gwGRNfwagTMME0k
	XDs+m1SxGQncOUa6qhy+SYksL3b7fHCIO1qVKR8V7ld1pMDXtA1Ayeznpptv54KOVNlte9dOs8V
	xrf6ArElqCP116RoorepcvHt9aeWhxJrEfhcFL0nktS7u5uNsF9WztBXYgPXGycPZyrwUcmyMXa
	VmVQ5nVob/902FChnPscgnQXQqAZz4CBah4lN9dL1RNIydNlh7B4Qb2pULkJbZGz3F5Ftequ2Ar
	+fwmowgITDxY48=
X-Received: by 2002:a05:6000:26c4:b0:43e:a69b:d810 with SMTP id ffacd0b85a97d-45e5c5e6096mr33288151f8f.38.1779202422284;
        Tue, 19 May 2026 07:53:42 -0700 (PDT)
Message-ID: <3b5f681c-bda4-4c46-a96d-cd3da1658e28@suse.com>
Date: Tue, 19 May 2026 16:53:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/26] xen/riscv: introduce guest riscv,isa string
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <b2d4f3f7f049837a25bc00bfb1d3da8b984a8b5a.1778250616.git.oleksii.kurochko@gmail.com>
 <364abd6e-4fff-437a-90c8-bb4489f0c51d@suse.com>
 <f032149e-aa99-4976-8012-39bd01d4a653@gmail.com>
 <23e8de1e-b792-4863-bd99-f529642fb963@suse.com>
 <fbd8b102-d495-4678-8226-a199554e266d@gmail.com>
 <3d9e2a3a-6839-4909-b60f-28b4c1a02cdd@suse.com>
 <fa617f4f-7057-4b59-8f28-5a014b0c423a@gmail.com>
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
In-Reply-To: <fa617f4f-7057-4b59-8f28-5a014b0c423a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1779202422-20E7CF3B-B94340BD/0/0
X-purgate-type: clean
X-purgate-size: 3666

On 19.05.2026 16:49, Oleksii Kurochko wrote:
> On 5/19/26 3:40 PM, Jan Beulich wrote:
>> On 19.05.2026 15:24, Oleksii Kurochko wrote:
>>> I thought about two options as alternatives:
>>>
>>> 1. Take as a length host RISC-V ISA string but theoretically we can
>>> emulate some extensions which aren't mentioned in host RISC-V ISA string
>>> so it could be longer. So not a good option.
>>>
>>> 2. Having two walks in init_guest_isa():
>>>      Introduce the following function:
>>> static size_t guest_isa_str_len(const unsigned long *isa_bitmap)
>>> {
>>>       size_t len = 4; /* rvX prefix */
>>>
>>>       for ( unsigned int i = 0; i < ARRAY_SIZE(riscv_isa_ext); i++ )
>>>       {
>>>           const struct riscv_isa_ext_data *ext = &riscv_isa_ext[i];
>>>
>>>           if ( !riscv_isa_extension_available(isa_bitmap, ext->id) )
>>>               continue;
>>>
>>>           if ( ext->id >= RISCV_ISA_EXT_BASE )
>>>               len++; /* '_' separator */
>>>
>>>           len += strlen(ext->name);
>>>       }
>>>
>>>       return len + 1; /* NUL terminator */
>>> }
>>>
>>>     and then:
>>>
>>> int init_guest_isa(struct domain *d)
>>> {
>>>       bitmap_andnot(d->arch.guest_isa, riscv_isa, guest_unsupp,
>>>                     RISCV_ISA_EXT_MAX);
>>>
>>>       size_t len = guest_isa_str_len(d->arch.guest_isa);
>>>       d->arch.guest_isa_str = xzalloc_array(char, len);
>>>       if ( !d->arch.guest_isa_str )
>>>           return -ENOMEM;
>>>
>>>       /* ... existing snprintf + strlcat loop unchanged ... */
>>> }
>>>
>>> If approach 2 is a good one I can follow it.
>>
>> This might be yet better with only a single function. Otherwise the two are
>> always at risk of going out of sync. After all you can use snprintf() to
>> determine just the size needed; if you go look, there may even be an
>> example or two in the tree.
> 
> I will do than in the following way:
> 
> static int build_guest_isa_str(char *buf, size_t size,
>                                 const unsigned long *isa_bitmap)
> {
>      int total = 0;
>      int ret;
> 
> #if defined(CONFIG_RISCV_32)
>      ret = snprintf(buf, size, "rv32");
> #elif defined(CONFIG_RISCV_64)
>      ret = snprintf(buf, size, "rv64");
> #else
> #   error "Unsupported RISC-V bitness"
> #endif
>      if ( ret < 0 )
>          return ret;

You can use total here right away, and limit ...

>      total += ret;
> 
>      for ( unsigned int i = 0; i < ARRAY_SIZE(riscv_isa_ext); i++ )
>      {
>          const struct riscv_isa_ext_data *ext = &riscv_isa_ext[i];

... ret's scope to this loop. This then also justifies total to be of a
signed type.

>          if ( !riscv_isa_extension_available(isa_bitmap, ext->id) )
>              continue;
> 
>          ret = snprintf(buf ? buf + total : NULL,
>                         buf ? size - total : 0, "%s%s",
>                         ext->id >= RISCV_ISA_EXT_BASE ? "_" : "",
>                         ext->name);
>          if ( ret < 0 )
>              return ret;
>          total += ret;
>      }
> 
>      return total;
> }
> 
> int init_guest_isa(struct domain *d)
> {
>      int len;
> 
>      bitmap_andnot(d->arch.isa, riscv_isa, guest_unsupp,
>                    RISCV_ISA_EXT_MAX);
> 
>      len = build_guest_isa_str(NULL, 0, d->arch.isa);
>      if ( len < 0 )
>          return len;
> 
>      d->arch.isa_str = xmalloc_array(char, len + 1);
>      if ( !d->arch.isa_str )
>          return -ENOMEM;
> 
>      build_guest_isa_str(d->arch.isa_str, len + 1, d->arch.isa);

At least ASSERT() the success of this?

Jan

