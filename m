Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B384C98304
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 16:03:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430991.1653385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9PQc-0002pf-DP; Wed, 23 Sep 2026 16:02:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430991.1653385; Wed, 23 Sep 2026 16:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9PQc-0002pY-An; Wed, 23 Sep 2026 16:02:38 +0000
Received: by outflank-mailman (input) for mailman id 1430991;
 Wed, 23 Sep 2026 16:02:36 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x9PQa-0002pS-Jw
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 16:02:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9PQZ-00Djp6-T2
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 18:02:35 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab3f815-2eae-0a2a0a5409dd-0a2a4509dc8c-32
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 18:02:35 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab3f81b-be1a-0a2a45090019-4a7de14cd365-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 18:02:35 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-482f6356f6bso918444f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 09:02:35 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4886877a2d5sm7806149f8f.27.2026.09.23.09.02.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 09:02:34 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790179355; x=1790784155; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/q0mDgZ/wxMWTngw+7Jgt3OPCsYIoEMksfky8Q1Ehag=;
        b=mjUuytv9MlijgY7GZ1mwWsPeJ5oK7MqzgFF5dPxewS5uLEjFxLpFvQ0r9NkHgzFadt
         YfUDFG5qNS5sFYBW8cEWhzaC9ZKHWiNOqmQ/f/da+hVWcRmvodoBTf0l/VoqV4tlswsE
         GZPKqhju8qb4VXuGKXqKQiIwxuJG0PFtSL7l4Isug0SQhhWyYZKQSRtdYCyiS4gG6Bt/
         9Zns82ARlKZB9k9Hsciav1K7cIkh0glRlVS8vatbYL9IMmhHHBEeUhwroxKOxhChhKxC
         BVxkQEXDXppHmL8Pos0u8ZaMiwHDQBgdR1O+l3+djo2pXRMJK7C0QYjn5R/CqpeGZbOv
         QEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179355; x=1790784155;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/q0mDgZ/wxMWTngw+7Jgt3OPCsYIoEMksfky8Q1Ehag=;
        b=qir2L80Gf0kUFZmM39LtHGGPmBIfsbnlhPr8JgSh2qNvhwtHnj+Nt87fzw0JGGIMMe
         PcM6+Vf82ZIeGfn4Vkeu1DsJDkvs4sU6UpUDqu2gf0GBWnV3zjQbGuZ0fhKGPvlSUu1G
         aee/CE17J9LhgvkkG0E88zGOwglPJkRFVibqlwr2ivPSJsd6HCo29n3wklvC3AGnxhSr
         /B9BZYQ8jib2im1F/JQrjeDgO+/F0ca5tb3s4Dvw0WJ6hsullAemmgiAJfDv8U5+IFqH
         +7CeG7leqyVXLMn4yuqSmQrxXjIoIklg9NjEN0+v+4achc/VMbRDDEe3cXDNOtK20/ZG
         jFrA==
X-Gm-Message-State: AFuF++nBdjGGkuIiz/JhBoEDxOwzsaZVHE9SA8jXhkl7vVIP+/1wNSKG
	wbOr8pQk3Lk6Q7cJc4IR3A6XiSSgti5LCRCqxdnCfmsm7uaOGTYnANVe
X-Gm-Gg: AYBFou1fum0ZR3KE2qcOVpR2kgUKjaa5HQMvv4g6DDtUo2IR66IslXdSiUJ0+MnUyhc
	ffLeXuBnkZXCdIYRP4mloD0JCR/j0bXeKeKFWCxi11MDsR78MyXuiSmnwqx3Wn0FoikG5DOBa6u
	3aEm8kP3d15qSy+QXXYbIBAC0h+hQiDTurrm1Nf4G7YfTpsmh/fRnHdDrGLsVc7TjSrEtT7/PPa
	i4MV7816ASTpvfYx1SuwR7Ag+LQGiPMcOfMxhXwDMNuOILdZBwoIrDZnyNSbtqWW+/HK/1oH4D7
	NVNueum4ibiy2/+qvZxF5dFWHBqRaEHcjL/q93lPd5S7ytPSXlgoDwqFZ9aTnpxQO4ai0CLyKBG
	W9MgLUwLmYHgh/4/DpraZmV/3djU/taMms610NY6QPIVjr7K5NaV0tOXKMrwDZytXnnMWKCAm+2
	BBNkvQINUkUuhrC0h4+aSyddoz4LKlvOJd38YOVXNRALRqgQyyfWLDGuoL3JzuhVq/tP0GmfdUI
	3YjkpAJYQLPfEiUqaZ5PoLdlDFeeyud3wohMu7PAzm0MbY3G5GDpqIekEuB
X-Received: by 2002:a05:6000:4917:b0:487:27f9:835 with SMTP id ffacd0b85a97d-48867097636mr5412516f8f.42.1790179355216;
        Wed, 23 Sep 2026 09:02:35 -0700 (PDT)
Message-ID: <ec47ff4f-68a2-46aa-a128-4663ebd95c7e@gmail.com>
Date: Wed, 23 Sep 2026 18:02:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 33/39] xen/riscv: dump old interrupt file to memory
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <efecffa9cd7c4bb6e9ed51b7fd084328fcd4611e.1787838835.git.oleksii.kurochko@gmail.com>
 <1790176561.8631fc262581453bbf619ec5b2062170.1a0ced6896200072c4@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1790176561.8631fc262581453bbf619ec5b2062170.1a0ced6896200072c4@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1790179355-BDEC6034-6015D010/10/73395122804
