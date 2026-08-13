Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4812C5B572
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 11:27:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389834.1630453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuTb0-0000GR-Fl; Thu, 13 Aug 2026 11:27:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389834.1630453; Thu, 13 Aug 2026 11:27:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuTb0-0000GI-C3; Thu, 13 Aug 2026 11:27:38 +0000
Received: by outflank-mailman (input) for mailman id 1389834;
 Thu, 13 Aug 2026 11:27:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wuTay-0000Fy-UB
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 11:27:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuTay-00H70j-Au
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 13:27:36 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a7daa1d-8faa-0a2a0a5109dd-0a2a450ad17a-30
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 13:27:36 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a7daa26-f2d2-0a2a450a0019-888fbc3352c6-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 13:27:35 +0200
Received: by mx.zohomail.com with SMTPS id 1786620441386524.7328948269907;
 Thu, 13 Aug 2026 04:27:21 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1786620444; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fHqdvGRcb6wrzMOoIRam9IX4ayEptkdTGCKNWohYrJU4BqG1+mLBmvNybRkgz2QDjjWUvxQhpz2raE5OuRKjlUPUev55Jd4COXEMqMn2zwRq2g983fuXHmrDixmnPt96BtP4Grkc/6pZaNfYrCrLdZNgZ1Uhv+o0p3/ENmg/HrM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786620444; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=stczR2Ah1DqG8rzItUsURRBptW8wxv4DGN+dWLU5PWM=; 
	b=f7nZREIlTBdfZQ2a+41ctsjHonO3fo+Nc0xSTgLRQHq4grEOTb4Jyca/x3IMreewRd864SwT8mTbaN6v6DClaklhaNO3zqEibuQoA7SHKPV8ajl2/WH78yxPOAiMY+GpmKY7k3RXUVoZKdbnGwtd89iN4f/cUWzA5IvYT0o6Yyk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786620444;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=stczR2Ah1DqG8rzItUsURRBptW8wxv4DGN+dWLU5PWM=;
	b=XGyH+lNHeovSvzwoFtikmvrvKs70gAFC0XwG1+qoeaDHV0SNRAI6Z2hOo7jgREiY
	HpDOuYQeJkGOy0sB+a9PGxfpbZZcwTaAWFDBezyMm3t7YnZY5IDStTPccugH+hV4NnP
	i538yNfSnl5TDtWCcBhwaJb79EG9tGObQXhzWD/4=
Message-ID: <de3d9929-d14e-4d51-854a-ed0c94801ea5@apertussolutions.com>
Date: Thu, 13 Aug 2026 07:27:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/24] XSM: fold xsm_{,un}map_domain_irq() hooks
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <e2e0a2d4-0b18-400a-a5aa-4507c1e8a7b2@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <e2e0a2d4-0b18-400a-a5aa-4507c1e8a7b2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-4011c0/1786620456-526DECFC-9FFB6084/0/0
X-purgate-type: clean
X-purgate-size: 4794

