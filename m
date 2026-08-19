Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF80C5B572
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 07:35:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394763.1633422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwapc-00028e-59; Wed, 19 Aug 2026 07:35:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394763.1633422; Wed, 19 Aug 2026 07:35:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwapc-00028X-2P; Wed, 19 Aug 2026 07:35:28 +0000
Received: by outflank-mailman (input) for mailman id 1394763;
 Wed, 19 Aug 2026 07:35:26 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwapa-00028R-O7
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 07:35:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwapa-001fLk-2h
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 09:35:26 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a855cb8-8faa-0a2a0a5109dd-0a2a4504e232-14
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 09:35:26 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a855cbd-b57f-0a2a45040019-d155802ee4c7-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 09:35:25 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4953de5be0aso5175675e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 00:35:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa17567asm39592365e9.10.2026.08.19.00.35.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 00:35:25 -0700 (PDT)
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
        d=suse.com; s=google; t=1787124925; x=1787729725; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eX42ao3aPC8bijCBxzXtFBmm3vcAf1PsreEEOvh2qQg=;
        b=Z1wVP1yuFHndzOhCl9332Ee0wsKAwssCZ4kT7qkQAKpZz0xOC6cVhFBqMnCiNbXDN5
         hJymbMCRTSMVRFArzi+46ssveGIwHphJmOwWa7kOHTOPQHEf1c2XH7BhOGW2sr6LLxRz
         tWVAS/8Ctaqhyd9a4Hbio9CRyb2xrXLzaFN7bT14QUx2XMuUgShA8oOKuJd2cs3RSoU8
         8HD9V9/QlpAi3yQHWDkb8TOjlojBWG2WtGzWKNE9CsQz8RF8ga2kuI+7wuTY1RPZdERm
         89HkrZnbP3oFXUrCcEZ/baqZt65pXDbFlWzjGlxTDlEn8ZmwKPn+GoqUDbyYi/+ig8lN
         1qsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787124925; x=1787729725;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eX42ao3aPC8bijCBxzXtFBmm3vcAf1PsreEEOvh2qQg=;
        b=KFLYre7hVnSuO080BwXhcpXDJc6D8aw5SmmrxgZRrEvGAW71EEbigqkLEZp1cF1fBj
         QGpgnaqEV5H6QDHabZlpxi3AODqQa049r9t0z7Xo8i+acfCcCFExLTHn+qKZ2ZPeWqRL
         NauKpF1G235MdgJadL6JB5mU6jehmca2LfEBaDK34TuRnsu9cqxsixOCrH9AvXePweUT
         L9tFGUISB8hLFZHGYlrbQeo1+W5BteNJV8YyhqA2hVHHrxj97CKUW8yONHI0Fm2UQWYr
         UR7ZX+lWh6bY9/SPLFGiu3E1FTS0V2cDVJahXZbq9PGzIvWZrkKtA7TWIFuYmqCXViQj
         sdnA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+yxTfVqIIbUkgXYX0HorJxXCIwA3uBQbA26l5umpeUIeO1W5JI0zW5LvqTs0k9obzadbve5wLqTc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz75HwUMxHjsDQz0ZoARqR7OHH2K6Q5TxQ3ZsuUCLwSLdQ9wbql
	QKxsYBY2uLoIUyiabN/IGIsn5loYlwpOfg8kAGnWVRp/b5cCQVwHc4uG7kv27plGRQ==
