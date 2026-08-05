Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB834C55ABF
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 22:38:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383920.1627012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrkFq-0001lO-6Z; Wed, 05 Aug 2026 22:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383920.1627012; Wed, 05 Aug 2026 22:38:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrkFq-0001lH-3r; Wed, 05 Aug 2026 22:38:30 +0000
Received: by outflank-mailman (input) for mailman id 1383920;
 Wed, 05 Aug 2026 22:38:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wrkFo-0001lB-5H
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 22:38:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrkFn-008Rbs-90
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 00:38:27 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a73bb0d-e002-0a2a0a5209dd-0a2a4503e7a4-46
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 00:38:27 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a73bb61-fae8-0a2a45030019-888fbc3352c7-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 00:38:26 +0200
Received: by mx.zohomail.com with SMTPS id 1785969494811920.453860135087;
 Wed, 5 Aug 2026 15:38:14 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1785969497; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WMZ0tV0vDY58A1Y2BQNAxpQ7qR3vhS2nDHJ5z6vK3NggI2JpKZlUuxQRO/TCMlPqmHJJsek04N0NaydwJ3LvtleXKutHbvedcQNwRvGXZ1K+zJ5osbI6BE0IFs8F6no14EdfDpEm6Z4ucqKbXScKRWGwSJFzLqfD3RlzM75EWBg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785969497; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ttnFYpU9leG8PdYp6bKDfbnCt02hGSvDeDU0wyx0J6M=; 
	b=OZjP6ViM/UGD1VPRjqlJ33uVjm0uvOk7hDgLP7rt9h7NWTNa7wyzXfzQs0U0wZ91r6PYZT3mVTjNcM/MwsTMrJ46SvLAK+9Uy8Pwo7B6UmZ3SfJlkVDBnmFl9ppqjIAuzOF11yUgPDUddQ9jLV6/+46pj3lMPfSL75RbEVlLUHM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785969497;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ttnFYpU9leG8PdYp6bKDfbnCt02hGSvDeDU0wyx0J6M=;
	b=Z8Ug7BYh1Rd3sa+dU5SlLQpddjmWhBCmFIkNoESM7vqEUhlSfW4k75gkeCjPsMO+
	Wa4pC79On7+tJbqjKNlJ/D7uL7+8AYdPg/ZxZhuAKH8QIUrDkoM6a5u7kTSrRzwsiQF
	zaV/3XzCAUoQF9SBwunB0tryCPuFeW5lJWNxxFxk=
Message-ID: <a5867626-3ff1-4210-a542-fb5ee8cedf57@apertussolutions.com>
Date: Wed, 5 Aug 2026 18:38:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/24] x86: restrict PHYSDEVOP_* when PV=n
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <5b3ba207-aa18-4ebe-9c8b-2ccf51240698@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <5b3ba207-aa18-4ebe-9c8b-2ccf51240698@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-33051d/1785969507-76AF94E9-E366E1AD/0/0
X-purgate-type: clean
X-purgate-size: 5015

