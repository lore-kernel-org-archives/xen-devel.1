Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77863CA5FCE
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 11:01:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438150.1657013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCEWq-0005RA-8B; Thu, 01 Oct 2026 11:00:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438150.1657013; Thu, 01 Oct 2026 11:00:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCEWq-0005R3-5f; Thu, 01 Oct 2026 11:00:44 +0000
Received: by outflank-mailman (input) for mailman id 1438150;
 Thu, 01 Oct 2026 11:00:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xCEWp-0005Qx-7x
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 11:00:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCEWo-009VKa-L3
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 13:00:42 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abe3d54-e002-0a2a0a5209dd-0a2a4509b9be-36
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 13:00:42 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abe3d5a-be1a-0a2a45090019-4a7de18c8f4a-3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 13:00:42 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ffb83bf7aso42218495e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 04:00:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01f6c5059sm53713695e9.0.2026.10.01.04.00.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 04:00:41 -0700 (PDT)
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
        d=suse.com; s=google; t=1790852442; x=1791457242; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTJcU4w8z31zwCiwkKqD2MuLanrlejydS1dMYPugYlc=;
        b=WDLpRFT+Mmegv8xQb0x/xkZqfUiaOmo2/KVxZFT+xWonHOoEl4T5fxvXIKaM6k28BP
         P3EKUPBVNZYxmmimIqZkNhmY435tJTKuYYqZlsX+gfdhIwGtkLd4t8nZ4vryUq472/Tr
         3l3+dxdxxDLtuoQ9WTeHmZuWlIWc4R0SJY7siroMZSeFFwe0EEKN8kLFHwm+gi2D/5XZ
         UCefqGMsVuqAQHH3g26VSkVlcGTeofYwXuspC5f1B0KuU4Op13ZrxpkYozWUWaU36g4V
         gt8btg7M/MBcgkcU4vY9tEgdrXtGNCSGQuSQRbWdlgopXgoALeoOpF1SVcD82jNFWTHX
         b24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852442; x=1791457242;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTJcU4w8z31zwCiwkKqD2MuLanrlejydS1dMYPugYlc=;
        b=XUoD7cA02mqItHrtZBfVcM9eIbDBDBm/vKt5VJAv/bVIlVU5+7zM5gn5rFxiDcyZSA
         chKN976aJOHzOllRBLiuL2gKuuWqzciiXLmQsA5q4klehBEbvDWmAoUDMPIL0hVqADOq
         1c2ZEbAPJGuqnDnZTZHWIjI3QXk4hJkQztMKWlFC5Je8nGAAnsu5+LKj3Any1A3GFRHJ
         un84OTqjkWD2O0kyoZsL6MqF2bJTsHR7Pbw/vPdlHIwHR3EGFy1f52pDPyAFtfVUjKoF
         HDzCCsHOT7HOywW5MjQ4k77UAEyLn0J17hXMSn/hSEsQrYSA0rTt1lvMJOQcx6KJLbaL
         PNRw==
X-Forwarded-Encrypted: i=1; AKwUvByfdZtKV+kqBawSPhQu2hwtT5XlhXzRPUtBByha0EMIiuq5glQ5/BYqGnsW2XrpgxeQ2qbuYE9bN2k=@lists.xenproject.org
X-Gm-Message-State: AFuF++kHapvnlyrM6uO6S6TjKHBPURmhQ1nsv/yMbA0yqrKWy5AR6I8E
	ykEKKd5wFUfVjYD/E+/2wXLVWpaJONFjFnoP+J6ezdGE6P+mnCsNBhvyhaMGX3S5MQ==
