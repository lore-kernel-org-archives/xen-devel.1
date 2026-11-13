Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11876606A327
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DAqKowJx
Received: from list by lists.xenproject.org with outflank-mailman.1487689.1689919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtI3-0006KJ-0f; Fri, 13 Nov 2026 15:34:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487689.1689919; Fri, 13 Nov 2026 15:34:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtI2-0006KA-Sw; Fri, 13 Nov 2026 15:34:10 +0000
Received: by outflank-mailman (input) for mailman id 1487689;
 Fri, 13 Nov 2026 15:34:09 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtI0-0006K4-UK
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:34:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtI0-00B3tK-Ay
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:34:08 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af72ded-e002-0a2a0a5209dd-0a2a450aa966-10
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:34:08 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af72df0-f2d2-0a2a450a0019-d1558035b5f2-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:34:08 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a215e64962so19442615e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:34:08 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb55ae501bsm74546655e9.10.2026.11.13.07.34.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2026 07:34:07 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794584048; x=1795188848; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bPBbXkfxCA5K2ZJaUZMmGI+rOqGFgPtkOrKlYlKTmR4=;
        b=DAqKowJxb6kF6uZ6B9xWMzxzUGzAsudXGukjW7UGEnu/MrWWRbMVfGkBHxTt97ooki
         bxyDSC4VpjrxO/zN2YveUh6LrvWRCUy5+tW87422jvRoy0GRnjIe1XvCCIVy5+ZvHHif
         dAV5vkdMxE6bei1BQma6INOmtregzlQaODWNSAjX7Ipf/kxPmZBYP0igwe+UlCANPo1d
         N5Ja9uv+NTd1MTHF+PJZD6gxLTnYF0t26nUWlo5ZKFX8arNa1mf2pO/KptvkS31u687u
         jOXDk5/tAByzUBFA7tjpzz6Z4Oyqp7h6pFtai+CmHI4Chixkzm4LzSrVtrnqEwyspuUH
         pQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584048; x=1795188848;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bPBbXkfxCA5K2ZJaUZMmGI+rOqGFgPtkOrKlYlKTmR4=;
        b=fbLLSbu7rbJ1uu9/r1FdTTQ7A09mhokwdqCzMxzqrXQxIJem/iLI+QBhGeI1eOE53u
         OMZdkhjwEeBDVZDoKeAZIbyR6x3p52wd3FmgLtPM6DTh+MmePToV30/rG0Ir/0sJl0s0
         FOpULnteoLhzufHU1ZylFjBMIPaux/WVcOGzUJ1SDpPLzkZjPdVg8bjHtvBEjQ/wVrxZ
         xtF7rOBp8PHGUZLZsLUc1HrbzM1+D4bSHpv7LjivN8J3D7aVU/Wqg7UFviK1DztkReBJ
         YkzYEwC1BuQu6w6SuIcLAsECiXSqKEmS4FiK3yscaej5rP+vHf1YsielkjG2tHwdkkQn
         kvmQ==
X-Forwarded-Encrypted: i=1; AL+hErGEPYrRTUR74c5+Zoe4R8UpDHiAP4JEEjjpkSkozJSLxmjBFzqAHYH92onbPni++pZJC4mkbm3trVM=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/nXRTEMdbDDc/TQp30YnqBZU5TLyogXBNpPV2hSLknpsUg74Ht
	bkRHnNo5Aih3TT3DsMhNWxusmi4J+zqqBy5h/q1PlMs6+CikYT1RFMYlsfpunw==
X-Gm-Gg: AYBFou3nN8AH7SbHsKm/H4bfUr1yFuE8Xr7A2ESgmC1gWdMWEQp09c9HJu5W1DKL66G
	6Cl92rMigMDNY7LXKTNlq5yBHCWFM6FL1qC9oL2fKegnEABqC4SD32TtgTkSJo9ttEjru2LzqwH
	swNEmGp/chNt5Bk+JG9WzgByhdhSi+PXxIhXm1P2azc13xhd8IWrZsBwBGYmU+Eo5vt203P/x1w
	Kkh2YwrXc/6gnYY9bFSvyNCC61a/v6mInEcgxa1C5nIUQEZnMU55tevu6KJx/TJ7WY5oBL7qNbr
	YoAD8ClU9AneOYdpag3MhB9pUlovX8A68I8i0JSO6rkacoHxvntzhUc+tNqPtG6TkbXG10Z5/+2
	jv8A3Pagz18PxSxYS+s+ggTut55byUGnSAYtkNf0rqDbJU0Vs2LqCkSldMadkYmUc8p2kyQhKJg
	2htuh7LmZzi8uQTxFEbJ2Oz/sIxaNNb3BG8QJExcyb21mmQYaCyfOY6yrlRp+iP7kRY12EuEVzL
	u+2T+n4v2qsy47QVnc0tfFb5i+AbchD2H/oK9DFZNxHXII40BUfbh825YXbnIDUUWdpD2V+tQRT
	E5+VpbTtoT7wYUHC5x8/1e+H/dW/uUXCRkMdIy43flGZmR+JvhjrvjwwYlalVRUvOJBccil2h2x
	0Wg==
