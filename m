Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE21CCA5FAC
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 12:07:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437144.1655920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBt64-0001tG-L7; Wed, 30 Sep 2026 12:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437144.1655920; Wed, 30 Sep 2026 12:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBt64-0001t9-I2; Wed, 30 Sep 2026 12:07:40 +0000
Received: by outflank-mailman (input) for mailman id 1437144;
 Wed, 30 Sep 2026 12:07:38 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBt62-0001t3-Ll
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 12:07:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBt61-00Fwsu-4D
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 14:07:37 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcfb77-bab6-0a2a0a5309dd-0a2a4506c51e-36
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 14:07:36 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcfb88-195a-0a2a45060019-4a7de18dfaf0-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 14:07:36 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49fe8bf173aso27910795e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 05:07:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cb8af89sm6897145e9.1.2026.09.30.05.07.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 05:07:35 -0700 (PDT)
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
        d=suse.com; s=google; t=1790770056; x=1791374856; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sLki2cInvLivE+QZ6SEnzvqp6w6cIkhwJmGOL+r46Q4=;
        b=SoILOsOiVF+BmgMNE4jeduS9LwZzxZgXSdFa08mtQlzoQGxY+fqVm33GT2hH4N29LG
         skP96eSW3jg4Tdw6TKSgQpZPZw+TPVn/mcXawJ4fW1LPFq8DLeXH5PRUtQeb6xJ5jiw8
         IkRhecmMo/2gbt+aPRU0rrAheURAGEf/R6KUWPhaRFAkfXtvyQvl0Rt8rFQrwoy/eQIy
         KgQDZl4EK0gWzxZRzBw0sc0pvOYIifQTj9Nttj66qdjloJX4I+45eNOHeazSei2veq4L
         ZriNWXkZIOsddf3dsJS2bmaX0kcHR3scc72M9namjX74xRjG8FiKa1kpKMQCVfBLCgh0
         JWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790770056; x=1791374856;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sLki2cInvLivE+QZ6SEnzvqp6w6cIkhwJmGOL+r46Q4=;
        b=R9ERUxgiJinqN9nWfNHi1UGoGHNvmtfCsaZ235Mcjk2ml96siooycxlgXvqZwZ6+6G
         KAV5gWPYqxHb/wYCpInOHRbQ9ng0VlJy6nQgs1/ftCOhO9MsgT7O8DcC7GTgWCC0bhAn
         6XLo7XENj2FR4m/9Zri195Y9xJGdgXnfPOxa3DQY2yf+Os6KpC7SRJtx3ybTGGRYdX4S
         QDVdj6eLPUtu92mCFKD5xS2ZhbiljCBW17naCVsuvkMMj/KUrEnpaaybfJ+QLc8HdnxU
         q0Yh1QyUsXJ+RV/FmMVJreHkmFcjDiEyr5olmx7Sh35uA5ZNKsYbaQe8c9rrVJEvyNaD
         h07Q==
X-Forwarded-Encrypted: i=1; AKwUvBzlVRaoD1jnP2XHLIhPAJlgGLoiK3nU4gH3rjhKjERjpY72ZMQ3fcX5wg6AiSM8uuzttBoQvug69UQ=@lists.xenproject.org
X-Gm-Message-State: AFuF++nkoXGbybyUn6e8vvz5SS+1ihE0v6fYkzLXCgxr/y9FfJ28oaJv
	O64LsyJhcwon/381qYotXjueivZmMnnPc2VgOiluQOHizaX6x1Ir5OtroQTvK5onYg==
X-Gm-Gg: AYBFou3f+NqkCKyYID0Fv78OBlM6s0v+4JtYjzcNd65Uwj9HUEL/s/+hULkaErDYlFw
	xCzwchvtg93kHc8pd3nCJ4Ea/a1kIZzyukXzOghVeW1wJWGYmoIOrSojs3T6w9SR7C0XSoFjtOx
	CxJ7HHugM077R56GtzNbk4NaBMGb3GvajvZcg4OhM5hXTAuN0YsFbsAcZSq0uuURhIgf5CKR4OY
	t7bHeW7nzDp/f4Y0vvZ/b+MbiMY3m4D8SwNxJmqrECkbTCB3ZsnR6imjMgGXgS3HQ4Cdrcl9IZ/
	29KoCoRjN4IeZxC3PNVcJEc+jA675FPtOrlG9NXw6DDocDR3l3OcHT9r0AWx6jPdU7ImcVesZv/
	fWMcQHJhX0F7Ez+lRLhN0KcBoCVF3IXtb1szRXQOun/YwTsqv/ipqOHZ5w33pREvalwaJtFCszv
	XDDJ0OkY2r8wKEekDdMRHAFWxQvWPLqyog2QBSRwnd2SUk8lIQzIHHaVAnff4CHeRODAFlA8Vfo
	znsCBizaGOHeNV9tyO5KQyrITUQCM7+ON6uZPnTL+nesQFEQ/zaLSIQwLAynFM=
X-Received: by 2002:a05:600d:82ea:b0:4a0:4cd:7e1d with SMTP id 5b1f17b1804b1-4a01aff2404mr22893845e9.8.1790770056306;
        Wed, 30 Sep 2026 05:07:36 -0700 (PDT)