X-Gm-Gg: AYBFou2aMib4/XBBRJc+hap4mVmmk05980BH2uTp+j5qc74j7y0xlOBIaS2DHnfHnb4
	hnlqkX84/zwfI2vKMYKP8faaygDuAVD+tus6XEa9p73lHNZbLMBkTP9xM3COeiqH+mXsjUIvZl7
	21uo/PSTDI5iTU0m1AVE2EnGptlvZk10/D6kYVAo0CoZTI+2/h2nDbuN5sCFCBZKYtdQYm35PPb
	LypAGcXv2h6cPIkkv/AhTxgV/RgtBBUpjUqDCbcpnBWU/XuQPR8nb7UoXu0u/e6ASh+sgwosjko
	bOeZW9VrDYxFO9qYBwlVLgcIsH70SgogoimnX5DrBTinI5iaWksZcSCjTHS9y6edEfxUt5aFR3k
	lpWRwlG+MrBN2N62XvX3szyLZQ1napEuC87jvy7uIwPotFXaRkpUQvn8He/pXl7KhtuPoLhw4Pv
	lW2TWmXG0q3taBb+bdS/Cj2QIT8P3RU3x28IDmZoFERScGv+MoTqHPzkQRYWM2lc85NWb2kYqO+
	aqfZj3K5KhrOSd1ezo3hpUTcYUhBUU7R3WJcj2/TUUqrOQbEnYVml1+0evVVICBa4RwOekUzg==
X-Received: by 2002:a05:600c:3145:b0:49f:bd3c:bc1a with SMTP id 5b1f17b1804b1-4a01b00d9bamr70945215e9.21.1790852441696;
        Thu, 01 Oct 2026 04:00:41 -0700 (PDT)
Message-ID: <07e9f4c5-0e5a-4420-b926-9598f79b4d1e@suse.com>
Date: Thu, 1 Oct 2026 13:00:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: restrict XENFEAT_pae_pgdir_above_4gb setting to
 PV guests
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260930191104.78141-1-roger@xenproject.org>
 <a9d59bc1-6e21-4a8b-84e5-6daac02997c3@suse.com> <ar4Z4EQo7FulrZXF@Mac.lan>
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
In-Reply-To: <ar4Z4EQo7FulrZXF@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1790852442-BC8C9034-67D80536/10/78276251493
X-purgate-type: spam
X-purgate-size: 2024

On 01.10.2026 10:29, Roger Pau Monné wrote:
> On Thu, Oct 01, 2026 at 09:34:34AM +0200, Jan Beulich wrote:
>> On 30.09.2026 21:11, Roger Pau Monne wrote:
>>> @@ -692,7 +690,9 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>              if ( is_pv_domain(d) )
>>>                  fi.submap |= (1U << XENFEAT_mmu_pt_update_preserve_ad) |
>>>                               (1U << XENFEAT_highmem_assist) |
>>> -                             (1U << XENFEAT_gnttab_map_avail_bits);
>>> +                             (1U << XENFEAT_gnttab_map_avail_bits) |
>>> +                             (VM_ASSIST(d, pae_extended_cr3) ?
>>> +                              (1U << XENFEAT_pae_pgdir_above_4gb) : 0);
>>
>> Nit: Unlike binary operators, which we want to have placed at the end of
>> wrapped lines, we generally prefer the ternary operator to be wrapped
>> differently. E.g.
>>
>>                              (VM_ASSIST(d, pae_extended_cr3)
>>                               ? (1U << XENFEAT_pae_pgdir_above_4gb) : 0);
>>
>> or 
>>
>>                              (VM_ASSIST(d, pae_extended_cr3)
>>                               ? (1U << XENFEAT_pae_pgdir_above_4gb)
>>                               : 0);
>>
>> This isn't written down anywhere, so I'm not going to insist.
> 
> I had it written as your first proposal, but then moved the ternary
> operator at the end of the line as I've assumed it would be prefer to
> match the position of the binary ones.
> 
>> Furthermore, wouldn't it be plausible to also add IS_ENABLED(CONFIG_PV32)
>> (or, imo less desirably, opt_pv32)?
> 
> I could do:
> 
> if ( IS_ENABLED(CONFIG_PV32) && VM_ASSIST(d, pae_extended_cr3) )
>     fi.submap |= 1U << XENFEAT_pae_pgdir_above_4gb
> 
> As I think adding the IS_ENABLED(CONFIG_PV32) check to the previous
> expression is too much.
> 
> Let me know your preference.

I'm okay with the if() variant, but as you know I'm also not afraid of
long-ish ternary expressions.

Jan

