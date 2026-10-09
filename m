Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3001DCA6019
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2026 09:43:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444181.1661156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xF78Z-0002In-3H; Fri, 09 Oct 2026 09:43:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444181.1661156; Fri, 09 Oct 2026 09:43:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xF78Z-0002Ig-03; Fri, 09 Oct 2026 09:43:35 +0000
Received: by outflank-mailman (input) for mailman id 1444181;
 Fri, 09 Oct 2026 09:43:33 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xF78X-0002Ia-Be
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 09:43:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xF78W-001BU3-9c
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 11:43:32 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ac8b73d-bab6-0a2a0a5309dd-0a2a450bb406-28
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 11:43:32 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ac8b744-b7e8-0a2a450b0019-d155dd2fbd91-3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 11:43:32 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-486e8faff03so2113356f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 02:43:32 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9acfa28sm3043407f8f.51.2026.10.09.02.43.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2026 02:43:31 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791539012; x=1792143812; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QkYQAmoOaC2itQPGRrtVr/J2+wfI4WHHCUFX5ylxF7I=;
        b=IgjSus313JlGXnm/mzMKz5L1QhBVc5HfXP4aZuhh1dzOEaXJwBJqnDO/k0oYB0DdT7
         8hQdVm1dHiksQVyfnZIvTcQbuv6Iw7sdvXcHaXlFEmar6MVLY/yXijZ9VLCv5tgAaXyN
         nEVFUjhmOwA1faTYpX+/NroectaSeVb+seMjZH/VWSZFLvjpKs/SkJ9q2TrGAXGPxWOD
         IaPYKZHqIu5a9z2qN71PKcyClv82F34+/5MwueXInjTOeBPJrMpA7PP7nLKCs21OvYkM
         /kNA5IC66qozGdgYR4GXvmjoEgEvaNMvgl2Cq3VKrLX3f/n+CXhkkvfuID3OCiuU3zzm
         nfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791539012; x=1792143812;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QkYQAmoOaC2itQPGRrtVr/J2+wfI4WHHCUFX5ylxF7I=;
        b=AbgsdPUp5SM7sugrQM7ORslpXMPZ/No8EWBhAJ9bo6pt03lbVqlfg5oJGS8l8EWu4j
         fN8eWPmR5sQL5zxmLMtfIam8UCYW1afUCZq2NuH3OokNjhY/BIFy1kQFzfLNDxS5Jgyi
         ReHm2l8rqUyB1LrxF4xXHIdjSRLq0EMEii2zNAzFRiFGXG/Jf/weR7ootB+0J74OvgqA
         R4IEopG99JGE09/lTKMRrDWC2e7jGsIIOItJj6M7denp8dPMoJ1goeIRSlnMySCG0PKG
         ef8iMII8SB2WeC5z+Ai++2IhuOk5jqpYl62JYtGAZwarz4lCRPqgg7QfRxVOnmxa2Vi4
         kkJw==
X-Forwarded-Encrypted: i=1; AKwUvBxzXvbtZs7y8P5mvMTBVutTV9+OGC5bAqeTg6lD+V0T0Hc4DWM20ceWp2cuWFLevLn4F+hejI+UaD4=@lists.xenproject.org
X-Gm-Message-State: AFuF++kHIsWx3ITBII/bG1q2mXeYp5CxmKglJlUB1L3s6Bxz5G8l6ac1
	490VzyAqiZ+/F6xtVH5Z8mYadEg3nGRPLYTuOidWG9fs2+vZ/9QzRa7p
X-Gm-Gg: AYBFou3rfUk3y+xRDAJ5Ip68tkleYhdSt2Nq/08VzmVgjSHEJxGtfglBwXLaUU0nxXE
	Aozvc0Fxe2eDr28bVnAHOKqNywn6n69Yx0W/lvnJpvyfrHbUYtl4COyyX6scCAs6dcpuHE44QLe
	BnRkagnEABxYAlEX7/Cd65mnROgPQRsG6w80rGvIPjprrfXcK1NRImDBzq7uycmqwGk8bSlmq0r
	PGP3DF8OwFsiY2FZVh6PZbk9I6Ws5qi2SYWDzkmwdmyxNxlQeW/tIEmIpa2LZ3aL6oZXc+uQ30n
	9HboV7gXrBAWjFvYVRp03XR+McYArnt7conZ9X6xRnLsoFsgyVyjjXnH5Fs4YnpKP9nQLvrHp4h
	CMroMHlGhtcS8gIjnORTfxQfY0Zb6DK1EOy+bjzZcsavy9T4SigQQ6CVYXLBD5KBlc81BPWxtbA
	ssufedkwLd8FtYg6hhpk7al7KGjBS2npyPiOowjP1UlnRRvpoTdgCEOL7c0k10q9+Eet2S+cD0H
	H3I93POzwZJMnhM0aZP6OvZjByukop25jmc/zzKat6G3Y8AQQ==
