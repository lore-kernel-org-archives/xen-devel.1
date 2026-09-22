Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC74C982FF
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 12:43:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428777.1651715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8zpx-0006Gr-KN; Tue, 22 Sep 2026 12:43:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428777.1651715; Tue, 22 Sep 2026 12:43:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8zpx-0006Gk-HX; Tue, 22 Sep 2026 12:43:05 +0000
Received: by outflank-mailman (input) for mailman id 1428777;
 Tue, 22 Sep 2026 12:43:04 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8zpw-0006GZ-J9
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 12:43:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8zpv-00AK7E-Ch
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 14:43:03 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab277cd-e002-0a2a0a5209dd-0a2a4503a432-48
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 14:43:03 +0200
Received: from [74.125.225.103] (helo=mail-wr2-f39.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab277d7-fae8-0a2a45030019-4a7de167800b-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 14:43:03 +0200
Received: by mail-wr2-f39.google.com with SMTP id
 ffacd0b85a97d-482f633ece3so3138701f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 05:43:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-488626d29dasm5250064f8f.0.2026.09.22.05.43.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 05:43:02 -0700 (PDT)
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
        d=suse.com; s=google; t=1790080983; x=1790685783; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=snXXMJlrgbggXfT1mZvFwn5OPCOQTYOMT8eZohQBErw=;
        b=PWsbYdITMhGN6dH0+YZnf/L7i5esLZ3RLSLRuHwkvHyS9rCQgxaI9oHWHBwEZE3eDH
         YBBoyQSQx2qQ25AlTZcHM3bL97aeEqE2/Zb5OmKWv68JDWUtxL6u+XV9W+fYavw+NeZC
         F5aEV/Fwzpn0ZH/nYETXzfpG9zgmdZX/wzUu82gVv9ILd6g0Am5/ON7lv0w5A/uciZDw
         L8UZZkYGb2UCU0IzSaLJNreFPr6QA2LqBrCoAttRULQNJ/RIsIEbLouFGHuvwCnv0xy7
         4jSFuxcD9sNmFWrhLYcfIf8+WnN46W1wAx0YryHw1prh7pPVXT8YW1ss1wM9us4KyHMx
         7iNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790080983; x=1790685783;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=snXXMJlrgbggXfT1mZvFwn5OPCOQTYOMT8eZohQBErw=;
        b=DMM9QOJFUS+cOqf4oi6ckYTD9EDuOnk2xPw8qMpjJymwt5aMhhrCkNrlohaPPJWyu/
         7uSau1S0ahBD1rbMkpzJWE4H1hQAHcMn8RgI2g1W64bf+Wn0VvFZuAt5e+c/IYMu5PKP
         tHlkID12qrzQOSLLX6v4ylDP4QsGYyDG0vYxVmAVHkVxMk84vl4ePZ3il6ArYl35/3WA
         EFFYTd4GIauWjpluCC/V5zCrEFA02V9zR919JBbXsRUyUNd42SEKbmu+UgQbxxq141CU
         jUAbOhIdCDqdp4CKki3rQR4Ufr+MddRMJWj+DYTYL/zjpAZtoF2jG6dFFk5EW5xeOi6d
         UGMA==
X-Gm-Message-State: AFuF++lPg+uIe2ydhanLIU7sbHa/VOwrAqDHj0G14eJFt1xnlRnHjijW
	6QNTe5f2NCFfW9l4DPsCqO++NxtCsd+fyA7czK4WyqX0DHlQ60VyekY7EY2KGZB9xA==
X-Gm-Gg: AYBFou0R4xBGkOR+mk3fdIWmSIDADB5jJ9t66oDe1JiPSEIKizpVXkalrdW6RF3jXU6
	QO2f+nBRYFZ1r0R3fSDM81twxs2Pr3KDvY2raiAbMH+rlOBxaPiXJGRBnMw82imp7ceaPe3e/Kn
	VPz3D7M3tPJSmkzHHqj+aS1OtMsWJyQ9T6H0WLE2yOC39UJ9LYIkR0bhlPJr6BfPWaDCQCUMWQ5
	9/SAtS89/vlhzYHErzedmNqGYTMptQddyJnR7Pq+oTDQGVrZkPGelEElxQXX0E/6hMrxox33Jji
	Rqb/oNyL9+62W+g6UNQOrbHvWzt4uPsW7h7pXmxkLjlSYa7fbLeBTEifJQPvmVqdqG9p4/lZSMf
	b0dEQrK3pItlbVUvJbF/S1fDomHW1JVaq03Jmh25sb+YII6n8YC8N5hKbOOu3YySziN4/m+VbzM
	WJXZl7BmnabtCmy32eR26sJhDvr/xe05v9nqctEA9Jw3yGOVb6cYm9/AX85AKimjCUG06Wzl/XU
	+ZZh2wZCyuO94TzL3dUsKgb4/+eoB+XK1HNtsR25QmZuPVyU+1lB6IpMhPgFlM=
X-Received: by 2002:a05:6000:4685:b0:487:2385:e19c with SMTP id ffacd0b85a97d-4872385f827mr11459240f8f.0.1790080982623;
        Tue, 22 Sep 2026 05:43:02 -0700 (PDT)
Message-ID: <0ebba54b-142b-4040-b4a8-938518e7672b@suse.com>
Date: Tue, 22 Sep 2026 14:43:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] xen/riscv: fix level_map_mask truncation on
 load_start
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org, Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
 <1789032899.8631fc262581453bbf619ec5b2062170.1a08aaba3b8000c4f3@vates.tech>
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
In-Reply-To: <1789032899.8631fc262581453bbf619ec5b2062170.1a08aaba3b8000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1790080983-6F8C54E9-EE386F89/0/0
X-purgate-type: clean
X-purgate-size: 2588

