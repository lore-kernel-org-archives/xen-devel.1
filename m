Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E69CA5FC7
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 14:38:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437380.1656267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBvRQ-0003cQ-LE; Wed, 30 Sep 2026 14:37:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437380.1656267; Wed, 30 Sep 2026 14:37:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBvRQ-0003cJ-I2; Wed, 30 Sep 2026 14:37:52 +0000
Received: by outflank-mailman (input) for mailman id 1437380;
 Wed, 30 Sep 2026 14:37:50 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBvRO-0003bx-Hb
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 14:37:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBvRN-00HUbi-R7
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:37:49 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd1eb7-8faa-0a2a0a5109dd-0a2a4508ae9c-14
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 16:37:49 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd1ebd-f659-0a2a45080019-4a7de18cb101-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 16:37:49 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49fff72474fso23706705e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 07:37:49 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01ca310dbsm11836705e9.0.2026.09.30.07.37.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 07:37:48 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790779069; x=1791383869; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PEVXC6txBmRIpRNYGZRW3Vk8SYDMUdxPR8+kI5kPnOQ=;
        b=PhWwv5Bx+kOenX4SVTp1NSvAz+AAaYlMBHOB3TUyGZ1WakNE89123Svv1kk1OL4dpe
         SWs75Qia4iZj+BLv5kie91AUrPjUYkvN6Uw57iCbtG5bPbKoiTyOOaWhTF0MrExaTv5o
         iy0zddyQHrvB1NimBofESYJl8yICQlxaYNH+AhVF1ZvF/UZgcf8inYZWIh9cBGH/HsvR
         xm1cTav2/ZRPKEE1u4qJajUseQxVEAp87PdbNxLOFcT3H6YAvdPf2wLhXogHy3IcOBN6
         Z/l2D/HLC9vBraAJXuJf8m1h8tC9GEmkPXqvrjYwNTkdoUFA7PQSoPJbpFbRxUvTEnnV
         9N8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779069; x=1791383869;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PEVXC6txBmRIpRNYGZRW3Vk8SYDMUdxPR8+kI5kPnOQ=;
        b=DFMeduNEYW4j1YYN4h5eCqdLzmuRy/zKLc505f3BtG5YQj5ubiBHzhpJwV4Ebw27fT
         nMRmiVJqj7k2tnifJ858fdTEJuSLBIQsUgozeKSCoCqG6zoYWNgyvo3Cveb+r6zMGGnt
         GHP+y9Ipqfy+7Me2CaQ9mUrJUQVZoOfn1YJpTH/6uX4oK+YmMgSFsiwWLOwpsQPU3Vx8
         3R76gljqGWjfbzfk3f+KWlARjUrnPvyHbNUZuP0S6WIPahUurk7LL2kiDkaWvjLJq0H0
         7wuNNt3W5gIQ6lsDOX48k5sUEo+4avRWjcVDl+eJYOc4Gy1LjQ4hyrlG/NHNHpxCBoOv
         Vgmw==
X-Forwarded-Encrypted: i=1; AKwUvBxj8XAdPzKq1cFIklydwDfm9wghfgS2o6Z0Lteq9ymmvoqtQB3H+/aT8IX5qdUQlOCwa2qO08LK9SM=@lists.xenproject.org
X-Gm-Message-State: AFuF++mxAHZ0+29qWh5FfSxMj4brkdZ7LFKUsiULsdzz25k8o9qkJzUM
	lCeLFZoUUF+fOHducaj34hTtl4Q+tGa6aaJ3Nkd1lOCH1JUuaW3K0K8b
X-Gm-Gg: AYBFou0j+SmAGuo10WMGbhj/qYPdIt1A0jECWhiM6FtpAdQdLXL6qje6Vr0znx01WOJ
	I5si2oyOIrfdg88iqGvjIHMqsTZkWx8u4BAEil+wzPLedQKvbfUTIKhIixJnna8X5cyzEg165hs
	9wTpIZGW6bXjNBIeZFH2rPHA2FSZsl/pzdPI+SLzAgkUkUlP5XjCxvTghIjaZuHzpltQEFcfEmQ
	R0GOGo5BAweSNcJVqiq+WiqQTrPUqZRFUldZ+2RYQ8BDu68eF6AmF4MJgNTpGiPA2/+B4b4NceD
	rYWt3iOwQ70Lx1VjdTl/gQ1kn5v3gu8wAg2i/TIEl1X7HCqbLfaBMJ1iQsYfv2LK/ZePM9udm8e
	Ed40253RnLLrlCmmLScomUpBBPpX4RpRbJb6kph4ikYOL7kXL3Gc1XjpOKmLHwiqlq4SMODwVkQ
	9ZxhUCqgKPLB48T90pOf4IQW7ydm63D4+Lnx0fzpop42LhuJ9j5n+bH4pF53MgAeM7ptaM+8GXL
	GCINKiA3GeAk4tDVUrghctCsDFsdwopRThjjJZclFQyiQsCdQ==
