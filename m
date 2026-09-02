Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138BAC624D3
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 13:29:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405910.1639342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1l1k-0005yn-2u; Wed, 02 Sep 2026 13:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405910.1639342; Wed, 02 Sep 2026 13:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1l1k-0005yg-0E; Wed, 02 Sep 2026 13:29:20 +0000
Received: by outflank-mailman (input) for mailman id 1405910;
 Wed, 02 Sep 2026 13:29:18 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x1l1i-0005ya-6w
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 13:29:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1l1h-004I26-G1
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 15:29:17 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9824a8-8faa-0a2a0a5109dd-0a2a4505bf60-20
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 15:29:17 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9824ad-4cb1-0a2a45050019-d155802fdd9a-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 15:29:17 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-499ac87c92bso10362775e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 06:29:17 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e6f604sm6482517f8f.2.2026.09.02.06.29.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 06:29:15 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788355757; x=1788960557; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tAlUjlmyv4q1cod1GTkTt95vKxYmRGexBK1P5HXBrXk=;
        b=qogptg/dNu7NZQIaXKugfdqsjrce7Rg/VX+PLKJbeVL4IKJe1xBR7Hd4R4OAST8EEc
         kP+RiUFM0PeKZlAkt+Z0R1uhV33sSF379tW6CS8kwFEh0uj5BM3+mzCqwxcqfmrYn/Kf
         PYvhvauAF9ttWX177c2pBCkKr2eiEAkV+VENr2lzcGQmzIZslRtLFb3BT/SJI7c07ejx
         0DOBatkspQGptcNTdcW8Vk2GPeNVF+zjDwYsxMmATlTN9L83cvsZzCyIxGVHbSGkX200
         r84zTnOaStUDnI3EI3Mlh8mZI53Ggd6hnFMDEg1hq+lpuDbvE4WcD9JIYdPYyNHoNOyp
         aURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788355757; x=1788960557;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAlUjlmyv4q1cod1GTkTt95vKxYmRGexBK1P5HXBrXk=;
        b=hvOaTyUh03wtF8XiOd8xWmE+lfho7l97xAlLg5WZsRAUV0AfBn4m6qJ5Q3IGJdwmzH
         sfh54Cn8UyAY4RVBV4kTM2d3vfkjzDVwaDQvG2cxeSFQuLY8cgDBtD86InlOpVYiSAlc
         KnTOMBU8fNpwEUWkEQnEzfp1cqeHjl+xNzUv1H8RAKxcTkv/+bcSNibaK55YINXnIE/2
         Vhap0350kU5c14CBHq1GvD0m4jNMVbxno58Cnt//oIb/8ymBGp5wk4WNqHU0v82/LPeD
         Gzwz5gm4Xc8J5ugK0tFEvNoqjtFSS4aLcM/j5kE0QdKkPxYUwj3TzOh2Xo+LwFAP0Mfo
         pgDw==
X-Forwarded-Encrypted: i=1; AHgh+Rpb99KrvHVyBpeZuh9GpOhd4ogAwCGUsI1guCC787gB4qhxv5E4rVz4nnm5ImPJy5ACrd7YFLRSMjo=@lists.xenproject.org
X-Gm-Message-State: AFuF++lL/ucZ+7LGAf3/xhX/IfoqYKYQ80QlCYbu+oUwZ0t0vMqKuKoM
	CvY7HCkgYryZCbT0cR3I7+SGOBvjGaUOT56LCYqCuusDgqas8FXcuBZA
X-Gm-Gg: AR+sD13BJlvxGyTyWy0035fExlcXdFNuKz+ImQ9IFdEKUdxVwzQjM0yJbGHJGGMZtlA
	mr7MMo9tc1qkktED+RRVhMb6Y0+CFp6rreOc20sg0Vu/ZGm1XNKnaq3ZSvfpTztUnMrvi2OGEkS
	Q0wVXM6kGrDnTcrOsfCD4IP5KClUQhG/lKHN/9htSiEjJjrpQtoZgR+Qmmj5ZwGlqHBIpkU2jyd
	PNTdEGpicYg5nFGOC/Jbvek2twW48KItCyB7IT8ZLcOfgDsCHnocuQzp2/jOd49SPa7zbLDhijP
	njaE8omBOsbKCJfPnoz6ZZPe1QUZW4OsFyExia5pKQ7dwGtu8msB6NPgyiNpqCR+BIvO4/Erpz/
	NdAvnil13Zj+5HMeE8r6hGuMIti9pdYVnwpI8abfkfo6tieOyifaN6ZWvFfUqLyuLZm8RS3Dm5B
	QCSpysez+M5PYrTzTggcnB03lYHYU0xLQfyfFgk6fADzSg1em3IkWghAdlhmEhuq5M9/yehuft4
	MnC2Iwq7nqvh/D+PAvCbQaAOVWALhA2bBk8IsL4og==
X-Received: by 2002:a05:600c:37ca:b0:49c:cf18:494e with SMTP id 5b1f17b1804b1-49ce5819a2fmr94675505e9.12.1788355756355;
        Wed, 02 Sep 2026 06:29:16 -0700 (PDT)
