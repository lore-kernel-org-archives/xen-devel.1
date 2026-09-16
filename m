Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B24C88E5C
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 05:56:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1422369.1647812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6icf-00038n-Gf; Wed, 16 Sep 2026 05:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1422369.1647812; Wed, 16 Sep 2026 05:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6icf-00038g-Dy; Wed, 16 Sep 2026 05:55:57 +0000
Received: by outflank-mailman (input) for mailman id 1422369;
 Wed, 16 Sep 2026 05:55:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x6icd-00038a-LJ
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 05:55:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6icc-004Vts-UA
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 07:55:54 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aaa2f5d-bab6-0a2a0a5309dd-0a2a4507bf50-34
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 07:55:54 +0200
Received: from [74.125.225.78] (helo=mail-wr2-f14.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aaa2f6a-b4ea-0a2a45070019-4a7de14e802f-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 07:55:54 +0200
Received: by mail-wr2-f14.google.com with SMTP id
 ffacd0b85a97d-482f6350f88so229114f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 22:55:54 -0700 (PDT)
Received: from [10.250.112.129] (h-213.61.72.154.host.de.colt.net.
 [213.61.72.154]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf344bfsm4295371f8f.27.2026.09.15.22.55.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2026 22:55:53 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789538154; x=1790142954; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+buq0Vktqq6Z2yLf/7utD+Vd5iA9eXlDjGCIuWpvIXo=;
        b=Fd976c4/ULh8Jz1E8rqeTnfzlWLMcwDk1hnhmJqBC/nC7YHAe2Z3x17NSc06N0K3Mc
         P3U9bpIkQAm+h9kAKFI5TUBcNKIx/6Necb2XBILGqE2A/WQp4SRlraMt7sKaBMZOsog+
         O4MDS60mmEzFnAi7YjjqSmDhxkS9HAZxVixknASD/w+tNs0aM5VLZoiM2gkyvEEWsnLy
         k9oBhi1WYE49RSOjMA1Etur2SQaUd7M8qpQPVfaWeVXI9+pBorgffCyT2s3y67cNh+Bs
         1+kqaqwAIL6LB3yumgfLAxS8vjPhzt8zSubQHCcI/ZZ0G8oLeJgZtDJt2WjA52cPAEO+
         HohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789538154; x=1790142954;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+buq0Vktqq6Z2yLf/7utD+Vd5iA9eXlDjGCIuWpvIXo=;
        b=tEdkSY2CBrflRJm37fMZBQIhrfbAga0pyF7+dyklgy2gZYseGAZbI0Frn5qJbJ3sZY
         dUevObMqIaCi5c/ZQ8TlnZG15pAWlCqTas/ct+GQSu/i5ifsn0MdMsFcaMDV3gI9PiPK
         tAMrBnmQ/Mr2eeMuy2+v6QTJKzyQyWYMnVoc6lhE4kZuc11UAHi45RwLyhPMNmT9rVVg
         L5Ny2rbN+91zDRCEufrsLKTuKdkIrqdIvHQRnhU36jtukikhgD12YnYFm0XrFTyPNj/w
         e6ZcpOK+zmIq4FU/YCME8IIc9W2l0G+DVhbl7X6WGAAwwukCQXm4Q+w3tGJ/gOHI2s9D
         iRJg==
X-Forwarded-Encrypted: i=1; AKwUvBxHmEyC60NspH+On4JG9nqs8sPgX0jrbCYWEKXJ0oJA/RN5nGyjvnDqUviKzinSCDIPtagfuI9456k=@lists.xenproject.org
X-Gm-Message-State: AFuF++l/feUvbbn8N6t31Ye0EqjsfJr+A+seuTqVpLGO5rE/DJCMtUte
	dVOajRs5kQcNrmD9BzoiY0Rhw83gBpxG9+sm4wWVji0DLqa9FLU1QoaX
X-Gm-Gg: AYBFou1h46kLObkom1kEQ6JYhV9GaMeD37lPHcqHg/NwL0HBvvlh1okCiR9J78OyIqj
	oTKXZVTLTq86AMphv0PaxjSBA0JJOYFPGqY7OwXSbjyoQq3bi0IwhEx4KgLyTSD9sZUhWYgChAd
	oXGp6m1n4UvVI4ySU49uRq8/QnZdugC0JvZfuUVm14Sr48PCgJp1OMUccYywlVXvPDzjdJTq4pd
	gPpCl+HMRJnI3f9YkehSyRBUYPX+M+LVxulfsnUnRX4EccaLOZ8+i3TGnSZOtH4MnhYkdBUCQh/
	x8lS1NVlOggnDl1cmjiFaMHz+ea2lq2gR0OGkK4LKVuKEGwETHx/xN1/sgS1sJgzyN79ubthCkY
	qHi42lFzAY8x965HM/CyY+jn9BFquBaGL14rj4O2gnYui6OAz7QAMk4RKfym6gy+Wbm0Akq2/TH
	/g+IlUpOTTMw0dkPqgcKPDn3gV7+mOaRsYACaQOgAKOqxCwUU/2DF7NuOKR7Xrf4JHz98XRvU2j
	atv9GANbvOnbNetHYbs31WOSTiInBlssNTVarOiyUy/dj+P
X-Received: by 2002:a05:6000:3110:b0:487:952:bb75 with SMTP id ffacd0b85a97d-4870cf0a036mr1586757f8f.7.1789538154205;
        Tue, 15 Sep 2026 22:55:54 -0700 (PDT)
Message-ID: <c6ac11cc-6428-4521-9752-558150a302b2@gmail.com>
Date: Wed, 16 Sep 2026 07:55:52 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <63eb5954-0c34-4cec-9037-b25724b68f47@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1789538154-A74D3AE4-D01EA2A2/10/73395122804
X-purgate-type: spam
X-purgate-size: 2170



On 9/14/26 2:12 PM, Jan Beulich wrote:
> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>> The IMSIC vsfile mapping is performed in continue_new_vcpu(), since the
>> target pCPU must be known at that point. It is therefore possible for
>> imsic_migrate_vcpu() to be called before continue_new_vcpu() has
>> executed, in which case v->arch.last_pcpu is NR_CPUS and there is nothing
>> to migrate.
>>
>> Add a BUG_ON("unimplemented") placeholder in imsic_migrate_vcpu() to guard
>> against silent incorrect behaviour or unexpected panics in guest VMs until
>> the function is fully implemented.
> 
> This doesn't adequately describe the change made: The BUG_ON() was already
> there.

Agree, it should be just:

Keep the BUG_ON() at the end of the function until imsic_migrate_vcpu() 
is fully implemented, to avoid ending up with a vCPU which isn't fully 
migrated to the new IMSIC interrupt file.

> 
>> --- a/xen/arch/riscv/imsic.c
>> +++ b/xen/arch/riscv/imsic.c
>> @@ -689,5 +689,15 @@ int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
>>   
>>   void imsic_migrate_vcpu(struct vcpu *v)
>>   {
>> +    /*
>> +     * The scheduler can mark a freshly created vCPU's unit as migrated and
>> +     * invoke this before the vCPU has ever run (see the migrated branch in
>> +     * schedule()). No need to do migration for such vCPUs as they aren't fully
>> +     * initialized (for example, context_switch() will be called after
>> +     * imsic_migrate_vcpu()).
>> +     */
>> +    if ( v->arch.last_cpu == NR_CPUS )
> 
> May I suggest to use >= ? I'm still somewhat unconvinced of NR_CPUS being a
> good sentinel. If we/you decided to switch to ~0, >= here would continue to
> be correct.

I agree with >= but I am not quite sure that I fully understand what is 
wrong with NR_CPUS. We have for example the following:

static inline unsigned int smp_processor_id(void)
{
     unsigned int id = tp->processor_id;

     BUG_ON(id >= NR_CPUS);

     return id;
}

So it is guaranteed that NR_CPUS what be used as cpu id and so it still 
could be considered as a good sentinel.

Thanks.

~ Oleksii