On 10.09.2026 11:34, Baptiste Le Duc wrote:
> check_pgtbl_mode_support() declares level_map_mask as bare `unsigned`, i.e.
> a 32-bit type while it derives from a paddr_t which is in both RV32/RV64 a
> 64-bit type. Storing that value into a 32-bit local silently drops any set
> bits above bit 31.
> 
> The mask is then used as:
> 
>     aligned_load_start = load_start & level_map_mask;
> 
> load_start is `unsigned long` (64-bit on riscv64) and if it requires more
> than 32 bits to represent, because load_start zero-extend to 64 bits, we
> would drop some load_start's bits during the AND.
> 
> Widen level_map_mask to `unsigned long`, matching the width of the physical
> address.
> 
> Fixes: e66003e7be19 ("xen/riscv: introduce setup_initial_pages")
> Reported-by: Zheng Zhang <zhangzheng@iscas.ac.cn>
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

The change is okay as is, so
Reviewed-by: Jan Beulich <jbeulich@suse.com>
But see below.

> ---
> Question:
> I would think replacing unsigned long by paddr_t would be better in this
> case but for consistency with other variables in the function I just kept
> unsigned long.
> 
> However, there are many variables in mm.c which are unsigned long while
> they are, in reality, physical addresses and could technically be paddr_t.
> Using paddr_t would also let us bypass the compiler's decision on what
> unsigned long extends to (u32 or u64, depending on the target), and
> therefore be more generic. I've seen similar code in Arm using this
> convention, and found nothing on the mailing list explaining the original
> choice of unsigned long over paddr_t.

The mask here is applied to an incoming linear address, so imo unsigned
long is the correct type.

> --- a/xen/arch/riscv/mm.c
> +++ b/xen/arch/riscv/mm.c
> @@ -180,7 +180,7 @@ static bool __init check_pgtbl_mode_support(struct mmu_desc *mmu_desc,
>      bool is_mode_supported = false;
>      unsigned int index;
>      unsigned int page_table_level = (mmu_desc->num_levels - 1);
> -    unsigned level_map_mask = XEN_PT_LEVEL_MAP_MASK(page_table_level);
> +    unsigned long level_map_mask = XEN_PT_LEVEL_MAP_MASK(page_table_level);
>  
>      unsigned long aligned_load_start = load_start & level_map_mask;

level_map_mask is used exclusively here. Without that intermediate variable
no problem would have existed in the first place. Hence perhaps worth
considering

    unsigned long aligned_load_start =
        load_start & XEN_PT_LEVEL_MAP_MASK(page_table_level);

as an alternative?

Jan