Message-ID: <edf010a3-5e76-4ed8-a660-b6f7f9d19ff2@gmail.com>
Date: Wed, 2 Sep 2026 15:29:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/39] xen/riscv: set the guest's XLEN explicitly in
 hstatus.VSXL
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
 <a3ae79823e24f2e18cef2fac8ffffe7caa608f32.1787838835.git.oleksii.kurochko@gmail.com>
 <825ea854-5778-4cb6-a9a9-0ff97fa7bee5@suse.com>
 <127e8aea-4d65-492e-8bda-bffc75f02481@gmail.com>
 <071c5b4f-1d57-4223-94bd-9f8ae8d80366@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <071c5b4f-1d57-4223-94bd-9f8ae8d80366@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1788355757-72EB12A1-EA8EDF1F/10/73395122804
X-purgate-type: spam
X-purgate-size: 4061



On 9/2/26 3:07 PM, Jan Beulich wrote:
> On 02.09.2026 13:42, Oleksii Kurochko wrote:
>> On 9/1/26 5:20 PM, Jan Beulich wrote:
>>> On 27.08.2026 17:20, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/domain.c
>>>> +++ b/xen/arch/riscv/domain.c
>>>> @@ -88,7 +88,13 @@ static void vcpu_csr_init(struct vcpu *v)
>>>>    {
>>>>        v->arch.hedeleg = HEDELEG_DEFAULT & csr_masks.hedeleg;
>>>>    
>>>> -    vcpu_guest_cpu_user_regs(v)->hstatus = HSTATUS_SPV | HSTATUS_SPVP;
>>>> +    /*
>>>> +     * Xen supports 64-bit guests only, so set the guest's XLEN explicitly
>>>> +     * rather than leaving it to the WARL behaviour of hstatus.VSXL, which the
>>>> +     * decoding of a trapped instruction depends on.
>>>> +     */
>>>> +    vcpu_guest_cpu_user_regs(v)->hstatus =
>>>> +        HSTATUS_SPV | HSTATUS_SPVP | MASK_INSR(HSTATUS_VSXL_64, HSTATUS_VSXL);
>>>
>>> The comment is correct right now, but the situation better would change
>>> at some point. Can't you arrange for things to be correct here also for
>>> a future where 32- and 128-bit guests would also be supported?
>>
>> I am not sure about 128-bit guests as H extension is dependent on RV32
>> or RV64 but probably it will be changed:
>> ```
>> The hypervisor extension depends on an "I" base integer ISA with 32 x
>> registers (RV32I or RV64I), not RV32E or RV64E, which have only 16 x
>> registers.
>> ```
> 
> Lots of updates like this likely will be needed for RV128 to actually become
> a thing.
> 
>> I will introduce the following (also it will be needed also to check if
>> we could VSXL set at all as implmentation can make that field read-only
>> and do VSXLLEN=HSXLEN):
>>
>> /*
>>    * Return the hstatus.VSXL value encoding the guest's XLEN. The switch()
>>    * deliberately has no default case, so that adding a new domain_type (a
>>    * 128-bit one, in particular) fails to build until this mapping is
>> updated.
>>    */
>> static unsigned int domain_vsxl(const struct domain *d)
>> {
>>       switch ( d->type )
>>       {
>>       case DOMAIN_32BIT:
>>           return HSTATUS_VSXL_32;
>>
>>       case DOMAIN_64BIT:
>>           return HSTATUS_VSXL_64;
>>       }
>>
>>       ASSERT_UNREACHABLE();
>>
>>       return HSTATUS_VSXL_64;
> 
> Why not simply return 0 here? You genuinely don't know the size.

Agree, just 0 will be better.

> 
>> }
>>
>> It will also affect then common code as vcpu_csr_init() could be then
>> called before domain type is set:
>>
>> +++ b/xen/common/device-tree/dom0less-build.c
>> @@ -812,17 +812,18 @@ static int __init construct_domU(struct
>> kernel_info *kinfo,
>>        else if ( rc == 0 && !strcmp(dom0less_enhanced, "no-xenstore") )
>>            kinfo->dom0less_feature = DOM0LESS_ENHANCED_NO_XS;
>>
>> -    if ( vcpu_create(d, 0) == NULL )
>> -        return -ENOMEM;
>> -
>>        d->max_pages = ((paddr_t)mem * SZ_1K) >> PAGE_SHIFT;
>>
>>        rc = kernel_probe(kinfo, node);
>>        if ( rc < 0 )
>>            return rc;
>>
>> +    /* The domain type needs to be known before the first vCPU is
>> created. */
>>        set_domain_type(d, kinfo);
>>
>> +    if ( vcpu_create(d, 0) == NULL )
>> +        return -ENOMEM;
> 
> I don't understand the need for this, likely because I don't see why
> domain_vsxl() would need calling from underneath vcpu_create().

The call trace will be the following:
   vcpu_create() -> arch_vcpu_create() -> vcpu_csr_init() -> 
domain_vsxldomain_vsxl()

     unsigned int vsxl = domain_vsxl(v->domain);

     ...

     vcpu_guest_cpu_user_regs(v)->hstatus =
         HSTATUS_SPV | HSTATUS_SPVP | MASK_INSR(vsxl, HSTATUS_VSXL);

Without moving vcpu_create(d, 0) after set_domain_type(), domain_vsxl() 
will return something wrong.

I also thought about updating of VSXL for each vCPU in 
construct_domain() where d->type is already known and then no changes in 
common code are needed. But I think it is a little bit better just have 
a change in common code.

~ Oleksii

