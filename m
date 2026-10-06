Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21ACCA5FED
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 15:21:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441593.1659188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE6yX-0000wZ-4g; Tue, 06 Oct 2026 15:21:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441593.1659188; Tue, 06 Oct 2026 15:21:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE6yX-0000wS-28; Tue, 06 Oct 2026 15:21:05 +0000
Received: by outflank-mailman (input) for mailman id 1441593;
 Tue, 06 Oct 2026 15:21:03 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xE6yV-0000wK-B6
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 15:21:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xE6yU-00EuNO-OL
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 17:21:02 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac511d4-8faa-0a2a0a5109dd-0a2a450bd782-30
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 17:21:02 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac511de-b7e8-0a2a450b0019-d1558036cd4f-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 17:21:02 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a022fee0caso9336695e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 08:21:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a178ca8bc2sm75680745e9.1.2026.10.06.08.20.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2026 08:21:00 -0700 (PDT)
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
        d=suse.com; s=google; t=1791300062; x=1791904862; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N76OStvHGCqlSA+A8skpaAHQgjICkj5sb3qUI+Aspkg=;
        b=S5dnFgkJvMWmGPY8mlAX+aXZU04CnqOejKD1MNkICJvNqvnmRoJEdp11n2zRQIwRj5
         gdBOea4oLr2lB8NoTr4Rr5yUA7m6heouInsb6g2gGReTsRlvsN+mO3nbXYFaBDBti3gN
         /eNsKiXILnfHI4HMbZ3Rw3QYD4E0pM/o0tRKlVG3sXt5Ypf5MNx6CoYgNq/79NaOwyB6
         Oe8bUcovhsSYkJM/3rq5lbDroLnjGmmxBjJm5wdBD3yRgxNvkTh9JJlYIimGKt0YtZp6
         YIZbS9z7j9WvHTf5/yA04vdYV1HTXHp6nSdf/d5WUkeZRVWbqpJz2cdzGswZ286j2xvw
         qdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791300062; x=1791904862;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N76OStvHGCqlSA+A8skpaAHQgjICkj5sb3qUI+Aspkg=;
        b=CuWu0z7Z+O65mCjRwoYYsg48xtQ7H+nVr59YnleQgKAEpLbXpVqNekQ/xj14j4FnSO
         Ox0PlHev3PFJlYAj2DfOBQSaxbcE+P20AsduBq3E5qYpzT7DxTjI6ByCcp2VzvRscSIS
         nMacz1ttb1sDRQL6JyEYzZnXmbMJXybBT4S9s2nQqu+ff7S4aJFiA9Zo/YzClh5PLksd
         09tax7aMYb6DMhVgKTxpzosnxef+LJUAUnTSoxxYYaVc7vegcWNBpKUFO9CyKXtzDvvw
         zWjcMWVwh60ibk6VzObEyDbDTcaUfgZAfyFEXUt6pJIFRE2hZN9uuqo1R/zNP720RGQ5
         fP0A==
X-Forwarded-Encrypted: i=1; AKwUvByzHdeSITpkvypgv4oNnll6V0OQjuMR+Hl+DNsHNfiP+diZGTn3srw5p4mXx2xMwxihaShvn0JvGU8=@lists.xenproject.org
X-Gm-Message-State: AFuF++koYQysq7U4NkIKCbMUyWmGu8nO1GanM/ASepu5DKWjuSjeun5u
	PogOwNvE67TgbkuXwgcocrILQP/vRJul/p0X/gpFOAx44O9iIbjrX+z7ALm46US1lg==
X-Gm-Gg: AYBFou08b85GUi/1Eps7IWD/+MIb04mnrT8+RVEmSt56itv6fBG7SvGIRuzFklC1J8F
	Xl+GaRzk+aeWC8T3NvP5W3duM14i8PSMS9aaRsv43L0IMJlC0OOcI9cK/Eq+nLHBQyn7J7W7hho
	utQg+h624UD6az9Uj+4yjhWd8S43oeOUzjgFFbJQfZw6tUfMgp3ZnjhhQbO2KBSJ8WRRNnflgm8
	8KTWuKp7Q/246FJWQcpCshR5/F8QGmj1ZhSs+8W7bF/1GTQYJ4V7sO18CocevdSTRDZTgtn5OWn
	VLb+eqdfsCVNY5Eh0V5F5gZimHJqVte6Naj3Wh379/Qd06O1v4dgQMeV1xju6WIjU9xztpIInpa
	bO1W6btSMe2UCR/ZUnJvHmGZ2E03BOzCH+aUwHx0ReyqtEBZFykU0kIdjYiQ32cR3jN0zAI5P5N
	qXOyxWtLMEbgMRylF6TOSeI5v5ckmYDNi8n8wrhqUJHaEgrzVFVqYqiAn3Ylc4n3lqNQhPgNT4V
	p7UsG9pcZ7RUw+8genP2oHmIrmiEP3YNTbpBdN6j3pmEvMUmJZP7eXNuLJ2Mw==
