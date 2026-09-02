Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C0EC624D3
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 14:31:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406008.1639447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1lzd-00036G-BV; Wed, 02 Sep 2026 14:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406008.1639447; Wed, 02 Sep 2026 14:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1lzd-000369-8L; Wed, 02 Sep 2026 14:31:13 +0000
Received: by outflank-mailman (input) for mailman id 1406008;
 Wed, 02 Sep 2026 14:31:12 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1lzb-000363-Rq
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 14:31:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1lzb-003DBV-4T
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 16:31:11 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a983316-8faa-0a2a0a5109dd-0a2a4506b3ee-48
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 16:31:10 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a98332e-195a-0a2a45060019-d1558029d9fd-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 16:31:10 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-49b96837ca3so7814035e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 07:31:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448eeae34sm7061120f8f.32.2026.09.02.07.31.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 07:31:06 -0700 (PDT)
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
        d=suse.com; s=google; t=1788359470; x=1788964270; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gNzFIavnz0vpng0Fh09bkIGFXdQ2PuAzOQRjwuIM5R0=;
        b=HMzoVXpaHxACbM8bBzpoZmGCoyek1Kn8eiPTO4HFusgoysdoRmp5Hzwo/Mzh6JJh4S
         iNehEJSswyHRkwSHoivZI2nxvngXRgrAenN4rrF4P6cnl48911PGWRZopnA/Eho39DEB
         OWXQ/97HHglkmYfKFRhw8AbeOJ0zU3hjYjXBlnsLh7mauHX1WJH/r4L/yOC0RKG8oQ7P
         6c5B8CELEsM3dcSun2FOAuoAvygC6n1ID76wRJqN/3be9IGSJ9pfLSGykgCK/MUKSl0D
         w5EykH5EpkSIVqj2PCsRwjA9In6HhmEwFhw9Bg2EMRymMrWI6SibtYoZ/DNSSbLUdxRR
         FZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788359470; x=1788964270;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gNzFIavnz0vpng0Fh09bkIGFXdQ2PuAzOQRjwuIM5R0=;
        b=Vbwo2vO8xPjd0t3kCTpM25vYpb3qOz/k7qPTZtfMSzL2ebY7OBlDMriCiLqyoHKuUR
         Y99Ids5cFbfcytm0jt41TkXwbdgR5/jIh1PfSmQXdrpDVt/0uTbEOrVdl4wdUe/pmi1p
         SaeHTehaoHipuzIUsZQVi/ZfIBvEWebQ/QjFhE3i021jYA4iloaq6s30Zx7xOKk/pDja
         E75CWi8ZokbakzLkWfFF5TnGrT97pzOjlZjjlMLsvlNfNxho/cPv+I+fmjUvMRR7XmB7
         5Q19oC0pE6fcNlfR591JDdobABkByzXg5nY26bv7VtUuUXqXf6zQgG6DvPLh3N90pqN0
         +Erw==
X-Forwarded-Encrypted: i=1; AHgh+RrzEvVPAGTbG4RhPKOpegjJo/PK03myucKGGEgGYC9ykznwSq+EaScE4kjpt3Le3oG7hlGoFZJXKfU=@lists.xenproject.org
X-Gm-Message-State: AFuF++nbQdD2NmMOfaayIa83jthD3yFPBawMnl+1iSomA885EZvd8nC2
	CKEHnitFiTxWIa1dvxqr/2dMLp9xtX0TimH51PBhJ+zlTgeQnsHeO9ORAHTxqMup4A==
