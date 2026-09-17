Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32710C982C1
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2026 05:21:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423646.1648619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x74YJ-0005HS-St; Thu, 17 Sep 2026 05:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423646.1648619; Thu, 17 Sep 2026 05:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x74YJ-0005HL-QK; Thu, 17 Sep 2026 05:20:55 +0000
Received: by outflank-mailman (input) for mailman id 1423646;
 Thu, 17 Sep 2026 05:20:53 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x74YH-0005HF-NY
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 05:20:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x74YG-0013Uh-IW
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 07:20:52 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aab78ab-2eae-0a2a0a5409dd-0a2a4502ba0e-8
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 07:20:52 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aab78b3-6ca4-0a2a45020019-4a7de18cf8ff-3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 07:20:52 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b912e2406so1831965e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 22:20:52 -0700 (PDT)
Received: from [10.59.3.202] ([146.0.124.57]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e847fcbdfsm83662125e9.4.2026.09.16.22.20.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2026 22:20:50 -0700 (PDT)
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
        d=suse.com; s=google; t=1789622451; x=1790227251; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TndC/rN9SBBgQkXeBDyMqo06diiHoj5sgSiTaP7wOIY=;
        b=Uu6A5BxqknrA6TnbglbHYtOoso2wF4KUfHtXCMUZhyhifdwYaYYOmSTVCudVp0pWZ0
         rA253RrP2vGzEMBICuwJLDldoMQh0EAHavmaN22VOJsrpkAD98P7YbOwObYt1xUycfXt
         BbW4o/KsrVWR1t1sOevND92nWo1oBfd+fCcsAt05pqTEx86QGCai74fdUCw/BzRvTLc4
         9HhIUQfIzvo4QoyCQ1ePbgyIogwBHMArKGgT61JEvO021TKUIpzoPSt+birAJ+TPSwDo
         xqi4KFoyCb7sg/Pc2tAlsC0xrECDwzCjOXYdtRieSxwVBV4+mEgL/jbKOrTggZGvFUVe
         +yBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789622451; x=1790227251;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TndC/rN9SBBgQkXeBDyMqo06diiHoj5sgSiTaP7wOIY=;
        b=LL8LnUzMDaVAbspo4aTE6T+r1hIrr0kMxWvViUlz+EWQbMR9HH3ACeUqGZm56aDwyz
         FRaGgzpjNUiyg6M4a7EyFL8RyB7PU7d3jc8/5h4lTa68dz6WcAJzh3SdfZDhTp8loSs9
         D8oavafsMbF1TPHTt2gai+4ljD0odr86lxzL+bpo31Dkchcunl5y3rmQH3Kxhycyjmcs
         l3nVe1htG0LTy18Lx6cyemdIz7htF2M2eeJaDgArfOf8uNF4+gUVyYrL3la7kHBA7WxA
         qL6SG6w9dO4aXNb+2BGurqk/+j7GPesyBpWxQzGQAmlq3HOIT3k/+ZRHfJP/pB5GMv/J
         ruMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFNrZTJQSZC8uwPue/ojaiTvq0r85zMuew3b3UzxDWyLFK0zuoVY30jXEBx1rsm5ht4Cpjyt7l0B8=@lists.xenproject.org
X-Gm-Message-State: AFuF++lxa0VJy4N+s+Kr5LaVLdYDkZplF7k5IQD1H3fSxoY3W3IQlWMw
	WOkhOXwGPpOhjyq9UJ/ayNLswNiWF1x9PXgmBSE+6shKT0WylcjJLc6mYTsXBnSiiQ==
X-Gm-Gg: AYBFou1kMumISQgXjul+HVhwBpBVqtwQ7jcvvI04q6UKetuJB5PrffkqcWaK8ELskQd
	yHPFRYG6T3xScoYVrKO5w8AAJYJ1AOFQysWzEtvMrEP6WobsdsDKHIouS1o9ZDhis9lyT5J2O6r
	xzagdls0A4QKSADMW95SoO5ze0IOTzZMFN95cX8wvbW87dGQX24LKZsjR1F7Ri4eSUu2U6VW2I4
	J4RGTgfXwhBFAnvHRRBTazojJo46cM8gono27H3q2JXNvKIEKT6kjsh2CvneHTTnTnqYecMe0Aj
	BaN9LeplbpgvwMmNDc6zqMDg+xB8vgMzeU1x5Cb5HzYolgmL/4NUK/5mBfc86zLZRHvRFbL3d0y
	9kkcq4Likf2MVaECVqG42LWULFO7KpsiF/iPVobZWu7xVG6cAjXLL/mrHsZT+J7sGabt0K0XuJZ
	BUN0G86TofKtOwEBWn/gzP9Xto1Liufs5XkUpMnfoECMHIhv+VGB8tdeDB5ocMpMUIxVIiTY5eV
	xo=
X-Received: by 2002:a05:600c:4796:b0:49d:257c:a735 with SMTP id 5b1f17b1804b1-49fbd1ddf38mr13099805e9.11.1789622451583;
        Wed, 16 Sep 2026 22:20:51 -0700 (PDT)
Message-ID: <16ffbf4e-0178-4089-b279-d39e97ab885f@suse.com>
Date: Thu, 17 Sep 2026 07:20:48 +0200
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
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0d13b587-0920-4958-9a17-425d1a23d51e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1789622452-F12A12AC-48FDC98D/0/0
X-purgate-type: clean
X-purgate-size: 3000

On 17.09.2026 07:12, Oleksii Kurochko wrote:
> 
> 
> On 9/16/26 3:02 PM, Jan Beulich wrote:
>> On 16.09.2026 07:55, Oleksii Kurochko wrote:
>>> On 9/14/26 2:12 PM, Jan Beulich wrote:
>>>> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>>>>> --- a/xen/arch/riscv/imsic.c
>>>>> +++ b/xen/arch/riscv/imsic.c
>>>>> @@ -689,5 +689,15 @@ int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
>>>>>    
>>>>>    void imsic_migrate_vcpu(struct vcpu *v)
>>>>>    {
>>>>> +    /*
>>>>> +     * The scheduler can mark a freshly created vCPU's unit as migrated and
>>>>> +     * invoke this before the vCPU has ever run (see the migrated branch in
>>>>> +     * schedule()). No need to do migration for such vCPUs as they aren't fully
>>>>> +     * initialized (for example, context_switch() will be called after
>>>>> +     * imsic_migrate_vcpu()).
>>>>> +     */
>>>>> +    if ( v->arch.last_cpu == NR_CPUS )
>>>>
>>>> May I suggest to use >= ? I'm still somewhat unconvinced of NR_CPUS being a
>>>> good sentinel. If we/you decided to switch to ~0, >= here would continue to
>>>> be correct.
>>>
>>> I agree with >= but I am not quite sure that I fully understand what is
>>> wrong with NR_CPUS. We have for example the following:
>>>
>>> static inline unsigned int smp_processor_id(void)
>>> {
>>>       unsigned int id = tp->processor_id;
>>>
>>>       BUG_ON(id >= NR_CPUS);
>>>
>>>       return id;
>>> }
>>>
>>> So it is guaranteed that NR_CPUS what be used as cpu id and so it still
>>> could be considered as a good sentinel.
>>
>> Arbitrary numbers can be problematic when used as a sentinel. If you look
>> at disassembly, you may not recognize that number as a sentinel. Further
>> there's also a code-gen concern: ~0, aiui, will always generate the same
>> code (to e.g. load into a register). NR_CPUS, depending on .config, may
>> not. The value may not be loadable by a single insn.
> 
> Witch such explanation it started to be more sense in it.
> 
> I will introduce then
> 
> /* Value of arch_vcpu.last_cpu for a vCPU which hasn't run yet. */
> #define VCPU_NEVER_RAN (~0U)
> 
> and use it to work with v->arch.last_cpu.
> 
> Just to be sure that I understand correctly your suggestion with ~0U is 
> only for the case of ->last_cpu and check if vcpu was ran or not.
> 
> For
> 
> struct pcpu_info pcpu_info[NR_CPUS] = { [0 ... NR_CPUS - 1] = {
>      .processor_id = NR_CPUS,
> }};
> 
> and
> 
> struct vimsic_state {
> ...
>      /*
>       * s/w IMSIC VS-file -> vsfile_cpu == NR_CPUS
>       * h/w IMSIC VS-file -> vsfile_cpu < NR_CPUS
>       */
>      unsigned int vsfile_cpu;
> };
> 
> I can continue to use NR_CPUS, right?

You _can_ everywhere. It may merely be beneficial to use ~0 instead, at
least in some cases. The "how to load value into a register" aspect of
course doesn't affect static initializers. The "easy to recognize" one,
otoh, may apply there as well. You get to judge...

Jan

