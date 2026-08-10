Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6328C5AD4E
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 08:50:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387244.1628501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtLiH-0000iM-8s; Mon, 10 Aug 2026 08:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387244.1628501; Mon, 10 Aug 2026 08:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtLiH-0000iF-5g; Mon, 10 Aug 2026 08:50:29 +0000
Received: by outflank-mailman (input) for mailman id 1387244;
 Mon, 10 Aug 2026 08:50:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wtLiF-0000i9-3R
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 08:50:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtLiE-007vGO-19
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 10:50:26 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7990cb-8faa-0a2a0a5109dd-0a2a4509b816-12
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 10:50:25 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7990d1-be1a-0a2a45090019-d155802adc97-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 10:50:25 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4954afac04bso17657615e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 01:50:25 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4995e9ea92csm278572485e9.4.2026.08.10.01.50.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Aug 2026 01:50:24 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786351825; x=1786956625; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v7DOr//1UMzxx+qvWjE8pgs9kDMNMgbOq3Hi6M6TC7U=;
        b=PIkVWlyC5Z2NveOk3zRh6zl9TAajdIZVGZs9uadB0jOK+g+SGkVwgf8x1bEty0N37U
         qBSmAw2VakRIsNyoGDiTg+cDxBT5NOwJs7I94hu66wWbcCB02/JQU1bRP0z/7IfikzEc
         kSP+MbAXk74dYmQJuJ9PWE8jFb3p0SJ4DD947DrfhtrOjEqK5161v7dKu1neQMFhQ9AB
         IRJVntugLJEhSeqSjuD7l3VeNTMiJ6O3f9ZdWj6AFAo/wdDSIW1BEvf0GslEZTMP1tkE
         IFl9AK1aCC8BVO7oZ/Rdncn6falRo1ZF3o/79xquL6Vv+wpGngIJsDgyU7yuMN/jVOKc
         vmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786351825; x=1786956625;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v7DOr//1UMzxx+qvWjE8pgs9kDMNMgbOq3Hi6M6TC7U=;
        b=DliCiWilLdvx6BO+2Q03j2ybSnsVR+sEj95jm7hhpjj44wGY6UvG1D6fGAv3kGi5Wb
         ZHtHZYXSlzh8tYIaOqyZYgxfnlhvX7Q/UW+6e5B3kXGE3rLycMNokoSoXQeMjZK4ITAn
         tv1UexvcWtKV4aAJ8lCCwplEFhLnsOSXau9f/q2PuSkUaB/i5SqhWUsT73jaomOn/s41
         gUEMwV4mJujI4VKSHXj86vPdKqAhcY+47lY+ydtA/itt+RHwE0fxZcBe0shgVgStNQjo
         GURpPZy2Xw611IKYV8KBzhLmhuDpioPOzUQ64Oc3BdITh3JPJL6BxOU82+s0ijijkGEE
         JE0A==
X-Forwarded-Encrypted: i=1; AHgh+RoslYNr19aqX6Ln3VER5AA0NArTUts/InTHZz0oJgTeIVeVIvoQmeVsJfeTI2uZj6YhnZQfjMwafwo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwEuUiUVDxQ9n2UnINSLqv2HanOeWo7TyMi/MAoXnh6DrUdTNha
	LrOQZWblkTAc7A4V5PffwLtV5geCOfT7HViRROwbZKFzosxIUcdt8vC+
X-Gm-Gg: AR+sD13uygAh7FUrjSMepfj8zKQTc1Hqb590JV6oZFzQISAB7l2DNMg/WqAHeZB7Noo
	GB5cW8LeZ09RUFLWcATnXZiUOGDXwlspkJM/2XZ6goUkD8IaH4UHnvon1cG2BpAp46cvGjSA8Mf
	8ca80g0LD5tObO6NKugpml6MK9QRkIjTRNiNRaoUFvSp7ZHnQwkRhUTzPbAw0cFCJAU/IOy3/TU
	F4C9EkrLSFMxddLyVzjYRt/z2oB6OR3B0Kzl12jXw2X45uWT2wn0tRn5tK1tnAdB4cL87/lSnVZ
	5wL0RvzqV/VGyXwCyA1SOaFccoimhN/aIhdK/4JIxOODEji2lLf9Ho2oCcTXRL1PC6jpoHGLAtH
	IXfiCRi6DCaGoXjon9v/XKlwt+iqjkZuheGs3w/TKJAFEo5ypvYGTFUIG1lN664GFbOfvx6FZRz
	A7KZG4hJx2vSEvPD8vcb7oOy8tsvbwvhG6l5wHxoN0pJ6ENFqxx8BHBiFVDyLWImXuKIG/PdJLC
	qPjE6Gkub/JWHuN9ScBtvwLrTskeU0sD6SB9PmswV1UtqJhNExwvzA=
