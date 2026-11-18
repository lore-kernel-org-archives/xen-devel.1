Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44B4606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 08:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZUqq810T
Received: from list by lists.xenproject.org with outflank-mailman.1493960.1693660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTanx-0007T7-Tv; Wed, 18 Nov 2026 08:14:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493960.1693660; Wed, 18 Nov 2026 08:14:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTanx-0007T0-QJ; Wed, 18 Nov 2026 08:14:09 +0000
Received: by outflank-mailman (input) for mailman id 1493960;
 Wed, 18 Nov 2026 08:14:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTanw-0007Su-KM
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 08:14:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTanv-001MjO-HJ
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 09:14:07 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd5e44-e002-0a2a0a5209dd-0a2a4503b48c-42
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 09:14:07 +0100
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd5e4f-fae8-0a2a45030019-d155dd2bedda-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 09:14:07 +0100
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-4a68190a2a7so434448f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 00:14:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a656933956sm3503408f8f.44.2026.11.18.00.14.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 00:14:01 -0800 (PST)
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
        d=suse.com; s=google; t=1794989647; x=1795594447; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0lw8g8BdosaJoe4gpBP6jRaWipXL1KeZrfRqhyOYMyY=;
        b=ZUqq810TXxnoBysZsLGwtcRHtpCkXE4LIcZ4vrTnAh3IurApYONhuih53be6M/1dXb
         sQeUvUtieUvjCtq8eIAlkVH5a0+n9vRq6nzcDoDKU1OBWzs0k+p1kuu7MhGTa9qRLMef
         OZsym6hNoevsfRdtNpp8lcoXSbXfRYnj3/4SvC6c4Ufnw03DhGPx6QGqs1qwRFEyHrCd
         jcf9rX4fpDsxM4W1f3YqNU4bCMn99jx4gWoxJGQPeZNRnQzJS06n7bZx97j8V5P8MHqw
         wK8I5ymOJ7UWtj7hQ8BJssfHLpHTcdn6myAXmBx0OYiqPouduRZWEHh9QzsXUP21fJU3
         Ud0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989647; x=1795594447;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0lw8g8BdosaJoe4gpBP6jRaWipXL1KeZrfRqhyOYMyY=;
        b=MdHg0e+styHEE6iyN+jFuLu3keTC1G0pYfrRlitKLxvNQK2lSCRafx0Ubu4njAq5Yc
         ichMDbFfzRCAMckzr2/A590ujXsVZjP6S3BDL46DYCl+CeXc9btWwHG1pbuqaXzqpP6/
         058wucDKgy/N3Qa6BP8m+V97/E4I4g0MwOBoK5w5XTx7uZpD7z6FdmVTllNI4rO6CxHg
         8cbUsP8CJ4JJTWYiYtG2L1uFNVXoP+fQUmARp/P29+tYhDgkOHQAszpv5Bkizd0iIx+b
         n5ApzuoF0BS2WvTpU2nxwkHwZZo2FCNgFh8v2nrTzPs543I97hmMpSsy+Wu+iNqlfaSv
         pcUw==
X-Forwarded-Encrypted: i=1; AL+hErEQWmNVbvrtzQI6y9rVroGGXKKq2kPYld5HVnRaxS+R0bDBwekidOqtfGJdAm4qMA/NJbDBA1WnYOQ=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/B0h4OB2nn0+r+ucPC50VHqvD7gIRjY35tRyL8MkaMlJcU+acn
	zVCzsk+0cDISs+/OkmPhkVAyE6tS8xVugwS7b16nR70pgFHB86ZJaSqa6eAokM/UnQ==
