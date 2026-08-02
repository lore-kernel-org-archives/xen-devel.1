Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830C7C55175
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 15:09:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380905.1624610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqXo9-0007tN-MQ; Sun, 02 Aug 2026 15:08:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380905.1624610; Sun, 02 Aug 2026 15:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqXo9-0007tG-Ie; Sun, 02 Aug 2026 15:08:57 +0000
Received: by outflank-mailman (input) for mailman id 1380905;
 Sun, 02 Aug 2026 15:08:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wqXo7-0007t4-Qi
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 15:08:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqXo7-008fpt-7T
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 17:08:55 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a6f5d46-bab6-0a2a0a5309dd-0a2a4509a026-46
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 17:08:54 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a6f5d84-be1a-0a2a45090019-888fbc3352a5-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 17:08:54 +0200
Received: by mx.zohomail.com with SMTPS id 1785683328710862.2007758395154;
 Sun, 2 Aug 2026 08:08:48 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1785683331; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gkAqGa9mq9pC4fe6AcmrOrsZOfqoSQDpY3E+Ku9Xb8nAwFuD4kMkC62nUfpSL4cS0hJVpO8KTPxr2UMbZ4Wdg63nsPL7BRyw6YkijqiXQcSqC82E5/LtZnKjlVikYnEP5bnsbo10cRM2tdW/+XFWgnUcPKYlQCRHegAIbM+NcU4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785683331; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=VmVxueIYKCLre29nUNWrpK8gnn6byJI0KMoNwXHmXbQ=; 
	b=j6gyWH4cPkZtqkqC2N2kHUSJjZ+7dcnaTRlL9WsXUidQ1kQ8Lj8pWs7COkKetGxQohnpeGHC+z+fgpeQdGK6p07vU1ADPt3W192g0PnRmPtA581yW6g9SBFywICJlghNZQ/HmXs+woiDSMd6Zpj0c9/4O7BsYkATZsIqhwMIQMk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785683331;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=VmVxueIYKCLre29nUNWrpK8gnn6byJI0KMoNwXHmXbQ=;
	b=tRzJkfX4BLAucN9+kOWarZnM4vcrESq8Kj0tzWAqNV4oLFf9dkRk+MBA3TyNV3HD
	vbrV7XbDCywF30sgBs7duBTM6YmVPiKWxhvouAELuuOVbau+Ehb2lSXyJxBZa9/2Zej
	YO74KH+vpRqwvF5kzjy+elktfNHKmTXbeMXdJpXE=
Message-ID: <611d7bf0-94c4-4743-8d95-437d1729b9e4@apertussolutions.com>
Date: Sun, 2 Aug 2026 11:08:55 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/24] XSM: make certain x86-specific hooks dependent upon
 PV=y
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <73257c34-3a86-46a2-b327-f35bff69399d@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <73257c34-3a86-46a2-b327-f35bff69399d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-bad1c0/1785683334-3A2C4034-07BDC739/0/0
X-purgate-type: clean
X-purgate-size: 3541

On 7/28/26 9:18 AM, Jan Beulich wrote:
> They're unreachable / dead otherwise.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -640,11 +640,6 @@ static XSM_INLINE int cf_check xsm_platf
>   }
>   
>   #ifdef CONFIG_X86
> -static XSM_INLINE int cf_check xsm_do_mca(XSM_DEFAULT_VOID)
> -{
> -    XSM_ASSERT_ACTION(XSM_PRIV);
> -    return xsm_default_action(action, current->domain, NULL);
> -}
>   
>   static XSM_INLINE int cf_check xsm_mem_sharing_op(
>       XSM_DEFAULT_ARG struct domain *d, struct domain *cd, int op)
> @@ -673,6 +668,14 @@ static XSM_INLINE int cf_check xsm_domai
>       return xsm_default_action(action, current->domain, d);
>   }
>   
> +#ifdef CONFIG_PV
> +
> +static XSM_INLINE int cf_check xsm_do_mca(XSM_DEFAULT_VOID)
> +{
> +    XSM_ASSERT_ACTION(XSM_PRIV);
> +    return xsm_default_action(action, current->domain, NULL);
> +}
> +
>   static XSM_INLINE int cf_check xsm_mmu_update(
>       XSM_DEFAULT_ARG struct domain *d, struct domain *t, struct domain *f,
>       uint32_t flags)
> @@ -700,6 +703,8 @@ static XSM_INLINE int cf_check xsm_updat
>       return xsm_default_action(action, d, f);
>   }
>   
> +#endif /* CONFIG_PV */
> +
>   static XSM_INLINE int cf_check xsm_priv_mapping(
>       XSM_DEFAULT_ARG struct domain *d, struct domain *t)
>   {
> --- a/xen/include/xsm/hooks.h
> +++ b/xen/include/xsm/hooks.h
> @@ -131,14 +131,16 @@ XSM_HOOK(int, mem_sharing_op, struct dom
>   XSM_HOOK(int, platform_op, uint32_t)
>   
>   #ifdef CONFIG_X86
> -XSM_HOOK(int, do_mca)
>   XSM_HOOK(int, apic, struct domain *, int)
>   XSM_HOOK(int, machine_memory_map)
>   XSM_HOOK(int, domain_memory_map, struct domain *)
> +#ifdef CONFIG_PV
> +XSM_HOOK(int, do_mca)
>   XSM_HOOK(int, mmu_update, struct domain *, struct domain *, struct domain *,
>                             uint32_t)
>   XSM_HOOK(int, mmuext_op, struct domain *, struct domain *)
>   XSM_HOOK(int, update_va_mapping, struct domain *, struct domain *, l1_pgentry_t)
> +#endif /* CONFIG_PV */
>   XSM_HOOK(int, priv_mapping, struct domain *, struct domain *)
>   XSM_HOOK(int, ioport_permission, struct domain *, uint32_t, uint32_t, uint8_t)
>   XSM_HOOK(int, ioport_mapping, struct domain *, uint32_t, uint32_t, uint8_t)
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -1654,10 +1654,6 @@ static int cf_check flask_platform_op(ui
>   }
>   
>   #ifdef CONFIG_X86
> -static int cf_check flask_do_mca(void)
> -{
> -    return domain_has_xen(current->domain, XEN__MCA_OP);
> -}
>   
>   static int flask_shadow_control(struct domain *d, unsigned int op)
>   {
> @@ -1783,6 +1779,13 @@ static int cf_check flask_domain_memory_
>       return current_has_perm(d, SECCLASS_MMU, MMU__MEMORYMAP);
>   }
>   
> +#ifdef CONFIG_PV
> +
> +static int cf_check flask_do_mca(void)
> +{
> +    return domain_has_xen(current->domain, XEN__MCA_OP);
> +}
> +
>   static int cf_check flask_mmu_update(
>       struct domain *d, struct domain *t, struct domain *f, uint32_t flags)
>   {
> @@ -1823,6 +1826,8 @@ static int cf_check flask_update_va_mapp
>       return domain_has_perm(d, f, SECCLASS_MMU, map_perms);
>   }
>   
> +#endif /* CONFIG_PV */
> +
>   static int cf_check flask_priv_mapping(struct domain *d, struct domain *t)
>   {
>       return domain_has_perm(d, t, SECCLASS_MMU, MMU__TARGET_HACK);
> 

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

