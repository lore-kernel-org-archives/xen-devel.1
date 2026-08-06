Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4B8C55174
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 00:57:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384025.1627103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrmPm-0002cN-Cj; Thu, 06 Aug 2026 00:56:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384025.1627103; Thu, 06 Aug 2026 00:56:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrmPm-0002cG-9D; Thu, 06 Aug 2026 00:56:54 +0000
Received: by outflank-mailman (input) for mailman id 1384025;
 Thu, 06 Aug 2026 00:56:53 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wrmPl-0002cA-5u
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 00:56:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrmPk-008dks-JN
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 02:56:52 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a73dbd4-5cb7-0a2a0a5109dd-0a2a450a9434-0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 02:56:52 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a73dbd2-f2d2-0a2a450a0019-888fbc335296-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 02:56:52 +0200
Received: by mx.zohomail.com with SMTPS id 1785977800385533.5825905966658;
 Wed, 5 Aug 2026 17:56:40 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1785977802; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iZsKCXGWV5ncS4CWyXh+taLTBrQs2p/s3mJdCXcF37pgFd49ikL+YxdR9iMjVzN46KwhTd8HnN7y3tKqUIR9HYgo0VJ4Txn3PAT/bP20vWF4JLkxulgnMr8r1fCTKa0qwYL6GHGt1rBoxh8dI2Ie83ipom5WCxCZZaEhu55hx8U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785977802; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=iueZ3QDZK5JeDTaKUrqRN8sWfPVwnmJv7o+5G5s4yXU=; 
	b=IeZuRVaR3q8e7/tqgSZE3QnBZSTNroj7CrosfRKZ7JhoXiAgKC/4rs6dLSmlkgIxx86Xtr/BZ4gBzHwetxP2vu+wbtj3Blm3x8Z1BpiFyMzKLGyCZbxrVOMY9TFbK2WLp7Hwp2jjX+tctiY8B5g/PnPS3T3gDQ14vZLoLL3fyYM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785977802;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=iueZ3QDZK5JeDTaKUrqRN8sWfPVwnmJv7o+5G5s4yXU=;
	b=BiPQE1bEzIJPrdUlEo4olIewbTJetPUpSluO9mhdDIIDdmzqdNYKD3wl4z1jC87R
	GXRKZWLU7V9sIU5Xh5bkRtrj3TFUdAnQHt7WHloTseGvEhM9EJHHqvbvA/NWHRxS2Ud
	YOHVkUGJMniFoGEQFwDh23k+IjMAkX+94Kf3kQXg=
Message-ID: <3b9803d1-5d07-42c4-8295-fb399b1cdd71@apertussolutions.com>
Date: Wed, 5 Aug 2026 20:56:44 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/24] XSM: convert "allow" (Flask: "access") parameters
 to bool
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <dc7d05da-ace4-4dc9-ad55-bdb178dfbee0@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <dc7d05da-ace4-4dc9-ad55-bdb178dfbee0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-4011c0/1785977812-59DDFCFC-1A9C3BDD/0/0
X-purgate-type: clean
X-purgate-size: 10045

