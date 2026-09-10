Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615BDC79F9F
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 15:43:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414934.1644585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4gvg-0007e0-Uf; Thu, 10 Sep 2026 15:43:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414934.1644585; Thu, 10 Sep 2026 15:43:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4gvg-0007ds-Rc; Thu, 10 Sep 2026 15:43:12 +0000
Received: by outflank-mailman (input) for mailman id 1414934;
 Thu, 10 Sep 2026 15:43:11 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4gvf-0007dm-FF
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 15:43:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4gve-00BHK8-S1
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 17:43:10 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa2d00c-8faa-0a2a0a5109dd-0a2a45039b58-10
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 17:43:10 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa2d00e-fae8-0a2a45030019-4a7de18caa3a-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 17:43:10 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49cd5462b69so15524655e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 08:43:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486e6eeadb5sm2510570f8f.16.2026.09.10.08.43.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 08:43:09 -0700 (PDT)
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
        d=suse.com; s=google; t=1789054990; x=1789659790; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lUXWFktijKPivybQktG6INfkLCcNzEC3V3paUeV5EbM=;
        b=LF88qWF9t6f4Loeine9eUASPpDo9SNUr3ydbuKPeDIOmJQLU+TclSW9VZX9j54iMK8
         N58i6Z3ndc2ca335YPqMObHb66nPov7+5nxJOw6EgSiTISIspWI8I+WJJnJ2b8U/gppM
         YYn9SfGKDrsHrKQi5xO/OuzdnB/JUTLh8Sji01jp5fk9HeIIsjAv2xnMc4aCTT/Anuch
         iTVPRzJv16WvLF+Hmwo5LAuxlBepo9F5zVm3JjJNYxGNHs8uZ/MZoSBSCrM/nYlQDoUh
         NOi9eCpTnb8gkauJhUvpmHJFydPrfb3COeZNpP6MDfJwrxCaUwZRL0fHTNMFWKVGhoUG
         Cbew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054990; x=1789659790;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lUXWFktijKPivybQktG6INfkLCcNzEC3V3paUeV5EbM=;
        b=RDeZf5o5eDeEhlmcoEpQckYrCUOblwLl2uD3LvViIzk86oIA1j7rSWCWOKnZI2Ms4/
         XYrZj5W92BHJopNgRFTo8vf7d7LVFCiwUl8wqE90lzBlwGw71IpRXS7R5LQ+goh3MSnW
         v8Z8NEZJnVcA9cm4ObtO8kSasUtKd1+UN//Bw43sIbhfJouIivP/6sApdi79MCY1czIg
         5CnrWtqi8UDHHXTw+uKVVNLbMUbxoE+kJcO4g0kcI86wcWB0buPU3bJhmLxl9UW/d9Ml
         f26o/aFf8kWd5s/dNi2u5y459pmLTckv49Yi92+QfvILUnO6FVuvgiXSltZeSSaqp4EJ
         /0EQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3tE82bYgcmXxqQwm9gCvzQA/8wBWdDv9IDRaEBlDQms+qti63kNWMaPKyU6i9IRYNiuSY1GM3Y3Q=@lists.xenproject.org
X-Gm-Message-State: AFuF++nI6yK8xQKghI+Ab1rJ8lUnjUfDjWhh3UpyJNerbNttttL7FLqh
	tYa6g7GDxQTqF/PlOFfpCYW3WwEsoSNgXeSNOiA905hgMd+j/P7fpjA50aM8GjcgcA==
X-Gm-Gg: AYBFou1DEKUUuZY96N32elYFrmodu34Q+tF57+nwFxTaa4jp6DXwJx57bc4OlrwQ7Pu
	sU0sdKEGQXDRjdZvPS17LHk4F9HhoWEMI3+OY4H/WuPLaobT+gf7GOODBewnKwiWIip+B6/Pgcr
	2DZFwOr1GcSuQBvGNjdjaUDh0PPqL8GHyIWbS+FTYbyARjnGxkP3xMR8/ITp6KXZwpUfua8n+Jb
	HC+q4ATQwfJcR6yRIX3jzkydmfdR7GuFyvyWv921CgSTXJK/0Eyn0GTztd/kXoaJsU/q1YKKHol
	s7wodCvTss5ZPu4hT1memDjtu230x/iIZ51wh+5F6w2fNFWSQuyTsgTG+AVJ6KFBGCmR+Zua02Y
	jzyFZZZk2+jzrXL7Qn4UUr3ZrQrFbiFXRNs7BnPXjXIwkS6umqzipCF8E+8yaN0kA5hi4o/ANbP
	18KpEds+Hlbe187xG2DbfqsGVlapUesNtqlXdP2OsQDZavBiTfGbn6grxi98F+i1IvrOWbSP/Op
	cpPJrb93AEha4vuMvD+xiXK/1710QUFgrJ8YrdhOkO0F3iamrdoZh72ru+3n68XtJqETBJAxw==
X-Received: by 2002:a05:600c:698c:b0:49c:edfe:d525 with SMTP id 5b1f17b1804b1-49d1f35366fmr294544695e9.10.1789054990252;
        Thu, 10 Sep 2026 08:43:10 -0700 (PDT)
Message-ID: <1a42fad1-922d-441d-9837-f4c43854a5b1@suse.com>
Date: Thu, 10 Sep 2026 17:43:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] vmx: Refactor vpid_sync_vcpu_gva()
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <1785509179.8631fc262581453bbf619ec5b2062170.19fb8a3efe8000e099@vates.tech>
 <1785509305.8631fc262581453bbf619ec5b2062170.19fb8a5db67000e099@vates.tech>
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
In-Reply-To: <1785509305.8631fc262581453bbf619ec5b2062170.19fb8a5db67000e099@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1789054990-6F0C94E9-395B03D6/0/0
X-purgate-type: clean
X-purgate-size: 1302

On 31.07.2026 16:46, Teddy Astie wrote:
> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> @@ -460,19 +460,16 @@ static inline void vpid_sync_vcpu_gva(struct vcpu *v, unsigned long gva)
>       * If individual address invalidation is not supported, we escalate to
>       * use single context invalidation.
>       */
> -    if ( likely(cpu_has_vmx_vpid_invvpid_individual_addr) )
> -        goto execute_invvpid;
> -
> -    type = INVVPID_SINGLE_CONTEXT;
> +    if ( unlikely(!cpu_has_vmx_vpid_invvpid_individual_addr) )
> +        type = INVVPID_SINGLE_CONTEXT;
>  
>      /*
>       * If single context invalidation is not supported, we escalate to
>       * use all context invalidation.
>       */
> -    if ( !cpu_has_vmx_vpid_invvpid_single_context )
> +    if ( unlikely(!cpu_has_vmx_vpid_invvpid_single_context) )
>          type = INVVPID_ALL_CONTEXT;
>  
> -execute_invvpid:
>      __invvpid(type, v->arch.hvm.n1asid.asid, (u64)gva);
>  }

But this isn't functionally identical to the original, at least in the
cpu_has_vmx_vpid_invvpid_individual_addr &&
!cpu_has_vmx_vpid_invvpid_single_context case. We'd now end up using
INVVPID_ALL_CONTEXT there, when it wants to continue to be
INVVPID_INDIVIDUAL_ADDR.

Jan

