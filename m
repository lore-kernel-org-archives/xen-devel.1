Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9DA606A32C
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 16:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sqmwD0EB
Received: from list by lists.xenproject.org with outflank-mailman.1491251.1692112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSzco-00034B-PH; Mon, 16 Nov 2026 16:32:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491251.1692112; Mon, 16 Nov 2026 16:32:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSzco-000344-M6; Mon, 16 Nov 2026 16:32:10 +0000
Received: by outflank-mailman (input) for mailman id 1491251;
 Mon, 16 Nov 2026 16:32:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xSzcn-00033y-C8
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 16:32:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSzcm-001NuP-OK
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 17:32:08 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6afb2fe7-8faa-0a2a0a5109dd-0a2a4505d0d8-18
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 17:32:08 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6afb3008-4cb1-0a2a45050019-d1558035b949-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 17:32:08 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4bb6886d30aso13626875e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 08:32:08 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb78346f4asm1012055e9.0.2026.11.16.08.32.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 08:32:07 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846728; x=1795451528; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gqbJnXv89pWVXXFFNu9mVg4o7E1WNlz4hRexE5DO2IM=;
        b=sqmwD0EBtiD6pgyZoODxqzkb8n6eDd3MXZ9QaxsKhUKEatkDTU2lNBZDe73C0hv8sY
         Olgq2djsvzUOd7K68MuDMjL6F78KPzYQ5zPN6fN2GWoHA6TNhMJ6XwHI/sU5wb/kyji9
         tH8EwkjTJZEYgahqcHBUUaAqWRYyeppGc7ddIB7X3OtD2CZQZQUSYs5mWU480ZZ2qWf8
         q6wrpe0gSWtbN5gODYqUflohR3Ex7CtTgLgaEE8FAuk6iqYXlhATTiNVB9xX/PsAHzKI
         6sbuMAzvjAxrco2h8LXw0cZN5AfzJnMDzxKaOaHIs90LyWmOi2bQ9RYBJ0sm1yMkPVns
         ZEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846728; x=1795451528;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gqbJnXv89pWVXXFFNu9mVg4o7E1WNlz4hRexE5DO2IM=;
        b=jlMfG+xJkRz3QBUQaZGSMRE2w0RzYUVyADT22F2juOFBctYK6cOWqQYI2xqwjkcr62
         RFJGGOcOWqoccjhiwkn2WEaPjkx4er8O/LmQiZDupJXB3fPcuGT1UQlb/ZV/aO70Vmdp
         uCSyZtFU4qnQ0UDYNNI7etwrb9DXTn4pv/8x7B1eGyXC8dWpeLd+CBYO9ZIzBjZ/hAvr
         32+MczSUykhmOcePdhdSodviy9EWWMbBFQYONP6B71XMnHPLuN4aIM5gvWx6FtMdUN+O
         t5Lxysy+VexArjaF0E5S7YoaLcZzCAyOHLFVPxyKoAz/Z32w2nXYXhW+aLpTK3x5FSBj
         fztQ==
X-Forwarded-Encrypted: i=1; AL+hErEHDA3XbunJbcXX432i2PdP6ZuPDkA14qOfMg9w2RRKP066hGWfssvDdtiEDq02UT9n1O7/Dcviao0=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8khUtzJT+q99pWsgfhRWwsgCNqvxg4yZAWPMcUplYWClQ6aqTW
	5YRJ1HdSHyJxnhUiyAvTbb0IXyuFjCrmMW9OyEbvr5KqRnglR+Yg9yLQ
