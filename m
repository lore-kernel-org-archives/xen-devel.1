Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0FDCA6019
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2026 13:08:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444374.1661246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFAK6-0008KQ-Gm; Fri, 09 Oct 2026 13:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444374.1661246; Fri, 09 Oct 2026 13:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFAK6-0008KJ-E9; Fri, 09 Oct 2026 13:07:42 +0000
Received: by outflank-mailman (input) for mailman id 1444374;
 Fri, 09 Oct 2026 13:07:41 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1xFAK5-0008KD-9O
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 13:07:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFAK4-001s56-MX
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 15:07:40 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6ac8e716-bab6-0a2a0a5309dd-0a2a4504b4d4-16
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 15:07:40 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6ac8e71c-b57f-0a2a45040019-d1558032a4ce-3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 15:07:40 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a16c1608faso20610615e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 06:07:40 -0700 (PDT)
Received: from [192.168.0.114] ([91.123.150.146])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18ee9bd19sm34067205e9.1.2026.10.09.06.07.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2026 06:07:38 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791551260; x=1792156060; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L45L97LSOrdTS6K1MJ/W6YBixnL98U2oylFsU9uAZ6g=;
        b=hoxDQkWh0CpnS5p+gID1YrTzfRHITDlTyrw6rksuaMcsFVtkq+DuO8d+cVwnEWcgpV
         heo6cuFJhUoRBlD1iF52vVbg3FBLYVA0lJhKdp3AIoHmBO1XN2lJch6wPtJRSKNHQhzh
         oYnAfopEVfo/UCBvVbiAEjnCVGTfxA3mFpwm67hgEI1/Py9ESsKd57Dq4heAq2e6c1p+
         sAI0jpfIAt2fX4+Q10oo8d/6O1i5VGKXAtH6toZzHj5Wg/+fNLNWaCYV4XzmGU4UJPzc
         rRLli2yU/N6scDos5xKtcDd6U42CJa9pBMkDo7FXnXkariVQrYgSJU39cLWGXMGKEFN+
         AX9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791551260; x=1792156060;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L45L97LSOrdTS6K1MJ/W6YBixnL98U2oylFsU9uAZ6g=;
        b=a3CEKG2GPStxIN0iPswHEeXeyCP5/+hIocJ9rm90kd9eM6jdKjCCpos6+JZR3/DgR8
         s+9erZgWVL4WUkFSUu21XUOhn8OhzKE/CY8CTPzGdHo4YFvtg9UunhesBf/m4A1A+Wqn
         esZ62Kuq9FktEJ32s8EUo5Q7zLcLOFLpLE2w/nkm+JRaXofwqbk67XmN984VEyG+a5S7
         jPi0ZrmTwJl4YTWiFZna/Vay46pSVxMxzhakODndBMhZhptfWgdy4SMJRmvQOXfojuHa
         scBXBD8fzt+xMtv8xELqzXsiHZr2vnk6hSEj1/dA2nD+avrKBRV3iSFH2ZVwwR5ykVoR
         Bzqg==
X-Forwarded-Encrypted: i=1; AKwUvByXdTPp8JNznvGow6ryu13+L7dD8c+sHp3vvuVFf67JB73M/oyDUqnk9A9tZpB+punuij346dopJKg=@lists.xenproject.org
X-Gm-Message-State: AFuF++nx/WBh0CeqtIX21YXo0bdIjtwAnFjHXhf5qT0OIGCnV1Cd9D1h
	9kD9iO4O0mE6HeHyAZJ5Fp9kOokRK28NiXp6lACG+ZhYuJ/2hLdOjQEo
X-Gm-Gg: AYBFou0/gXSIL2V+nrBI4i19MwAED433qWrDp1yrKYn1R1lQLUly8suVbWH/ctKDHiy
	mNbNof5Sh/vd3lJMbWK3TqIRRTLgqgQCKG87W9Ga4cZWd7ff+nVmJYGy9olrWsmV4aLNCiIBb98
	2G5xpYbd268JSpO4p/fwjWrZS+tibNi73sMsJR6QOUFaGIdZdOjZOcNjCh9RBB2id7fPxKNDgHM
	px46LHhkb2bu7Xplt7a1uYj5vhUtHr/tXZEJfjvQJ+xic/cp7w+Edbmvd7/1IFAjrWlaZ1QcsPl
	UzpykGEMgI5GH3ufKWpqUt7jU7ddg7IwBq+0PUqXw4TlSnhg5ey3mWfu38DRE+3cPVjtRJ5Uhkg
	zQE6DWk2FY1ftpgiHRSegQ/VFyIB7cNwFoH+WN1wxhaAnTH4IxWB+2VkgB1sn/l3jl76Wo4F4D6
	pSrYV5cmi6dyrpRyxRNfhqeIiG472zMKbOu/nfs79huk/IAkVtHTz0QmTrNV6+2mgxO86PE/vWC
	Ok=
