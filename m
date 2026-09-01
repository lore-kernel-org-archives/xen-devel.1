Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BD4C624D4
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2026 13:17:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404756.1638436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1OML-0002jC-Na; Tue, 01 Sep 2026 13:17:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404756.1638436; Tue, 01 Sep 2026 13:17:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1OML-0002j5-Ka; Tue, 01 Sep 2026 13:17:05 +0000
Received: by outflank-mailman (input) for mailman id 1404756;
 Tue, 01 Sep 2026 13:17:04 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1OMJ-0002iz-TJ
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 13:17:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1OMH-008Opx-Tr
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 15:17:01 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a96d048-8faa-0a2a0a5109dd-0a2a450cc086-14
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 15:17:01 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a96d04d-f479-0a2a450c0019-d155802cc9d3-3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 15:17:01 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-49ccfbe062eso25308395e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 06:17:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce1a3fesm70718595e9.12.2026.09.01.06.16.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 06:17:00 -0700 (PDT)
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
        d=suse.com; s=google; t=1788268621; x=1788873421; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UHcJZ7qe8EHcanx4NmTqt9bQxkl+VRDPvbq2agGEMR4=;
        b=SKrh5Xn0Y76UTgnH+RqvvXGSm/i49pQsfOSx6OH6BfTXNQvgypCxKGu4uslUPERI7q
         XpNHyWn3AMdByURzOLlZYs7oZdR8rJO4b5Blz9Nvp0UP1aecydWb3qTAQ1L/frb28rqE
         HnSZUjLrwJsYTqgkhtWycZ7x2Tc3K7Vfsn+GBari9U+UTXq6qDKI0rZ6di7lf5JXaKcT
         g1NCRaeE4UY02Ud8G6bhAw9sfEsG3GjpUk3k1nvLiC8iW46pFMS01v9YoBjXIVgKkpc9
         E0u+I+CRcrw8ykJNi+DlEQ1Vs4yFHFIDkbqVBnU6rI9Bs0dCs0mTaRE0UgSafxkpPnp2
         M1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268621; x=1788873421;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UHcJZ7qe8EHcanx4NmTqt9bQxkl+VRDPvbq2agGEMR4=;
        b=ptUbHRMoNeeSuIHfa00NWFwPYTsYWw40gRtj7nWuJ5FMDliDf1SfxjLRshRD7omkQG
         mDhfeeFxdcK65jYt1ZbWWstVi686M2OEd3byEkkF1De2137KdrLpYDtQgODzYR6tefBL
         OcGxiroTOV+97AfO+ILNLhdurDcdunUjfec1suxQk+EmgdaZfEKmbVeWyOkKZ/0PkO9A
         mKwiTrUg77H/U1TMigSUm4y8lzEt/eb+wIDNbRIMichFd8nhv8miVoHpwVj4Kq/n0xWL
         kfqiOK1LCVGa6mKZ9wBFN0F74DESYQH2j8TJOzlIcF21XbwFKIibVMJRVsE0WeVSWAfC
         IRNg==
X-Forwarded-Encrypted: i=1; AHgh+RrqWcAGzwdZlQ1BMqgAEKJcm4KqzM7ylO2bTsSxtzyrUPHJpGLbCeD3YrFTsxBoIjmnzEqFpAD0+iA=@lists.xenproject.org
X-Gm-Message-State: AFuF++kQqRlzhDfyPNul+tzs2Vl32P6dT3nRD8bzTkj2qXPJ61mwngS3
	WMLzWw1+Eld2ebCr8OWybeGo99BxGSmfsF/V/VFH1v4NEqIoGK7J4Kpu/q58tlm64g==
X-Gm-Gg: AR+sD129ISSRWTpaPHI5dqmx6l7oNNcr7JBPLIaG4AJ9sGeB4GsUPe51vd1Az5R7ekV
	KGiRN/JB59kYSm1Sl9ZdkDYlU9GUz7Zh8i/8lFrJrysB24X/tP3jRS06EJlOoPdyCm0+q4p7rMJ
	1Z/kCkKUt/b71Gdmdp9q+SMa1ol51p8zQVr1JKo/6KVrIfZh95wguRgUn0gu6Bm/Vf/mLK6M4wk
	qoaLceuCULhq6VobNHx0+KFK85iSMW61XO1AcQFsDCfvgxFcbozP0vxdQlnS1urkUV2DQY+8/Gj
	kYmyB5ocyGaVLxM1aDEk61YTa3bV/zkwfQAeBuci2x4Aht4kPngSyl8pe3vovthNP34Z2Hn/wS9
	Ztblp3L5OiAkliAzBr8PCaXuFc3oA0MJrPmPEisuAgA202Xe1eheonTvefIvCIqmHL1/QRUlgl8
	J0Tro+zUl1ChRzDnShM92zSvEHW9dJM7pLl4QRdrakNYBFjGJjjRS+WXSXHurfftNiFbF4j7rql
	PLL2kFBniUtbyXzp0vBiiGuPFoiYjezzPT0wzPTQh8hckHos9r6
X-Received: by 2002:a05:600c:8b86:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-49b91c2777emr603425715e9.7.1788268621206;
        Tue, 01 Sep 2026 06:17:01 -0700 (PDT)
Message-ID: <16110ecc-fc0d-4b9d-a958-2a75ca60b69f@suse.com>
Date: Tue, 1 Sep 2026 15:16:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/5] x86/boot: Remove "cc" clobber from memcmp()
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
 Alexey Dobriyan <adobriyan@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Gerst <brgerst@gmail.com>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-1-e70ef3b75b6a@igalia.com>
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
In-Reply-To: <20260822-pvh-kasan-inline-v9-1-e70ef3b75b6a@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1788268621-038D5A5B-96896E42/0/0
X-purgate-type: clean
X-purgate-size: 1894

On 22.08.2026 20:33, Mauricio Faria de Oliveira wrote:
> According to the GCC documentation, conditions in the flags register
> (e.g., "=@ccnz") are output operands [1] and the compiler is aware [2].
> 
> Also, clobbers (e.g., "cc") may not overlap with an output operand [2].
> 
> Thus, remove the "cc" clobber as it is redudant, and overlaps with, the
> "=@ccnz" output operand.
> 
>     """
>     6.11.2.4 Flag Output Operands
> 
>         On some targets, a special form of output operand exists by which
>         conditions in the flags register may be outputs of the asm. [...]
> 
>     6.11.2.6 Clobbers and Scratch Registers
> 
>         While the compiler is aware of changes to entries listed in the
>         output operands, [...]
> 
>         Clobber descriptions may not in any way overlap with an input or
>         output operand. [...]
>     """
> 
> Reported-by: "H. Peter Anvin" <hpa@zytor.com>
> Link: https://lore.kernel.org/all/5e19b195-0ca2-4510-81cb-497b40e4aaf5@zytor.com/
> Fixes: a8c171c107c0 ("x86/boot: Add volatile, clobbers and zero-length test in memcmp()")
> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
> Link: https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html#Flag-Output-Operands [1]
> Link: https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html#Clobbers-and-Scratch-Registers-1 [2]

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/arch/x86/boot/string.c
> +++ b/arch/x86/boot/string.c
> @@ -40,7 +40,7 @@ int memcmp(const void *s1, const void *s2, size_t len)
>  	asm volatile("test %3, %3\n\t"
>  		     "repe cmpsb"
>  		     : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len)
> -		     : : "cc", "memory");
> +		     : : "memory");

In fact I'm using a modified gcc which properly rejects such conflicting
uses of output and clobber. ("cc" clobbers are redundant on x86 anyway.)

Jan