X-Received: by 2002:a05:600c:5391:b0:4a0:1559:bafd with SMTP id 5b1f17b1804b1-4a01aff068emr25813525e9.8.1790779068978;
        Wed, 30 Sep 2026 07:37:48 -0700 (PDT)
Message-ID: <a69d8b8b-df60-40bb-b2cd-2c876a4b4829@gmail.com>
Date: Wed, 30 Sep 2026 16:37:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] xen/riscv: fix A/D bits in Xen's page-table
 mappings
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <1790699381.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@vates.tech>
 <1790699586.8631fc262581453bbf619ec5b2062170.1a0ee034220000b504@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1790699586.8631fc262581453bbf619ec5b2062170.1a0ee034220000b504@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1790779069-CCB7187B-480391EB/10/73395122804
X-purgate-type: spam
X-purgate-size: 7367



On 9/29/26 6:32 PM, Baptiste Le Duc wrote:
> Xen does not handle page faults caused by clear A/D bits, so it presets
> them when creating PTEs. pt_update_entry() does so, but
> setup_initial_mapping() (the boot page tables) and arch_pmap_map() (the
> fixmap) build leaf PTEs directly without going through it. 

If I am not mistaken then not all places are mentioned here:

... does so, but three places
build leaf PTEs directly without going through it:
setup_initial_mapping() (the boot page tables), check_pgtbl_mode_support()
(the temporary root entry used to probe SATP mode support) and
arch_pmap_map() (the fixmap).

Without Svadu,
> both would fault on first access.

After this I think it makes sense to add also about 
check_pgtbl_mode_support():

For check_pgtbl_mode_support() the fault happens on the
instruction fetch right after the CSR_SATP write, before any trap
handler is set up.

> 
> Add PTE_ACCESSED and PTE_DIRTY to PAGE_HYPERVISOR_RO, and build
> PAGE_HYPERVISOR_RW and PAGE_HYPERVISOR_RX on top of it. PTE_DIRTY is set in
> all cases for consistency with pt_update_entry() which sets it at runtime.
> 
> This fixes arch_pmap_map() for free, since it already builds its PTE from
> PAGE_HYPERVISOR_RW. Switch setup_initial_mapping() to use these macros for
> its default, text and rodata permissions, and for the temporary root entry
> built by check_pgtbl_mode_support(), instead of the equivalent raw bit
> lists.

... but you added PTE_ACCESSED | PTE_DIRTY to PAGE_HYPERVISOR_* so it 
isn't really "equivalent raw bit lists".

So it seems like this part should be dropped. My suggestion is ...


  The latter drops PTE_WRITABLE, going from RWX to RX, but this is
> harmless, as that entry only has to make the current instruction stream
> fetchable between the two CSR_SATP writes used to probe SATP mode support,
> and nothing writes through it.

...

This fixes arch_pmap_map() for free, since it already builds its PTE 
from PAGE_HYPERVISOR_RW. Switch setup_initial_mapping() to use these 
macros for its default, text and rodata permissions, and 
check_pgtbl_mode_support() to use PAGE_HYPERVISOR_RX for its temporary 
root entry. The latter drops PTE_WRITABLE, going from RWX to RX, but 
this is harmless, as that entry only has to make the current instruction 
stream fetchable between the two CSR_SATP writes, and nothing writes 
through it.

