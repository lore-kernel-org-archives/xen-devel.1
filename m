Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53531606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 11:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DiwFEGhl
Received: from list by lists.xenproject.org with outflank-mailman.1463099.1674066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM1bx-0000e3-L7; Wed, 28 Oct 2026 11:14:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463099.1674066; Wed, 28 Oct 2026 11:14:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM1bx-0000dw-IP; Wed, 28 Oct 2026 11:14:29 +0000
Received: by outflank-mailman (input) for mailman id 1463099;
 Wed, 28 Oct 2026 11:14:28 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xM1bw-0000dm-IE
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 11:14:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM1bv-00DSkH-K8
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 12:14:27 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae1d90f-bab6-0a2a0a5309dd-0a2a45049a10-24
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 12:14:27 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae1d913-b57f-0a2a45040019-d1558036dcd6-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 12:14:27 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a60f9474c4so10182905e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 04:14:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a97c42ca77sm36695365e9.8.2026.10.28.04.14.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 04:14:26 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793186067; x=1793790867; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfR/aykflLpWF1mmF8c66vclT6jnA1r42KisfCY3QFw=;
        b=DiwFEGhlmz1qmi1+VVUm7WAyDgcpeaU2vi22L53sznRTu8x10Wtmsg8eRe5lpbvzb6
         0Q1gILprBFtCyXOhzQ+jomJeEMxcLecnEf1JEkcTTo/uOZTey2gfS0zgKYDk/g+3Z6Y/
         WCmy6RGXhP+95uGHtxPQ4VbPFxRM8hiBiWxyb+qLkIUtCAhIcu347irXZ9ttig6WHblQ
         eCGBePTb+saQETVGh7RhbQH8xZkLnYwVQYf4tHK3AI97jG/L5+htTa02NSWuzygLQnSO
         1eVSzp5oGcYAOLz4M5/aXAPgmfepp56eL5JFKlRILQOn5IB1+YRSf2jZoTe5zmIaTMu4
         ynVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186067; x=1793790867;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tfR/aykflLpWF1mmF8c66vclT6jnA1r42KisfCY3QFw=;
        b=X3T6FJNT+giP2FqTWJlLZf+Tg0OlPFdHtf0+7F0/R1pgCsgM72q5vWjDKxS1RtlULO
         jSqDe9+HWnMelMmM0mTsLYiSrlEYb8PdApgr2deBNMuemThMpjTrrIpd7RlItoacU5sj
         r13Z6xs53QZAw3l2aso48IJaXScqlKx/dIzfqz8z4DBPo2KpEN69sd8c8Cp7gccOe0ne
         TyaqDXxrOH/8T7XUPe/qFVeH4vF0i469NO2FonEKNLM6cSv5KHe2WCn6fThnV3n32fB1
         M5yMtLHKtZH4ObXJh50MCUCXxrcWs23J8DmZ94EL9sOjpgd2DSDvpULSxwvoriz2vfUm
         K2DQ==
X-Forwarded-Encrypted: i=1; AKwUvBw28w0gCI2hyLPrwfX1TsNZWDITv3TlnamxmtzrgXHXJiLRJDG6ayurL5bKoVgbCv5WM44kw5Jcycg=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLYZOtxl9vmxAjClnHymeHPZOfG51O+KG8uiyPvtpNoDMfJVJG5
	JTiusXUy04hyfDNEnUKJITWLNZv3Hsw6LyYieMqIIvF72yqcgICsw71y91Ni/N5//Q==
X-Gm-Gg: AYBFou0Ly11I2LVfqov4576U10CZMDHxEa1ZTuN7OnprThJ11y2/KHieckBc5WiVheF
	J4g0tEd9GLSOMRN2Ae5cGRJw00Ln8zP0Cqi3sQ9TTxU6eXW6ln2XJId6HxQPkpmC7RTzE56DOw/
	9Pwowlfgbss/BxOhNXHcb3VRN9FxmhZl6yUavbaB9gO1+077Ed2cG7bOtGQlB2FwGIlmWCBBgTn
	u9Hsjhck1PadDc5xNCBV/B3Yv3eywB56r/dVbL61WKHE17Lh1XoRhuYeXAzkNscWikoH578qH1h
	M5TbgwKf0VWkGKxDoqTWnRhxBOgzbuFc8qAYMfHWqhNDJdUeAy97mNXvAyn5c5c+KIz4t+zpM7O
	DfYIUu7xHxuF5hC+dETpA3SwJGyzwgBv5nEvVvE/SBwCs3EIUkdQZ0/3/utYJ0S0VKrYkQ8bm4d
	C55JgXVU9eGd+lz8x+CM7oTkF0Wl9CxgHhcZhmWtJHheH2n+BxcegKBuugbcxLRyJJGinT8OIRk
	/+fjxn0CDce4mlxBK5IKQCij7PhNaOZT0veO4vKbuRA0HuI+KIfkozb23UgEDeF4/x2EyaXA31K
	dRjo1cBxvtpELj0s8BU16Wn9/AsdeVoj95PCxfcLoIJmMvy1CLT0giF2WG0usZVg9LvK0cUE5U8
	KkStdLOjYXddLlq8VUg==
