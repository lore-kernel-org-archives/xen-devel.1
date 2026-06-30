Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80A0C43458
	for <xen-devel@archiver.kernel.org>; Tue, 30 Jun 2026 11:52:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1348764.1606454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weX0b-0000CJ-Bu; Tue, 30 Jun 2026 11:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348764.1606454; Tue, 30 Jun 2026 11:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weX0b-0000CC-8o; Tue, 30 Jun 2026 11:52:09 +0000
Received: by outflank-mailman (input) for mailman id 1348764;
 Tue, 30 Jun 2026 11:52:08 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weX0a-0000C6-EC
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 11:52:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weX0Z-00HFt8-4V
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 13:52:07 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43add7-2eae-0a2a0a5409dd-0a2a4507d50a-16
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 13:52:06 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43ade4-9c8e-0a2a45070019-d1558036f019-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 13:52:04 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-493b77b150aso9604125e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 04:52:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493bb4c0891sm47590195e9.2.2026.06.30.04.52.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 04:52:02 -0700 (PDT)
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
        d=suse.com; s=google; t=1782820324; x=1783425124; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NexqE16zsTi3a4NsuPjE+jOr2Z4m5PtIC5sVHwUvRUA=;
        b=CxfZ5BwmiTohniisGOUIWQoRqur19gLk729092ghB39pSusf1pvGjfN3AFYKIzPmMy
         pTtYy8On/P8v/CpCZ8e9qrVzLxeNBrcu3GWkgiEUjt9iUhLImjZtADHkTYPcYc+pLBqY
         iKXZ5dwFk/nKswUPWZ8R3uAv++EcclCbzseNlX5c0X610ZSMXKcby5ju/klCtFyhBYpE
         TryFFGoSFYc2TjOIBj2p8wwT+03v0pBpwvPkDz7IzHrY7RMouBcVh8wHOsM8Q90UTAEm
         b1jfOoPqNy1eSbuwbzTf/H9P9vbRkzF+q6fdgoYm0uD2a2+BOtT56KYeQw1t5SxJ47dQ
         YyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782820324; x=1783425124;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NexqE16zsTi3a4NsuPjE+jOr2Z4m5PtIC5sVHwUvRUA=;
        b=C7iomL/8GMyncXhN1WHEvttNrSFr70HbTbLkzwdL/VZC55Jcj/Hr+n3mVc6Xu6SZEZ
         yQXBhto5BBJTf6voSZ5+xnWMqxRYRiHhiLzH7k6+VXy6xeAcbKhPv+Svuvqm2eL7C4+6
         2il8SRRCxNpC+0vTOAHLjwHJM8NSY3DWOV+ff/nJzKycIM/zQFBK+boKBQw5oHG0Xxuh
         rRT58Cm82XOKQtj9vIWczRr9uNLPuuoSLooKHJ/Sgy8u9EdAqy/vGqbRK0WwJI2iWX/E
         LtF4USvtW8j7t0GK3ZNOLNJr1QR1dgWVZlvfjXTtJoDODX4tywzQfGYZHg62dtWRyxco
         kz0A==
X-Forwarded-Encrypted: i=1; AFNElJ9de9JGg92r1p90GDTA9WM5WpsfAMK8AfopzTm4xcH+HjZTW08zcMqEUlhN4e6GQOKc9XBcJ2lSBCo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLFk10P5eqNp6jOD4JB1GCRBmfhfAWCcC1B0E8TupBGbhTb3vf
	AVrZZZSPnK+6H4sN5LP0LFS23F6SIG7sM/n25aAopAcc0ZRfabjbG5o4/T7dDnl+Nw==
X-Gm-Gg: AfdE7ckyhpeLkat5G+GVAqqNNmPtW4m5ciO8LHiUP6+KigiwBl4KeW4iUYfyLwdBEai
	csNYiSOaDyzNPdQ8FQJN8VGA/fERhoAMEgJE7OyInoyuaRCIf0PeiE+ZWs4HCN+hLUB1KL/XAwu
	cIORllauSeKWvYfq6pz7MRXvkVMmXKP7+PamngpLh2XxEe4DxLtkthTcTsyrQRnw8g1zxqdAreT
	dyP7Zqq1sxTepThXrXSSGfL5W8BR676ElIyHegDW4hb5sKit8Sv/2vWJwRlL+gKr0IJFuYgqIF+
	wClRxDJd46oi4bZF92p5/eMIjFQA82cvs05n41MsTOq0j39xInjzvmciSjlPebkoRjIzUc6fzVL
	4/XKmBskM4XDYHecJVQFFgPRycQjd6s12QTD4jNKEPezR5IVfhib855MDPIaTq6BpDhuRoyEhOf
	4aSGODfVw16Ao59/fwhwwDeCpjjMIQC3eIQj+rRJDVX3s9hecvmQBzRO2j+hNGXzwblZ802niFG
	ViL
X-Received: by 2002:a05:600c:4585:b0:493:a96b:fa0b with SMTP id 5b1f17b1804b1-493b82ae872mr46439425e9.24.1782820323023;
        Tue, 30 Jun 2026 04:52:03 -0700 (PDT)
Message-ID: <0c227ab1-f320-449a-966b-48519d58cb4a@suse.com>
Date: Tue, 30 Jun 2026 13:52:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/18] pci: Use pci_sbdf_t in pci_prepare_msix()
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1782747421.git.teddy.astie@vates.tech>
 <1782753811.8631fc262581453bbf619ec5b2062170.19f14685a98000701b@vates.tech>
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
In-Reply-To: <1782753811.8631fc262581453bbf619ec5b2062170.19f14685a98000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1782820324-FC52825E-210BF9B2/0/0
X-purgate-type: clean
X-purgate-size: 1536

On 29.06.2026 19:21, Teddy Astie wrote:
> --- a/xen/arch/x86/physdev.c
> +++ b/xen/arch/x86/physdev.c
> @@ -512,15 +512,19 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      case PHYSDEVOP_prepare_msix:
>      case PHYSDEVOP_release_msix: {
>          struct physdev_pci_device dev;
> +        pci_sbdf_t sbdf;
>  
> +        ret = -EFAULT;
>          if ( copy_from_guest(&dev, arg, 1) )
> -            ret = -EFAULT;
> -        else
> -            ret = xsm_resource_setup_pci(XSM_PRIV,
> -                                         (dev.seg << 16) | (dev.bus << 8) |
> -                                         dev.devfn) ?:
> -                  pci_prepare_msix(dev.seg, dev.bus, dev.devfn,
> -                                   cmd != PHYSDEVOP_prepare_msix);
> +            break;
> +        
> +        sbdf = PCI_SBDF(dev.seg, dev.bus, dev.devfn);
> +
> +        ret = xsm_resource_setup_pci(XSM_PRIV, sbdf.sbdf);
> +        if ( ret )
> +            break;
> +
> +        ret = pci_prepare_msix(sbdf, cmd != PHYSDEVOP_prepare_msix);
>          break;
>      }
>  

Okay, here you took Andrew's suggestion verbatim, ignoring my reply altogether.
Minimally what I'd have expected in response (without - imo - violating
Andrew's constraint) is

        ret = xsm_resource_setup_pci(XSM_PRIV, sbdf.sbdf);
        if ( !ret )
            ret = pci_prepare_msix(sbdf, cmd != PHYSDEVOP_prepare_msix);

Preferably with that:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