X-Gm-Gg: AR+sD10DyPJeElKaaxXZJHxz5os7hQORMoCONU09ywYGpVt3iYs4LrUB3/8nY83bOcu
	KT+RrQqtBsUQGSJgavjw4FHQyYeGve1Io8n2bJGUddai0wj5OJr99H+HQf6oo4t5MzE2t0Gycix
	kN5CSzQee2/Yupp+AlppwYVlv69LTuq+8akrVU6kz+CMm2uXQ2ewe9j1ELhyCpibstcUuq4DZTL
	/OXDtFph/YJokuiuljFHuJkm8eadDZcnH+d0CUVrEeZhTgsSBBXElb312SNm/+H8PPgzaP4jUsE
	dsHGuURpi16FCFb+s4t91OterYeG3WzsxJ0zBFkxO4XPh+joOflodt+whiWRRHfVBGlKMemDO3T
	8A9f/Nq2m1iq44EPLtyZXdF3bA7mbbrI6NIoLlPy78L9gevSFZ36Mzsjqz/e/gDC1hNNvukt9ib
	1A/lAiug2MQsgz7wYPf7WjF426hZLklcJY295s7lWqh/qPXDNWGsgye8sZsCGBDS1w9NDbj6OF2
	9IvFcwtPFSoh4ezF4M99vxoF7hd6g6GMMuBtI10ByPk96r4UHA2
X-Received: by 2002:a05:600c:4f42:b0:49c:dada:f581 with SMTP id 5b1f17b1804b1-49ce558e89amr95454445e9.0.1788359470043;
        Wed, 02 Sep 2026 07:31:10 -0700 (PDT)
Message-ID: <d4b6f86f-140a-4e9d-b21a-c71aae7978b5@suse.com>
Date: Wed, 2 Sep 2026 16:31:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/39] xen/riscv: set the guest's XLEN explicitly in
 hstatus.VSXL
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
In-Reply-To: <edf010a3-5e76-4ed8-a660-b6f7f9d19ff2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1788359470-F74C977B-61D0061D/0/0
X-purgate-type: clean
X-purgate-size: 1982

On 02.09.2026 15:29, Oleksii Kurochko wrote:
> On 9/2/26 3:07 PM, Jan Beulich wrote:
>> On 02.09.2026 13:42, Oleksii Kurochko wrote:
>>> It will also affect then common code as vcpu_csr_init() could be then
>>> called before domain type is set:
>>>
>>> +++ b/xen/common/device-tree/dom0less-build.c
>>> @@ -812,17 +812,18 @@ static int __init construct_domU(struct
>>> kernel_info *kinfo,
>>>        else if ( rc == 0 && !strcmp(dom0less_enhanced, "no-xenstore") )
>>>            kinfo->dom0less_feature = DOM0LESS_ENHANCED_NO_XS;
>>>
>>> -    if ( vcpu_create(d, 0) == NULL )
>>> -        return -ENOMEM;
>>> -
>>>        d->max_pages = ((paddr_t)mem * SZ_1K) >> PAGE_SHIFT;
>>>
>>>        rc = kernel_probe(kinfo, node);
>>>        if ( rc < 0 )
>>>            return rc;
>>>
>>> +    /* The domain type needs to be known before the first vCPU is
>>> created. */
>>>        set_domain_type(d, kinfo);
>>>
>>> +    if ( vcpu_create(d, 0) == NULL )
>>> +        return -ENOMEM;
>>
>> I don't understand the need for this, likely because I don't see why
>> domain_vsxl() would need calling from underneath vcpu_create().
> 
> The call trace will be the following:
>    vcpu_create() -> arch_vcpu_create() -> vcpu_csr_init() -> 
> domain_vsxldomain_vsxl()
> 
>      unsigned int vsxl = domain_vsxl(v->domain);
> 
>      ...
> 
>      vcpu_guest_cpu_user_regs(v)->hstatus =
>          HSTATUS_SPV | HSTATUS_SPVP | MASK_INSR(vsxl, HSTATUS_VSXL);
> 
> Without moving vcpu_create(d, 0) after set_domain_type(), domain_vsxl() 
> will return something wrong.

Question is - do you need to set ->hstatus this early?

> I also thought about updating of VSXL for each vCPU in 
> construct_domain() where d->type is already known and then no changes in 
> common code are needed. But I think it is a little bit better just have 
> a change in common code.

If the maintainers accept that change, it certainly may end up being easier.

Jan

