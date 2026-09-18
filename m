Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407F2C982D2
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 07:50:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1424822.1649043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7TMs-0006RH-Ke; Fri, 18 Sep 2026 07:50:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1424822.1649043; Fri, 18 Sep 2026 07:50:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7TMs-0006R8-HC; Fri, 18 Sep 2026 07:50:46 +0000
Received: by outflank-mailman (input) for mailman id 1424822;
 Fri, 18 Sep 2026 07:50:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien.grall.oss@gmail.com>) id 1x7TMr-0006R2-74
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 07:50:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7TMq-005D7u-Jn
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 09:50:44 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <julien.grall.oss@gmail.com>)
 id 6aaced3b-8faa-0a2a0a5109dd-0a2a4507b5fc-42
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 09:50:44 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <julien.grall.oss@gmail.com>)
 id 6aaced54-b4ea-0a2a45070019-4a7de18deca3-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 09:50:44 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49cd38e0f79so2527335e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 00:50:44 -0700 (PDT)
Received: from [172.20.2.169] ([87.190.33.71])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fc7b7a6d9sm27906425e9.2.2026.09.18.00.50.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Sep 2026 00:50:43 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789717844; x=1790322644;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ScPZq/aX/RVMdzyktUcM72kz/d/bEqiXLjtN1elr1+Y=;
        b=pKEWEueqqHGvrmHySa1rUsqWg4803crbePm+D5rdnYVhSk462RvwSxF1F+phR2e6me
         B4FT4y2q7PcLy+ydl9ZRCEzeqV3qc9jRWcyEEjm6P3DLxEm4JG3Vz6veK90wxOaE+OD1
         aMz1ArRgOYoDsN91+KYJlw3XrHqguIER/N54yB+pz8tEE8bQjR2fzdpqRPr+CRZ6Va5z
         JUi/BsC1HQ0lNdXpo/iMG1gg7ZSvOD02kLlacNemyD3BW8HMROeAqsb11wHKJwd6uSej
         v79kHMYAP2W4mMRbUROKYNZ/F6qa/dUQPfNsa3UwVoHKI6S13rO4I/8yESqocUNRzI2S
         fHcw==
X-Forwarded-Encrypted: i=1; AKwUvBysRA3HZZOWOvq2Npx1Ci/BuN6djldgifjagb7pySW62p5dS2LopAuYIRWV2csArsCcHFM7fRcklHY=@lists.xenproject.org
X-Gm-Message-State: AFuF++mJ1AxVrwk2V6bSqy8tfPsAp3ER67asvVFbEJbgt9QPOCzxsdt+
	95WY81OAuNiKm8btvnL92KefNJI85TKrssrgWnQUNvGIHQppt8Z0XoMr
X-Gm-Gg: AYBFou276IrawNqdpoXTUkUc5va8L4xYqiq889s08ABb1VyzuGzI9OpPvsRLsvPhyk9
	atsrDWrRmCzAE8f0aQHHcHUJgchNmRZv+5Po++1B0JS53ib34bI96HgwwkqD4Ffti5TxRkb/cT9
	w9QDaFXTNSAnniwqAzHkkdVf9r1daG0PB4VZBqrmtK2h7QEqmwTIeDqMlISh6JTmua9vjAxivZL
	hvPtPvagk3dAY6Piu7O4K1VObCozPf6+r4QWNaR8NVXrxaLgeLbAaUrkIwYXK0MCsa7+Nv0iyXN
	W2xEOTvNgWGsy8YTMm2imsNr8sKQc2dm0PUnx1ZwNjDrudQmYdIboEXoCq7wqEXR8Ia6D/694gw
	NnCIdPlxPBjiOvIkHwaGZBC5DEy0fDUmwgzNxrT7LpMuPddTq2OyqiFntQg9gfQKiPUoliyERox
	b9HMlIp9Wx2aOKuySWfGoja4BlnUauAXsGXhxK/6j2wOxXPKYyf+Jwp8wcJQFm9wYDkUmmqBh49
	/e+e4TDRfgEXzyScik=
X-Received: by 2002:a05:600c:c490:b0:49d:2555:1a6d with SMTP id 5b1f17b1804b1-49fc573e8b8mr32559905e9.16.1789717843913;
        Fri, 18 Sep 2026 00:50:43 -0700 (PDT)
Message-ID: <81b73414-febe-4e3e-bfd4-30b6a13ede98@xen.org>
Date: Fri, 18 Sep 2026 09:50:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 for 4.23] Add GIC SGI boot/self tests in Xen
To: "Halder, Ayan Kumar" <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger@xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
References: <20260916113520.3870182-1-ayan.kumar.halder@amd.com>
 <7b6d9027-9848-4909-a5a3-16ddf56dde72@xen.org>
 <e311cb4d-beba-4850-ba0d-13f9a2e92608@amd.com>
Content-Language: en-GB
From: "Grall, Julien" <julien@xen.org>
In-Reply-To: <e311cb4d-beba-4850-ba0d-13f9a2e92608@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1789717844-34AC8AE4-12551795/0/0
X-purgate-type: clean
X-purgate-size: 2233

Hi Ayan,

On 17/09/2026 14:13, Halder, Ayan Kumar wrote:
> On 17/09/2026 08:57, Grall, Julien wrote:
>> On 16/09/2026 12:35, Ayan Kumar Halder wrote:
>>> +static void __init expect_sgi(const cpumask_t *mask,
>>> +                              const unsigned int *before, const char 
>>> *what)
>>> +{
>>> +    s_time_t deadline = NOW() + MILLISECS(100);
>>> +    unsigned int cpu;
>>> +
>>> +    for_each_cpu ( cpu, mask )
>>> +    {
>>> +        while ( sgi_count(cpu) == before[cpu] )
>>> +        {
>>> +            if ( NOW() > deadline )
>>> +                panic("GIC selftest: %s: CPU%u did not receive 
>>> GIC_SGI_TEST\n",
>>> +                      what, cpu);
>>> +            cpu_relax();
>>> +        }
>>> +    }
>>> +
>>> +    printk("GIC selftest: CPU%u: %s: OK\n", smp_processor_id(), what);
>>> +}
>>> +
>>> +/*
>>> + * "All but self" is only meaningful once every CPU can take an SGI, 
>>> so it is
>>> + * run by whichever CPU observes that it is the last one to get here.
>>> + */
>>> +static int __init gic_sgi_selftest(void)
>>> +{
>>> +    static atomic_t __initdata seen = ATOMIC_INIT(0);
>>> +    unsigned int before[NR_CPUS] = { };
>>
>> Sorry I didn't spot this earlier. NR_CPUS can be quite large (up to 
>> 16K). So this will blow up the stack.

We discussed this offline at Xen Summit. But I will answer here as well.

> 
> As this is a test, we have hardcoded NR_CPUS = 4 in automation/scripts/ 
> qemu-boot-selftest-arm64.sh.

I agree with your current test harness we only test 4 CPUs. However, 
this is not enforced by the Kconfig in Xen. So anyone could modify the 
script (or write their own) with a much higher number of NR_CPUS 
(possibly to match the number of pCPUs on their hardware).

Depending on the value, they could face a stack overflow.

> 
> If there are 16K CPUs, our test only checks for 4 cpus only.
> 
> However if there is still a concern ....

I would preferred if this is solved. Assuming this is fixed:

Reviewed-by: Julien Grall <julien@xen.org>

Cheers,

-- 
Julien Grall


