Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9ECDCA5FFC
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 08:28:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441281.1658847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE0XO-0007G3-4F; Tue, 06 Oct 2026 08:28:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441281.1658847; Tue, 06 Oct 2026 08:28:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE0XO-0007Fw-0x; Tue, 06 Oct 2026 08:28:38 +0000
Received: by outflank-mailman (input) for mailman id 1441281;
 Tue, 06 Oct 2026 08:28:36 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xE0XL-0007Fp-Vw
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 08:28:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xE0XK-00FqyS-Kr
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 10:28:34 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac4b127-bab6-0a2a0a5309dd-0a2a4504c3ac-30
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 10:28:34 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac4b132-b57f-0a2a45040019-d155dd30b48f-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 10:28:34 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-48af27fe287so249789f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 01:28:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6cd7c278sm1834890f8f.51.2026.10.06.01.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2026 01:28:33 -0700 (PDT)
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
        d=suse.com; s=google; t=1791275314; x=1791880114; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NkYJhGZ5qN/ObooWiXFFFWdX+Ohl2lqI1lje36V1iJ4=;
        b=b9K6AoAM0XBcPLNnwTEYcobyBZ5efY74NxGZZndgJiQOJl8nyqx8avVklN+2IFOQs7
         KWBmQgqdEhgwZODnrO4Vip6pZTeMR985vUHiEKa51cCS2LNluoLJMonCUAwHIqDN5Zsv
         FHHGWbaNS+Hf3no9JDM9FK+bKuE2pgXWkk7ABMQuLfVvOvP2h3KW2smrW73E+VbLHpN1
         zwYlwwKNLxE0AGx48axugEnVVCOBPKhQfvnp4VBlSitd4OB/lSFQTIGKTbzq6U0kLTyv
         TatmgUJTkpoDy3dIQq/1eAXP26KtzNPr+aZ3FvquUKoIgknLRMoinioiajKvd5YzoAM6
         B94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791275314; x=1791880114;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NkYJhGZ5qN/ObooWiXFFFWdX+Ohl2lqI1lje36V1iJ4=;
        b=tbXnclndVTBChqTMY58txEcVnHdhX+BtZ4fWaq6owFzs1yP59ad9OcpYfhDBMAOi0s
         LscvngCkLtBBfKr3FhAqwfBmlygtKlZaEuU7BYWQotVxuKI4H329/cpAWRq17EPsY5In
         c8o8ULvN1AVcrkQV1lB/ph7fnIdqRk5J415xYtfS5XtwAC5ihzJwjYYnD7RS7O/OVmXy
         Ln4WBspjvM5n68DnmYhEyxxs5CMNLdQgeBFBRYHWQf+RX0zMSF0z8zP4m7lWZNEZeLZh
         ePxqGxIpx66vbApqlsRBjYHYNb2Qt6qQ/NX7a8Xqcwn0xhXxyUsgsxhK1ENUzy8BtOjC
         TunQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2jzW95JVhK5K7wltNGV9OrpjbXs2GnVJ9UuGmoJ0kUnLTgO+6U8oHyoLpkkDjh15mXj6w64W8VFs=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJNTOSIJc0g0FX5UGqzcwrDjFaXzFDEyAnILVx2ETH8iUPvZIb8
	weXTUM1TZunQxYoarzElwFhngvYl/GMT66WjenLlI8UM1eRgpctIOS/hSoblFnIT7A==
