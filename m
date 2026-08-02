Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51DCC55175
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 14:53:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380843.1624537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqXZ2-0007MU-MH; Sun, 02 Aug 2026 14:53:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380843.1624537; Sun, 02 Aug 2026 14:53:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqXZ2-0007MN-Ja; Sun, 02 Aug 2026 14:53:20 +0000
Received: by outflank-mailman (input) for mailman id 1380843;
 Sun, 02 Aug 2026 14:53:20 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wqXZ1-0007MG-UM
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 14:53:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqXZ1-00EjZv-BK
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 16:53:19 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a6f5987-2eae-0a2a0a5409dd-0a2a4503c360-28
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 16:53:19 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a6f59dd-fae8-0a2a45030019-888fbc335283-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 16:53:19 +0200
Received: by mx.zohomail.com with SMTPS id 1785682393099230.6498974128616;
 Sun, 2 Aug 2026 07:53:13 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=zoho header.d=apertussolutions.com header.i="dpsmith@apertussolutions.com" header.h="Message-ID:Date:MIME-Version:Subject:To:From:In-Reply-To:Content-Type:Content-Transfer-Encoding"
ARC-Seal: i=1; a=rsa-sha256; t=1785682396; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=d/jEvwgzygpDUKscEvTENnwbGeqEQppbGQTHYTeGMeY/NizadalW2yDr3q8DWD/lY28Walnr+qoebhsijUXfBBIeEGVvjJJg38I2EeUa0ewVthp70/MWEDwWAXpq6DB6Kx1lAodH7HGOoQ0NjYu7cNwqi5M26GgzqOQ7q4wCo+w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785682396; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=MVNr6pdZlz2IwSoh48lq1aj/GJU09fj8XWglhHdstE4=; 
	b=OY5ygUpYC9t6cHdP2W1/ZdZpp9S2CFVfQTQ8r2wlMGwIl7irgEnw+WMZ8LKl0E/oiQKcLpcgHFpwF4d6horV+UaJJ5vsNkp6QkeXsMZBtngchMmbA3oQ1CeP1JIYRcDFdyTMZa9VjfarU/QN/6UnZKLLR04TADOIgtfiJBZ9AzA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785682396;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=MVNr6pdZlz2IwSoh48lq1aj/GJU09fj8XWglhHdstE4=;
	b=sdbVph9I/B6/a5Akzpjkd3Ey13f8D7tQFqHbksBzLvdUw/eJuPrjhETnY5QJju0G
	bvmGRyoFjjugEwGKsvKVpZ36SMi2GhoJJTNAtc003LrJxLM6RIYx34CHIbzxBHBP8zE
	zIAxrcO0TU82o640sy0768xuZnmuYjBguHWfvH/A=
Message-ID: <68ebf12b-453c-490e-a9a3-87aa64693183@apertussolutions.com>
Date: Sun, 2 Aug 2026 10:53:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/24] XSM: make PCI hooks dependent upon HAS_PCI=y
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <03267655-2c62-459a-abef-6a0a85a9fa44@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <03267655-2c62-459a-abef-6a0a85a9fa44@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-33051d/1785682399-6D2D84E9-A018125A/0/0
X-purgate-type: clean
X-purgate-size: 4988

