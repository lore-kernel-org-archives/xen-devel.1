Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7CECA5FA7
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 16:06:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436544.1655193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBaL9-000128-7L; Tue, 29 Sep 2026 16:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436544.1655193; Tue, 29 Sep 2026 16:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBaL9-000121-45; Tue, 29 Sep 2026 16:05:59 +0000
Received: by outflank-mailman (input) for mailman id 1436544;
 Tue, 29 Sep 2026 16:05:57 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBaL6-00011v-S3
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 16:05:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBaL4-008L7M-Du
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 18:05:54 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abbe1d9-2eae-0a2a0a5409dd-0a2a4508c9ac-42
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 18:05:54 +0200
Received: from [74.125.225.99] (helo=mail-wr2-f35.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abbe1e2-f659-0a2a45080019-4a7de163b33c-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 18:05:54 +0200
Received: by mail-wr2-f35.google.com with SMTP id
 ffacd0b85a97d-488811c9ebaso2145396f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 09:05:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48af507611csm4802153f8f.22.2026.09.29.09.05.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 09:05:52 -0700 (PDT)
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
        d=suse.com; s=google; t=1790697954; x=1791302754; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zoz79Othzq5e7Dwmsvd4G+vPBIzbDwGqtDrDA0f0b5U=;
        b=SQrecPHHaprlh2935oXKkxCJRR1r3+67+bNuL4gVyHJkpRNWofsR4QNCNC4EFSUp4o
         TXMWWHC+iVcIQsfJZvGIOYyvdYUn0d/OWBmc7FgaV7XUlSDdiIRQUL60NCJFOkA9owGy
         sPbkTkIuAq+1+zs7kiqmY48qwEFQrLtleqmtXi9c0mvL5jf/tAd98eEZN1ah9ndPSrXR
         juxFbV7+P9ZFh+GZBHCVettagGYzMjtbBhhqqoVE4XDJxG6JH+RvOCFi2wDw0rbRUFHg
         WQfaZCVTbaCWn/TZe1lZvKQzcFOQYqosJkh1UlNKPsK1P14g3h4NzNVsAqd1GPk4ZTUS
         Ilrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697954; x=1791302754;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zoz79Othzq5e7Dwmsvd4G+vPBIzbDwGqtDrDA0f0b5U=;
        b=xZqJmrq20qk8z1OLk+hTTdG3J3OWMIB+w1OwUxdVdxe2o9gtb8yqh+wpHawrMRRH/B
         yKJt/9PuUhtJ+5rboiyqcYNpVB0rnWd0fcjqkjeboGgKqwlQmJyzzqKXGjYe/JpBdBvI
         sg3Q9OrChhYpiLKBlZ5vwl5vUFmCFgSzyrnKp23viVUDZrfpU86AWAMU0k0YUOf/S/wh
         IXbqVBjg2LC2B+sRlOw2YAHD4tOLbiL7uQVn6FjfOlKd6z/jysSbHd2uejV+7oiFVKUz
         KeRN62ODJfsghGcaQ78WGLmAVlBlcwUnaK64BiRIM2rsAHXQzecI1SWXjWyDYv5PXTC+
         ovGA==
X-Forwarded-Encrypted: i=1; AKwUvBzfBL4yQOrGhBPPJbeWHED3zw44AO/DEykR12RkGvLczZ3TMzvP5LLozBIq/0F3XtltfBG64lgqInQ=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKY5PLIAhNJ7X8NJW451zX2PYaqB3cFESb32U0Fa6ZVWfgff6sM
	s8fh2uRnD4QtUrggQPPCiHPbXUAIVnfPvWT6ADswvF6vQ0CwZ3egIC8pT/2DUHL5nw==
X-Gm-Gg: AYBFou3bRHJxp14ewcy+RlavpTKFUIGcnnXHdzXIolcfdkAiZ+TwaIIeJVXThnAdx7U
	0K4a6sRCNM2M1a6UT5QcKa/1pyA7mK6Xo+F+9EM/oPgkhwJ2+24pWh9nRSywOHSAFuLT132pDZt
	w+YfQAHChyeAFPpHGENFOTpq/ycd9C7eGxw2hbMTK2apj+7qzsTLUzGMm/+2Ps46vgNZreVIha/
	9cKL4nEjKT0Ch89cV9m6qxneldFLbXNiTMDMo1Q2R5l0ldpQTBOjPY8N/gqJfBvw2od3QEtsGYs
	H77YfyjfHqvKVYeCiIAtFwzn0Uqf+b+tjy/V+FiF3QPjIsQ6rveZpD4uKQ5AgS8rgTBo+2FOpoF
	bRQ4UXU7wTPWf/2vprOytV2wlEizERycDtf/KPiJWBaLzwDFWnb3YZtIcVuncVgZqtwkpGNOg8+
	UhLE031IJrHUDgi2bALub3c4Qvo+zmv7q+59kHw+rYGsEov1fvwEgF/bm0H0w4Z+spPFV1v3CFc
	7XYPyTp9ldNR46Feylg+qxfGLYx90NbMnhGRCMW/s8+pfP3agiLlWgYA6RtczU=
X-Received: by 2002:a05:6000:490e:b0:488:8437:b8b7 with SMTP id ffacd0b85a97d-4888437bab3mr21714513f8f.7.1790697953583;
        Tue, 29 Sep 2026 09:05:53 -0700 (PDT)
Message-ID: <fa98bc43-afde-4696-9037-22961791c8ed@suse.com>
Date: Tue, 29 Sep 2026 18:05:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] x86/svm: Cleanup vintr_t type
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20260928140248.1543013-1-ross.lagerwall@citrix.com>
 <20260928140248.1543013-2-ross.lagerwall@citrix.com>
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
In-Reply-To: <20260928140248.1543013-2-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1790697954-CC77387B-F7D7BCDB/10/78276251493
X-purgate-type: spam
X-purgate-size: 4714

