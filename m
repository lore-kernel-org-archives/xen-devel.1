Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECB8CC6B08
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 14:27:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1447947.1663889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGdTH-0003re-EP; Tue, 13 Oct 2026 14:27:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1447947.1663889; Tue, 13 Oct 2026 14:27:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGdTH-0003rX-BJ; Tue, 13 Oct 2026 14:27:15 +0000
Received: by outflank-mailman (input) for mailman id 1447947;
 Tue, 13 Oct 2026 14:27:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGdTF-0003rQ-T0
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 14:27:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGdTF-0099Kh-9v
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 16:27:13 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace3fbd-e002-0a2a0a5209dd-0a2a450ce95a-16
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 16:27:13 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace3fc0-f479-0a2a450c0019-d155802fad2b-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 16:27:13 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4a16af2a232so24596145e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 07:27:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1a1feb78csm192807965e9.0.2026.10.13.07.27.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 07:27:11 -0700 (PDT)
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
        d=suse.com; s=google; t=1791901632; x=1792506432; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=akbDdWRD+d5yo/stLZ0cw5wRznLEdWpmoEQlhxtS5w4=;
        b=K3mvMbXoUgPO4+Rk3nfilZPIXPEmZfRwnfkxiUJg1GX22tFLXY3BTh1/XHzJmHd2Lc
         3L8fq3kL5XxDaV4oY/ja5XgzVlEFjmKrqkX9qVw071kb92kUocmCr43tX9cynjKFTvDd
         wxTj7vackTGkrIDmUgTZCk2LeHZNFxLcx2kjgK3PB5I19OsSNmfTwNts5LF2h1DGAH2a
         /komayehikDDFGWBpF8k1x62x++/Lnfwyg2C3/Rznj/dRNn08+MXHYfELAtf7dJ7UW7J
         mYigF5SxjzXmdou54zNQ7ebZJN0qFuqNcQnQlZSB4fOyHtsai7Y+y+v0VKrJB8/KFnp9
         JVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791901632; x=1792506432;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=akbDdWRD+d5yo/stLZ0cw5wRznLEdWpmoEQlhxtS5w4=;
        b=Qmb3OiiN663Dm7BjnbHBZpZR8Qr38JU4LnGMHe2Q+IXGBIkAiaYKOoeSb+dGPrPpvS
         RN2FwrP5YVpOVC1k3VtfWapQIUGCsCHGM6r4mvOP1oPc2R0YJnnQ9JGCNbHrSAGHqok9
         RAgv/ZmA3G9OwPsH23KKAaitZQLqtxVZxXWiZjmfhwn9j74rdD9HaGTPREz7zIqAsAYQ
         J+rny9uUIgvnQ+M6TE2m586tll0AyauUbuo1IF3zfoR09BNw8S0NnWCYkPHb/wiO2XPP
         IZE6BqXaMVpxJpdWPiIk6t7eHRGz8byCOGBURi5UZvn4YkLZSSme5xLv/nxpHpM/rFWf
         ikSQ==
X-Forwarded-Encrypted: i=1; AKwUvBweLP+EkiCJ74zi1qS68n+ZiiP5Da3c44PZN35pXDK/gY1Jl/jstVlvHiv2p2Z80qPMu0MPYjBLlM0=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLUi+WpyHSbYsY+nsvUtFzULKcjOFyHOeQ2iWSGc/jE/Oa9sE2K
	1AsIsS3U+EWEXHHvbXUAAVpngVFru2AME6nEId3ZNzvTecGzJO+kaxW3rwwcbK67vg==
X-Gm-Gg: AYBFou1bpExwhcye6u9FafdqUi32zySCi+hjENcvGrzXsRUbNpwZAffENiBiEWGaY84
	GvB0La/conm3xoq7VdlKHBuF0g2rLITIOMdcADV9BPpTQDT5Mmg9oRVvU8HDBa4X+D2O/kMaM0V
	efmOpwZgy+lRLGHWZSpjLF+WgL8muo/ZpdneSEwnn4g30lngyGfYL1nB1ZltBFA5ZeMQg0uuugQ
	FgbT9qmm7dHT6K56EFzZbxtJpQCgh4jeEju8dx8BwjBncSitSWZKMXSUOZXz0qUqzOLdbuxmChe
	omH7CIV2HE4CztYztqknzJtFShCyYOF208DiAfTVf6HxWpPNOo2jaVufshCNIjF9kFrm2guYYaR
	Epvhi/2LNrsdXC/XZ4wXkvD/D3rOERYYlsyyipdzzwtVIG7NuhsUfxtPcwzxelxJa2m1lHT0jNR
	RaB1plSwopPPeCuWVTeHcv8lNlAGXmlZ70xwt0+/eJpqoEfGV2Yaw4kDFz8MfRDIqDD0/dqmh1R
	oXUd0B2pYNFHZnjZxy0IgifwtB60z3O1AD7+8l5SZes70i+bH3sCSZilHTj+Aaa