X-Received: by 2002:a05:600c:1387:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4a966586ff2mr41884585e9.14.1793186066783;
        Wed, 28 Oct 2026 04:14:26 -0700 (PDT)
Message-ID: <a1099c1c-8ceb-4275-b7ef-b6c541624c8a@suse.com>
Date: Wed, 28 Oct 2026 12:14:25 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/vlapic: Don't change ICR on x2APIC SELF_IPI write
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <1793023450.8631fc262581453bbf619ec5b2062170.1a178869cb4000f79f@vates.tech>
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
In-Reply-To: <1793023450.8631fc262581453bbf619ec5b2062170.1a178869cb4000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1793186067-50AD8B50-4EB3B187/10/78276251493
X-purgate-type: spam
X-purgate-size: 2673
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26.10.2026 15:03, Teddy Astie wrote:
> The Intel SDM (Vol 3A-13.12.11, June 2026) says
> 
>> The semantics of sending a self-IPI via the SELF IPI register
>> are identical to sending a self targeted edge triggered fixed
>> interrupt with the specified vector.
> 
> However, this doesn't require altering the ICR register.
> On most Intel processors (at least Core/P-Core), it does alter ICR,
> but it's not the case on AMD and Atom/E-Core ones, and APICv Self-IPI
> appears to follow a similar behavior.
> 
> For consistency, adjust the Xen behavior to send the Self-IPI
> directly instead of emulating it by modifying ICR register.
> 
> It also clarify the logic.
> 
> Assisted-by: Claude Fable 5.1
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

However, ...

> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -970,11 +970,13 @@ int vlapic_apicv_write(struct vcpu *v, unsigned int offset)
>  
>      if ( vlapic_x2apic_mode(vlapic) )
>      {
> -        if ( offset != APIC_SELF_IPI )
> -            return X86EMUL_UNHANDLEABLE;

... why the extra churn here? The overall hunk here ...

> +        if ( offset == APIC_SELF_IPI )
> +        {
> +            vlapic_ipi(vlapic, APIC_DEST_SELF | (val & APIC_VECTOR_MASK), 0);
> +            return X86EMUL_OKAY;
> +        }
>  
> -        offset = APIC_ICR;
> -        val = APIC_DEST_SELF | (val & APIC_VECTOR_MASK);
> +        return X86EMUL_UNHANDLEABLE;
>      }
>  
>      vlapic_reg_write(v, offset, val);

... could be

@@ -973,8 +973,8 @@ int vlapic_apicv_write(struct vcpu *v, unsigned int offset)
         if ( offset != APIC_SELF_IPI )
             return X86EMUL_UNHANDLEABLE;
 
-        offset = APIC_ICR;
-        val = APIC_DEST_SELF | (val & APIC_VECTOR_MASK);
+        vlapic_ipi(vlapic, APIC_DEST_SELF | (val & APIC_VECTOR_MASK), 0);
+        return X86EMUL_OKAY;
     }
 
     vlapic_reg_write(v, offset, val);

Much closer to ...

> @@ -1050,9 +1052,8 @@ int guest_wrmsr_x2apic(struct vcpu *v, uint32_t msr, uint64_t val)
>      case APIC_SELF_IPI:
>          if ( val & ~APIC_VECTOR_MASK )
>              return X86EMUL_EXCEPTION;
> -        offset = APIC_ICR;
> -        val = APIC_DEST_SELF | (val & APIC_VECTOR_MASK);
> -        break;
> +        vlapic_ipi(vlapic, APIC_DEST_SELF | (val & APIC_VECTOR_MASK), 0);
> +        return X86EMUL_OKAY;
>  
>      case APIC_EOI:
>      case APIC_ESR:

... this hunk then. (I may take the liberty of making that adjustment while
committing, unless you provide a reason for the bigger change.)

Jan

