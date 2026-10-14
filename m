Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7D4CC6B27
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 09:03:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448589.1664617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGutG-0008K8-3z; Wed, 14 Oct 2026 09:03:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448589.1664617; Wed, 14 Oct 2026 09:03:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGutG-0008K1-0O; Wed, 14 Oct 2026 09:03:14 +0000
Received: by outflank-mailman (input) for mailman id 1448589;
 Wed, 14 Oct 2026 09:03:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGutE-0008Jo-UU
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 09:03:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGutE-000dg9-BF
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 11:03:12 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acf4549-8faa-0a2a0a5109dd-0a2a4506b91a-42
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 11:03:12 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acf4550-195a-0a2a45060019-d155dd30c148-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 11:03:12 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-48c411d6615so2766813f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 02:03:12 -0700 (PDT)
Received: from [172.20.10.5] (public-gprs376522.centertel.pl. [37.47.102.11])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0bd1843sm10568917f8f.56.2026.10.14.02.03.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2026 02:03:11 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791968592; x=1792573392; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qFZf3SeEqV4vS2tiBTpNp50PMhb6+wCohlTRSNADBas=;
        b=Wpgi+2Mj5x2h3buDxt9Jt6z+3USe+o+qKPWc71NuUBMu8Co2sO5QLcfK/iQtQt/lRn
         2VDWX4UhiNR9U/BcgKocikS9/mQ933XHGqVSOHpTvcjYEpPKonANG8Fwn1YNTNy6Byk/
         ayLSnbQWD1Tb8kbhYO/i6fIYqVgZtVuwOhUshyDEHUaaL04JsuDXaahLuBHrGFkg8BxN
         9qTM5ABxD/IM9jt7S71Q2UhLhF0McXF4OH+An+8EZuQPy6IbLV8TI8XMk9lkRDsg/sVN
         vwyUjrgl9ZT9i5GIgx9XPHYiHzXZ9QHw+TzGzMx8dqaKQe/Wgip8RgGEenlOx45I7KSo
         RA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791968592; x=1792573392;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qFZf3SeEqV4vS2tiBTpNp50PMhb6+wCohlTRSNADBas=;
        b=lypZ8uX4Gvj6k9flpV8CrVFmJXrZgck6pJTwc4M+CAMsGZUxULV0W3LGU0uUPEEN2z
         DYbiv0XX0OjcfCm0Jao3fPoPY/zgaJqTghR1W5YwqgPvbsQfZg20OxCXEncrNYzQH6Wr
         7dEX7OvoM0KDftvmkZiFW1JKxRgy/dvONJRhXf7YqpsaxROTnqYYX/+EFHz6Pp8xELtw
         AflrYyo/NdoXSZHl3U9dduDJo7dfH4vZpRRwMxVNoc8PogQGLQzacLVD6GSXKhS555Mw
         pyhM6i+MLf2C9a5ULIQmQnse5XdrIer+GcUpAi9qHnNwsO7EZqcBlH9ZbeaMaQrVwVdc
         B/Gg==
X-Forwarded-Encrypted: i=1; AKwUvByoClCSNrO9ifvauUdaQ9sF1VZlhEhRwDlCakP4PYyfXY60Mb+sSI1qOSPbR5tQjwUe/+/BMrw9n0M=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLp5nYJnFvRxTOLzLLwIDsOLvYk+E+DbN6YLR8d6LO/cwbE11+2
	oGuvZcoqTLrie6Gfnb9yMnDECFfT9RaaFkZW9L1Y1sOvfVscsq7fhFQA
X-Gm-Gg: AYBFou2WbmujzvnZmhQsjvh7YuQa1DSdtxwo143RUoM/ojyxdoCx+7WQN44UyAp2QNw
	DNadt588tvZVwOuzzuUUDxnts3DzhfNRjaOC4hvsRRNPcdlFI4dO5kMsIWPcYibzrpAhGeX3Q77
	apmvED97KW78JPmpjvdCgA8ssvcEURhhbHtUxC7HJGlsN0pKe9SdfbECxhaeg4Rpou7m5mR/WWR
	b5UObHxXNntzFyaRCmQd8v4RmQ5gcH8CDRmlTlkguVQ+rlUCMLXIor7j6gkt3Z/13KAGzHtyFTe
	qOEg92+rVfRxnRut+eoMPSS3k/ej/5/vQ4BetmlKSKI2HyK2KuUeIHapVQGVmngNJP4CQhd+vTp
	VLRD4sqCwZC+FQ/jyfWHoaEbyt59B65/8pTGiHPhoRRFZN5UmoGtiHZa+FkWUBLYvArSpRzCuE5
	GIM4dETHAgAoLvkWuBuUoBQjH+1fgQL5+v0aYBz3CD9CVwj82qyg1p0bDw9BfN0qC/ZU3AkDBYa
	pBkIKHFuEog/rgEvv1qBepW11jmUjsMvBitRWs=
X-Received: by 2002:adf:e190:0:b0:48d:bfd5:79c with SMTP id ffacd0b85a97d-48dbfd507e6mr31333252f8f.42.1791968591700;
        Wed, 14 Oct 2026 02:03:11 -0700 (PDT)
