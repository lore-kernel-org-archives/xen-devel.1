Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA735C54FDF
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 07:18:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1377200.1623385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpL2D-0007I3-6c; Thu, 30 Jul 2026 07:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1377200.1623385; Thu, 30 Jul 2026 07:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpL2D-0007Hv-3E; Thu, 30 Jul 2026 07:18:29 +0000
Received: by outflank-mailman (input) for mailman id 1377200;
 Thu, 30 Jul 2026 07:18:27 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wpL2B-0007Hn-3V
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 07:18:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpL27-007xx4-Sy
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 09:18:23 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6afab1-e002-0a2a0a5209dd-0a2a450591b6-22
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 09:18:23 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6afabf-4cb1-0a2a45050019-d155dd36edbf-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 09:18:23 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09e5so1855448f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 00:18:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fc8941717sm3719113f8f.34.2026.07.30.00.18.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2026 00:18:22 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785395903; x=1786000703; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58tasoTcyOoWqv+JenkfyeG0hVZf1YkGYryOdAuwfL0=;
        b=KV/U8kETiDHSAwn+w5vnKXCOCWOYfmQm/mUVfBEt5rDQ00j4P19C3qNlonQIyi+FVh
         EiBx4X0DhhwMBFwdYBpjlO+Bcd27XTGx+cQdN6/WvAaanphmJ8yP7m8dlyLFGeR4qN94
         DTxlhnuLefo7WuUVwjIhIwVf4pA/DEgTKsHgHCNAQagCJT+mm0seLSTxwDl97iAnL0JT
         pZ5oid3/D8Sz0c0YDKYZuF1KqcxrBySPi2g73mxEPGYV9tN5AKF9BgRzpCdhOgakiCw2
         XOlO/DP9JidvKQ5wWiEwV9fpW7KQM//X09L7yCf1m/sEySKehrLfGQsVZL+gNCor2fwK
         iyQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785395903; x=1786000703;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=58tasoTcyOoWqv+JenkfyeG0hVZf1YkGYryOdAuwfL0=;
        b=YSmn++6wodyOAJgqxs3KIk+pqWhBfsXhqsdlL5F6QPdUm+NX5n+JAC/myQ4sfm9Niy
         UAL7oXnPchSxd3Fwx/V5kBNTEXTYhdw6Yvb3pgsokrJt6tlA+eg+1TAA6Jb9elyLdkRF
         N9oNVCjUVOU5a+xPX6oi2RzV3WXaKYvx+a9Jtwgh1Plcs6dpG74uiE18xJH/0ibQCwTQ
         DsqTakIYK3R34uwxCe2tgrHgjaZs64KttaQAlbnj1ViYSOmVpSqHUM5kZY/c/ueDh746
         14fhOkHSuNYIIJYMgs0L4SpiQCx2Amq5fc95m38YGQ4FvhzzcqZnAHsPRFt+S24XdVzO
         umJw==
X-Forwarded-Encrypted: i=1; AHgh+Ro5JygGwfqkDyQB+gbD1PumuYBtYv1osoUy4Q+IDcCeLNE/WkDT6aXMlfN6kAlPk7MGuwJ1LVyUCtM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXUz3ZGvjltKXQEA/kyZMSvd+SrVpZffRm9tEO/vb+MXDgD06r
	30sFj/pUNQHwWybndc9W4J5qREciSTp5AALESrbboUAQBUyrvsxbfVvmeYLJnrhL7g==
X-Gm-Gg: AR+sD103TJEPE+nSA7RCihD8PpidZ6194HNqN6uDOwSuZOTWbj43ByqZ0eqReW0LEPs
	HyYqBCUryaFcYzGvgsRGxx+WjOx/CE7fwS5jaMlLvCwIxw8+EbgZvGhfE74MQX/qZWcQBNHniZ2
	X2A38KEg9PFm2UTL0fynZt7rhzPojLWbXXEMZJaLXvjXjhIR4BXTxKVT1xt1vYpx2jQZppACOKw
	GUMmcBhRY7WHjEdWiF0Z73apY386o2RSia7DbzxR1OOAnmpeLQ4XbeTeBMlgG/1ktguRGRQeJEt
	urcfFACkg046EJLYjkfBTuuwl7yc+UFN5dyCWn3qJfU3cMTodk6az7ytFC+LVRk6rY93RsLYB/g
	dL/pCHulEAVn3De/ar2uqg6jUZAh+3gEt7L9NG+ZHLxlbv5XKNiatOBYi90oyi0mDPa/NcsXgEb
	XEkCYAIEs8YmZzVC/dqd3KPeDfRqs39+9U8Iq/OEsJTNQeYp/P/FKedwVAuzml7umkKoMC6hsX/
	/2qgK0E+acs3lIPqwOgY2Ey3CETcprlzdp5cwWMUelAOo3bGdy70FUR0ct4EqLZ