X-Received: by 2002:a05:600c:8b58:b0:4a1:7259:349e with SMTP id 5b1f17b1804b1-4a17b562032mr26677295e9.27.1791300061963;
        Tue, 06 Oct 2026 08:21:01 -0700 (PDT)
Message-ID: <793b6d0d-68ca-4f9d-8ca5-c37f2c013478@suse.com>
Date: Tue, 6 Oct 2026 17:20:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] xen/riscv: always preset A/D bits in G-stage PTEs
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>, xen-devel@lists.xenproject.org
References: <1791215925.8631fc262581453bbf619ec5b2062170.1a10cc9f7c20003f66@vates.tech>
 <1791216017.8631fc262581453bbf619ec5b2062170.1a10ccb5ec20003f66@vates.tech>
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
In-Reply-To: <1791216017.8631fc262581453bbf619ec5b2062170.1a10ccb5ec20003f66@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1791300062-1ACDF9EA-31F3EDD8/10/78276251493
X-purgate-type: spam
X-purgate-size: 4516

On 05.10.2026 18:00, Baptiste Le Duc wrote:
> A RISC-V implementation can manage the PTE A/D bits in one of two ways:
>     1) Update the 'A' and 'D' PTE bits in hardware (ratified as Svadu).
>     2) Generate a page fault when 'A' and/or 'D' is clear, so that software
>        can set them (ratified as Svade).
> 
> p2m_set_pte_flags() presets A/D in G-stage PTEs only when the device tree
> advertises Svade. Platforms that use scheme (2) without advertising Svade,
> such as the HiFive Premier P550, then hit guest-page faults that Xen does
> not handle.

Is that a quirk then (to avoid the word "bug")? Since it's all DT that
conveys available ISA information, why can't the DT for those systems
simply be fixed? Depending on the answer here I might question the
presence of the Fixes: tag below.

> Always preset A/D in G-stage PTEs so scheme (2) never faults. This is
> harmless with (1): software just does what hardware would have done on
> first access.
> 
> Drop the TODO suggesting to handle A/D faults: only Svade raises them, so

This contradicts the earlier paragraph, where you say that page faults can
also occur without Svade.

> it would not work on Svadu. Dirty/access tracking can restrict the RWX
> permissions of p2m entries, as x86 and Arm do.

I'm also not convinced that this is what the TODO was after. Oleksii would
be able to clarify, I suppose.

> Fixes: ff14053983b0 ("xen/riscv: Implement p2m_pte_from_mfn() and support PBMT configuration")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> 
> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -591,38 +591,16 @@ static void p2m_set_pte_flags(pte_t *e, p2m_type_t t)
>      e->pte |= PTE_USER;
>  
>      /*
> -     * Two schemes to manage the A and D bits are defined:
> -     *   • The Svade extension: when a virtual page is accessed and the A bit
> -     *     is clear, or is written and the D bit is clear, a page-fault
> -     *     exception is raised.
> -     *   • When the Svade extension is not implemented, the following scheme
> -     *     applies.
> -     *     When a virtual page is accessed and the A bit is clear, the PTE is
> -     *     updated to set the A bit. When the virtual page is written and the
> -     *     D bit is clear, the PTE is updated to set the D bit. When G-stage
> -     *     address translation is in use and is not Bare, the G-stage virtual
> -     *     pages may be accessed or written by implicit accesses to VS-level
> -     *     memory management data structures, such as page tables.
> -     * Thereby to avoid a page-fault in case of Svade is available, it is
> -     * necessary to set A and D bits.
> +     * A RISC-V implementation can either:
> +     * 1) Update the 'A' and 'D' PTE bits in hardware.
> +     * 2) Generate a page fault when 'A' and/or 'D' is clear, so that
> +     *    software can set them.
>       *
> -     * TODO: For now, it’s fine to simply set the A/D bits, since OpenSBI
> -     *       delegates page faults to a lower privilege mode and so OpenSBI
> -     *       isn't expect to handle page-faults occured in lower modes.
> -     *       By setting the A/D bits here, page faults that would otherwise
> -     *       be generated due to unset A/D bits will not occur in Xen.
> -     *
> -     *       Currently, Xen on RISC-V does not make use of the information
> -     *       that could be obtained from handling such page faults, which
> -     *       could otherwise be useful for several use cases such as demand
> -     *       paging, cache-flushing optimizations, memory access tracking,etc.
> -     *
> -     *       To support the more general case and the optimizations mentioned
> -     *       above, it would be better to stop setting the A/D bits here and
> -     *       instead handle page faults that occur due to unset A/D bits.
> +     * Xen supports both, so set 'A' and 'D' up front to avoid the faults
> +     * of (2). This is harmless with (1): software just does what hardware
> +     * would have done on first access.

"Xen supports both" to me means it suitably handles the page faults resulting
with Svade. May I suggest "To support both, set ..."?

>       */
> -    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
> -        e->pte |= PTE_ACCESSED | PTE_DIRTY;
> +    e->pte |= PTE_ACCESSED | PTE_DIRTY;
>  
>      switch ( t )
>      {
> 


