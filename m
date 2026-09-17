Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3771C982D0
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2026 10:41:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423871.1648737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x79YP-0000on-1j; Thu, 17 Sep 2026 10:41:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423871.1648737; Thu, 17 Sep 2026 10:41:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x79YO-0000og-VV; Thu, 17 Sep 2026 10:41:20 +0000
Received: by outflank-mailman (input) for mailman id 1423871;
 Thu, 17 Sep 2026 10:41:19 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x79YN-0000oa-Km
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 10:41:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x79YM-005cJ5-Qg
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 12:41:18 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aabc3c8-bab6-0a2a0a5309dd-0a2a450c9234-18
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 12:41:18 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aabc3ce-f479-0a2a450c0019-4a7de18cce69-3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 12:41:18 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b91369d18so5079805e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 03:41:18 -0700 (PDT)
Received: from [10.72.3.60] ([91.26.93.146]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd204c1asm63603835e9.4.2026.09.17.03.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2026 03:41:17 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789641678; x=1790246478; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jWOMj2zAtCvn0F8fSysaujKwbNl80fvQFMaO4DA7EXQ=;
        b=U8c6lnIO5ZdMQwsxypEaL1e/DovGmLGu1MDsKFq4zTP30qG0bUeMjRPwIoZfN/yU+z
         /gnnwM+kp8rk+xpk2p+TmKIA3wiJAi2Zqz10iU+3NLeRIKBS4W/5KvwBn5Bx2h/SxDBs
         X7ghJYpd/9jetH5ciTXbiVkWkkOIVeRvb77sYg+v4MaqV8BJqZlhRxwi1GCmqPpzbMzy
         fO/TrXJd6IEsd8RHg7sd5rwTQri+UeN+qr1T5cuNpxeU7Nd80kqReafvsNpOBitnR8kB
         iWJdcXQsOOX2Oq+Z1kv8eiYbVx/SLlc3F4QC/WPNCnevDHNFVSeYouMmy48lD/LcL0LH
         STlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789641678; x=1790246478;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jWOMj2zAtCvn0F8fSysaujKwbNl80fvQFMaO4DA7EXQ=;
        b=xYkuUf1LgDSkivsj2wfUJbGRFYMs1mqI+CXwgFb+zv9ISR1DNBYFPQzKC2xWZSXBaH
         2Vnk+3cKWG6oyE5pQ5Zl0EK3pN1BMISDG80J6JJffBmalUhd3/J9ymA9G6PStHannfDJ
         mAekaY73P5aa0+Ibnto5lEzOYF6gelu6kn6jYGI8RNAQlj4WHuft5PLhvrS7p6N62A/L
         3MsszkU3jz+3F1tM12iqpX6c5XQkwhnDd6sdif0CQEbpvgdoN8z3YwlaBBEqU90KxkwI
         3fQFYW1hfB5F0tj+PvQaXiorGrKRvipttN0HOpJ7mM+z7rj9AmTVQTfKvM3qGTtTQ2SU
         Q83Q==
X-Forwarded-Encrypted: i=1; AKwUvBy6OIuisAIfyf7D/C/zNyiOeqGM5sE+q7QczeiWEvsyoffLBXEbsAHz+Q3mKMDnn2gwNzzLsSye6Gg=@lists.xenproject.org
X-Gm-Message-State: AFuF++lLrsuKJYNk5FIPZJ+TKJIXuY/UNz3qlR/I6mE0JqOh3+nGQQj1
	PVDz1d4VFXcWIbc/bJ8d82RtNUBOhYw2IAw5JsI5+ABoCM1skwBtuTST08V562tBfQ==
X-Gm-Gg: AYBFou2fMO3+IrLlJIkKQPCF+qQanW1qvDDZKpsS3AeR6bpua1SWBoTl+vtRGIrorLa
	b9LlOZ/0hNc4Dqo5mC6b1CFb8Kon7vYhxIyIIJSnJoFUDRhvqQ7BbdQU0TS+lYJey9VbUNNNen8
	yWoAXGkOvdt4kj1KtZy334gVCLe5G1J0s6l1vPH6PZZACg/S1IGxUBL+J2KsHrmmpSKuCIWBwoh
	J8rpn10j4Y8p+ZO7M6gHUOIZSXxhiCcFIIfnrUXm4ibHT+q5F+WcofTwbVKCf1gTsprQK8aKg7l
	0ipHkk2pKXH89dtbdtFdaNEzfe4eby+VTW1+Jws7EAS8gU6QJa/7FFR5zDsNBJtnKXMvCs/7jp/
	SqSCF7+poDq/6wFDTMrw3IMkksMRDkYCA63pSEhICCT2CLaODUe847tMy0ueKbh5lJn6p1FA4jz
	/MD8FqWm6bqQCfjkBU7lY+TzgOZRvbjWRNKuUfGeNPtZqD6F7aNa7Lv29lNAvQHnj/G5oiKzI8W
	w==
X-Received: by 2002:a05:600c:3b1d:b0:49e:6e46:2db with SMTP id 5b1f17b1804b1-49eb72f2c33mr71996335e9.8.1789641678014;
        Thu, 17 Sep 2026 03:41:18 -0700 (PDT)
Message-ID: <310125fd-5a40-4a39-b54c-ff917c73a43f@suse.com>
Date: Thu, 17 Sep 2026 12:41:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 28/39] xen/riscv: handle the case when no vCPU
 migration is needed
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 <0d13b587-0920-4958-9a17-425d1a23d51e@gmail.com>
 <16ffbf4e-0178-4089-b279-d39e97ab885f@suse.com>
 <99f7bb36-14c2-474f-83e9-b36ae62a1f1a@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <99f7bb36-14c2-474f-83e9-b36ae62a1f1a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1789641678-51B35A5B-F0200433/0/0
