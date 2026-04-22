Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E079F9EDCD
	for <xen-devel@archiver.kernel.org>; Wed, 22 Apr 2026 13:30:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1290565.1570126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFXeU-0002Zp-Fe; Wed, 22 Apr 2026 13:30:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290565.1570126; Wed, 22 Apr 2026 13:30:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFXeU-0002ZE-Cd; Wed, 22 Apr 2026 13:30:02 +0000
Received: by outflank-mailman (input) for mailman id 1290565;
 Wed, 22 Apr 2026 13:30:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wFXeS-0002P1-UD
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 13:30:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFXeS-00BEmx-An
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 15:30:00 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e8cd43-2eae-0a2a0a5409dd-0a2a4509e23a-32
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 15:30:00 +0200
Received: from [209.85.208.178] (helo=mail-lj1-f178.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e8cd57-2497-0a2a45090019-d155d0b2a8ef-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 15:30:00 +0200
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-38dd9f0fdc6so67959481fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 06:30:00 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4187e7a3fsm4393165e87.59.2026.04.22.06.29.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 06:29:58 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776864599; x=1777469399; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H4KxM0NFypP5msvC8Vz7WTim2hOA+uexqxg991xDo9I=;
        b=IXcbO2cMWgIHPucxbE/flhB1u+Yx8w3OywQxp/06AqIZEZ1e2yVve5q3uYpa640nKb
         BXOCApKVcIVKSxPfYo29L57BzNYPC8jQOQYzugDP1dmuG8LZ+rjVx6vD1RS6Cl7ueAUD
         OTwTzzTpCx1SiK45x9rNQzeyJ5IBCzzLaWJet39VA3vbHo5yAFA9SHgWtGCCOz+jV8iI
         5aKbFpOV71+mei6hrs1Q0Kv7Eq32r5PyHFEBLSHZ8vfQh4t83qGkp0ZAbRhvL5YXSjUF
         IbvEPxggHqywugsiyXDs89h4hXwkEXRH1KFTq7TGokuqv9CsmpEoZ6j0fO+gFrL6yzi2
         rxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776864599; x=1777469399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H4KxM0NFypP5msvC8Vz7WTim2hOA+uexqxg991xDo9I=;
        b=obl1B3WyvRLaGKs4yuZSZ17R5mT+5mVRNHPyPLO16kyMsHCHigv70lWMEptDfDOdaq
         xTZKM0lBnofBz4+O2l82KyGA+36HqULbS6tHNc035FK2qQTHoY5HLGoYhDdkhJxKYaHa
         IVUDWERD2YF+XlAXR7U8f+RM2G2jj5aV2ac3596338L3NXddQNcZyfG8XuDjRqrTZOJ0
         giLx3v5UDCc5uRzqIlTf0TbdIdBuDmG2x/QznDpteNcxYegwnSzdlBUFFDRLHsZCOMgz
         CTxlsUWfk1cj4scIER27ZIsaCqzWeGaA5wnF3iDlYZ+/Kf/u0JuhCL2FeQU3W9EdvuIs
         ddWg==
X-Forwarded-Encrypted: i=1; AFNElJ9bYT+6HPc5Oz+5Qcmvz2ih4cAfNI2HpYC89yzz4CwiAj4JDjrDlI7DbM47gJ9ryViXsqFwQneOzVE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYQujTf/5FS8AMO4O+mehjtmDlFLiCXjutiUpYP+JJGv1jfhef
	ayzgYAqTO7WOBjQzm4HzJQqCNIkRhW1uAnxeZaGhBtCnp971uyBmhkWV
X-Gm-Gg: AeBDietLWFIylQoMAig5GOwHJMeD5ra5vL/VJuCKSfAlKi9ORmVJCjcIlvn59bRGvNC
	vQKHMKN9aQoSXwcsPlYu9ZfgUry7CZeITiqQVkzl4W/KWVFYY3Ww6mA6PxKlnvA27itRqUJKSvn
	LXBWby70hq3gPVOr00W5R8jgT0bsn7JeOfrF3oIumzi1PftHw83KiV4qvj+BaINktBKEUh29/8O
	l46vrKCrtAAUoyc/8IfH+hmoBK8OWRwXjyJUgejFWiXSWE1PespWmUS9je1fQ7MIRKapsSsqhVP
	CfjChP3KLqnAbJcgd1hoj3onx5MDe2SNYeJSblk4K/eenBEBZ64WgxWLJEbcgtjJDsN0XxXZq4X
	iCBimvAVgNp4YZRA7LUWiSwxhVInP7eBN21dT5ryVWZB4eV2DujVvX3LpGGUS46XdF74+d/300Y
	uigGVoBKoHqmq/96ck9qDju6mxJL6KwYqsdINqj910NkRVl31id9FYs2OlEuq7ZFDX1m5iqWC7R
	ASIQQYcRawS3w==
X-Received: by 2002:a05:6512:15a8:b0:5a1:5994:2773 with SMTP id 2adb3069b0e04-5a41729a1edmr6375683e87.14.1776864599087;
        Wed, 22 Apr 2026 06:29:59 -0700 (PDT)
Message-ID: <b2e23765-82ca-4a2a-8501-8990f1662a88@gmail.com>
Date: Wed, 22 Apr 2026 15:29:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] xen/dom0less: introduce next_phandle in struct
 kernel_info
To: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1776780944.git.oleksii.kurochko@gmail.com>
 <4a9d79a9ef2bf25e904c9f49ddef7d5a3f3a4ac2.1776780944.git.oleksii.kurochko@gmail.com>
 <6c02e12a-e091-4416-980b-5a7a24ba71d8@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <6c02e12a-e091-4416-980b-5a7a24ba71d8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1776864600-93F7EA53-2DC10C7A/10/73395122804
