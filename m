Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25D8C61DBD
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 07:13:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401685.1637241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzqmK-00025S-Sx; Fri, 28 Aug 2026 07:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401685.1637241; Fri, 28 Aug 2026 07:13:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzqmK-00025L-Or; Fri, 28 Aug 2026 07:13:32 +0000
Received: by outflank-mailman (input) for mailman id 1401685;
 Fri, 28 Aug 2026 07:13:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wzqmJ-00025A-QE
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 07:13:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzqmJ-00DobK-6n
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 09:13:31 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a913511-2eae-0a2a0a5409dd-0a2a4503ec74-16
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 09:13:31 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a91351a-fae8-0a2a45030019-d155dd2cf0ee-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 09:13:30 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-482fc2b44a7so157817f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 00:13:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbb28492sm1750896f8f.31.2026.08.28.00.13.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2026 00:13:30 -0700 (PDT)
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
        d=suse.com; s=google; t=1787901210; x=1788506010; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wpHw8IMnaBLNoz9390A7GY/gC7Cs3eCSqbJYhYSa+/g=;
        b=JZVPl1rhhYfX8M/8m6T2wYoCpcMcPCsmmstaYjG8PGxfa0xSEiCTy14oe1zB69qLcv
         ox1WbS4tcClJCSz6eZNJhLwm4Q0BVDJfyfCYnxB3NyoJZ37KTvMy+EIAJLcU2eW/b6eR
         IK+Nnd5+TQUV0KrkH5mRtTLR/Xxbgi/9Ecq+QlTrxl6XpiZbd2u03uH7XO/PyE5Xumd9
         4C2zc1SzUkLEj6tIH1eBc4dSj74qG0k6VSmPvyAsTgga216QggN07siVYqvu1IhwDECu
         Pdc+HvgjCixlqEJBWNuuJppJPKgq+4+E6OKx1SA09obXFm9PqqQAAmYGvwfyp3d312Dd
         v6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787901210; x=1788506010;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wpHw8IMnaBLNoz9390A7GY/gC7Cs3eCSqbJYhYSa+/g=;
        b=kKfejoZtgB9oMmIrh1HRfkfr5evlJzXXiFJjyZZ+wJz42+YFcsyJftK4GBFFq+mNX1
         gS0GTSJvOL/nxIFpFZP++Q0ppiJ28Gfr5xks5wpU8xfO/uoofRTbuf/40QmyQs61F/8U
         j/p/K7cxCB4VHK3E662atQadg5LVoioobK/L0yuiYRwsa2yApzk7kt/en5MpXpeGoB3U
         gwdWFTk3CsAzkqeTKwThVhu8VEZ7+RVA+4EeIxAM4ym/XW+0Zr5qwX893tCcDD9obY8c
         zT4LIWFuAGWSn40osDbzLxWS/IQK8s/MDUccVgNzwVYbB1CbFulgf2fiuY6ZlfCL6sKl
         TP5A==
X-Forwarded-Encrypted: i=1; AHgh+Rr5tTZiQNpzC/3RDaZeR1qFyqdQxvab2TmtSpu55sNtYT+FnEZkpDJaYPDfnhtVvADYfAqg28k8YZ8=@lists.xenproject.org
X-Gm-Message-State: AFuF++mKBpwYIeZp3Jb+ILXUO7Yt25n+PO4cciqf074WBvUIMtbMjaYA
	C9c7+fgXwIPR4gf2pSrbyA7YJ4YpGzxEM2MyWXkfiNEwaQwbMR9f8FgF4m6GwcZl2A==
X-Gm-Gg: AR+sD11HG/LHea9hQq2hK/42IR1byabj8ZmmYQ22yviy+MN5LpAPL0XqVjYbxM7tirp
	4X0avCVHWsgf6Lbo4fZ4NaIZNm7d8+Ehr9Ki1jIXx4ajETT6jSYNw3m/55GgeTohF9M1ms5y3xc
	7klqDbbj+LTMBEWbuifp3k/1yQDl0Y4HZWjlOdmKNEDo8sIiqD3siGHVNYW6idt2CYy9jy9D2QD
	GGtOR2Ffu47G7aCaHu4X5kSQkzbk2ju4Zc9UbXbHbR+80wYL7U+YO8I4c+YBG3E7JHD+nFqOlm6
	kApiBTHvIxLnfaDv2mtDdZqA8gvl0gBPx+Q9y3+ZC29Zhi/TvnAHD9q/unHuHFsR8Q1UBo9Kh9g
	W2Yy7kyhGBaBb12QFDFT1YaZ7/Un1Z/fxrdpjcRY9KlUmHozbDRCj2UGqZ0kuNjy98NRQEK1u8S
	rTwm00CNNUMCazYMmaZzJelgguSRkN91+CQAT7d5nZVBpXlyRiiecetXdm4/FHS43TAKGimVQk/
	WlGUeWiZ/HyDsn5/xmLNTHL+FUJWBY7vIHKsySCIFym5uTFoqBe
X-Received: by 2002:a05:6000:656:b0:482:f0dc:e571 with SMTP id ffacd0b85a97d-482f79b1ec7mr6491972f8f.14.1787901210498;
        Fri, 28 Aug 2026 00:13:30 -0700 (PDT)
Message-ID: <86ea652a-69ab-4920-bed7-3e28ce64fb1d@suse.com>
Date: Fri, 28 Aug 2026 09:13:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] xen/riscv: add SFENCE.VMA after enabling paging
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: zhangzheng@iscas.ac.cn, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <1787844438.8631fc262581453bbf619ec5b2062170.1a043d52a06000c4f3@vates.tech>
 <1787844810.8631fc262581453bbf619ec5b2062170.1a043dad5be000c4f3@vates.tech>
 <9e4778fa-3164-49bc-a921-ce6b251b5db5@gmail.com>
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
In-Reply-To: <9e4778fa-3164-49bc-a921-ce6b251b5db5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1787901210-6C6DE4E9-67E5088B/0/0
X-purgate-type: clean
X-purgate-size: 1287

On 27.08.2026 18:53, Oleksii Kurochko wrote:
> On 8/27/26 5:33 PM, Baptiste Le Duc wrote:
>> --- a/xen/arch/riscv/riscv64/head.S
>> +++ b/xen/arch/riscv/riscv64/head.S
>> @@ -98,6 +98,7 @@ FUNC(turn_on_mmu)
>>           srli    t1, t1, PAGE_SHIFT
>>           or      t1, t1, t0
>>           csrw    CSR_SATP, t1
> 
> ... ASID isn't used as we are in Bare mode.
> 
> What am I missing?
> 
>> +        sfence.vma
> 
> The one thing which possibly matters here, and could explain why 
> sfence.vma is needed, is:
> ```
> Implementations with virtual memory are permitted to perform address 
> translations speculatively and earlier than required by an explicit 
> memory access, and are permitted to cache them in address translation 
> cache structures—including possibly caching the identity mappings from 
> effective address to physical address used in Bare translation modes and 
> M-mode.
> ```
> 
> So the TLB could potentially be populated with identity mappings, and I 
> agree that it would be better to flush those.

First: Does (or at least may) the TLB come into play in Bare mode? If not,
there's nothing to invalidate. If so, the next question would be whether
it's indeed ASID 0 which is (or again may be) used in such TLB entries.

Jan

