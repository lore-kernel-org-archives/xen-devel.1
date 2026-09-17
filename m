Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E64C982D0
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2026 05:12:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423637.1648610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x74Pu-0003fM-4K; Thu, 17 Sep 2026 05:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423637.1648610; Thu, 17 Sep 2026 05:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x74Pu-0003fF-1M; Thu, 17 Sep 2026 05:12:14 +0000
Received: by outflank-mailman (input) for mailman id 1423637;
 Thu, 17 Sep 2026 05:12:12 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x74Ps-0003f9-DB
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 05:12:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x74Pr-009seW-Q4
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 07:12:11 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aab7694-e002-0a2a0a5209dd-0a2a4507aad0-22
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 07:12:11 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aab76ab-b4ea-0a2a45070019-4a7de18d96ed-3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 07:12:11 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e71cdb22bso2620585e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 22:12:11 -0700 (PDT)
Received: from [10.250.112.129] (h-213.61.72.154.host.de.colt.net.
 [213.61.72.154]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf27c65sm12626442f8f.21.2026.09.16.22.12.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2026 22:12:10 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789621931; x=1790226731; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KCIuSRrWRr6ZhyjbWuzbQFsE0KRSs9atqvR0PaqwdCE=;
        b=jQlWrhOIJ7lhXJEud/OT9OjRcItlSDKqwWojaswjoTA/dkDvqdgOIiEotbBvCLCtd1
         D7/wZICtAxqVkJ/D2BwHit2ueC8pPk2P8NI0Kv7sxeOagIYSoB3engHHbt5g1wOhxtiF
         2L9eYUfdytfh1meZDnhlXj8etohLM/WNlgren0wubHaIf5g6jfgTWVwIL/TvzeNGndtl
         uCclwK/1IXDx59rnZdooH+2E7nbCMqPGvUTlGIv3+GnyJVLFkHhG2VMlpu4dmUvlgrEl
         +Ij9Bxj4u5LF/OTEJUbUGhd3s2kghfQ5jrBEBLUzmoDntTp9cfMF/D0wk8TfdyovDjrS
         qs2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789621931; x=1790226731;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KCIuSRrWRr6ZhyjbWuzbQFsE0KRSs9atqvR0PaqwdCE=;
        b=TIEgJQARvQ2S4upWnebkU4cIJaohEareZb3GYiy9saGC0oZyVOIFMFeYoM1BCPY3Wm
         5HBEQEhDG/oCfGgTld4LFtP4Bcm8iy2hdZ+K9Og+z47sVP0VSOYzIzTk8RdAFZoTU1Xz
         T0U+I0n0P/BKby8RfbXczl0+CTWrnuXmYuEhjXj8neyWhQakFHlCcwCX3rxx53wqodr5
         bZPMXY87A+z65+pDT85av3clCMaIAyXbloRjlfRKExZSFwP0wFiKMxTimhVbe118/Xzc
         htRSQeoWzUPZ/eDSefU8Feh1QOHaLjrAoON+n0coSIxC59PBDSnfCLF6aR6MaebXAPG+
         bnPQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7qAsFFmi/kZH23ESYF3sdKI/LuiQX5HwKp93zR8ELv3T/iacETqeZ6HqrZPVYBTeEkHKRtwXvkLA=@lists.xenproject.org
X-Gm-Message-State: AFuF++kNnwEfLJdHajgh2+vVfGxpzwWRHRVP9ogm1IXWFNZ/ESR8uSTM
	5leS1ggOaG4xu6UIovEnlQymDYGHkNEQS/8ogGGn1+SsirnG7ZJwcsb3
X-Gm-Gg: AYBFou0Bjb/vlmwlx1E6XosR7WsgHX6LcEE1Rx1dq0QA6vm8W3rv2tSK8Pr3wAEINYJ
	hzyjRAU9qIT/eXAYef3vi+XLzeZIAU3xJNqrl4+nZ/j8cpSeQCW+lV0dE3Ot79mHbmjPwWJekm0
	TBsu7Wv9K6ch/vwRpYrUzGdPmI8+uyJIHVnmOSDRfGyoxOydtRBdslT+jYYwwycD0Agd8tFebiP
	04xXXe+Ac0QSdT1bUdXFQbRkSn+VkzZeIAQIiA6eFFUSrc1+KlHHYjYox9GFedy/6AzCOQuy0j3
	bsVQ0OZ6thYm60pBCSEt5A63fcSxGQ6L8DxiKB90lY9nnmHLqowaLqCx34aC7+LY9IsJlNTcXNS
	QagidB6d3CseZ2h5SW31wAa2evbtcPsK6pbU0T2qvGAeURT2Jx3jGUiI7lKtxRikuA7CAXCwFgF
	5EgGZ6SCsfmdqtszuGe3nAERlrNJJ8cl2w52XXOTB0y4vrhCE0ZkGg/FcQeBZvCC1CU49TUYFS0
	8YL3Jz7WMS7tvo688pRqAUdw3Jpm322YgaCU+agfq9GJG765zqwLB8pTQ==
X-Received: by 2002:a05:600c:1392:b0:49c:fa20:cc02 with SMTP id 5b1f17b1804b1-49eb732df6amr57663045e9.25.1789621931080;
        Wed, 16 Sep 2026 22:12:11 -0700 (PDT)
Message-ID: <0d13b587-0920-4958-9a17-425d1a23d51e@gmail.com>
Date: Thu, 17 Sep 2026 07:12:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 28/39] xen/riscv: handle the case when no vCPU
 migration is needed
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
 <c4f78f50022bd7a75a4deb71199e979beafb4906.1787838835.git.oleksii.kurochko@gmail.com>
 <63eb5954-0c34-4cec-9037-b25724b68f47@suse.com>
 <c6ac11cc-6428-4521-9752-558150a302b2@gmail.com>
 <52c8ca00-423a-4c91-a60d-a1662d20a012@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <52c8ca00-423a-4c91-a60d-a1662d20a012@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1789621931-350CDAE4-DED35D17/10/73395122804