X-Received: by 2002:a05:600c:83c7:b0:4a1:698d:3044 with SMTP id 5b1f17b1804b1-4a18e493020mr249319875e9.11.1791901632356;
        Tue, 13 Oct 2026 07:27:12 -0700 (PDT)
Message-ID: <b06718df-5014-4883-8791-a79cadd4cea4@suse.com>
Date: Tue, 13 Oct 2026 16:27:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] x86/nSVM: Check injected event consistency
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, jason.andryuk@amd.com,
 teddy.astie@vates.tech, xen-devel@lists.xenproject.org
References: <5d6d418ef2c89c706e220d38f230a351d4266d66.1790779581.git.abdelkareem.abdelsaamad@citrix.com>
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
In-Reply-To: <5d6d418ef2c89c706e220d38f230a351d4266d66.1790779581.git.abdelkareem.abdelsaamad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1791901633-52331A5B-25A680F4/10/78276251493
X-purgate-type: spam
X-purgate-size: 3333

On 30.09.2026 17:50, Abdelkareem Abdelsaamad wrote:
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -2619,6 +2619,7 @@ void asmlinkage svm_vmexit_handler(void)
>  
>      if ( unlikely(exit_reason == VMEXIT_INVALID) )
>      {
> +        svm_vmcb_isvalid(__func__, vmcb, v, true);
>          gdprintk(XENLOG_ERR, "invalid VMCB state:\n");
>          svm_vmcb_dump(__func__, vmcb);
>          domain_crash(v->domain);

This is the kind of use that we're seeing for a function doing full
checking. The two pre-existing uses, otoh, are getting too expensive with
more checking added. Therefore what we (the x86 maintainers) think is
there needs to be a split: Only checks that need doing ahead of VMRUN
should be done there. All other checks should be done only for diagnostic
purposes after a failed VMRUN.

> --- a/xen/arch/x86/hvm/svm/vmcb.c
> +++ b/xen/arch/x86/hvm/svm/vmcb.c
> @@ -327,6 +327,70 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
>      svm_dump_sel("  TR", &vmcb->tr);
>  }
>  
> +static bool is_valid_injected_exception_vector(const struct vmcb_struct *vmcb,
> +                                               uint8_t vmcb_injected_vector,
> +                                               const struct vcpu *v)
> +{
> +    switch ( vmcb_injected_vector )
> +    {
> +    case X86_EXC_DE:
> +    case X86_EXC_DB:
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
> +    case X86_EXC_SX:
> +        return true;
> +
> +    /*
> +     * Exception vectors 3 and 4 may not be injected into SEV-ES guests.
> +     * If this is attempted, the VMRUN will fail with a VMEXIT_INVALID
> +     * error code.
> +     * See the APM Volume #2 15.35 Encrypted State (SEV-ES).
> +     */
> +    case X86_EXC_BP:
> +        return !vmcb_get_sev_es(vmcb);

For this it would, btw, be helpful if the testing table also had an
entry for #BP.

> +    /*
> +     * If the VMM attempts to inject an event that is impossible for the
> +     * guest mode (e.g., a #BR exception when the guest is in 64-bit mode),
> +     * the event injection will fail... VMRUN will immediately exit with
> +     * VMEXIT_INVALID.
> +     * See the APM Volume #2 15.20 Event Injection.
> +     */
> +    case X86_EXC_OF:
> +        if ( vmcb_get_sev_es(vmcb) )
> +            return false;
> +        fallthrough;
> +    case X86_EXC_BR:
> +        return !(vmcb_get_efer(vmcb) & EFER_LMA) || !vmcb->cs.l;
> +
> +    case X86_EXC_CP:
> +    {
> +        unsigned long guest_valid_cr4 = hvm_cr4_guest_valid_bits(v->domain);
> +
> +        return guest_valid_cr4 & X86_CR4_CET;
> +    }

As said before - this wants to check the live CR4 value of the guest, not
what it may in principle enable there. While it looks like Andrew doesn't
fully agree with me here (because that's not how hardware behaves), I can
only point out that the way he wants it (deriving from the raw policy), it
would result in behavior changing for a guest migrating from a Naples host
to a Genoa one.

Jan

