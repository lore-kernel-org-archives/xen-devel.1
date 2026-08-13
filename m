Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B797C5AC67
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 08:13:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389510.1630202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuQYU-0007X9-2j; Thu, 13 Aug 2026 08:12:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389510.1630202; Thu, 13 Aug 2026 08:12:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuQYT-0007X2-W6; Thu, 13 Aug 2026 08:12:49 +0000
Received: by outflank-mailman (input) for mailman id 1389510;
 Thu, 13 Aug 2026 08:12:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wuQYT-0007Wv-6U
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 08:12:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuQYS-0006ec-4s
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 10:12:48 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7d7c6c-2eae-0a2a0a5409dd-0a2a450c93f0-46
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 10:12:47 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7d7c7f-f479-0a2a450c0019-d1558035d1bb-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 10:12:47 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4995b0343c1so4111025e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 01:12:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49982130365sm45347505e9.7.2026.08.13.01.12.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 01:12:46 -0700 (PDT)
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
        d=suse.com; s=google; t=1786608767; x=1787213567; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3QPl/G8phE1E3cAg+rCD1JXfC2gmx306uakT5JXiUhQ=;
        b=YZBavGGw3fUjw/A1RpdYHuYlbIfQQe5TJlY5037ldI57LfOYhHdaX7krRp+YgborvK
         jE9D23Katmtn/c4gv64Zo4F/ovJ1UIGL7TVlM+zaxCzvLs2p5r3QWlBIOJww4eSpVCh/
         WsV7LkpbLIpigNCJzDnNM68zFJTM+Ws7/x53OnEhlTHFl9wdy5PM/9XhokIuffa/J0VY
         YfV/oEEoy21apWeXz9sl6tKIRqElIeP4OANwIn16yOTdyn9D0IMZNJUTbBk1+4MM99tF
         Lxwfr0QUD04iLal7+INX3evD0E9fvj7klkf03Sb8TNRcOAMFl7C+kMkd1vZS691yD1WD
         tTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786608767; x=1787213567;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3QPl/G8phE1E3cAg+rCD1JXfC2gmx306uakT5JXiUhQ=;
        b=bua1G+WYUZ4RPBwx4WwU12hi9XL69lJU469LXN2Dm3EDq7KP2vmisBbFsI/uiyRFf0
         OQG+GLswYZG0fnIpRrGFHyjTz7lsJ+jTUnVA9hXgAGAePDodAnWZlzLIAKdtxGFwtRCk
         6xqFvUQ1LAVtqp9urNNEUHBi6/naR3LHrzGrw3ou/oG27c+8HggRGHlZyWhiIIxHDZ0g
         aQCJNqFw2dwin9rX52ODRt309wd70Glndml3IPZKz3J1/lsht928E/TmRXD1DG74BD/n
         8UjVixXVJ25uAbuJcHAcU83eBDAmIC3HhmnbcuuR0ZJUo476bhillNYPplmrRbauyoKT
         Ro0w==
X-Forwarded-Encrypted: i=1; AHgh+RrgVhfSCdoszXLMqMA6000Xr+fPpCUvcWxtT52hEV7K0F5ei8zSwvsYABJ6FxEsJBoJH4D1V/OMpRo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyWc6eiGk5Di0+2rhfu9Ko3MSSJnMf/JDx3TVGYpwk1dV34QCHL
	h/Zcp1tk1oggmRxgXsmZq93znF4pYV8Cj1Z7/aRBN+8hI3d/HI3EPRh9Yu2w7cqp+g==
X-Gm-Gg: AR+sD11J7XlRLeeu9Db9I9G2UsclHCBjHbHihLYXe04YDzYHwHIpqEMiqroGE03Fgde
	NVGHvKf4dGSSquioaf2w6Y+cs7AI8Hf8tdzeZLIAERHYklsQjHPbOmo1xn0zt7u01Ma/qOo7cdb
	L3V5PQa+LRrSLOIkfwnnf0hpFmEzFtUHcwYEnpwLtOvnD+LIGOekxCNMz+fHu/a/bR7p9n/U/Lg
	FzPxZ63iTwRyhZODfIKHkkBZAuRWJ/uh0E5kUxWsMfa7LBjFral/kUnOxLXrzm0PAOYqjo6mH7a
	5b22cp3KPpdqWRiohhkaT0exubNijMC81hy2q8MkrEqUbzrH6ZloJwGd4bvslNZfpYeRnuozCTZ
	GxUYNunuf6KFRfOREdr++RchZtsYuPprWkE3P+/KCu4sqvmHKl2kRI94PgFVCem14Y3YwIN4QWs
	y41irueDTXSx9ogeKnWHnkkdBghdwaHv0s5OPjIsINVWIgOrRyPhbc3lPIGPu4QOBHHT5agf17H
	2ZFZgLh4v28BHJ1mYJLMBJYpC5MMYLjxKv2fk5WRm9l35lqDfoL
X-Received: by 2002:a05:600c:8284:b0:499:6a92:fff1 with SMTP id 5b1f17b1804b1-499821989abmr48826045e9.18.1786608766987;
        Thu, 13 Aug 2026 01:12:46 -0700 (PDT)
