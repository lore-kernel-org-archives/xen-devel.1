Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D13C61DD3
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 09:13:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1403853.1637808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0y4y-00024M-61; Mon, 31 Aug 2026 09:13:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1403853.1637808; Mon, 31 Aug 2026 09:13:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0y4y-00024F-24; Mon, 31 Aug 2026 09:13:24 +0000
Received: by outflank-mailman (input) for mailman id 1403853;
 Mon, 31 Aug 2026 09:13:22 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1x0y4w-000249-LA
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 09:13:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x0y4v-00EI6R-K5
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 11:13:21 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a9545a1-2eae-0a2a0a5409dd-0a2a4502b3b0-46
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 11:13:21 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a9545b1-6ca4-0a2a45020019-d155dd2fd8ab-3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 11:13:21 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-484392e3d33so578231f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 02:13:21 -0700 (PDT)
Received: from [192.168.1.109] ([88.230.40.90])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbb20122sm21314885f8f.20.2026.08.31.02.13.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Aug 2026 02:13:20 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788167601; x=1788772401; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bSin6Js2gCPHZZGDWSi0U8VJbZpW2FdB8ozBQJ9foqw=;
        b=LBgfeuOuAPifYlFfmie6ah3XC0Ffkq8Nxt6YjHIQuOVExKztcL/ynVEDH1ntvwj5EW
         5ze/zgLGOd/22zKO5mj2MJpR0X32jBOb+RHgKxWz1d572zntvYRP7QwBxG63SFQjtfF3
         9XVWiypnPTd3wg8ckQsityxB8YYmSvn9OfaQ6gzq6r/jfgC8RQDRJa/eidryW4KgE0AN
         rr9IxHXbqeOyuoKss7LsYoSnFpeoxDaqxkSD1qrWw184hKnC+jHZxraqo3FCWrFcngLU
         RELg6tfydY1Fu2r2I6ArC9/Snbc75J3wNmkngr4aC5zxbonl+W9xmXOeApu/+lngRo67
         hHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788167601; x=1788772401;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bSin6Js2gCPHZZGDWSi0U8VJbZpW2FdB8ozBQJ9foqw=;
        b=avMMRuigYZxTlNbqUNqxAfEL0DM7zsJcvpxTSMcikuaZcUeT2Cb5H6IQCM4VSX2w17
         KhPMjuK/q/jO+9o8f9Iypv3jYCq66jOoli1z7Z3wn2UtV6ITWqEzuftqTq1S52YNuJ3j
         bHU6BV0ERIiKIgMdnlmt7fg60dUDvkIQ3yWf6+YnYgx5XzH1mIHnnc+PPSYPrkfVSM0x
         dFe4R+/z1T9VtGijA9YJsgem7zpjb+hnjtKCQGo0NCnkBOsH6CqpDPV3hPi4GD4eHxRZ
         JWAHPofaO1vysF76N3jk2oxXusKJ8jVyWgMJ/ojsYRMB0DZSWDNEqhoNj2liUaCqaWlm
         50Wg==
X-Forwarded-Encrypted: i=1; AKwUvBwioVN/hM74b4rKZqV/J8CIe42kpfoQRWcGa9NKZmmVpLf8/4LCww0gatdLjxfZcPxDxTVfXyVbXRI=@lists.xenproject.org
X-Gm-Message-State: AFuF++nyJ/e4lcK5QLM10X82wemBFaXcxDYBZCFS9XClyhD1QR/92aul
	vSjAV44ricHXkN3Jy+p0CFFg7tDx+sjdXbK8nt5lAmZUn50g3Lzfn2WP
