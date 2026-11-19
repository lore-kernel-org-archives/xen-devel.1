Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B77606A325
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 07:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Gx6qwNPk
Received: from list by lists.xenproject.org with outflank-mailman.1495863.1694574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTwXp-0004Ya-BG; Thu, 19 Nov 2026 07:26:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1495863.1694574; Thu, 19 Nov 2026 07:26:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTwXp-0004YT-8b; Thu, 19 Nov 2026 07:26:57 +0000
Received: by outflank-mailman (input) for mailman id 1495863;
 Thu, 19 Nov 2026 07:26:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTwXn-0004YN-Ow
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 07:26:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTwXm-000jDm-VJ
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 08:26:54 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afea4b8-e002-0a2a0a5209dd-0a2a450bcab8-32
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 08:26:54 +0100
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afea4be-b7e8-0a2a450b0019-d155dd2bddf9-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 08:26:54 +0100
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-492690dd5daso1564265f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 23:26:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a6573baa9fsm9502611f8f.57.2026.11.18.23.26.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 23:26:53 -0800 (PST)
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
        d=suse.com; s=google; t=1795073214; x=1795678014; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gomQB/GE++1MT9BInn0s3GE/+W6/KcgZeHCPCPSZNXM=;
        b=Gx6qwNPkrwKnfFG3Q8DtzmgfayzaTh40iHK/a6tTt1FSLOwUSy6mKYSFyyYIWesnsP
         pqgONwXEmHxTsFOWf00DrYzBc71RhxF5dKhZWygsfLSu1knfBLHV3y54aoatGhkZ/Ann
         ejzsrw+xYgZ7U+JUiTw1H2VOUAbgAF6WmWs7Xte2ByVxU2HzrMR1uoqQYRdTKavTjsPT
         l+OQr9Pu7KpCRPrklV6w1GZROCIW+zZmsZoxTB2xNMGRDoogAXgFWbIXIqCWoVkabVHb
         g8jSpEmMUG6gJs8uwVoyl7pyL3eW02HkSaw+DxGUHjB3udSEii0zQTFfsl2S0yBs8Gp9
         92lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795073214; x=1795678014;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gomQB/GE++1MT9BInn0s3GE/+W6/KcgZeHCPCPSZNXM=;
        b=dKyYz1Yo25Pleup8oVO4BJbj13UBMqaSDFMkvzLrZIS9r9Ddlj/crvpb+Fl/Jh8F2I
         5l/VkrGOS2YuhJNdaI9GjSWwM/08uEAD90t20GiRpQyVWRkgLs9Qm+9tSZCZVp7O/cDS
         GosZX/yPdD6jOEGgIbzlxQrVFgcXd5oFyEAhi/wUrGAs7uP/L1MeQJnjt/hn2pAwLGcL
         cAgCLgzjHLjkl4ZVlAROcq08rKhpqovpp4HeTu4msclY0vSyeF3PCjgoOTML7BRqC3/C
         xqG9nIz1eBHhxDoWMwXMoS+N66vojteUF1H9qfrLoiCU5qGnxcrm5/Ed7p/71f1D+zRX
         X5Kw==
X-Forwarded-Encrypted: i=1; AL+hErEBXXGX9ntbsb4kJ8D+bjxDSpYK2PXbiM6qgHYBU3xFl0j8os4e+VLcg6J+ekp1AnB4Ss6AR6R4wcs=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8x8c6lNIYbzj0NLUMocKD9QGNk7lRGCsmzbeX6t7tki5wpqeV9
	Rrb2aq/BM4Wvj6WG5S75oUvob9xhBOX+arUTSJYXJIJpYCmPtdycf0Smsgwczk7oMg==
