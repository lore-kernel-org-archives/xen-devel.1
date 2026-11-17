Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F9E606A894
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 08:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Z9ixtV+h
Received: from list by lists.xenproject.org with outflank-mailman.1492040.1692717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTEkE-0007so-Ey; Tue, 17 Nov 2026 08:40:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492040.1692717; Tue, 17 Nov 2026 08:40:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTEkE-0007sg-CF; Tue, 17 Nov 2026 08:40:50 +0000
Received: by outflank-mailman (input) for mailman id 1492040;
 Tue, 17 Nov 2026 08:40:49 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTEkD-0007sY-5u
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 08:40:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTEkC-00GDvN-AK
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 09:40:48 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afc12fe-e002-0a2a0a5209dd-0a2a4502b7f8-46
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 09:40:48 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afc1310-6ca4-0a2a45020019-d155802be546-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 09:40:48 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a207b02a2cso26004245e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 00:40:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb78422d2dsm76281845e9.10.2026.11.17.00.40.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2026 00:40:47 -0800 (PST)
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
        d=suse.com; s=google; t=1794904848; x=1795509648; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kN6K6PN/jF+zdARGuEFTXGQaHJosBgB/D4PSv/RWkSg=;
        b=Z9ixtV+hIReLAvVNuBoqFFfN08LzJ8HvViyMenC2EUvqhXgPg8TlVzf7QIyix3Ojj3
         nC9Pw2wxSaE/cS4IVk8CVq4ldNs+p8qU9EQo0Ky+3okSk4gLWlRV4uca1eVSsOXezQf2
         l7a3YPKY9/QW9felxgSEsBNdcITG7SQN/pq2i4VWPTXZYWBgvF1HRCaLA3/kugTWUVp0
         nGN5O6n7TdXz7EqS3+FhDbWySUGfnM5sGReYsS2N3APS7QoxscdRQ5Ht0y68bkTTUmsl
         RYjgBbzNoNASSlK2cP7smQ+ja/+QEI0AH5MEIRbdESeSqCNhNSJf/hRYWOmPUGHhfmNE
         xtHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904848; x=1795509648;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kN6K6PN/jF+zdARGuEFTXGQaHJosBgB/D4PSv/RWkSg=;
        b=JMoANTox5ZZ6kmoD34XaZQWs8v/l4pM5sumJw9LW3s5hQK1lAgMWCGCyQcBDHlASoF
         IjhWKu/WKPQmdoe3mZnSsEkJhpYRisWkCVqZKGNayhXHpAjZDd/aNPRmjuWcD0q+V4S2
         SO/kBAWHqVka08CyTdI88N3YDQGQrsjVbh4liAnBGgIdf/jwHql1yVlaVXfgP/yKeZMs
         wtwnysiO6Wp0Mv/8W0853gtoWVu6CIZCL3I8kyf1es7Nu+ATxNke9RZuI/Z/pt9dp40T
         nSI9OVDyG4MD4gVmA+znSpMNtXYuGvxR9F+Vnldv14Nf/RY5dBDAUCljAipqazxQQAP3
         FVVg==
X-Gm-Message-State: APuU4Z/gjYbjtud6tLOqqWVDgKeQ+VeeHMhDnqqq5jw/jhhImioKE3EB
	V1vIjHGrvgf6qdHxA94cvGo4iP8UZjQOho3jmXQWtRwhz68KBhPBNWCNpk3g3G/DAg==
