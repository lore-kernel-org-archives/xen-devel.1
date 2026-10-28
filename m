Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0216D606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 14:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OJu7b4Wu
Received: from list by lists.xenproject.org with outflank-mailman.1463371.1674264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM4m3-0007v5-8K; Wed, 28 Oct 2026 14:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463371.1674264; Wed, 28 Oct 2026 14:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM4m3-0007ux-5E; Wed, 28 Oct 2026 14:37:07 +0000
Received: by outflank-mailman (input) for mailman id 1463371;
 Wed, 28 Oct 2026 14:37:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xM4m1-0007uq-D2
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 14:37:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM4m0-002fHS-JG
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 15:37:04 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae20888-bab6-0a2a0a5309dd-0a2a450bb2f6-10
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 15:37:00 +0100
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae2088c-b7e8-0a2a450b0019-d1558034d92b-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 15:37:00 +0100
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4a35db1f202so8255505e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 07:37:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a977539ef8sm50988715e9.0.2026.10.28.07.36.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 07:36:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1793198220; x=1793803020; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9PNJFj8bJ6k//jnvVlqtePr374ELc1J50WDMx1DULyA=;
        b=OJu7b4Wu5qqFd//aDO4WNWH6RgHmYUNyAgOiLyetnYdbJeoBurr6OZeeSBMGbzMOB2
         NsijziYeUZ4eiSy41C5afM8DKtpTs3N1RpzpLsl3D5UeVyen+Eo0fJif+rRwGR7uUanU
         OJW+GRlE/dFJClk4hkZ6fRMxsZp5OVv8YxSmKPjrDgDCE7cvZ3U1ctGn0+WCi2Pv62dR
         Wq6lDy62Eqzb6vklJf4i3g97rd1jr6hU0U9cqAl68eimJ/NlAatgnd5/6Jtul/Ml+6PX
         UEALB3a5AnJHXUUwwschANV9KJz/zsdcMw2gt9+AYUtZ/zIuv2ehZ2a677w0OrkPBQHO
         AOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198220; x=1793803020;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PNJFj8bJ6k//jnvVlqtePr374ELc1J50WDMx1DULyA=;
        b=zWCyPy9WSjiKrvR/PyjWBh5edZkd5FoN71j8Rn2D4umBnCrgCmH+QN1AfL0AUvp+ru
         u/OZBrcAJa8ceMGG3OukMs5cDcophoIgddIPLWl8igfksRhcCEKHYvnIJ55gBatrZFWz
         kWRORplWA/0cucLHnDsN+plEs8HGqVKYo7QOAeddHRSm/w3r0s83j9hQ15NmxxqYuPC8
         /EUkUeMQi+FykDh61ohDggHU3FB2MjgsSBnffI8zdrN88ddktKx09jRwaXi/Pt0Nhjxe
         hAdaWE8gyHMqMYXp+E0JybazBE9Has4PC5IYB4LE7RMZC/BadaGh44p67BkTrICEq2A4
         +UWA==
X-Forwarded-Encrypted: i=1; AKwUvBzEkGyqQryqkrDH30cdLpn+mh5Ja8wl393zXLqs8SL5l2tpZf1WS8aERVLjtB0hRMiGhNSJY8Mo4U0=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIdc5gmd92RpDWgRj2tkWaoXYrlIsAh4A0Vccs25Zou2VuKcVIk
	Otz4nRSfNEY6l/2ZgHUIuzG89PLOg4HWwMMHGwtHslubadz8Pn7URSdcjhk/5jLIYg==
X-Gm-Gg: AYBFou1CBpknNkAx1D5d89lhOy4ibxO7xtelWzRhFchazM59wVcA/ALjC+MzgLlseKc
	T5hBDco5DbyV7nkzenHLoRMmZZ9vs8c8fTUdEIMRNQ/PKVCDCaoed31rfpShKZksgJGJCu/GSut
	NcNHo43zm6+e/fJ8x3VyOIsPCecldffj9hHfxmCPLJNrTkxQwHtWdOgoPxOilROIw3KWaqTzWNS
	lyNYBS8YX9hFFshpaJT0cpWegYWS2VetjNFpK3xXu3dZJ/1Kui/F2cXz/qAar+517CobJJs6hwv
	/vjBl7eUtIetTxG2IMzuyw7IeDvTjRY24nhO6M2ziQOG5F2fTTdeNwZZWAybgnSOYU8dQPzcub4
	0Hlc0NR5Z8Oroj5FUUu490XSMP8QGR+ssLlwBPysSXzqMrMJKyCTyQvgfmvqaqYZ1xWua8mKb4y
	2zqv2QF3dnNWTPwkMkqwuJ4t+eYhjwcbe5v6THQXjEdlWv29PqGyRJGLM074EQHX6SMNXkOQIvU
	ijgnX5Zh7qX6v8hVxLtwtTibHoqFxXyh6atAjbPjMyvfqV6ZOoYor0HtUdCaB4ZfnzUnIw0Cfsr
	pqejYKcLyiJM0OsBTRFRaDskjDPEX9f9ElwHo13DTIpaPgNJ+ifAMyPMRx5HLWuiiVbHtaFjO7t
	F5ECcMBsQ9ExLkRM9
