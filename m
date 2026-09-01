Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB1FC61DD6
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2026 08:36:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404609.1638265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1Jyo-0001Pw-4c; Tue, 01 Sep 2026 08:36:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404609.1638265; Tue, 01 Sep 2026 08:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1Jyo-0001Pp-1Z; Tue, 01 Sep 2026 08:36:30 +0000
Received: by outflank-mailman (input) for mailman id 1404609;
 Tue, 01 Sep 2026 08:36:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1Jym-0001Oy-Ce
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 08:36:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1Jyl-005OYo-PZ
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 10:36:27 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a968e84-8faa-0a2a0a5109dd-0a2a450ac9b2-36
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 10:36:27 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a968e8b-f2d2-0a2a450a0019-d1558033e597-3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 10:36:27 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4957eefd361so4764125e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 01:36:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce3e0desm53682995e9.11.2026.09.01.01.36.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 01:36:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1788251787; x=1788856587; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XMXNQJYTCIaTGcr9ERCkuVUJRLXuXnV7iGnZJBBF7dA=;
        b=eMri5doG7PAW8uFLG1nfvlM6lMnmXPoj5ZLvmxzNgxiI9m0A42Jbzx29jyUQXaGx+v
         yrmFlDdrceKY0t9YuKAESqrkW+L5o30j8B+cyaXXrlg/USl/bU/HyB5O2p+Lr5dUj0mD
         dCeCpzJQPoXZfFwCIxb1RuKLmq5ziXSxqyPfQ0gkfkENFV+zVBcB8eJXpGIwYhi0lEM1
         5LNRIjLw5iQ2cJRUZiTdFuKNdY+y78D1ikHb+WQopMjtp8qYAqRRGtFjaI9wCnBE+hyJ
         Ak9peZ6L/09Q6XzMkCVsOg9qyaND4NvyQrBdLj4hVK0c5ezOABMKdoLD6hTRrTqDHKaY
         mWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788251787; x=1788856587;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XMXNQJYTCIaTGcr9ERCkuVUJRLXuXnV7iGnZJBBF7dA=;
        b=P2xO/sxElCp3Egm17GTzlVXM9PjSm53ItnmI8iQobgOXAiPgyx2DC71ktS0/U+3AVz
         G1rAcmFVGnyXt7qZ6rW2/UaVdvaL/q7bb37FQJ/x29Y5X9BdJFifItinPBEo3816H3kF
         c9RgzpMerVek6ghCm+zjxv6uIpNu4GX01n+YEh+dMxmDdlC8XffptmAnOSGk1fGItmZn
         bZFo54pupS9w1jd32vmCFpbDHy2bS5fnhtvIJxz9gaGWPDkVv71ME5TeGOBClgnwHfxa
         yix4sHDFCCIYa1SF9DzDiEh4qLzsJ9pbjUa4j+8X0x1w4UPkJgl16DI7yUqLiB/am6z8
         b0jg==
X-Forwarded-Encrypted: i=1; AHgh+Rra9cP8x9MFDqQ7EnelJRTmEux5yAIpDF6lI9LbiD7qHt8bO+bQkJKf9pdhjgNOMCgp5XXsmUSumx4=@lists.xenproject.org
X-Gm-Message-State: AFuF++n/YeokCDMjYyJitXHZvKRkpgu+Le+IhdsDXjdoKJfg2WrHxLQe
	NAfuuGbijEW9fadlixO9PtWUvhATyJTBqQl5I1mMi6kxS7DR9sRYXoiEMY91ctdCcg==
X-Gm-Gg: AR+sD10XhiSuzBAkhzCNe2BfLwLnLKxlot8uJs49pk8zezF0g8S8eOEJmTt3Wn8oAOs
	dBnY8YM22UIC09pSi2Xt4x6pzqWjJz9KbaURVsnHvAaHYLuUUpQwNJlK0qjiRNARvCZdI8Kl7hO
	a3Wch3zV8hDZaHURh6LoSp/8y5kfEKVGST6tp3F+tzxUeQBrIBhOoa5YwwkAqxDMM++1nAw5rRh
	WmMVLu3tH71YbmX+hAsdedeKAJ2tFJpkkaDXORKXo2e+FsM1c2WSIRk1pHihKfilM4PLLhoG0uC
	nePXLryNWsLK+aSF/VgmVuqFu8EYyx014POFUannOJCT6lzmYbL3FWbX8LnNDt+YyLB6QTAmOHT
	1CteKMPyfS8iEW3O/v505qwtcY1ZyjLkJYWkGUUcpEryH3zT7kWJpm3CwLWQpVG4U/NBdee3QL2
	9yWZUxFc8d9hXDadaU6JA4LX7pb46PcvKMigyyXJ+nvOHTUBbILun0WhKJlp9kferMSI8M1EQrO
	6/WEP8nhjXkyFY1MBlaYr3busNz5UFgAR9mmo+28UGQUIqm02Y0
X-Received: by 2002:a05:600c:4592:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-49b91c290c1mr379400725e9.7.1788251787040;
        Tue, 01 Sep 2026 01:36:27 -0700 (PDT)
