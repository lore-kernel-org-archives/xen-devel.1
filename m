Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8326BC61DD6
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 13:07:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405885.1639323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1kge-0001yF-5q; Wed, 02 Sep 2026 13:07:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405885.1639323; Wed, 02 Sep 2026 13:07:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1kge-0001y8-3A; Wed, 02 Sep 2026 13:07:32 +0000
Received: by outflank-mailman (input) for mailman id 1405885;
 Wed, 02 Sep 2026 13:07:30 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1kgc-0001y2-Q9
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 13:07:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1kgc-002urN-2f
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 15:07:30 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a981f8a-2eae-0a2a0a5409dd-0a2a450986e6-28
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 15:07:29 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a981f91-be1a-0a2a45090019-d155dd2ab4f0-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 15:07:29 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-48436251906so1140222f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 06:07:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448eea961sm6440559f8f.28.2026.09.02.06.07.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 06:07:28 -0700 (PDT)
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
        d=suse.com; s=google; t=1788354449; x=1788959249; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vb02FW8tGEf13a7CalRORKHZMMVH1pipaK/Lpcv4Tnw=;
        b=RGeYOdKJubIjjccSXIv3PF/k08GKIoBZMO+Y+4EB+63jqS8gtSiiqE4elrFBseuULg
         nYhorKH8yHVycgvz03VmiK6HFL616kd/a1JWAmmZosTej3p7iVqG5W4NUhP7rixPZ5oY
         BEbOCS8/cIP4WuElc5MHczyRBL0XX33gxE0I06+Ngb4wPFnvqL9GpvZetQj4uintxybM
         0zcVgouHyMGvh54EMVYJuSrteJuFtOrjfOMS3P/fR+pk09AnUBoWf6JYQRdmuG5SXGaL
         TDkmDKNE1cv1AdljrbDsaV8gjhKXYkfmQhJ/o0aZMxWDwcucwjclf/EIlkg/5MyclG3p
         aHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788354449; x=1788959249;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vb02FW8tGEf13a7CalRORKHZMMVH1pipaK/Lpcv4Tnw=;
        b=eAZ6hjhexGGQn8iQQWvRCvmATV552P44fmgX0Na3kUAQVj+XaP/yAo2Oo03TgWawIj
         bklA1K0nnh8p6evfzUoq08c/2DMii+HNA3XQ5yaBANOvNAz11tbHEFxFmeFnZNlSqBdd
         2V3DEOQfl4+I4vjBZSJEUcJL2puDaH/5s/phwX+YewDy/6GPgiocEbmSAepH4QmUa6gN
         rHLINjsLOqFsIdwmQ2kZAjDkPk1tBf08XHNTkAxDFutMMNET/6lmSnyurIzpaLmE41Cy
         PZ1JjEdrRDHkZDbl7Z1OU5IgrKG667h09uLI4iHcLoVZnSAnkru4b0bEg6i+Zb2e1YxP
         Hi8w==
X-Forwarded-Encrypted: i=1; AKwUvBxVWbrKCeNaYJQX+r88Ryz+QEWmwbQXbNQcDVhAewISTJqoUkEJut4nRYBroKeskrESXIbUDZ9wDMY=@lists.xenproject.org
X-Gm-Message-State: AFuF++nopdu+Kf9cFr6I+KTAyoKwYd8zkt9+HOvjh3tAFqdyPOtouJGg
	IjIhk8QWKpCC5sQ7syRRprQoiLGAP/I+XJRnhmID/cRo17Io4IEENjZ4fkRXQruzog==
X-Gm-Gg: AYBFou0mtLjwU6JXZFyJOgmUJ0YJcwRz5n4pccYeqkO1mlA2tgtB6fnmRgTeqQeOzF3
	KWEgOG/AS9TZx8N53Lbto0h/2182klR8j2mnaFPweGRSe+9sdd6svmxSLQWvC5BRRY5qMtCmh6R
	0VGawNGo1QVrH9vM1uUeiyKMwdigqUE7LwwzZcyY/E4T53jE966OifZ0YzbZsO+/EIrvfm+A86t
	/Ijv7ZwzDMO2XBpjxvRCpXNYx+bOD1ard/JdDX+Ax2v7GET4lJk54T2ZKC0Pe9+JzPR3JlwYmZ9
	zWjcCMabpom/GTWy8MX3w+b2hyjYRDY6eUP/KZbWLTuBpF+CO9jmhhBNeC2pZ0M8G2Sc7dXHIX4
	xdtAXHue0nFt6o5bBC8Gv4LqHeemfYKsu3KWBV+m2BfR8wfOSoVHodNM9Lw5gJalc4vdWVRIWbr
	7yfAw0QrM1pz6JPuy1DgMUg3DmuRlYFIp+g+QxkPtkNzIrmChUvIOD6k5HInUTwwz2hUHh32XP6
	DVb+5Dl8a6i7W/gqylBxuf6ofNBjaIhQyBOSsyLIlOHxdneS4Jg
