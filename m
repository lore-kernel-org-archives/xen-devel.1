Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE11DC624D3
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 17:46:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406186.1639578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1p1s-0001G6-Vh; Wed, 02 Sep 2026 17:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406186.1639578; Wed, 02 Sep 2026 17:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1p1s-0001Fy-S0; Wed, 02 Sep 2026 17:45:44 +0000
Received: by outflank-mailman (input) for mailman id 1406186;
 Wed, 02 Sep 2026 17:45:43 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x1p1r-0001FZ-E1
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 17:45:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1p1q-004u9N-Id
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 19:45:42 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9860c6-2eae-0a2a0a5409dd-0a2a4508d23a-0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 19:45:42 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9860c6-f659-0a2a45080019-d1558032c554-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 19:45:42 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-49b8ce9b733so10286035e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 10:45:42 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee131fcfsm8015575e9.4.2026.09.02.10.45.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 10:45:41 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788371142; x=1788975942; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C4hC2ak8MCTuw31DASucD4rpAMtdKfOi0W+HFIbM/Qw=;
        b=cFP9CiL9G+E+W1B9EyusW/s/cy3xTT822ywwdm6ETW1h6Ozh2q2jRIXK95nOpDx9N/
         kRWP8d39m48YWyWBswqv5FD2yRpz0cq0nKtJAwLFkNU6wfFhAvayYPAV3SYKO8KT86xj
         A00N0SUEYlCoOsuntF8bI7NK8RPtCt3DvhknvQmOdsMZGbAfPiG34t3HMMA4wuNqTe6u
         a0pXtnMhVEmssGsX6BcH5+L8U0TxZ1GDv0YV72/S9SX4621y8te0dGMomRf86GRCaF68
         W0RWP7WpUeX3CVJzhfNHsGQaJGrz2S8y1/MiLcSoDl4sv1Pj62qAEfYz1bWNu6HdnbMp
         OncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788371142; x=1788975942;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C4hC2ak8MCTuw31DASucD4rpAMtdKfOi0W+HFIbM/Qw=;
        b=DvgXSCV2D77LMg3HhSh30Fc5M9I6M2CqYvQXak9APM28AGNI0Cq6cIXDGv37UJ50Q9
         s3lBtoHyb3KLUmQy4SD6uaOArfo/AIKusQStzNYVSvta3Fn99fdSYiqlXWkBBB4YwMjL
         lL8mxIJOo8HGIkMg9jtQiifHt0ebWSnuy6feP3gNCZ5ZfThNHP9HOJSy0oUhzDq95Xrq
         4g+WXwW7U/XKTJW+NOZtwa6JjWYkIjdjGKdzhQ0vRazQL9O4lTPC3RoFYtcJFLO0OzXF
         Rj/rjhvD1JQ4nUqNvCMpVnWNe8WXpgAg6y7Z9z05CPzS2XtQd8XCVEHxVkpBPyCc/bLW
         Y3ng==
X-Forwarded-Encrypted: i=1; AHgh+RrsLgM9iTwPU3PT8hX4rqgoWEOVgPsDpVP9I6YtnuTGiYrLuB7DgplvNWb0Z81tjNOJdqlFm3wS2uY=@lists.xenproject.org
X-Gm-Message-State: AFuF++mL14bRtOH2HYy29TbAwdjJZg+3LnJmiiQy85tdiJHvbutUj1G9
	sYQWb/e9VuMeC5Nz+X/JRVR88eaITZQyo6hTNTzcyQW5B5hsCP6uPXV4
X-Gm-Gg: AR+sD11nJ4dVn7Ou11QTiJx+cyOaLcZxepIZzZIGcQqKF2+crdZEUVusWOx1h55PnA0
	rA9K4ykQIPSXL+8IHY1htpaf41PV5zfBzM6q8jEH2HuuRJgARyywx/Pgxyc+thcYtgaBffhGc7B
	1I7gJ5dIfDiujl2sbk7NXkXIxHmDxd/GQshO6ryqDfNlawIMnWkk5f66DjCO+XdRKTXucN59sGr
	HSj1NlGHwheM8xeSahVyylVZpHRUyst/czbWYvcqSwLpJs0ddeOOOJkSnyM3CrgoS279bTxBFfN
	fH+5ptVidz1izhSDmPtPU24dqFa9I6A7X3xlzwxVVtA9vcy0DxgrVgXDsSCQrtWyFoHIre3cyDD
	2WVCOsgpyjtPt5toZF27JMYr0YLawchngycaKLSnlF6aJCuv3eiAOIdVnXcPuHBA+GDlRf6L27X
	HhDNSknljryezhHXiwTy+rVKNLjZ71RJlZDiSJTv4sXJkcxaw/0kG415z09/Wmyo9miNJQexQMU
	MXakMqoXAuEMRkZ3Pg7tWCb+XYOOD/6DIGfV8LHIlC4DtI4bWjT
X-Received: by 2002:a05:600c:3f19:b0:499:93b3:91ea with SMTP id 5b1f17b1804b1-49ce582959cmr137704985e9.15.1788371141568;
        Wed, 02 Sep 2026 10:45:41 -0700 (PDT)
