Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964CC606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 14:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ObxB3zJX
Received: from list by lists.xenproject.org with outflank-mailman.1463349.1674237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM4ai-0004lP-Q8; Wed, 28 Oct 2026 14:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463349.1674237; Wed, 28 Oct 2026 14:25:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM4ai-0004lI-N1; Wed, 28 Oct 2026 14:25:24 +0000
Received: by outflank-mailman (input) for mailman id 1463349;
 Wed, 28 Oct 2026 14:25:23 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xM4ah-0004l5-KS
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 14:25:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM4ah-007wCq-0w
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 15:25:23 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae205c9-e002-0a2a0a5209dd-0a2a4508d5ba-34
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 15:25:22 +0100
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae205d2-f659-0a2a45080019-d155dd36bd02-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 15:25:22 +0100
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-48e0d1c095dso566898f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 07:25:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ecd35c2sm28250386f8f.39.2026.10.28.07.25.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 07:25:21 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793197522; x=1793802322; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pt4R12krTVVQKTaxDhZs2VAib5e/yExqZczSnQuv+6U=;
        b=ObxB3zJXNkiYcxtSJD756+hnGQ0ayz4M3AuTQuORdEKKNsJf7ieE8ddE37/xZbFGwT
         cshDolkUSAM/nh/93XO40jwyzAsQeEUB2qTaCGjx65U2eFvYs85C+EzBeOtYkIHRwhoW
         OVI+CWPDQwwqRmPhlaS6fIWJHbGHtd56CxjDP/rj1JVq2FysVElwas1ZNK44WmoRCtp8
         y9zknbbXnNjnxSrcpKkC825fcRDFisIHjPfvPSROJ9XdRaLeaX9FwEmHJfWYwX5MsSsD
         qSTbDJJriOvsnLHId0wmYz4SwP26b/7uc+slqiCOoz+l96jgtt4oGY0bcBG/YP8ZNxQJ
         FMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197522; x=1793802322;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pt4R12krTVVQKTaxDhZs2VAib5e/yExqZczSnQuv+6U=;
        b=dmb+4r29rmYldR8i5l2UY1wNQ1zx7o7iYwqldzpQ0kHVyRlRsARI3jR1Kx6r/1EO1I
         8JTRGQ7MLo3gabiu+WvBblq66C564Fp6NpxbMcx5qHkAcKo9QKw31dd1mRrqGzZXgqtI
         j/fx0l2C4ZkCp95Z5QvdxuEcl1jLLn1IluJp73MkHaLBS6672t+U33xyTAjqIhyAc9n/
         2vrdPSAFdCXfwxnYIuSkmd4XbzjAj3zYBiGOyqL9du/F34VdDEH/T5nUeoGuzGmVxnLD
         J4pAdtP1bCqJYuYJvbZFhWfXF2oWD+5atWbuTuIW5HwfiPU+sdsJWhwpZeUjAl3HViZf
         7+qQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyzxhP6JJgpBoCmCUQZpunF9bjJO4W7unic9N5b2VK1K3ukoseeSgksanrTcUq8qtB8ki4aDiJWOI=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIbq66rpH91pMbXk+IjKvbkWkNfNh6ZSMR1Mk+EaXxxckdJHZnm
	dcUAhikQmPdfCOwujNv8i6WdZiCWBEbziFscZUyEkFN02gJITBiNjq07aqs8z9dn1Cw1U+ZN9Cp
	O+GbVsA==
X-Gm-Gg: AYBFou3TDf07gJ+Ase93YZZlNc2ZgtWdq0QBWH+ndgy7gknGPULcMlQcbAxiUa6C0y3
	uvcD1+fekEUhghhFUz/MhRm9dV4uuCYTsTCIqxu0Gi88/mMQYT2tr16kqRsscQHeXezGPqzWvUq
	aBNjnGXidcS69gwHMbYUvvm51YD2OPdd+7pH2Hj1AMzqG2JAK3YcNRgJZiEoTKlHdsUoag8Wf8z
	Rjt2dZpCjyz30LqbcpjbUewQ3FHIQoOn9H7iX1p9VdmaO31kwneO1qPKZJDIbWoj42/vfByD4fW
	7VwYPTnKudIwbVrv6NDLjZkTjjxrgkezI4KwmbQjzCNm7UZQ/o9O/AYU4NCypXbzv2PDbSaF2BI
	1per5Raq69wA5zSU/X6hknvf+BebPUTxw56Pz3CVcPkCOvTUsLpJ8hfzudBiV+fUQOfiD5+/kvq
	P73y+mLRMOxfw+1EwzCjmexnDYwj58ZFRgu0QCpTr0Y5EfBrql6AeWflHjteyGvT2D/EwSxqzVv
	ktU77eE+mIFfZWxVtBS85dKDX7Kp/TaG8nSnKWzQc25fk3sLwPhDO54vqAdCFL+XCHYlPHnEWMI
	c5X54TpantGBTVXO+dlC1jIIetf3u6F+FI9nRhOcVB+fqsRZPdJDTgzllSvD4l7j+q02ys017ok
	eN9kW0z8eUd+JIAaq
