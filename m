Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB766C88E77
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 13:02:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423116.1648395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6pHF-0007sH-4r; Wed, 16 Sep 2026 13:02:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423116.1648395; Wed, 16 Sep 2026 13:02:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6pHF-0007sA-1x; Wed, 16 Sep 2026 13:02:17 +0000
Received: by outflank-mailman (input) for mailman id 1423116;
 Wed, 16 Sep 2026 13:02:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x6pHD-0007rn-S4
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 13:02:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6pHD-00Fe1R-7E
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 15:02:15 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aaa9355-bab6-0a2a0a5309dd-0a2a4505b124-10
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 15:02:15 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aaa9356-4cb1-0a2a45050019-4a7de18cfe9b-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 15:02:15 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49e66390995so5366535e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 06:02:15 -0700 (PDT)
Received: from [10.72.3.60] ([91.26.93.146]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e83da071asm95694245e9.8.2026.09.16.06.02.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2026 06:02:14 -0700 (PDT)
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
        d=suse.com; s=google; t=1789563734; x=1790168534; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vvV6WREj3Mr2sX4jitYZb1MyPJGMZ+/fVuQpQQtUfV0=;
        b=Y+v6xvUKFwP4Tt1ZaJN7/WihFKnNOlHejXzjfLtF7Mqh0aaqT7L55m0uckTjJeX65c
         jDyNd3+t9jMiaogpwADO8S0SWcPArirQI+b5H+RXUwWj/om6swDaAGLFWSGz2EUohPSk
         1juSVm9G6G18tyW6VYx3DUgNp1WHgM3a/2PDujyHqiSwIsNeVz04z6gPlxB242mBm6dO
         Mp6lh2qfUZqCXuOJw45xEB7vQ/F5WeMuynK809gTs1gzMZzOMgJDb/U04O2NUpoZ+8yJ
         yBTvJZWXy1a9s/rQu/NY3y+7k8MMBJM/ca6pj4fF+xvNxaQsaYzuhNOd0+DUb2j0/4io
         k0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789563734; x=1790168534;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vvV6WREj3Mr2sX4jitYZb1MyPJGMZ+/fVuQpQQtUfV0=;
        b=W0FKMemPRCva1e4cSC/oHZYYsOfRmAYXNjR7V4Qd3KXCh9o2pTNcixRq024X6tPCg5
         9jvHrVcXLeEt1HwKRyy9bpmvPW86VTjVab8i1qwGiKv9M0Pl7hezbNUsaBqYG+ulJgKj
         JCJY6zaUhiHyA70BVnxCzjxpirV2omI38b+npcnM5XBsqFtiCl6SyYEzLlydKlkjY38t
         9GpwkfybBQ+nJoNcmVzzBtxMZ7BaHymY9+Fa2JXVT3d7utxm9Iidg2zyDDvxPnyrkIge
         gdMjzdJlLRDyhAXZTYfU6IRLU6g47Ong57r92hf9HTwKkpq1p1FZp387MDR4jDmpmXse
         stpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxChVfUJd7j0smkEzMXz/djCyCEcHYvxxSr4FOOoa+LUxYXeOKSMqJt7sL+SQkEV2fjZLqBHN8KUwU=@lists.xenproject.org
X-Gm-Message-State: AFuF++kP4WV+X6qIAxE1iQMa6sqbnmWN0Ld9/4zbJ4+yQ7XZvwUh8rTc
	SlAQqVARaxLw5dRV5IEV0ZCrg1PBBQxqCrynG9MvhdtMEJTh8gHPxiZBNGB+VaC32Q==
X-Gm-Gg: AYBFou0R7C6W+I6uL6Axs4N2iRpugixHJkRfjiHBVp+Ir+P5HoLeBc6I5WNxfux68Cf
	TbAfrWl6l4NzoRnQyjL3PBTJE1F8bHaHmysUm1BQjRMFsgnPcTjR2/ESeoVSHuG4rvGa5I4fy8Q
	40OWNzWBa5DwGHQ85ryuffQAHOYEB9xfQVd9QxasIb7WuDhJMMxtc84b8VVfS2/W+81CelqCNFR
	+rIjafi5HMViJGrHECMaWpqMuArZ03qg03Oq1RKZKKBVoCS/3kDj663Bg6VkswQPmVMQwNLWcyw
	XubR49au58hYM+TAVdCywkGgrNJ2tdk9NKCixgjcSpIhWSUUYAculkhP/SeDk/i1SC0oqXYX+B5
	QaIB1Gz0lsBM+HoMTbtNvdredr71yxp/YV8Z5mBCuarqAWP1bHjb+DXUAs0XM6JhNwqTUaEOUt/
	GIm9JOFbM/c49L34mRgV6+61r39tEv1kA6RHsLsp8pGuyEiQ+gFQPfDdTeM8basSXfm/GrKHXeS
	A==
X-Received: by 2002:a05:600c:5486:b0:49d:1d7e:4085 with SMTP id 5b1f17b1804b1-49eb732347fmr29712515e9.22.1789563734516;
        Wed, 16 Sep 2026 06:02:14 -0700 (PDT)
Message-ID: <52c8ca00-423a-4c91-a60d-a1662d20a012@suse.com>
Date: Wed, 16 Sep 2026 15:02:11 +0200
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
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c6ac11cc-6428-4521-9752-558150a302b2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1789563735-F78BE2A1-29695A2B/0/0
X-purgate-type: clean
X-purgate-size: 1762

On 16.09.2026 07:55, Oleksii Kurochko wrote:
> On 9/14/26 2:12 PM, Jan Beulich wrote:
>> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/imsic.c
>>> +++ b/xen/arch/riscv/imsic.c
>>> @@ -689,5 +689,15 @@ int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
>>>   
>>>   void imsic_migrate_vcpu(struct vcpu *v)
>>>   {
>>> +    /*
>>> +     * The scheduler can mark a freshly created vCPU's unit as migrated and
>>> +     * invoke this before the vCPU has ever run (see the migrated branch in
>>> +     * schedule()). No need to do migration for such vCPUs as they aren't fully
>>> +     * initialized (for example, context_switch() will be called after
>>> +     * imsic_migrate_vcpu()).
>>> +     */
>>> +    if ( v->arch.last_cpu == NR_CPUS )
>>
>> May I suggest to use >= ? I'm still somewhat unconvinced of NR_CPUS being a
>> good sentinel. If we/you decided to switch to ~0, >= here would continue to
>> be correct.
> 
> I agree with >= but I am not quite sure that I fully understand what is 
> wrong with NR_CPUS. We have for example the following:
> 
> static inline unsigned int smp_processor_id(void)
> {
>      unsigned int id = tp->processor_id;
> 
>      BUG_ON(id >= NR_CPUS);
> 
>      return id;
> }
> 
> So it is guaranteed that NR_CPUS what be used as cpu id and so it still 
> could be considered as a good sentinel.

Arbitrary numbers can be problematic when used as a sentinel. If you look
at disassembly, you may not recognize that number as a sentinel. Further
there's also a code-gen concern: ~0, aiui, will always generate the same
code (to e.g. load into a register). NR_CPUS, depending on .config, may
not. The value may not be loadable by a single insn.

Jan

