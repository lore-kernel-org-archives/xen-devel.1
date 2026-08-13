Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2321C5CFEB
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 10:35:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389739.1630371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuSmN-0004zD-So; Thu, 13 Aug 2026 10:35:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389739.1630371; Thu, 13 Aug 2026 10:35:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuSmN-0004z6-PS; Thu, 13 Aug 2026 10:35:19 +0000
Received: by outflank-mailman (input) for mailman id 1389739;
 Thu, 13 Aug 2026 10:35:19 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wuSmN-0004yz-1i
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 10:35:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuSmM-00Cib1-3r
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 12:35:18 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7d9dd9-2eae-0a2a0a5409dd-0a2a45028afa-26
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 12:35:18 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7d9de5-6ca4-0a2a45020019-d155802dc0f2-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 12:35:17 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4996f1ee4a4so12712365e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 03:35:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49981e47441sm41360855e9.4.2026.08.13.03.35.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 03:35:16 -0700 (PDT)
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
        d=suse.com; s=google; t=1786617317; x=1787222117; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E6bsn9NFfxkJnh520dPejRsEERuDcuHfX7DObfEzi1s=;
        b=EnxqSR12+erbI/CSSGzxTgtsU5blJRCnqtGUAbKLQiAVG2jnehxJLK5IazsJv3u1cR
         fwrXbFFx4JIe2yIzFeefBIMd3sEEdK181zk9Z4eVh8+v9z9bdIeBQMbvyuebXUxFrCHT
         LVx98GoA3RL+mYVx1/ScGwU0ZwT2pVb24KREhPW2LxugnaWjsclMhkBvQ/G0TQ6SR96n
         XL4TA4uCKfDPJbdiEfbEKSLiIaIepSOHed31whZyHDKiDe6PDsqUY0FiEN1A86nX63fG
         G3cm9pozbY8p0URT9WIm9+w9oCT7pzMMK39szq2sRTOkW3c7Qkq5xfl5Fk+pPRpUDxXp
         eHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786617317; x=1787222117;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E6bsn9NFfxkJnh520dPejRsEERuDcuHfX7DObfEzi1s=;
        b=Jc7magfvl7qD5RomLGEYqq7tuTT7Qn08E6xWgiuO4snviES/U5+YGfK2hh2eU5kHKk
         OX/uwafcaY3phgIqQ+c9XioJU8XxdgXV00CJo08A1vrbZLoXGT2tq8z9Bhhp9K/kK9ho
         iYg08+jk2CvlVPhYILhQF50wuOU8S0OXGF4j9tR6FeAHhHns4ZuxW7KiMFlSwIyk433p
         w6YCy9vvwGyXZ1wcUORh/CbadvVDWbZQP2JbTGmKFvAut6VSSCCdQ7cQCLWsHlTf+qLO
         XV9snbyfV2gZyQyMhSV7NvxTuainwItP2U/ZRkd1jZEafLAKbvcmwkrIFXzdHcBq2jZR
         iVtg==
X-Forwarded-Encrypted: i=1; AHgh+RqSSb5Dw1Op3yLzDMGtgDN88uGAWFXq9EXg+omJ2Pi4w3vxLolUv0ZDrbIvrdRrOlB2RwvfgZiT6Qs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWsLJT7M3tQr4TLor+4qNpZkLzXNvtJI442U65VUixSHeeKFb5
	DB83OXgGTooLon81WOx6RoLrlLotik0+MZaf5/clhuWJQzQCZ1ocV6laFBVpqyUnwA==
