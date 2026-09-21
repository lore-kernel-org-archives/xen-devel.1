Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFED7C982E1
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 11:36:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427359.1650064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8cJS-0006b4-Rq; Mon, 21 Sep 2026 11:35:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427359.1650064; Mon, 21 Sep 2026 11:35:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8cJS-0006ax-OU; Mon, 21 Sep 2026 11:35:58 +0000
Received: by outflank-mailman (input) for mailman id 1427359;
 Mon, 21 Sep 2026 11:35:57 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x8cJR-0006ar-6c
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 11:35:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8cJQ-006lN6-JO
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 13:35:56 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab1169b-bab6-0a2a0a5309dd-0a2a4507c036-6
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 13:35:56 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab1169c-b4ea-0a2a45070019-4a7de18c9259-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 13:35:56 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49d1ca5b0d6so21115205e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 04:35:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fcd10d21asm275792325e9.12.2026.09.21.04.35.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 04:35:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1789990556; x=1790595356; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ThUHx8jzT/Saq/lfPNNpnxBYhWVh0VLHw76lSWYKo/g=;
        b=KGRVN4iHCmC7tpUiXXeU1GIGsk6UMU6fmT16LvsHAeJ9PMfB51beviHfdjBxeJ8OTL
         cCqEUlbAjj63QdA5JjzlMGK1y//bFm+KbwbXe1YHBTP8zD8TQcx/OYdplXNcAIwJWmst
         q1saAXiaDi4Kp1ED/Hg7jJFe8WvbPAoDcwBVgRIkYqvJqdobdsuosb1auUYMQDYtNT2M
         9hr1vLgegeDuldtx6XFT8quMoTTjuo3QvVOdKzbyXMaZMBtmUIAWcmPbpbzm93mW9wM4
         EMapzGWtJ6MAH8Ksudxo/PxG3s8UwDxb7fPkeZIcR4VPNfoqHBnMejZZyRdDW/9n2Zsl
         pBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789990556; x=1790595356;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ThUHx8jzT/Saq/lfPNNpnxBYhWVh0VLHw76lSWYKo/g=;
        b=qgnlgOCbNZJl5o6EnkxVNb453cfd9F39PaTzb7xQc8n0oHTG38SCxAMrY0v7E6Vi4Q
         k6gXFnxJzJQlRUrrcOBQZFV0J2CzWxpQQQvjYOuSkKZ84QBI7ZKWCOIgWkia7DTlBBV1
         eAoVnq3DZvAqWU+wBOcPEomwRFAIFlK0g3v2kdo2q6TEgu6cmh32m0UDcJJ0t7dO4jfJ
         36URoOaP1u01bPsSmeOzuEcXPBeAqPEZiaIHhl7TWcO+NMPZGfwZOu4SSrdohK7fGcTM
         OqWaqU3VhpadrS4Zd2QBolY5YHJqpb+PSq2/s/gNXsVNmwqzazxuysxn+fFUEKdSVxGA
         3C4g==
X-Forwarded-Encrypted: i=1; AKwUvBzN7EsDIjZdfww8CJnFtC+fS73O0tZo+mBNoAY4hvV1dnqRjsXTs+WzUBJeRnPTdk+Xxhc/iWs4EC0=@lists.xenproject.org
X-Gm-Message-State: AFuF++kszqqDpM9sYSnRZUa7PFYVc8spAUIhpWSRAILqGle4ITmdR4Px
	GfafAYl3OcVzOxmqEdOo1ZYe1hEHSlq/M8Xqa0FV9RgnxvChLiCIEilKV6yGv7aRWw==
X-Gm-Gg: AYBFou0OKSv33+BtiVmyl9VwtKKcD7MmgIikHHwUxwRVfZhgPOgMV0zNMHGcwhdWDpL
	wwdxpXpvIJqsmoS7uWfErrd/TDgMwkG0RX6hYJ0Q56wJnTw4SyDzZELe2mYDc6KjVUm2tzaDqFS
	cFc7mT8xl/CWrnZ5BG1EAIeYm/LEeE5Qa4JURJKkDY2w2AwMn6dGQH/Nv+Mv64QYRi2J4kXVsyE
	JUucRlcQr4yiRzmRDoh8j6bSiU1YgQ3lSbYWGABtN5Iif/yOktC91wXI0/fgS/8ZeqTmFxGXwJT
	KEuTC/QPiFYjBhY2Gb8+JxeOq0XMU4mcWgeRy50IC0UTk9UVCBmJcW+xK9Er/neDV4Y0pvQlYeD
	JRZkRwu/UOuN8Fcv9MOEh4NE4pAQ9FcnGO4Sq3sMzvqjg+xcOI4Fz71e1HxHhzyR4j1JyaWBDQr
	5C8u+ixYUhVOq/hoYkhGALc+V1HdVDrv8RSGYbYPgS9rv0u4Ahd5RqioVskYtFZnBcgicsMtm9q
	zofCVogecg4HLhAKFM3oajHzh1QPBzM1k38MsiHVgMbXdCGbX4aRrEFs+6dunteREg235uJ