On 7/28/26 9:23 AM, Jan Beulich wrote:
> These are boolean, so they should always have used bool (originally
> bool_t), not uint8_t. Leverage recent changes to arrange for this with
> (now) fewer places which need changing (within the XSM machinery itself).
> Adjust call sites as well, where the conversion wasn't done so far.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Why is it that Arm doesn't use xsm_irq_permission() at all? Same for Arm64
> vs xsm_pci_config_permission().
> 
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -235,7 +235,7 @@ long arch_do_domctl(
>       {
>           unsigned int fp = domctl->u.ioport_permission.first_port;
>           unsigned int np = domctl->u.ioport_permission.nr_ports;
> -        int allow = domctl->u.ioport_permission.allow_access;
> +        bool allow = domctl->u.ioport_permission.allow_access;
>   
>           ret = -EINVAL;
>           if ( (fp + np) <= fp || (fp + np) > MAX_IOPORTS )
> @@ -306,7 +306,8 @@ long arch_do_domctl(
>               break;
>           }
>   
> -        ret = xsm_irq_permission(XSM_PRIV, d, irq, flags);
> +        ret = xsm_irq_permission(XSM_PRIV, d, irq,
> +                                 flags & XEN_DOMCTL_GSI_ACTION_MASK);
>           if ( ret )
>               break;
>   
> @@ -687,7 +688,7 @@ long arch_do_domctl(
>           unsigned int fgp = domctl->u.ioport_mapping.first_gport;
>           unsigned int fmp = domctl->u.ioport_mapping.first_mport;
>           unsigned int np = domctl->u.ioport_mapping.nr_ports;
> -        unsigned int add = domctl->u.ioport_mapping.add_mapping;
> +        bool add = domctl->u.ioport_mapping.add_mapping;
>           struct hvm_domain *hvm;
>           struct g2m_ioport *g2m_ioport;
>           int found = 0;
> --- a/xen/arch/x86/pci.c
> +++ b/xen/arch/x86/pci.c
> @@ -78,7 +78,7 @@ int pci_conf_write_intercept(unsigned in
>   {
>       struct pci_dev *pdev;
>       int rc = xsm_pci_config_permission(XSM_HOOK, current->domain, bdf,
> -                                       reg, reg + size - 1, 1);
> +                                       reg, reg + size - 1, true);
>   
>       if ( rc < 0 )
>           return rc;
> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -260,7 +260,7 @@ static bool pci_cfg_ok(struct domain *cu
>   
>       return !write ?
>              xsm_pci_config_permission(XSM_HOOK, currd, machine_bdf,
> -                                     start, start + size - 1, 0) == 0 :
> +                                     start, start + size - 1, false) == 0 :
>              pci_conf_write_intercept(0, machine_bdf, start, size, write) >= 0;
>   }
>   
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -505,21 +505,21 @@ static XSM_INLINE int xsm_unmap_domain_i
>   }
>   
>   static XSM_INLINE int xsm_irq_permission(
> -    XSM_DEFAULT_ARG struct domain *d, int pirq, uint8_t allow)
> +    XSM_DEFAULT_ARG struct domain *d, int pirq, bool allow)
>   {
>       XSM_ASSERT_ACTION(XSM_PRIV);
>       return xsm_default_action(action, current->domain, d);
>   }
>   
>   static XSM_INLINE int xsm_iomem_permission(
> -    XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
> +    XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, bool allow)
>   {
>       XSM_ASSERT_ACTION(XSM_PRIV);
>       return xsm_default_action(action, current->domain, d);
>   }
>   
>   static XSM_INLINE int xsm_iomem_mapping(
> -    XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
> +    XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, bool allow)
>   {
>       XSM_ASSERT_ACTION(XSM_DM_PRIV);
>       return xsm_default_action(action, current->domain, d);
> @@ -527,7 +527,7 @@ static XSM_INLINE int xsm_iomem_mapping(
>   
>   #ifdef CONFIG_HAS_VPCI
>   static XSM_INLINE int xsm_iomem_mapping_vpci(
> -    XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
> +    XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, bool allow)
>   {
>       XSM_ASSERT_ACTION(XSM_HOOK);
>       return xsm_default_action(action, current->domain, d);
> @@ -537,7 +537,7 @@ static XSM_INLINE int xsm_iomem_mapping_
>   #ifdef CONFIG_HAS_PCI
>   static XSM_INLINE int xsm_pci_config_permission(
>       XSM_DEFAULT_ARG struct domain *d, uint32_t machine_bdf, uint16_t start,
> -    uint16_t end, uint8_t access)
> +    uint16_t end, bool access)
>   {
>       XSM_ASSERT_ACTION(XSM_HOOK);
>       return xsm_default_action(action, current->domain, d);
> @@ -711,14 +711,14 @@ static XSM_INLINE int xsm_priv_mapping(
>   #endif
>   
>   static XSM_INLINE int xsm_ioport_permission(
> -    XSM_DEFAULT_ARG struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
> +    XSM_DEFAULT_ARG struct domain *d, uint32_t s, uint32_t e, bool allow)
>   {
>       XSM_ASSERT_ACTION(XSM_PRIV);
>       return xsm_default_action(action, current->domain, d);
>   }
>   
>   static XSM_INLINE int xsm_ioport_mapping(
> -    XSM_DEFAULT_ARG struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
> +    XSM_DEFAULT_ARG struct domain *d, uint32_t s, uint32_t e, bool allow)
>   {
>       XSM_ASSERT_ACTION(XSM_DM_PRIV);
>       return xsm_default_action(action, current->domain, d);
> --- a/xen/include/xsm/hooks.h
> +++ b/xen/include/xsm/hooks.h
> @@ -77,12 +77,12 @@ XSM_HOOK(int, unmap_domain_irq, struct d
>   XSM_HOOK(int, bind_pt_irq, struct domain *, struct xen_domctl_bind_pt_irq *)
>   XSM_HOOK(int, unbind_pt_irq, struct domain *, struct xen_domctl_bind_pt_irq *)
>   
> -XSM_HOOK(int, irq_permission, struct domain *, int, uint8_t)
> -XSM_HOOK(int, iomem_permission, struct domain *, uint64_t, uint64_t, uint8_t)
> +XSM_HOOK(int, irq_permission, struct domain *, int, bool)
> +XSM_HOOK(int, iomem_permission, struct domain *, uint64_t, uint64_t, bool)
>   
> -XSM_HOOK(int, iomem_mapping, struct domain *, uint64_t, uint64_t, uint8_t)
> +XSM_HOOK(int, iomem_mapping, struct domain *, uint64_t, uint64_t, bool)
>   #ifdef CONFIG_HAS_VPCI
> -XSM_HOOK(int, iomem_mapping_vpci, struct domain *, uint64_t, uint64_t, uint8_t)
> +XSM_HOOK(int, iomem_mapping_vpci, struct domain *, uint64_t, uint64_t, bool)
>   #endif
>   
>   #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
> @@ -97,7 +97,7 @@ XSM_HOOK(int, resource_setup_misc)
>   XSM_HOOK(int, resource_setup_pci, uint32_t)
>   XSM_HOOK(int, resource_setup_gsi, int)
>   XSM_HOOK(int, pci_config_permission, struct domain *, uint32_t, uint16_t,
> -                                     uint16_t, uint8_t)
> +                                     uint16_t, bool)
>   #endif
>   
>   #ifdef CONFIG_HYPFS
> @@ -144,8 +144,8 @@ XSM_HOOK(int, update_va_mapping, struct
>   #if defined(CONFIG_PV) || defined(CONFIG_SHADOW_PAGING)
>   XSM_HOOK(int, priv_mapping, struct domain *, struct domain *)
>   #endif
> -XSM_HOOK(int, ioport_permission, struct domain *, uint32_t, uint32_t, uint8_t)
> -XSM_HOOK(int, ioport_mapping, struct domain *, uint32_t, uint32_t, uint8_t)
> +XSM_HOOK(int, ioport_permission, struct domain *, uint32_t, uint32_t, bool)
> +XSM_HOOK(int, ioport_mapping, struct domain *, uint32_t, uint32_t, bool)
>   XSM_HOOK(int, pmu_op, struct domain *, unsigned int)
>   #endif /* CONFIG_X86 */
>   
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -998,7 +998,7 @@ static int cf_check flask_sysctl(const s
>   }
>   #endif /* CONFIG_SYSCTL */
>   
> -static inline uint32_t resource_to_perm(uint8_t access)
> +static inline uint32_t resource_to_perm(bool access)
>   {
>       if ( access )
>           return RESOURCE__ADD;
> @@ -1166,7 +1166,7 @@ static int cf_check flask_unbind_pt_irq(
>   }
>   
>   static int cf_check flask_irq_permission(
> -    struct domain *d, int pirq, uint8_t access)
> +    struct domain *d, int pirq, bool access)
>   {
>       /* the PIRQ number is not useful; real IRQ is checked during mapping */
>       return current_has_perm(d, SECCLASS_RESOURCE, resource_to_perm(access));
> @@ -1199,7 +1199,7 @@ static int cf_check _iomem_has_perm(
>   }
>   
>   static int cf_check flask_iomem_permission(
> -    struct domain *d, uint64_t start, uint64_t end, uint8_t access)
> +    struct domain *d, uint64_t start, uint64_t end, bool access)
>   {
>       struct iomem_has_perm_data data;
>       int rc;
> @@ -1221,7 +1221,8 @@ static int cf_check flask_iomem_permissi
>       return security_iterate_iomem_sids(start, end, _iomem_has_perm, &data);
>   }
>   
> -static int cf_check flask_iomem_mapping(struct domain *d, uint64_t start, uint64_t end, uint8_t access)
> +static int cf_check flask_iomem_mapping(
> +    struct domain *d, uint64_t start, uint64_t end, bool access)
>   {
>       return flask_iomem_permission(d, start, end, access);
>   }
> @@ -1230,7 +1231,7 @@ static int cf_check flask_iomem_mapping(
>   #ifdef CONFIG_HAS_PCI
>   static int cf_check flask_pci_config_permission(
>       struct domain *d, uint32_t machine_bdf, uint16_t start, uint16_t end,
> -    uint8_t access)
> +    bool access)
>   {
>       uint32_t dsid, rsid;
>       int rc = -EPERM;
> @@ -1709,7 +1710,7 @@ static int cf_check _ioport_has_perm(
>   }
>   
>   static int cf_check flask_ioport_permission(
> -    struct domain *d, uint32_t start, uint32_t end, uint8_t access)
> +    struct domain *d, uint32_t start, uint32_t end, bool access)
>   {
>       int rc;
>       struct ioport_has_perm_data data;
> @@ -1733,7 +1734,7 @@ static int cf_check flask_ioport_permiss
>   }
>   
>   static int cf_check flask_ioport_mapping(
> -    struct domain *d, uint32_t start, uint32_t end, uint8_t access)
> +    struct domain *d, uint32_t start, uint32_t end, bool access)
>   {
>       return flask_ioport_permission(d, start, end, access);
>   }
> 

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

