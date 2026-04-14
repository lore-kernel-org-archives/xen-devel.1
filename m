Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49436F9D0C4
	for <xen-devel@archiver.kernel.org>; Tue, 14 Apr 2026 11:45:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1281666.1564523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCcCm-00018V-96; Tue, 14 Apr 2026 11:45:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281666.1564523; Tue, 14 Apr 2026 11:45:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCcCm-00018O-6T; Tue, 14 Apr 2026 11:45:20 +0000
Received: by outflank-mailman (input) for mailman id 1281666;
 Tue, 14 Apr 2026 11:45:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wCcCl-00018I-7L
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 11:45:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCcCk-00G083-K6
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 13:45:18 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69de28c7-5cb7-0a2a0a5109dd-0a2a450a9c24-10
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 13:45:18 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69de28ce-ee98-0a2a450a0019-d155802fa8fa-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 13:45:18 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso57861425e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 04:45:18 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e4f16bsm38863535f8f.26.2026.04.14.04.45.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Apr 2026 04:45:17 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776167118; x=1776771918; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A5rXna91Knf1BxzFhOxEplw4p6Ue8ki87G2ESnjeg+8=;
        b=XLMBOaUwAUcX85EXkLfq8TgKdVt7h7Ro/Tf8fnc3evLY+MGc6yIYv6RASdRRmAxUr1
         QZ3NAsbcXtbVK893+xXUV/AdvY4agXY97I+3yvpzQsFh/k+p1PA5X5/2EEwsE26qmSIm
         HMVAx1QWcGllvr+fCU4HUokz83tNpeiscSOrKGvej3ORLYBrN/FjtFv1pN9yfdD0Ycn0
         liwMzwBya5n7A3jX/qKlnEMfUOa/kdIaliOkGuMO8Se+oi9gvLJshpO0rBEf8pieRFtv
         SNdZA+9t1wkTUbSSrWNnWYn1YOYTKm09thlUBlrYjjagc8YcVLzlUgWkcsHQuNPuScWp
         Fx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776167118; x=1776771918;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5rXna91Knf1BxzFhOxEplw4p6Ue8ki87G2ESnjeg+8=;
        b=Z6PfA05tNtzJKa9DXuY5VjR1B5Vx4sJ7FcgRvM1w4hKinTn5vcIp2b6DafT0u14qKf
         M3Bp3UpHtgZA9wkPQGJmWPBd8n19X3+5NsoKMidDU02FAYJfdkm3LqTGDn7TSZvsZvjX
         1izOqhDbds7xuN766tBBtGtXfHh5Cw4Bfnq+l//nqHZM9LWvnOhDfqRvCYZZtbU25uJk
         g/zku5SDsJAyST/ePPWd5ELwdshAWbJ6MLPOlS4cwrigPHr54TedVCFn549UQqE6fvMH
         FYieLWyWwCuVBN2t/FiZQ0bmOq0Y9PksfIh6NEKiAL9G/2O3++0WLwuuQBNbCX19mOiA
         3gCQ==
X-Forwarded-Encrypted: i=1; AFNElJ/PL76kZhO24VB7oEFFe+iI/TUe4Yf4OyH/QAvz8fa0dULVSYTzIltQiHIRP0dvw29h8f6cW543YvQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIDWbjk5KxAXA/eZZnErgG2GB/N5zdAEeTdalXwBeIEbYzXtyr
	0d+qWoXh4WJOIIBUbSajGiplGfnC56gW3CxTpwh7I+ESw4bOuNpIIKpx
X-Gm-Gg: AeBDietn5mdjNklUhsQw8oPbWdkAzGPMyIK/kskd13w4AiBnBX9o5p8OWAaMbNQS9/p
	agz5Es1H1wqDevxJRZpFBp/3IP+3XMgXZZtWiJzrNjtMy9U/e6ENh2/5q12B3igIgDFGsIjM464
	4dUkn02t5eWFgP0LLdTECESNNz2MM2W6gYSUn94QPdbsz4MbjYKienWT5ZX7pNKDE0WDB0/D3O0
	DX3UWDKKv7zdqtXa9Al6FBAHJKqIskKS9sCygYDdciKFg4SwbkgKPk1LFMOIKvHHIARtS+2/3Wx
	g4TZXhZO4ZOowJkQS/CT+WljaGFNFfOYJUOr20rpQGlhU9dGT3J23ovTpGXySY5gsyJVBp8zl45
	Npt8vGLste0nqTRNDH6wS7ddve9lb+ACWGf/wRcelScMq6t2LwsvW9qRSv5pnNm3mJSuB8ErYBT
	XjgeEe/Vx2SMFoiVuHpsXtUtqfxLDL1D7d8qDjFiUqXVpAp/DgAXKEeN5xZDENzaFEMfjbetLjQ
	2OthzDPETkQ9Q==
X-Received: by 2002:a05:600c:609a:b0:485:3e00:944a with SMTP id 5b1f17b1804b1-488d68ae78amr228279505e9.9.1776167117902;
        Tue, 14 Apr 2026 04:45:17 -0700 (PDT)
Message-ID: <f0503bd6-3ea3-42da-9211-02836addc176@gmail.com>
Date: Tue, 14 Apr 2026 13:45:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 18/27] xen/riscv: add vaplic access check
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <0fc9adf790d4f981e8117bd9759c7e64bb11e439.1773157782.git.oleksii.kurochko@gmail.com>
 <0519fb8a-48e3-4f36-8d6c-a966080ffb55@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0519fb8a-48e3-4f36-8d6c-a966080ffb55@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1776167118-BED4A0B1-78C1925E/10/73395122804
X-purgate-type: spam
X-purgate-size: 1814



On 4/2/26 3:10 PM, Jan Beulich wrote:
> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/aplic.c
>> +++ b/xen/arch/riscv/aplic.c
>> @@ -38,6 +38,7 @@ static struct aplic_priv aplic = {
>>   
>>   static struct intc_info __ro_after_init aplic_info = {
>>       .hw_version = INTC_APLIC,
>> +    .private = &aplic,
> 
> Isn't this the host instance again? How can you ...
> 
>> --- a/xen/arch/riscv/vaplic.c
>> +++ b/xen/arch/riscv/vaplic.c
>> @@ -127,6 +127,20 @@ int vaplic_map_device_irqs_to_domain(struct domain *d,
>>       return 0;
>>   }
>>   
>> +static int cf_check vaplic_is_access(const struct vcpu *vcpu,
>> +                                     const unsigned long addr)
>> +{
>> +    const struct vaplic *vaplic = to_vaplic(vcpu->domain->arch.vintc);
>> +    const struct aplic_priv *priv = vaplic->base.info->private;
>> +    const paddr_t paddr_end = priv->paddr_start + priv->size;
>> +
>> +    /* check if it is an APLIC access */
>> +    if ( priv->paddr_start <= addr && addr < paddr_end )
> 
> ... use that here? Or asked differently, again: Where's the virtualization,
> i.e. the abstraction away from host properties?

With the current use case it was easier to choose such approach then 
provide the full abstraction.

> 
> Furthermore, is it really sufficient to check just the starting address of
> an access? Shouldn't the last byte accessed also fall into the range in
> question?

I think that it is okay, my understanding is that *paddr_end technically 
is another range.

> 
>> +        return 1;
>> +
>> +    return 0;
>> +}
> 
> This function looks to want to return bool (and then use true/false).

Agree, then it will also need to update function pointer prototype in 
vintc_ops.

Thanks.

~ Oleksii

