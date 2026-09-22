Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4A3C982FE
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 15:06:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429111.1652043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x924K-0001jw-2d; Tue, 22 Sep 2026 15:06:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429111.1652043; Tue, 22 Sep 2026 15:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x924K-0001jo-05; Tue, 22 Sep 2026 15:06:04 +0000
Received: by outflank-mailman (input) for mailman id 1429111;
 Tue, 22 Sep 2026 15:06:02 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x924I-0001jd-Hq
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 15:06:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x924H-00GvRU-Gr
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 17:06:01 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab29953-2eae-0a2a0a5409dd-0a2a450aa820-16
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 17:06:01 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab29958-f2d2-0a2a450a0019-4a7de18cb209-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 17:06:01 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49e620fa473so26431255e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 08:06:01 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fdaa99b8bsm42639685e9.1.2026.09.22.08.05.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 08:06:00 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790089560; x=1790694360; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SUTJHHO7QDYKSxYCbxvAq6JYc+Al10jTRuWWtUcd/u0=;
        b=G3iGGFmCccA5BNK7eSE87eg//+jHqkP+uqvBL8fx5I8toHPVtOFZuQwnt//O4OYRnr
         QMfBnr4Gdi1FLcpJHRFtY/LLsn7a4kuXVk/5OOq0I5Le5sIl1PKtHN+O7hRYvSgwhjaL
         3nUR/cN/3mmj9ijZqNoi4ssoTbnIdgIVtrG+GjFotBzKfsd9MVJcbzZ9RF6/jGuXOLKW
         wFKjT0OL908JxrjCLjfVDYf/qe2oC0bhp54H57pyYgzclmjnqrQs7/edHnkNamayreZm
         lgZNUlvx+wA5cN9ZvzRULzQVcK6/SEKFjg/kjotqTu1TvgBmcN6OSE1H3GaRrKJWy7Q0
         vBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790089560; x=1790694360;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SUTJHHO7QDYKSxYCbxvAq6JYc+Al10jTRuWWtUcd/u0=;
        b=GygN+274+vtBvMmukZDsw9mbwznj+7407aPack3KR7OXQk56MMlWUDiLWojtAgKl3t
         lKx2PYPcoj6J7K0ZVG8SiBZxDgo61gCYRWbTAE4gOcrf0I61HGltzkTkZ4l987oHEW5H
         YdkqplFOzoONjR0j2ssxcAB3D8V9leVOKWp/1HUmz6qK1rwNCvAcav8paI3XY1nI+J6f
         PemuPGLZI5S0nEVUDbJwWoY+8b12cO1rKtN0AP58ABqv1+xwsiI1gzxDTGcV4j1LPIG8
         mgKVTQUSZwFngPDDUy6svNZCf+rwUf+ozvyofg64h3Uu0dMoNtztFO1UWCP9QKT+CjTj
         +cLQ==
X-Gm-Message-State: AFuF++kzhwOfuOy9qYhGcGsX2ucP3zkVLVMvInsCRnM2VBL90wi7b1tc
	HmEZ6MBOPPI8GuFISCRtfNzo9nT8hCue4JAwYpQRFwqnUu9b3sD32yPm
X-Gm-Gg: AYBFou1mjIFgo199178rdnzPVHN1HS9grpNtFyZgS8NLdwwj6gP9sgUVt3AMPb/OxPc
	JAfPh0lAaG2hgr5PzamqZTquFi9fIx3HMHO7+pUrf4xB4FC96Z1EEoB001xiVcUae/GPoFp376x
	yJyhQwmss6oiMsVAq582XTZohYZ4UwlPiG/stJ2IcABsdiGep/uRet4F23am0cFjgTOS7ZAS9Ay
	ucW20D0XKUEctPGU+k8HKTbz3IVZVL80rpfckU5UbJNlCqR1EHTxUZsKbso+tofnDQi0rtSjO64
	UdmqWf+D2N/jqIHWldX0kg2UMHOVGA+R5H5YTDWyoAUM6xugXARlslZzTYEIpSGVChP7y0PPL/0
	U0wRY2G1zSxSAor4EeczZ/5Ukr1LRSvf8cGYhnMipvzmFU+LIm+rh5LA789clRc4SsjPS9T1mWF
	yfI9Kswbz6DBGWvZqn11LgYSF9uRIiS7dAjlK2vrHDS2SAy5gVIKtzR8fYdmMltUUrqCr6ro3/d
	j/ROvN/Dyk1G3u7N/73t6TyJRlPHj9xLjmUsOYKGcG16NEGqA==