X-purgate-type: spam
X-purgate-size: 4597



On 9/23/26 5:15 PM, Baptiste Le Duc wrote:
>> At the old interrupt file, dump to memory all the eip and eie arrays).
> Typo `)`

Will drop `)`.

>> After this step is done, the old interrupt file is no longer in use so
>> old intrrupt file VGEIN could be released.
>>
>> Restoring of old interrupt file state will be done in follow-up
>> patch.
>>
> 
> 
>> There are cases where it is needed to specify on which cpu it is
>> necessary to VGEIN should be released so update vgein_release() to
> 
> The sentence miss a verb, here is a proposal:
> ```
> There are cases where the cpu on which the VGEIN is released needs to
> be specified, so update vgein_release() to deal with that.
> ```

I think it could be dropped at all as vgein_release() stub is just 
introduced here and not updated.

> Moreover, could you explain me the cases you are talking about? It's not
> clear by reading the commit message in the first place.

For example, during migration of vCPU, vCPU->processor points to new CPU 
where it will be run but we still have to free VGEIN on the prev. 
->processor.

> 
> 
>> deal with that.
> 
> 
> 
> 
>>
> 
> 
>> Keep BUG_ON("unimplemented") placeholder in imsic_migrate_vcpu() to guard
> 
> 
>> against silent incorrect behaviour or unexpected panics in guest VMs until
>> the function is fully implemented.
>>
> 
> 
>> vgein_release() is stub for now and will be introduced later.
> 
> 
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> diff --git a/xen/arch/riscv/aia.c b/xen/arch/riscv/aia.c
>> index 75c82bcfa1..be3901ec0c 100644
>> --- a/xen/arch/riscv/aia.c
>> +++ b/xen/arch/riscv/aia.c
>> @@ -30,3 +30,8 @@ unsigned int vgein_assign(struct vcpu *v)
>>   
>>       return 0;
>>   }
>> +
>> +void vgein_release(struct vcpu *v, unsigned int vgein_id, unsigned int cpu)
>> +{
>> +    BUG_ON("unimplemented\n");
>> +}
>> diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
>> index 5e9f6995e4..3cba58e0c1 100644
>> --- a/xen/arch/riscv/imsic.c
>> +++ b/xen/arch/riscv/imsic.c
>> @@ -56,6 +56,24 @@ static unsigned int __ro_after_init guest_num_msis;
>>    */
>>   #define GUEST_IMSIC_MAX_MSIS 255U
>>   
>> +/*
>> + * The interrupt identities an IMSIC interrupt file provides are 0 (which is
>> + * never valid, but still occupies a bit) up to IMSIC_MAX_ID inclusive, so
>> + * IMSIC_MAX_ID + 1 bits have to be covered.
>> + */
>> +#define IMSIC_MAX_EIX DIV_ROUND_UP(IMSIC_MAX_ID + 1, BITS_PER_TYPE(uint64_t))
> 
> 
>> +
>> +struct imsic_mrif_eix {
>> +    unsigned long eip[BITS_PER_TYPE(uint64_t) / BITS_PER_LONG];
>> +    unsigned long eie[BITS_PER_TYPE(uint64_t) / BITS_PER_LONG];
> 
> 
>> +};
>> +
>> +struct imsic_mrif {
>> +    struct imsic_mrif_eix eix[IMSIC_MAX_EIX];
>> +    unsigned long eithreshold;
>> +    unsigned long eidelivery;
>> +};
>> +
> Maybe I didn't get something but I couldn't find anything in the commit
> message explaining why do we use mrif here.

It is just convenient way to temporary store h/w interrupt file. Also it 
could be used not only for ...

> 
> Moreover, mrif, as described in aia spec (8.3 Memory-resident interrupt
> files), seems to be only usable with IOMMU that Xen doesn't support.

... IOMMU but also to support more guest interrupts file implemented by 
IMSIC (basically what I am calling as software interrupt file). Without 
memory-resident interrupt files, the number of virtual RISC-V harts that 
can directly receive MSIs from devices is limited by the total number of 
guest interrupt files implemented by all IMSICs in the system, because 
all MSIs to RISC-V harts must go through IMSICs. For a single RISC-V 
hart, the number of guest interrupt files is the GEILEN parameter 
defined by the Privileged Architecture, which can be at most 31 for RV32 
and 63 for RV64.

> 
> If you want to have something in memory that could store some interrupt
> file info, we should take another name to not be confusing.

It seems like it is okay to use memory residential interrupt file (mrif) 
here based on KVM's code who are using mrif for the same purpose I 
described above.

In short, MRIF is a joint virtualization technology shared between the 
IOMMU and the hypervisor. The IOMMU uses the MRIF as a memory target to 
land incoming hardware MSIs, while the hypervisor manages these MRIFs in 
RAM as software data structures to support an effectively unlimited 
number of vCPUs that don't currently hold a physical IMSIC guest file slot.

~ Oleksii


