Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30582C44501
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 06:50:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363480.1615080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkFua-0007fs-0U; Thu, 16 Jul 2026 06:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363480.1615080; Thu, 16 Jul 2026 06:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkFuZ-0007fk-TY; Thu, 16 Jul 2026 06:49:35 +0000
Received: by outflank-mailman (input) for mailman id 1363480;
 Thu, 16 Jul 2026 06:49:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wkFuY-0007fe-Tn
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 06:49:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkFuY-00D4vj-A9
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 08:49:34 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a587efd-bab6-0a2a0a5309dd-0a2a450c98ac-6
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 08:49:34 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a587efd-f479-0a2a450c0019-d155dd33d9c3-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 08:49:34 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-47df440fcd5so3460155f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 23:49:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f464c9cc3sm22933496f8f.35.2026.07.15.23.49.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jul 2026 23:49:33 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Cc:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784184573; x=1784789373; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNoHKWc5FbE/KNMPdiw7+XnjDpS+jyeiE4XrEclO62w=;
        b=bvGugXP1FcHwdM5bSupDfulG2/By2LERJZgEDS6H6CcEByZylO2L7BbuHNH4vJ5Rb3
         fc0FswDKqk7egoFTtR/sHe4mrdfC5fzaKYxy0wiy2uYWJTd4fdq7tG91uSabo6KorLT3
         EAhvZ/1Fi2vkqGpuEWOYg1gA40o9dblcImmHjIIg7qiJp6MN6GwfsJVAV7FQPM7Ax3+1
         WlAnztKya3iWWm9cdM5XQXu9E9SJwLvCgti1n7acQgVI8kssIvZFt1mqoYUCdfJD8Cm9
         swKLUg0SppOyvluY/ont9yxUnsyh6GlIfZRzYxpN+SpTzckbIKlRxZNyoG21E8S56fTv
         /1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784184573; x=1784789373;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNoHKWc5FbE/KNMPdiw7+XnjDpS+jyeiE4XrEclO62w=;
        b=LnVXGDpCicH87OJhwf8yaYHyp8f4BfAY6CMD9+JgSxS0RfSNJEBItBISfFrimbhTyI
         qi+SF4UqdYUCA5VoS6lPtVXj2pgpIJNKq8ceZ7VY/LyTjYSbY/K2FpKSs40WnkVo+hsd
         EOcXbvRQcr2Y6st6YCG9fvFZtN2VpvKzyKS8M0d87WrIociv3U+Z2tFnpPMuD/90yUgp
         mkhkJzJdFRzRKSAk0sBNpWJV8ENNqyvkVpG83DfeviBEjZQPO5vb3xQX91HXojbhqay2
         RJ1JzqbWYS44fIKkmrkXj9Qs5BgEqY3NNHzzLb/lUQ4TqNnRmV4XGDRrbTXHMaxRbsmm
         NwaQ==
X-Gm-Message-State: AOJu0YyzppKamGi4kHygFbEZQQMnv4feoau5zwmAwsucIkmTrW0mUBTU
	gyrC8UCwWnCIYZtAESgvlCo8abJHJ0hAW+aKuHuHw+b5W2w+TGW67v0bqkiItZm1NeKwMX0g0FQ
	Q5ygpxQ==
X-Gm-Gg: AfdE7cnCpnsOt+yft2jOVFx3R2qGdM3R0Q3f9jQBxH3tmpDcdncn9g8cx0yx2V0JzhB
	MtPZeHU0uEiyy1XKPgZyfULmLrHUz1uXjj99uVMNs/uQgDDn9aWniPLqkCJEezZ2jnyyQnVkl+3
	+HOdEV9Qob3UQ1XbH+JRRadxdB5o2xzWWvfIRiNA+7w0fHP0RQnTMtxkscGOBTVIdDttRkpUNmJ
	Bze0bCY2MVp3Qk7Wxu/20/rWcvggXFwm0hVjrMh+en54ZW14k0sa8rsmy5d/SftLNNOpIbCMvEJ
	V+SuURkPWOhYKwhqT55lQR+O9owYCGkaJ1oYm6v3rlNvXdXqsZMqJnHaYBPA+FJ4U03Fkb2pr6K
	yOZ/5MkAzRrxd2XsX1gpnJnXcF0FYoooVYu8jQpQcpCqcrsZhM3dGvLR7HDbOoG0n5IAG8+ebEv
	J1UPgkKMNlIbTO/KJXqA8gylcy4vj9nKA5pu00LPXAWphhqzAXdnjlS0+AqbZw0T2auA==
