Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1433EC5DF70
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 09:23:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393810.1632631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwG2O-0003Zp-7t; Tue, 18 Aug 2026 09:23:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393810.1632631; Tue, 18 Aug 2026 09:23:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwG2O-0003Zh-47; Tue, 18 Aug 2026 09:23:16 +0000
Received: by outflank-mailman (input) for mailman id 1393810;
 Tue, 18 Aug 2026 09:23:14 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwG2M-0003Zb-Oj
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 09:23:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwG2L-00Ci9J-36
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 11:23:13 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a842480-2eae-0a2a0a5409dd-0a2a4504ce44-0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 11:23:12 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a842480-b57f-0a2a45040019-d155dd30c582-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 11:23:12 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-47fe2d179e2so2881779f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 02:23:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5b81715sm10625068f8f.35.2026.08.18.02.23.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 02:23:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1787044992; x=1787649792; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v0JjEXAniUWY5CBuYEhmSYBUVuaMTMa/XL2l8ATqYpU=;
        b=IA6p75qoEdAPznIzpBG6U0Wxf1HPd9TuwE+6ReiQzv3A4IDud29pHzokQ/E9bucz+f
         ccrPSX8nX+GiSqDdZIxwpsWCGOlD5zTAcHqlmnwA0CqKavsE5fGycbDp3Tb4CN35HGZ8
         m3QcmSPJNqkwAxBBFtQxy2vG8aRMi3COEpsVkvhDQhj4X80y91TaDVkoedcyZr7rdjUI
         wUhplAfy8/Nrkt7JP8AxvwW6fQPt4o3zTN3Bz1MhyjBn1dv54MUSLNisizZ9T0z+pYOt
         UtLt1Tm2kndzpcuRXdIZqKAceX08O+CJBo1f+7k2+BFPFj9Jmd2LaS++KPaY80+AElmV
         6fUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787044992; x=1787649792;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v0JjEXAniUWY5CBuYEhmSYBUVuaMTMa/XL2l8ATqYpU=;
        b=XMf7cWtiTVrOK48oLwyX1wSZ88bUUGhxOqu/SqV3KlmyQScoNlUtgTPPknkrIpx1ws
         yRO2NJME8yk0L/WaE9fd6WQ8ZjqyrzjgqKuLvMtFK2+x32RSkEr1TRGScgNThXb1FkIP
         Bn/OJk2HAa8ko3oqY/kpaRdY2IEeX9jv1KTjmIfYG+HX+OEdQUuxjBUcXRjD8LNBpyTL
         lM5Xq0/ROsZolJZIqBcZvpQHs2iIjsJHFUeKOUxmg2Aj7Ekhb95MV3MCuAkAQe7Y0zLg
         ZGHTYLsGtsKTL+35t3PgAVe4L6sJz22PO143do1f3GL0Bo5gl+BfxRf8ErWxcSPKe+jM
         lMcg==
X-Forwarded-Encrypted: i=1; AHgh+Rpiqsi3wfDwlKVPFldo1j9nsdwCtZ8VL/J7P9xB7Yg3QUPxiiQhKaUCLpzMuzRNe8Fx1JtkxRXLII4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAHsP6UJrsUU+0ud2q5cMOBKk8f7PoI856U5Ckv9gAQzX4W0Qj
	ZNcr76mI7242zrvAnqCU6VFAEO1ZJFaJlYO5MHoUIEyswdvL9WbXMyBu9Zhc1YxUSA==
