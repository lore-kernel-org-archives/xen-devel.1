Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 472D8C5B572
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 09:57:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389708.1630353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuSBD-0004uY-Qy; Thu, 13 Aug 2026 09:56:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389708.1630353; Thu, 13 Aug 2026 09:56:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuSBD-0004uQ-NA; Thu, 13 Aug 2026 09:56:55 +0000
Received: by outflank-mailman (input) for mailman id 1389708;
 Thu, 13 Aug 2026 09:56:54 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wuSBB-0004uK-VT
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 09:56:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuSBB-00Ccdy-Bh
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 11:56:53 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7d94df-bab6-0a2a0a5309dd-0a2a45059082-18
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 11:56:53 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7d94e5-4cb1-0a2a45050019-d155802ca445-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 11:56:53 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4994c49f588so7355035e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 02:56:53 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815a5af191sm5155864f8f.19.2026.08.13.02.56.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 02:56:52 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786615013; x=1787219813; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cwdb1JYdUGUcACicI7KC+FpkcuYvtYj8h89cYh8zen4=;
        b=IItf/1ltCqkvtqR4OPCwpBD3Iq3lhj2H9le8twDPphgfNcblk35Krp6vMe200nEe5q
         nTaxOfRtxR1xD+SVBEzqNA+3EMTyOw5Eu0ADIo93k6gW8SkfpyPP4up9uwc8I2zd9Yj3
         MeluqaBkuGUHPp6iEbiTQRF6G4t4e6yJ01cbY6AsvhbMUZVyZTTd+MwDkcnw4nyRJNIt
         teVimsRvegPYdmAP5PozpPuTvpeUjmvXnOi0llteQnWlAxERdvLcM/GMiNU2+vat69wX
         Cd0whK7DAA2xQ/fgepNM323pns0BwXS9G1uPCem7a0+VNM+Pb9E6LMpJvTOFV+A8Lp6e
         D8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786615013; x=1787219813;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cwdb1JYdUGUcACicI7KC+FpkcuYvtYj8h89cYh8zen4=;
        b=PQtU7V5Snydeig2MBqQN9iVjaNFNAw23j+f6vr0W3sgURWoA3JrEwrL7fifrcg2pUQ
         5w4zxtTpOQYPv5gw3hlG2lNpr+poI5xHZQUI6RoIOkirXQfUQ5j0pvFwckYZpN7ANo1s
         zTD9t0Go85wHCaSkglqE7HCFKh8yn4veu31ZXM4qkfbOrNYAcu+zdsCoBczUbTo3bNpM
         CKVJgHYBrCi2ksqJIhuCL7TEV1errs4R9oleLthhNrx3N/pfEEpv+ziz0MgwPO07Caih
         w2IhKHayeLE/niXK+z/79zzjmOMEVLZG1P5+wHTC3373R2ZH25RzOQ4zR/j/nhq48ZbF
         aSqQ==
X-Gm-Message-State: AOJu0YxlxBpVn+e83yY1LtjbtoGeSjTrIeqAGMEtPst9Bv0D6695b/CG
	N89c7Tt/Jf9noFbcibkCurEtm0WjUQge8Ki+hPEl9IfJnm8TdIucFH+7
X-Gm-Gg: AR+sD10WUCcJWBckqYVtvTPGF0KHGye+dyBsGplc+2TDxU/7MnjaeSujevNGZUreX0J
	02G4ZsCBo+1wLFXXSWGHQqrMJ3ZyhVW2Q+In8HMJ2XhkgnLG6zL9vY1o3oALuf4v64bJB0Hqev4
	MFEuRidHrWevBk2vp9aL+kWZkT1dHlVY9b/kH/Gi7yvZMKTGJLQR1YyRqQhY6UjamjzzPIfOEXB
	MlKtTmUr/N5Ij1LEl/TC7graNasrZMitty2TAwTfOnzAAnxVm97aouRJARhHlbqXQXRVUnCgIZy
	dnxLyEakzbFv1sC54HWFffbYGYb9qPfVydNcC4P/SJdlmFlcGM+puov019hVkJxo4nI+oS6oXvd
	wAbdiiGXql/VRMl4zKB/rlv+3yXmWKYIR+aJ5MPEGeaFJieFmgcKz4QufHTHfpCq+aFP0HAN0XX
	2UNc88Jfh67AOF2xDHBGkI9xOjauDcVHQTE+XvouZ9ptqDR6V8B4KNmfe2cQohEUQ0JJk+0ZMqw
	CJThFtyYL9JMXUoXAD7m96FvhjAeTPD2XNmoJbs9/0=
X-Received: by 2002:a05:600c:231a:b0:495:58fe:88e5 with SMTP id 5b1f17b1804b1-4998215464cmr42086965e9.2.1786615012684;
        Thu, 13 Aug 2026 02:56:52 -0700 (PDT)
Message-ID: <fb31ba29-14a3-434e-a3e8-ba4f5057b45c@gmail.com>
Date: Thu, 13 Aug 2026 11:56:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/17] xen/riscv: map IMSIC interrupt file for vCPUs
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <254f470ae2e2b2a4affa7c405be8c07a7d8b300e.1784560663.git.oleksii.kurochko@gmail.com>
 <1786612004.8631fc262581453bbf619ec5b2062170.19ffa5fb46a000c4f3@vates.tech>
 <5ea1202d-7635-46f7-8238-e3d54b588afd@gmail.com>
 <1786614598.8631fc262581453bbf619ec5b2062170.19ffa87495f000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1786614598.8631fc262581453bbf619ec5b2062170.19ffa87495f000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1786615013-F7EB92A1-2DDF0C1C/10/73395122804