X-Received: by 2002:a05:600c:a011:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4a18e447d8bmr33849925e9.2.1791551259602;
        Fri, 09 Oct 2026 06:07:39 -0700 (PDT)
Message-ID: <37275fb7-d8c3-414f-ad72-8bd399310323@gmail.com>
Date: Fri, 9 Oct 2026 16:07:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 21/22] libxl/arm: Introduce domctl command for IOMMU
 vSID mapping
To: Milan Djokic <milan_djokic@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <cover.1791328190.git.milan_djokic@epam.com>
 <66d35a04bcde0c41050e61e194de4565d6fed045.1791328190.git.milan_djokic@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <66d35a04bcde0c41050e61e194de4565d6fed045.1791328190.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1791551260-C34C3B50-9EA31E38/0/0
X-purgate-type: clean
X-purgate-size: 14681



On 10/7/26 03:07, Milan Djokic wrote:

Hello Milan

> For guests created via the control domain (xl, Zephyr xenlib), a partial
> device tree is parsed and loaded on the control domain side.
> 
> SIDs in the guest device tree have to be replaced with virtual SIDs that
> are mapped to the corresponding physical SIDs. To do this, the control
> domain requests Xen to allocate a new vSID and map it to the original
> pSID for each IOMMU stream ID associated with a guest device.
> 
> Introduce a new domctl command (XEN_DOMCTL_viommu_allocate_vid) that
> allows the control domain to request a new vSID mapping and replace the
> original pSID with the allocated vSID in the guest device tree.
> 
> Implement vSID allocation in libxl using this interface for devices
> configured behind an IOMMU.
> 
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> ---
>   tools/include/xenctrl.h             |  13 ++++
>   tools/libs/ctrl/xc_domain.c         |  25 +++++++
>   tools/libs/light/libxl_arm.c        | 107 +++++++++++++++++++++++++---
>   xen/arch/arm/domctl.c               |  38 ++++++++++
>   xen/include/public/domctl.h         |  22 ++++++
>   xen/xsm/flask/hooks.c               |   4 ++
>   xen/xsm/flask/policy/access_vectors |   2 +
>   7 files changed, 202 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index 9f00d4a19d..d38b365078 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -2664,6 +2664,19 @@ int xc_domain_set_llc_colors(xc_interface *xch, uint32_t domid,
>                                const uint32_t *llc_colors,
>                                uint32_t num_llc_colors);
>   
> +/*
> + * Allocate guest IOMMU vSID and establish its mapping to pSID.
> + * It can only be used on domain DT creation.
> + * Currently used for ARM only, possibly for RISC-V in the
> + * future. Function has no effect for x86.
> + */
> +int xc_domain_viommu_allocate_vsid_range(xc_interface *xch,
> +                                         uint32_t domid,
> +                                         uint16_t nr_sids,
> +                                         uint32_t first_psid,
> +                                         uint32_t phandle,
> +                                         uint32_t *first_vsid);
> +
>   #if defined(__arm__) || defined(__aarch64__)
>   int xc_dt_overlay(xc_interface *xch, void *overlay_fdt,
>                     uint32_t overlay_fdt_size, uint8_t overlay_op);
> diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
> index 94cfab0fa1..0bd3e45fbd 100644
> --- a/tools/libs/ctrl/xc_domain.c
> +++ b/tools/libs/ctrl/xc_domain.c
> @@ -2222,6 +2222,31 @@ out:
>   
>       return ret;
>   }
> +
> +int xc_domain_viommu_allocate_vsid_range(xc_interface *xch,
> +                                         uint32_t domid,
> +                                         uint16_t nr_sids,
> +                                         uint32_t first_psid,
> +                                         uint32_t phandle,
> +                                         uint32_t *first_vsid)
> +{
> +    int err;
> +    struct xen_domctl domctl = {};
> +
> +    domctl.cmd = XEN_DOMCTL_viommu_alloc_vsid_range;
> +    domctl.domain = domid;
> +    domctl.u.viommu_alloc_vsid_range.first_psid = first_psid;
> +    domctl.u.viommu_alloc_vsid_range.phandle = phandle;
> +    domctl.u.viommu_alloc_vsid_range.nr_sids = nr_sids;
> +
> +    if ( (err = do_domctl(xch, &domctl)) != 0 )
> +        return err;
> +
> +    *first_vsid = domctl.u.viommu_alloc_vsid_range.first_vsid;
> +
> +    return 0;
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index daaa81f2aa..75c6f8efc5 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -1322,11 +1322,96 @@ static int copy_partial_fdt(libxl__gc *gc, void *fdt, void *pfdt)
>       return 0;
>   }
>   
> -static int modify_partial_fdt(libxl__gc *gc, void *pfdt)
> +/*
> + * Store virtualized 'iommus' properties for every node attached to IOMMU
> + * and passthroughed to guest.
> + * Used as a lookup table for mapping <phandle pSID> -> <vhandle vSID>
> + */
> +struct viommu_stream {
> +    XEN_LIST_ENTRY(struct viommu_stream) entry;
> +    char path[128];          /* DT path, stable across resizes */
> +    fdt32_t *iommus;         /* fully virtualized iommus property */
> +};
> +
> +static XEN_LIST_HEAD(, struct viommu_stream) viommu_stream_list;


