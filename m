Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017D4C55ABF
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 01:17:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384099.1627183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrmjD-0001v2-BU; Thu, 06 Aug 2026 01:16:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384099.1627183; Thu, 06 Aug 2026 01:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrmjD-0001uv-82; Thu, 06 Aug 2026 01:16:59 +0000
Received: by outflank-mailman (input) for mailman id 1384099;
 Thu, 06 Aug 2026 01:16:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wrmjB-0001ul-Uv
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 01:16:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrmjA-00Do4S-Sw
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 03:16:56 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a73e07b-2eae-0a2a0a5409dd-0a2a450983c2-12
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 03:16:56 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a73e087-be1a-0a2a45090019-888fbc3352a8-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 03:16:56 +0200
Received: by mx.zohomail.com with SMTPS id 1785979003559740.7769617646599;
 Wed, 5 Aug 2026 18:16:43 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=zoho header.d=apertussolutions.com header.i="dpsmith@apertussolutions.com" header.h="Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:Content-Type:Content-Transfer-Encoding"
ARC-Seal: i=1; a=rsa-sha256; t=1785979007; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=R8gJm8Zm80GT4sAWpV5I+3zGT3kpCqyLu81aDqKdnfcXoGKuUQhIC7cOURejOCEdBteqjSpgMb+cBSP09G6p+2fdHMOcWL6ZDJ1h0FEbbZuHlhf7A0dKQCY9JB6wkvOG5CSpKKo/RCCb/blk+Icuy+9waBUzfLuMU7e3ipfTEEo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785979007; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=V3/EhLMHE8sXOMAwNruXoiI8Fv5KpArkvZMGohzfTcI=; 
	b=OHqb1uJF0Ed8BDeOMVq0srEpg3z/97mferUtYLBY2/HqA1LtXUyNpjv8W19ShVk/TaBpdSxGSkxUGgzvYytUhcaLOZHoLukGdecVa1f/ilLn4Y4CIBQ3xpoZaLPLLKv1BsYgUiJkODcfv+IWQZrTyhdgxwom0b3+2B9nF4VCkr0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785979007;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=V3/EhLMHE8sXOMAwNruXoiI8Fv5KpArkvZMGohzfTcI=;
	b=jSXjrsSsS/6dm8pqDxEP9JVXaG7q3bgisy2QlyMEMnMczZ7dlGAXGWo56aLzW6Hw
	10bCJaH8Px3ezNxfHgwwGk5/MwULedB3Ogr2m6kau1jyeb8yY0gqLbwoL1dw9lULdtt
	N9zqGkrk0uvtZq5vhAD2kekK0hVPnpk6X84j7YAE=
Message-ID: <ba033c3d-dd62-4f94-b90c-0a749ba8b905@apertussolutions.com>
Date: Wed, 5 Aug 2026 21:16:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/24] XSM: pass just SBDF to xsm_{,un}map_domain_irq()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <a1c5dd1c-9b7b-4bc2-b202-7e2a4eb210e2@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <a1c5dd1c-9b7b-4bc2-b202-7e2a4eb210e2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-bad1c0/1785979016-BECDF034-D62AB649/0/0
X-purgate-type: clean
X-purgate-size: 5386

On 7/28/26 9:25 AM, Jan Beulich wrote:
> That's what Flask needs, and by unifying the hooks flask_map_domain_msi()
> can then also serve both flask_{,un}map_domain_irq().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> How come Arm doesn't use xsm_unmap_domain_irq()?
> 

I do not know, perhaps a gap in completeness. I would have to go study 
it to see if there was something more to it.

> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -2214,7 +2214,7 @@ int map_domain_pirq(
>           return 0;
>       }
>   
> -    ret = xsm_map_domain_irq(XSM_HOOK, d, irq, msi);
> +    ret = xsm_map_domain_irq(XSM_HOOK, d, irq, msi ? &msi->sbdf : NULL);
>       if ( ret )
>       {
>           dprintk(XENLOG_G_ERR, "dom%d: could not permit access to irq %d mapping to pirq %d\n",
> @@ -2442,7 +2442,7 @@ int unmap_domain_pirq(struct domain *d,
>        */
>       if ( !d->is_dying )
>           ret = xsm_unmap_domain_irq(XSM_HOOK, d, irq,
> -                                   msi_desc ? msi_desc->dev : NULL);
> +                                   msi_desc ? &msi_desc->dev->sbdf : NULL);
>   
>       if ( ret )
>           goto done;
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -470,7 +470,7 @@ static XSM_INLINE int xsm_map_domain_pir
>   #endif /* CONFIG_HAS_PIRQ */
>   
>   static XSM_INLINE int xsm_map_domain_irq(
> -    XSM_DEFAULT_ARG struct domain *d, int irq, const void *data)
> +    XSM_DEFAULT_ARG struct domain *d, int irq, const pci_sbdf_t *sbdf)
>   {
>       XSM_ASSERT_ACTION(XSM_HOOK);
>       return xsm_default_action(action, current->domain, d);
> @@ -491,7 +491,7 @@ static XSM_INLINE int xsm_unbind_pt_irq(
>   }
>   
>   static XSM_INLINE int xsm_unmap_domain_irq(
> -    XSM_DEFAULT_ARG struct domain *d, int irq, const void *data)
> +    XSM_DEFAULT_ARG struct domain *d, int irq, const pci_sbdf_t *sbdf)
>   {
>       XSM_ASSERT_ACTION(XSM_HOOK);
>       return xsm_default_action(action, current->domain, d);
> --- a/xen/include/xsm/hooks.h
> +++ b/xen/include/xsm/hooks.h
> @@ -71,8 +71,8 @@ XSM_HOOK(int, schedop_shutdown, struct d
>   XSM_HOOK(int, map_domain_pirq, struct domain *, bool)
>   #endif
>   
> -XSM_HOOK(int, map_domain_irq, struct domain *, int, const void *)
> -XSM_HOOK(int, unmap_domain_irq, struct domain *, int, const void *)
> +XSM_HOOK(int, map_domain_irq, struct domain *, int, const pci_sbdf_t *)
> +XSM_HOOK(int, unmap_domain_irq, struct domain *, int, const pci_sbdf_t *)
>   XSM_HOOK(int, bind_pt_irq, struct domain *, struct xen_domctl_bind_pt_irq *)
>   XSM_HOOK(int, unbind_pt_irq, struct domain *, struct xen_domctl_bind_pt_irq *)
>   
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -1030,17 +1030,14 @@ static int cf_check flask_map_domain_pir
>   #endif /* CONFIG_HAS_PIRQ */
>   
>   static int flask_map_domain_msi (
> -    struct domain *d, int irq, const void *data, uint32_t *sid,
> +    struct domain *d, int irq, pci_sbdf_t sbdf, uint32_t *sid,
>       struct avc_audit_data *ad)
>   {
>   #ifdef CONFIG_HAS_PCI_MSI
> -    const struct msi_info *msi = data;
> -    uint32_t machine_bdf = msi->sbdf.sbdf;
> -
>       AVC_AUDIT_DATA_INIT(ad, DEV);
> -    ad->device = machine_bdf;
> +    ad->device = sbdf.sbdf;
>   
> -    return security_device_sid(machine_bdf, sid);
> +    return security_device_sid(sbdf.sbdf, sid);
>   #else
>       return -EINVAL;
>   #endif
> @@ -1066,15 +1063,15 @@ static uint32_t flask_iommu_resource_use
>   }
>   
>   static int cf_check flask_map_domain_irq(
> -    struct domain *d, int irq, const void *data)
> +    struct domain *d, int irq, const pci_sbdf_t *sbdf)
>   {
>       uint32_t sid, dsid;
>       int rc = -EPERM;
>       struct avc_audit_data ad;
>       uint32_t dperm = flask_iommu_resource_use_perm(d);
>   
> -    if ( irq >= nr_static_irqs && data )
> -        rc = flask_map_domain_msi(d, irq, data, &sid, &ad);
> +    if ( irq >= nr_static_irqs && sbdf )
> +        rc = flask_map_domain_msi(d, irq, *sbdf, &sid, &ad);
>       else
>           rc = get_irq_sid(irq, &sid, &ad);
>   
> @@ -1091,32 +1088,15 @@ static int cf_check flask_map_domain_irq
>       return rc;
>   }
>   
> -static int flask_unmap_domain_msi (
> -    struct domain *d, int irq, const void *data, uint32_t *sid,
> -    struct avc_audit_data *ad)
> -{
> -#ifdef CONFIG_HAS_PCI_MSI
> -    const struct pci_dev *pdev = data;
> -    uint32_t machine_bdf = (pdev->seg << 16) | (pdev->bus << 8) | pdev->devfn;
> -
> -    AVC_AUDIT_DATA_INIT(ad, DEV);
> -    ad->device = machine_bdf;
> -
> -    return security_device_sid(machine_bdf, sid);
> -#else
> -    return -EINVAL;
> -#endif
> -}
> -
>   static int cf_check flask_unmap_domain_irq(
> -    struct domain *d, int irq, const void *data)
> +    struct domain *d, int irq, const pci_sbdf_t *sbdf)
>   {
>       uint32_t sid;
>       int rc = -EPERM;
>       struct avc_audit_data ad;
>   
> -    if ( irq >= nr_static_irqs && data )
> -        rc = flask_unmap_domain_msi(d, irq, data, &sid, &ad);
> +    if ( irq >= nr_static_irqs && sbdf )
> +        rc = flask_map_domain_msi(d, irq, *sbdf, &sid, &ad);
>       else
>           rc = get_irq_sid(irq, &sid, &ad);
>   
> 

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