X-purgate-type: spam
X-purgate-size: 4164



On 8/13/26 11:49 AM, Baptiste Le Duc wrote:
> On 2026-08-13 11:42 +0200, Oleksii Kurochko wrote:
>>>> +/*
>>>> + * Map the physical IMSIC guest interrupt file (G-file) assigned to vCPU v
>>> Nit: What is this `v`?
>>
>> A function argument. But I will just drop v from the comment.
>>
>>>> + * into the domain's stage-2 guest-physical address space.
>>>> + *
>>>> + * In the machine's physical address space (SPA), each hart's IMSIC
>>>> + * supervisor-level file (S-file) is located at offset 0 of its address block,
>>>> + * followed contiguously by GEILEN guest files at offsets of 1, 2, ..., N pages.
>>>> + *
>>>> + * Because a guest OS running in VS-mode expects its own supervisor-level
>>>> + * interrupt file to be at offset 0 of its guest-physical IMSIC block, the
>>>> + * hypervisor must use stage-2 address translation to map the vCPU's
>>>> + * guest-physical "supervisor" page (GPA offset 0) to the specific
>>>> + * physical guest file page (SPA offset guest_file_id) on the physical hart.
>>>> + *
>>>> + * Xen pins each vCPU to a pCPU (v->processor) and assigns it a physical
>>>
>>>
>>>> + * guest file index (guest_file_id) from the vGEIN allocator. A guest_file_id
>>>> + * of 0 indicates that no hardware guest file is selected (matching the
>>>> + * architectural behavior where vGEIN = 0 in the hstatus CSR selects no
>>>> + * guest external interrupt source), requiring the VS-file to be emulated
>>>> + * in software.
>>>> + *
>>>> + * The base guest-physical address advertised to the guest in the device
>>>> + * tree matches offset 0 of the vCPU's virtual IMSIC block. Stage-2
>>>> + * translation ensures that guest supervisor accesses to this page are
>>>> + * transparently routed to the real hardware VS-file granted to it on
>>>> + * the current pCPU.
>>>> + */
>>>> +int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id)
>>>> +{
>>>> +    int res = 0;
>>>> +    struct domain *d = v->domain;
>>>> +    unsigned int cpu = v->processor;
>>>> +    vaddr_t gaddr = imsic_cfg.base_addr + (IMSIC_MMIO_PAGE_SZ * v->vcpu_id);
>>>
>>> The variable holds a guest-physical address, so vaddr_t is the wrong
>>> type should be either paddr_t or gaddr_t.
>>
>> Agree, paddr_t will be better what was mentioned in thread with Jan B.
>>
>>>
>>>> +    paddr_t paddr;
>>>> +    unsigned long guest_stride;
>>>> +
>>>> +    /* Nothing to map in the case of sw interrupt file. */
>>>
>>> There is no software interrupt file implementation in this series, patch 11
>>> turns the non-MSI path into a BUG_ON(). So "vsfile_id == 0" today means "this
>>> vCPU gets no external interrupts at all and nothing tells anybody". Worth
>>> saying so plainly here rather than implying a fallback exists.
>>
>> I would ask then different question will this function change when IMSIC
>> interrupt file support will be added? I think - no as in the case of
> Did you forget s/w word? If not it's weird as IMSIC interrupt file is
> the current topic of this patch series.
>> IMSIC interrupt file we don't need any stage-2 mapping. So here it is
> here too.

Yes, sorry, I missed s/w word.

>> just a check that nothing should be mapped for non-hw-assisted interrupt
>> files.
>>
>>>
>>>> +    if ( !vsfile_id )
>>>> +        return res;
>>>> +
>>>> +    guest_stride = vsfile_id * IMSIC_MMIO_PAGE_SZ;
>>>
>>>
>>>> +
>>>> +    paddr = imsic_cfg.msi[cpu].base_addr + imsic_cfg.msi[cpu].offset +
>>>> +            guest_stride;
>>>
>>>
>>>> +
>>>> +#ifdef IMSIC_DEBUG
>>>
>>>> +    printk("%s: %pv: ga(%#lx) -> pa(%#lx), cpu(%#x), guest_file_id(%d) "
>>>> +           "base_addr(%#lx) offset(%#lx)\n", __func__, v, gaddr, paddr, cpu,
>>>> +           vsfile_id, imsic_cfg.msi[cpu].base_addr, imsic_cfg.msi[cpu].offset);
>>>> +#endif
>>>> +
>>>> +    res = map_regions_p2mt(d, gaddr_to_gfn(gaddr),
>>>> +                           PFN_DOWN(IMSIC_MMIO_PAGE_SZ), maddr_to_mfn(paddr),
>>>> +                           arch_dt_passthrough_p2m_type());
>>>> +    if ( res )
>>>> +        printk("%s: Failed to map %#lx to the guest at %#lx\n",
>>>

~ Oleksii


