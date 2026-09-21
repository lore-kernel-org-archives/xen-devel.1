Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA19C982E6
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 14:35:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427617.1650416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8f77-0000uM-0e; Mon, 21 Sep 2026 14:35:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427617.1650416; Mon, 21 Sep 2026 14:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8f76-0000uF-U8; Mon, 21 Sep 2026 14:35:24 +0000
Received: by outflank-mailman (input) for mailman id 1427617;
 Mon, 21 Sep 2026 14:35:23 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x8f75-0000u9-2C
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 14:35:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8f72-001Wx0-FB
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 16:35:20 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab1409c-2eae-0a2a0a5409dd-0a2a450cc2ea-26
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 16:35:20 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab140a7-f479-0a2a450c0019-4a7de14cad5b-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 16:35:19 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-485ac898fa4so2683903f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 07:35:19 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48724589c02sm22699876f8f.24.2026.09.21.07.35.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 07:35:18 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790001319; x=1790606119; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zKWmacSRjEOWwCwtTdSF25dMhGAD5KW/oGGRtVIBG5I=;
        b=OXKLfgMSEvaRGdH6J46tlV0kJTNe2lc1FN++h9jQWIDqQEvk4gjPnIo6n78OAXIUWT
         jVfddJtZhkzAd+Q9Ka/Td81LCCqxb+I+b0t6zFbnmQ1IUPF/vs5cZB+NisrGbmkNbSUG
         YzHiW6SDP4PS+4ynKsiL2UWAF7poNVGodZVLeTFXGF7zmXcnD/JysbF6T3LQPSTjpbfF
         xOSVvYB3Q4Ojq/JFWCru/NgtMkVc1+RWT5gC0pbh5+Fg1sZMKIVGfo/6uDwRGGnp95a7
         a44y/hd81eMWh/f9VfCqX76bXzxE8wsjq4jwvVJ4k08P1/7IDyFJdgXo2Ej+5cn3vPtO
         PeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790001319; x=1790606119;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zKWmacSRjEOWwCwtTdSF25dMhGAD5KW/oGGRtVIBG5I=;
        b=a/kI67TLFgCl36pve/Fb5u/k0O+fz2ejAIIr/qjG1VnxdDuSqzocbCvbUmsm8Xkywy
         KqrVzHrWmdcQ5xDH3QapkIoPfy72eHYpwh84ZhnPtV8HOMNq0RzRDNFPQQI892oglaw7
         zejfcP/WpkxXvtk78rDPS4f5GtFsolC2F2LuifGHZit8uBM0eAU4bRsSyta/xOvHlEnU
         3mAuxH5Yqu3JVQ1teutZAiye6EfqdgEjnVedv2ZyvEDbjptjb84hVAsjldH6gKeiQScM
         RDA6Q/ILRRdb+F8PSepmJaW6olcmcdp3GegBPdEFC2AmwfnaTSHSEHyW9Uu3u6jVF1LU
         pEPA==
X-Forwarded-Encrypted: i=1; AKwUvByFRgeiJl3Fk1qyE/fQNv2bdHTsTKCTgWifdhZIpLKhaA9+r5eGHz9geLzXi4hfs2yLDKG/+W54Z0I=@lists.xenproject.org
X-Gm-Message-State: AFuF++mYqi3ECN84mvyW8F748EMv+lkf/xai4oJTazvXei5Q2ztyrNpu
	WCif/l3AAeb5ba1TNBiVngA2itI0llmLb1RKcrwhwwRmD9ERp4fPLlW5
X-Gm-Gg: AYBFou2J0eegqGA0ILi4IF3gvHJNq4ET6URuDOsGTGUQ4vfyLCL1FbDoBeWtsDK6IDb
	kFEjqzOkPVTG7AH1DWGeQwNjUCPi/pRKR8/ZvKd/yFvSp7xvsd0+9QOKtcNg/QYFuOZz2S+9Wq3
	H+VFsMtGwxTqYRuDMguwM4o0kWPlTA36IIKsct5T+9Ar+PkCnGHDtAGwGKIIiDOFwDohcSag2P0
	FBAAM2VlmrCIxStX6lpINEaXGeLq7udLzrEASBATyRvntpA+ibG35FbT1GAyHRW5H1lZwSKQt4R
	r9SFdG3HLI2it7Vui+nAT64KS9UOYkcmPTkcJ4tWdjWB3FIltaPprj2rM8H+Q53N1TkUtP34WPU
	P8XTAtiXjXXKPYwPpThLYyWA9HzsaSk+0Uj2f35O8JbTupMI/dLi/kiyeFIQHqm4d5bWafEovve
	3Ka4++JeLJ9/GMfd/r63pxzj3NrEiQ7BgaEynQu5dtq/VmKQMXg192hnHKBFujUARFNQnsIw7Al
	htsc8TJ8+sxhheyj1+O5YOuamt9xVDgUiZUwSlew6qK3ZJ9GQ==
