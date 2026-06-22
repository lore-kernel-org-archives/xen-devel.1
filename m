Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EF6CDB46F
	for <xen-devel@archiver.kernel.org>; Mon, 22 Jun 2026 14:09:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1343773.1602992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbfL9-0006V9-Ih; Mon, 22 Jun 2026 14:09:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343773.1602992; Mon, 22 Jun 2026 14:09:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbfL9-0006V2-Fx; Mon, 22 Jun 2026 14:09:31 +0000
Received: by outflank-mailman (input) for mailman id 1343773;
 Mon, 22 Jun 2026 14:09:31 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wbfL8-0006Uw-Tb
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 14:09:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbfL7-006Taa-LW
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 16:09:29 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a394206-2eae-0a2a0a5409dd-0a2a4503ab76-30
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 16:09:29 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a394219-a3da-0a2a45030019-d155802ac5f7-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 16:09:29 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4924593f45dso27819925e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 07:09:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-466643f4d9csm26186938f8f.4.2026.06.22.07.09.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 07:09:28 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782137369; x=1782742169; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L5wudqbLmPCsUA9bwQ6Caev9uzWVXige1JHFPBDTClc=;
        b=dbWaerA1HqiGaAHuB8ptKp4ot3OfORcJkZVQ7cLgCxvOnwVNGWd1qfSY9sNoYvs3lz
         CWCfZAQSdiD9ebvxJnFRCag7hdunc0VWHfOPodoRnEIaYODG6wa7HYwmbC5MlkxpwuyL
         doEAI1Te6Pe+Ba3ITgNoIyQDnOgX8xWjo5ldbAILq/NM+69Ku50m+9cJusIfq5yMAQps
         eKXeKc0438MzrUadm66ZjPYA4jdnipxDUffX4uMjC2BiKvrO4tncsX5AccauhC0JNyeR
         XUGgplkOvlvshRg8DimJlxVNTa5VBgfgaIAGXPZSQMXRm6H3J1jFvrFHm3lyQcB8wQ2t
         lFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782137369; x=1782742169;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5wudqbLmPCsUA9bwQ6Caev9uzWVXige1JHFPBDTClc=;
        b=HzFTGN+Y90LrHNlUSFbzwk7EE45ZaFP8Wu0twNgoFTBAgHyN6uyCpkrRm/+Tlm8umt
         N1a6lNSpk614HiCIGaZdq53CVdU8fe4Zf2X4GA/nEQzsYI5A5ncXDQY2VsP5DunpbhG2
         KNjtZ+FRPl8IOaHCk97oMzvFPSII0ZAHDRrFSyHNEuy4WXoJnAEK7jPKIctg7I78n9NX
         aaM8XW/VeRtSRG45CqBFwH+nOf1qL0seP1hd/R4cvY6JfBkoibUePsr0yAZvEnSnAN9B
         42sxOwTO2TGBKTqXCRfKhPBBu1xxuw82n3qws7LkPVAIqm3yc9tIhBbyxRkG1JibVKLs
         JJYQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Q2fk3dZnCRAZrl18e/81p33vVBMsWqlfMC3PU9wM+S/1tH1g91zXMy0kTT8OXRINPIlOPep9eKNs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzhubMo1t6yeclx0KEif7VoVtPWBJ56I8hBnztdHXDja8pd/3yn
	vMnPTLdUvrX2zkwe7WZRNZf+P3V4bC2GXIL1rsqkvjVR843T7lXsDCroUoOy9tX6hA==
X-Gm-Gg: AfdE7clbM5tbDWhOoSSvER8rzelTxNzLW7RxIzJ+7mWIeVypa5Qfs7ifVce3eChQD8m
	Ib4QawueByRWezI+am0eGSPku0Z9En1OFe8U4pIEKxcSXQ1b3GvJohXqITzl1ykNyRVYzQl1a+9
	FyMfk6Z0wmKQ8PkWK5C5fhDt88vEp6p+pH6xKUiOxteaLE5Nd1tm9tervBNR48rFBJj+YcKKRML
	LoN+jx6A7h+JuYcjYtC7g1khaxt1Vix4St6nafV/3CT/ZkjpJg3cNLtxdBQFkbn1Od6Wp5z+xrU
	Qa3uJVX1Ik0J/CnM+I9+Ns5ywtzTB09k48YovWtZq6BmsN6HbYtCE3NrMIIih84R3jXR9mkmors
	djLjaPEBxvM0UbMph+XxhBv/QZ2jeu2WGrVlmuue7793RO+L0/x4/MGdtzerr6PXyJmY2jHIkJt
	MSbFsbJRv1tnh8okm5IVZvJ/MCV8XrI5IsNg2NBwpIR43CmbfVxr/DorRrNDN6lJeZ5CLZoZp2O
	wYxgZqgPgO25i8=
X-Received: by 2002:a05:600c:6298:b0:48e:7854:1608 with SMTP id 5b1f17b1804b1-4923f5872d5mr258685175e9.25.1782137368940;
        Mon, 22 Jun 2026 07:09:28 -0700 (PDT)
Message-ID: <aa19d6b0-9407-423b-a786-a43a72b50df5@suse.com>
Date: Mon, 22 Jun 2026 16:09:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/23] xen/riscv: introduce guest riscv,isa string
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <3fb06376e057fa99b0df78e97761b8cff56ca9eb.1781693963.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <3fb06376e057fa99b0df78e97761b8cff56ca9eb.1781693963.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1782137369-661C5D84-F0BEE44E/0/0
X-purgate-type: clean
X-purgate-size: 1752

On 17.06.2026 13:17, Oleksii Kurochko wrote:
> Introduce generation of the riscv,isa string passed to the guest via the
> Device Tree riscv,isa property.
> 
> Introduce the per-domain isa string and guest isa bitmap, populated
> during domain creation by calling init_guest_isa().
> 
> Introduce guest_unsupp to filter out ISA extensions that should not be
> exposed to guests:
> 
> - f/d/q/v: FPU and vector context save/restore are not yet implemented
>   for guests.

I may have asked before - what about Zfinx, Zdinx (and the supposed Zqinx)?
They aren't in riscv_isa_ext[], yes, but perhaps wrongly so? And hence they
may want at least mentioning?

> @@ -480,6 +489,78 @@ bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
>      return test_bit(id, isa_bitmap);
>  }
>  
> +static int build_guest_isa_str(char *buf, size_t size,
> +                               const unsigned long *isa_bitmap)
> +{
> +    int total;
> +
> +#if defined(CONFIG_RISCV_32)
> +    total = snprintf(buf, size, "rv32");
> +#elif defined(CONFIG_RISCV_64)
> +    total = snprintf(buf, size, "rv64");
> +#else
> +#   error "Unsupported RISC-V bitness"
> +#endif
> +
> +    if ( total < 0 )
> +        return total;
> +
> +    for ( unsigned int i = 0; i < ARRAY_SIZE(riscv_isa_ext); i++ )
> +    {
> +        const struct riscv_isa_ext_data *ext = &riscv_isa_ext[i];
> +        int ret;
> +
> +        if ( !riscv_isa_extension_available(isa_bitmap, ext->id) )
> +            continue;
> +
> +        ret = snprintf(buf ? buf + total : NULL,
> +                       buf ? size - total : 0, "%s%s",

If total > size this subtraction will underflow and a huge value will be
passed to snprintf().

Jan

