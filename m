Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7641606A320
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 10:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZKvErh9m
Received: from list by lists.xenproject.org with outflank-mailman.1494243.1693866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTdEp-0001qp-56; Wed, 18 Nov 2026 10:50:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494243.1693866; Wed, 18 Nov 2026 10:50:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTdEp-0001qM-0y; Wed, 18 Nov 2026 10:50:03 +0000
Received: by outflank-mailman (input) for mailman id 1494243;
 Wed, 18 Nov 2026 10:50:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTdEn-0001Y3-AT
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 10:50:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTdEm-00EBmu-BI
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 11:50:00 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd82cf-8faa-0a2a0a5109dd-0a2a4507e6c0-12
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 11:50:00 +0100
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd82d8-b4ea-0a2a45070019-d1558034d1d4-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 11:50:00 +0100
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4a214c5c4c0so8478125e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 02:50:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a655db6d45sm3953992f8f.33.2026.11.18.02.49.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 02:49:59 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794999000; x=1795603800; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SFq8B/M+hRSilgDDAQz/t+onz9lFcZOOfrVi7dovHcE=;
        b=ZKvErh9md1Reu6pk8X0KsjOvAEN9GaAit7MA5AT3NCncbTTKQEgQWM19zGqlUlRC5e
         GFd5fYgYFEaRZDxdrgeXCoqJsynx8a+aeYOoGXDTlsCSDzFDLnqJq4CLyhrl2dSgaMJF
         MIdKtCg9bUgI8LGWaUEYn8RJI3hs7EZPHWwpoTh8Sd4BvyENhEvgpnpJY2FE/IbvvSd4
         lTWJUcmeeS7tk6i7awVNsMogn6NNhdFfccxNWHP35cBPrxqAE0zB++QWA+jZkFFL+hxi
         tFS9aUpOFtvIb0wA9MsBlnpunIYRfgd5+1vjphqSXxl/hIDY3CK6EfnqUtuZ69Ayar8u
         RISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999000; x=1795603800;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SFq8B/M+hRSilgDDAQz/t+onz9lFcZOOfrVi7dovHcE=;
        b=ry0vr535+gv1RxazUZ/BKyPp06Jk+eOKvlF23BCBzWkKJKZeLtqSUwPAl7gsPq4m/y
         Xe5twqi6N+nhlAn8042PVoxGAJpC8KtRDOABDutERF/WwRediAYhtoWSvHUeEWjg5f3N
         WKB+80lbRy5zVSCHZDobmrWkwN2kO6rV7/LLz6Sl6vmiGPqEUnYUoQehzXU7GVkNkKvC
         FqbZzZPv2dsTnsWLL+bwnknn7NdzJp0WCrmpfDxmYY0/72/Yp+DliI4caCwsu1fgAvtE
         J+qizOnWzTepTbm1ux72rKrbXpeww/foJXzH2iZMI4AJtviXh9GB0w7yJrlIEF++CrmN
         CxDA==
X-Gm-Message-State: APuU4Z/gHlU7oOYIE2JL0t8/BpdUe/pAtAMuzVKHJkeXF6A7Cz4BHPht
	n6zkVDW1bvf3YmpfHl8oXwRZo9nKR3Ocf3mRX9C9bUzXOZPwXDSbblS/UCGFfvt19A==
X-Gm-Gg: AYBFou2LD6FYxbuBt12xL3s2lMTG+Ltr9nXWoTB6GHf5eolmeO+BZJUr6PnZOkxHdzg
	45hhrWWtwieFaeLrpS44dIsHJzu7p84tZQ6SgUW3z/X1hoeiPxE91/HOgflun6IUqVxI94EKomY
	hu6z5fbCEkSnhoZR79lWPkVJGksdIumc8NWahvW5UhOL3b4ope4VX+qal7Pnr7GyoaQ+XndviX3
	3iwAQl+eNcJzQlkVsXhZltHuueSoWW0J38srEo80jkABYnMTXeTMvw1OzHCVjpYSWJ/f12dhfaX
	iPAkFrV4fsEj6AnnhyZcoYtiYsGHGg6G4eVJtjCPnLljG+UfFAkYym7OoK00j0YhR7Gb9ByJBQC
	4X8iYsv7UvG3r2qEd9eSWtSLQZfdiPL0Rh5x/TuNh2L6tXwVUIRJbq3i3GnkaYxbmjlYVUB6H8e
	MCrI4+6nP5EDCrxWpoMBEE37UyeWs0CjEvg0IoKlTiT+AE81pRRh3hqb+ci8kbRmnSwzXyLD35B
	03nOUqNzCzfisjk2Z9pq0QM5UjsH6IkRnO6ytfNl1qixXELUfhXZDeTiIgBzRbJr8aJmZh0u3IC
	TZvri8LRRpwP3ItXfNvb6QdHvocFPfYOMpb992pRiR5RYRvMrDhDeNTq8rGX672V9Ii4NarvbaZ
	KokT6u/NB2y1X993Z
