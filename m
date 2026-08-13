Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFB7C5DF66
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 09:34:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389642.1630282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuRpW-0006Jm-Ei; Thu, 13 Aug 2026 09:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389642.1630282; Thu, 13 Aug 2026 09:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuRpW-0006Jf-AR; Thu, 13 Aug 2026 09:34:30 +0000
Received: by outflank-mailman (input) for mailman id 1389642;
 Thu, 13 Aug 2026 09:34:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wuRpW-0006JZ-11
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 09:34:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuRpU-009jnL-Oy
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 11:34:28 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7d8f98-8faa-0a2a0a5109dd-0a2a450abea4-44
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 11:34:28 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7d8fa4-f2d2-0a2a450a0019-d155dd35e5f7-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 11:34:28 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-4815bce4652so197707f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 02:34:28 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815a5af453sm5229112f8f.23.2026.08.13.02.34.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 02:34:27 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786613668; x=1787218468; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1W1dY6FXTFT07DGJUMkU4P+XkErLbGXiTCzqyWLpuec=;
        b=ocsEOE3296AUONAVojEIIMl1lXxJLsoCKK3hZTAGapg7bVPbwgF4yYxYeCviPwmBur
         W8ID/5ti7XEI/B4cj1v59acdz6qWDc29FnIwHK3Esf3JUKjw4jxVOoXEU67/6M4aFA7B
         xo4KzWiF/avbMeQTpzVPwISxRgi0i6d5UtgWt5cRQF8ZjDJtsjnAWnMGhgzW3Y7QWly9
         WPBdgP//V+zbS87Int6u6Q22nVPYqqEcyhkxezCVZrc7Ze9d/J5sp9JCL7ABVL1tv3zC
         ErwnkAjbvIwj18Ernveydf8OoXo9vC5pdu4mh8+Wgfu1YvI9Bz3dReAD0lYJ/1Yrljde
         aV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786613668; x=1787218468;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1W1dY6FXTFT07DGJUMkU4P+XkErLbGXiTCzqyWLpuec=;
        b=ZNbTZ75387wz8BUx6u0FHePDBWs0UyvwVYsa1INAQRhNeOaP3OHOEKRQMCDwZGFimi
         ax7q65KYMjJvsZLcea4upN8R+3F2eUa9yoyx9HuzTMj/0i7uJUHvCBnH6GklNaMxKRm0
         dldr+QS9ognRHyImsee4RDVHEeCx8QuP+eeCyEapSg7tk4vfmAfvaCRdw6d9rmxGpnbM
         x9uFEwDn9UgpJ8A3Hnl8Pf+CdSsMNPLt5f8uNi05RXV/pTcXKOrxOe36isWZqcrvb+fQ
         fCWRC+kjuety4rFYRMzNC3ScdNUvzn6+PukPJuq8OF4DKe+D/kroi4mLbF/2ikF1eCve
         ss5w==
X-Gm-Message-State: AOJu0YzORX064946Qo8wQV8mIppkwYDMH+Ga1xzSmAsgvM91BZEJf7pM
	uM3zCQPnZ4MrOJ9apjEkm2ZlIkIZ6rlM+Q2OiKjLb1A3pfMWgwfQkgdp
X-Gm-Gg: AR+sD13yhpc3+ElWEf1lNGYueLYsEGuOj0ledUR77PjHxZE7s849746vU6ImcxFmHAH
	5l3zyErQSP8JZ0AUUFohuPuAxNC8yWN6c7qtfen2md0Y9a45b0EEZ1B4Cjhhv85Z5fZEbZK7NNe
	zH+sHAAJbU/nxVB3wXVo6YAg5ZculKMyUcmwD4coH/Et9dyd/Z4qiWJJk/xDcP/I/TYQjpG9+iF
	7cCiZkrQmflup4fiGQJxsC+OPqThkcILhcLYcdHgh6ca9pk1Cc2uW2CtPAJty4JdHsABtuDdvcN
	LHU9JNfWfdZrXi2Q6fuxbSEZJU1enhBU3PpBCQeUFQsIJKiZjU/wKXtFXDLu9Efz36G0q6ZlzXs
	oH6FVcfHAsRyPruanBxVZO/HgKQRQnjr7BKjlip0gamtgwYYZoj7+NMZ6XES+xJqgJbEzLEflJf
	ubG/Il4zRyy2o5KW08e9mgjzvs/9iudFj4LnaXN5/tpo+YNANkcYDJn6AjJyERy/f1H+WnL9FJa
	srsWlOlkc+UfWTDfqer1kDXcZ+K6lQ//B09DCE6PcE=
