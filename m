Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A0BC5B572
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 11:32:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389848.1630461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuTfy-0002Ps-0f; Thu, 13 Aug 2026 11:32:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389848.1630461; Thu, 13 Aug 2026 11:32:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuTfx-0002Pl-UC; Thu, 13 Aug 2026 11:32:45 +0000
Received: by outflank-mailman (input) for mailman id 1389848;
 Thu, 13 Aug 2026 11:32:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wuTfw-0002Pf-RN
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 11:32:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuTfv-00H7r5-U6
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 13:32:43 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a7dab55-2eae-0a2a0a5409dd-0a2a4508e3d0-20
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 13:32:43 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a7dab5a-f659-0a2a45080019-888fbc335273-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 13:32:43 +0200
Received: by mx.zohomail.com with SMTPS id 1786620748906836.2619879631395;
 Thu, 13 Aug 2026 04:32:28 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1786620751; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=E8QbpsG5rBg0+3mfZnmH7Hufa3kn2wZmrAz4MFqt7ZvcDyHGCqBg+CAGyX4IUZiviQ7XE6U9Z7VmykW0q5mafXe/qWZ6lZortUnPacadjDOa7mCiouMv/S668Eyr8Fy0O1xwy+VGg8D8n6G2WTzUWrHvdXTvvL1rUTRfntI7bNI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786620751; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KzQjx3T8ymqhNwfDiqzmKmkPXuphZZD9f7yVPKtNnD8=; 
	b=FEzM4Tqz9byet8G72Nw5LztHwJVNLNxP0bhVoVrDlBzGbX136gUZt39qEhEkKrcqg3Nu7fg9KPybcfDQqKx66uTud00L3NUjAqdb+ra9OCx5Zdp6CCsvoOMXnrjlislSBrH4FB8EAl8MATtrwjFZSlcuyx3x4PXSjv3/3PIPnRE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786620751;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=KzQjx3T8ymqhNwfDiqzmKmkPXuphZZD9f7yVPKtNnD8=;
	b=n0PAdj0t5U2j0UUW+lnx4PIt2WRXCu1XtXiCtTu1EAQz7ueKAP0YoGBWiXAdW1BS
	uvERuG9/f3PvbaxTi8h9SwN3S505ibgqqyZAgek20PeCQ4C8kBzploITNo5GYw3tzYE
	xrkdE9ajOBNt3RmYxXKzujCAUGtAaNBCN0kItii4=
Message-ID: <2a04c020-1adc-4c1a-8d64-bc737781c1ad@apertussolutions.com>
Date: Thu, 13 Aug 2026 07:32:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/24] XSM: fold xsm_{,un}bind_pt_irq() hooks
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
 <03d4456b-9e85-469c-a2a1-769faad67bb0@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <03d4456b-9e85-469c-a2a1-769faad67bb0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-c1860d/1786620763-CDF4787B-1E2E42E9/0/0
X-purgate-type: clean
X-purgate-size: 3923



On 7/28/26 9:26 AM, Jan Beulich wrote:
> Like other resource management hooks they are mainly different in "add
> resource" vs "remove resource". Hence like in other cases a single hook
> can easily serve both purposes, with minor tweaking of
> flask_bind_pt_irq(). While adjusting that function, also defer the setting
> of "dperm", which is only needed in the "map" case.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/arm/domctl.c
> +++ b/xen/arch/arm/domctl.c
> @@ -104,7 +104,7 @@ long arch_do_domctl(struct xen_domctl *d
>           if ( rc )
>               return rc;
>   
> -        rc = xsm_bind_pt_irq(XSM_DM_PRIV, d, bind);
> +        rc = xsm_bind_pt_irq(XSM_DM_PRIV, d, bind, true);
>           if ( rc )
>               return rc;
>   
> @@ -140,7 +140,7 @@ long arch_do_domctl(struct xen_domctl *d
>           if ( irq != virq )
>               return -EINVAL;
>   
> -        rc = xsm_unbind_pt_irq(XSM_DM_PRIV, d, bind);
> +        rc = xsm_bind_pt_irq(XSM_DM_PRIV, d, bind, false);
>           if ( rc )
>               return rc;
>   
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -622,7 +622,7 @@ long arch_do_domctl(
>           if ( !is_hvm_domain(d) )
>               break;
>   
> -        ret = xsm_bind_pt_irq(XSM_DM_PRIV, d, bind);
> +        ret = xsm_bind_pt_irq(XSM_DM_PRIV, d, bind, true);
>           if ( ret )
>               break;
>   
> @@ -660,7 +660,7 @@ long arch_do_domctl(
>           if ( !is_hvm_domain(d) )
>               break;
>   
> -        ret = xsm_unbind_pt_irq(XSM_DM_PRIV, d, bind);
> +        ret = xsm_bind_pt_irq(XSM_DM_PRIV, d, bind, false);
>           if ( ret )
>               break;
>   
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -478,14 +478,8 @@ static XSM_INLINE int xsm_map_domain_irq
>   }
>   
>   static XSM_INLINE int xsm_bind_pt_irq(
> -    XSM_DEFAULT_ARG struct domain *d, struct xen_domctl_bind_pt_irq *bind)
> -{
> -    XSM_ASSERT_ACTION(XSM_DM_PRIV);
> -    return xsm_default_action(action, current->domain, d);
> -}
> -
> -static XSM_INLINE int xsm_unbind_pt_irq(
> -    XSM_DEFAULT_ARG struct domain *d, struct xen_domctl_bind_pt_irq *bind)
> +    XSM_DEFAULT_ARG struct domain *d, struct xen_domctl_bind_pt_irq *bind,
> +    bool allow)
>   {
>       XSM_ASSERT_ACTION(XSM_DM_PRIV);
>       return xsm_default_action(action, current->domain, d);
> --- a/xen/include/xsm/hooks.h
> +++ b/xen/include/xsm/hooks.h
> @@ -72,8 +72,8 @@ XSM_HOOK(int, map_domain_pirq, struct do
>   #endif
>   
>   XSM_HOOK(int, map_domain_irq, struct domain *, int, const pci_sbdf_t *, bool)
> -XSM_HOOK(int, bind_pt_irq, struct domain *, struct xen_domctl_bind_pt_irq *)
> -XSM_HOOK(int, unbind_pt_irq, struct domain *, struct xen_domctl_bind_pt_irq *)
> +XSM_HOOK(int, bind_pt_irq, struct domain *, struct xen_domctl_bind_pt_irq *,
> +                           bool)
>   
>   XSM_HOOK(int, irq_permission, struct domain *, int, bool)
>   XSM_HOOK(int, iomem_permission, struct domain *, uint64_t, uint64_t, bool)
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -1090,16 +1090,15 @@ static int cf_check flask_map_domain_irq
>   }
>   
>   static int cf_check flask_bind_pt_irq(
> -    struct domain *d, struct xen_domctl_bind_pt_irq *bind)
> +    struct domain *d, struct xen_domctl_bind_pt_irq *bind, bool access)
>   {
> -    uint32_t dsid, rsid;
> +    uint32_t dsid, rsid, dperm;
>       int rc = -EPERM;
>       int irq;
>       struct avc_audit_data ad;
> -    uint32_t dperm = flask_iommu_resource_use_perm(d);
>   
> -    rc = current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__ADD);
> -    if ( rc )
> +    rc = current_has_perm(d, SECCLASS_RESOURCE, resource_to_perm(access));
> +    if ( rc || access )

Same as on patch 23, check is inverted.

v/r,
dps