Message-ID: <20e04d15-8621-4680-a2dc-8e54ee88d050@suse.com>
Date: Wed, 30 Sep 2026 14:07:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] xen/riscv: rename PTE "permissions" to "pte_flags"
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <1790699381.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@vates.tech>
 <1790699585.8631fc262581453bbf619ec5b2062170.1a0ee033eb9000b504@vates.tech>
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
In-Reply-To: <1790699585.8631fc262581453bbf619ec5b2062170.1a0ee033eb9000b504@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1790770056-F460277B-15C6B007/10/78276251493
X-purgate-type: spam
X-purgate-size: 4564

On 29.09.2026 18:32, Baptiste Le Duc wrote:
> paddr_to_pte()'s "permissions" parameter, the matching local in
> 
> setup_initial_mapping() and p2m_set_permission() don't only deal with
> 
> permission bits: they also handle PTE_VALID, PTE_USER, PTE_ACCESSED and
> 
> PTE_DIRTY.
> 
> 
> 
> Rename them to "pte_flags" and p2m_set_pte_flags() respectively.
> 
> 
> 
> No functional change.
> 
> 
> 
> Requested-by: Jan Beulich <jbeulich@suse.com>
> 
> Assisted-by: Claude:claude-opus-5
> 
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

In principle
Acked-by: Jan Beulich <jbeulich@suse.com>

I won't, however, be able to apply this patch as-is. As you can see both above
and below, extra newlines were inserted everywhere on the way here. The list
archive doesn't show this issue, but instead shows undue wrapped lines. It is
also only this one patch in the series which has this issue. You will need to
resend for me to properly consume.

Jan

> ---
> 
> Changes since v2:
> 
> - new patch
> 
> ---
> 
>  xen/arch/riscv/include/asm/mm.h | 5 +++--
> 
>  xen/arch/riscv/mm.c             | 8 ++++----
> 
>  xen/arch/riscv/p2m.c            | 4 ++--
> 
>  3 files changed, 9 insertions(+), 8 deletions(-)
> 
> 
> 
> diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
> 
> index 9e28c24954..1ac66283ec 100644
> 
> --- a/xen/arch/riscv/include/asm/mm.h
> 
> +++ b/xen/arch/riscv/include/asm/mm.h
> 
> @@ -22,9 +22,10 @@ extern vaddr_t directmap_virt_start;
> 
>  #define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
> 
>  
> 
>  static inline pte_t paddr_to_pte(paddr_t paddr,
> 
> -                                 unsigned int permissions)
> 
> +                                 unsigned int pte_flags)
> 
>  {
> 
> -    return (pte_t) { .pte = (paddr_to_pfn(paddr) << PTE_PPN_SHIFT) | permissions };
> 
> +    return (pte_t) { .pte = (paddr_to_pfn(paddr) << PTE_PPN_SHIFT) |
> 
> +                            pte_flags };
> 
>  }
> 
>  
> 
>  static inline paddr_t pte_to_paddr(pte_t pte)
> 
> diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
> 
> index 610d111945..0e26c5751f 100644
> 
> --- a/xen/arch/riscv/mm.c
> 
> +++ b/xen/arch/riscv/mm.c
> 
> @@ -140,7 +140,7 @@ static void __init setup_initial_mapping(struct mmu_desc *mmu_desc,
> 
>          case 1: /* Level 0 */
> 
>              {
> 
>                  unsigned long paddr = (page_addr - map_start) + pa_start;
> 
> -                unsigned int permissions = PTE_LEAF_DEFAULT;
> 
> +                unsigned int pte_flags = PTE_LEAF_DEFAULT;
> 
>                  unsigned long addr = is_identity_mapping
> 
>                                       ? page_addr : virt_to_maddr(page_addr);
> 
>                  pte_t pte_to_be_written;
> 
> @@ -149,13 +149,13 @@ static void __init setup_initial_mapping(struct mmu_desc *mmu_desc,
> 
>  
> 
>                  if ( is_kernel_text(addr) ||
> 
>                       is_kernel_inittext(addr) )
> 
> -                        permissions =
> 
> +                        pte_flags =
> 
>                              PTE_EXECUTABLE | PTE_READABLE | PTE_VALID;
> 
>  
> 
>                  if ( is_kernel_rodata(addr) )
> 
> -                    permissions = PTE_READABLE | PTE_VALID;
> 
> +                    pte_flags = PTE_READABLE | PTE_VALID;
> 
>  
> 
> -                pte_to_be_written = paddr_to_pte(paddr, permissions);
> 
> +                pte_to_be_written = paddr_to_pte(paddr, pte_flags);
> 
>  
> 
>                  if ( !pte_is_valid(pgtbl[index]) )
> 
>                      pgtbl[index] = pte_to_be_written;
> 
> diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
> 
> index 1cea86512c..f7b380b90a 100644
> 
> --- a/xen/arch/riscv/p2m.c
> 
> +++ b/xen/arch/riscv/p2m.c
> 
> @@ -584,7 +584,7 @@ static inline void p2m_clean_pte(pte_t *p, bool clean_cache)
> 
>      p2m_write_pte(p, pte, clean_cache);
> 
>  }
> 
>  
> 
> -static void p2m_set_permission(pte_t *e, p2m_type_t t)
> 
> +static void p2m_set_pte_flags(pte_t *e, p2m_type_t t)
> 
>  {
> 
>      e->pte &= ~PTE_ACCESS_MASK;
> 
>  
> 
> @@ -676,7 +676,7 @@ static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t,
> 
>              break;
> 
>          }
> 
>  
> 
> -        p2m_set_permission(&e, t);
> 
> +        p2m_set_pte_flags(&e, t);
> 
>          p2m_set_type(&e, t, ctx);
> 
>      }
> 
>      else
> 
> 
> 