On 7/28/26 9:14 AM, Jan Beulich wrote:
> They're unreachable / dead otherwise. Really resource_{,un}plug_pci() is
> further limited to PCI pass-through.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -394,6 +394,8 @@ static XSM_INLINE int cf_check xsm_get_d
>   }
>   #endif /* HAS_PASSTHROUGH && HAS_PCI */
>   
> +#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
> +
>   static XSM_INLINE int cf_check xsm_resource_plug_pci(
>       XSM_DEFAULT_ARG uint32_t machine_bdf)
>   {
> @@ -408,6 +410,10 @@ static XSM_INLINE int cf_check xsm_resou
>       return xsm_default_action(action, current->domain, NULL);
>   }
>   
> +#endif /* CONFIG_HAS_PASSTHROUGH && CONFIG_HAS_PCI */
> +
> +#ifdef CONFIG_HAS_PCI
> +
>   static XSM_INLINE int cf_check xsm_resource_setup_pci(
>       XSM_DEFAULT_ARG uint32_t machine_bdf)
>   {
> @@ -421,6 +427,8 @@ static XSM_INLINE int cf_check xsm_resou
>       return xsm_default_action(action, current->domain, NULL);
>   }
>   
> +#endif /* CONFIG_HAS_PCI */
> +
>   static XSM_INLINE int cf_check xsm_resource_setup_misc(XSM_DEFAULT_VOID)
>   {
>       XSM_ASSERT_ACTION(XSM_PRIV);
> @@ -524,6 +532,7 @@ static XSM_INLINE int cf_check xsm_iomem
>       return xsm_default_action(action, current->domain, d);
>   }
>   
> +#ifdef CONFIG_HAS_PCI
>   static XSM_INLINE int cf_check xsm_pci_config_permission(
>       XSM_DEFAULT_ARG struct domain *d, uint32_t machine_bdf, uint16_t start,
>       uint16_t end, uint8_t access)
> @@ -531,6 +540,7 @@ static XSM_INLINE int cf_check xsm_pci_c
>       XSM_ASSERT_ACTION(XSM_HOOK);
>       return xsm_default_action(action, current->domain, d);
>   }
> +#endif /* CONFIG_HAS_PCI */
>   
>   static XSM_INLINE int cf_check xsm_add_to_physmap(
>       XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
> --- a/xen/include/xsm/hooks.h
> +++ b/xen/include/xsm/hooks.h
> @@ -77,21 +77,24 @@ XSM_HOOK(int, unbind_pt_irq, struct doma
>   
>   XSM_HOOK(int, irq_permission, struct domain *, int, uint8_t)
>   XSM_HOOK(int, iomem_permission, struct domain *, uint64_t, uint64_t, uint8_t)
> -XSM_HOOK(int, pci_config_permission, struct domain *, uint32_t, uint16_t,
> -                                     uint16_t, uint8_t)
>   
>   XSM_HOOK(int, iomem_mapping, struct domain *, uint64_t, uint64_t, uint8_t)
>   XSM_HOOK(int, iomem_mapping_vpci, struct domain *, uint64_t, uint64_t, uint8_t)
>   
>   #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
> +XSM_HOOK(int, resource_plug_pci, uint32_t)
> +XSM_HOOK(int, resource_unplug_pci, uint32_t)
>   XSM_HOOK(int, get_device_group, uint32_t)
>   #endif
>   
> -XSM_HOOK(int, resource_plug_pci, uint32_t)
> -XSM_HOOK(int, resource_unplug_pci, uint32_t)
> +XSM_HOOK(int, resource_setup_misc)
> +
> +#ifdef CONFIG_HAS_PCI
>   XSM_HOOK(int, resource_setup_pci, uint32_t)
>   XSM_HOOK(int, resource_setup_gsi, int)
> -XSM_HOOK(int, resource_setup_misc)
> +XSM_HOOK(int, pci_config_permission, struct domain *, uint32_t, uint16_t,
> +                                     uint16_t, uint8_t)
> +#endif
>   
>   XSM_HOOK(int, hypfs_op)
>   
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -1225,6 +1225,7 @@ static int cf_check flask_iomem_mapping(
>   }
>   #define flask_iomem_mapping_vpci flask_iomem_mapping
>   
> +#ifdef CONFIG_HAS_PCI
>   static int cf_check flask_pci_config_permission(
>       struct domain *d, uint32_t machine_bdf, uint16_t start, uint16_t end,
>       uint8_t access)
> @@ -1250,6 +1251,7 @@ static int cf_check flask_pci_config_per
>       return avc_has_perm(dsid, rsid, SECCLASS_RESOURCE, perm, &ad);
>   
>   }
> +#endif /* CONFIG_HAS_PCI */
>   
>   #if defined(CONFIG_SYSCTL) || defined(CONFIG_X86)
>   static int flask_resource_plug_core(void)
> @@ -1270,6 +1272,8 @@ static int flask_resource_use_core(void)
>   }
>   #endif /* CONFIG_SYSCTL */
>   
> +#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
> +
>   static int cf_check flask_resource_plug_pci(uint32_t machine_bdf)
>   {
>       uint32_t rsid;
> @@ -1300,6 +1304,10 @@ static int cf_check flask_resource_unplu
>       return avc_current_has_perm(rsid, SECCLASS_RESOURCE, RESOURCE__UNPLUG, &ad);
>   }
>   
> +#endif /* CONFIG_HAS_PASSTHROUGH && CONFIG_HAS_PCI */
> +
> +#ifdef CONFIG_HAS_PCI
> +
>   static int cf_check flask_resource_setup_pci(uint32_t machine_bdf)
>   {
>       uint32_t rsid;
> @@ -1328,6 +1336,8 @@ static int cf_check flask_resource_setup
>       return avc_current_has_perm(rsid, SECCLASS_RESOURCE, RESOURCE__SETUP, &ad);
>   }
>   
> +#endif /* CONFIG_HAS_PCI */
> +
>   static int cf_check flask_resource_setup_misc(void)
>   {
>       return avc_current_has_perm(SECINITSID_XEN, SECCLASS_RESOURCE, RESOURCE__SETUP, NULL);
> 

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