On 7/28/26 9:26 AM, Jan Beulich wrote:
> Like other resource management hooks they are (now) mainly different in
> "add resource" vs "remove resource". Hence like in other cases a single
> hook can easily serve both purposes, with minor tweaking of
> flask_map_domain_irq(). While adjusting that function, also defer the
> setting of local variables only needed in the "map" case.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/arm/domctl.c
> +++ b/xen/arch/arm/domctl.c
> @@ -100,7 +100,7 @@ long arch_do_domctl(struct xen_domctl *d
>            * done by the 2 hypercalls for consistency with other
>            * architectures.
>            */
> -        rc = xsm_map_domain_irq(XSM_HOOK, d, irq, NULL);
> +        rc = xsm_map_domain_irq(XSM_HOOK, d, irq, NULL, true);
>           if ( rc )
>               return rc;
>   
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -2214,7 +2214,7 @@ int map_domain_pirq(
>           return 0;
>       }
>   
> -    ret = xsm_map_domain_irq(XSM_HOOK, d, irq, msi ? &msi->sbdf : NULL);
> +    ret = xsm_map_domain_irq(XSM_HOOK, d, irq, msi ? &msi->sbdf : NULL, true);
>       if ( ret )
>       {
>           dprintk(XENLOG_G_ERR, "dom%d: could not permit access to irq %d mapping to pirq %d\n",
> @@ -2441,8 +2441,8 @@ int unmap_domain_pirq(struct domain *d,
>        * domain.  Skip the XSM check since this is a Xen-initiated action.
>        */
>       if ( !d->is_dying )
> -        ret = xsm_unmap_domain_irq(XSM_HOOK, d, irq,
> -                                   msi_desc ? &msi_desc->dev->sbdf : NULL);
> +        ret = xsm_map_domain_irq(XSM_HOOK, d, irq,
> +                                 msi_desc ? &msi_desc->dev->sbdf : NULL, false);
>   
>       if ( ret )
>           goto done;
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -470,7 +470,8 @@ static XSM_INLINE int xsm_map_domain_pir
>   #endif /* CONFIG_HAS_PIRQ */
>   
>   static XSM_INLINE int xsm_map_domain_irq(
> -    XSM_DEFAULT_ARG struct domain *d, int irq, const pci_sbdf_t *sbdf)
> +    XSM_DEFAULT_ARG struct domain *d, int irq, const pci_sbdf_t *sbdf,
> +    bool allow)
>   {
>       XSM_ASSERT_ACTION(XSM_HOOK);
>       return xsm_default_action(action, current->domain, d);
> @@ -490,13 +491,6 @@ static XSM_INLINE int xsm_unbind_pt_irq(
>       return xsm_default_action(action, current->domain, d);
>   }
>   
> -static XSM_INLINE int xsm_unmap_domain_irq(
> -    XSM_DEFAULT_ARG struct domain *d, int irq, const pci_sbdf_t *sbdf)
> -{
> -    XSM_ASSERT_ACTION(XSM_HOOK);
> -    return xsm_default_action(action, current->domain, d);
> -}
> -
>   static XSM_INLINE int xsm_irq_permission(
>       XSM_DEFAULT_ARG struct domain *d, int pirq, bool allow)
>   {
> --- a/xen/include/xsm/hooks.h
> +++ b/xen/include/xsm/hooks.h
> @@ -71,8 +71,7 @@ XSM_HOOK(int, schedop_shutdown, struct d
>   XSM_HOOK(int, map_domain_pirq, struct domain *, bool)
>   #endif
>   
> -XSM_HOOK(int, map_domain_irq, struct domain *, int, const pci_sbdf_t *)
> -XSM_HOOK(int, unmap_domain_irq, struct domain *, int, const pci_sbdf_t *)
> +XSM_HOOK(int, map_domain_irq, struct domain *, int, const pci_sbdf_t *, bool)
>   XSM_HOOK(int, bind_pt_irq, struct domain *, struct xen_domctl_bind_pt_irq *)
>   XSM_HOOK(int, unbind_pt_irq, struct domain *, struct xen_domctl_bind_pt_irq *)
>   
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -1063,12 +1063,11 @@ static uint32_t flask_iommu_resource_use
>   }
>   
>   static int cf_check flask_map_domain_irq(
> -    struct domain *d, int irq, const pci_sbdf_t *sbdf)
> +    struct domain *d, int irq, const pci_sbdf_t *sbdf, bool access)
>   {
> -    uint32_t sid, dsid;
> +    uint32_t sid, dsid, dperm;
>       int rc = -EPERM;
>       struct avc_audit_data ad;
> -    uint32_t dperm = flask_iommu_resource_use_perm(d);
>   
>       if ( irq >= nr_static_irqs && sbdf )
>           rc = flask_map_domain_msi(d, irq, *sbdf, &sid, &ad);
> @@ -1078,33 +1077,16 @@ static int cf_check flask_map_domain_irq
>       if ( rc )
>           return rc;
>   
> -    dsid = domain_sid(d);
> -
> -    rc = avc_current_has_perm(sid, SECCLASS_RESOURCE, RESOURCE__ADD_IRQ, &ad);
> -    if ( rc )
> +    rc = avc_current_has_perm(sid, SECCLASS_RESOURCE,
> +                              access ? RESOURCE__ADD_IRQ : RESOURCE__REMOVE_IRQ,
> +                              &ad);
> +    if ( rc || access )

You've got this inverted. When `access == true`, i.e. the map operation, 
you are exiting here. When in fact the rest of the function is the 
final,and required perm check for map, but is now being enforced on the 
unmap operation where it is not needed.

v/r,
dps