On 28.09.2026 16:02, Ross Lagerwall wrote:
> Rearrange the union to drop the .fields infix, rename bytes to the more
> common raw, adjust types where appropriate, and simplify some names.
> Adjust the users accordingly.
> 
> No functional change intended.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
>  xen/arch/x86/hvm/svm/intr.c      | 16 +++++++--------
>  xen/arch/x86/hvm/svm/nestedsvm.c | 32 ++++++++++++++---------------
>  xen/arch/x86/hvm/svm/svm.c       | 18 ++++++++--------
>  xen/arch/x86/hvm/svm/vmcb.c      |  6 +++---
>  xen/arch/x86/hvm/svm/vmcb.h      | 35 ++++++++++++++++----------------
>  5 files changed, 52 insertions(+), 55 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
> index 4b0debfa9a2e..883fde873e73 100644
> --- a/xen/arch/x86/hvm/svm/intr.c
> +++ b/xen/arch/x86/hvm/svm/intr.c
> @@ -33,9 +33,9 @@ static void svm_inject_nmi(struct vcpu *v)
>      u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
>      intinfo_t event;
>  
> -    if ( vmcb->_vintr.fields.vnmi_enable )
> +    if ( vmcb->_vintr.vnmi_en )
>      {
> -        vmcb->_vintr.fields.vnmi_pending = true;
> +        vmcb->_vintr.vnmi_pending = true;
>          return;
>      }
>  
> @@ -90,7 +90,7 @@ static void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
>               */
>              ASSERT(gvmcb != NULL);
>              intr = vmcb_get_vintr(gvmcb);
> -            if ( intr.fields.irq )
> +            if ( intr.irq )
>                  return;
>          }
>      }
> @@ -119,10 +119,10 @@ static void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
>          return;
>  
>      intr = vmcb_get_vintr(vmcb);
> -    intr.fields.irq     = 1;
> -    intr.fields.vector  = 0;
> -    intr.fields.prio    = intack.vector >> 4;
> -    intr.fields.ign_tpr = (intack.source != hvm_intsrc_lapic);
> +    intr.irq     = 1;

The field changes to bool - imo that means we ewant to use "true" here.

> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -442,7 +442,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
>      if ( !clean.tpr )
>      {
>          n2vmcb->_vintr = ns_vmcb->_vintr;
> -        n2vmcb->_vintr.fields.intr_masking = 1;
> +        n2vmcb->_vintr.intr_masking = 1;

Same here.

> @@ -652,7 +652,7 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
>      svm->ns_hap_enabled = vmcb_get_np(ns_vmcb);
>  
>      /* Remember the V_INTR_MASK in hostflags */
> -    svm->ns_hostflags.fields.vintrmask = !!ns_vmcb->_vintr.fields.intr_masking;
> +    svm->ns_hostflags.fields.vintrmask = !!ns_vmcb->_vintr.intr_masking;

No need for !! anymore?

> @@ -738,8 +738,8 @@ nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_user_regs *regs,
>      struct vmcb_struct *ns_vmcb;
>      struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
>  
> -    if ( vmcb->_vintr.fields.vgif_enable )
> -        vmcb->_vintr.fields.vgif = 0;
> +    if ( vmcb->_vintr.vgif_en )
> +        vmcb->_vintr.vgif = 0;

As per above, "false" here? (And I'll stop enumerating those cases here,
there are more further down.)

> --- a/xen/arch/x86/hvm/svm/vmcb.h
> +++ b/xen/arch/x86/hvm/svm/vmcb.h
> @@ -330,26 +330,25 @@ typedef union {
>  
>  typedef union
>  {
> -    u64 bytes;
>      struct
>      {
> -        u64 tpr:          8;
> -        u64 irq:          1;
> -        u64 vgif:         1;
> -        u64 :             1;
> -        u64 vnmi_pending: 1;
> -        u64 vnmi_blocking:1;
> -        u64 :             3;
> -        u64 prio:         4;
> -        u64 ign_tpr:      1;
> -        u64 rsvd1:        3;
> -        u64 intr_masking: 1;
> -        u64 vgif_enable:  1;
> -        u64 vnmi_enable:  1;
> -        u64 :             5;
> -        u64 vector:       8;
> -        u64 rsvd3:       24;
> -    } fields;
> +        uint8_t tpr;

While "unsigned int tpr:8" would be an option here, I don't mind the type
choice in this case.

> +        bool irq:1;
> +        bool vgif:1;
> +        bool :1;
> +        bool vnmi_pending:1;
> +        bool vnmi_blocking:1;
> +        uint8_t :3;
> +        uint8_t prio:4;

For these two (and two more below) I question it though: Why can't these
be unsigned int? There's no need to engage an extension here, is there?

> +        bool ign_tpr:1;
> +        uint8_t rsvd1:3;

Other reserved fields are unnamed. Can't this field's name also be dropped
as part of the tidying?

Jan