X-Received: by 2002:a05:600c:8b11:b0:4a3:59c9:a756 with SMTP id 5b1f17b1804b1-4bb55a6a53emr63205125e9.6.1794584047531;
        Fri, 13 Nov 2026 07:34:07 -0800 (PST)
Message-ID: <028f973d-6034-4518-973d-000ea97a5c27@gmail.com>
Date: Fri, 13 Nov 2026 16:34:06 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: bound each IMSIC MMIO regset by the per-group
 hart slots
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <1794567580.8631fc262581453bbf619ec5b2062170.1a1d490296f0006d3f@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1794567580.8631fc262581453bbf619ec5b2062170.1a1d490296f0006d3f@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1794584048-585CBCFC-9B030EF7/10/73395122804
X-purgate-type: spam
X-purgate-size: 7587
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/13/26 11:59 AM, Baptiste Le Duc wrote:
> imsic_init() requires every MMIO register set to be exactly
> IMSIC_HART_SIZE(guest_index_bits) * nr_parent_irqs bytes, i.e. to cover
> the interrupt files of all harts listed in interrupts-extended. This only
> holds when the DT describes a single register set.
> 
> When harts are split into groups (riscv,group-index-bits > 0), each group
> has its own register set, which only covers the harts of that group. For
> example, the SpacemiT V100 IMSIC node describes two 2 MiB register sets,
> each holding 64 hart slots of 32 KiB, with 128 parent interrupts in total.
> Xen expects 4 MiB per register set and fails with:
> 
>    IMSIC MMIO size is incorrect 2097152, expected MMIO size: 4194304
> 
> A register set can also be smaller than its slot space, when the number
> of harts in a group is not a power of two.
> 
> Check instead that a register set does not exceed the address space of
> one group of BIT(hart_index_bits) hart slots.

The term "slot space" appears before it is explained: the paragraph
using it comes before the one that introduces "BIT(hart_index_bits)
hart slots". If the check below is changed as suggested, these two
paragraphs could become:

   Check instead that a register set does not run past the end of the
   group it starts in, i.e. BIT(hart_index_bits) hart slots. A register
   set may be smaller than that, e.g. when the number of harts in a group
   is not a power of two.

> 
> While at it, print the MMIO sizes in hex, so they can be compared directly
> with the reg property of the DT node.
> 
> Fixes: c9bd8b322ecb ("xen/riscv: imsic_init() implementation")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> ---
>   xen/arch/riscv/imsic.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
> index 44b8640ea3..255ac44b52 100644
> --- a/xen/arch/riscv/imsic.c
> +++ b/xen/arch/riscv/imsic.c
> @@ -416,8 +416,8 @@ int __init imsic_init(const struct dt_device_node *node)
>       for ( unsigned int i = 0; i < nr_mmios; i++ )
>       {
>           unsigned int guest_bits = imsic_cfg.guest_index_bits;
> -        unsigned long expected_mmio_size =
> -            IMSIC_HART_SIZE(guest_bits) * nr_parent_irqs;
> +        unsigned long max_mmio_regset_size =
> +            IMSIC_HART_SIZE(guest_bits) * BIT(imsic_cfg.hart_index_bits, U);
>   
>           rc = dt_device_get_address(node, i, &mmios[i].base_addr,
>                                      &mmios[i].size);
> @@ -442,11 +442,11 @@ int __init imsic_init(const struct dt_device_node *node)
>               goto imsic_init_err;
>           }
>   
> -        if ( mmios[i].size != expected_mmio_size )
> +        if ( mmios[i].size > max_mmio_regset_size )

The address check above masks the hart and guest index bits, so a
register set may start at any hart slot of its group. The binding
describes each reg entry as "Base address of each IMSIC group", i.e. a
register set lies within one group. Bounding only the size doesn't
enforce that: a register set which starts in the middle of a group can
run past the end of the group and still pass.