X-purgate-type: spam
X-purgate-size: 5327



On 4/22/26 1:42 PM, Orzel, Michal wrote:
> 
> 
> On 22/04/2026 11:44, Oleksii Kurochko wrote:
>> There are cases where it is necessary to know the next available phandle
>> number in order to generate phandles for guest device nodes.
>>
>> When a partial FDT (pfdt) is provided, special care is needed during
>> initialization of next_phandle, as the pfdt may already contain a dummy
>> interrupt controller node with a phandle assigned to it. next_phandle
>> must therefore be initialized to one past the highest phandle already
>> present in the pfdt, to avoid collisions.
>>
>> Since next_phandle may be needed for the very first guest node generated,
>> domain_handle_dtb_boot_module() is moved earlier in prepare_dtb_domU().
>> The new call site also aligns better with the existing comment stating
>> that domain_handle_dtb_boot_module() must be called before the rest of
>> the device tree is generated.
>>
>> Introduce alloc_phandle() to ensure that phandles allocated for guest
>> nodes do not overlap the Xen-reserved phandle range.  This helper will
>> be used by subsequent patches (by RISC-V at the moment).
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Here is an example of generated guest DTB:
>>      cpus {
>>      ...
>>        cpu@0 {
>>      ...
>>          interrupt-controller {
>>            compatible = "riscv,cpu-intc";
>>            #interrupt-cells = <0x1>;
>>            interrupt-controller;
>>            phandle = <0xfdea>;
>>          };
>>        };
>>      };
>>
>>      /soc/imsics@28000000 {
>>
>>        interrupts-extended = <0xfdea 0x9 >;
>>
>>        phandle = <0xfdeb>;
>>      };
>>
>>      /soc/aplic@d000000 {
>>      ...
>>        msi-parent = <0xfdeb>;
>>        phandle = <0x1>;
>>      };
>>
>> Note that phandle is generated in this example not by get_next_free_phandle().
>>
>> For non RISC-V people, APLIC is an interrupt controller (something like GIC in
>> Arm), IMSIC it is interrupt controller which provides MSI and connects to
>> each CPU.
>>
>> [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/interrupt-controller/riscv%2Ccpu-intc.txt
>> ---
>> Changes in v2:
>>   - s/free_phandle/next_phandle.
>>   - s/get_next_free_phandle/alloc_phandle.
>> ---
>>   xen/common/device-tree/dom0less-build.c | 44 ++++++++++++++++++-------
>>   xen/include/xen/fdt-domain-build.h      |  6 ++++
>>   xen/include/xen/fdt-kernel.h            |  3 ++
>>   3 files changed, 41 insertions(+), 12 deletions(-)
>>
>> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
>> index 840d14419da2..ca3ac84a3ef3 100644
>> --- a/xen/common/device-tree/dom0less-build.c
>> +++ b/xen/common/device-tree/dom0less-build.c
>> @@ -389,6 +389,24 @@ static int __init domain_handle_dtb_boot_module(struct domain *d,
>>       if ( res < 0 )
>>           goto out;
>>   
>> +    /*
>> +     * Find the highest phandle in the partial FDT so next_phandle starts
>> +     * above it, avoiding collisions with pfdt's own phandle assignments.
>> +     */
>> +    res = fdt_generate_phandle(pfdt, &kinfo->next_phandle);
>> +    if ( res )
>> +    {
>> +        res = (res == -FDT_ERR_NOPHANDLES) ? -EOVERFLOW : -EINVAL;
>> +        goto out;
>> +    }
>> +
>> +    if ( kinfo->next_phandle >= GUEST_PHANDLE_GIC )
>> +    {
>> +        dprintk(XENLOG_ERR, "Phandle allocation overlaps Xen reserved range\n");
>> +        res = -EOVERFLOW;
>> +        goto out;
>> +    }
>> +
>>       for ( node_next = fdt_first_subnode(pfdt, 0);
>>             node_next > 0;
>>             node_next = fdt_next_subnode(pfdt, node_next) )
>> @@ -459,6 +477,8 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>>       BUILD_BUG_ON(DOMU_DTB_SIZE > SZ_2M);
>>   
>>       kinfo->phandle_intc = GUEST_PHANDLE_GIC;
>> +    kinfo->next_phandle = 1;
>> +    BUILD_BUG_ON(GUEST_PHANDLE_GIC == 1);
> I'm not sure that we need this. It does not seem to be useful. If you want to
> keep it though, I think you want to compare to next_phandle, not opencoding it's
> initial value.

Agree, alloc_phandle() will catch that. I will drop that.

>>   
>> +/* Return 0 (invalid phandle) if the Xen-reserved range has been reached */
>> +static inline uint32_t alloc_phandle(struct kernel_info *kinfo)
>> +{
>> +    return kinfo->next_phandle >= GUEST_PHANDLE_GIC ? 0 : kinfo->next_phandle++;
>> +}
>> +
>>   #endif /* __XEN_FDT_DOMAIN_BUILD_H__ */
>>   
>>   /*
>> diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
>> index aa977a50f4fc..438adfe3855b 100644
>> --- a/xen/include/xen/fdt-kernel.h
>> +++ b/xen/include/xen/fdt-kernel.h
>> @@ -44,6 +44,9 @@ struct kernel_info {
>>       /* Interrupt controller phandle */
>>       uint32_t phandle_intc;
>>   
>> +    /* Next free phandle available for assigning to guest device nodes */
> I would mention not to use this value directly but rather obtain from
> alloc_phandle. This value should only really be used by alloc_phandle.

     /*
      * Next free phandle for guest device nodes; do not access 
directly, use
      * alloc_phandle().
      */
     uint32_t next_phandle;

Thanks.

~ Oleksii