Looks like ^^^ is keyed only by DT path ...


> +
> +/*
> + * Helper function which creates mapping of dt node to
> + * to virtualized 'iommus' property
> + * Mappings stored in a global 'viommu_stream_list' to
> + * make it reusable for every fdt resize
> + */
> +static int viommu_get_stream(libxl__gc *gc,
> +                             uint32_t domid,
> +                             const fdt32_t *prop,
> +                             int proplen,
> +                             const char* path, fdt32_t **iommus)
>   {
> -    int nodeoff, proplen, i, r;
> +    int i, r;
> +    uint32_t vsid, psid, phandle;
> +    struct viommu_stream *viommu_stream;
> +
> +    /* Lookup if stream for target device is already allocated */
> +    XEN_LIST_FOREACH(viommu_stream, &viommu_stream_list, entry)
> +    {
> +        if (!strcmp(viommu_stream->path, path)) {
> +            *iommus = viommu_stream->iommus;
> +            return 0;
> +        }
> +    }

  ... a second domain with the same DT path gets the first domain’s 
cached vSIDs without any mapping being created for it. Is it ok?


> +
> +    /* Allocate new viommu stream */
> +    viommu_stream = malloc(sizeof(struct viommu_stream));
> +    if (!viommu_stream)
> +        return ERROR_NOMEM;
> +    memset(viommu_stream, 0, sizeof(struct viommu_stream));
> +    viommu_stream->iommus = malloc(proplen);
> +    if (!viommu_stream->iommus) {
> +        free(viommu_stream);
> +        return ERROR_NOMEM;
> +    }
> +    memset(viommu_stream->iommus, 0, proplen);
> +
> +    LOG(DEBUG, "Creating vIOMMU stream for device %s",
> +        path);
> +
> +    /*
> +     * Virtualize device "iommus" property
> +     * (replace pIOMMU with vIOMMU phandle and pSIDs with mapped vSIDs)
> +     */
> +    for (i = 0; i < proplen / 8; ++i) {
> +        /* Allocate new vSID mapped to pSID and physical IOMMU */
> +        phandle = fdt32_to_cpu(prop[i * 2]);
> +        psid = fdt32_to_cpu(prop[i * 2 + 1]);
> +        r = xc_domain_viommu_allocate_vsid_range(CTX->xch, domid, 1, psid,
> +                                                 phandle, &vsid);
> +        if (r) {
> +            LOG(ERROR, "Can't allocate new vSID/vRID for guest IOMMU device");
> +            return r;
> +        }
> +        viommu_stream->iommus[i * 2] = cpu_to_fdt32(GUEST_PHANDLE_VSMMUV3);
> +        viommu_stream->iommus[i * 2 + 1] = cpu_to_fdt32(vsid);
> +        LOG(DEBUG, "Mapped vSID: %u to pSID: %u", vsid, psid);
> +    }
> +
> +    strcpy(viommu_stream->path, path);
> +    *iommus = viommu_stream->iommus;
> +
> +    XEN_LIST_INSERT_HEAD(&viommu_stream_list, viommu_stream, entry);
> +
> +    return 0;
> +}
> +
> +/*
> + * Used to update partial fdt when vIOMMU is enabled
> + * Maps dt properties of IOMMU devices to virtual IOMMU
> + */
> +static int viommu_modify_partial_fdt(libxl__gc *gc, void *pfdt, uint32_t domid)
> +{
> +    int nodeoff, proplen, r;
>       const fdt32_t *prop;
>       fdt32_t *prop_c;
> +    char path[128];
>   
>       nodeoff = fdt_path_offset(pfdt, "/passthrough");
>       if (nodeoff < 0)
> @@ -1340,11 +1425,16 @@ static int modify_partial_fdt(libxl__gc *gc, void *pfdt)
>           if (!prop)
>               continue;
>   
> -        prop_c = libxl__zalloc(gc, proplen);
> +        r = fdt_get_path(pfdt, nodeoff, path, sizeof(path));
> +        if ( r < 0 ) {
> +            LOG(ERROR, "Can't get passthrough node path");
> +            return r;
> +        }
>   
> -        for (i = 0; i < proplen / 8; ++i) {
> -            prop_c[i * 2] = cpu_to_fdt32(GUEST_PHANDLE_VSMMUV3);
> -            prop_c[i * 2 + 1] = prop[i * 2 + 1];
> +        r = viommu_get_stream(gc, domid, prop, proplen, path, &prop_c);
> +        if (r) {
> +            LOG(ERROR, "Can't get viommu stream");
> +            return r;
>           }
>   
>           r = fdt_setprop(pfdt, nodeoff, "iommus", prop_c, proplen);
> @@ -1356,7 +1446,6 @@ static int modify_partial_fdt(libxl__gc *gc, void *pfdt)
>   
>       return 0;
>   }
> -
>   #else
>   
>   static int check_partial_fdt(libxl__gc *gc, void *fdt, size_t size)
> @@ -1375,7 +1464,7 @@ static int copy_partial_fdt(libxl__gc *gc, void *fdt, void *pfdt)
>       return -FDT_ERR_INTERNAL;
>   }
>   
> -static int modify_partial_fdt(libxl__gc *gc, void *pfdt)
> +static int viommu_modify_partial_fdt(libxl__gc *gc, void *pfdt, uint32_t domid)
>   {
>       LOG(ERROR, "partial device tree not supported");
>   
> @@ -1507,7 +1596,7 @@ next_resize:
>           if (info->arch_arm.viommu_type == LIBXL_VIOMMU_TYPE_SMMUV3) {
>               FDT( make_vsmmuv3_node(gc, fdt, ainfo, dom) );
>               if (pfdt)
> -                FDT( modify_partial_fdt(gc, pfdt) );
> +                FDT( viommu_modify_partial_fdt(gc, pfdt, dom->guest_domid) );
>           }
>   
>           for (i = 0; i < d_config->num_disks; i++) {
> diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
> index b76af56fad..dc21dc9fca 100644
> --- a/xen/arch/arm/domctl.c
> +++ b/xen/arch/arm/domctl.c
> @@ -16,6 +16,7 @@
>   #include <xen/types.h>
>   #include <xsm/xsm.h>
>   #include <public/domctl.h>
> +#include <asm/viommu.h>
>   
>   void arch_get_domain_info(const struct domain *d,
>                             struct xen_domctl_getdomaininfo *info)
> @@ -186,6 +187,43 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>       }
>       case XEN_DOMCTL_dt_overlay:
>           return dt_overlay_domctl(d, &domctl->u.dt_overlay);
> +
> +#ifdef CONFIG_ARM_VIRTUAL_IOMMU
> +    case XEN_DOMCTL_viommu_alloc_vsid_range:
> +    {
> +        int rc = 0;
> +        uint16_t i;
> +        uint32_t vsid;
> +        struct xen_domctl_viommu_alloc_vsid_range *vsid_range =
> +            &domctl->u.viommu_alloc_vsid_range;
> +
> +        if ( vsid_range->pad )
> +            return -EINVAL;
> +
> +        for ( i = 0; i < vsid_range->nr_sids; i++ )
> +        {
> +            rc = viommu_allocate_vsid(d, vsid_range->first_psid
> +                                          + i,
> +                                          vsid_range->phandle,
> +                                          &vsid);
> +            if( rc )
> +                return rc;
> +        }
> +
> +        if ( !rc )
> +        {
> +            /* Calculate first vSID from allocated range */
> +            vsid_range->first_vsid = vsid -
> +                vsid_range->nr_sids + 1;

With vsid_range->nr_sids == 0, vsid stays uninitialised and garbage is 
copied back to the caller.


> +            rc = copy_to_guest(u_domctl, domctl, 1);
> +            if ( rc )
> +                rc = -EFAULT;
> +        }
> +
> +        return rc;
> +    }
> +#endif
> +
>       default:
>           return subarch_do_domctl(domctl, d, u_domctl);
>       }
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 510300bb67..2708215d5b 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -1279,6 +1279,26 @@ struct xen_domctl_get_domain_state {
>       uint64_t unique_id;      /* Unique domain identifier. */
>   };
>   
> +/*
> + * XEN_DOMCTL_viommu_alloc_vsid_range
> + *
> + * Allocate guest vSID range and
> + * establish pSID->vSID mapping for target range and physical IOMMU (phandle).
> + * Allocated range is continous
> + */
> +struct xen_domctl_viommu_alloc_vsid_range {
> +    /* IN: Range first pSID  */
> +    uint32_t first_psid;
> +    /* IN: Physical IOMMU phandle behind which the target device streams are configured */
> +    uint32_t phandle;
> +    /* IN: Number of vSIDs to allocate */
> +    uint16_t nr_sids;
> +    /* padding, must be 0 */
> +    uint16_t pad;
> +    /* OUT: Mapped range first vSID */
> +    uint32_t first_vsid;
> +};
> +
>   struct xen_domctl {
>   /* Stable domctl ops: interface_version is required to be 0.  */
>       uint32_t cmd;
> @@ -1371,6 +1391,7 @@ struct xen_domctl {
>   #define XEN_DOMCTL_gsi_permission                88
>   #define XEN_DOMCTL_set_llc_colors                89
>   #define XEN_DOMCTL_get_domain_state              90 /* stable interface */
> +#define XEN_DOMCTL_viommu_alloc_vsid_range       91
>   #define XEN_DOMCTL_gdbsx_guestmemio            1000
>   #define XEN_DOMCTL_gdbsx_pausevcpu             1001
>   #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
> @@ -1439,6 +1460,7 @@ struct xen_domctl {
>   #endif
>           struct xen_domctl_set_llc_colors    set_llc_colors;
>           struct xen_domctl_get_domain_state  get_domain_state;
> +        struct xen_domctl_viommu_alloc_vsid_range viommu_alloc_vsid_range;
>           uint8_t                             pad[128];
>       } u;
>   };
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index d65ba0aeae..6321b4308b 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -881,6 +881,10 @@ static int cf_check flask_domctl(struct domain *d, struct xen_domctl *op)
>       case XEN_DOMCTL_set_llc_colors:
>           return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__SET_LLC_COLORS);
>   
> +    case XEN_DOMCTL_viommu_alloc_vsid_range:
> +        return current_has_perm(d, SECCLASS_DOMAIN2,
> +            DOMAIN2__VIOMMU_ALLOC_VSID_RANGE);
> +
>       default:
>           return avc_unknown_permission("domctl", op->cmd);
>       }
> diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/access_vectors
> index bbb9c117ec..35acbefab2 100644
> --- a/xen/xsm/flask/policy/access_vectors
> +++ b/xen/xsm/flask/policy/access_vectors
> @@ -253,6 +253,8 @@ class domain2
>       set_llc_colors
>   # XEN_DOMCTL_get_domain_state
>       get_domain_state
> +# XEN_DOMCTL_viommu_alloc_vsid_range
> +    viommu_alloc_vsid_range
>   }
>   
>   # Similar to class domain, but primarily contains domctls related to HVM domains