On 7/28/26 9:19 AM, Jan Beulich wrote:
> hvm_physdev_op() permits through only a subset of sub-ops. The code
> handling other sub-ops is therefore unreachable when PV=n, violating MISRA
> C:2012 rule 2.1. With that the XSM .apic() hook also becomes unreachable /
> dead when PV=n.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> At least for the sub-ops using xsm_apic() IS_ENABLED() cannot be used.
> Therefore #ifdef is used throughout.
> 
> --- a/xen/arch/x86/physdev.c
> +++ b/xen/arch/x86/physdev.c
> @@ -233,6 +233,8 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
>           break;
>       }
>   
> +#ifdef CONFIG_PV
> +
>       case PHYSDEVOP_pirq_eoi_gmfn_v2:
>       case PHYSDEVOP_pirq_eoi_gmfn_v1: {
>           struct physdev_pirq_eoi_gmfn info;
> @@ -281,6 +283,8 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
>           break;
>       }
>   
> +#endif /* CONFIG_PV */
> +
>       case PHYSDEVOP_irq_status_query: {
>           struct physdev_irq_status_query irq_status_query;
>           ret = -EFAULT;
> @@ -379,6 +383,8 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
>           break;
>       }
>   
> +#ifdef CONFIG_PV
> +
>       case PHYSDEVOP_apic_read: {
>           struct physdev_apic apic;
>           ret = -EFAULT;
> @@ -524,6 +530,8 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
>           break;
>       }
>   
> +#endif /* CONFIG_PV */
> +
>       case PHYSDEVOP_pci_mmcfg_reserved: {
>           struct physdev_pci_mmcfg_reserved info;
>   
> @@ -558,6 +566,8 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
>           break;
>       }
>   
> +#ifdef CONFIG_PV
> +
>       case PHYSDEVOP_restore_msi: {
>           struct physdev_restore_msi restore_msi;
>           struct pci_dev *pdev;
> @@ -589,6 +599,8 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
>           break;
>       }
>   
> +#endif /* CONFIG_PV */
> +
>       case PHYSDEVOP_setup_gsi: {
>           struct physdev_setup_gsi setup_gsi;
>   
> @@ -608,6 +620,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
>                                 setup_gsi.polarity);
>           break;
>       }
> +
>       case PHYSDEVOP_get_free_pirq: {
>           struct physdev_get_free_pirq out;
>   
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -648,13 +648,6 @@ static XSM_INLINE int cf_check xsm_mem_s
>       return xsm_default_action(action, current->domain, cd);
>   }
>   
> -static XSM_INLINE int cf_check xsm_apic(
> -    XSM_DEFAULT_ARG struct domain *d, int cmd)
> -{
> -    XSM_ASSERT_ACTION(XSM_PRIV);
> -    return xsm_default_action(action, d, NULL);
> -}
> -
>   static XSM_INLINE int cf_check xsm_machine_memory_map(XSM_DEFAULT_VOID)
>   {
>       XSM_ASSERT_ACTION(XSM_PRIV);
> @@ -670,6 +663,13 @@ static XSM_INLINE int cf_check xsm_domai
>   
>   #ifdef CONFIG_PV
>   
> +static XSM_INLINE int cf_check xsm_apic(
> +    XSM_DEFAULT_ARG struct domain *d, int cmd)
> +{
> +    XSM_ASSERT_ACTION(XSM_PRIV);
> +    return xsm_default_action(action, d, NULL);
> +}
> +
>   static XSM_INLINE int cf_check xsm_do_mca(XSM_DEFAULT_VOID)
>   {
>       XSM_ASSERT_ACTION(XSM_PRIV);
> --- a/xen/include/xsm/hooks.h
> +++ b/xen/include/xsm/hooks.h
> @@ -131,10 +131,10 @@ XSM_HOOK(int, mem_sharing_op, struct dom
>   XSM_HOOK(int, platform_op, uint32_t)
>   
>   #ifdef CONFIG_X86
> -XSM_HOOK(int, apic, struct domain *, int)
>   XSM_HOOK(int, machine_memory_map)
>   XSM_HOOK(int, domain_memory_map, struct domain *)
>   #ifdef CONFIG_PV
> +XSM_HOOK(int, apic, struct domain *, int)
>   XSM_HOOK(int, do_mca)
>   XSM_HOOK(int, mmu_update, struct domain *, struct domain *, struct domain *,
>                             uint32_t)
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -1749,6 +1749,19 @@ static int cf_check flask_mem_sharing_op
>   }
>   #endif
>   
> +static int cf_check flask_machine_memory_map(void)
> +{
> +    return avc_current_has_perm(SECINITSID_XEN, SECCLASS_MMU, MMU__MEMORYMAP,
> +                                NULL);
> +}
> +
> +static int cf_check flask_domain_memory_map(struct domain *d)
> +{
> +    return current_has_perm(d, SECCLASS_MMU, MMU__MEMORYMAP);
> +}
> +
> +#ifdef CONFIG_PV
> +
>   static int cf_check flask_apic(struct domain *d, int cmd)
>   {
>       uint32_t perm;
> @@ -1769,18 +1782,6 @@ static int cf_check flask_apic(struct do
>       return domain_has_xen(d, perm);
>   }
>   
> -static int cf_check flask_machine_memory_map(void)
> -{
> -    return avc_current_has_perm(SECINITSID_XEN, SECCLASS_MMU, MMU__MEMORYMAP, NULL);
> -}
> -
> -static int cf_check flask_domain_memory_map(struct domain *d)
> -{
> -    return current_has_perm(d, SECCLASS_MMU, MMU__MEMORYMAP);
> -}
> -
> -#ifdef CONFIG_PV
> -
>   static int cf_check flask_do_mca(void)
>   {
>       return domain_has_xen(current->domain, XEN__MCA_OP);
> 

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

