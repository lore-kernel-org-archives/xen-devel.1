Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05ABC53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 15:01:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374779.1621978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wojIe-0000cZ-1J; Tue, 28 Jul 2026 15:00:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374779.1621978; Tue, 28 Jul 2026 15:00:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wojId-0000cS-U1; Tue, 28 Jul 2026 15:00:55 +0000
Received: by outflank-mailman (input) for mailman id 1374779;
 Tue, 28 Jul 2026 15:00:54 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wojIc-0000cI-GD
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:00:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wojIb-003BtE-T9
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 17:00:53 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68c423-e002-0a2a0a5209dd-0a2a4508c94a-18
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 17:00:53 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68c41e-f659-0a2a45080019-d155dd29ecca-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 17:00:46 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-476a130c138so3840792f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 08:00:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85bb5127sm55508190f8f.10.2026.07.28.08.00.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 08:00:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1785250846; x=1785855646; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wPQQkSUXoLyxyOGvFk8p9mPWtMRW8n0qcRhV4Jq23B4=;
        b=ARGSROgSu0kh0Kur85EV0MSnper2RW8/Uy2tbtU+/qyqwoEPuy8qEGFGs/wfKG9iax
         m419FZGQf3At9DDKvFZBgGb6siQjf+TY+/KUdI89kRtmvN8if0y8LWoyCGS9BuHfQPv+
         5sOeYg1vN8lJbRJlshS4vgHMWrMIoSLB1xDEoyjtoeeN/8HwHoYg+EqtuOagMjwQdJCY
         OM2EFx7FAFhYZZZhiiEGpWUDzorW5itE1delNqRYiCo+EjcPI5v41vXNJ6TC0s7nrihm
         VESQONtCJSpvnd8tKI2AR6yGgtEURuqwabuGdpfvr81pKGKdx6cIbtPaDaK58mfzAEWr
         mjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785250846; x=1785855646;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wPQQkSUXoLyxyOGvFk8p9mPWtMRW8n0qcRhV4Jq23B4=;
        b=S2dD++B5R3I9qmPCNbuXUzDZm93RnQjppb4e8YL49h640E65heyb5qpPPaprtUQWL+
         sEZGcG+Ob4nwJ+UzChOEjIxDj3L3G2CHChMMYFkK0/SwE5jBicwhwFJmFIsAU6bkIMaC
         7m8ddI8GWZoh3tRB8cY/cOyvXT+6r5NQ/XkgCaaHpXAeQxiue7y9voZq+zGTbv7rtG28
         cm+rriEr29lejqLtULnfm1dddoQDfDqfbHtHKX7Z71ueMFsNLSOAQhDuj8ErdmU19HUa
         xrG2kaJVkrr5liC60lKJl+YUW9XcTT24/TuVUQA/TtGYL2HAb7eeu6KL4MleDPpN30u+
         4rkg==
X-Forwarded-Encrypted: i=1; AHgh+Roblx+tYLKxigC+j0E4fOSJPxLg45i4W/fLJu5+IaJrcFih5+l5Kk0cM8QE70nvu7WWB8OzKMt/3MM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmtfXYXnHufIUGhfPgSDGvU4RzBo8YMUTi45gnznlcjr/41mSW
	HWavtUX7LOpZ4PyP3BjXLrCaAYIRJBRd4sORIMUxjqLu2jz46ISdfEm6mTQ7dpBzFA==
