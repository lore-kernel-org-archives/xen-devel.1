Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1C4CD98F2
	for <xen-devel@archiver.kernel.org>; Mon, 22 Jun 2026 11:15:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1343632.1602880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbccU-00045C-Dk; Mon, 22 Jun 2026 11:15:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343632.1602880; Mon, 22 Jun 2026 11:15:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbccU-000455-AY; Mon, 22 Jun 2026 11:15:14 +0000
Received: by outflank-mailman (input) for mailman id 1343632;
 Mon, 22 Jun 2026 11:15:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wbccT-00044z-1j
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 11:15:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbccR-00Aeqg-Ny
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 13:15:11 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a391939-5cb7-0a2a0a5109dd-0a2a4504bc36-16
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 13:15:11 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a39193f-5f9f-0a2a45040019-d1558032a433-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 13:15:11 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4921e4dd62dso33766835e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 04:15:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4924944fb71sm193047645e9.14.2026.06.22.04.15.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 04:15:10 -0700 (PDT)
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
        d=suse.com; s=google; t=1782126911; x=1782731711; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IOYx67Ar0C2PXA3Y3/zcQuO9nRhyTn7gqbbEGm5ZFI0=;
        b=T8u2x6zQdC+rW+3ZZ82elCgQi41dP8mrVp/ahUYpN04yYVKL2DANo49tkdUUgT69o5
         Zdq4WVPJUeZQQ35UuyrxZdV7xVXv+3sXz2EQQTrf0yqifbicC4n5HKQHa4sbejFxfFOy
         IyryXh+TiEAEmAjkz8YlNPoX/4/2jrcOfgae44VhLPGBAb0SlEeQbAItsgDITzR70GF2
         Xcj0xxHGsZ0F28RYmCscsR1TEQ5HzUJeAeC0CvV0x8Qs+sWiiy6gpHi3BLX3FaEyNY/y
         LFrPndNK8td4eBSvKYR3tc8xh4SqTYYfYExTXfmAlqChCCDVMJf/pJVNO+qfXzophCGE
         BVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782126911; x=1782731711;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOYx67Ar0C2PXA3Y3/zcQuO9nRhyTn7gqbbEGm5ZFI0=;
        b=JmCt95vkoYQOjs+Y1bxgg5QwmwHY1tI4Dw5GlEUo3xQPHGKr5vKOmPpqy2crAbmP2i
         bcJbU+y0bo6hRGAv8sQQ7NFk9vxu1WnT12YpsjExBAooR8H7y7R0LoSMLS9x3awnaRUC
         YYajaFzSzktCvq3ijQdXewJl4D+Zi+Il323vssi8/tKCsVogWbWC4NTb+x2QRSzLzaVP
         5fvFkxCMwHDiMo2s7D9fCV30tahIgjGI1KYeImQ97ab7TVAUDvTwwvF8tGQKm5hsk0R3
         w0eEHcxcmsdS82iQtZQYyLtWlVDa41OMtDK47W+hdE9wYt4QaEDPjMVcXR4r7yml4+8K
         JSaQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Eyc++373ecgyfcxvrytPt0YcaVRoy6GXqmYeROVFY6Nq2MwMmPAs25uU8ZSlAjeLQB+K8wiJdUxo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy87ilOXskyWanudAyjZJFz8hi/Ep+GaXFZ+ZQdirO7x97ibwIW
	bjzW5Tz69KjOeF1z1Dyfkrd7Ciuwfe71tGQC5lgXbCX9jxYtzKac7bUiERR1bapE8A==
X-Gm-Gg: AfdE7ckQpb5gT9Vu8kVZB3oma4NQ2sHuysugXc1UCn/XGaLaYq0EeXeqfFJAsK4N19R
	2+6v9MSbA1Nys4+i2Ol2kC1+CIQdT8Cl4LB5p+jnzG8wcpS+kYhmvGsd70fUD0ulh4kRA0ejyny
	3IBcmEItB9uO4opXPCcrjzo5flSwAvFhM0xZo2gmRbf3DXUeOVVvbCAFcN9bjWNZcAzoICYZWYe
	SF2dMOagaLCaHIZaX91SK3YKOLmGm6hm7AwxqxB1CbqVDPeeoHQivsXucYAOOe+CtvfYzvAlMBc
	uCAFkKsyFdeU2Ds3pNSFr0apU4FXdAi2YftFkJPxd9cAYDjHUhYhLXEzzo/5ESqD2k4t+FeXOcK
	wWyjZBvFvqDMuqF8wP2V+XT8som8Ied70Ik2xrMuTGGdLHeTsAMAHrDq9na7lmW6c/YPiAprRGO
	6AusgayqUoaWEL3xrDEOZZDuOz6Rx+RCmwe9YOWPjOskezWAj1fIGXeSkbtv6XENND9EIHy35hK
	uVO