For example, take the IMSIC node of QEMU virt with two NUMA nodes of
three harts each (guest-index-bits = 3, hart-index-bits = 2, groups of
0x20000) and move register set 0 to <0x28010000 0x18000>. It starts at
slot 2 and claims three slots, so the third one ends 0x8000 past the end
of the group. With this patch Xen accepts the node, and the interrupt
file of the third hart ends up at 0x28020000, where bit 17 is set: that
bit is part of the base address, not of the hart index, so no hart of
group 0 lives there.

Taking the offset of the register set within its group into account
fixes that, and computing the group size with a single BIT(..., UL)
also avoids the 32-bit shift by a DT-provided hart_index_bits:

--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -415,9 +415,11 @@ int __init imsic_init(const struct dt_device_node 
*node)
      /* Check MMIO register sets */
      for ( unsigned int i = 0; i < nr_mmios; i++ )
      {
-        unsigned int guest_bits = imsic_cfg.guest_index_bits;
-        unsigned long max_mmio_regset_size =
-            IMSIC_HART_SIZE(guest_bits) * 
BIT(imsic_cfg.hart_index_bits, U);
+        /* Address space of one group: BIT(hart_index_bits) hart slots. */
+        unsigned long group_size = BIT(imsic_cfg.guest_index_bits +
+                                       imsic_cfg.hart_index_bits +
+                                       IMSIC_MMIO_PAGE_SHIFT, UL);
+        unsigned long offset;

          rc = dt_device_get_address(node, i, &mmios[i].base_addr,
                                     &mmios[i].size);
@@ -429,9 +431,7 @@ int __init imsic_init(const struct dt_device_node *node)
          }

          base_addr = mmios[i].base_addr;
-        base_addr &= ~(BIT(guest_bits +
-                           imsic_cfg.hart_index_bits +
-                           IMSIC_MMIO_PAGE_SHIFT, UL) - 1);
+        base_addr &= ~(group_size - 1);
          base_addr &= ~((BIT(imsic_cfg.group_index_bits, UL) - 1) <<
                         imsic_cfg.group_index_shift);
          if ( base_addr != imsic_cfg.base_addr )
@@ -442,11 +442,13 @@ int __init imsic_init(const struct dt_device_node 
*node)
              goto imsic_init_err;
          }

-        if ( mmios[i].size > max_mmio_regset_size )
+        /* A register set must not run past the end of its group. */
+        offset = mmios[i].base_addr & (group_size - 1);
+        if ( mmios[i].size > group_size - offset )
          {
              rc = -EINVAL;
-            printk(XENLOG_ERR "%s: IMSIC MMIO regset %u size %#lx 
larger than max %#lx\n",
-                   node->name, i, mmios[i].size, max_mmio_regset_size);
+            printk(XENLOG_ERR "%s: IMSIC MMIO regset %u (offset %#lx, 
size %#lx) exceeds group size %#lx\n",
+                   node->name, i, offset, mmios[i].size, group_size);
              goto imsic_init_err;
          }
      }

I checked it on top of your patch with QEMU virt (aia=aplic-imsic, two
groups of two and of three harts): Xen boots as with your version, while
the node with the shifted register set is now rejected with:

   interrupt-controller: IMSIC MMIO regset 0 (offset 0x10000, size 
0x18000) exceeds group size 0x20000

Probably it will be better to make print message as follow:

             printk(XENLOG_ERR "%s: IMSIC MMIO regset %u (offset %#lx + 
size %#lx) exceeds group size %#lx\n",
                    node->name, i, offset, mmios[i].size, group_size);


The V100 node from the commit message passes as well, since both of its
register sets are aligned to the group size.

>           {
>               rc = -EINVAL;
> -            printk(XENLOG_ERR "%s: IMSIC MMIO size is incorrect %ld, expected MMIO size: %ld\n",
> -                   node->name, mmios[i].size, expected_mmio_size);
> +            printk(XENLOG_ERR "%s: IMSIC MMIO regset %u size %#lx larger than max %#lx\n",
> +                   node->name, i, mmios[i].size, max_mmio_regset_size);
>               goto imsic_init_err;
>           }
>       }
> 
> ---
> base-commit: 97bf370375113caf92fccf04e2877fc6b5ff887f
> change-id: 20261113-fix-imsic-mmio-dt-c3317ac2efec

(out of curiosity) Is it automatically generated by b4?

~ Oleksii