Message-ID: <52c99fc1-7b25-42be-938b-dc9bb38b45c9@gmail.com>
Date: Wed, 2 Sep 2026 19:45:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/39] xen/riscv: set the guest's XLEN explicitly in
 hstatus.VSXL
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 <edf010a3-5e76-4ed8-a660-b6f7f9d19ff2@gmail.com>
 <d4b6f86f-140a-4e9d-b21a-c71aae7978b5@suse.com>
 <a19802e5-3cb1-44d0-83ea-05612b550591@gmail.com>
 <b876ff5e-341a-4dd1-8df2-1017f788cbdc@gmail.com>
Content-Language: en-US
In-Reply-To: <b876ff5e-341a-4dd1-8df2-1017f788cbdc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1788371142-D654487B-C277297F/10/73395122804
X-purgate-type: spam
X-purgate-size: 3524



On 9/2/26 5:56 PM, Oleksii Kurochko wrote:
> 
> 
> On 9/2/26 5:17 PM, Oleksii Kurochko wrote:
>>
>>
>> On 9/2/26 4:31 PM, Jan Beulich wrote:
>>> On 02.09.2026 15:29, Oleksii Kurochko wrote:
>>>> On 9/2/26 3:07 PM, Jan Beulich wrote:
>>>>> On 02.09.2026 13:42, Oleksii Kurochko wrote:
>>>>>> It will also affect then common code as vcpu_csr_init() could be then
>>>>>> called before domain type is set:
>>>>>>
>>>>>> +++ b/xen/common/device-tree/dom0less-build.c
>>>>>> @@ -812,17 +812,18 @@ static int __init construct_domU(struct
>>>>>> kernel_info *kinfo,
>>>>>>         else if ( rc == 0 && !strcmp(dom0less_enhanced, "no- 
>>>>>> xenstore") )
>>>>>>             kinfo->dom0less_feature = DOM0LESS_ENHANCED_NO_XS;
>>>>>>
>>>>>> -    if ( vcpu_create(d, 0) == NULL )
>>>>>> -        return -ENOMEM;
>>>>>> -
>>>>>>         d->max_pages = ((paddr_t)mem * SZ_1K) >> PAGE_SHIFT;
>>>>>>
>>>>>>         rc = kernel_probe(kinfo, node);
>>>>>>         if ( rc < 0 )
>>>>>>             return rc;
>>>>>>
>>>>>> +    /* The domain type needs to be known before the first vCPU is
>>>>>> created. */
>>>>>>         set_domain_type(d, kinfo);
>>>>>>
>>>>>> +    if ( vcpu_create(d, 0) == NULL )
>>>>>> +        return -ENOMEM;
>>>>>
>>>>> I don't understand the need for this, likely because I don't see why
>>>>> domain_vsxl() would need calling from underneath vcpu_create().
>>>>
>>>> The call trace will be the following:
>>>>     vcpu_create() -> arch_vcpu_create() -> vcpu_csr_init() ->
>>>> domain_vsxldomain_vsxl()
>>>>
>>>>       unsigned int vsxl = domain_vsxl(v->domain);
>>>>
>>>>       ...
>>>>
>>>>       vcpu_guest_cpu_user_regs(v)->hstatus =
>>>>           HSTATUS_SPV | HSTATUS_SPVP | MASK_INSR(vsxl, HSTATUS_VSXL);
>>>>
>>>> Without moving vcpu_create(d, 0) after set_domain_type(), domain_vsxl()
>>>> will return something wrong.
>>>
>>> Question is - do you need to set ->hstatus this early?
>>
>> Good point. I think that there is no really such need. It could be set 
>> (at least, VSXL) just before jumping to new vCPU where we know domain 
>> type for sure.
> 
> I planned to set VSXL bits here: https://lore.kernel.org/xen-devel/ 
> cover.1787838835.git.oleksii.kurochko@gmail.com/T/ 
> #m4144ea90815b48f2d281a2267cd28f50bd4cd54c
> 
> But it seems that I can't do that there as considering that platform can 
> do VSXLEN == HSXLEN == 64 but someone will try do run
> vCPU in 32bit mode we can't just crash domain in continue_new_vcpu().

I think that I can have a check that platform supports VSXLEN guest 
requested based on d->type in construct_domain() where d->type will be 
for sure properly set and reject construction of a domain VSXLEN of 
which isn't supported by a platform. And it looks a proper place for 
such check in general. Then in continue_new_vcpu() just set 
hstatus.VSXLEN without any issue as at that moment we will for sure now 
that requested VSXLEN is correct.

Doing in such way will continue to follow your suggestion (not ->hstatus 
so early in vcpu_csr_init()) and also ...

> 
> Then still to set it in arch_vcpu_create() will be better (or in the 
> construct_domain() if we want to avoid to change dom0less common code). 
> At this stage it is easier to reject to create such vCPU which violates 
> platform implementation.

...  help to void changing of common code.

~ Oleksii