X-Received: by 2002:adf:f8c4:0:b0:481:4ee4:e49 with SMTP id ffacd0b85a97d-4815a03ecfemr4721827f8f.25.1786613667975;
        Thu, 13 Aug 2026 02:34:27 -0700 (PDT)
Message-ID: <9724c838-6713-4f29-89ab-54f50ec4fe8e@gmail.com>
Date: Thu, 13 Aug 2026 11:34:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/17] xen/riscv: add IMSIC state save/restore
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
 <5e3df9ea4bafc5666d1885dfd40f534f8349879e.1784560663.git.oleksii.kurochko@gmail.com>
 <1786613430.8631fc262581453bbf619ec5b2062170.19ffa7577c9000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1786613430.8631fc262581453bbf619ec5b2062170.19ffa7577c9000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1786613668-520C1CFC-53E25DBB/10/73395122804
X-purgate-type: spam
X-purgate-size: 2563



On 8/13/26 11:30 AM, Baptiste Le Duc wrote:
>> IMSIC state is currently needed only to track which physical CPU owns a
>> vCPU's IMSIC interrupt file. This is required because the physical CPU
>> ID is part of the physical address used to map the IMSIC file.
>>
>> Add imsic_state_save() to record the current pCPU for a vCPU. When the
>> vCPU is migrated to a different pCPU, the mapping will need to be updated.
>>
>> When imsic_state_restore() is called, VGEIN is already assigned to the
>> vCPU and the guest interrupt file is already mapped, and, as only h/w
>> interrupt files are used for now, nothing specific needs to be done.
>> Action is only required when the vCPU is moved to a different pCPU, which
>> requires recalculating VGEIN and the mapping for the new guest interrupt
>> file. That will be handled separately by vcpu_move_irqs(), which is
>> introduced in a follow-up patch; until then this case is guarded by a
>> BUG_ON(), which is fine.
>>
>> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
>> index 2a792e756c..406bc68cbc 100644
>> --- a/xen/arch/riscv/imsic.c
>> +++ b/xen/arch/riscv/imsic.c
>> @@ -20,6 +20,7 @@
>>   #include <xen/init.h>
>>   #include <xen/libfdt/libfdt.h>
>>   #include <xen/macros.h>
>> +#include <xen/rwlock.h>
>>   #include <xen/sched.h>
>>   #include <xen/smp.h>
>>   #include <xen/spinlock.h>
>> @@ -418,6 +419,28 @@ int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id)
>>       return res;
>>   }
>>   
>> +void imsic_state_save(struct vcpu *v)
>> +{
>> +    struct vimsic_state *imsic_state = v->arch.vimsic_state;
>> +    unsigned long flags;
>> +
>> +    /*
>> +     * SW interrupt file always has ->vsfile_pcpu = NR_CPUS so nothing specific
>> +     * should be done in this case.
>> +     */
>> +    if ( !vcpu_guest_file_id(v) )
>> +        return;
> 
> 
>> +
>> +    write_lock_irqsave(&imsic_state->vsfile_lock, flags);
>> +    imsic_state->vsfile_pcpu = cpuid_to_hartid(v->processor);
> 
> How will you detect a migration is needed? Don't you need to first know
> if ->vsfile_pcpu is different to cpuid_to_hartid(v->processor)? (I
> didn't take a look to other patchs for the moment, so the
> explanations might be later.)
> 

Migration (if you are speaking about migration of vCPU from one pCPU to 
another) is completely different path. Look at sched_move_irqs().

~ Oleksii