Message-ID: <844b82eb-5a8b-4e49-8a97-f1311120b61f@suse.com>
Date: Tue, 1 Sep 2026 10:36:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] xen/common: add vcpus_create() and keep max_vcpus
 in sync
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: dfaggioli@suse.com, gwd@xenproject.org, roger@xenproject.org,
 anthony.perard@vates.tech, julien@xen.org, bertrand.marquis@arm.com,
 michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, teddy.astie@vates.tech,
 Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20260831051637.5029-1-frn1furkan10@gmail.com>
 <20260831051637.5029-2-frn1furkan10@gmail.com>
 <cb7418ef-4d3e-4a86-9c86-f7b0f296c013@citrix.com>
 <4a71e08b-b3c6-4f14-a4ae-cc0506659ae9@suse.com>
 <8a187b46-9ec2-4040-bd00-c71059dad952@suse.com>
 <258aa564-4856-4d28-8b90-aa858b25fdd2@suse.com>
 <fcbb592a-b321-467a-ba3f-16aef00803af@suse.com>
 <06e18456-50ac-471d-8323-1560dd8b2a5c@suse.com>
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
In-Reply-To: <06e18456-50ac-471d-8323-1560dd8b2a5c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1788251787-538D5CFC-3E7F54EF/0/0
X-purgate-type: clean
X-purgate-size: 3539

On 01.09.2026 10:24, Jürgen Groß wrote:
> On 01.09.26 10:15, Jan Beulich wrote:
>> On 01.09.2026 10:07, Jürgen Groß wrote:
>>> On 01.09.26 09:22, Jan Beulich wrote:
>>>> On 31.08.2026 14:59, Jürgen Groß wrote:
>>>>> On 31.08.26 11:45, Andrew Cooper wrote:
>>>>>> On 31/08/2026 6:16 am, Furkan Caliskan wrote:
>>>>>>> Every vcpu_create() call site that builds more than one vcpu loops
>>>>>>> over ids up to d->max_vcpus and stops on the first failure, but none
>>>>>>> of them roll max_vcpus back to match. This leaves d->vcpu[i] == NULL
>>>>>>> for ids below max_vcpus
>>>>>>
>>>>>> As I told you before, you must cope with this property in non-error
>>>>>> scenarios.
>>>>>>
>>>>>>> , which anything walking d->vcpu[] can then
>>>>>>> dereference. This is what caused the crash: sched_move_domain()
>>>>>>> walks every vcpu slot up to max_vcpus without checking for empty
>>>>>>> ones, so when a domain built in a non-default cpupool had vcpu
>>>>>>> creation fail partway through, domain_kill() later moving it back
>>>>>>> to the default cpupool handed one of its empty slots straight to
>>>>>>> the new cpupool's scheduler, causing a NULL-pointer dereference
>>>>>>> inside sched_alloc_udata().
>>>>>>>
>>>>>>> Add vcpus_create(d): creates every vcpu of d up to max_vcpus and
>>>>>>> rolls max_vcpus back to the failed id on error. This keeps
>>>>>>> d->vcpu[i] is non-NULL for all i < d->max_vcpus
>>>>>>
>>>>>> No, it really doesn't.
>>>>>>
>>>>>>> , instead of guarding
>>>>>>> every reader of d->vcpu[] agains holes individually.
>>>>>>>
>>>>>>> Convert every site that builds vcpus in a loop to call this function
>>>>>>> instead.
>>>>>>>
>>>>>>> Fixes: 61649709421a ("xen/domain: Allocate d->vcpu[] in domain_create()")
>>>>>>> Suggested-by: Juergen Gross <jgross@suse.com>
>>>>>>> Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
>>>>>>
>>>>>> For the avoidance of a long drawn-out argument, nack.  Under no
>>>>>> circumstances are you editing d->max_cpus after it's put into the domain
>>>>>> list.
>>>>>>
>>>>>> You've chosen to do so at a point where the domain object is live,
>>>>>> visible in the system and able to be the target of other hypercalls.
>>>>>>
>>>>>> Furthermore you have not fixed what your commit message claims.
>>>>>> d->vcpu[...] is still NULL for an arbitrary period of time, including
>>>>>> being able to be the target of hypercalls, before vCPUs are created.
>>>>>>
>>>>>> All code MUST be able to cope with d->vcpu[...] being NULL.  It's how
>>>>>> the object lifecycles must work, because creating vCPUs is not atomic
>>>>>> with respect to creating domains.
>>>>>
>>>>> Would you be fine with me creating a patch series moving vcpu creation into
>>>>> domain_create()?
>>>>
>>>> This was discussed before, and however nice it would be for the issue at hand,
>>>> it would get in the way of us wanting to have CPU policy for domains put in
>>>> place before vCPU-s are created, such that on x86 the XSAVE area can be sized
>>>> once and for all.
>>>
>>> This could be done when unpausing the domain initially.
>>
>> Imo unpausing shouldn't fail because of memory shortage.
> 
> As long as the domain hasn't started running I don't see why this would be
> different to the case where not all vcpus could be created.

I do. One could create a domain ready to be unpaused, but being kept paused
until whatever event triggers its launching. That better wouldn't fail, except
in extraordinary situations.

Jan

