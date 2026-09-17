Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F043C88E72
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2026 07:57:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423764.1648702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x76zb-0002F1-CY; Thu, 17 Sep 2026 07:57:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423764.1648702; Thu, 17 Sep 2026 07:57:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x76zb-0002Eu-8T; Thu, 17 Sep 2026 07:57:15 +0000
Received: by outflank-mailman (input) for mailman id 1423764;
 Thu, 17 Sep 2026 07:57:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien.grall.oss@gmail.com>) id 1x76zZ-0002Ek-HL
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 07:57:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x76zY-0052OM-U8
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 09:57:12 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <julien.grall.oss@gmail.com>)
 id 6aab9d4b-8faa-0a2a0a5109dd-0a2a4503a8ce-36
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 09:57:12 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <julien.grall.oss@gmail.com>)
 id 6aab9d58-fae8-0a2a45030019-4a7de14cfa23-3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 09:57:12 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-485933b24c3so263864f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 00:57:12 -0700 (PDT)
Received: from [10.59.21.104] ([91.26.93.146])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bef766dsm12873599f8f.4.2026.09.17.00.57.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2026 00:57:11 -0700 (PDT)
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
        d=1e100.net; s=20260707; t=1789631832; x=1790236632;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b25K+0eQc+w9aEdNM5ZwSZu66c3vdqimY2qbc/J0aDM=;
        b=zzUb5YCI/RPU52EhUDFlKOBEIYJ8JqXaLHm7ZdXDt885rFQiImxEyyEQbQuJDQ/1dt
         HkOP+hGLMyYg/gqAvlZpz9wAfEbO7gDeCHAb9FuWQ1Tl13TBEwlirDOgSYMrBKcsdkKR
         BkT+Dwye8tVrJJxhue659GXm48ZjiWbC+2i5u1EmTRodSJfQR4Ql1XSUdsaSdP9JNN3B
         nN9WFb/1rCF+QPhn4S7mKE16mtu4k7QcdtCc52r54hFROiFONcvRuZNZKjaG7J+EWkJ9
         6Pj+yFCio7OjwSWMsKh91bzaqZ87aMQIPqsGx5WCtc03UvDc9k+RE18gkJRuf+7UCdUf
         XKHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCjCJ1Z919gpYKUAdJmUJ007knhd3e2G3uYpk34nMyC55rTVRqcpnemv/7efQqkvVFBWwqjvva9Jw=@lists.xenproject.org
X-Gm-Message-State: AFuF++k2WiYFdcs/e7s34GOxfUzR8mF/NNi1yU7PxAUc3dboKweWFAZh
	uVqRxaFoggaMmPyr/saD+zw0WRkvT3BF1bkGhSqH8KOgpIzYDTA8eihJ
X-Gm-Gg: AYBFou0mTMe0YZZOAIbRYFgNSdAi69cXjoH/pElGmLRPEh9CrAgn+eJdej4fpBkhPHz
	6wOo0ECNyVxrQEuCWETjN5HGJGHiZTjaAXbjPtloGom5Iswo+VWlYjJCcez6IeSikcwdvJWByXt
	4bogwo0aUFzr4VSZ53/w0opzY3lMGQxOwGO9NmhiDd6N8sMG346/I/GUqwozWQ/D9IzrPtgon1w
	b5YyDEpPC9sNs3B2RPwBij1tPdOD+/ylQ8OOSz9qStVzmxxxjDqC1RTEObm3C6vT4PfIz6+wT3m
	5gRPFP/cZQV61Xc8w79Y/wUeJa8FZuiXq74vMRpJ13ykOHfArSR7IzNJkZatWIf0ylMeMpsQa8H
	75QhYg2+5niCCmJaPpSux9H403MZSMFKODEybuagYkLw/nYhD9icqEwEPzmsXdDPRBvsWNqHkMb
	ekWcqmmewe+GXhF+gFelRS3qMfcXdnfrGT0/By7+nsB9GAXSugYEszRJEOO3cl49X3eieAZEOow
	CEydiG6hmU/xA==
X-Received: by 2002:a5d:5f43:0:b0:487:732:9964 with SMTP id ffacd0b85a97d-4870cf38810mr7279880f8f.13.1789631832213;
        Thu, 17 Sep 2026 00:57:12 -0700 (PDT)
Message-ID: <7b6d9027-9848-4909-a5a3-16ddf56dde72@xen.org>
Date: Thu, 17 Sep 2026 09:57:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 for 4.23] Add GIC SGI boot/self tests in Xen
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger@xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
References: <20260916113520.3870182-1-ayan.kumar.halder@amd.com>
Content-Language: en-GB
From: "Grall, Julien" <julien@xen.org>
In-Reply-To: <20260916113520.3870182-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1789631832-778C54E9-80B81624/0/0
X-purgate-type: clean
X-purgate-size: 1310

Hi Ayan,

On 16/09/2026 12:35, Ayan Kumar Halder wrote:
> +static void __init expect_sgi(const cpumask_t *mask,
> +                              const unsigned int *before, const char *what)
> +{
> +    s_time_t deadline = NOW() + MILLISECS(100);
> +    unsigned int cpu;
> +
> +    for_each_cpu ( cpu, mask )
> +    {
> +        while ( sgi_count(cpu) == before[cpu] )
> +        {
> +            if ( NOW() > deadline )
> +                panic("GIC selftest: %s: CPU%u did not receive GIC_SGI_TEST\n",
> +                      what, cpu);
> +            cpu_relax();
> +        }
> +    }
> +
> +    printk("GIC selftest: CPU%u: %s: OK\n", smp_processor_id(), what);
> +}
> +
> +/*
> + * "All but self" is only meaningful once every CPU can take an SGI, so it is
> + * run by whichever CPU observes that it is the last one to get here.
> + */
> +static int __init gic_sgi_selftest(void)
> +{
> +    static atomic_t __initdata seen = ATOMIC_INIT(0);
> +    unsigned int before[NR_CPUS] = { };

Sorry I didn't spot this earlier. NR_CPUS can be quite large (up to 
16K). So this will blow up the stack.

There are two options:
   1) Use static
   2) Temporarily allocate "before"

I don't have a strong opinion on which way to go with.

Cheers,

-- 
Julien Grall


