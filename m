Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2783A606A321
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 13:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YLrJVruC
Received: from list by lists.xenproject.org with outflank-mailman.1503512.1699233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWZlH-0000kN-3V; Thu, 26 Nov 2026 13:43:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503512.1699233; Thu, 26 Nov 2026 13:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWZlH-0000kG-0V; Thu, 26 Nov 2026 13:43:43 +0000
Received: by outflank-mailman (input) for mailman id 1503512;
 Thu, 26 Nov 2026 13:43:41 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWZlF-0000k2-ID
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 13:43:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWZlE-00GwKY-Um
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 14:43:40 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b083782-e002-0a2a0a5209dd-0a2a450894a6-34
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 14:43:40 +0100
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b08378c-f659-0a2a45080019-d1558029f009-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 14:43:40 +0100
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4bba60271d7so16587125e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 05:43:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884b8429sm946424735e9.14.2026.11.26.05.43.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2026 05:43:39 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795700620; x=1796305420; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bHRzHFUne6OkcJ5hvkXS0GUhMmnf+q3JcrcGmh20Ex0=;
        b=YLrJVruC3n4YTjvWBSW5xX5d6IJSJQldZ9braV4PCXVg6bVfrZ20vdtYhmIw/hHPAY
         /F1NCHi6s8vM3pEo9ASVGMDmIAz4Q+h5MvuG+RNFjpiORk6hTE0NEWbNbA2ZqqVcR6lH
         f069tyOMi6xBt39+BXX1f2vAwC+M+0mYcPSBt1+xESTgFtfzgjJ+92VBXKbo6iZoxE1n
         EQgB3/SmQ1/WInUlkRHTiStJIHoEK+ARDa9e/kw/o7OLaYB3fpVKSwNq3RlTFZ88FST/
         VZX+J/FrjkM3Ml+ckHael/8QKLNhZFclckyu0jpuM6yUSZaCf6JYn7oUHYN8Z7zYek0c
         3LMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795700620; x=1796305420;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bHRzHFUne6OkcJ5hvkXS0GUhMmnf+q3JcrcGmh20Ex0=;
        b=XRhAkTVB07zNpNleoJ7GnS1c6oKoEnWDUKJkYQ6Hl4shllWODFjl1kTnADvGQ96BH1
         jw2eScjSZmqmB66UqXTpWtE2CnuOjYGQXdL0W6GlRHSdMOZpCO6LzKH9yvSU8yuWIbgW
         l99UQRUNX/Z7hpFUCtzRpzoS9SkkQp/k4BMaxMquIJFY5V8GYgr04UF7vmSx2HXv4Lcd
         dbH/SDKHNnCeDnCLFUlTCUk3aA/cIgpLdPozu1jzrH9c4qpj2whB57S/zAnDBbT3lo/6
         EDzaUx8qVybP3m/EhRjuI+n94iXCHezOFAkXBR161mw4OtGVxQS3lDMPfC/S9yeS7Fqz
         Nsvw==
X-Gm-Message-State: APuU4Z/MIHWwPEUnuYpCIW0GJkt1o8yD9b2wWMxMTiSdTJEXlnoyLtvw
	Zy/LQLSG8TEdH/IfjU23xBXEphR227J5k0cWDdYNREbmF9QTkwJIDGKQ+d4F2SpVXNm8BMCKNcu
	luc847A==
X-Gm-Gg: AZFdTZcUdBnZUWrwD1pS9H0T2udz6R5PZTFQc8IMmfvMXuAOioHoO3aul75tcePuTr+
	fa+RgP0lPHTQ4XB50CHtH+wCNT1+UdA9J0ITjWjiULg37p8id04GAYtfeMJ/Zdy2YA/e8HfGSIe
	8F7EQx8EzAMsqbNRlN1ituaKWmeN/wR06B83frb9tBMrSRqbl71RGPT5ZbR+PXzH2Invxb2Vx3U
	8YYh+J80p9fAmvk8RvDl1cbGQSBtCfPFaeOkMZEz6PTNJ5n6ALdPzt/NhoPGJITFXZyworaIA5I
	kz188Ln/EdgOTJd45vMIGrCaHxT/W3ug2Ca2ITEm66K+0LehV4nJDs5T3/9C/NM3NnS2PO4CQ/l
	m0aAHlI/zuw1Z5de1Mty1ggwZJGUsGDIrchfMthD7YqoOtzFA0e8ructcWpsEPFGf7jct8cT/uv
	mbOKEN4NwGx+ONbPaDNCpH3un8fFDvJHZ7yvvYuulzdXFvseIVz8fCVDnKfOk2rKT4nrcZHDThB
	5URQ7DgwdpHWy//J5S5mip6a4/K4h3n1BOSF38kjMR6jQF+d2aQ142LR1pgoX+uyOibHpszYd6a
	IosKc01IopgSFj0D7u7ql4sU3KR7x0Si0LNoa0TZ4vuNGaJRuRWJGEeH2feycFy4ceZdVLCK84A
	jEMhuTsivFTwnNFeY
