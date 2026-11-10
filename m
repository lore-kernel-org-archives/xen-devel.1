Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD3760A2604
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 15:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YWMkYadX
Received: from list by lists.xenproject.org with outflank-mailman.1481975.1685870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQnYc-0004tP-3L; Tue, 10 Nov 2026 15:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481975.1685870; Tue, 10 Nov 2026 15:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQnYc-0004tI-0X; Tue, 10 Nov 2026 15:14:46 +0000
Received: by outflank-mailman (input) for mailman id 1481975;
 Tue, 10 Nov 2026 15:14:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQnYa-0004s8-2K
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 15:14:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQnYZ-006cJG-FE
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 16:14:43 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af334dd-2eae-0a2a0a5409dd-0a2a4506a57a-10
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 16:14:43 +0100
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af334e3-195a-0a2a45060019-d155dd32d0cd-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 16:14:43 +0100
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-48e20ed3b9dso1859623f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 07:14:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498369a4238sm5782939f8f.54.2026.11.10.07.14.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 07:14:42 -0800 (PST)
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
        d=suse.com; s=google; t=1794323682; x=1794928482; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pBsB19wLtC5K1Uc0b4VdVMCTifK2kGawSaPusr+LrZg=;
        b=YWMkYadX4JSRziHCQ/ofy/Y41eKitDMO50/1OG4rOMOytW2k403OKCuXeh+8HfpDDe
         HoxgIrB9C4dc2JJ4x7Gzt+jW3rccksgcBYj4VpWszR5zVgLgUkXsacPQ0E3D4vwwhr+0
         x1nBLIdh8crSEoQnN/YpUEi8tYLKsJXU9+/EAu+uNmYzXbQSDqa44K7Mg75q6XX24qQJ
         Gx1bEeEXiY7PHYHpiyfUj3fGC4i30Tdmz7+83tOHr7+i7IxBIr3YG2a64YZsLPAfUITT
         ST6YLgakaLPBqVfCUOlCZLGgs8S/dTDz3rE7z7VEuvv9+31iluqX1bXoSlUHJIpV8vZy
         mBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323682; x=1794928482;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pBsB19wLtC5K1Uc0b4VdVMCTifK2kGawSaPusr+LrZg=;
        b=bcAOQd4tL96VRjp7NB48S86G5B7bRnuyTW/cndA9MLVXGVfIzhNuqW8Cc8yRNJPp2I
         hOgd3dpM1idHXjijYzOlMPpCr33eZK3/vDZgcPzfaPVbacng9qs0caRLAxp2OhgGFCwa
         fQupT7i1s1hUJJK9XpSRR3neQJF72Zx41UE2aN+eghZmxI1ZWnWz9/hWM/tIixIm1UAS
         ZXHJWELp0LLJeGtZpCFOcCu0yxbn5mFLVM7qmEhr9XImpuXR8kwSuWNJMVN+Hlt4u5oy
         bFnkyj5yB2Zrubr50jJRHomP2RDbwynZhwIT3GI94Orie+sbBSYxzlFQuXFePE5t2OfL
         57Qw==
X-Forwarded-Encrypted: i=1; AL+hErE40zO/m8rtaDHmTc1FOeNfuln53haFHrVGL+pU7oZhYdibghQB+kVbY1Ph4gtlNCQXVeDrD9CtgNo=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8JXnvyNWalVAowDuMCVbzwn2WANQQ5waTmy7VOLStcK9WGP5QP
	XbVr9wyRutVJH9r8CAsO8tkupL8ntPyOlFMzQbfJ/QFH0N0CC2os4kjKhBTuFin2cA==
