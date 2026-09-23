Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6637C9830B
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 18:31:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1431218.1653468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Rk1-0004Je-6r; Wed, 23 Sep 2026 18:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1431218.1653468; Wed, 23 Sep 2026 18:30:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Rk1-0004JX-2g; Wed, 23 Sep 2026 18:30:49 +0000
Received: by outflank-mailman (input) for mailman id 1431218;
 Wed, 23 Sep 2026 18:30:48 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x9Rk0-0004JQ-1e
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 18:30:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9Rjz-00E21G-En
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 20:30:47 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab41ac9-2eae-0a2a0a5409dd-0a2a4505b454-32
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 20:30:47 +0200
Received: from [74.125.225.106] (helo=mail-wr2-f42.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab41ad2-4cb1-0a2a45050019-4a7de16a8064-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 20:30:42 +0200
Received: by mail-wr2-f42.google.com with SMTP id
 ffacd0b85a97d-482f6351832so803965f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 11:30:42 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4886877a2d5sm8602379f8f.27.2026.09.23.11.30.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 11:30:41 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790188242; x=1790793042; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q8IjnyHBIb8twytu5XIRV8far1iW2HRZH+bNJVqG0qU=;
        b=sGEReVDASxvEMhtcEhw7kdlXCv1g3PH6IlX68Q0F4jKqVtXQN++XIhBROiwhnI0XVp
         WyyZoPFnY7V+sbJmemovaioRaczjc5ojXnSOJg1X7+BEIerkbf0RDK2AtuPGUwqhyeMp
         elWH+9nh98BNFTgOtChEWjEqnz2xNyFtKfeVwE4Bk9plFTBv92ZDHQtOM8VCxWInXHv1
         HVXw3PAIerkRwmr/E/G1ny+Zu+fGi0sR5vObHkRNDBncP1NW2AxmOgr15iMKwNt+mRfd
         LfABJxM7Scn/H9jJLmps2lONnfFQfUUzqTJFXbRiRUuLETIZ5ebubXIC9nGPLav/Q1/V
         ttdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790188242; x=1790793042;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q8IjnyHBIb8twytu5XIRV8far1iW2HRZH+bNJVqG0qU=;
        b=ewXmfs3q0VEdcD78w+6GO/hzV4TMS+0Hc11Q46ntLgde9XJ9yAuCpBxcgJ//C3r81x
         gX9L6AhVGLVl0t9fT5zSTWqNMwuU/CSBbQ7sQXyqwWe0zEI35xDpQ2rXlCiB6tlVG1tv
         ey+Z7P4/Tlr0m4DSgzwPvi7lkJGy4JksQhMrOrWhGposx3i66kC5jjr8W+Va4vhsyLB9
         3X3VcxHfrfTefSozCEO61/QHM652cTZxE0lnek/j6zIvRviRBfoe4T/3TLQ/EKjvaeX5
         3ifTN3Tj0TkOKrp+jTWc6l8M9ZY6li3p5W0RtM2yNHx5c/V8n5WTHXrOjS76O/NKGLTJ
         8Z6w==
X-Gm-Message-State: AFuF++lJYTr3N4KO7HnHO1KXT6o7/dspik+DG9Q3GkOfHVxfhoYQbQpQ
	brv+hR9/E9BbPJtx5LVe/h8qzYOdUPJZjjsJ8R3ZK1mujIxZTvfa9Fe1
X-Gm-Gg: AYBFou0r7ArxDyk/ahn7SZ5/yHJoGswboqYg6Qo3zHakEyd48O1UyrCehqcL4Ro68la
	RJvJCWeI6wJBPYK+pCJe39CbEYzmjGNPvwkl6G2B3MAyTS4Jlj9X78p74bQsB5jsS7+NIR0T4gl
	iqW8mZlHpwb6BtquQ8Y4Yqc7KAxiS3w0QGCGxJUTlFdF0GRnIxAa2yoQBDPsZGzkO7OINlQ3LNm
	wgXBaoGaNRQtVil2ignEsFv+NoCdZe4muLlQ4S6KqhyA8w6n00/zgn6WnllAAQakIew8Wbk18HT
	iIDVwhGmxvrTaOd/6aQK69VETQnyIasfFj+lRCU/yeZrH4coaTg7E3T81krAGO3ViUbtrrzECyu
	09dtu/Jk2qtcA7ZR/n+IcIXMnG97RwXJZSdJInW+xcTDALcZXJBvTdH5VV5tF5MvqDq/lCdHhvh
	+bthkgPk+Y7m8JFdLxUsSNxk1Ru2+gmQdPDulZL5o6PyUMcgcZktMel/ICz+8mi1TuwaOfQxBFB
	EHRv89+wgn0vL15lO5kyhMIqeFSiglbB6tJZpOD47nIeDuRf1ds7QQjUu9l
X-Received: by 2002:adf:e189:0:b0:486:e5c6:cab with SMTP id ffacd0b85a97d-48867093bc0mr6972710f8f.32.1790188241675;
        Wed, 23 Sep 2026 11:30:41 -0700 (PDT)
Message-ID: <efb980c5-f0a4-485c-a4af-80ecd15cf399@gmail.com>
Date: Wed, 23 Sep 2026 20:30:40 +0200
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
 <ec47ff4f-68a2-46aa-a128-4663ebd95c7e@gmail.com>
 <1790180167.8631fc262581453bbf619ec5b2062170.1a0cf0d8f3d00072c4@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1790180167.8631fc262581453bbf619ec5b2062170.1a0cf0d8f3d00072c4@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1790188242-247132A1-6F8F43FA/10/73395122804
X-purgate-type: spam
X-purgate-size: 5817



On 9/23/26 6:16 PM, Baptiste Le Duc wrote:
> On 2026-09-23 18:02 +0200, Oleksii Kurochko wrote:
>>
>>
>> On 9/23/26 5:15 PM, Baptiste Le Duc wrote:
>>>> At the old interrupt file, dump to memory all the eip and eie arrays).
>>> Typo `)`
>>
>> Will drop `)`.
>>
>>>> After this step is done, the old interrupt file is no longer in use so
>>>> old intrrupt file VGEIN could be released.
>>>>
>>>> Restoring of old interrupt file state will be done in follow-up
>>>> patch.
>>>>
>>>
>>>
>>>> There are cases where it is needed to specify on which cpu it is
>>>> necessary to VGEIN should be released so update vgein_release() to
>>>
>>> The sentence miss a verb, here is a proposal:
>>> ```
>>> There are cases where the cpu on which the VGEIN is released needs to
>>> be specified, so update vgein_release() to deal with that.
>>> ```
>>
>> I think it could be dropped at all as vgein_release() stub is just
>> introduced here and not updated.
>>
>>> Moreover, could you explain me the cases you are talking about? It's not
>>> clear by reading the commit message in the first place.
>>
>> For example, during migration of vCPU, vCPU->processor points to new CPU
>> where it will be run but we still have to free VGEIN on the prev.
>> ->processor.
>>
>>>
>>>
>>>> deal with that.
>>>
>>>
>>>
>>>
>>>>
>>>
>>>
>>>> Keep BUG_ON("unimplemented") placeholder in imsic_migrate_vcpu() to guard
>>>
>>>
>>>> against silent incorrect behaviour or unexpected panics in guest VMs until
>>>> the function is fully implemented.
>>>>
>>>
>>>
>>>> vgein_release() is stub for now and will be introduced later.
>>>
>>>
>>>>
>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>
>>>> diff --git a/xen/arch/riscv/aia.c b/xen/arch/riscv/aia.c
>>>> index 75c82bcfa1..be3901ec0c 100644
>>>> --- a/xen/arch/riscv/aia.c
>>>> +++ b/xen/arch/riscv/aia.c
>>>> @@ -30,3 +30,8 @@ unsigned int vgein_assign(struct vcpu *v)
>>>>    
>>>>        return 0;
>>>>    }
>>>> +
>>>> +void vgein_release(struct vcpu *v, unsigned int vgein_id, unsigned int cpu)
>>>> +{
>>>> +    BUG_ON("unimplemented\n");
>>>> +}
>>>> diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
>>>> index 5e9f6995e4..3cba58e0c1 100644
>>>> --- a/xen/arch/riscv/imsic.c
>>>> +++ b/xen/arch/riscv/imsic.c
>>>> @@ -56,6 +56,24 @@ static unsigned int __ro_after_init guest_num_msis;
>>>>     */
>>>>    #define GUEST_IMSIC_MAX_MSIS 255U
>>>>    
>>>> +/*
>>>> + * The interrupt identities an IMSIC interrupt file provides are 0 (which is
>>>> + * never valid, but still occupies a bit) up to IMSIC_MAX_ID inclusive, so
>>>> + * IMSIC_MAX_ID + 1 bits have to be covered.
>>>> + */
>>>> +#define IMSIC_MAX_EIX DIV_ROUND_UP(IMSIC_MAX_ID + 1, BITS_PER_TYPE(uint64_t))
>>>
>>>
>>>> +
>>>> +struct imsic_mrif_eix {
>>>> +    unsigned long eip[BITS_PER_TYPE(uint64_t) / BITS_PER_LONG];
>>>> +    unsigned long eie[BITS_PER_TYPE(uint64_t) / BITS_PER_LONG];
>>>
>>>
>>>> +};
>>>> +
>>>> +struct imsic_mrif {
>>>> +    struct imsic_mrif_eix eix[IMSIC_MAX_EIX];
>>>> +    unsigned long eithreshold;
>>>> +    unsigned long eidelivery;
>>>> +};
>>>> +
>>> Maybe I didn't get something but I couldn't find anything in the commit
>>> message explaining why do we use mrif here.
>>
>> It is just convenient way to temporary store h/w interrupt file. Also it
>> could be used not only for ...
>>
>>>
>>> Moreover, mrif, as described in aia spec (8.3 Memory-resident interrupt
>>> files), seems to be only usable with IOMMU that Xen doesn't support.
>>
>> ... IOMMU but also to support more guest interrupts file implemented by
>> IMSIC (basically what I am calling as software interrupt file). Without
>> memory-resident interrupt files, the number of virtual RISC-V harts that
>> can directly receive MSIs from devices is limited by the total number of
>> guest interrupt files implemented by all IMSICs in the system, because
>> all MSIs to RISC-V harts must go through IMSICs. For a single RISC-V
>> hart, the number of guest interrupt files is the GEILEN parameter
>> defined by the Privileged Architecture, which can be at most 31 for RV32
>> and 63 for RV64.
>>
>>>
>>> If you want to have something in memory that could store some interrupt
>>> file info, we should take another name to not be confusing.
>>
>> It seems like it is okay to use memory residential interrupt file (mrif)
>> here based on KVM's code who are using mrif for the same purpose I
>> described above.
>>
>> In short, MRIF is a joint virtualization technology shared between the
>> IOMMU and the hypervisor. The IOMMU uses the MRIF as a memory target to
>> land incoming hardware MSIs, while the hypervisor manages these MRIFs in
>> RAM as software data structures to support an effectively unlimited
>> number of vCPUs that don't currently hold a physical IMSIC guest file slot.
>>
> Yes, I read the spec to understand but here, mrif doesn't catch the MSIs
> right?

Yes, because right now only h/w if(s) are supported. For now it is just 
a storage where we are saving temporary h/w interrupt file (which has 
the same structure as MRIF).
When s/w if(s) will be supported we will need to store somewhere an 
interrupt file in RAM and considering that the structure of h/w if == 
s/w if and basically == mrif thereby mrif is a good candidate. Even 
more, ...

> so it's not exactly the behaviour mentioned or you have in mind
> to add full support when IOMMU will be supported?
... IOMMU points to the the same structure so again h/w  if == s/w if == 
mrif from organization point of you.

And answering your question we have in mind to support IOMMU for IMSIC 
purposes and then we still will need mrif structure.

~ Oleksii



