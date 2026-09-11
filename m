Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499E1C88E4C
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 09:43:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416142.1645296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4xmt-0006mz-3O; Fri, 11 Sep 2026 09:43:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416142.1645296; Fri, 11 Sep 2026 09:43:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4xmt-0006ms-0m; Fri, 11 Sep 2026 09:43:15 +0000
Received: by outflank-mailman (input) for mailman id 1416142;
 Fri, 11 Sep 2026 09:43:13 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4xmr-0006mm-B2
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 09:43:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4xmq-007yQA-O2
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 11:43:12 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa3cd30-e002-0a2a0a5209dd-0a2a45028f24-0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 11:43:12 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa3cd30-6ca4-0a2a45020019-4a7de18c96f5-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 11:43:12 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49cd6185db7so4156595e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 02:43:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e62231360sm31386115e9.4.2026.09.11.02.43.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2026 02:43:11 -0700 (PDT)
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
        d=suse.com; s=google; t=1789119792; x=1789724592; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KXruCpm1FZlW5PhmkXQefTqnjoavXk0VwdNRB1nW1Go=;
        b=ad83ypDaVwkv5jDI6Vzaevn6I1Xbad7ivE900wcZer6aOrdNLRghwECjBGTNkkR04y
         2qYw25tfqOXokJgxrzuvspqtK2RvV9H9fUHmG6LBooGHMlcWHTx0+jaQJZgwJEzG1rgE
         gbEMSstpjxJWzBBGVIo/ZY/lqOHzUnOQ57hcg0RqloRRQMBgaGI7BXlxyr7YerIWQbEb
         NWjYR18Wq3OB534NOnLrzSChhztXWYMAEzxOQsTafSkQUm/YeM1z6I8scVUwbOhvk14e
         Jx8zaiu0TlKFM6lBodZ+g79n0Y0tbvt/b7sOkXD9mmO4PW9HJ1l8Rj0YpSupa0OwX3Cz
         TrRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789119792; x=1789724592;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXruCpm1FZlW5PhmkXQefTqnjoavXk0VwdNRB1nW1Go=;
        b=bABak2jr3XX6QxlmSjQvnPP0Gy/06kZ/s84A1H9XmB00P7w7zcaYSJCpVv+f5JKaaP
         aeIrtmLoFj89ULINIifVkqKNRaIUlRxbU4Zv9vvgywjLwBDZAycb+ktfpt55ggnYoset
         NwgQ32g1ztXsGyWO3qFRgsvMo26nbRqmfndtCaG64FA+/fUJwmQPvylK1hGsUd5S4oou
         5qx9uocTi6f0TRVS+pbvKHW2yiePE3KZ7G/VMZQEOFSduM9dnhMg/e1R85cOVLXKXeee
         vnZrGsZcgTKyep067huxaoWt/h36JOdHhFTnzS6jr1q9r+luIwSIrvkJEFK1axZmGP3J
         ugpw==
X-Forwarded-Encrypted: i=1; AKwUvBypO6blzAWFFQ/tJcbIJr++dzAjsc/+eVcsAIickQibyw2MHYEdDokpNUegkJw1vq0wYAEkB8me7Sc=@lists.xenproject.org
X-Gm-Message-State: AFuF++nl/6GiMA6GATzyk6im9lU0AWYHlfDK/cHlLth5WuI+2DOxT2xl
	lZBl7IWGlnM02AbGPsDI6yXCW0+EwcWMZ9dMX4LmiyCyqAl3YkJgjy+aQUraY0//uQ==
X-Gm-Gg: AYBFou3dHwlVm8fUnAELA/hUgeylGQdjDvjLNil7ci4lfs9+0C+QIUCZ2JTXKNhZdan
	METH0H3A2dKLb+ZwBS2juwodbkF+6kWd8gbg9QEKNqr4GZXzrJYiDz8CQPg+JudXWqPOagO+vwV
	lk5uUYf4ORbYOWowffTHIS715Iu5iFlWKi4n/fsQNOgvj6Dwc0L2UDFrJYF5a8B5A1CkqjR8mw1
	WM6v4LWXxP7i+ZHujhx+ZK8P1qI0qzcGwOoJZCagbUZYvF06FTmY0gLKqTgOqtEZ2CIDUTGrdPS
	i855Zq3CTnDDirTB4VGD20rbR2HFM7mKblTtn7xDtHYKqbooJv/jg1A+/NpwaJY3xfGkdg1XuAT
	arXr1UxXSLdLpvuoZdfutw3LvsP2e40ApbWpuFLE0WxE3ZALKsCMXPSzLbtHhhbDXc5K0FZ8HKi
	+c4D+CV5wRF50wyxwGBynslujWC95emB/tu1qG7hxAvjg9xV6ZMxGbEeOxN84VCWH8hZuKseXrL
	7TLskUQfEZChm7/nb3rD5BWjNVknhJ5tNCAe+OrlBMfxWoYqL3cwQ8/8Lh1F32m