X-Gm-Gg: AR+sD11gSjLUxVoOGaaetvLiJFqv07ngA/YAdclhsIyYvtpOSy7FT0EfkV8m2CeE3fk
	8zbdLuJqH/OUGEcDJPQmO4zwHaMeUdP8EeckFA6TCrB9YWrGLwL6ZMtcZAKO962rCnDH7xF9zbU
	nTmNLe0F0gjK47b32oycteiAxtRmwg663S0FEoQQzswhFJpgDGzyTdwslqlUPM8pBr9iu4ULrLN
	aL2ZKqmjX2P1dJFaAtMfX69CDMqC6VgVdIQLLZoLZQB7kb8rxVC8hC0L+nXFj18ka7TrrxBH2DD
	Xry1SBhT5bx3zbUUuiFkAjHlyRrVht1Psj0QR9kfC+SiAJpRw9IUCAZPxGsfQqzZ1XklFMl/2yr
	4Ky+oiCTIplFzIcoASuYGXFPKeN324k2Nk+dRjI0MdqPcdJ0svGhccwcIUQdipMIw2t1bkGZjmR
	k4vD/h7jHntyQCRQlb+mrMZTt+x5bWRaXxGyM4AKam7K3g5v0SX6Y+7ERe/mbQYZRlEtByZIWGz
	KencyDUYOD4NCYxjckalEQpsRWdxa/t7EC8LjYft86iKshiNUwv
X-Received: by 2002:a05:600c:6308:b0:499:80d0:8b73 with SMTP id 5b1f17b1804b1-499aa171fd8mr43427235e9.4.1787124925511;
        Wed, 19 Aug 2026 00:35:25 -0700 (PDT)
Message-ID: <997d00e8-912d-4835-952c-d2912b3f1aaf@suse.com>
Date: Wed, 19 Aug 2026 09:35:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/sched: core: skip missing vcpu slots in
 sched_move_domain()
To: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>
Cc: jgross@suse.com, andrew.cooper3@citrix.com, dfaggioli@suse.com,
 gwd@xenproject.org, xen-devel@lists.xenproject.org
References: <20260819051532.9197-1-frn1furkan10@gmail.com>
 <20260819051532.9197-2-frn1furkan10@gmail.com>
 <fb107bee-6b6b-4e81-bf2d-846d8b6411b0@suse.com>
 <0200ea9a-c1e3-46fc-bb7a-d50c39b38b92@gmail.com>
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
In-Reply-To: <0200ea9a-c1e3-46fc-bb7a-d50c39b38b92@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1787124926-C10DDB50-0B463FE0/0/0
X-purgate-type: clean
X-purgate-size: 1678

On 19.08.2026 09:28, Furkan Çalışkan wrote:
> 
> 
> On 8/19/26 09:53, Jan Beulich wrote:
>> On 19.08.2026 07:15, Furkan Caliskan wrote:
>>> --- a/xen/common/sched/core.c
>>> +++ b/xen/common/sched/core.c
>>> @@ -745,6 +745,38 @@ int sched_move_domain(struct domain *d, struct cpupool *c)
>>>  
>>>      for ( unit_idx = 0; unit_idx < n_units; unit_idx++ )
>>>      {
>>> +        /*
>>> +         * A vcpu slot can be missing if creation failed partway
>>> +         * through. A dying domain is being torn down regardless, so
>>> +         * skip the unit -- but a domain that isn't dying still needs
>>> +         * every vcpu it has schedulable, so fail instead of silently
>>> +         * dropping some of them.
>>> +         */
>>> +        bool vcpu_failed = false;
>>> +
>>> +        for ( unsigned int i = 0;
>>> +              i < gran && unit_idx * gran + i < d->max_vcpus; i++ )
>>> +        {
>>> +            if ( !d->vcpu[unit_idx * gran + i] )
>>
>> Is there a particular reason domain_vcpu() cannot be used here?
> 
> We still need to guard against d->max_vcpus so that out-of-bounds
> indices in a partially filled unit don't get treated as missing 
> vCPUs by domain_vcpu() returning NULL. 

Ah, right - the bounds check cannot really be folded here. Then ...

> However, domain_vcpu(unit_idx * gran + i) can be used here instead of
> d->vcpu[unit_idx * gran + i]. I simply used d->vcpu[] because the rest
> of the function uses it that way.

... best wait for Jürgen to comment. Outside of the scheduler we're
trying to replace open-coding of domain_vcpu(), but inside the
scheduler things may be different.

Jan

