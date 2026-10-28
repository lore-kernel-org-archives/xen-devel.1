Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552F5606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 13:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OoaU4jvz
Received: from list by lists.xenproject.org with outflank-mailman.1463303.1674201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM41o-0005Q1-K3; Wed, 28 Oct 2026 13:49:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463303.1674201; Wed, 28 Oct 2026 13:49:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM41o-0005Pu-Gl; Wed, 28 Oct 2026 13:49:20 +0000
Received: by outflank-mailman (input) for mailman id 1463303;
 Wed, 28 Oct 2026 13:49:19 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xM41n-0005Pk-4K
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 13:49:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM41m-007prh-A6
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 14:49:18 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae1fd4f-2eae-0a2a0a5409dd-0a2a450ae396-42
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 14:49:18 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae1fd5e-f2d2-0a2a450a0019-d1558036cd2c-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 14:49:18 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a20bdaf39cso10530525e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 06:49:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a930a63eb3sm45969645e9.1.2026.10.28.06.49.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 06:49:15 -0700 (PDT)
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
        d=suse.com; s=google; t=1793195358; x=1793800158; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ljkTtUVemMOjlfxR572ftOnuoHHDJnk02lUk1Wt/Idw=;
        b=OoaU4jvzhHF/GGXhWo7JBpUD60jkdJ4y061MNs8fG+8O02rLgIizsSKaPGGc3zsVSn
         ts1D73BM9YvRAr+W5SfX06fzGsESMfCBKNe2pkujtF1/wDnF1RME0KmqjtDyxFXFjqac
         O7gfJ6xdT54MQoV6Bn1kSaVFyrqAN5FhUPOPFZHzBzmLJ6ePkxAA0E3QSu6BAmw47iki
         v+6OoIOGM9JFUuqY+wVP+Pi0hahkVyxPU2SK3tjVO16NB2qGiSCS2t0pstLFIlmgj0JT
         Pndlas05r2X8MhzOPubu1rqo+3pEYaLYOrZB8We4DcSloV7dsei0Sv6sbTNtPkPAX/Yl
         lpJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793195358; x=1793800158;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ljkTtUVemMOjlfxR572ftOnuoHHDJnk02lUk1Wt/Idw=;
        b=N+iut1D0DrBSc3Ifyo3wrcsYH3lVnJDBCp+WRjHWgMw0Fm7GIhmCI1i+sAaDYGuvYD
         E3zA1DVbGvZO2g9Y4jw40iDzUSO5is2VjEJNAdMH50tbmtHww5WI3sTE9713V8LEE6Q5
         6xDt0PPVto1+vvw9JLpDXLnR8LrY09YJe1QZ48zvvgLjmCn2OXQ6vbxTA5U7ymI/hDJP
         RI9mcXiw/TUs6o4ROT3SqtwMGbf7Ka+sYLROeFEfj978haQWsLDdZcy/Q3+g6AVkB4L2
         vIhKQm+Jb6WcFBmiyyaYxY6yLQlPqsjXDYfryvcl569fNh61d662GzfDq92kpBsame4w
         kf2A==
X-Forwarded-Encrypted: i=1; AKwUvBzxrtaHiiE4vWJ5Ve8LPnQ3y7adAuhhmLv4KPcHPd1g9Ps0U4YhTOwWi9nkiDoc2Dp1ufKKQoaduBo=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJYVrQVOX6EWo/OdHnQC54jMAC3OFoV5Cl/UA6uhp9Su2DsGjzv
	8u43651M77zyq1NvFWQT8DQYKSJ9aNWg5HbcEE6UF1NmeLZe0L0FGLs6tmH567yeKQ==