X-purgate-type: clean
X-purgate-size: 4209

On 17.09.2026 10:40, Oleksii Kurochko wrote:
> On 9/17/26 7:20 AM, Jan Beulich wrote:
>> On 17.09.2026 07:12, Oleksii Kurochko wrote:
>>> On 9/16/26 3:02 PM, Jan Beulich wrote:
>>>> On 16.09.2026 07:55, Oleksii Kurochko wrote:
>>>>> On 9/14/26 2:12 PM, Jan Beulich wrote:
>>>>>> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>>>>>>> --- a/xen/arch/riscv/imsic.c
>>>>>>> +++ b/xen/arch/riscv/imsic.c
>>>>>>> @@ -689,5 +689,15 @@ int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
>>>>>>>     
>>>>>>>     void imsic_migrate_vcpu(struct vcpu *v)
>>>>>>>     {
>>>>>>> +    /*
>>>>>>> +     * The scheduler can mark a freshly created vCPU's unit as migrated and
>>>>>>> +     * invoke this before the vCPU has ever run (see the migrated branch in
>>>>>>> +     * schedule()). No need to do migration for such vCPUs as they aren't fully
>>>>>>> +     * initialized (for example, context_switch() will be called after
>>>>>>> +     * imsic_migrate_vcpu()).
>>>>>>> +     */
>>>>>>> +    if ( v->arch.last_cpu == NR_CPUS )
>>>>>>
>>>>>> May I suggest to use >= ? I'm still somewhat unconvinced of NR_CPUS being a
>>>>>> good sentinel. If we/you decided to switch to ~0, >= here would continue to
>>>>>> be correct.
>>>>>
>>>>> I agree with >= but I am not quite sure that I fully understand what is
>>>>> wrong with NR_CPUS. We have for example the following:
>>>>>
>>>>> static inline unsigned int smp_processor_id(void)
>>>>> {
>>>>>        unsigned int id = tp->processor_id;
>>>>>
>>>>>        BUG_ON(id >= NR_CPUS);
>>>>>
>>>>>        return id;
>>>>> }
>>>>>
>>>>> So it is guaranteed that NR_CPUS what be used as cpu id and so it still
>>>>> could be considered as a good sentinel.
>>>>
>>>> Arbitrary numbers can be problematic when used as a sentinel. If you look
>>>> at disassembly, you may not recognize that number as a sentinel. Further
>>>> there's also a code-gen concern: ~0, aiui, will always generate the same
>>>> code (to e.g. load into a register). NR_CPUS, depending on .config, may
>>>> not. The value may not be loadable by a single insn.
>>>
>>> Witch such explanation it started to be more sense in it.
>>>
>>> I will introduce then
>>>
>>> /* Value of arch_vcpu.last_cpu for a vCPU which hasn't run yet. */
>>> #define VCPU_NEVER_RAN (~0U)
>>>
>>> and use it to work with v->arch.last_cpu.
>>>
>>> Just to be sure that I understand correctly your suggestion with ~0U is
>>> only for the case of ->last_cpu and check if vcpu was ran or not.
>>>
>>> For
>>>
>>> struct pcpu_info pcpu_info[NR_CPUS] = { [0 ... NR_CPUS - 1] = {
>>>       .processor_id = NR_CPUS,
>>> }};
>>>
>>> and
>>>
>>> struct vimsic_state {
>>> ...
>>>       /*
>>>        * s/w IMSIC VS-file -> vsfile_cpu == NR_CPUS
>>>        * h/w IMSIC VS-file -> vsfile_cpu < NR_CPUS
>>>        */
>>>       unsigned int vsfile_cpu;
>>> };
>>>
>>> I can continue to use NR_CPUS, right?
>>
>> You _can_ everywhere. It may merely be beneficial to use ~0 instead, at
>> least in some cases. The "how to load value into a register" aspect of
>> course doesn't affect static initializers. The "easy to recognize" one,
>> otoh, may apply there as well. You get to judge...
>>
> I checked how NR_CPUS is used and it is okay to change to ~0U for 
> vsfile_cpu mentioned above as it could really affect how to load value 
> into a register but I am not sure about .processor_id as it is just 
> static initializer (maybe just for consistency).
> 
> Also as hartid_to_cpuid() returning NR_CPUS to follow the common 
> convention of returning an out-of-range CPU number when nothing was 
> found (like cpumask_first() / cpumask_next() do), so callers check the 
> result with >= rather than against a specific sentinel.
> 
> If to use ~0U for vsfile_cpu then suggested name VCPU_NEVER_RAN isn't 
> good. Then probably CPU_NONE will be better.
> 
> If we will start to use ~0 instead of NR_CPUS then IIUC it won't be any 
> sense to use ">=" suggested above and "==" could be continue to be used, 
> right?

I fear you may not like the answer: Depends. IOW I can't give a concrete
reply unless seeing the concrete use(s).

Jan