X-Received: by 2002:a05:600c:c494:b0:49c:f13e:e52 with SMTP id 5b1f17b1804b1-49e610955dbmr43030625e9.15.1789119791915;
        Fri, 11 Sep 2026 02:43:11 -0700 (PDT)
Message-ID: <dacad0b4-9790-40f1-bfe7-73084cac4c50@suse.com>
Date: Fri, 11 Sep 2026 11:43:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] vmx: Refactor vpid_sync_vcpu_gva()
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <1785509179.8631fc262581453bbf619ec5b2062170.19fb8a3efe8000e099@vates.tech>
 <1785509305.8631fc262581453bbf619ec5b2062170.19fb8a5db67000e099@vates.tech>
 <1a42fad1-922d-441d-9837-f4c43854a5b1@suse.com>
 <1789119297.8631fc262581453bbf619ec5b2062170.1a08fd1f824000c4f3@vates.tech>
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
In-Reply-To: <1789119297.8631fc262581453bbf619ec5b2062170.1a08fd1f824000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1789119792-F3EBB2AC-036BFF4F/0/0
X-purgate-type: clean
X-purgate-size: 3007

On 11.09.2026 11:34, Teddy Astie wrote:
> Le 10/09/2026 à 17:45, Jan Beulich a écrit :
>> On 31.07.2026 16:46, Teddy Astie wrote:
>>> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
>>> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
>>> @@ -460,19 +460,16 @@ static inline void vpid_sync_vcpu_gva(struct vcpu *v, unsigned long gva)
>>>        * If individual address invalidation is not supported, we escalate to
>>>        * use single context invalidation.
>>>        */
>>> -    if ( likely(cpu_has_vmx_vpid_invvpid_individual_addr) )
>>> -        goto execute_invvpid;
>>> -
>>> -    type = INVVPID_SINGLE_CONTEXT;
>>> +    if ( unlikely(!cpu_has_vmx_vpid_invvpid_individual_addr) )
>>> +        type = INVVPID_SINGLE_CONTEXT;
>>>   
>>>       /*
>>>        * If single context invalidation is not supported, we escalate to
>>>        * use all context invalidation.
>>>        */
>>> -    if ( !cpu_has_vmx_vpid_invvpid_single_context )
>>> +    if ( unlikely(!cpu_has_vmx_vpid_invvpid_single_context) )
>>>           type = INVVPID_ALL_CONTEXT;
>>>   
>>> -execute_invvpid:
>>>       __invvpid(type, v->arch.hvm.n1asid.asid, (u64)gva);
>>>   }
>>
>> But this isn't functionally identical to the original, at least in the
>> cpu_has_vmx_vpid_invvpid_individual_addr &&
>> !cpu_has_vmx_vpid_invvpid_single_context case. We'd now end up using
>> INVVPID_ALL_CONTEXT there, when it wants to continue to be
>> INVVPID_INDIVIDUAL_ADDR.
>>
> 
> Yes, though a good question is to know if there exist a CPU that has 
> INVVPID_INDIVIDUAL_ADDR without INVVPID_SINGLE_CONTEXT; otherwise, we 
> can just say that this is not supposed to happen.
> 
> One alternative I have in mind would be to have cascading fallbacks to 
> "larger scope" alternatives.
> 
> i.e
> 
> static inline void vpid_sync_all(void)
> {
>      __invvpid(INVVPID_ALL_CONTEXT, 0, 0);
> }
> 
> static inline void vpid_sync_vcpu_context(const struct vcpu *v)
> {
>      /*
>       * If single context invalidation is not supported, we escalate to
>       * use all context invalidation.
>       */
>      if ( unlikely(!cpu_has_vmx_vpid_invvpid_single_context) )
>          return vpid_sync_all();
> 
>      __invvpid(INVVPID_SINGLE_CONTEXT, v->arch.hvm.n1asid.asid, 0);
> }
> 
> static inline void vpid_sync_vcpu_gva(struct vcpu *v, unsigned long gva)
> {
>      /*
>       * If individual address invalidation is not supported, we escalate to
>       * use single context invalidation.
>       */
>      if ( unlikely(!cpu_has_vmx_vpid_invvpid_individual_addr) )
>          return vpid_sync_vcpu_context(v);
> 
>      __invvpid(INVVPID_INDIVIDUAL_ADDR, v->arch.hvm.n1asid.asid, (u64)gva);
> }
> 
> That requires introducing vpid_sync_vcpu_context() ahead, but would 
> avoid the corner case without making things too complex.

I think that would be fine. Ideally in the process the unnecessary cast and
the const-vs-not inconsistency would also be addressed.

Jan