X-Gm-Gg: AYBFou3iZr5I5sZ+/t8VVWTlaz7p0VtKA8r8lTJsKkS7x3d7cKqIUjd1VAySyd7pBeB
	oJKpI40CcoV5ojAuIBETyRxWiYBkmvQ7KjNT41RJSrjHkpOE7lqgP+X3OFKHmhrpUo698CWN0mz
	ZemUJewdeuNuVgqvUp1dWWnjT8y9lBQF61UPpeSCPCJccjwlyDMbnQPhxwsSr7X3iBID2p8Qtft
	Ztd5HBNLrYitTSHRmQNesVkyd/LRzd6J8+ITXsTRU04txglM9g433uOFL0y59sFIrIIPASNdMpb
	/CHEMrikn475zg3XwA9Kf8kHej+t8I9ZWSdaJ3IW4RAWTR8vOG4xonUvLm82vo1/i2PPzC8TtS3
	PjHlehFophq2qNvvc6xRE0jKM6qr9aGg2aHjWHA0ee/MAQZxdxBNcyx3u5oheyXVzjrsRtS+WQc
	zT3eC7VDgD80PmrXOhA7vm0RTYupr+2VmYRUzuRgFHMZsJAUo1jl/i7BzJaZsgKvFPfmj9HmFah
	YKu8op6PdgWoaRU6pSOfkn9p3uNEF08jaIJwCeVlfsaRqx5Wv097a7b1qqMJiw+gZbvfvbdujqK
	t/c4UBiJ1La/PLi40aWdw2p0NqHqcSGMN7abCGVvfA/jSnpJAvQv4NVW8c0+Ki3pcnneXar2moE
	ygVGdR3AiwyXLTRML
X-Received: by 2002:a05:600c:b8d:b0:4ba:761:97a1 with SMTP id 5b1f17b1804b1-4ba076197d0mr26923125e9.14.1794323682530;
        Tue, 10 Nov 2026 07:14:42 -0800 (PST)
Message-ID: <f48effca-510a-4ec3-8e2d-cd6c879aa182@suse.com>
Date: Tue, 10 Nov 2026 16:14:41 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/efi: Handle efi_memmap with Xen relocating itself
To: Jason Andryuk <jason.andryuk@amd.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261106231818.482564-1-jason.andryuk@amd.com>
 <d15b8c70-840c-4de7-a047-823a31952567@suse.com>
 <864762ac-64c4-499c-aacf-5527390bd95d@amd.com>
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
In-Reply-To: <864762ac-64c4-499c-aacf-5527390bd95d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1794323683-F420077B-BEB96639/10/78276251493
X-purgate-type: spam
X-purgate-size: 1574
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10.11.2026 15:42, Jason Andryuk wrote:
> On 2026-11-10 03:42, Jan Beulich wrote:
>> On 07.11.2026 00:18, Jason Andryuk wrote:
>>> --- a/xen/arch/x86/efi/efi-boot.h
>>> +++ b/xen/arch/x86/efi/efi-boot.h
>>> @@ -224,6 +224,16 @@ static void *__init efi_arch_allocate_mmap_buffer(UINTN map_size)
>>>       return ebmalloc(map_size);
>>>   }
>>>   
>>> +static void *__init efi_arch_mmap_buffer_virt(void *ptr)
>>> +{
>>> +    unsigned long load_base;
>>> +
>>> +    /* RIP-relative address is the current Xen load address. */
>>> +    asm("lea __image_base__(%%rip), %0" : "=r" (load_base));
>>> +
>>> +    return ptr - load_base + XEN_VIRT_START;
>>> +}
>>
>> There's nothing specific to the mmap in this function, hence it's name is
>> a little odd.
> 
> It is paired with efi_arch_allocate_mmap_buffer() above, so I wanted the 
> name to indicate that it is converting mmap_buffer to a virt address. 

Hmm, right. And this is entirely different between x86 and Arm. So common
code wants to call a function of this name, but on x86 this may then want
to be a thin wrapper around ...

> Having said that, I am open to renaming if that is desired. 
> Alternatives could be:
> efi_arch_xen_phys_to_virt()
> or
> efi_arch_image_phys_to_virt()
> or
> efi_arch_xen_image_to_virt()

... a function of any of these names (which in turn would be possible to
use for other purposes). Marek - thoughts?

With this constraint on the x86 side, wouldn't you then better add an
ASSERT()-like construct to the actual translation function?

Jan