X-Received: by 2002:a05:600c:83c9:b0:492:4a1a:a96a with SMTP id 5b1f17b1804b1-4924a1aaa71mr122511815e9.11.1782126910962;
        Mon, 22 Jun 2026 04:15:10 -0700 (PDT)
Message-ID: <abe97058-5a9d-4f16-800f-86974798f160@suse.com>
Date: Mon, 22 Jun 2026 13:15:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/15] pci: Use pci_sbdf_t in pci_add_device()
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1781790171.git.teddy.astie@vates.tech>
 <1781794557.8631fc262581453bbf619ec5b2062170.19edb3b4fc3000701b@vates.tech>
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
In-Reply-To: <1781794557.8631fc262581453bbf619ec5b2062170.19edb3b4fc3000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1782126911-45DC8141-36A4B0A0/0/0
X-purgate-type: clean
X-purgate-size: 3662

On 18.06.2026 16:50, Teddy Astie wrote:
> Also take the opportunity to avoid refetching sbdf from pdev
> since we already have it now.

I question this; see below.

> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -661,12 +661,11 @@ unsigned int pci_size_mem_bar(pci_sbdf_t sbdf, unsigned int pos,
>      return is64bits ? 2 : 1;
>  }
>  
> -int pci_add_device(u16 seg, u8 bus, u8 devfn,
> -                   const struct pci_dev_info *info, nodeid_t node)
> +int pci_add_device(pci_sbdf_t sbdf, const struct pci_dev_info *info, nodeid_t node)

Nit: This line is too long now.

> @@ -700,16 +699,14 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>          pdev->info = *info;
>          if ( pdev->info.is_virtfn )
>          {
> -            struct pci_dev *pf_pdev =
> -                pci_get_pdev(NULL, PCI_SBDF(seg, info->physfn.bus,
> -                                            info->physfn.devfn));
> +            pci_sbdf_t pf_sbdf = PCI_SBDF(sbdf.seg, info->physfn.bus, info->physfn.devfn);

As is this one.

> @@ -728,14 +725,14 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>              if ( !pdev->ext_cfg )
>                  printk(XENLOG_WARNING
>                         "%pp: VF without extended config space?\n",
> -                       &pdev->sbdf);
> +                       &sbdf);
>          }
>      }
>  
>      if ( !pdev->info.is_virtfn && !pdev->physfn.vf_rlen[0] )
>      {
>          unsigned int pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_SRIOV);
> -        uint16_t ctrl = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_CTRL);
> +        uint16_t ctrl = pci_conf_read16(sbdf, pos + PCI_SRIOV_CTRL);

Are changes like these two actually worthwhile to make? sbdf, being a function
parameter, can be modified in the course of the function. pdev->sbdf, otoh,
cannot (for being in a const struct field). If further sbdf, throughout the
function, never had its address taken, the compiler may be able to produce
better code.

> @@ -817,14 +814,14 @@ out:
>      pcidevs_unlock();
>      if ( !ret )
>      {
> -        printk(XENLOG_DEBUG "PCI add %s %pp\n", type, &pdev->sbdf);
> +        printk(XENLOG_DEBUG "PCI add %s %pp\n", type, &sbdf);
>          while ( pdev->phantom_stride )
>          {
>              func += pdev->phantom_stride;
>              if ( PCI_SLOT(func) )
>                  break;
>              printk(XENLOG_DEBUG "PCI phantom %pp\n",
> -                   &PCI_SBDF(seg, bus, slot, func));
> +                   &PCI_SBDF(sbdf.seg, sbdf.bus, slot, func));

Why sbdf.bus but not sbdf.slot? In fact this is a case where altering sbdf may
help: You then wouldn't need the func local variable anymore either.

> --- a/xen/drivers/pci/physdev.c
> +++ b/xen/drivers/pci/physdev.c
> @@ -50,7 +50,7 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          }
>  #endif
>  
> -        ret = pci_add_device(add.seg, add.bus, add.devfn, &pdev_info, node);
> +        ret = pci_add_device(PCI_SBDF(add.seg, add.bus, add.devfn), &pdev_info, node);

Yet another overlong line.

> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -229,8 +229,7 @@ void setup_hwdom_pci_devices(struct domain *d,
>  int pci_release_devices(struct domain *d);
>  int pci_add_segment(u16 seg);
>  const unsigned long *pci_get_ro_map(u16 seg);
> -int pci_add_device(u16 seg, u8 bus, u8 devfn,
> -                   const struct pci_dev_info *info, nodeid_t node);
> +int pci_add_device(pci_sbdf_t sbdf, const struct pci_dev_info *info, nodeid_t node);

And again.

Jan