X-Received: by 2002:a05:6000:2683:b0:47f:9404:80d7 with SMTP id ffacd0b85a97d-47fc820d689mr1647986f8f.46.1785395903187;
        Thu, 30 Jul 2026 00:18:23 -0700 (PDT)
Message-ID: <ea3417c9-bf6a-4b07-9a74-d9a767a87c9e@suse.com>
Date: Thu, 30 Jul 2026 09:18:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 18/23] xen/riscv: implement IRQ routing for device
 passthrough
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
 <c489a420b1c01c5312773c2e2b51f63d3babf855.1784559209.git.oleksii.kurochko@gmail.com>
 <c64fc958-73bb-44ed-a3b2-dc368ce675ac@suse.com>
 <6cebc63c-2f21-4ef8-ab10-e2ec62f887b7@gmail.com>
 <534eef4c-7f5d-4565-97b8-e0cc3b3290c2@suse.com>
 <5c5f04e2-56fb-42b5-b49c-faebac313c54@gmail.com>
 <756041b3-14e2-4c1d-bbee-548ca3bea349@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <756041b3-14e2-4c1d-bbee-548ca3bea349@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1785395903-F54AC2A1-19DF21A1/0/0
X-purgate-type: clean
X-purgate-size: 2944

On 29.07.2026 17:23, Oleksii Kurochko wrote:
> 
> 
> On 7/29/26 5:02 PM, Oleksii Kurochko wrote:
>>
>>
>> On 7/29/26 4:15 PM, Jan Beulich wrote:
>>> On 29.07.2026 13:59, Oleksii Kurochko wrote:
>>>> On 7/23/26 3:30 PM, Jan Beulich wrote:
>>>>> On 20.07.2026 17:59, Oleksii Kurochko wrote:
>>>>>> +/* Route an IRQ to a specific guest */
>>>>>> +int route_irq_to_guest(struct domain *d, unsigned int virq,
>>>>>> +                       unsigned int irq, const char *devname)
>>>>>> +{
>>>>>> +    struct irqaction *action;
>>>>>> +    struct irq_guest *info;
>>>>>> +    struct irq_desc *desc;
>>>>>> +    unsigned long flags;
>>>>>> +    int retval = 0;
>>>>>> +
>>>>>> +    if ( d->is_dying )
>>>>>> +        return -EINVAL;
>>>>>> +
>>>>>> +    desc = irq_to_desc(irq);
>>>>>> +
>>>>>> +    /*
>>>>>> +     * release_irq() frees this action via xvfree(), relying on 
>>>>>> action
>>>>>> +     * being the first member of struct irq_guest so that &info- 
>>>>>>> action
>>>>>> +     * coincides with info itself. Guard the layout so a future field
>>>>>> +     * reorder can't silently turn that into a free() of a mid- 
>>>>>> allocation
>>>>>> +     * pointer.
>>>>>> +     */
>>>>>> +    BUILD_BUG_ON(offsetof(struct irq_guest, action) != 0);
>>>>>
>>>>> Can't release_irq() simply use container_of()? One way or another it 
>>>>> feels
>>>>> like you're painting yourself into a particular corner ...
>>>>
>>>> If it isn't the best option then it is needed to follow they way we had
>>>> before:
>>>
>>> I don't understand why you think you need to go back.
>>
>> Because, based on your reply—specifically, "One way or another it feels 
>> like you're painting yourself into a particular corner..." — it seems 
>> that even if I replaced BUILD_BUG_ON() with container_of() in 
>> release_irq(), you would still consider it a bad solution. Did I 
>> misunderstand your point?
> 
> One more thing: I'm not really sure it's safe to do the following in 
> release_irq():
> 
> if ( action->free_on_release )
>      xvfree(container_of(action, struct irq_guest, action));
> 
> release_irq() is a generic API, but this kind of allocation is only 
> needed for guest IRQs. Wouldn't it be better to set:
> 
> action->free_on_release = false;
> 
> for guest IRQs, and then free the memory in release_guest_irq() after 
> the call to release_irq()?

Perhaps.

> Wouldn't that be a better approach than calling 
> `xvfree(container_of(...))` from within the generic release_irq()?

Perhaps.

What I'd really like to see you do is come up with an approach that is
both self-consistent and future-proof. With the latter aspect meaning that
it should be (reasonably) easy to identify places that need changing if
e.g. the "->free_on_release is only ever one value" property goes away.

Jan