X-Received: by 2002:a05:6000:220e:b0:487:9a8:9f31 with SMTP id ffacd0b85a97d-4871e368258mr16602561f8f.41.1790001319199;
        Mon, 21 Sep 2026 07:35:19 -0700 (PDT)
Message-ID: <4c3a1826-fb74-4907-add5-4e06d6094995@gmail.com>
Date: Mon, 21 Sep 2026 16:35:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 37/39] xen/riscv: map IMSIC interrupt file for vCPUs
To: Jan Beulich <jbeulich@suse.com>
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
 <b0421306-a1a9-4155-9dfc-4b8147db0d9b@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b0421306-a1a9-4155-9dfc-4b8147db0d9b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1790001319-034D7A5B-BAF1555C/10/73395122804
X-purgate-type: spam
X-purgate-size: 3850



On 9/21/26 1:36 PM, Jan Beulich wrote:
> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>> A guest running in VS-mode expects its own IMSIC S-file at offset 0 of its
>> guest-physical IMSIC block. Physically, the guest-file (G-file) assigned to
>> this vCPU lives at a hart-relative offset given by guest_file_id (assigned
>> via the vGEIN allocator). Therefore, imsic_map_guest_file() uses stage-2
>> translation to redirect the guest's fixed per-vCPU GPA page (offset 0) to
>> the specific physical guest-file page.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> perhaps with ...
> 
>> @@ -537,9 +538,72 @@ void cf_check imsic_ctxt_switch_to(struct vcpu *v)
>>       read_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
>>   }
>>   
>> +/*
>> + * Map the physical IMSIC guest interrupt file (G-file) assigned to vCPU
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
>> + * A vCPU runs on the pCPU the scheduler picked for it (v->processor), and
>> + * the guest file it is given (guest_file_id, from the vGEIN allocator)
>> + * belongs to that very pCPU's IMSIC. A guest_file_id of 0 indicates that no
>> + * hardware guest file is selected (matching the architectural behavior where
>> + * vGEIN = 0 in the hstatus CSR selects no guest external interrupt source),
>> + * requiring the VS-file to be emulated in software.
>> + *
>> + * Consequently the mapping installed here is only valid as long as the vCPU
>> + * stays on that pCPU. When it migrates, a VS-file is acquired on the new
>> + * pCPU and mapped at the very same GFN, so the stale mapping needs no
>> + * explicit tear-down: it is simply replaced.
>> + *
>> + * The base guest-physical address advertised to the guest in the device
>> + * tree matches offset 0 of the vCPU's virtual IMSIC block. Stage-2
>> + * translation ensures that guest supervisor accesses to this page are
>> + * transparently routed to the real hardware VS-file granted to it on
>> + * the pCPU it currently runs on.
>> + */
>>   int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id)
>>   {
>> -    return -EOPNOTSUPP;
>> +    struct domain *d = v->domain;
>> +    unsigned int cpu = v->processor;
>> +    paddr_t gaddr = GUEST_IMSIC_S_BASE + (IMSIC_MMIO_PAGE_SZ * v->vcpu_id);
>> +    paddr_t paddr, guest_offset;
>> +    int res;
>> +
>> +    /* Nothing to map in the case of sw interrupt file. */
>> +    if ( !vsfile_id )
>> +        return 0;
>> +
>> +    guest_offset = vsfile_id * IMSIC_MMIO_PAGE_SZ;
>> +
>> +    paddr = imsic_cfg.msi[cpu].base_addr + imsic_cfg.msi[cpu].offset +
>> +            guest_offset;
>> +
>> +#ifdef IMSIC_DEBUG
>> +    printk(XENLOG_DEBUG
>> +           "%s: %pv: ga(%#"PRIpaddr") -> pa(%#"PRIpaddr"), cpu(%u), "
>> +           "guest_file_id(%u) base_addr(%#"PRIpaddr") offset(%#lx)\n",
>> +           __func__, v, gaddr, paddr, cpu, vsfile_id,
>> +           imsic_cfg.msi[cpu].base_addr, imsic_cfg.msi[cpu].offset);
> 
> ... this also converted to dprintk(), or at least using XENLOG_G_DEBUG.

I will convert to dprintk().

~ Oleksii

