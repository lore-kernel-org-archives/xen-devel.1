Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A412C982D0
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2026 08:40:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423810.1648710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x77fL-00018w-NO; Thu, 17 Sep 2026 08:40:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423810.1648710; Thu, 17 Sep 2026 08:40:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x77fL-00018p-Kq; Thu, 17 Sep 2026 08:40:23 +0000
Received: by outflank-mailman (input) for mailman id 1423810;
 Thu, 17 Sep 2026 08:40:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x77fK-00018i-LJ
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 08:40:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x77fJ-000YWd-QT
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 10:40:21 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aaba772-8faa-0a2a0a5109dd-0a2a4508d95e-24
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 10:40:21 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aaba775-f659-0a2a45080019-4a7de18de74e-3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 10:40:21 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49ccfd61ecaso5123905e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 01:40:21 -0700 (PDT)
Received: from [10.72.3.52] ([91.26.93.146]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf33e01sm15146728f8f.23.2026.09.17.01.40.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2026 01:40:20 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789634421; x=1790239221; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTVpwr75FW73NN3lI8WqiuLVDo0vgH81sRu11EciCRY=;
        b=Ovlmy9OqKuwDFvgkykNFM0LXFHJx60NuFa92DR6qyOv/WKlpgulS0t72D0Wpc1io++
         4kqEKjATTGKgIRs7DV/Ayi+0p63/eTmborwNj/nYP3kC+t6xKKGrmAgNHLX7IkQtg4+I
         2r9GcdG3P0UMBm0t1F5BdOYDpSmeGY8IfPkR6i1jG8GniIckpufqt5zbhMyBr2PO70jH
         rTK9W5T4T4LWmZqE2mJWm7MpeeIHrv/Hn55yxqUjfVopi+4epTpnQIvEi8e+D/f+es4J
         anvLByQjJgPHF1NqMJbXEqyRvu4pSUp3FIRNOzNTrekB8nu/Ma0LQZthXj6vAtjlHK0C
         mbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789634421; x=1790239221;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bTVpwr75FW73NN3lI8WqiuLVDo0vgH81sRu11EciCRY=;
        b=2oRdKLq8Cuombj+qGyvWlgj4lNxKps+S3TQfRTIXVL7ph5vj+ysks4lpbhmmSPmRWj
         bTVRFhDvSqlAtKQ2jIkwO/Rkl7s7YNnmWypnw/y4CBoaGQt6TjxCcmEZV1+BBT7cjp61
         zimFlqyPmFqVmxEnOuRbgxfDdWtJMARzRoI7l/dxpeenRGxAdehhyTnxjshtlLx+bO/z
         aSbNBXzKxHDVVLsCceERarN0f347tnCzHZPR1P9EY1EcANWQhRA452HRUuxgTViefpS8
         E7YKozzdI/fQnStCV/t2vqQXTt/dO+hbPteOxpcO+xJiamq78+add16NZxqtXPMpaEf/
         gphA==
X-Forwarded-Encrypted: i=1; AKwUvBxruf9ilIr64ShlKjtZlFfL5EnHcOvfg6jFTEEHff5sCCPW4pE+TB0UM+vdstAaf9z/kjvkN37QbK4=@lists.xenproject.org
X-Gm-Message-State: AFuF++mY+b/5+Oe8Ea4AApNbzE5vum+zGYEbNRFENTlgLuHZW+eBczP6
	g7rGZLZK5/9q/EqPpTQxey/Psn4xP/UzBukJlHB6rRYkXmZzWDRTdPKy
X-Gm-Gg: AYBFou1sE/Q6NaQtyUZW3vA76TKwOoIU9Cgz6vuDz51v7bf+vpSKTYRsujLk7NzTBX6
	RWNFhNyAdY1nh4UpH7QnuR6eJafONQkxQajvF/sfD9owbs6oc4ZtkPpxLqrq510muGazjCbG2Gv
	RWjQ4KeGubDG8uQzeZaxGdOT7VrDe3gMBdlbalFMW02Ts4xoXuTQNy+BibHD+txYVlePjjycD1j
	Rf8YL+ITaSCmU1DZnJeAd7dRZnx5lPHmD00nmwIoFR0uzsvYGqJpSaOovc9HMtydphPO5R+a+FR
	7/6179bIxl0LhR/mmeyQPICmUEgfccnMo5C8lgTsBW1sGIymIsa//qjL+tmtjDrlcRmQMTdSiwV
	/2HG1wvnjdb7ebfVSu9XaspOnjqYre+wE2Hwu9ifpFkERIbz98XNVWURVV8VFqK5DLP0chTzDCQ
	xqTUSPjYFuG/QARSt+aNYWzZuF7EX2jBi8kgdcc7PYKX1NmJ2Yy5844FHfi+qgt5fhVUr9riHs6
	gkASg==
X-Received: by 2002:a05:600c:1906:b0:49e:8418:3858 with SMTP id 5b1f17b1804b1-49eb51902b2mr69856685e9.9.1789634420986;
        Thu, 17 Sep 2026 01:40:20 -0700 (PDT)
Message-ID: <99f7bb36-14c2-474f-83e9-b36ae62a1f1a@gmail.com>
Date: Thu, 17 Sep 2026 10:40:19 +0200
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
 <0d13b587-0920-4958-9a17-425d1a23d51e@gmail.com>
 <16ffbf4e-0178-4089-b279-d39e97ab885f@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <16ffbf4e-0178-4089-b279-d39e97ab885f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1789634421-CD14E87B-12B266C0/10/73395122804
X-purgate-type: spam
X-purgate-size: 3952



On 9/17/26 7:20 AM, Jan Beulich wrote:
> On 17.09.2026 07:12, Oleksii Kurochko wrote:
>>
>>
>> On 9/16/26 3:02 PM, Jan Beulich wrote:
>>> On 16.09.2026 07:55, Oleksii Kurochko wrote:
>>>> On 9/14/26 2:12 PM, Jan Beulich wrote:
>>>>> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>>>>>> --- a/xen/arch/riscv/imsic.c
>>>>>> +++ b/xen/arch/riscv/imsic.c
>>>>>> @@ -689,5 +689,15 @@ int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
>>>>>>     
>>>>>>     void imsic_migrate_vcpu(struct vcpu *v)
>>>>>>     {
>>>>>> +    /*
>>>>>> +     * The scheduler can mark a freshly created vCPU's unit as migrated and
>>>>>> +     * invoke this before the vCPU has ever run (see the migrated branch in
>>>>>> +     * schedule()). No need to do migration for such vCPUs as they aren't fully
>>>>>> +     * initialized (for example, context_switch() will be called after
>>>>>> +     * imsic_migrate_vcpu()).
>>>>>> +     */
>>>>>> +    if ( v->arch.last_cpu == NR_CPUS )
>>>>>
>>>>> May I suggest to use >= ? I'm still somewhat unconvinced of NR_CPUS being a
>>>>> good sentinel. If we/you decided to switch to ~0, >= here would continue to
>>>>> be correct.
>>>>
>>>> I agree with >= but I am not quite sure that I fully understand what is
>>>> wrong with NR_CPUS. We have for example the following:
>>>>
>>>> static inline unsigned int smp_processor_id(void)
>>>> {
>>>>        unsigned int id = tp->processor_id;
>>>>
>>>>        BUG_ON(id >= NR_CPUS);
>>>>
>>>>        return id;
>>>> }
>>>>
>>>> So it is guaranteed that NR_CPUS what be used as cpu id and so it still
>>>> could be considered as a good sentinel.
>>>
>>> Arbitrary numbers can be problematic when used as a sentinel. If you look
>>> at disassembly, you may not recognize that number as a sentinel. Further
>>> there's also a code-gen concern: ~0, aiui, will always generate the same
>>> code (to e.g. load into a register). NR_CPUS, depending on .config, may
>>> not. The value may not be loadable by a single insn.
>>
>> Witch such explanation it started to be more sense in it.
>>
>> I will introduce then
>>
>> /* Value of arch_vcpu.last_cpu for a vCPU which hasn't run yet. */
>> #define VCPU_NEVER_RAN (~0U)
>>
>> and use it to work with v->arch.last_cpu.
>>
>> Just to be sure that I understand correctly your suggestion with ~0U is
>> only for the case of ->last_cpu and check if vcpu was ran or not.
>>
>> For
>>
>> struct pcpu_info pcpu_info[NR_CPUS] = { [0 ... NR_CPUS - 1] = {
>>       .processor_id = NR_CPUS,
>> }};
>>
>> and
>>
>> struct vimsic_state {
>> ...
>>       /*
>>        * s/w IMSIC VS-file -> vsfile_cpu == NR_CPUS
>>        * h/w IMSIC VS-file -> vsfile_cpu < NR_CPUS
>>        */
>>       unsigned int vsfile_cpu;
>> };
>>
>> I can continue to use NR_CPUS, right?
> 
> You _can_ everywhere. It may merely be beneficial to use ~0 instead, at
> least in some cases. The "how to load value into a register" aspect of
> course doesn't affect static initializers. The "easy to recognize" one,
> otoh, may apply there as well. You get to judge...
> 
I checked how NR_CPUS is used and it is okay to change to ~0U for 
vsfile_cpu mentioned above as it could really affect how to load value 
into a register but I am not sure about .processor_id as it is just 
static initializer (maybe just for consistency).

Also as hartid_to_cpuid() returning NR_CPUS to follow the common 
convention of returning an out-of-range CPU number when nothing was 
found (like cpumask_first() / cpumask_next() do), so callers check the 
result with >= rather than against a specific sentinel.

If to use ~0U for vsfile_cpu then suggested name VCPU_NEVER_RAN isn't 
good. Then probably CPU_NONE will be better.

If we will start to use ~0 instead of NR_CPUS then IIUC it won't be any 
sense to use ">=" suggested above and "==" could be continue to be used, 
right?


~ Oleksii