X-Gm-Gg: AYBFou1QVxghKh6WGj+o+o4b7/VTEaV/lidkzy6ymA12k773sCGq0exNLVFryKSmktK
	RQl0huocfBvT3Ho8jAUfJ0YK7KaReBSynVAHwFmNiJZj9C6qPxZoopAnvE7jDnHBWvaHcfcEPH0
	zlct2J9BWEe6IIpOAwQvAKlLqfMA5Vna7yBuiJuoRDgyqAuYxmOd8CuGIC1bysNWGlZ1pi8ut+V
	ygw6zDOxv7iNUONvbvmKBnM1mJs7FahqqIiwxsd35O8mPyT3mplBJ86wJZftmOBEk0ddnPy5bq8
	QR7mMD/TfOxN/h8pzUB57UzPxsG/ExvRScYuU3Auv0dYrA/2XHQe4X3WY7V0FU44MNT1lcA24Pw
	5YFiQNupHYYjVVs41yRhpPU4PoQPkStf1RGhD5uUFNyR4CH4R8tMS2oH1ho7tvMjgmfrQQYSMM7
	xHJiAcS34NLD4E51+1pSrDFJzgROB/zCcx+uy44WJUHaWLnBHF7uuX1dNOaseYHkyyg3k=
X-Received: by 2002:a05:6000:70f:b0:484:3328:4a5c with SMTP id ffacd0b85a97d-48433284c41mr21916625f8f.28.1788167600773;
        Mon, 31 Aug 2026 02:13:20 -0700 (PDT)
Message-ID: <1d656813-176f-49a7-8a92-a156c5dc3821@gmail.com>
Date: Mon, 31 Aug 2026 12:13:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] xen/common: add vcpus_create() and keep max_vcpus
 in sync
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, dfaggioli@suse.com,
 gwd@xenproject.org, roger@xenproject.org, anthony.perard@vates.tech,
 julien@xen.org, bertrand.marquis@arm.com, michal.orzel@amd.com,
 Volodymyr_Babchuk@epam.com, teddy.astie@vates.tech
References: <20260831051637.5029-1-frn1furkan10@gmail.com>
 <20260831051637.5029-2-frn1furkan10@gmail.com>
 <33c1d613-054e-4940-a14d-9e47e673286b@suse.com>
Content-Language: en-US
From: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>
In-Reply-To: <33c1d613-054e-4940-a14d-9e47e673286b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1788167601-F3CBA2AC-1F7670CD/0/0
X-purgate-type: clean
X-purgate-size: 5954