X-Gm-Gg: AYBFou3Um45ZTQN7bAvuo6wVa5BTfBtkAhl8dACNhlwbjREUhWyan5oKTd0lTFnPcjz
	IeH4BKvQsQcqBCYO5njLjCxrrJiZnu9tW0h3sVxIlHYJYZgNb4VMbg6FxTWh6Z1KLnqe7fwcmFU
	ybiKo3AU5vtOjgF1UiHe3fVHn8zyxaBeOJNc+npSgHOKeWxtsNJlxn/ZFPLmBOMkwjTN5Ba+cq5
	VT4z/imD34482DGdbaglPqEBFPn2AemdqAfiq2Gx3xmMTjWGp9vFYnUbVpRvWg9TS6I6TtP3Cf4
	esBmBoe2T0Whsm4kSX8dskJPvvDLZYsPLKAO/mQXZjALkhV7IW+Eo6SmgQhGX/ioEIWYlkngsYA
	QR29SMZzwhKFtJX7Q/Q6a1OTuv22RQWaDCy8/sgQYo8irLby2EbUkTESOYoa7RVSCQjo6h0i3ZS
	71YVO/lJ21B9uQCU2uj/Zy6Ue5iz/JixhvEYs2lrALqFl/NKCYds3CsbsaQtELig/P3SYUfJQLW
	aujmVpFIG7yZu/nVZPh4uzTwo7OYcetMGf1iynQmUsWAVNauEWpMcGT1imZwB2ixPrTF86mIdwH
	nacVZEL+l0s17K70+hABsUwKfe1jo4vr15knd6y42HU54ZB0GCfUKEjjTmcPiIClS7b+3SX9s/q
	81o0F53RRTfExEId5fw==
X-Received: by 2002:a05:600c:354a:b0:4a1:fba8:b13d with SMTP id 5b1f17b1804b1-4a9662a0c02mr50170645e9.9.1793195357433;
        Wed, 28 Oct 2026 06:49:17 -0700 (PDT)
Message-ID: <fe02f3ef-a215-4c81-be64-e2a5a30ae3e8@suse.com>
Date: Wed, 28 Oct 2026 14:49:14 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] vpci: add SR-IOV support for PVH Dom0
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1792072426.git.mykyta_poturai@epam.com>
 <103b10d012cc291906025045a2da1ce728f0bffd.1792072426.git.mykyta_poturai@epam.com>
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
In-Reply-To: <103b10d012cc291906025045a2da1ce728f0bffd.1792072426.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1793195358-59BC0CFC-1CD4216B/10/78276251493
X-purgate-type: spam
X-purgate-size: 12874
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 15.10.2026 16:08, Mykyta Poturai wrote:
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -16,6 +16,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>       afterwards.
>  
>  ### Added
> + - PCI SR-IOV is supported for PVH dom0.

Isn't this x86-only right now?

> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -32,6 +32,7 @@
>  #include <xen/softirq.h>
>  #include <xen/tasklet.h>
>  #include <xen/vpci.h>
> +#include <xen/xvmalloc.h>
>  #include <xen/msi.h>
>  #include <xsm/xsm.h>
>  #include "ats.h"
> @@ -40,6 +41,8 @@ struct pci_seg {
>      struct list_head alldevs_list;
>      u16 nr;
>      unsigned long *ro_map;
> +    /* BDFs of VFs which have been enabled but which Xen has not added yet. */
> +    unsigned long *vf_setup_map;
>      /* bus2bridge_lock protects bus2bridge array */
>      spinlock_t bus2bridge_lock;
>  #define MAX_BUSES 256
> @@ -139,6 +142,47 @@ const unsigned long *pci_get_ro_map(u16 seg)
>      return pseg ? pseg->ro_map : NULL;
>  }
>  
> +/*
> + * Marking is serialised by the hardware domain's pci_lock, which the SR-IOV
> + * control register write handler holds; unmarking only clears a bit.
> + */

What about pci_vf_setup_pending()? How's that (to be) serialized again marking
and unmarking?

> --- a/xen/drivers/vpci/Makefile
> +++ b/xen/drivers/vpci/Makefile
> @@ -1,3 +1,4 @@
>  obj-y += cap.o
> +obj-y += sriov.o
>  obj-y += vpci.o header.o rebar.o
>  obj-$(CONFIG_HAS_PCI_MSI) += msi.o msix.o

When I added cap.o on a separate line, the intention was that new files would
follow suite, including the respecting of sorting. Imo sriov.o wants to go
after msi{,x}.o. Seeing how the latter are conditionally included - wouldn't
SR-IOV also want to have a HAS_SRIOV control?