X-Gm-Gg: AZFdTZf2/M2BMsWZ1ZRBTZwaimR2ebj2OAN2job+bC7ZOfzsnodHpPWp/CPfaMx07A7
	2ArBARh9iCXUS8jAs1SpVc2244JhI6hWUKxYy/UP61Pts8XIqQjEarb5vlcgLE4b2oQzytnUWvA
	8enEfKn3ZGBibWCfFQTSPIGQJyd1NpDqBpQPY7Ob+XCepySMlPjb8Xs66NDPkVWj4ZrKNcEohY5
	zFS4jIvcwmho2NDL4qiqlP/z5ilGY4Lr72MgQQLtzS8sq6Ai4XqVgdL9T1kPRcEMNNySTPsglMD
	t3mFfkJHGZCGGOyRF9EUaNDhCSSiep+yTjnhTGGl+zq4kxF2wsBojOma3rzXjyfmxXv1T/5EsEw
	Bk01ui3YzkknA5i54XAxtyYrEGC3z+JhClGctkGB8Oc/QNXa1KlgVpkVNzQ8SNXpc9RNDzALYNE
	dNJWWxEpZ8tjXEePMGibCw+AMvM2fd0wQtpbyi7FzpgUTsCc3hZOc3BHJeXXXroUizaBphugMGB
	QehZNjohTU/TXTLVRdSdx5Z89FtCFc3G+SeserXSeG4pFDTdfCnciZg6KIQP42XXf7CEtVliqm3
	QhME279i/MJIbmFl1zavCuQYDH8OBoP+iZFEQQY2L90ctWa+2Go5nqE+8jWyz57zHR9rhRkW6kc
	cfwyFBjbO4s84fmQXmPYUZv82fUxoDD9IISC2wV8=
X-Received: by 2002:a05:6000:47d4:b0:4a3:41e1:9d16 with SMTP id ffacd0b85a97d-4a63ac6b6ebmr2396460f8f.25.1794989641737;
        Wed, 18 Nov 2026 00:14:01 -0800 (PST)
Message-ID: <636449ed-4444-4d9b-b592-c53686178516@suse.com>
Date: Wed, 18 Nov 2026 09:14:00 +0100
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
In-Reply-To: <20261118005021.2809-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1794989647-6E4CF4E9-0C4B899E/10/78276251493
X-purgate-type: spam
X-purgate-size: 2921
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18.11.2026 01:50, Jason Andryuk wrote:
> With Xen booting via Multiboot2/GRUB on an EFI platform, and modified to
> use MULTIBOOT2_LOAD_PREFERENCE_LOW, Xen relocates itself with
> move_xen().
> 
> However a PVH dom0 shows:
> kernel: Failed to lookup header 0x77ffd000 in Xen memory map: error -3
> kernel: ACPI=0x77ffd000
> 
> ... for all the Xen efi memory map lookups.  Dumping the memory map at
> runtime showed it was scrubbed.  Because Xen relocated itself, the
> original physical address referenced through a directmap address goes
> stale.
> 
> Add efi_arch_mmap_buffer_virt() to convert from the initial value to an
> appropriate runtime value.  ARM uses Boot Services AllocatePool(), so it
> must continue to use DIRECTMAP_VIRT_START.
> 
> For x86, we use an offset into the loaded Xen binary at the time of the
> call and add the to XEN_VIRT_START.  ebmalloc() allocates from the Xen
> image memory, so it moves during relocation.  xen_phys_start is set for
> xen.efi in efi_exit_boot(), but not for xen.gz, so it cannot be used.
> 
> Add a generic helper using `lea __image_base__(%rip)` to get the current
> load address, and use that to calculate the offset into the Xen image.
> That offset is also valid from XEN_VIRT_START.  Ensure the value passed
> in is within the image.  Use the generic helper to implement
> efi_arch_mmap_buffer_virt().
> 
> Fixes: c5b9805bc1f7 ("efi: create new early memory allocator")
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> I think it could be seen without MULTIBOOT2_LOAD_PREFERENCE_LOW if xen
> chose to relocate itself.  But since grub usually loads xen high, it
> doesn't relocate itself.
> 
> _end is already calculated as a rip-relative address by the compiler.  I
> still added an inline asm to ensure a rip-relative value is used.  i.e.
> I don't see why the compiler couldn't insert the absolute value, if it
> chose to.

It can't, as then it would violate the -fpic that we pass to it. IOW it's
really the other way around: In asm()-s we need to be careful not to
violate compiler options in effect.

> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -219,11 +219,35 @@ static void __init efi_arch_process_memory_map(EFI_SYSTEM_TABLE *SystemTable,
>  
>  }
>  
> +/*
> + * Convert a runtime 1:1 physical address within the
> + * Xen image to a Xen virtual address.
> + */
> +static void *__init efi_arch_image_phys_to_virt(void *ptr)
> +{
> +    unsigned long load_base;
> +    unsigned long load_end;
> +
> +    /* RIP-relative address is the current Xen load address. */
> +    asm ( "lea __image_base__(%%rip), %0" : "=r" (load_base) );
> +    asm ( "lea _end(%%rip), %0" : "=r" (load_end) );
> +
> +    ASSERT(ptr >= (void *)load_base);

Hmm, is __image_base__ really the right anchor? move_xen()'s memcpy()
only covers [_start,_end).

Jan