X-Received: by 2002:a05:600c:154a:b0:4a2:8c5:5e5 with SMTP id 5b1f17b1804b1-4bb7da12a6cmr43075015e9.7.1794998999644;
        Wed, 18 Nov 2026 02:49:59 -0800 (PST)
Message-ID: <cb819638-8a44-4485-8e50-9c1408f9ef28@suse.com>
Date: Wed, 18 Nov 2026 11:49:58 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/42] xen/riscv: introduce csr_volatile_read64()
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
 <a5a546afe987f3f040c5b942ae01579c4854b94c.1794562488.git.oleksii.kurochko@gmail.com>
 <1794995418.8631fc262581453bbf619ec5b2062170.1a1ee10758e0006d3f@vates.tech>
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
In-Reply-To: <1794995418.8631fc262581453bbf619ec5b2062170.1a1ee10758e0006d3f@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1794999000-360C5AE4-BAC0E6CE/10/78276251493
X-purgate-type: spam
X-purgate-size: 2446
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18.11.2026 10:50, Baptiste Le Duc wrote:
>> On RV32 a 64-bit CSR is accessed as two halves, <csr> and <csr>H. Reading
>> the halves with two separate instructions isn't always safe: for a CSR
>> which hardware increments, a carry from the low half into the high one can
>> happen in between, so a plain pair of reads can produce a value the CSR
>> never held. Therefore the high half is re-read and the sequence retried if
>> it changed in the meantime.
>>
>> Only CSRs which change under Xen's feet need that, hence the name. The
>> majority can be read with a plain pair of csr_read()s, so no helper for
>> those is introduced here as there would be no user for it.
>>
>> Use it for CSR_TIME, which is exactly such a counter, and widen cycles_t to
>> uint64_t. Otherwise get_cycles() would still truncate the time counter to
>> 32 bits on RV32.
>>
>> No functional change on RV64.
>>
>> Fixes: a541ddadec0a ("xen/riscv: introduce time.h")
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes in v4:
>>  - Take the CSR name without the CSR_ prefix, so that the macro parameter
>>    is used as an operand of ## only (MISRA C Rule 20.12).
>>  - Drop the (void) of the ...H constant on RV64.
>>  - Initialise hi_ in its declaration.
> 
> Jan gave his Reviewed-by on v3. It is gone in v4. Dropping it may be
> fine given the macro rework, but please say so in the changelog :)
> 
>> [ ... 45 lines skipped ... ]
>>  #else
>>  #define csr_write64(name, val) csr_write(CSR_ ## name, val)
>> +
>> +#define csr_volatile_read64(name) csr_read(CSR_ ## name)
> 
> Nit: On v3 Jan suggested "#define csr_volatile_read64 csr_read64", and you
> answered you would then move csr_read64() into this patch. In v4
> csr_read64() still only comes with "xen/riscv: implement vCPU context
> switching".
> 
> On RV64 I think it would read better like that:
> #define csr_read64(name) csr_read(CSR_ ## name)
> #define csr_volatile_read64(name) csr_read64(name)

#define csr_read64(name) csr_read(CSR_ ## name)
#define csr_volatile_read64 csr_read64

i.e. matching what I suggested earlier. Otherwise what is passed into
csr_volatile_read64() would be macro-expanded before further
expanding csr_read64(), thus prepending CSR_ only to the result of
that expansion. (In the common case there'll be no difference, but
things can go wrong if some unexpected new #define appears.)

Jan