X-Gm-Gg: AYBFou3dBPSHXJp7sZqjY75wDs+ffvjw393dDGN7vPosz1PqA+hyTrtzbHOxCGhclk8
	Yp1EKykuTtd66NPKd3+E+iNX0gTsFFMzT7J04svIkTyq3PLs6ROWLV0qViJbmZtZ3mokZ4W97Ul
	CSgBsHH3c67pBaQTwN/eQng3+FNBnz/4LOLAise1XrzUWPHwX9B6LAbYzl5JSKKgkItkrnvcQ/a
	f+1OjjnIqcdsHwvdGxM0sI8faQD3k/Jsw/2j84p4l3GW5l98nxJ+B23J/gmJ5QU+uv5lHrPnmQ7
	ec2Sjx59QH4IdTKu49GfFnVfl2EsQxM9Ab2J3oSMyg+Y5UgCPIhWA//9wVjP3SCJd/Z0J5mqKWI
	ds5SHbiQn1dqe9ogHAV59TY0vIWDiu3M6Ow7Rq1A3AdTX6TKniPwlti04hPDEUv4ubdnl64YCgp
	YSnItzcrQTNQ70Fzj3YlrQLWyZbz0MQ8VQmFANrqwFtnYNXhKfOpoBhR3GVXXv4Wj/A05kzOy3h
	+608NDaZga1vNvt8KSnKK4CdtRvQn+eUjJXFTo9MhvQheH5+dYBl2nvh6voF6U=
X-Received: by 2002:a05:6000:2912:b0:487:f31:8037 with SMTP id ffacd0b85a97d-48c6d16d27amr1072662f8f.14.1791275313685;
        Tue, 06 Oct 2026 01:28:33 -0700 (PDT)
Message-ID: <4a0b9a82-c142-4c12-81df-4e0ab2191721@suse.com>
Date: Tue, 6 Oct 2026 10:28:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Xen/gnttab: improve error handling in
 gnttab_dma_{alloc,free}_pages()
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <00493037-e77e-4631-8594-64ad4e46fa40@suse.com>
 <f9699fcd-3348-41db-b81b-d0d7cba3ca4b@suse.com>
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
In-Reply-To: <f9699fcd-3348-41db-b81b-d0d7cba3ca4b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1791275314-50AD8B50-18138989/10/78276251493
X-purgate-type: spam
X-purgate-size: 2256

On 06.10.2026 10:12, Juergen Gross wrote:
> On 16.02.26 09:55, Jan Beulich wrote:
>> Both decrease-reservation and populate-physmap can succeed partially. For
>> the former this may be pretty unlikely, but clearly the latter can hit
>> both out-of-memory conditions in the hypervisor or denial because of the
>> allocation exceeding the domain's allowance (there's no interaction with
>> the balloon driver here either).
>>
>> In gnttab_dma_free_pages() we simply can't give back to the system what
>> hasn't been re-filled with backing memory. For gnttab_dma_alloc_pages()
>> both parts of the overall region need dealing with differently.
>>
>> While no present caller of gnttab_dma_free_pages() checks its return
>> value, also don't use -EFAULT there: It really is an out-of-memory
>> condition. (In gnttab_dma_alloc_pages() -EFAULT doesn't look quite right
>> either, but I couldn't think of a clearly better error code there.)
>>
>> Fixes: 9bdc7304f536 ("xen/grant-table: Allow allocating buffers suitable for DMA")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I'm likely screwing things up, as I can't understand how this is intended
>> to work: args->dev_bus_addr shouldn't really be in pseudo-physical address
>> space, or else the address isn't suitable for handing to a device in order
>> to DMA to/from it. Hence using __phys_to_pfn() on it to then hand the
>> result to pfn_to_page() feels bogus. Was all of this perhaps only ever
>> intended for (tested with) translated domains? With the uses of
>> xenmem_reservation_va_mapping_*() only being masquerade?
> 
> I finally forced myself to look into this maze.

Thanks much.

> gnttab_dma_alloc_pages() will only be called via
> gntdev_ioctl_dmabuf_exp_from_refs(), which has:
> 
> 	if (xen_pv_domain()) {
> 		pr_debug("Cannot provide dma-buf in a PV domain\n");
> 		return -EINVAL;
> 	}
> 
> at its top.

Well, gnttab_dma_alloc_pages() is an exported function, so it can in
principle be called from anywhere, including out-of-tree modules.

> I'll setup a patch making this clear.
> 
> Are you fine with me taking your patch and cleaning it up regarding the
> use of xenmem_reservation_va_mapping_update()?

Yes, sure.

Jan