Message-ID: <16f55cfa-9767-41d0-9084-8683cb09a496@gmail.com>
Date: Wed, 14 Oct 2026 11:03:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] xen/riscv: probe the PTE A/D bits update scheme at
 boot
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Zheng Zhang <zhangzheng@iscas.ac.cn>
References: <1791885904.8631fc262581453bbf619ec5b2062170.1a134b909b40008425@vates.tech>
 <1791886038.8631fc262581453bbf619ec5b2062170.1a134bb169d0008425@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1791886038.8631fc262581453bbf619ec5b2062170.1a134bb169d0008425@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1791968592-FEE7677B-DE1FDD22/10/73395122804
X-purgate-type: spam
X-purgate-size: 4247



On 10/13/26 12:07 PM, Baptiste Le Duc wrote:
> +static bool __init probe_hw_ad_update(void)
> +{
> +    bool updated = false;
> +    unsigned int slot = FIX_MISC;
> +    vaddr_t va = FIXMAP_ADDR(slot);
> +    struct page_info *pg;
> +    pte_t *entry, pte;
> +    mfn_t mfn;
> +    unsigned long tmp;
> +
> +    pg = alloc_domheap_page(NULL, 0);
> +    if ( !pg )
> +        return false;
> +
> +    mfn = page_to_mfn(pg);
> +
> +    arch_pmap_map(FIX_MISC, mfn);

Do we need the arch_pmap_map() call here? The PTE it writes is 
overwritten right below by write_pte() (and the TLB flush is repeated 
too), so effectively only its ASSERT(!pte_is_valid(*entry)) remains.

Also, IIUC, arch_pmap_{map,unmap}() are the arch backend of the common 
PMAP infrastructure and are meant for the FIX_PMAP_* slots handed out by
pmap_map(); FIX_MISC isn't one of them. Accessing xen_fixmap[] directly 
is fine here, as set_fixmap() can't be used (map_pages_to_xen() always 
sets A and D), but then I'd do the same for the unmapping ...:

> +    entry = &xen_fixmap[slot];
> +    pte = pte_from_mfn(mfn, PTE_VALID | PTE_READABLE);
> +    write_pte(entry, pte);
> +
> +    flush_tlb_one_local(va);
> +
> +    asm_inline volatile (
> +        "1: ld %[tmp], 0(%[va])\n"
> +        "   li %[updated], 1\n"
> +        "2:\n"
> +        ASM_EXTABLE(1b, 2b)
> +        : [tmp] "=&r" (tmp), [updated] "+r" (updated)
> +        : [va] "r" (va)
> +        : "memory" );
> +
> +    arch_pmap_unmap(slot);

... I.e. write_pte(entry, (pte_t){}) followed by flush_tlb_one_local(va).

> +    free_domheap_page(pg);
> +
> +    return updated;
> +}


Also:

 > +    asm_inline volatile (
 > +        "1: ld %[tmp], 0(%[va])\n"
 > +        "   li %[updated], 1\n"
 > +        "2:\n"
 > +        ASM_EXTABLE(1b, 2b)
 > +        : [tmp] "=&r" (tmp), [updated] "+r" (updated)
 > +        : [va] "r" (va)
 > +        : "memory" );

Since the loaded value isn't needed, how about loading into the zero
register (the load still has to raise any exception) and using plain
asm goto? That needs no CONFIG_CC_HAS_ASM_GOTO_OUTPUT conditional (as I 
originally wanted to suggest), as there are no outputs, and both tmp and 
the LI go away. Together with accessing xen_fixmap[] directly and using 
stack page instead of allocation of new page (I assume something like 
this was suggested by Jan B.), something like this:

static bool __init probe_hw_ad_update(void)
{
     vaddr_t va = FIXMAP_ADDR(FIX_MISC);
     pte_t *entry = &xen_fixmap[FIX_MISC];
     bool updated = false;

     ASSERT(!pte_is_valid(*entry));

     /*
      * Any page in use will do, so alias the stack page this code runs on,
      * with A clear: the read below either faults or has A set by hardware.
      */
     write_pte(entry, pte_from_mfn(maddr_to_mfn(virt_to_maddr(&va)),
                                   PTE_VALID | PTE_READABLE));
     flush_tlb_one_local(va);

     asm_inline goto (
         "1: ld zero, 0(%[va])\n"
         ASM_EXTABLE(1b, %l[out])
         :
         : [va] "r" (va)
         : "memory"
         : out );

     updated = read_pte(entry).pte & PTE_ACCESSED;

  out:
     write_pte(entry, (pte_t){});
     flush_tlb_one_local(va);

     return updated;
}


One things which I also would like to note about:

 > +    asm_inline volatile (
 > +        "1: ld %[tmp], 0(%[va])\n"
 > +        "   li %[updated], 1\n"
 > +        "2:\n"
 > +        ASM_EXTABLE(1b, 2b)

Note that in staging do_trap() consults the exception table only for
CAUSE_ILLEGAL_INSTRUCTION, so on hardware which faults on a clear A bit
the load page fault ends up in do_unexpected_trap() and hence die(),
rather than in the fixup. This is addressed by "xen/riscv: look up the
exception table for any trap taken in Xen context" from the vINTC 
series, so this series depends on it; please mention that in the cover 
letter or at least something like that will be needed for now if i am 
not confusing something:

              break;
          }

+        fallthrough;
+    case CAUSE_LOAD_PAGE_FAULT:
          if ( fixup_exception(cpu_regs) )
              break;

~ Oleksii