Message-ID: <affe36be-1638-4ff1-bbc1-d970f3547abe@suse.com>
Date: Thu, 13 Aug 2026 10:12:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/nSVM: Check injected event consistency
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, teddy.astie@vates.tech,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <95abc420acac6eefc1b97c3c98753d510930ce8a.1785933566.git.abdelkareem.abdelsaamad@citrix.com>
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
In-Reply-To: <95abc420acac6eefc1b97c3c98753d510930ce8a.1785933566.git.abdelkareem.abdelsaamad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1786608767-76EDAA5B-C1727113/0/0
X-purgate-type: clean
X-purgate-size: 4616

On 06.08.2026 19:23, Abdelkareem Abdelsaamad wrote:
> On the AMD platforms, allowing a VMRUN instruction with a malformed VMCB has
> debugging complications, security and performance implications. The APM
> volume #2 15.20 (40332-Rev. 4.10-July 2026) states the two possibilities that
> result in a VMRUN exit with VMEXIT_INVALID due to the injected event. These are
> • Reserved values of TYPE have been specified.
> • TYPE = 3 (exception) has been specified with a vector that does not
>   correspond to an exception (this includes vector 2, which is an NMI, not
>   an exception).
> 
> Extend the VMCB validation to check for such inconsistency.
> 
> The collection of the invalid exception vectors are ported from the upstream
> KVM commit
> ("7e79f71bca5c" KVM: nSVM: Add missing consistency check for EVENTINJ). Adjust
> the checks from the commit to align with the APM Volume #2 and Volume #3
> (40332—Rev. 4.40—July 2026) for the X86_EXC_OF and X86_EXC_BR vectors which

Isn't this 4.10, just like you have it further up?

> should not be valid on the x86 64-bit (long mode) platforms. The adjustment is
> posted to the KVM mailing commit patch thread
> https://lore.kernel.org/all/20260803225402.2324595-1-abdelkareem.abdelsaamad@citrix.com/
> 
> Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
> ---
> Changes in v3:
> - Restricted X86_EXC_OF (4) and X86_EXC_BR (5) vector injections to 
>   non-64-bit guests to prevent impossible guest-mode state injections
>   per AMD APM Volumes 2 & 3.
> - Refactored exception vector validation from if-conditions to a switch
>   statement to improve readability and extensibility.
> - Restricted X86_EXC_CP (21) vector injection to hosts with enabled CET
>   to prevent VMRUN failures on hardware without CET support.

When reading this, I was puzzled, but the code below is correct: It's not
the host you check, but the guest's CR4.

> --- a/xen/arch/x86/hvm/svm/vmcb.c
> +++ b/xen/arch/x86/hvm/svm/vmcb.c
> @@ -320,6 +320,41 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
>      svm_dump_sel("  TR", &vmcb->tr);
>  }
>  
> +static bool is_valid_svm_vmcb_injected_exception_vector(

Is in particular "svm" but perhaps also "vmcb" really relevant in the name
here (which is a static helper)?

> +    const struct vmcb_struct *vmcb, uint8_t vmcb_injected_vector)
> +{
> +    switch ( vmcb_injected_vector )
> +    {
> +    case X86_EXC_DE:
> +    case X86_EXC_DB:
> +    case X86_EXC_BP:
> +    case X86_EXC_UD:
> +    case X86_EXC_NM:
> +    case X86_EXC_DF:
> +    case X86_EXC_TS:
> +    case X86_EXC_NP:
> +    case X86_EXC_SS:
> +    case X86_EXC_GP:
> +    case X86_EXC_PF:
> +    case X86_EXC_MF:
> +    case X86_EXC_AC:
> +    case X86_EXC_MC:
> +    case X86_EXC_XM:

Doesn't #XM (AMD: #XF) require CR4.OSXMMEXCPT to be set?

> +    case X86_EXC_HV:
> +    case X86_EXC_SX:

Are #HV and #SX really permitted without any constraints?

> +        return true;
> +    case X86_EXC_OF:
> +    case X86_EXC_BR:
> +        return !(vmcb_get_efer(vmcb) & EFER_LMA) || !(vmcb->cs.l);

Nit: No need for parentheses on the rhs of the ||.

> +    case X86_EXC_VC:
> +        return vmcb_get_sev_es(vmcb);
> +    case X86_EXC_CP:
> +        return !!(vmcb_get_cr4(vmcb) & X86_CR4_CET);

No need for !! when converting to bool.

> +    default:
> +        return false;
> +    }

Throughout: Blank lines please between non-fall-through case blocks.

> @@ -392,6 +433,16 @@ bool svm_vmcb_isvalid(
>          PRINTF("eventinj: MBZ bits are set (%#"PRIx64")\n",
>                 vmcb->event_inj.raw);
>  
> +    if ( !((1 << vmcb_injected_type) & vmcb_valid_event_inj_types_mask) )
> +        PRINTF("eventinj: Invalid Injected Event Type: (%#"PRIx8")\n",
> +               vmcb_injected_type);
> +
> +    if ( (vmcb_injected_type == X86_ET_HW_EXC) &&
> +         !is_valid_svm_vmcb_injected_exception_vector(
> +             vmcb, vmcb_injected_vector) )

Nit: Indentation is off by one here. The anchor on the earlier line isn't the
'!' but the 'i'.

> +        PRINTF("eventinj: Invalid Injected Event. Exception type: (%#"PRIx8"),"
> +               " with a vector: (%#"PRIx8") does not belong to an exception on"
> +               " the platform \n", vmcb_injected_type, vmcb_injected_vector);

This message is quite a bit too long. There's also a stray blank ahead of the
\n. And further arguments after one that was already wrapped across lines want
to start on a separate line.

Jan