X-Received: by 2002:a05:600c:3f0b:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-49fc5750c61mr177979385e9.21.1790089560413;
        Tue, 22 Sep 2026 08:06:00 -0700 (PDT)
Message-ID: <a073efe8-d221-4dec-8f5f-87f4547d28dc@gmail.com>
Date: Tue, 22 Sep 2026 17:05:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] xen/riscv: set A/D bits in Xen's page-table
 mappings under Svade
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Connor Davis <connojdavis@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>
References: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
 <1789032898.8631fc262581453bbf619ec5b2062170.1a08aab9ea7000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1789032898.8631fc262581453bbf619ec5b2062170.1a08aab9ea7000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1790089561-5A1DDCFC-524FC852/10/73395122804
X-purgate-type: spam
X-purgate-size: 6062



On 9/10/26 11:34 AM, Baptiste Le Duc wrote:
> The previous patch set A/D bits in case of the Svade extension for G-stage
> mappings. Xen's own S-stage mappings need the same fix as both
> setup_initial_mapping() (the boot page tables) and arch_pmap_map() (the
> fixmap) build leaf PTEs directly instead of going through
> pt_update_entry(), which is what adds A/D bits. So with Svade, both would
> fault on first access.

Please don't refer to "the previous patch": once applied, the commit
message should stand on its own. Just state the fact instead, e.g.:

   With Svade, hardware doesn't update the A/D bits; instead it raises a
   page fault when A is clear (or D is clear on a write).
   pt_update_entry() already sets them, but ...

> 
> Add PTE_ACCESSED to all PAGE_HYPERVISOR_* and also PTE_DIRTY to
> PAGE_HYPERVISOR_RW as it needs to be set during a write to avoid a fault.
> This fixes arch_pmap_map() for free, since it already builds its PTE from
> PAGE_HYPERVISOR_RW. Switch setup_initial_mapping() to use these macros for
> its default, text and rodata permissions, and for the temporary root entry
> built by check_pgtbl_mode_support(), instead of the equivalent raw bit
> lists. The latter drops PTE_WRITABLE, going from RWX to RX, but this is
> harmless, as that entry only has to make the current instruction stream
> fetchable between the two CSR_SATP writes used to probe SATP mode support,
> and nothing writes through it.
> 
> Drop the now-redundant PTE_LEAF_DEFAULT, since converting the last
> open-coded site above leaves it with no user outside page.h itself.
> 
> A PTE is a table entry iff PTE_VALID is set and R/W/X are all clear, so
> update pte_is_table() and pte_is_mapping() accordingly.

This doesn't describe what the patch actually changes: the return
expressions of pte_is_table()/pte_is_mapping() are untouched, only the
ASSERT()s change. The real reason is that the ASSERT()s masked the PTE
with PAGE_HYPERVISOR_RW, which now contains A|D, so for the reserved
encoding V|W|A we would compare V|W|A != V|W and the ASSERT() would
silently stop firing. Something like:

   The ASSERT()s in pte_is_table() and pte_is_mapping() mask the PTE
   with PAGE_HYPERVISOR_RW to detect the reserved W=1,R=0 encoding. Now
   that PAGE_HYPERVISOR_RW includes A/D, the check would no longer
   trigger for a PTE with A or D set, so use an explicit V|R|W mask.

> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> ---
> Changes since v1:
> - change commit title
> - mention in patch message that arch_pmap_map() is fixed too, via the
>    PAGE_HYPERVISOR_RW change, not just setup_initial_mapping().
> - convert check_pgtbl_mode_support()'s temporary root entry to
>    PAGE_HYPERVISOR_RX, as it's harmless.
> - drop PTE_LEAF_DEFAULT entirely instead of keeping it, now that no site
>    open-codes it anymore.
> - drop the pte_is_table() comment line that referenced PAGE_HYPERVISOR_RW,
>    now stale.
> ---
>   xen/arch/riscv/include/asm/page.h | 15 +++++++--------
>   xen/arch/riscv/mm.c               |  9 ++++-----
>   2 files changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
> index b465a90325..1977634efc 100644
> --- a/xen/arch/riscv/include/asm/page.h
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -46,12 +46,11 @@
>   #define PTE_PBMT_NOCACHE            BIT(61, UL)
>   #define PTE_PBMT_IO                 BIT(62, UL)
>   
> -#define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
>   #define PTE_TABLE                   (PTE_VALID)
>   
> -#define PAGE_HYPERVISOR_RO          (PTE_VALID | PTE_READABLE)
> -#define PAGE_HYPERVISOR_RW          (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
> -#define PAGE_HYPERVISOR_RX          (PTE_VALID | PTE_READABLE | PTE_EXECUTABLE)
> +#define PAGE_HYPERVISOR_RO          (PTE_VALID | PTE_READABLE | PTE_ACCESSED)
> +#define PAGE_HYPERVISOR_RW          (PTE_VALID | PTE_READABLE | PTE_WRITABLE | PTE_ACCESSED | PTE_DIRTY)
> +#define PAGE_HYPERVISOR_RX          (PTE_VALID | PTE_READABLE | PTE_EXECUTABLE | PTE_ACCESSED)

These two lines exceed 80 columns, please wrap them, e.g.:

   #define PAGE_HYPERVISOR_RW          (PTE_VALID | PTE_READABLE | 
PTE_WRITABLE | \
                                        PTE_ACCESSED | PTE_DIRTY)

Also, pt_update_entry() sets D on every leaf, while here RO/RX get only
A. Both are valid per the spec, but it means boot-time and runtime
mappings of the same kind of page differ in D. Either set D on RO/RX
too for consistency, or say in the commit message why it isn't done.

>   
>   #define PAGE_HYPERVISOR             PAGE_HYPERVISOR_RW
>   /*
> @@ -174,10 +173,9 @@ static inline bool pte_is_table(pte_t p)
>        * According to the spec if V=1 and W=1 then R also needs to be 1 as
>        * R = 0 is reserved for future use ( look at the Table 4.5 ) so check
>        * in ASSERT that if (V==1 && W==1) then R isn't 0.
> -     *
> -     * PAGE_HYPERVISOR_RW contains PTE_VALID too.
>        */
> -    ASSERT(((p.pte & PAGE_HYPERVISOR_RW) != (PTE_VALID | PTE_WRITABLE)));
> +    ASSERT((p.pte & (PTE_VALID | PTE_READABLE | PTE_WRITABLE)) !=
> +           (PTE_VALID | PTE_WRITABLE));
>   
>       return ((p.pte & (PTE_VALID | PTE_ACCESS_MASK)) == PTE_VALID);
>   }
> @@ -185,7 +183,8 @@ static inline bool pte_is_table(pte_t p)
>   static inline bool pte_is_mapping(pte_t p)
>   {
>       /* See pte_is_table() */
> -    ASSERT(((p.pte & PAGE_HYPERVISOR_RW) != (PTE_VALID | PTE_WRITABLE)));
> +    ASSERT((p.pte & (PTE_VALID | PTE_READABLE | PTE_WRITABLE)) !=
> +            (PTE_VALID | PTE_WRITABLE));

Nit: the indentation differs from the one in pte_is_table() (one extra
space here). As the same expression is now open-coded twice, maybe it
is worth introducing a small helper (e.g. pte_is_reserved_wr()) and
using it in both ASSERT()s?

Thanks.

~ Oleksii

