Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA6A109B47B
	for <xen-devel@archiver.kernel.org>; Tue, 31 Mar 2026 15:03:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1269061.1558203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7acJ-0006p1-R0; Tue, 31 Mar 2026 15:02:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269061.1558203; Tue, 31 Mar 2026 15:02:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7acJ-0006ou-Ns; Tue, 31 Mar 2026 15:02:55 +0000
Received: by outflank-mailman (input) for mailman id 1269061;
 Tue, 31 Mar 2026 15:02:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7acJ-0006oo-87
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 15:02:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7acI-00HGu1-Jy
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 17:02:54 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cbe214-5cb7-0a2a0a5109dd-0a2a45039f52-24
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 17:02:54 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69cbe21e-1947-0a2a45030019-d1558030d486-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 17:02:54 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so49282415e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 08:02:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887adc5690sm32151685e9.2.2026.03.31.08.02.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 08:02:53 -0700 (PDT)
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
        d=suse.com; s=google; t=1774969374; x=1775574174; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Uev4nSdenuKcsR/y5Q48D1UtxhwbVJygbdeoloBJ2K4=;
        b=JGjJCfjbeB41qUgz4M6Bw4PWSqePmCL1jeWgDcsrAoxUF0YHwx0I8+kXnmHfvKxvtG
         jIfaDcFX0q3oIHfCVJ/+GmaLp8oNu0+uknyg9/7TrZsdQo8DARmGJSa6npHO5ady6Gxc
         HbeVtm6hE0olQeI5AhSQmUJ5S37A/WQxiseurFtQFZoNf7RqV6wDWt+U3KVrGd5tWq8e
         ebi+7RW8ZBENRckLGelYTEznxuND8i2hbjE8eSeS3LPRMB94UFrD5xT5ezbebATUwjVm
         w9cuz6qqJfN6/OmFy/yl5J570PWXmsuBfx0x+hbFK8L4o/0nVezmuzehPJk0Hvdm8XCV
         OReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774969374; x=1775574174;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uev4nSdenuKcsR/y5Q48D1UtxhwbVJygbdeoloBJ2K4=;
        b=LPPf3MJQn1vnFTD0wLw3eLqK6FjM83H65bm3BiIdL20vEl17+rhoO/89VqcV8JaS42
         dNGTxWMUd9VVxV0OR7iAoEQbweKYS6hHhc24DU813LQHDQpMgLFCVStQtGiGj1uinPKg
         8W3vIw4c/QBscuHD9angJ0WWFm9oGopRcWFsp3tevYDpmCymQ567gqlHt6+Sf4Z3yHWU
         VAswdgRArG4MnaY//uBR9WTmI8CBjWCpNrDyIc+QWaRBsqazCQi6ZQlDpclZGH+y0uTz
         BVPAIpp/IQ8sRB+ysvdYabpX//LpJBbsgosCmegZ5pt59MNacQQRLKra1m0Yl/Sl0g52
         IEIA==
X-Forwarded-Encrypted: i=1; AJvYcCVjkfaY3m5NUk68XYaCsGKXUd8JmQ7+ZZOJTYo3Bso/IsE+mdhhrZma+cTCJPngSnF3Oj5O82kcMlA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwyLeCQLF0SQsmfdMcGQBQszTT+OqcZM3+OBkDbJYcfetswyxvN
	TguxoodNuptQj7X1NPnzJ3uae8a7nYbwZ8L88PqEGSiukR3KberujR8fgNw5/u8pYg==
X-Gm-Gg: ATEYQzytD6GK6YwzBb31dYxX69ozLIz9ryzLCPcQucI25sggm0CigHPUdie6dDb75xU
	eQgvqoDLH4mGo6Fivm91bEtbQRKRs9NDARKiK6uW5rjxksZFb1sv8MOKvSMaGLN78IpsuCT1QPJ
	VKP4DxzyZmHHmaYQdPGS6UX1O6trbMTv2j19KDGXbixNw3NJPhJDQxRQNWRlSrLCqYmH0nEmZ7Q
	rKlH0GYT6+DGJ6p0yhhFSYIY1zGa3Tkg8JNcu0azw86gdzzeX1tpPde1kKfmhD/3zTb7bbJA51x
	51UI6mXMVaTCxPmy3/PDK2V7ucRtdY5/2MRoIje219q1aGT7g8oAFM0HrnPTpqAl8pi/pCIIUWc
	o4eXJfoj3JTkPubpta8v0s2G+A9vTe74gprtx81/ysUQHJ/qKTYByUBhlKxVxzOHdmGjXQXrkkU
	FUhRTXecIvDdPN2v3saOnV2dUjAJdpn5ByBoeLaCgMN9b341BV+heymRmhKU7mDMtVZmO2lGQWp
	az4Mp/JOk7cO4c=