X-Received: by 2002:a05:6000:29cf:b0:48d:ea67:79d4 with SMTP id ffacd0b85a97d-48e5d311f62mr4360163f8f.53.1793197522096;
        Wed, 28 Oct 2026 07:25:22 -0700 (PDT)
Message-ID: <65d41464-6c65-40be-8279-acdececf53c5@suse.com>
Date: Wed, 28 Oct 2026 15:25:21 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] vpci: add SR-IOV support for DomUs
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1792072426.git.mykyta_poturai@epam.com>
 <8823cd01334978baea19515c35068c789d4568bb.1792072426.git.mykyta_poturai@epam.com>
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
In-Reply-To: <8823cd01334978baea19515c35068c789d4568bb.1792072426.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1793197522-CCF4F87B-7BFB3BB2/10/78276251493
X-purgate-type: spam
X-purgate-size: 3583
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 15.10.2026 16:08, Mykyta Poturai wrote:
> --- a/xen/drivers/vpci/sriov.c
> +++ b/xen/drivers/vpci/sriov.c
> @@ -79,19 +79,80 @@ int vpci_vf_init_header(struct pci_dev *vf_pdev)
>      const struct pci_dev *pf_pdev;
>      int rc = 0;
>      uint16_t ctrl;
> +    unsigned int sriov_pos;
>  
>      ASSERT(rw_is_write_locked(&vf_pdev->domain->pci_lock));
>      ASSERT(vf_pdev->info.is_virtfn);
>  
>      pf_pdev = vf_pdev->pf_pdev;
>      ASSERT(pf_pdev);
> +    sriov_pos = pf_pdev->vpci->sriov->pos;

Can't this move ...

>      rc = vf_init_bars(vf_pdev);
>      if ( rc )
>          return rc;

... here?

> -    ctrl = pci_conf_read16(pf_pdev->sbdf,
> -                           pf_pdev->vpci->sriov->pos + PCI_SRIOV_CTRL);
> +    ctrl = pci_conf_read16(pf_pdev->sbdf, sriov_pos + PCI_SRIOV_CTRL);
> +
> +    if ( IS_ENABLED(CONFIG_HAS_VPCI_GUEST_SUPPORT) &&
> +         pf_pdev->domain != vf_pdev->domain )
> +    {
> +        struct vpci_bar *bars = vf_pdev->vpci->header.bars;
> +        /*
> +         * A VF's Vendor and Device ID registers read as 0xffff. The guest has
> +         * no PF to synthesise them from, so take the vendor from the PF and
> +         * the device from its SR-IOV capability.
> +         */
> +        uint16_t vid = pci_conf_read16(pf_pdev->sbdf, PCI_VENDOR_ID);
> +        uint16_t did = pci_conf_read16(pf_pdev->sbdf,
> +                                       sriov_pos + PCI_SRIOV_VF_DID);
> +
> +        rc = vpci_add_register(vf_pdev->vpci, vpci_read_val, NULL,
> +                               PCI_VENDOR_ID, 2, (void *)(uintptr_t)vid);

This effectively open-codes _p().

> +        if ( rc )
> +            return rc;
> +
> +        rc = vpci_add_register(vf_pdev->vpci, vpci_read_val, NULL,
> +                               PCI_DEVICE_ID, 2, (void *)(uintptr_t)did);

Same here.

> +        if ( rc )
> +            return rc;
> +
> +        /* Hardcode multi-function device bit to 0 */
> +        rc = vpci_add_register(vf_pdev->vpci, vpci_read_val, NULL,
> +                               PCI_HEADER_TYPE, 1,
> +                               (void *)PCI_HEADER_TYPE_NORMAL);

And this works only because PCI_HEADER_TYPE_NORMAL happens to be 0. Imo
_p() wants using here as well.

> +        if ( rc )
> +            return rc;
> +
> +        rc = vpci_add_register(vf_pdev->vpci, vpci_hw_read32, NULL,
> +                               PCI_CLASS_REVISION, 4, NULL);
> +        if ( rc )
> +            return rc;

How is this SR-IOV-related?

> +        for ( unsigned int i = 0; i < PCI_SRIOV_NUM_BARS; i++ )
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
> +
> +            default:
> +                rc = vpci_add_register(vf_pdev->vpci, vpci_read_val, NULL,
> +                                       PCI_BASE_ADDRESS_0 + i * 4, 4,
> +                                       (void *)0);

Unlike above here I'm less certain - we deliberately use this pattern
elsewhere already. Yet maybe those would best be switched to _p() as
well.

Jan