X-purgate-type: spam
X-purgate-size: 2579



On 9/16/26 3:02 PM, Jan Beulich wrote:
> On 16.09.2026 07:55, Oleksii Kurochko wrote:
>> On 9/14/26 2:12 PM, Jan Beulich wrote:
>>> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/imsic.c
>>>> +++ b/xen/arch/riscv/imsic.c
>>>> @@ -689,5 +689,15 @@ int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
>>>>    
>>>>    void imsic_migrate_vcpu(struct vcpu *v)
>>>>    {
>>>> +    /*
>>>> +     * The scheduler can mark a freshly created vCPU's unit as migrated and
>>>> +     * invoke this before the vCPU has ever run (see the migrated branch in
>>>> +     * schedule()). No need to do migration for such vCPUs as they aren't fully
>>>> +     * initialized (for example, context_switch() will be called after
>>>> +     * imsic_migrate_vcpu()).
>>>> +     */
>>>> +    if ( v->arch.last_cpu == NR_CPUS )
>>>
>>> May I suggest to use >= ? I'm still somewhat unconvinced of NR_CPUS being a
>>> good sentinel. If we/you decided to switch to ~0, >= here would continue to
>>> be correct.
>>
>> I agree with >= but I am not quite sure that I fully understand what is
>> wrong with NR_CPUS. We have for example the following:
>>
>> static inline unsigned int smp_processor_id(void)
>> {
>>       unsigned int id = tp->processor_id;
>>
>>       BUG_ON(id >= NR_CPUS);
>>
>>       return id;
>> }
>>
>> So it is guaranteed that NR_CPUS what be used as cpu id and so it still
>> could be considered as a good sentinel.
> 
> Arbitrary numbers can be problematic when used as a sentinel. If you look
> at disassembly, you may not recognize that number as a sentinel. Further
> there's also a code-gen concern: ~0, aiui, will always generate the same
> code (to e.g. load into a register). NR_CPUS, depending on .config, may
> not. The value may not be loadable by a single insn.

Witch such explanation it started to be more sense in it.

I will introduce then

/* Value of arch_vcpu.last_cpu for a vCPU which hasn't run yet. */
#define VCPU_NEVER_RAN (~0U)

and use it to work with v->arch.last_cpu.

Just to be sure that I understand correctly your suggestion with ~0U is 
only for the case of ->last_cpu and check if vcpu was ran or not.

For

struct pcpu_info pcpu_info[NR_CPUS] = { [0 ... NR_CPUS - 1] = {
     .processor_id = NR_CPUS,
}};

and

struct vimsic_state {
...
     /*
      * s/w IMSIC VS-file -> vsfile_cpu == NR_CPUS
      * h/w IMSIC VS-file -> vsfile_cpu < NR_CPUS
      */
     unsigned int vsfile_cpu;
};

I can continue to use NR_CPUS, right?

~ Oleksii