X-Received: by 2002:a5d:5f47:0:b0:474:57f0:49f8 with SMTP id ffacd0b85a97d-47f4fca67b2mr6094203f8f.4.1784184573557;
        Wed, 15 Jul 2026 23:49:33 -0700 (PDT)
Message-ID: <af5dfcaa-8da8-4bd2-ac30-24bc65e65a6e@suse.com>
Date: Thu, 16 Jul 2026 08:49:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] uninitialised stack memory copied to vmcs12
To: =?UTF-8?Q?Johann_H=C3=B6pfner?= <hoepf@cit.tum.de>
References: <alfcosYs35pOCslN@cit.tum.de>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <alfcosYs35pOCslN@cit.tum.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1784184574-004CFA5B-83BD1976/0/0
X-purgate-type: clean
X-purgate-size: 3545

On 16.07.2026 00:06, Johann Höpfner wrote:
> Hello xen-devel@
> 
> While fuzzing Xen instrumented by an experimental memory sanitizer, we
> discovered the following bug in nested VMX, where a malicious L1 guest
> with nestedhvm=1 can read four uninitialised bytes from the hypervisor
> vmexit handler stack. 
> 
> Specifically nvmx_handle_vmwrite leaves local eight byte variable
> 'operand' uninitialised. It is then written to by decode_vmx_inst. In
> cases where the operand to vmwrite is a r32, r64 or m64, this fully
> initializes *poperandS; if however a vmwrite with a 32 bit memory
> operand is emulated, hvm_copy_from_guest_linear leaves the upper half of
> *poperandS uninitialised. In the case where cpu_has_vmx_shadow_vmcs
> returns true, the resulting eight byte value is consequently written to
> the vmcs12 unchecked and leaks the four uninitialised bytes into guest
> physical memory via the vmcs12.
> 
> Attached is a reproducer for XTF which triggers the behavior described
> above at least on 4.20 and master versions of Xen running on intel
> x86_64 hosts. We would expect there to be the constant 0x99999999, which
> we have just vmwritten, somewhere in the unloaded vmcs12, likely zero
> extended to eight bytes. However it is stored instead alongside four
> bytes read from the hypervisor stack. Currently I am not aware of
> security implications for this bug, as I have not been able to leak more
> than what appear to be the rather uninteresting upper four bytes of a
> pointer.

As to security implications: nested-virt is still experimental, so there's
no formal concern there. In more general terms though, unless you're
certain there's no security aspect to an issue, please instead report more
privately to security@xenproject.org.

> The same issue exists in nvmx_handle_invept, though no malicious use is
> known to me. I suggest fixing both by simply initialising operand / eptp
> to 0 in nvmx_handle_vmwrite / nvmx_handle_invept. Patch is given
> immediately below, preceding the reproducer.

You may have noticed that you were able to repro (normally) only with a
hvm32 xtf test. That's because of a bug fixed by [1], which sadly still
didn't make it in. That same bug affects INVEPT and INVVPID. Imo ...

> --- a/xen/arch/x86/hvm/vmx/vvmx.c
> +++ b/xen/arch/x86/hvm/vmx/vvmx.c
> @@ -1968,7 +1968,7 @@ static int nvmx_handle_vmwrite(struct cpu_user_regs *regs)
>  {
>      struct vcpu *v = current;
>      struct vmx_inst_decoded decode;
> -    unsigned long operand; 
> +    unsigned long operand = 0;
>      u64 vmcs_encoding;
>      enum vmx_insn_errno err;
>      int rc;
> @@ -2012,7 +2012,7 @@ static int nvmx_handle_vmwrite(struct cpu_user_regs *regs)
>  static int nvmx_handle_invept(struct cpu_user_regs *regs)
>  {
>      struct vmx_inst_decoded decode;
> -    unsigned long eptp;
> +    unsigned long eptp = 0;
>      int ret;
>  
>      if ( (ret = decode_vmx_inst(regs, &decode, &eptp)) != X86EMUL_OKAY )

... the INVVPID case wants the same change to be made, even if the local
variable isn't used right now. Otoh the need for the INVEPT and INVVPID
changes goes away with [1] applied, as the size of their memory operand
really doesn't depend on operand or address size.

In any event - why don't you make your proposed change into a proper patch
(primary piece missing is your S-o-b, and perhaps we also would want a
suitable Fixes: tag)?

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2025-06/msg01212.html

