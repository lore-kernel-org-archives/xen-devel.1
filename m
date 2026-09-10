Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE914C79FB9
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 11:14:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414449.1644250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4cjP-0008FH-05; Thu, 10 Sep 2026 11:14:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414449.1644250; Thu, 10 Sep 2026 11:14:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4cjO-0008FA-SY; Thu, 10 Sep 2026 11:14:14 +0000
Received: by outflank-mailman (input) for mailman id 1414449;
 Thu, 10 Sep 2026 11:14:14 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4cjO-0008F4-21
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 11:14:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4cjN-00AUOK-Er
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 13:14:13 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa29103-e002-0a2a0a5209dd-0a2a450abf68-10
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 13:14:13 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa29105-f2d2-0a2a450a0019-d155dd30d905-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 13:14:13 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-485850cf499so4934416f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 04:14:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485aa2c9acasm14609400f8f.36.2026.09.10.04.14.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 04:14:11 -0700 (PDT)
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
        d=suse.com; s=google; t=1789038853; x=1789643653; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z99gJD+4P3UGzaQaOpYwFdUWyOKXoViqFl639x5XqwI=;
        b=DZ2cemw0hmrdnOjzWMJ+drHpeg0hfQFO/0/TMmPAy1GkbUjI8s5Kz3WzXbcgEIOstb
         ekFcrFJfS0Kbri+SgQSMTSttBBiAVIAGfjJKt+HLtU92k7OIp+13maY2r2l9NYxCGT5k
         rjytgFUBWFj2TGU1wpb+vUGOSun4MzrcRuXcWPTwceolA28zHiV7KKQxvjN+Pk37BoVv
         vD45IXy6iYpXGDiavELa/TXCw+BhN9LWzpJUqltF+AhwEF3c5SEFZK1aK/capXXKVcFn
         yU240niCCRMnZgsDLCa9iEtNl7j4a/bM6VP1jYEbayea/a/NvyHI+QurFYB3/RKUgZH0
         YvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789038853; x=1789643653;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z99gJD+4P3UGzaQaOpYwFdUWyOKXoViqFl639x5XqwI=;
        b=Ml+xPnKTKywh5cbTwSZNv4rW2sE6ZTljGDOfvSH+foBQDGmjR72pnag7riFptCUvL/
         ATPi8+mYWGXI6c2KvOX66cCq/T/n62xYmsHgconcXwzmGCiEq5456dW/UuIFVcJ/9xB0
         RFxAbVaju5Si1kDhg8//eS2f6A8L1zEEkDWsQ97Uc/HmUHChn+8nrl8dq2iqX+Iixzmh
         gLvT6i1pdReuB5T83CFkqA8KYmtvBXIYfljblSDLsQij3z/P66lJfEqftfI93N45rQ5u
         aY6Rzc/ixi9RvXmF8kPSdTGcfduu+PP1OIKlfrqGLEyvxlS6lEszdDUxD2T2Z36kCWcT
         Upbg==
X-Forwarded-Encrypted: i=1; AKwUvBwcp5XwGS95leNTfH67Ytniqv3sxniq8BijPvsR5XEHejzjD/+/p0ime4nzz7eGQ4eIUgReDUL7Gig=@lists.xenproject.org
X-Gm-Message-State: AFuF++klchZXsMsUocvr3lLjT2Lj6WEBCrX8mmTvcGkmWFTKfYmMTv0L
	vaOSUs4jUZoWNylgqoXJRPjrVHjF0VFgS2DUZV4CWVSvBVA3Y+00seoxSQ5W0WB9yQ==