X-Gm-Gg: AR+sD12P2KdlV+Yn6VoMy3EXKZt4lFkYxF3kb0LG+s0dcesSfknv2F25ghUzzilyphH
	Idkcfv+2T9lwb7B9MmGaVDMjVICfCqbEaz5sC0/gWkaxeL2KWQmNAh0T3k01r8+tzIWJ2dpu5Y5
	Kjd5G3KU16NobzKVTC94mWG8AcfF0xNHTSNqT8HKlyoTqQ7vs53CT2mcUFLPqIOogt3BGekdcHJ
	9aY7CvHw9hOgivmlc4SzRXvYZOS5nhnovp0gxOtk0kGsF7D06GFtjKbmXr9YmH8jpKyJ1rhg4MY
	C/42K7t6E5WK5IFesKVknRzgRKXFXpa7nhZ1wej8SFVc/T9o7nvwnsXVRfpAp17Cq+BNz1R2VNZ
	Qdtk3JeAYgQ0hYjA4dkO4/fW2mt375GdLb5e+lw/DKJinIKwe8lKoCGpnZnGwR42mEEsv9mcRRG
	B/1cu8GVPlHA2LbZRWV/Y7tO/J/qUqygKW/ZtQfLTJ/rDjMP3Jixipk2yuZ+S6g20mSGlLtlBAl
	HaWhQi1gnZOos1tVTBH7oAcGHemTbXLMEToN8GwFkveWgxHOtyfKTEWMasbR7c=
X-Received: by 2002:adf:e002:0:10b0:482:a610:7a27 with SMTP id ffacd0b85a97d-482a6107a55mr12434569f8f.20.1787044992325;
        Tue, 18 Aug 2026 02:23:12 -0700 (PDT)
Message-ID: <e6f35ea6-77e2-481a-b695-421087e60edf@suse.com>
Date: Tue, 18 Aug 2026 11:23:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] x86/nSVM: Validate the L1 IOPM physical address range
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, jason.andryuk@amd.com,
 teddy.astie@vates.tech, xen-devel@lists.xenproject.org
References: <8302fc9800d6d5ffe8341ccf1a5f8cc0ee19540c.1786984508.git.abdelkareem.abdelsaamad@citrix.com>
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
In-Reply-To: <8302fc9800d6d5ffe8341ccf1a5f8cc0ee19540c.1786984508.git.abdelkareem.abdelsaamad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1787044992-C06DAB50-276A1BFE/0/0
X-purgate-type: clean
X-purgate-size: 1668

On 17.08.2026 18:59, Abdelkareem Abdelsaamad wrote:
> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -282,7 +282,7 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
>      return 0;
>  }
>  
> -static int nsvm_vmrun_permissionmap(struct vcpu *v, bool viopm)
> +static int nsvm_vmrun_permissionmap(struct vcpu *v)
>  {
>      struct svm_vcpu *arch_svm = &v->arch.hvm.svm;
>      struct nestedsvm *svm = &vcpu_nestedsvm(v);
> @@ -294,6 +294,17 @@ static int nsvm_vmrun_permissionmap(struct vcpu *v, bool viopm)
>      enum hvm_translation_result ret;
>      unsigned long *ns_viomap;
>      bool ioport_80 = true, ioport_ed = true;
> +    /* IOPM is structured as a linear array of 64K+3 bits. */
> +    const unsigned long nr_iopm_additional_pages = PFN_DOWN((0x10000 + 8) / 8 - 1);

Hm, the expression I did suggest was indeed off by one, yet yours doesn't fit
the comment very well. What's wrong with PFN_DOWN((0x10000 + 3) / 8) or
PFN_DOWN((0xffff + 4) / 8)?

> +    gfn_t ns_iopm_end =
> +        gfn_add(gaddr_to_gfn(ns_vmcb->_iopm_base_pa), nr_iopm_additional_pages);

I'm also inclined to suggest to drop the local variable, as it's used just
here. The overall result would be

    /* IOPM is structured as a linear array of 64K+3 bits. */
    gfn_t ns_iopm_end = gfn_add(gaddr_to_gfn(ns_vmcb->_iopm_base_pa),
                                PFN_DOWN((0x10000 + 3) / 8));

which imo is a little easier to follow. Preferably with those adjustments
(happy to carry out while committing, but please confirm):
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