X-Received: by 2002:a05:600c:3e0a:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4a9640f1fbdmr58548995e9.4.1793198220201;
        Wed, 28 Oct 2026 07:37:00 -0700 (PDT)
Message-ID: <a3c4926f-9e69-441b-bb4e-0f8324e17f02@suse.com>
Date: Wed, 28 Oct 2026 15:36:58 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/1] xen/riscv: probe the A/D update scheme if the DT
 advertises neither
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, xen-devel@lists.xenproject.org
References: <1793192679.8631fc262581453bbf619ec5b2062170.1a1829cd6d5000f79f@vates.tech>
 <1793192757.8631fc262581453bbf619ec5b2062170.1a1829e0a63000f79f@vates.tech>
 <35fa29d5-fafc-43da-a5a5-72df8f367e3c@citrix.com>
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
In-Reply-To: <35fa29d5-fafc-43da-a5a5-72df8f367e3c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1793198220-A84CB9EA-4A529E9B/10/78276251493
X-purgate-type: spam
X-purgate-size: 3507
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 28.10.2026 15:24, Andrew Cooper wrote:
> On 28/10/2026 1:05 pm, Baptiste Le Duc wrote:
>> diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
>> index 3d5bbd2228..83d3bc5ddc 100644
>> --- a/xen/arch/riscv/cpufeature.c
>> +++ b/xen/arch/riscv/cpufeature.c
>> @@ -630,6 +632,53 @@ const char *get_guest_isa_str(void)
>>      return guest_isa_str;
>>  }
>>  
>> +/*
>> + * Probe whether hardware updates the PTE A/D bits by reading through an alias
>> + * mapping whose A and D bits are clear. Observing A set, even by a speculative
>> + * access, implies Svadu, as Svade only allows A to be set by software.
>> + *
>> + * Under Svade, the read raises a page fault instead, so use the extable to
>> + * handle it.
> 
> This is an internal detail, which can be covered by an internal comment.
> 
>> + */
>> +static bool __init probe_hw_ad_update(void)
>> +{
>> +    vaddr_t va = FIXMAP_ADDR(FIX_MISC);
>> +    pte_t *entry = &xen_fixmap[FIX_MISC];
>> +    bool a_set = false;
>> +
>> +    ASSERT(!pte_is_valid(*entry));
>> +
>> +    /*
>> +     * set_fixmap() can't be used, as pt_update_entry() always sets A and D.
>> +     *
>> +     * A and D belong to the PTE, not to the page, so a new PTE with A and D
>> +     * clear can point to any RAM page, whatever its other mappings. Use the
>> +     * first page of the Xen image, and map it read-only so that Xen can't be
>> +     * corrupted through this alias.
> 
> The function comment is mostly ok, but this one is misleading, not least
> because it talks about corruption despite this being a read operation. 

I think though that the intent of the comment isn't limited to the read, but
also to possible (bogus) further use of that PTE.

> All you need to say here is:
> 
> /* Opencode set_fixmap() to intentionally leave A/D clear. */

Imo the seemingly arbitrary choice of which page to map can do with mentioning.

>> @@ -674,6 +723,28 @@ void __init riscv_fill_hwcap(void)
>>                 "Zihintpause unavailable: cpu_relax() gives the CPU no hint; "
>>                 "wire up this platform's pause equivalent in cpu_relax()\n");
>>  
>> +    /*
>> +     * The privileged spec allows exactly two schemes for updating the PTE A
>> +     * and D bits:
>> +     *  1) hardware sets them on access and on write;
>> +     *  2) accessing a page whose A and/or D bit is clear raises a page fault,
>> +     *     so that software can set them (ratified as Svade).
>> +     *
>> +     * Every implementation uses one of them, but may predate the extensions
>> +     * and advertise neither. In that case, trust the hardware probe.
>> +     */
>> +    if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) &&
>> +         !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu) )
>> +    {
>> +        bool hw_update = probe_hw_ad_update();
>> +
>> +        __set_bit(hw_update ? RISCV_ISA_EXT_svadu : RISCV_ISA_EXT_svade,
>> +                  riscv_isa);
>> +        printk(XENLOG_WARNING
>> +               "Device tree advertises neither Svade nor Svadu, probed %s: add it to \"riscv,isa\"\n",
>> +               hw_update ? "svadu" : "svade");
> 
> This is overly verbose, including details that absolutely shouldn't be
> the boot log.
> 
> "Neither Svade nor Svadu in Device Tree - probed as %s\n"

Some shortening is certainly worthwhile here, but omitting the hint what the
user can do about the situation is imo unhelpful.

Jan