X-Gm-Gg: AYBFou2dU68KB2wFzH1U5mzt2UUR0BiSYeabeZ79c/d+vDX4u4tI8x2ZVCINh+zszpO
	cg9GBZWq4eOXMDIAjNEQIDBRXPX8cxl3Yl5NqCy04x8cPzvHsEGFhfJrPLgnfD1Eq8UTEuN0eDA
	ITs9CmXoXa1LxKszTygwPruCa9PQ7wBeKEGsJg67eVyliAVwEx2CCWX4JYaWxWRtqLp7lmWFoHb
	ZLCkDTO5j8twwfoOhmOxs7/KsDvdeiIENyqFvx7t+dZYRnzViCvyitOkMudPX0yvLBul7QZ9mdL
	LPjVrnttjisFa0y7HuFBrYsJ8Ua4U+7UnylyBn7dwfkLfOtwgvJWNXB26IP/L3UMi4VIAguYPAI
	VGoEx5MkRWGhHp4NCkCDi9QfywCxA1yhrQUZaUcV64N8MXX+WuyxIV4JxQ4JTMOnVDM8qEp3w4W
	MkIO5G9R4SRwUyng3bIzMWG+fZID7fw0FLT6+LYFwHbUiADYgkZfZTWjrWHH2LITgfXj2IXRp+2
	OyIw/mZk1uXQhbKZCPpawgqMAE8ulaBGKMYpIKna2jyjnQ/iQT2zNNQxCUvCfk=
X-Received: by 2002:a05:6000:46c6:b0:485:8edf:8354 with SMTP id ffacd0b85a97d-4858edf846cmr26246781f8f.43.1789038852530;
        Thu, 10 Sep 2026 04:14:12 -0700 (PDT)
Message-ID: <48857983-ac79-44a0-8a11-93f62ac3d0c4@suse.com>
Date: Thu, 10 Sep 2026 13:14:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/39] xen/riscv: implement virtual APLIC MMIO
 emulation
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
 <4413e157dfe67167f651df1ea92ab61ca4182723.1787838835.git.oleksii.kurochko@gmail.com>
 <68ab5241-7301-4988-9420-bcccc4b16e3d@suse.com>
 <071ed630-4c72-4df1-b15e-3037e3f076ba@gmail.com>
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
In-Reply-To: <071ed630-4c72-4df1-b15e-3037e3f076ba@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1789038853-583CCCFC-1C14FD73/0/0
X-purgate-type: clean
X-purgate-size: 2245

On 10.09.2026 12:37, Oleksii Kurochko wrote:
> On 9/9/26 4:26 PM, Jan Beulich wrote:
>> On 27.08.2026 17:20, Oleksii Kurochko wrote:
>>> +uint32_t aplic_msi_target_gen(const struct vcpu *target_vcpu,
>>> +                              uint32_t base_val)
>>> +{
>>> +    unsigned int guest_id = vcpu_guest_file_id(target_vcpu);
>>> +    unsigned long hart_field = aplic_hart_field(target_vcpu->processor);
>>
>> What guarantees target_vcpu's ->processor field to be meaningful at this
>> point? 
> 
> Good question. Considering the places where it is called, I would expect 
> target_vcpu->processor to have something meaningful, since it is called 
> from a place that can only be reached when the guest is running.
> 
> Even without that, I don't think there is a big issue here, as 
> ->processor is initialized to 0 at allocation time. This means that the 
> target register will be configured in such a way that CPU 0 will handle 
> such IRQs.

I may not have been explicit enough then: Whether the guest (as a whole)
is running is of no interest. If the specific vCPU is running, all is fine.
If the specific vCPU is in the process of being moved to a different CPU,
and if you read ->processor just before the new value is put there, is
all going to be fine as well? I doubt that.

>>> --- a/xen/arch/riscv/include/asm/vaplic.h
>>> +++ b/xen/arch/riscv/include/asm/vaplic.h
>>> @@ -21,11 +21,16 @@ struct domain;
>>>   
>>>   struct vaplic_regs {
>>>       uint32_t domaincfg;
>>> +
>>> +    uint32_t *target;
>>>   };
>>
>> A pointer in this structure is odd, as this (supposedly) is a set of
>> guest register values. The field name also doesn't clarify its purpose.
>> All in all: Likely a comment is needed here.
> 
> It is a pointer because I tried to save some memory and allocate 
> register target based on how many irqs a guest really needed.
> 
> As an option I can allocate that statically and use the value from AIA
> spec: target[1]-target[1023]. Would it better?

No, I think dynamic allocation is justified here. (Question is whether it
should be struct vaplic_regs as a whole, but that depends on whether
another runtime-sized array may need adding to it later on.)

Jan