X-Gm-Gg: AR+sD13rHZJpJhpvq27Wu03IS0btYUuhOADfFwks8QvmK5Yq8rdMJihplz5DB+vlIWr
	swoI25mjYKLce2Vjzm4DOib2NbF8/oT4/1MuumuSogaa6Iz+46oCG8mS3PgLR8dYHSAE2TMiSHb
	q2DUCkMKHcZ82hWpCbZlIWRiXdUXZr5OFRgGbPPlVP4qB87uKCRqqGkhuPvzStEflS6YrWfJqYo
	2KGzhArRsHS+kmC0wDs9yRl0PTyQQqnKkDrI0HITpdvCNljblMEf5eRFwresugzHD+19ojliKMM
	yLqb8VMftYvdOrSy+0qRpLjA4ua9DJs1DbHnJ35ryrs4Z5hLVISzMg9abVL7zUhzpXTgsyGlAeg
	hppZ0xTiB9NXeMRW2ROJdRKUKtjwy8VS7+dUEfo2BEaBMBMBhtuQdXctrfNeNJkiqhPHlNtR1ix
	4tEKeTg+1ELRV3UAYJ0qF8jtM/MwBdFuff+Y8O4xsDpEcfA7exnNziF/vxrbnbHBuw+Q==
X-Received: by 2002:a05:6000:2284:b0:47f:6981:a043 with SMTP id ffacd0b85a97d-47fb1e96474mr3450757f8f.26.1785250845407;
        Tue, 28 Jul 2026 08:00:45 -0700 (PDT)
Message-ID: <6cacbf75-7dc2-4eee-9791-8d434446165a@suse.com>
Date: Tue, 28 Jul 2026 17:00:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] x86/nSVM: Check the L1 IOPM_BASE and MSRPM_BASE
 assigned physical addresses
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, teddy.astie@vates.tech,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <8f7c6601af60656025e5aeb0d2e8e1359d8c58f9.1785231704.git.abdelkareem.abdelsaamad@citrix.com>
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
In-Reply-To: <8f7c6601af60656025e5aeb0d2e8e1359d8c58f9.1785231704.git.abdelkareem.abdelsaamad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1785250846-D715E87B-F73ADE55/0/0
X-purgate-type: clean
X-purgate-size: 2008

On 28.07.2026 13:41, Abdelkareem Abdelsaamad wrote:
> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -18,6 +18,8 @@
>  
>  #define NSVM_ERROR_VVMCB        1
>  #define NSVM_ERROR_VMENTRY      2
> +#define IOPM_MAX_PAGES_DIFF     2
> +#define MSRPM_MAX_PAGES_DIFF    1

I see little value in these constants, the more that from their names alone
one cannot infer what they're meant to represent. Furthermore the difference
between the two checks you add makes clear that in the latter one you open-
code MSRPM_MAX_PAGES_DIFF being 1.

> @@ -282,7 +284,7 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
>      return 0;
>  }
>  
> -static int nsvm_vmrun_permissionmap(struct vcpu *v, bool viopm)
> +static int nsvm_vmrun_permissionmap(struct vcpu *v)
>  {
>      struct svm_vcpu *arch_svm = &v->arch.hvm.svm;
>      struct nestedsvm *svm = &vcpu_nestedsvm(v);
> @@ -295,6 +297,23 @@ static int nsvm_vmrun_permissionmap(struct vcpu *v, bool viopm)
>      unsigned long *ns_viomap;
>      bool ioport_80 = true, ioport_ed = true;
>  
> +    if ( (domain_get_maximum_gpfn(v->domain) < IOPM_MAX_PAGES_DIFF) ||

Leaving aside that it's questionable whether a domain with just two pages
can actually run sensibly, I think there's an off-by-one here, but I
further think the check isn't needed. After all ...

> +         (gfn_x(_gfn(ns_vmcb->_iopm_base_pa >> PAGE_SHIFT)) >

... the shift here guarantees that adding IOPM_MAX_PAGES_DIFF to the
result would not overflow (unless that constant was really huge).

Also please use gaddr_to_gfn() (or PFN_DOWN()) instead of open-coding.

> +          (domain_get_maximum_gpfn(v->domain) - IOPM_MAX_PAGES_DIFF)) )
> +    {
> +        gdprintk(XENLOG_ERR, "nsvm_vmrun_permissionmap invalid _iopm_base_pa"
> +                 " address (%#"PRIx64")\n", ns_vmcb->_iopm_base_pa);

When you want the function name in a log message, please use __func__.

Jan