X-Gm-Gg: AZFdTZdddz+yiLXTXkzT6I3J6iL5WfR/OoWs6KEnRomoCMY6iAJ6XtoBx8HJtD30m2H
	9xBttw2xlqR1DcEMy9WfIsekn5oZBEBsbzw254uEjpkBsRTvgAkMRkLi2bTiIpClWSN2iFghPKT
	92dFyGTlLlKZgvMaalqY7HsxtPri1Vt6ZqQdsNTkEQxIienlLgi63Ltfhp2jgiPtwaTphp+zkud
	jsmBA0wJ+MZhs6maOv7WMfCsqKuvjSyPQ4W7dBM6DRnmdYuBEZbhIIsWdkw4gDjbbQCb/YQHQDk
	JBErpKYX4Jd2DExiorbfH7RdzznYNR/aDhCkqDTN84K3zHcdRh8TCBBu1LpnOXP7ZZ/u4XUrFXt
	DCeJ7BxqOSNMIlBt6YV4+Q5lonDYzjyaNYdLD3LGruD+8Tr3u0U6TRTy2Xfquh2Clr6quMFqFm8
	hPDWRhaKazLkjoXpbdy04PyvvhUkjpxMhKCsGQA4Xn7TC99co+u3tlO/Ts/TcgaDpgekMK8ckXn
	2Q75WTIVnGrhKP21IQ7/W3HUyJ36UUpplJJATyGgyMZqkdCw0qKGRntJDtZtFp3RJlO+MmAoXEC
	yMVbBevU3sX4WtVr67LFK5tdI/H+zJD6Kv9uOjMzxF+yF+yODI9sWo1wOE8Z45vEoXR/pSex1Rg
	8cgdEA/ttbz8lwJhW
X-Received: by 2002:a5d:5f41:0:b0:4a7:1fca:e52e with SMTP id ffacd0b85a97d-4a71fcae77cmr9354118f8f.50.1795073214244;
        Wed, 18 Nov 2026 23:26:54 -0800 (PST)
Message-ID: <979c9a8e-3d85-412c-94b3-f0eeae1ebe1f@suse.com>
Date: Thu, 19 Nov 2026 08:26:53 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/efi: Handle efi_memmap with Xen relocating itself
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20261118005021.2809-1-jason.andryuk@amd.com>
 <636449ed-4444-4d9b-b592-c53686178516@suse.com>
 <76b41d7c-5f96-40ef-894a-1aacf59873f9@amd.com>
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
In-Reply-To: <76b41d7c-5f96-40ef-894a-1aacf59873f9@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1795073214-188C99EA-CFDAFEDF/10/78276251493
X-purgate-type: spam
X-purgate-size: 1830
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19.11.2026 01:22, Jason Andryuk wrote:
> On 2026-11-18 03:14, Jan Beulich wrote:
>> On 18.11.2026 01:50, Jason Andryuk wrote:
>>> --- a/xen/arch/x86/efi/efi-boot.h
>>> +++ b/xen/arch/x86/efi/efi-boot.h
>>> @@ -219,11 +219,35 @@ static void __init efi_arch_process_memory_map(EFI_SYSTEM_TABLE *SystemTable,
>>>   
>>>   }
>>>   
>>> +/*
>>> + * Convert a runtime 1:1 physical address within the
>>> + * Xen image to a Xen virtual address.
>>> + */
>>> +static void *__init efi_arch_image_phys_to_virt(void *ptr)
>>> +{
>>> +    unsigned long load_base;
>>> +    unsigned long load_end;
>>> +
>>> +    /* RIP-relative address is the current Xen load address. */
>>> +    asm ( "lea __image_base__(%%rip), %0" : "=r" (load_base) );
>>> +    asm ( "lea _end(%%rip), %0" : "=r" (load_end) );
>>> +
>>> +    ASSERT(ptr >= (void *)load_base);
>>
>> Hmm, is __image_base__ really the right anchor? move_xen()'s memcpy()
>> only covers [_start,_end).
> Yes, you are correct and _start is a better limit.
> 
> With your comment above about -fpic, _start and _end will be 
> RIP-relative.  We can avoid the inline asm and do:
> 
> static void *__init efi_arch_image_phys_to_virt(void *ptr)
> {
>      unsigned long phys_start = (unsigned long)_start;
>      unsigned long virt_start = XEN_VIRT_START + XEN_IMG_OFFSET;
> 
>      ASSERT(ptr >= (void *)_start);
>      ASSERT(ptr <  (void *)_end);
> 
>      return ptr - phys_start + virt_start;
> }
> 
> Avoiding the inline asm is nice, but retaining the inline asm make it 
> explicit.  Thoughts?

Personally I prefer this asm()-free form. As to the casts - are they
Misra-compliant? Looks like right now they are, but only because both
_start[] and _end[] aren't properly declared const. I'd suggest to use
_p() instead right away.

Jan