X-Gm-Gg: AR+sD12mdMXCn3YjhuNIIg+9n/WD36iV1s2k7ZjFwCFa4ZO3kdb8xwLBkbJ+1hrV8SZ
	ukVdZrSSKJ1dacZvtpmE87BOrcOO+jPHoddBf6+Ou9dwCfOf1+7OQeQDOBQa4NzA7u/fLHiWN1T
	m7Dy2mVOVs8sZrDthpg2raOZegmuWzmV5tSEMqARR0qDcf3aKuRYCt+jPRpkjCmZPO7OcNiSaU7
	H7YOCk322Szo7ruHbNH/2aAFTphx/3Tic6PiIIttpkx8Cxax4n/39epjDgWWgT1vuaYuyV9aAjQ
	1JVDKdVxHkS0D1s1cu1+ktKzUUjuUpdEShwUvozVRLZOG38xOyT+gYPeBIjboHW8/HftClt2zJZ
	1yec7GxvM5UnBPAiSnLu21iQVyRaEYM8nvVc36DnuTx4MuUEctJG0387cwDbXLiIs+1IcyslsHS
	Oq6kgFuHOnggNIotS4oVoqE5nID6hn/iFvbBkdQnRhIPphO7R+Ouc5MY016Qy2CoOTNVjK7dGZd
	IstOn16P3RzNMm0Iy4CwFSX/XXxSI+MMgTugi0B5nt0Y3bJWdym
X-Received: by 2002:a05:600c:3113:b0:493:c634:952 with SMTP id 5b1f17b1804b1-499821aa438mr45883185e9.7.1786617317332;
        Thu, 13 Aug 2026 03:35:17 -0700 (PDT)
Message-ID: <2110d4b7-ae37-47aa-99be-ab59e16f6167@suse.com>
Date: Thu, 13 Aug 2026 12:35:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools/hvmloader: implement Intel IGD extended VBT
 support
To: Chuck Zmudzinski <brchuckz@aol.com>
Cc: qemu-devel@nongnu.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Tomita Moeko <tomitamoeko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20260802050824.10554-1-brchuckz.ref@aol.com>
 <20260802050824.10554-1-brchuckz@aol.com>
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
In-Reply-To: <20260802050824.10554-1-brchuckz@aol.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1786617318-674BE2AC-592EE1DA/0/0
X-purgate-type: clean
X-purgate-size: 14275

On 02.08.2026 07:08, Chuck Zmudzinski wrote:
> Modern Intel IGD devices do not work well with the current
> implementation of support for the Intel IGD in hvmloader because
> it lacks support for an extended video bios table (VBT).
> 
> Code 43 errors in Windows guests and failure of the guest screen
> to light up are some of the problems that occur with the
> current implementation.
> 
> To address this problem, this patch implements support for
> Intel IGD devices with an extended VBT and OpRegion version 2
> and higher which is required for most modern Intel IGD devices.

First of all: Where's the spec of all of this?

> ---
>[...]
> 
>  tools/firmware/hvmloader/Makefile         |   1 +
>  tools/firmware/hvmloader/config.h         |  15 +-
>  tools/firmware/hvmloader/e820.c           |   4 +-
>  tools/firmware/hvmloader/intel_opregion.c | 297 ++++++++++++++++++++++

Nit: Please use dashes in favor of underscores in new files' names.

> --- a/tools/firmware/hvmloader/Makefile
> +++ b/tools/firmware/hvmloader/Makefile
> @@ -35,6 +35,7 @@ OBJS += smp.o cacheattr.o xenbus.o vnuma.o
>  OBJS += e820.o pci.o pir.o ctype.o
>  OBJS += hvm_param.o
>  OBJS += ovmf.o seabios.o
> +OBJS += intel_opregion.o

While this list isn't well sorted, I think your addition still wants to move
up by a line.