X-Received: by 2002:a05:600c:8b2a:b0:485:3dfc:57c with SMTP id 5b1f17b1804b1-48727f5fe97mr292619545e9.21.1774969373785;
        Tue, 31 Mar 2026 08:02:53 -0700 (PDT)
Message-ID: <f6c3560a-1b2f-47a4-9386-77d688abba75@suse.com>
Date: Tue, 31 Mar 2026 17:02:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] vpci: add SR-IOV support for DomUs
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1772806036.git.mykyta_poturai@epam.com>
 <4df03dab1dc6ce3ac7524b9f06641bc90889f743.1772806036.git.mykyta_poturai@epam.com>
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
In-Reply-To: <4df03dab1dc6ce3ac7524b9f06641bc90889f743.1772806036.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1774969374-EAC8472C-6B3AE64D/0/0
X-purgate-type: clean
X-purgate-size: 2941

On 09.03.2026 12:08, Mykyta Poturai wrote:
> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> SR-IOV virtual functions have simplified configuration space such as
> Vendor ID is derived from the physical function and Device ID comes
> from SR-IOV extended capability.
> Emulate those, so we can provide VID/DID pair for guests which use PCI
> passthrough for SR-IOV virtual functions.

Why do we need to emulate what hardware would do anyway? These are r/o
fields, so likely okay to expose directly to a domain?

> --- a/xen/drivers/vpci/sriov.c
> +++ b/xen/drivers/vpci/sriov.c
> @@ -303,6 +303,63 @@ int vf_init_header(struct pci_dev *vf_pdev)
>      sriov_pos = pci_find_ext_capability(pf_pdev, PCI_EXT_CAP_ID_SRIOV);
>      ctrl = pci_conf_read16(pf_pdev->sbdf, sriov_pos + PCI_SRIOV_CTRL);
>  
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +    if ( pf_pdev->domain != vf_pdev->domain )

Is there anything speaking against the (preferred) use of
IS_ENABLED(CONFIG_HAS_VPCI_GUEST_SUPPORT) here?

> +    {
> +        uint16_t vid = pci_conf_read16(pf_pdev->sbdf, PCI_VENDOR_ID);
> +        uint16_t did = pci_conf_read16(pf_pdev->sbdf,
> +                                       sriov_pos + PCI_SRIOV_VF_DID);
> +        struct vpci_bar *bars = vf_pdev->vpci->header.bars;
> +        unsigned int i;
> +
> +        rc = vpci_add_register(vf_pdev->vpci, vpci_read_val, NULL,
> +                               PCI_VENDOR_ID, 2, (void *)(uintptr_t)vid);
> +        if ( rc )
> +            return rc;
> +
> +        rc = vpci_add_register(vf_pdev->vpci, vpci_read_val, NULL,
> +                               PCI_DEVICE_ID, 2, (void *)(uintptr_t)did);
> +        if ( rc )
> +            return rc;
> +
> +        /* Hardcode multi-function device bit to 0 */
> +        rc = vpci_add_register(vf_pdev->vpci, vpci_read_val, NULL,
> +                               PCI_HEADER_TYPE, 1,
> +                               (void *)PCI_HEADER_TYPE_NORMAL);
> +        if ( rc )
> +            return rc;
> +
> +        rc = vpci_add_register(vf_pdev->vpci, vpci_hw_read32, NULL,
> +                               PCI_CLASS_REVISION, 4, NULL);
> +        if ( rc )
> +            return rc;
> +
> +        for ( i = 0; i < PCI_SRIOV_NUM_BARS; i++ )
> +        {
> +            switch ( pf_pdev->vpci->sriov->vf_bars[i].type )
> +            {
> +            case VPCI_BAR_MEM32:
> +            case VPCI_BAR_MEM64_LO:
> +            case VPCI_BAR_MEM64_HI:
> +                rc = vpci_add_register(vf_pdev->vpci, vpci_guest_mem_bar_read,
> +                                       vpci_guest_mem_bar_write,
> +                                       PCI_BASE_ADDRESS_0 + i * 4, 4, &bars[i]);
> +                if ( rc )
> +                    return rc;
> +                break;
> +            default:

Nit: Blank lines please between non-fall-through case blocks.

Jan