X-Gm-Gg: AYBFou0mzqQ7124mdi1SQ/u0gQSkVqPqtjelz2wNgbUtGELbUkdz6vVzYU5CT5qcz5J
	KR21Eiw/3Ifsiispfg/LoOzwnOquBMYbDKN55LMEbEe12tG0QauPwqt0KsVuR8O3nLYEzXw83Gr
	tbp1VgswuXJp8ITece2FxOKvBL75fYBcTefJJNhmudnlDw+6pK5JmZ97D8TykdH0vVm6qgAAkxi
	iZeBKU+zELQOu01VuU580w806qN8IuFen4HMufTmdAtfQKHkyFasyo0Rb7SAxWfwp8fvCA5849a
	CiRycm8i55W1YgNffz8SlIBNEDG8gIxRXfua2OOta5YJ+iSYMLtjT0VxYI0xmGB8WxCUoH0Ntag
	hXZfJT98nrimFIi/SRkc9u8VwnMr5mBeKeS92LQFMHLNA54yE3u9lxhe759T48NO7+zLxGGjq9i
	nUaEEU0YcCm3qCLXHDDBFll7JUKhTRxBv5Z8jMYzkzrzO35F+ZFnqrZNHWgRekj/lm8Zp3Ta9eM
	8TPGBUrgQye8+QUQij36+H6lF0eKoV27vjZxcfJbHIX6aXyWiLomLJyq2fL2kA97Ylc9EN12+8p
	wnRYoOhtEwZSqvpvys3smm5LhB/6i8braysniobjneYEekibX0w1uZwWnwc2VKJsK9p8uHkghBy
	ZrYXyaw50GZsD1HHvhj8=
X-Received: by 2002:a05:600c:1d0e:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4bb55aa28e9mr285284225e9.32.1794904847649;
        Tue, 17 Nov 2026 00:40:47 -0800 (PST)
Message-ID: <fbab32d4-fb1d-40da-a83f-05539489b876@suse.com>
Date: Tue, 17 Nov 2026 09:40:46 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/efi: Handle efi_memmap with Xen relocating itself
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>
References: <20261106231818.482564-1-jason.andryuk@amd.com>
 <avHikdwM2wR-GpON@mail-itl>
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
In-Reply-To: <avHikdwM2wR-GpON@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1794904848-F04A62AC-05CD5F06/10/78276251493
X-purgate-type: spam
X-purgate-size: 1985
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 09.11.2026 16:11, Marek Marczykowski-Górecki wrote:
> On Fri, Nov 06, 2026 at 06:18:18PM -0500, Jason Andryuk wrote:
>> With Xen booting via Multiboot2/GRUB on an EFI platform, and modified to
>> use MULTIBOOT2_LOAD_PREFERENCE_LOW, Xen relocates itself with
>> move_xen().
>>
>> However a PVH dom0 shows:
>> kernel: Failed to lookup header 0x77ffd000 in Xen memory map: error -3
>> kernel: ACPI=0x77ffd000
>>
>> ... for all the Xen efi memory map lookups.  Dumping the memory map at
>> runtime showed it was scrubbed.  Because Xen relocated itself, the
>> original physical address referenced through a directmap address goes
>> stale.
>>
>> Add efi_arch_mmap_buffer_virt() to convert from the initial value to an
>> appropriate runtime value.  ARM uses Boot Services AllocatePool(), so it
>> must continue to use DIRECTMAP_VIRT_START.
>>
>> For x86, we use an offset into the loaded Xen binary at the time of the
>> call and add the to XEN_VIRT_START.  ebmalloc() allocates from the Xen
>> image memory, so it moves during relocation.  xen_phys_start is set for
>> xen.efi in efi_exit_boot(), but not for xen.gz, so it cannot be used
>> Use `lea __image_base__(%rip)` to get the current load address, and use
>> that to calculate the offset into the Xen image.  That offset is also
>> valid from XEN_VIRT_START.
>>
>> Fixes: c5b9805bc1f7 ("efi: create new early memory allocator")
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> I did not tested this, but looks correct:
> Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Subsequent to you supplying this R-b I commented on naming aspects, which
(after Jason's response) turned into a possible slight functional change
as well. You're the maintainer, so if you say "commit as-is" I'll do so
(with just the style issue taken care of), but as this isn't the only
possible outcome, I'd like to ask for the decision either way to be made
explicit.

Jan