X-Gm-Gg: AYBFou1XRydwkUIN08iL5VlvZoVkigUXSLSpWtGvKMDB7JWQN2VG2yjk7OAcmqTj1gf
	8TYeKSRb+xGCUsxxAUp4mOrxoqum4SZmhGGsgRnJrQmBUT+xYvWicO2RLfzKNC18Wwog13Qi55r
	1WL3fKN5VWgEc3zYJ219Qjf7Ts2oL6gKimO1ABK++fpppTtRDtqNHJ77rLh46G0sBBsNgwj7fCh
	OWZcF63EQDRwgyrFeDKdXCI2Ip1ceWlOXfuzesUUhQE0uBcdVVU0YPf8wcJ+HSX56E6gPO2wkGV
	5d7tcOJBPik0ElktiyzfsZct0GJbxVCBWBMJeFucJGnL6WoyZutVCT60KukVO2B6hLyfDpY51Ww
	is+TvUmcDyfwRHrvcthJ5uiPNFYG7WQUWJKcY8kLvJeQ6KJaAP9iRLFafA4yvpdzVhUmDkiQ5Kg
	8EjJkOHUIHXWVizFinEjk2kRqbdFCATwdXd2xc53/5RJtApc8zc3phswoSsMAeR6un1VhoqgDAF
	JwE9OPeHbdbo2lu15Pq0gKqa41r5Rs/x5wnxtPBGBeXvI2jrO9yAZQoWpIYJa1842psRZ08ZWG6
	kM3knF+cDZ5MkyMYXPogB6Fau17h1/klt+RK4bOP4g4bBvrMOlgECCOkAUtlV7HfbGNOYrgTyLz
	Tbw==
X-Received: by 2002:a05:600c:4e8a:b0:4bb:6f77:1e35 with SMTP id 5b1f17b1804b1-4bb6f771fe4mr86799475e9.21.1794846727885;
        Mon, 16 Nov 2026 08:32:07 -0800 (PST)
Message-ID: <c9bbf2e0-9334-423a-ace9-9e50ee712986@gmail.com>
Date: Mon, 16 Nov 2026 17:32:05 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/riscv: bound each IMSIC MMIO regset by the
 per-group hart slots
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <1794842995.8631fc262581453bbf619ec5b2062170.1a1e4faaa300006d3f@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1794842995.8631fc262581453bbf619ec5b2062170.1a1e4faaa300006d3f@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1794846728-24D1E2A1-F41276A9/10/73395122804
X-purgate-type: spam
X-purgate-size: 6651
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/16/26 4:29 PM, Baptiste Le Duc wrote:
> imsic_init() requires every MMIO register set to be exactly
> IMSIC_HART_SIZE(guest_index_bits) * nr_parent_irqs bytes, i.e. to cover
> the interrupt files of all harts listed in interrupts-extended. This only
> holds when the DT describes a single register set.
> 
> When harts are split into groups (riscv,group-index-bits > 0), each group
> has its own register set, which only covers the harts of that group. For
> example, the SpacemiT V100 IMSIC node describes two 2 MiB register sets,
> each holding 64 hart slots of 32 KiB, with 128 parent interrupts in total.
> Xen expects 4 MiB per register set and panics with:
> 
>    IMSIC MMIO size is incorrect 2097152, expected MMIO size: 4194304
> 
> Check instead that a register set does not run past the end of the group it
> starts in, i.e. BIT(hart_index_bits) hart slots. A register set may be
> smaller than that, e.g. when a group holds a non-power-of-two number of
> harts.
> 
> Parent interrupt i gets the i-th hart slot of the register sets, taken in
> order. A slot with no hart behind it can be:
> - at the very end of the last register set, e.g. when a DT describes a
>    group by its full capacity: harmless, no interrupt is left to take it.
> - anywhere else: every later interrupt is shifted one slot early, onto the
>    previous hart's interrupt file.
> 
> Both show up as more slots than parent interrupts, so counting can't tell
> them apart. Refusing to boot would reject the valid DTs of the first case,
> so only warn: they keep booting, and broken ones get a hint as to why their
> interrupts are misrouted.
> 
> While at it, print the MMIO sizes in hex to match the DT reg property.
> 
> Fixes: c9bd8b322ecb ("xen/riscv: imsic_init() implementation")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> ---
> Changes in v2:
> - Bound a register set by the end of the group it starts in (offset +
>    size), not only by the group size.
> - Warn when the register sets hold more hart slots than parent
>    interrupts, as an unused slot before the end of the last register set
>    misroutes every following hart.
> - Reuse the group size for the base address mask.
> - Link to v1: https://patch.msgid.link/20261113-fix-imsic-mmio-dt-v1-1-10efb6c28de4@vates.tech
> ---
>   xen/arch/riscv/imsic.c | 39 +++++++++++++++++++++++++++++----------
>   1 file changed, 29 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
> index 44b8640ea3..48acc02440 100644
> --- a/xen/arch/riscv/imsic.c
> +++ b/xen/arch/riscv/imsic.c
> @@ -381,7 +381,7 @@ void cf_check vcpu_imsic_deinit(struct vcpu *v)
>   int __init imsic_init(const struct dt_device_node *node)
>   {
>       int rc;
> -    unsigned long reloff, hartid;
> +    unsigned long reloff, hartid, nr_slots = 0;
>       unsigned int nr_parent_irqs, index, nr_handlers = 0;
>       paddr_t base_addr;
>       unsigned int nr_mmios;
> @@ -415,9 +415,11 @@ int __init imsic_init(const struct dt_device_node *node)
>       /* Check MMIO register sets */
>       for ( unsigned int i = 0; i < nr_mmios; i++ )
>       {
> -        unsigned int guest_bits = imsic_cfg.guest_index_bits;
> -        unsigned long expected_mmio_size =
> -            IMSIC_HART_SIZE(guest_bits) * nr_parent_irqs;
> +        /* Address space of one group: BIT(hart_index_bits) hart slots. */
> +        unsigned long group_size = BIT(imsic_cfg.guest_index_bits +
> +                                       imsic_cfg.hart_index_bits +
> +                                       IMSIC_MMIO_PAGE_SHIFT, UL);
> +        unsigned long offset;
>   
>           rc = dt_device_get_address(node, i, &mmios[i].base_addr,
>                                      &mmios[i].size);
> @@ -429,9 +431,7 @@ int __init imsic_init(const struct dt_device_node *node)
>           }
>   
>           base_addr = mmios[i].base_addr;
> -        base_addr &= ~(BIT(guest_bits +
> -                           imsic_cfg.hart_index_bits +
> -                           IMSIC_MMIO_PAGE_SHIFT, UL) - 1);
> +        base_addr &= ~(group_size - 1);
>           base_addr &= ~((BIT(imsic_cfg.group_index_bits, UL) - 1) <<
>                          imsic_cfg.group_index_shift);
>           if ( base_addr != imsic_cfg.base_addr )
> @@ -442,15 +442,34 @@ int __init imsic_init(const struct dt_device_node *node)
>               goto imsic_init_err;
>           }
>   
> -        if ( mmios[i].size != expected_mmio_size )
> +        /* A register set must not run past the end of its group. */
> +        offset = mmios[i].base_addr & (group_size - 1);
> +        if ( mmios[i].size + offset > group_size )

