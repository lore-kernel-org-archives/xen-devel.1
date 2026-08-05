Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2ABC56201
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 10:36:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383262.1626525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrYyu-0006GO-MG; Wed, 05 Aug 2026 10:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383262.1626525; Wed, 05 Aug 2026 10:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrYyu-0006GH-JM; Wed, 05 Aug 2026 10:36:16 +0000
Received: by outflank-mailman (input) for mailman id 1383262;
 Wed, 05 Aug 2026 10:36:15 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrYyt-0006GA-5d
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 10:36:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrYys-00BgL6-Ek
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 12:36:14 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a731210-5cb7-0a2a0a5109dd-0a2a4501c8c8-40
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 12:36:14 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a73121e-5984-0a2a45010019-d1558036e589-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 12:36:14 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4957eefd361so5911415e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 03:36:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4994dfe64e0sm78375335e9.6.2026.08.05.03.36.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 03:36:13 -0700 (PDT)
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
        d=suse.com; s=google; t=1785926174; x=1786530974; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cxgXNItvPHboV3BvDE9sEHj4kQfZuokLFmgUl2MM48c=;
        b=PTIw2ISP6anGSWdHxqsktqe9s+Apk04SNSgAhixjYnEzH1SfbJynFruxJxsKcSt5L2
         6ygWa2KUbpbCdePdB6TSse+jsWvLa0efYKQMiEXNQ4mVEKgcYVgsJr2SB3kLCE/G9nD7
         98xDvsB39jxSiGFDLi/PQXwQfkdPoSELnHLGU4NuJMDUosZRT5ndvWPkdzxMaKrYW56D
         JvrHbdXp+lz5q+STG4js623YN99obSe3PjdPzAi/qbPCMZEgYLixBrgjEJJ/2SbBD5VV
         K1cihG+GKjvKpz9j2gXl1v8ztOa5rFwntTMTu83Hrd68/VPOveVujJrjoFgu643f0tfd
         VzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785926174; x=1786530974;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cxgXNItvPHboV3BvDE9sEHj4kQfZuokLFmgUl2MM48c=;
        b=drQqmZOnGlFjjVQ1h/132pNlm1YT0cuG0HsWTD6BHTco0cKsJ+RoUU23FSRyi/9mSk
         9WdeZfxNRDwgeP/39nwADOJHQrV1x+0Qx/dfflzeWCH4NoXryRsjTp2GciCKvrQPfnaK
         T6SktSxLLUvrBafccIXg4wRJfIGONcfjDV6WN59Xf8KCAJsHppoXwIc47o4i9XGCxfPU
         b4GahYFJH4qdkhVnnmhPyQh+SbIWETW2LDFz+qSoJHPN+UHGkHfa0WTt20TpoobAF40s
         3EWbm3VRcuvEEyxML1whtax9v6cnHA3ABFejzulci6VC/geYy64FfSr8FnEnkxfhItlg
         tflA==
X-Forwarded-Encrypted: i=1; AHgh+RqGcfdOd+xg9XonUkHzhRMMR8ilwAsoLxYq4xZlCxv8BJ7C+RGil07gRRFeR8jF+6vFMHO0OX5FtSo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxhW+besQ8XKP+XaIRS96alWF07vCHqQfcrGOvJmaqQtnmw5pE+
	2SOztQxaJHgBzGjkwjjQ2l1d+MdwsUe5KNCByC35on0mkNr6jr8OEfC1Obw7SyElBw==
X-Gm-Gg: AR+sD10PWvyNBptxLntow9xQHo3qIUSccOE3ciOtdjyjlVGsbxN7HZENtIPOCpQY8rO
	4fS91wCzPHjll8svRotvqXTrNKSJ7WandCG8Qu7zXHQmlcXuh4tqy85s2XCHm6BMeSPbpD5YV0i
	OtGjdh3Te8pfef5n7mIldbTVPhWI/VbOneQ718l7vUxWF4s2NxzSbRfCvPnkSR8iGvOFiPVloJV
	t1MPMGb1dfpHxDGQ78DzGtUifIJrtlglLiDi7kmCdgXQ9NKJeNK0lBTNTkeQU4y2y+4rzO5H2cG
	Uc7VrCrv1MbcxpeBXmHMSsdPu9t/wHLmIXnedr3ELG+aQEng8vILdP0EH1DKjBKus3UNgkNvV+v
	Loeks8AHntEjnPl4yK8L/nIdan18MWJvPcxEQwIETTUTl7BVRVAQxx/eR9AhKwPzM/MACVloJyM
	UUJtouen8JzVFsMGnpjxJO5nkZgei2oeL5IRkVrLrC1ZTbbDxZoyuQy2fu7Iztq8nfvuw2ijkQw
	vixidO3C9IT0P25J9HY32mzI3B9/1JuKfTVWqvM1iH/TEI3vrhu
X-Received: by 2002:a05:600c:524a:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-4994e71d349mr54947375e9.7.1785926173790;
        Wed, 05 Aug 2026 03:36:13 -0700 (PDT)
Message-ID: <ff01adce-5807-4fda-becc-3290ad6deafc@suse.com>
Date: Wed, 5 Aug 2026 12:36:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/nSVM: Check the L1 IOPM_BASE and MSRPM_BASE
 assigned physical addresses
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, teddy.astie@vates.tech,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <966e58864089efbe30e9b900f09005fe13c74729.1785335079.git.abdelkareem.abdelsaamad@citrix.com>
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
In-Reply-To: <966e58864089efbe30e9b900f09005fe13c74729.1785335079.git.abdelkareem.abdelsaamad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1785926174-BF66C757-4FD77AB2/0/0
X-purgate-type: clean
X-purgate-size: 1487

On 29.07.2026 16:38, Abdelkareem Abdelsaamad wrote:
> @@ -294,6 +296,24 @@ static int nsvm_vmrun_permissionmap(struct vcpu *v, bool viopm)
>      enum hvm_translation_result ret;
>      unsigned long *ns_viomap;
>      bool ioport_80 = true, ioport_ed = true;
> +    gfn_t ns_iopm_end =
> +        gfn_add(gaddr_to_gfn(ns_vmcb->_iopm_base_pa), (IOPM_PAGES_COUNT - 1));
> +    gfn_t ns_msrpm_end =
> +        gfn_add(gaddr_to_gfn(ns_vmcb->_msrpm_base_pa), (MSRPM_PAGES_COUNT - 1));

Nit: Why the excess parentheses around the 2nd arguments each? Without them
the 2nd instance also more obviously stays within line length limits.

> +    if ( gfn_x(ns_iopm_end) > domain_get_maximum_gpfn(v->domain) )

I don't think using domain_get_maximum_gpfn() is correct here. Imo you want
to merely check against what the guest is told in CPUID. Everything else
ought to be properly covered by hvm_copy_from_guest_phys() /
hvm_map_guest_frame_ro() already. In fact for the MSR bitmap I thus can't
see why further checking would be needed. And for the I/O bitmap it looks
to be a matter of better error handling, rather than introducing extra
checking.

> +    {
> +        gdprintk(XENLOG_ERR, "%s invalid _iopm_base_pa address (%#"PRIx64")\n",
> +                 __func__, ns_vmcb->_iopm_base_pa);
> +        return 1;

Why literal 1? Yes, there is another such return in the function, but no, we
don't want to extend that. Aiui NSVM_ERROR_VVMCB is meant here.

Jan