X-Received: by 2002:a05:600c:3556:b0:49c:ffab:551f with SMTP id 5b1f17b1804b1-49fc5737c38mr152592965e9.22.1789990555779;
        Mon, 21 Sep 2026 04:35:55 -0700 (PDT)
Message-ID: <b0421306-a1a9-4155-9dfc-4b8147db0d9b@suse.com>
Date: Mon, 21 Sep 2026 13:36:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 37/39] xen/riscv: map IMSIC interrupt file for vCPUs
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <ae5965ba43eb691b078f4a6bcf8a87a1f7a5aac5.1787838835.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <ae5965ba43eb691b078f4a6bcf8a87a1f7a5aac5.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1789990556-344CBAE4-2D68E887/10/73395122804
X-purgate-type: spam
X-purgate-size: 3669

On 27.08.2026 17:21, Oleksii Kurochko wrote:
> A guest running in VS-mode expects its own IMSIC S-file at offset 0 of its
> guest-physical IMSIC block. Physically, the guest-file (G-file) assigned to
> this vCPU lives at a hart-relative offset given by guest_file_id (assigned
> via the vGEIN allocator). Therefore, imsic_map_guest_file() uses stage-2
> translation to redirect the guest's fixed per-vCPU GPA page (offset 0) to
> the specific physical guest-file page.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
perhaps with ...

> @@ -537,9 +538,72 @@ void cf_check imsic_ctxt_switch_to(struct vcpu *v)
>      read_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
>  }
>  
> +/*
> + * Map the physical IMSIC guest interrupt file (G-file) assigned to vCPU
> + * into the domain's stage-2 guest-physical address space.
> + *
> + * In the machine's physical address space (SPA), each hart's IMSIC
> + * supervisor-level file (S-file) is located at offset 0 of its address block,
> + * followed contiguously by GEILEN guest files at offsets of 1, 2, ..., N pages.
> + *
> + * Because a guest OS running in VS-mode expects its own supervisor-level
> + * interrupt file to be at offset 0 of its guest-physical IMSIC block, the
> + * hypervisor must use stage-2 address translation to map the vCPU's
> + * guest-physical "supervisor" page (GPA offset 0) to the specific
> + * physical guest file page (SPA offset guest_file_id) on the physical hart.
> + *
> + * A vCPU runs on the pCPU the scheduler picked for it (v->processor), and
> + * the guest file it is given (guest_file_id, from the vGEIN allocator)
> + * belongs to that very pCPU's IMSIC. A guest_file_id of 0 indicates that no
> + * hardware guest file is selected (matching the architectural behavior where
> + * vGEIN = 0 in the hstatus CSR selects no guest external interrupt source),
> + * requiring the VS-file to be emulated in software.
> + *
> + * Consequently the mapping installed here is only valid as long as the vCPU
> + * stays on that pCPU. When it migrates, a VS-file is acquired on the new
> + * pCPU and mapped at the very same GFN, so the stale mapping needs no
> + * explicit tear-down: it is simply replaced.
> + *
> + * The base guest-physical address advertised to the guest in the device
> + * tree matches offset 0 of the vCPU's virtual IMSIC block. Stage-2
> + * translation ensures that guest supervisor accesses to this page are
> + * transparently routed to the real hardware VS-file granted to it on
> + * the pCPU it currently runs on.
> + */
>  int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id)
>  {
> -    return -EOPNOTSUPP;
> +    struct domain *d = v->domain;
> +    unsigned int cpu = v->processor;
> +    paddr_t gaddr = GUEST_IMSIC_S_BASE + (IMSIC_MMIO_PAGE_SZ * v->vcpu_id);
> +    paddr_t paddr, guest_offset;
> +    int res;
> +
> +    /* Nothing to map in the case of sw interrupt file. */
> +    if ( !vsfile_id )
> +        return 0;
> +
> +    guest_offset = vsfile_id * IMSIC_MMIO_PAGE_SZ;
> +
> +    paddr = imsic_cfg.msi[cpu].base_addr + imsic_cfg.msi[cpu].offset +
> +            guest_offset;
> +
> +#ifdef IMSIC_DEBUG
> +    printk(XENLOG_DEBUG
> +           "%s: %pv: ga(%#"PRIpaddr") -> pa(%#"PRIpaddr"), cpu(%u), "
> +           "guest_file_id(%u) base_addr(%#"PRIpaddr") offset(%#lx)\n",
> +           __func__, v, gaddr, paddr, cpu, vsfile_id,
> +           imsic_cfg.msi[cpu].base_addr, imsic_cfg.msi[cpu].offset);

... this also converted to dprintk(), or at least using XENLOG_G_DEBUG.

Jan