This can overflow for a bogus, huge size from the DT and then pass. As 
offset is always below group_size,

         if ( mmios[i].size > group_size - offset )

can't.

>           {
>               rc = -EINVAL;
> -            printk(XENLOG_ERR "%s: IMSIC MMIO size is incorrect %ld, expected MMIO size: %ld\n",
> -                   node->name, mmios[i].size, expected_mmio_size);
> +            printk(XENLOG_ERR
> +                   "%s: IMSIC MMIO regset %u (offset %#lx + size %#lx) exceeds group size %#lx\n",
> +                   node->name, i, offset, mmios[i].size, group_size);
>               goto imsic_init_err;
>           }
> +
> +        /* The last slot may be cut short, see the lookup below. */
> +        nr_slots += DIV_ROUND_UP(mmios[i].size,
> +                                 IMSIC_HART_SIZE(imsic_cfg.guest_index_bits));
>       }
>   
> +    /*
> +     * Parent irq i is given hart slot i, counting slots across the register
> +     * sets in order. A slot with no hart behind it therefore shifts every
> +     * later irq one slot early, onto the previous hart's interrupt file.
> +     * Counting can't tell that from harmless unused slots at the end, hence
> +     * only a warning.
> +     */
> +    if ( nr_slots > nr_parent_irqs )
> +        printk(XENLOG_WARNING
> +               "%s: %lu hart slots in IMSIC MMIO regsets for %u parent irqs, unused slots must only be at the end of the last regset\n",
> +               node->name, nr_slots, nr_parent_irqs);
> +


With the overflow addressed and fixing a length of the string like (took 
from Baptiste response):

      printk(XENLOG_WARNING "%s: %lu hart slots for %u parent irqs\n",
             node->name, nr_slots, nr_parent_irqs);

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