> --- a/tools/firmware/hvmloader/config.h
> +++ b/tools/firmware/hvmloader/config.h
> @@ -7,9 +7,6 @@
>  enum virtual_vga { VGA_none, VGA_std, VGA_cirrus, VGA_pt };
>  extern enum virtual_vga virtual_vga;
>  
> -extern unsigned long igd_opregion_pgbase;
> -#define IGD_OPREGION_PAGES 3
> -
>  struct bios_config {
>      const char *name;
>  
> @@ -43,6 +40,18 @@ extern struct bios_config ovmf_config;
>  
>  #define PAGE_SHIFT 12
>  #define PAGE_SIZE  (1ul << PAGE_SHIFT)
> +#define IGD_OPREGION_PAGES 3
> +#define IGD_OPREGION_SIZE ((IGD_OPREGION_PAGES - 1) << PAGE_SHIFT)

This is odd, and hence wants a comment.

> +#define IGD_OPREGION_RVDA 0x3ba
> +#define IGD_OPREGION_RVDS 0x3c2
> +#define IGD_OPREGION_VERSION 0x16
> +#define IGD_OPREGION_MASK 0xfff
> +#define IGD_OPREGION2_SUPPORT_MASK 0x1
> +#define IGD_OPREGION_SIGNATURE "IntelGraphicsMem"
> +#define IGD_VBT_SIGNATURE "$VBT"
> +extern unsigned long igd_opregion_pgbase;
> +extern uint32_t igd_opregion_e820_pages;
> +void intel_opregion_setup(uint32_t vga_devfn);

Blank lines please ahead of the new #define-s you add and between those new
#define-s and the new decls.

For igd_opregion_e820_pages I further cannot spot any use which would justify
the use of a fixed-width type; unsigned int will do, and will then be in line
with ./CODING_STYLE.

> --- a/tools/firmware/hvmloader/e820.c
> +++ b/tools/firmware/hvmloader/e820.c
> @@ -243,11 +243,11 @@ int build_e820_table(struct e820entry *e820,
>          nr++;
>  
>          e820[nr].addr = igd_opregion_base;
> -        e820[nr].size = IGD_OPREGION_PAGES * PAGE_SIZE;
> +        e820[nr].size = igd_opregion_e820_pages * PAGE_SIZE;
>          e820[nr].type = E820_NVS;
>          nr++;
>  
> -        e820[nr].addr = igd_opregion_base + IGD_OPREGION_PAGES * PAGE_SIZE;
> +        e820[nr].addr = igd_opregion_base + igd_opregion_e820_pages * PAGE_SIZE;

Are these new multiplications at risk of overflowing? I.e. how many pages can
there be in an extreme case?

> --- /dev/null
> +++ b/tools/firmware/hvmloader/intel_opregion.c
> @@ -0,0 +1,297 @@
> +/*
> + * intel_opregion.c: HVM Intel OpRegion setup.
> + *
> + * Leendert van Doorn, leendert@watson.ibm.com
> + * Copyright (c) 2005, International Business Machines Corporation.
> + *
> + * Copyright (c) 2006, Keir Fraser, XenSource Inc.

What do these cover?

> + * Copyright (c) 2026, Charles Zmudzinski.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program; If not, see <http://www.gnu.org/licenses/>.
> + */

Please use an SPDX line instead in new files.

> +#include "util.h"
> +#include "config.h"
> +#include "pci_regs.h"
> +
> +unsigned long igd_opregion_pgbase = 0;
> +uint32_t igd_opregion_e820_pages = IGD_OPREGION_PAGES;
> +
> +static bool verify_opregion(const uint32_t addr)
> +{
> +    const char *opregion_signature = IGD_OPREGION_SIGNATURE;
> +    if ( memcmp((const void *)addr, (const void *)opregion_signature, 16) )
> +        return false;
> +    return true;
> +}

Style: Blank line please between declaration(s) and statement(s) as well as
ahead of the main "return" of a function. There further isn't really a need
for an if() or two return statements here. Also please avoid casts wherever
possible. Finally, the local variable isn't really needed here either - the
string literal can be passed directly to memcmp(). All of this helps
readability as well.

> +static bool verify_vbt(const uint32_t addr)
> +{
> +    const char *vbt_signature = IGD_VBT_SIGNATURE;
> +    if ( memcmp((const void *)addr, (const void *)vbt_signature, 4) )
> +        return false;
> +    return true;
> +}

Same comments here, obviously (and potentially elsewhere).

> +void intel_opregion_setup(uint32_t vga_devfn)
> +{
> +    uint32_t igd_guest_opregion;
> +    uint32_t pages_needed; /* for OpRegion + VBT */

The former probably wants to be fixed-width, but for the latter I see no need.

> +    void *opregion_scratch;
> +    void *vbt_scratch;
> +    void *vbt_source;
> +    /*
> +     * absolute value in the host/guest except
> +     * as noted in the comments
> +     */

Nit: Comment style (see ./CODING_STYLE).

> +    static unsigned long rvda_host;
> +    static unsigned long rvda_guest;

Why static? The function can't be called more than once, if I'm not mistaken.

> +    igd_opregion_pgbase = mem_hole_alloc(IGD_OPREGION_PAGES);
> +    /*
> +     * Tentative value for the number of pages to reserve
> +     * in the E820 map for the OpRegion and VBT.
> +     *
> +     * This will be the final value for the E820 map if
> +     * the device model lacks support for OpRegion 2 or
> +     * if the host OpRegion version is < 2 or if we never
> +     * allocate more pages in the E820 map for the VBT.
> +     */
> +    igd_opregion_e820_pages = IGD_OPREGION_PAGES;
> +
> +    /*
> +     * Read the value the device model is initialized with.
> +     * If the device model supports OpRegion 2, it will
> +     * return the host IGD OpRegion address. If not, it
> +     * will return 0. If the device model does not support
> +     * OpRegion 2, the device model expects us to give it
> +     * the address to which it will map the OpRegion in the
> +     * guest and then expects us to do nothing more to setup
> +     * the OpRegion, so that is all we will do in that case.
> +     */

Hmm, exposing the host opregion to a guest certainly feels like an issue.

> +    const uint32_t igd_host_opregion = pci_readl(vga_devfn,
> +                                                 PCI_INTEL_OPREGION);
> +    if ( !igd_host_opregion ) {

Nit (style) Brace placement (throughout).

> +        printf("device model lacks extended VBT "
> +               "support. Continuing with legacy support only\n");

This message can easily confuse / worry people. (If it was to be kept, it
would also need style adjustment.)

> +        /*
> +         * Write the the OpRegion offset to give the OpRegion
> +         * address to the device model. The device model will trap
> +         * and map the OpRegion at the give address.
> +         */
> +        pci_writel(vga_devfn, PCI_INTEL_OPREGION,
> +                   igd_opregion_pgbase << PAGE_SHIFT);
> +        return;
> +    } else {

No need for "else" after an unconditional "return".

> +        printf("host OpRegion address: 0x%x\n",

The shorter %#x please (also elsewhere).

> +               igd_host_opregion);
> +    }
> +
> +    const uint32_t igd_host_opregion_page_offset =
> +                   igd_host_opregion & IGD_OPREGION_MASK;

I think like in the hypervisor we don't want to mix declarations and
statements just yet.

> +    igd_guest_opregion = (igd_opregion_pgbase << PAGE_SHIFT) |
> +                          igd_host_opregion_page_offset;
> +
> +    /*
> +     * We know at this point the device model supports
> +     * OpRegion 2.
> +     *
> +     * Indicate to the device model that we support
> +     * OpRegion 2 by setting the least significant bit
> +     * of the address we give to the device model.
> +     * The device model will notice this bit set and
> +     * respond appropriately to our writes to the
> +     * register where the OpRegion address is stored.
> +     */

Specifically noticeable here: Please make better use of line length in
long(ish) comments.

> +    pci_writel(vga_devfn, PCI_INTEL_OPREGION,
> +               (igd_opregion_pgbase << PAGE_SHIFT) |
> +                IGD_OPREGION2_SUPPORT_MASK);

This looks to imply qemu is the only possible device model.

> +    printf("guest OpRegion tentative "
> +           "address: 0x%x\n", igd_guest_opregion);
> +
> +    if ( !verify_opregion(igd_guest_opregion) ) {
> +        printf("error: IGD OpRegion signature "
> +               "not found.\n");

No full stop in messages please.

> +        BUG();
> +    }
> +
> +    opregion_scratch = scratch_alloc(IGD_OPREGION_SIZE, 0);
> +    memcpy(opregion_scratch, (const void *)igd_guest_opregion,
> +           IGD_OPREGION_SIZE);
> +
> +    /* Read OpRegion version, rvda_host, and rvds */
> +    const uint16_t version = *(uint16_t *)(opregion_scratch +
> +                                           IGD_OPREGION_VERSION);
> +    printf("OpRegion version: 0x%x\n", version);
> +    if ( version >= 0x0200 ) {
> +        rvda_host = *(unsigned long *)(opregion_scratch +
> +                                       IGD_OPREGION_RVDA);
> +        /* It is convenient to make rvda_host absolute */
> +        if ( version > 0x0200 )
> +            rvda_host += igd_host_opregion;
> +        printf("host VBT address: 0x%lx\n", rvda_host);
> +    } else {
> +        printf("guest OpRegion address: 0x%x\n", igd_guest_opregion);
> +        rvda_host = 0;
> +    }
> +    const uint32_t rvda_host_page_offset = rvda_host &
> +                                           IGD_OPREGION_MASK;

Why host_page_offset here when ...

> +    const uint32_t rvds = *(uint32_t *)(opregion_scratch +
> +                                        IGD_OPREGION_RVDS);
> +    const uint32_t rvds_page_offset = rvds & IGD_OPREGION_MASK;

... it's just page_offset here, and when further you use it below to set
rvda_guest?

> +    printf("VBT size: 0x%x\n", rvds);
> +
> +    if ( !rvds || !rvda_host ) {
> +        printf("guest OpRegion address: 0x%x\n", igd_guest_opregion);
> +        rvda_host = 0;
> +    }
> +    /*
> +     * Write rvda_host as 2 successive 32-bit values
> +     * to communicate location of the VBT to the device
> +     * model. If rvda_host is not 0, The device model
> +     * unmaps the OpRegion and eventually maps the VBT
> +     * after we also write the guest address where the
> +     * VBT will be mapped.
> +     *
> +     * If we send rvda_host = 0 to the device model, it
> +     * will assume we do not need OpRegion 2 support and
> +     * it will not unmap the OpRegion.
> +     */
> +    pci_writel(vga_devfn, PCI_INTEL_OPREGION,
> +               (uint32_t)(rvda_host & 0xfffffffful));
> +    unsigned long rvda_host_upper_32 = (uint64_t)rvda_host >> 32;
> +    pci_writel(vga_devfn, PCI_INTEL_OPREGION,
> +               (uint32_t)rvda_host_upper_32);

Why would you need to communicate a host property to the DM?

> +    /* In this case, we use the mapped OpRegion */
> +    if ( !rvda_host )
> +        return;
> +
> +    /*
> +     * Update the number of pages the device model
> +     * needs to map for us to get a copy of the VBT.
> +     *
> +     * N.B.: Here, igd_opregion_pgbase is really the page
> +     * base of the location where the device model will
> +     * map the VBT.
> +     */
> +    uint32_t vbt_pages_needed = rvds >> PAGE_SHIFT;
> +    if ( rvds & IGD_OPREGION_MASK )
> +        vbt_pages_needed++;
> +    if ( vbt_pages_needed > igd_opregion_e820_pages ) {
> +        igd_opregion_pgbase = mem_hole_alloc
> +                              (vbt_pages_needed - igd_opregion_e820_pages);

Nit: Indentation.

> --- a/tools/firmware/hvmloader/pci.c
> +++ b/tools/firmware/hvmloader/pci.c
> @@ -43,7 +43,6 @@ uint64_t pci_hi_mem_start = 0, pci_hi_mem_end = 0;
>  #define BAR_RELOC_THRESH GB(1)
>  
>  enum virtual_vga virtual_vga = VGA_none;
> -unsigned long igd_opregion_pgbase = 0;
>  
>  /* Check if the specified range conflicts with any reserved device memory. */
>  static bool check_overlap_all(uint64_t start, uint64_t size)
> @@ -190,14 +189,7 @@ void pci_setup(void)
>                  virtual_vga = VGA_pt;
>                  if ( vendor_id == 0x8086 )
>                  {
> -                    igd_opregion_pgbase = mem_hole_alloc(IGD_OPREGION_PAGES);
> -                    /*
> -                     * Write the the OpRegion offset to give the opregion
> -                     * address to the device model. The device model will trap 
> -                     * and map the OpRegion at the give address.
> -                     */
> -                    pci_writel(vga_devfn, PCI_INTEL_OPREGION,
> -                               igd_opregion_pgbase << PAGE_SHIFT);
> +                    intel_opregion_setup(vga_devfn);
>                  }

With this preferably also drop the figure braces.

Jan