> 
> Drop the now-redundant PTE_LEAF_DEFAULT, since converting the last
> open-coded site above leaves it with no user outside page.h itself.
> 
> pte_is_table() and pte_is_mapping() both assert that a PTE doesn't use one
> of the two reserved encodings, (V=1, W=1, R=0) and (V=1, X=1, W=1, R=0), by
> masking it with PAGE_HYPERVISOR_RW. Now that PAGE_HYPERVISOR_RW also
> carries A and D, a reserved PTE with A or D set would no longer be caught.
> Mask with the V, R and W bits explicitly instead, and factor the check out
> into pte_is_reserved().
> 
> Fixes: e66003e7be19 ("xen/riscv: introduce setup_initial_pages")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> ---
> Changes since v2:
> - add fixes commit ref.
> - add A/D bits to PAGE_HYPERVISOR_RO and derive PAGE_HYPERVISOR_RW/RX
>    from it for consistency with runtime.
> - introduce pte_is_reserved() to factor out the reserved-encoding assert
>    shared by pte_is_table() and pte_is_mapping().
> - reword commit title
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
>   xen/arch/riscv/include/asm/page.h | 33 +++++++++++++++++----------------
>   xen/arch/riscv/mm.c               |  9 ++++-----
>   2 files changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
> index b465a90325..7772e2f572 100644
> --- a/xen/arch/riscv/include/asm/page.h
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -46,12 +46,12 @@
>   #define PTE_PBMT_NOCACHE            BIT(61, UL)
>   #define PTE_PBMT_IO                 BIT(62, UL)
>   
> -#define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
>   #define PTE_TABLE                   (PTE_VALID)
>   
> -#define PAGE_HYPERVISOR_RO          (PTE_VALID | PTE_READABLE)
> -#define PAGE_HYPERVISOR_RW          (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
> -#define PAGE_HYPERVISOR_RX          (PTE_VALID | PTE_READABLE | PTE_EXECUTABLE)
> +#define PAGE_HYPERVISOR_RO          (PTE_VALID | PTE_READABLE | \
> +                                     PTE_ACCESSED | PTE_DIRTY)
> +#define PAGE_HYPERVISOR_RW          (PAGE_HYPERVISOR_RO | PTE_WRITABLE)
> +#define PAGE_HYPERVISOR_RX          (PAGE_HYPERVISOR_RO | PTE_EXECUTABLE)
>   
>   #define PAGE_HYPERVISOR             PAGE_HYPERVISOR_RW
>   /*
> @@ -161,31 +161,32 @@ static inline bool pte_is_valid(pte_t p)
>    *      X W R Meaning
>    *      0 0 0 Pointer to next level of page table.
>    *      0 0 1 Read-only page.
> - *      0 1 0 Reserved for future use.
> + *      0 1 0 Reserved for future use. [1]
>    *      0 1 1 Read-write page.
>    *      1 0 0 Execute-only page.
>    *      1 0 1 Read-execute page.
> - *      1 1 0 Reserved for future use.
> + *      1 1 0 Reserved for future use. [2]
>    *      1 1 1 Read-write-execute page.
> + *
> + *   So if V=1 and W=1 then R also needs to be 1 as R = 0 is reserved for
> + *   future use ([1], [2]).
>    */
> +static inline bool pte_is_reserved(pte_t p)
> +{
> +    return (p.pte & (PTE_VALID | PTE_READABLE | PTE_WRITABLE)) ==
> +           (PTE_VALID | PTE_WRITABLE);
> +}
> +
Nit:

The function checks specifically for reserved R/W/X permission bit 
encodings where W=1 and R=0 (encodings 0b010 and 0b110 in Table 25 
"Encoding of PTE R/W/X fields" of the RISC-V Privileged ISA 
Specification). Per the specification, writable pages must also be 
marked readable (W=1 requires R=1 for valid leaf PTEs).

However, naming this function `pte_is_reserved()` can be ambiguous 
because the RISC-V PTE format contains several other types of reserved 
fields:
1. Bits 54–60 (and bit 63 without Svnapot) are "Reserved for future 
standard use".
2. Bits 9:8 (RSW) are "Reserved for supervisor software" and ignored by 
hardware.
3. PBMT = 0b11 is "Reserved for future standard use" under the Svpbmt 
extension.

To avoid confusion between reserved R/W/X permission encodings and 
reserved PTE bitfields/attributes, it would be much clearer to make the 
function name explicitly reflect that it checks for reserved R/W/X 
permission encodings.

My suggestion will be pte_has_reserved_rwx() or pte_has_reserved_perms().

I am not going to insist on the name change (but it would be nice to 
have) so but with commit message updated:
  Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