X-Received: by 2002:a05:6000:18a8:b0:47e:81aa:3832 with SMTP id ffacd0b85a97d-48488f1b1f1mr7860742f8f.16.1788354449128;
        Wed, 02 Sep 2026 06:07:29 -0700 (PDT)
Message-ID: <071c5b4f-1d57-4223-94bd-9f8ae8d80366@suse.com>
Date: Wed, 2 Sep 2026 15:07:27 +0200
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
In-Reply-To: <127e8aea-4d65-492e-8bda-bffc75f02481@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1788354449-39EC6034-1277DF2A/0/0
X-purgate-type: clean
X-purgate-size: 3223

On 02.09.2026 13:42, Oleksii Kurochko wrote:
> On 9/1/26 5:20 PM, Jan Beulich wrote:
>> On 27.08.2026 17:20, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/domain.c
>>> +++ b/xen/arch/riscv/domain.c
>>> @@ -88,7 +88,13 @@ static void vcpu_csr_init(struct vcpu *v)
>>>   {
>>>       v->arch.hedeleg = HEDELEG_DEFAULT & csr_masks.hedeleg;
>>>   
>>> -    vcpu_guest_cpu_user_regs(v)->hstatus = HSTATUS_SPV | HSTATUS_SPVP;
>>> +    /*
>>> +     * Xen supports 64-bit guests only, so set the guest's XLEN explicitly
>>> +     * rather than leaving it to the WARL behaviour of hstatus.VSXL, which the
>>> +     * decoding of a trapped instruction depends on.
>>> +     */
>>> +    vcpu_guest_cpu_user_regs(v)->hstatus =
>>> +        HSTATUS_SPV | HSTATUS_SPVP | MASK_INSR(HSTATUS_VSXL_64, HSTATUS_VSXL);
>>
>> The comment is correct right now, but the situation better would change
>> at some point. Can't you arrange for things to be correct here also for
>> a future where 32- and 128-bit guests would also be supported?
> 
> I am not sure about 128-bit guests as H extension is dependent on RV32 
> or RV64 but probably it will be changed:
> ```
> The hypervisor extension depends on an "I" base integer ISA with 32 x 
> registers (RV32I or RV64I), not RV32E or RV64E, which have only 16 x 
> registers.
> ```

Lots of updates like this likely will be needed for RV128 to actually become
a thing.

> I will introduce the following (also it will be needed also to check if 
> we could VSXL set at all as implmentation can make that field read-only 
> and do VSXLLEN=HSXLEN):
> 
> /*
>   * Return the hstatus.VSXL value encoding the guest's XLEN. The switch()
>   * deliberately has no default case, so that adding a new domain_type (a
>   * 128-bit one, in particular) fails to build until this mapping is 
> updated.
>   */
> static unsigned int domain_vsxl(const struct domain *d)
> {
>      switch ( d->type )
>      {
>      case DOMAIN_32BIT:
>          return HSTATUS_VSXL_32;
> 
>      case DOMAIN_64BIT:
>          return HSTATUS_VSXL_64;
>      }
> 
>      ASSERT_UNREACHABLE();
> 
>      return HSTATUS_VSXL_64;

Why not simply return 0 here? You genuinely don't know the size.

> }
> 
> It will also affect then common code as vcpu_csr_init() could be then 
> called before domain type is set:
> 
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -812,17 +812,18 @@ static int __init construct_domU(struct 
> kernel_info *kinfo,
>       else if ( rc == 0 && !strcmp(dom0less_enhanced, "no-xenstore") )
>           kinfo->dom0less_feature = DOM0LESS_ENHANCED_NO_XS;
> 
> -    if ( vcpu_create(d, 0) == NULL )
> -        return -ENOMEM;
> -
>       d->max_pages = ((paddr_t)mem * SZ_1K) >> PAGE_SHIFT;
> 
>       rc = kernel_probe(kinfo, node);
>       if ( rc < 0 )
>           return rc;
> 
> +    /* The domain type needs to be known before the first vCPU is 
> created. */
>       set_domain_type(d, kinfo);
> 
> +    if ( vcpu_create(d, 0) == NULL )
> +        return -ENOMEM;

I don't understand the need for this, likely because I don't see why
domain_vsxl() would need calling from underneath vcpu_create().

Jan