X-Received: by 2002:a05:600c:3146:b0:49d:1fd8:b874 with SMTP id 5b1f17b1804b1-4a18e4af3a8mr25219235e9.19.1791539011531;
        Fri, 09 Oct 2026 02:43:31 -0700 (PDT)
Message-ID: <80c6fcbd-f411-4869-a71f-5be8e2d62b82@gmail.com>
Date: Fri, 9 Oct 2026 11:43:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/device-tree: move discard_initial_modules() to
 common code
To: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
References: <20261001111630.112472-1-oleksii.kurochko@gmail.com>
 <20261001111630.112472-3-oleksii.kurochko@gmail.com>
 <f15c39d3-b4f1-4fa8-bd2e-fd10d33b698f@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f15c39d3-b4f1-4fa8-bd2e-fd10d33b698f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1791539012-1B2DC9EA-59850B9B/10/73395122804
X-purgate-type: spam
X-purgate-size: 3910



On 10/8/26 1:19 PM, Orzel, Michal wrote:
> 
> 
> On 01-Oct-26 13:16, Oleksii Kurochko wrote:
>> Everything discard_initial_modules() touches is already common code:
>> bootinfo.modules, using_static_heap and fw_unreserved_regions(). Move it
>> out of Arm into common/device-tree/bootinfo.c, next to the boot allocator
>> handling of the same memory, and declare it in xen/bootinfo.h, so that
>> other device-tree based architectures can reuse it instead of growing a
>> copy of their own.
>>
>> The arch-specific remove_early_mappings() is not moved along with it:
>> how the early FDT mapping is torn down is up to the architecture. As the
>> DTB is one of the boot modules being released, the mapping has to go once
>> they are discarded, so call it from start_xen() right after
>> discard_initial_modules(), which keeps the common function free of any
>> arch dependency.
>>
>> While moving it, use unsigned int for the loop counter and replace the
>> "goto out" by a plain return, as there is nothing left to do at the label.
>>
>> No functional change.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>>   xen/arch/arm/include/asm/setup.h  |  2 --
>>   xen/arch/arm/setup.c              | 35 ++-----------------------------
>>   xen/common/device-tree/bootinfo.c | 30 ++++++++++++++++++++++++++
>>   xen/include/xen/bootinfo.h        |  8 +++++++
>>   4 files changed, 40 insertions(+), 35 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
>> index c491c567298f..02fdf2b56c9c 100644
>> --- a/xen/arch/arm/include/asm/setup.h
>> +++ b/xen/arch/arm/include/asm/setup.h
>> @@ -40,8 +40,6 @@ int acpi_make_efi_nodes(void *fdt, struct membank tbl_add[]);
>>   
>>   void create_dom0(void);
>>   
>> -void discard_initial_modules(void);
>> -
>>   void init_pdx(void);
>>   void setup_mm(void);
>>   
>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>> index 16f899dff57b..a65c3d2a655e 100644
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -210,39 +210,6 @@ static void __init processor_id(void)
>>       processor_setup();
>>   }
>>   
>> -void __init discard_initial_modules(void)
>> -{
>> -    struct boot_modules *mi = &bootinfo.modules;
>> -    int i;
>> -
>> -    /*
>> -     * When using static heap feature, don't give boot_modules memory back to
>> -     * the heap allocator
>> -     */
>> -    if ( using_static_heap )
>> -        goto out;
>> -
>> -    for ( i = 0; i < mi->nr_mods; i++ )
>> -    {
>> -        paddr_t s = mi->module[i].start;
>> -        paddr_t e = s + PAGE_ALIGN(mi->module[i].size);
>> -
>> -        if ( mi->module[i].kind == BOOTMOD_XEN )
>> -            continue;
>> -
>> -        if ( !mfn_valid(maddr_to_mfn(s)) ||
>> -             !mfn_valid(maddr_to_mfn(e)) )
>> -            continue;
>> -
>> -        fw_unreserved_regions(s, e, init_domheap_pages, 0);
>> -    }
>> -
>> -    mi->nr_mods = 0;
>> -
>> - out:
>> -    remove_early_mappings();
>> -}
>> -
>>   /* Relocate the FDT in Xen heap */
>>   static void __init relocate_fdt(const void **dtb_vaddr, size_t dtb_size)
>>   {
>> @@ -509,6 +476,8 @@ void asmlinkage __init noreturn start_xen(unsigned long fdt_paddr)
>>        */
>>       discard_initial_modules();
> The comment above is now duplicated with the one you added in xen/bootinfo.h.
> I'd drop it from here (can be done on commit).

I will drop it in v2 (if it won't merged at the moment when I will start 
address the comments for this patch series).

> 
> Other than that:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks!


> 
> NIT for the future: if you send a series of patches, please move the fixes/code
> movement changes at the beginning of the series.
> 

I will take into account that in the future.

~ Oleksii