On 8/31/26 11:13, Jürgen Groß wrote:
> On 31.08.26 07:16, Furkan Caliskan wrote:
>> Every vcpu_create() call site that builds more than one vcpu loops
>> over ids up to d->max_vcpus and stops on the first failure, but none
>> of them roll max_vcpus back to match. This leaves d->vcpu[i] == NULL
>> for ids below max_vcpus, which anything walking d->vcpu[] can then
>> dereference. This is what caused the crash: sched_move_domain()
>> walks every vcpu slot up to max_vcpus without checking for empty
>> ones, so when a domain built in a non-default cpupool had vcpu
>> creation fail partway through, domain_kill() later moving it back
>> to the default cpupool handed one of its empty slots straight to
>> the new cpupool's scheduler, causing a NULL-pointer dereference
>> inside sched_alloc_udata().
>>
>> Add vcpus_create(d): creates every vcpu of d up to max_vcpus and
>> rolls max_vcpus back to the failed id on error. This keeps
>> d->vcpu[i] is non-NULL for all i < d->max_vcpus, instead of guarding
>> every reader of d->vcpu[] agains holes individually.
>>
>> Convert every site that builds vcpus in a loop to call this function
>> instead.
>>
>> Fixes: 61649709421a ("xen/domain: Allocate d->vcpu[] in domain_create()")
>> Suggested-by: Juergen Gross <jgross@suse.com>
>> Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
>> ---
>> v3:
>>   - Reworked per Juergen's suggestion: instead of guarding
>>     sched_move_domain() against a missing vcpu slot, keep d->max_vcpus
>>     in sync with the vcpus actually created. Added vcpus_create() and
>>     converted every vcpu_create() loop to use it.
>>   - Reverted the sched_move_domain() check from v2, now unneeded.
>> ---
>>   xen/arch/arm/domain_build.c   | 15 +++++++--------
>>   xen/arch/x86/mm/mem_sharing.c | 11 ++---------
>>   xen/common/domain.c           | 24 ++++++++++++++++++++++++
>>   xen/common/domctl.c           | 19 ++++---------------
>>   xen/common/sched/core.c       |  7 +++----
>>   xen/include/xen/domain.h      |  1 +
>>   6 files changed, 41 insertions(+), 36 deletions(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 72d5316180..e08ee21ee5 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -1774,6 +1774,7 @@ static void __init find_gnttab_region(struct domain *d,
>>   int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
>>   {
>>       unsigned int i;
>> +    int rc;
>>       struct vcpu *v = d->vcpu[0];
>>       struct cpu_user_regs *regs = &v->arch.cpu_info->guest_cpu_user_regs;
>>   @@ -1842,17 +1843,15 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
>>       }
>>   #endif
>>   -    for ( i = 1; i < d->max_vcpus; i++ )
>> +    if ( (rc = vcpus_create(d)) )
>>       {
>> -        if ( vcpu_create(d, i) == NULL )
>> -        {
>> -            printk("Failed to allocate d%dv%d\n", d->domain_id, i);
>> -            return -ENOMEM;
>> -        }
>> +        printk("Failed to allocate d%dv%d\n", d->domain_id, d->max_vcpus);
>> +        return rc;
>> +    }
>>   -        if ( is_64bit_domain(d) )
>> +    if ( is_64bit_domain(d) )
>> +        for ( i = 1; i < d->max_vcpus; i++ )
>>               vcpu_switch_to_aarch64_mode(d->vcpu[i]);
>> -    }
>>         domain_update_node_affinity(d);
>>   diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
>> index 5c7a0ff30e..cd7f747c80 100644
>> --- a/xen/arch/x86/mm/mem_sharing.c
>> +++ b/xen/arch/x86/mm/mem_sharing.c
>> @@ -1612,21 +1612,14 @@ int mem_sharing_fork_page(struct domain *d, gfn_t gfn, bool unsharing)
>>     static int bring_up_vcpus(struct domain *cd, struct domain *d)
>>   {
>> -    unsigned int i;
>>       int ret = -EINVAL;
>>         if ( d->max_vcpus != cd->max_vcpus ||
>>           (ret = cpupool_move_domain(cd, d->cpupool)) )
>>           return ret;
>>   -    for ( i = 0; i < cd->max_vcpus; i++ )
>> -    {
>> -        if ( !d->vcpu[i] || cd->vcpu[i] )
>> -            continue;
>> -
>> -        if ( !vcpu_create(cd, i) )
>> -            return -EINVAL;
>> -    }
>> +    if ( (ret = vcpus_create(cd)) )
>> +        return ret;
>>         domain_update_node_affinity(cd);
>>       return 0;
>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>> index e16f1ac383..a0a3e51b15 100644
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -539,6 +539,30 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
>>       return NULL;
>>   }
>>   +/*
>> + * Create every not yet existing vcpu of d, up to d->max_vcpus. On failure,
>> + * d->max_vcpus is rolled back to the id that failed, keeping d->vcpu[i]
>> + * non-NULL for all i < d->max_vcpus.
>> + */
>> +int vcpus_create(struct domain *d)
>> +{
>> +    unsigned int i;
>> +
>> +    for ( i = 0; i < d->max_vcpus; i++ )
>> +    {
>> +        if ( d->vcpu[i] )
>> +            continue;
>> +
>> +        if ( vcpu_create(d, i) == NULL )
>> +        {
>> +            d->max_vcpus = i;
>> +            return -EINVAL;
> 
> I think this should be -ENOMEM.
> 
> 
> Juergen

Currently vcpu_create() can only fail because of memory errors, so
-ENOMEM would be correct today. But I've sent a patch series that
adds RTDS admission control, which would make vcpu_create() also
fail for a capacity issue, so I went with -EINVAL here to not only
tie it to the memory failure.

If you'd rather keep it as -ENOMEM, I'm happy to update it.

Furkan