X-Received: by 2002:a05:600c:4e88:b0:495:4491:b8c2 with SMTP id 5b1f17b1804b1-4996194e257mr217755905e9.3.1786351824681;
        Mon, 10 Aug 2026 01:50:24 -0700 (PDT)
Message-ID: <2071e8f2-4994-4b8f-affb-999376250e35@gmail.com>
Date: Mon, 10 Aug 2026 10:50:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/17] xen/riscv: map IMSIC interrupt file for vCPUs
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <254f470ae2e2b2a4affa7c405be8c07a7d8b300e.1784560663.git.oleksii.kurochko@gmail.com>
 <dda2f05b-2965-4fff-92d9-326619be313b@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <dda2f05b-2965-4fff-92d9-326619be313b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1786351825-3A2C4034-AA4EDBFB/10/73395122804
X-purgate-type: spam
X-purgate-size: 6384



On 8/6/26 4:48 PM, Jan Beulich wrote:
> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>> A guest running in VS-mode expects its own IMSIC S-file at offset 0 of its
>> guest-physical IMSIC block. Physically, the guest-file (G-file) assigned to
>> this vCPU lives at a hart-relative offset given by guest_file_id (assigned
>> via the vGEIN allocator). Therefore, imsic_map_guest_file() uses stage-2
>> translation to redirect the guest's fixed per-vCPU GPA page (offset 0) to
>> the specific physical guest-file page.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> The corresponding unmap of the IMSIC interrupt file will be introduced
>> separately when the need arises.
> 
> Doesn't the need exist right away? There is ...
> 
>> @@ -342,6 +344,67 @@ static int __init imsic_parse_node(const struct dt_device_node *node,
>>       return 0;
>>   }
>>   
>> +/*
>> + * Map the physical IMSIC guest interrupt file (G-file) assigned to vCPU v
>> + * into the domain's stage-2 guest-physical address space.
>> + *
>> + * In the machine's physical address space (SPA), each hart's IMSIC
>> + * supervisor-level file (S-file) is located at offset 0 of its address block,
>> + * followed contiguously by GEILEN guest files at offsets of 1, 2, ..., N pages.
>> + *
>> + * Because a guest OS running in VS-mode expects its own supervisor-level
>> + * interrupt file to be at offset 0 of its guest-physical IMSIC block, the
>> + * hypervisor must use stage-2 address translation to map the vCPU's
>> + * guest-physical "supervisor" page (GPA offset 0) to the specific
>> + * physical guest file page (SPA offset guest_file_id) on the physical hart.
>> + *
>> + * Xen pins each vCPU to a pCPU (v->processor) and assigns it a physical
> 
> ... an apparently wrong assumption here: Xen doesn't normally pin vCPU-s.
> When a vCPU migrates between pCPU-s, clearly the mapping referencing the
> page associated with the old hart needs tearing down again.

The word “pin” was incorrect to use here. What I meant is that a vCPU is 
assigned to a pCPU by scheduler and of course it could be re-scheduled 
by a scheduler to another pCPU (maybe for NULL scheduler such 
re-scheduling don't happen...), and after this assignment happens, the 
IMSIC interrupt file mapping needs to be recalculated.

> 
> That said, since the new mapping will appear at the same GFN, the original
> mapping may simply end up being replaced. If such direct replacement is
> legitimate to do, maybe this could actually be mentioned here?

Yes, the GFN isn’t changed for a vCPU. The plan was for 
map_regions_p2mt() to simply replace the corresponding PTE for the GFN, 
which is why imsic_unmap_guest_file() isn’t really needed now.

I will re-phrase this paragraph to:
  * A vCPU runs on the pCPU the scheduler picked for it (v->processor), and
  * the guest file it is given (guest_file_id, from the vGEIN allocator)
  * belongs to that very pCPU's IMSIC. A guest_file_id of 0 indicates 
that no
  * hardware guest file is selected (matching the architectural behavior 
where
  * vGEIN = 0 in the hstatus CSR selects no guest external interrupt 
source),
  * requiring the VS-file to be emulated in software.
  *
  * Consequently the mapping installed here is only valid as long as the 
vCPU
  * stays on that pCPU. When it migrates, a VS-file is acquired on the new
  * pCPU and mapped at the very same GFN, so the stale mapping needs no
  * explicit tear-down: it is simply replaced.

> 
>> + * guest file index (guest_file_id) from the vGEIN allocator. A guest_file_id
>> + * of 0 indicates that no hardware guest file is selected (matching the
>> + * architectural behavior where vGEIN = 0 in the hstatus CSR selects no
>> + * guest external interrupt source), requiring the VS-file to be emulated
>> + * in software.
>> + *
>> + * The base guest-physical address advertised to the guest in the device
>> + * tree matches offset 0 of the vCPU's virtual IMSIC block. Stage-2
>> + * translation ensures that guest supervisor accesses to this page are
>> + * transparently routed to the real hardware VS-file granted to it on
>> + * the current pCPU.
>> + */
>> +int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id)
>> +{
>> +    int res = 0;
>> +    struct domain *d = v->domain;
>> +    unsigned int cpu = v->processor;
>> +    vaddr_t gaddr = imsic_cfg.base_addr + (IMSIC_MMIO_PAGE_SZ * v->vcpu_id);

I just noticed that imsic_cfg.base_addr isn't really good to use here. 
It should be GUEST_IMSIC_S_BASE instead.

>> +    paddr_t paddr;
>> +    unsigned long guest_stride;
>> +
>> +    /* Nothing to map in the case of sw interrupt file. */
>> +    if ( !vsfile_id )
>> +        return res;
>> +
>> +    guest_stride = vsfile_id * IMSIC_MMIO_PAGE_SZ;
> 
> To me "stride" feels the wrong term here, as there's nothing that repeats.
> "offset" likely would be better, assuming the use of this local variable is
> really deemed worth it, as it's used ...
> 
>> +    paddr = imsic_cfg.msi[cpu].base_addr + imsic_cfg.msi[cpu].offset +
>> +            guest_stride;
> 
> ... only here.

I will apply your suggestion.

> 
>> +#ifdef IMSIC_DEBUG
>> +    printk("%s: %pv: ga(%#lx) -> pa(%#lx), cpu(%#x), guest_file_id(%d) "
>> +           "base_addr(%#lx) offset(%#lx)\n", __func__, v, gaddr, paddr, cpu,
>> +           vsfile_id, imsic_cfg.msi[cpu].base_addr, imsic_cfg.msi[cpu].offset);
>> +#endif
>> +
>> +    res = map_regions_p2mt(d, gaddr_to_gfn(gaddr),
>> +                           PFN_DOWN(IMSIC_MMIO_PAGE_SZ), maddr_to_mfn(paddr),
>> +                           arch_dt_passthrough_p2m_type());
>> +    if ( res )
>> +        printk("%s: Failed to map %#lx to the guest at %#lx\n",
>> +               __func__, paddr, gaddr);
> 
> I think you mean to use PRIpaddr with paddr_t (oddly enough there's no
> PRIgaddr).

I’m wondering if it wouldn’t be better to use paddr_t for gaddr as well, 
since technically it is a guest *physical address*. In that case, 
PRIpaddr could be used to print both paddr and gaddr variables.

Also, could this be the reason why PRIgaddr doesn’t exist? Basically, a 
GPA could be considered a physical address, while for a GVA there is 
already PRIvaddr.

Thanks!

Best regards,
  Oleksii