> +/*
> + * Accesses to a marked BDF are terminated until 100ms after VF Enable; the
> + * first one past that adds the VF, which control_write() cannot do itself.
> + */
> +static pci_sbdf_t vf_sbdf(const struct pci_dev *pf_pdev, unsigned int idx)
> +{
> +    const struct vpci_sriov *sriov = pf_pdev->vpci->sriov;
> +    pci_sbdf_t sbdf = pf_pdev->sbdf;
> +
> +    sbdf.bdf += sriov->offset + sriov->stride * idx;
> +
> +    return sbdf;
> +}

The comment ahead of the function doesn't appear to be related to it. Does
it belong elsewhere?

> +static void mark_vfs(const struct pci_dev *pf_pdev)
> +{
> +    struct vpci_sriov *sriov = pf_pdev->vpci->sriov;
> +    unsigned int i;
> +
> +    /* VF Offset and VF Stride are only valid while VF Enable is set. */
> +    sriov->offset = pci_conf_read16(pf_pdev->sbdf,
> +                                    sriov->pos + PCI_SRIOV_VF_OFFSET);
> +    sriov->stride = pci_conf_read16(pf_pdev->sbdf,
> +                                    sriov->pos + PCI_SRIOV_VF_STRIDE);

What if we end up reading 0 here, yet ->num_vfs is greater than 1? Or put
differently, ...

> +    sriov->vfs_ready = NOW() + MILLISECS(100);
> +
> +    for ( i = 0; i < sriov->num_vfs; i++ )
> +    {
> +        pci_sbdf_t sbdf = vf_sbdf(pf_pdev, i);
> +        int rc = pci_vf_setup_begin(sbdf);
> +
> +        if ( rc )
> +            gprintk(XENLOG_WARNING, "%pp: cannot set up VF %pp: %d\n",
> +                    &pf_pdev->sbdf, &sbdf, rc);

... wouldn't pci_vf_setup_begin() better indicate to its caller when the
BDF was already marked prior to the call? Also, if you didn't end up
setting the bit here, shouldn't ...

> +    }
> +}
> +
> +static void unmark_vfs(const struct pci_dev *pf_pdev)
> +{
> +    struct vpci_sriov *sriov = pf_pdev->vpci->sriov;
> +    unsigned int i;
> +
> +    if ( !sriov->vfs_ready )
> +        return;
> +
> +    for ( i = 0; i < sriov->num_vfs; i++ )
> +        pci_vf_setup_end(vf_sbdf(pf_pdev, i));

... its clearing better also be avoided?

> +    sriov->vfs_ready = 0;

Might this better be done ahead of the loop?

> +}
> +
> +/* Find the PF which has enabled @sbdf, if that VF is ready to be added. */
> +static const struct pci_dev *ready_pf(const struct domain *d, pci_sbdf_t sbdf)
> +{
> +    struct pci_dev *pdev;

You return pointer-to-const, and nothing in the function alters *pdev.

> +    ASSERT(rw_is_locked(&d->pci_lock));
> +
> +    for_each_pdev ( d, pdev )
> +    {
> +        const struct vpci_sriov *sriov = pdev->vpci ? pdev->vpci->sriov : NULL;
> +        unsigned int i;
> +
> +        if ( !sriov || !sriov->vfs_ready || NOW() < sriov->vfs_ready )
> +            continue;
> +
> +        for ( i = 0; i < sriov->num_vfs; i++ )
> +            if ( vf_sbdf(pdev, i).sbdf == sbdf.sbdf )
> +                return pdev;
> +    }

This loop can easily have hundreds of iterations, when the number of SR-IOV
PFs in a system is likely relatively small. I wonder whether there shouldn't
be a separate list of "PDEVs with VFs under construction".

> +void vpci_sriov_drop_vfs(void)
> +{
> +    struct vcpu *curr = current;
> +    pci_sbdf_t pf_sbdf = curr->vpci.drop_vfs_pf;
> +    struct pci_dev *pf, *vf, *tmp;
> +
> +    if ( likely(pf_sbdf.sbdf == ~0U) )
> +        return;
> +
> +    curr->vpci.drop_vfs_pf.sbdf = ~0U;

The call site has a comment that the call here happens after all locks
were dropped. To prevent two calls here racing, the check-and-update
here needs to be atomic imo.

> +    /*
> +     * The unmapping queued by control_write() still references the VF pdevs,
> +     * so it has to complete before they are freed.
> +     */
> +    while ( vpci_process_pending(curr) )
> +        process_pending_softirqs();

This isn't very nice, yet I also don't have any better suggestion.

> +    pcidevs_lock();
> +    pf = pci_get_pdev(NULL, pf_sbdf);

Why is this a global lookup?

> +static void cf_check control_write(const struct pci_dev *pdev, unsigned int reg,
> +                                   uint32_t val, void *data)
> +{
> +    unsigned int sriov_pos = reg - PCI_SRIOV_CTRL;
> +    struct vpci_sriov *sriov = pdev->vpci->sriov;
> +    uint16_t control = pci_conf_read16(pdev->sbdf, reg);
> +    bool enabled = control & PCI_SRIOV_CTRL_VFE;
> +    bool new_enabled = val & PCI_SRIOV_CTRL_VFE;
> +    /* VF BARs decode only while both VF Enable and VF MSE are set. */
> +    bool decoding = enabled && (control & PCI_SRIOV_CTRL_MSE);
> +    bool new_decoding = new_enabled && (val & PCI_SRIOV_CTRL_MSE);
> +    int rc;
> +
> +    ASSERT(!pdev->info.is_virtfn);
> +
> +    if ( new_enabled == enabled && new_decoding == decoding )
> +    {
> +        pci_conf_write16(pdev->sbdf, reg, val);
> +        return;
> +    }
> +
> +    /* Unmap while the VF pdevs are still around for vpci_modify_bars(). */
> +    if ( decoding && !new_decoding )
> +        map_vfs(pdev, 0);
> +
> +    if ( enabled && !new_enabled )
> +    {
> +        unmark_vfs(pdev);
> +
> +        /* The VFs cease to exist below, so Xen has to remove them. */
> +        if ( !list_empty(&pdev->vf_list) )
> +            current->vpci.drop_vfs_pf = pdev->sbdf;

Minimally an assertion may be wanted here, to check that drop_vfs_pf isn't
already in use.

> +static int cf_check init_sriov(struct pci_dev *pdev)
> +{
> +    unsigned int pos;
> +
> +    if ( pdev->info.is_virtfn )
> +        return -EINVAL;

Can this happen? I.e. doesn't this want to be an assertion, much like ...

> +    pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_SRIOV);
> +
> +    ASSERT(pos);

... this one?

> +    if ( xsm_resource_setup_pci(XSM_PRIV, pdev->sbdf.bdf) )
> +    {
> +        printk(XENLOG_ERR
> +               "%pp: SR-IOV configuration unsupported for unpriv %pd\n",
> +               &pdev->sbdf, pdev->domain);
> +        return -EACCES;
> +    }

In addition to Jason's remark (which may require Daniel's input): Why "unpriv"
in the log message? That's fine when dummy or SILO are in use, but that may
be entirely off under Flask.

> +    pdev->vpci->sriov = xvzalloc(struct vpci_sriov);
> +    if ( !pdev->vpci->sriov )
> +        return -ENOMEM;
> +
> +    pdev->vpci->sriov->pos = pos;
> +
> +    /*
> +     * We need to modify vf_rlen in control_write but we can't do it cleanly
> +     * from pdev because write callback only accepts const pdev. Moving vf_rlen
> +     * inside of struct vpci_sriov is also not possible because it is used
> +     * before vpci init. So pass it here as additional data to not require
> +     * dropping const in control_write.
> +     */
> +    return vpci_add_register(pdev->vpci, vpci_hw_read16, control_write,
> +                             pos + PCI_SRIOV_CTRL, 2, &pdev->physfn.vf_rlen);
> +}

This kind of comment is at risk of going stale without anyone noticing. It's
anyway written more like something belonging in a commit message.

> +static int cf_check cleanup_sriov(const struct pci_dev *pdev, bool hide)
> +{
> +    unsigned int pos;
> +    int rc;
> +
> +    if ( !pdev->vpci->sriov )
> +        return 0;
> +
> +    ASSERT(!pdev->info.is_virtfn);
> +
> +    unmark_vfs(pdev);
> +
> +    if ( !list_empty(&pdev->vf_list) )
> +    {
> +        struct pci_dev *vf_pdev, *temp;
> +
> +        printk(XENLOG_WARNING 
> +               "Attempting to remove SR-IOV PF %pp with VFs still present, VFs will be forcefully removed first\n",
> +               &pdev->sbdf);

What would be lost if "with VFs still present" was dropped from the log message?

> +        map_vfs(pdev, 0);
> +        list_for_each_entry_safe_reverse(vf_pdev, temp, &pdev->vf_list, vf_list)
> +        {
> +            pci_remove_device(vf_pdev->sbdf.seg, vf_pdev->sbdf.bus,
> +                              vf_pdev->sbdf.devfn);
> +        }

Nit: No need for figure braces here.

> +    }
> +
> +    pos = pdev->vpci->sriov->pos;
> +    if ( !hide )
> +    {
> +        XVFREE(pdev->vpci->sriov);
> +        return 0;
> +    }
> +
> +    rc = vpci_remove_registers(pdev->vpci, pos + PCI_SRIOV_CTRL, 2);
> +    if ( rc )
> +    {
> +        printk(XENLOG_ERR "%pd %pp: fail to remove SRIOV handlers rc=%d\n",
> +                pdev->domain, &pdev->sbdf, rc);
> +        ASSERT_UNREACHABLE();
> +        return rc;
> +    }
> +    XVFREE(pdev->vpci->sriov);
> +
> +    /*
> +     * Unprivileged domains have a deny by default register access policy, no
> +     * need to add any further handlers for them.
> +     */
> +    if ( !is_hardware_domain(pdev->domain) )
> +        return 0;
> +
> +    rc = vpci_add_register(pdev->vpci, vpci_hw_read16, NULL,
> +                           pos + PCI_SRIOV_CTRL, 2, NULL);
> +    if ( rc )
> +        printk(XENLOG_ERR "%pd %pp: fail to add SRIOV ctrl handler rc=%d\n",
> +               pdev->domain, &pdev->sbdf, rc);

I'm inclined to suggest "re-add", so it's clear from just seeing the message in
a log that this isn't about init of the device.

> @@ -486,6 +487,11 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>          return data;
>      }
>  
> +    /* Ahead of any lock being taken, as adding a device acquires them. */
> +    if ( unlikely(is_hardware_domain(d) && pci_vf_setup_pending(sbdf)) &&
> +         !vpci_sriov_add_vf(sbdf) )
> +        return data & (0xffffffffU >> (32 - 8 * size));

Is there a reason you can't simply "return data" here, like is done in the
first conditional of the function?

> @@ -145,6 +145,22 @@ struct vpci {
>          unsigned int nbars:3;
>      } rebar;
>  
> +    struct vpci_sriov {
> +        /* PF only */
> +        struct vpci_bar vf_bars[PCI_SRIOV_NUM_BARS];
> +        /*
> +         * When the VFs which are enabled but not added to Xen yet are
> +         * guaranteed to respond to config space accesses.  Zero if there are
> +         * none.
> +         */
> +        s_time_t vfs_ready;
> +        /* Routing ID offset of the first VF, and stride between VFs. */
> +        uint16_t offset;
> +        uint16_t stride;
> +        uint16_t num_vfs;
> +        unsigned int pos;
> +    } *sriov;
> +
>  #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
>      /* Guest SBDF of the device. */
>  #define INVALID_GUEST_SBDF ((pci_sbdf_t){ .sbdf = ~0U })

While for guests we have control over the range of valid SBDF values, ...

> @@ -169,6 +185,12 @@ struct vpci_map_task {
>  
>  struct vpci_vcpu {
>      struct list_head task_queue;
> +    /*
> +     * PF whose VFs have been disabled by the config space write in progress,
> +     * and which Xen has to remove once the PCI locks have been dropped.  All
> +     * ones when there is none.
> +     */
> +    pci_sbdf_t drop_vfs_pf;

... I don't see what would guarantee an all-ones pci_sbdf_t to not represent
a real device.

Jan