X-Received: by 2002:a05:600c:6219:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4bb8880badfmr407226555e9.18.1795700620235;
        Thu, 26 Nov 2026 05:43:40 -0800 (PST)
Message-ID: <b019b766-20d2-4512-ac6a-41ecf1184424@suse.com>
Date: Thu, 26 Nov 2026 14:43:39 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] x86/HVM: introduce hvm_load_vcpu_instance()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Paul Durrant <paul@xen.org>
References: <1ea6d02b-8fba-4b1e-969c-033d6a7be233@suse.com>
 <d8b8908d-3491-4be4-b661-859a78e6dfe6@suse.com>
Content-Language: en-US
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
In-Reply-To: <d8b8908d-3491-4be4-b661-859a78e6dfe6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1795700620-D4B7187B-C003D031/10/78276251493
X-purgate-type: spam
X-purgate-size: 12905
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26.11.2026 14:41, Jan Beulich wrote:
> Use this to remove open-coding of domain_vcpu().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> lapic_load_{hidden,regs}() are left alone, as I fear analysis tools would
> otherwise pick on the missing NULL checks.

I'm sorry, I should have Cc-ed Paul as well.

Jan

> --- a/xen/arch/x86/cpu/mcheck/vmce.c
> +++ b/xen/arch/x86/cpu/mcheck/vmce.c
> @@ -364,15 +364,14 @@ static int cf_check vmce_save_vcpu_ctxt(
>  
>  static int cf_check vmce_load_vcpu_ctxt(struct domain *d, hvm_domain_context_t *h)
>  {
> -    unsigned int vcpuid = hvm_load_instance(h);
> -    struct vcpu *v;
> +    struct vcpu *v = hvm_load_vcpu_instance(d, h);
>      struct hvm_vmce_vcpu ctxt;
>      int err;
>  
> -    if ( vcpuid >= d->max_vcpus || (v = d->vcpu[vcpuid]) == NULL )
> +    if ( !v )
>      {
>          dprintk(XENLOG_G_ERR, "HVM restore: dom%d has no vcpu%u\n",
> -                d->domain_id, vcpuid);
> +                d->domain_id, hvm_load_instance(h));
>          err = -EINVAL;
>      }
>      else
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -804,14 +804,13 @@ static int cf_check hvm_save_tsc_adjust(
>  
>  static int cf_check hvm_load_tsc_adjust(struct domain *d, hvm_domain_context_t *h)
>  {
> -    unsigned int vcpuid = hvm_load_instance(h);
> -    struct vcpu *v;
> +    struct vcpu *v = hvm_load_vcpu_instance(d, h);
>      struct hvm_tsc_adjust ctxt;
>  
> -    if ( vcpuid >= d->max_vcpus || (v = d->vcpu[vcpuid]) == NULL )
> +    if ( !v )
>      {
>          dprintk(XENLOG_G_ERR, "HVM restore: dom%d has no vcpu%u\n",
> -                d->domain_id, vcpuid);
> +                d->domain_id, hvm_load_instance(h));
>          return -EINVAL;
>      }
>  
> @@ -1018,18 +1017,16 @@ unsigned long hvm_cr4_guest_valid_bits(c
>  static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
>  {
>      const struct cpu_policy *p = d->arch.cpu_policy;
> -    unsigned int vcpuid = hvm_load_instance(h);
> -    struct vcpu *v;
> +    struct vcpu *v = hvm_load_vcpu_instance(d, h);
>      struct hvm_hw_cpu ctxt;
>      struct segment_register seg;
>      const char *errstr;
>      unsigned long valid;
>  
> -    /* Which vcpu is this? */
> -    if ( vcpuid >= d->max_vcpus || (v = d->vcpu[vcpuid]) == NULL )
> +    if ( !v )
>      {
>          dprintk(XENLOG_G_ERR, "HVM restore: dom%u has no vcpu%u\n",
> -                d->domain_id, vcpuid);
> +                d->domain_id, hvm_load_instance(h));
>          return -EINVAL;
>      }
>  
> @@ -1267,19 +1264,17 @@ CHECK_FIELD_(struct, xsave_hdr, reserved
>  static int cf_check hvm_load_cpu_xsave_states(
>      struct domain *d, hvm_domain_context_t *h)
>  {
> -    unsigned int vcpuid, size;
> +    unsigned int size;
>      int err;
> -    struct vcpu *v;
> +    struct vcpu *v = hvm_load_vcpu_instance(d, h);
>      struct hvm_hw_cpu_xsave *ctxt;
>      const struct hvm_save_descriptor *desc;
>      unsigned int i, desc_start, desc_length;
>  
> -    /* Which vcpu is this? */
> -    vcpuid = hvm_load_instance(h);
> -    if ( vcpuid >= d->max_vcpus || (v = d->vcpu[vcpuid]) == NULL )
> +    if ( !v )
>      {
>          dprintk(XENLOG_G_ERR, "HVM restore: dom%d has no vcpu%u\n",
> -                d->domain_id, vcpuid);
> +                d->domain_id, hvm_load_instance(h));
>          return -EINVAL;
>      }
>  
> @@ -1298,14 +1293,14 @@ static int cf_check hvm_load_cpu_xsave_s
>      {
>          printk(XENLOG_G_WARNING
>                 "HVM%d.%d restore: not enough data left to read xsave descriptor\n",
> -               d->domain_id, vcpuid);
> +               d->domain_id, v->vcpu_id);
>          return -ENODATA;
>      }
>      if ( desc->length + sizeof (*desc) > h->size - h->cur)
>      {
>          printk(XENLOG_G_WARNING
>                 "HVM%d.%d restore: not enough data left to read %u xsave bytes\n",
> -               d->domain_id, vcpuid, desc->length);
> +               d->domain_id, v->vcpu_id, desc->length);
>          return -ENODATA;
>      }
>      if ( desc->length < offsetof(struct hvm_hw_cpu_xsave, save_area) +
> @@ -1313,7 +1308,7 @@ static int cf_check hvm_load_cpu_xsave_s
>      {
>          printk(XENLOG_G_WARNING
>                 "HVM%d.%d restore mismatch: xsave length %u < %zu\n",
> -               d->domain_id, vcpuid, desc->length,
> +               d->domain_id, v->vcpu_id, desc->length,
>                 offsetof(struct hvm_hw_cpu_xsave,
>                          save_area) + XSTATE_AREA_MIN_SIZE);
>          return -EINVAL;
> @@ -1331,7 +1326,7 @@ static int cf_check hvm_load_cpu_xsave_s
>          printk(XENLOG_G_WARNING
>                 "HVM%d.%d restore: inconsistent xsave state (feat=%#"PRIx64
>                 " accum=%#"PRIx64" xcr0=%#"PRIx64" bv=%#"PRIx64" err=%d)\n",
> -               d->domain_id, vcpuid, ctxt->xfeature_mask, ctxt->xcr0_accum,
> +               d->domain_id, v->vcpu_id, ctxt->xfeature_mask, ctxt->xcr0_accum,
>                 ctxt->xcr0, ctxt->save_area.xsave_hdr.xstate_bv, err);
>          return err;
>      }
> @@ -1350,13 +1345,13 @@ static int cf_check hvm_load_cpu_xsave_s
>              {
>                  printk(XENLOG_G_WARNING
>                         "HVM%d.%u restore mismatch: xsave length %#x > %#x (non-zero data at %#x)\n",
> -                       d->domain_id, vcpuid, desc->length, size, i);
> +                       d->domain_id, v->vcpu_id, desc->length, size, i);
>                  return -EOPNOTSUPP;
>              }
>          }
>          printk(XENLOG_G_WARNING
>                 "HVM%d.%u restore mismatch: xsave length %#x > %#x\n",
> -               d->domain_id, vcpuid, desc->length, size);
> +               d->domain_id, v->vcpu_id, desc->length, size);
>          /* Rewind desc_length to ignore the extraneous zeros. */
>          desc_length = size;
>      }
> @@ -1365,14 +1360,14 @@ static int cf_check hvm_load_cpu_xsave_s
>      {
>          printk(XENLOG_G_WARNING
>                 "HVM%d.%u restore: compressed xsave state not supported\n",
> -               d->domain_id, vcpuid);
> +               d->domain_id, v->vcpu_id);
>          return -EOPNOTSUPP;
>      }
>      else if ( desc_length != size )
>      {
>          printk(XENLOG_G_WARNING
>                 "HVM%d.%u restore mismatch: xsave length %#x != %#x\n",
> -               d->domain_id, vcpuid, desc_length, size);
> +               d->domain_id, v->vcpu_id, desc_length, size);
>          return -EINVAL;
>      }
>      /* Checking finished */
> @@ -1481,15 +1476,15 @@ static int cf_check hvm_save_cpu_msrs(st
>  
>  static int cf_check hvm_load_cpu_msrs(struct domain *d, hvm_domain_context_t *h)
>  {
> -    unsigned int i, vcpuid = hvm_load_instance(h);
> -    struct vcpu *v;
> +    unsigned int i;
> +    struct vcpu *v = hvm_load_vcpu_instance(d, h);
>      const struct hvm_save_descriptor *desc;
>      struct hvm_msr *ctxt;
>  
> -    if ( vcpuid >= d->max_vcpus || (v = d->vcpu[vcpuid]) == NULL )
> +    if ( !v )
>      {
>          dprintk(XENLOG_G_ERR, "HVM restore: dom%d has no vcpu%u\n",
> -                d->domain_id, vcpuid);
> +                d->domain_id, hvm_load_instance(h));
>          return -EINVAL;
>      }
>  
> @@ -1499,21 +1494,21 @@ static int cf_check hvm_load_cpu_msrs(st
>      {
>          printk(XENLOG_G_WARNING
>                 "HVM%d.%d restore: not enough data left to read MSR descriptor\n",
> -               d->domain_id, vcpuid);
> +               d->domain_id, v->vcpu_id);
>          return -ENODATA;
>      }
>      if ( desc->length + sizeof (*desc) > h->size - h->cur)
>      {
>          printk(XENLOG_G_WARNING
>                 "HVM%d.%d restore: not enough data left to read %u MSR bytes\n",
> -               d->domain_id, vcpuid, desc->length);
> +               d->domain_id, v->vcpu_id, desc->length);
>          return -ENODATA;
>      }
>      if ( desc->length < HVM_CPU_MSR_SIZE(1) )
>      {
>          printk(XENLOG_G_WARNING
>                 "HVM%d.%d restore mismatch: MSR length %u < %zu\n",
> -               d->domain_id, vcpuid, desc->length, HVM_CPU_MSR_SIZE(1));
> +               d->domain_id, v->vcpu_id, desc->length, HVM_CPU_MSR_SIZE(1));
>          return -EINVAL;
>      }
>  
> @@ -1525,7 +1520,7 @@ static int cf_check hvm_load_cpu_msrs(st
>      {
>          printk(XENLOG_G_WARNING
>                 "HVM%d.%d restore mismatch: MSR length %u != %zu\n",
> -               d->domain_id, vcpuid, desc->length,
> +               d->domain_id, v->vcpu_id, desc->length,
>                 HVM_CPU_MSR_SIZE(ctxt->count));
>          return -EOPNOTSUPP;
>      }
> --- a/xen/arch/x86/hvm/mtrr.c
> +++ b/xen/arch/x86/hvm/mtrr.c
> @@ -735,15 +735,15 @@ static int cf_check hvm_save_mtrr_msr(st
>  
>  static int cf_check hvm_load_mtrr_msr(struct domain *d, hvm_domain_context_t *h)
>  {
> -    unsigned int vcpuid = hvm_load_instance(h), i;
> -    struct vcpu *v = domain_vcpu(d, vcpuid);
> +    unsigned int i;
> +    struct vcpu *v = hvm_load_vcpu_instance(d, h);
>      struct mtrr_state *m;
>      struct hvm_hw_mtrr hw_mtrr;
>  
>      if ( !v )
>      {
>          dprintk(XENLOG_G_ERR, "HVM restore: dom%d has no vcpu%u\n",
> -                d->domain_id, vcpuid);
> +                d->domain_id, hvm_load_instance(h));
>          return -EINVAL;
>      }
>  
> --- a/xen/arch/x86/hvm/viridian/viridian.c
> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> @@ -1152,14 +1152,13 @@ static int cf_check viridian_save_vcpu_c
>  static int cf_check viridian_load_vcpu_ctxt(
>      struct domain *d, hvm_domain_context_t *h)
>  {
> -    unsigned int vcpuid = hvm_load_instance(h);
> -    struct vcpu *v;
> +    struct vcpu *v = hvm_load_vcpu_instance(d, h);
>      struct hvm_viridian_vcpu_context ctxt;
>  
> -    if ( vcpuid >= d->max_vcpus || (v = d->vcpu[vcpuid]) == NULL )
> +    if ( !v )
>      {
>          dprintk(XENLOG_G_ERR, "HVM restore: dom%d has no vcpu%u\n",
> -                d->domain_id, vcpuid);
> +                d->domain_id, hvm_load_instance(h));
>          return -EINVAL;
>      }
>  
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -1577,16 +1577,17 @@ static void lapic_load_fixup(struct vlap
>  }
>  
>  
> -static int lapic_check_common(const struct domain *d, unsigned int vcpuid)
> +static int lapic_check_common(const struct domain *d,
> +                              const hvm_domain_context_t *h)
>  {
>      if ( !has_vlapic(d) )
>          return -ENODEV;
>  
>      /* Which vlapic to load? */
> -    if ( !domain_vcpu(d, vcpuid) )
> +    if ( !hvm_load_vcpu_instance(d, h) )
>      {
>          dprintk(XENLOG_G_ERR, "HVM restore: dom%d has no vCPU %u\n",
> -                d->domain_id, vcpuid);
> +                d->domain_id, hvm_load_instance(h));
>          return -EINVAL;
>      }
>  
> @@ -1596,9 +1597,8 @@ static int lapic_check_common(const stru
>  static int cf_check lapic_check_hidden(const struct domain *d,
>                                         hvm_domain_context_t *h)
>  {
> -    unsigned int vcpuid = hvm_load_instance(h);
>      struct hvm_hw_lapic s;
> -    int rc = lapic_check_common(d, vcpuid);
> +    int rc = lapic_check_common(d, h);
>  
>      if ( rc )
>          return rc;
> @@ -1638,10 +1638,9 @@ static int cf_check lapic_load_hidden(st
>  static int cf_check lapic_check_regs(const struct domain *d,
>                                       hvm_domain_context_t *h)
>  {
> -    unsigned int vcpuid = hvm_load_instance(h);
>      int rc;
>  
> -    if ( (rc = lapic_check_common(d, vcpuid)) )
> +    if ( (rc = lapic_check_common(d, h)) )
>          return rc;
>  
>      if ( !hvm_get_entry(LAPIC_REGS, h) )
> --- a/xen/arch/x86/include/asm/hvm/save.h
> +++ b/xen/arch/x86/include/asm/hvm/save.h
> @@ -6,8 +6,8 @@
>  #ifndef __XEN_HVM_SAVE_H__
>  #define __XEN_HVM_SAVE_H__
>  
> -#include <xen/types.h>
>  #include <xen/init.h>
> +#include <xen/sched.h>
>  #include <public/xen.h>
>  #include <public/hvm/save.h>
>  
> @@ -97,6 +97,13 @@ static inline unsigned int hvm_load_inst
>      return d->instance;
>  }
>  
> +/* Unmarshalling: Wrapper around the above for per-vCPU instances. */
> +static inline struct vcpu *hvm_load_vcpu_instance(
> +    const struct domain *d, const struct hvm_domain_context *h)
> +{
> +    return domain_vcpu(d, hvm_load_instance(h));
> +}
> +
>  /* Handler types for different types of save-file entry. 
>   * The save handler may save multiple instances of a type into the buffer;
>   * the load handler will be called once for each instance found when
> 


