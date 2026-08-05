Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36498C55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 22:39:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383926.1627021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrkGx-0002GW-EC; Wed, 05 Aug 2026 22:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383926.1627021; Wed, 05 Aug 2026 22:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrkGx-0002GP-BZ; Wed, 05 Aug 2026 22:39:39 +0000
Received: by outflank-mailman (input) for mailman id 1383926;
 Wed, 05 Aug 2026 22:39:37 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wrkGv-0002GC-Lz
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 22:39:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrkGv-008Rbs-2v
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 00:39:37 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a73bb8e-e002-0a2a0a5209dd-0a2a4506c7a2-18
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 00:39:37 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a73bba7-195a-0a2a45060019-888fbc3352cb-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 00:39:36 +0200
Received: by mx.zohomail.com with SMTPS id 17859695700809.225365282640382;
 Wed, 5 Aug 2026 15:39:30 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1785969572; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DfC6AhuciVKP71ZJ6MlUTWDfiOrwlWYQrlJlx9nRhQMI3pHlZ/b6GkASfxkxzukVYn/oPr+d/Cnp0YNdtyyB5gFyIf/VuRf4Yy74SaMVLiHRR2xb0uyg5dEmm4+7NrkCYVikjAbp0cNe6Y4WklzJXn01IeVDLxfjH9daBGFt/20=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785969572; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=55C6XabZ5c/mpGx9kDIAwy5gjkAlqjWC61nxx1cPiSg=; 
	b=EZ/Mr+o43rx1hFhK70VJem6hyiL0u/36Mw5EkTZ1Y9p9YMxG6b0bcpq36bIJA0LP5zT4u9C63FbPB8kQF39Tt/qpR/A6p7MgTUgnho55RvwSlrOvNh8t+YjYSL4zSvXf4X/Jq20jnsx1EnEHy6khW8ubXloRroa4ORHumRaTHss=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785969572;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=55C6XabZ5c/mpGx9kDIAwy5gjkAlqjWC61nxx1cPiSg=;
	b=JQVP1zI4rs4dO2W4y23Jst5LQWCxXeMuP2TS905Z8890bopwCqGNb+9ZLTYI5W+m
	W43aiE+dNdwo30reEJr4R304guq6bF+xF4TVs4B7lIgLs6Au7AwDvsPyJKZjGjFUi+B
	WLZjKaDmIIn0ctAnjLfDNks0lClkPtqKOXg0v4DQ=
Message-ID: <06a151ca-df45-4fc5-b52a-23f7b02f41b6@apertussolutions.com>
Date: Wed, 5 Aug 2026 18:39:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/24] XSM/dummy: fold cf_check into XSM_INLINE
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <6c8f1317-5dd0-4f91-b1b1-820fb43b5c39@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <6c8f1317-5dd0-4f91-b1b1-820fb43b5c39@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-16d1c6/1785969577-FE87577B-3442C33D/0/0
X-purgate-type: clean
X-purgate-size: 25615

On 7/28/26 9:19 AM, Jan Beulich wrote:
> Use of cf_check together with always_inline is pretty pointless, and with
> XSM=n none of the dummy handlers are supposed to have their address taken.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -54,7 +54,7 @@ void __xsm_action_mismatch_detected(void
>    * There is no xsm_default_t argument available, so the value from the assertion
>    * is used to initialize the variable.
>    */
> -#define XSM_INLINE __maybe_unused
> +#define XSM_INLINE __maybe_unused cf_check
>   
>   #define XSM_DEFAULT_ARG /* */
>   #define XSM_DEFAULT_VOID void
> @@ -104,7 +104,7 @@ static always_inline int xsm_default_act
>       }
>   }
>   
> -static XSM_INLINE int cf_check xsm_set_system_active(void)
> +static XSM_INLINE int xsm_set_system_active(void)
>   {
>       struct domain *d = current->domain;
>   
> @@ -121,34 +121,34 @@ static XSM_INLINE int cf_check xsm_set_s
>       return 0;
>   }
>   
> -static XSM_INLINE void cf_check xsm_security_domaininfo(
> +static XSM_INLINE void xsm_security_domaininfo(
>       struct domain *d, struct xen_domctl_getdomaininfo *info)
>   {
>       return;
>   }
>   
> -static XSM_INLINE int cf_check xsm_domain_create(
> +static XSM_INLINE int xsm_domain_create(
>       XSM_DEFAULT_ARG struct domain *d, uint32_t ssidref)
>   {
>       XSM_ASSERT_ACTION(XSM_HOOK);
>       return xsm_default_action(action, current->domain, d);
>   }
>   
> -static XSM_INLINE int cf_check xsm_getdomaininfo(
> +static XSM_INLINE int xsm_getdomaininfo(
>       XSM_DEFAULT_ARG struct domain *d)
>   {
>       XSM_ASSERT_ACTION(XSM_XS_PRIV);
>       return xsm_default_action(action, current->domain, d);
>   }
>   
> -static XSM_INLINE int cf_check xsm_set_target(
> +static XSM_INLINE int xsm_set_target(
>       XSM_DEFAULT_ARG struct domain *d, struct domain *e)
>   {
>       XSM_ASSERT_ACTION(XSM_PRIV);
>       return xsm_default_action(action, current->domain, NULL);
>   }
>   
> -static XSM_INLINE int cf_check xsm_domctl(
> +static XSM_INLINE int xsm_domctl(
>       XSM_DEFAULT_ARG struct domain *d, struct xen_domctl *op)
>   {
>       XSM_ASSERT_ACTION(XSM_PRIV);
> @@ -174,61 +174,61 @@ static XSM_INLINE int cf_check xsm_domct
>       }
>   }
>   
> -static XSM_INLINE int cf_check xsm_sysctl(
> +static XSM_INLINE int xsm_sysctl(
>       XSM_DEFAULT_ARG const struct xen_sysctl *op)
>   {
>       XSM_ASSERT_ACTION(XSM_PRIV);
>       return xsm_default_action(action, current->domain, NULL);
>   }
>   
> -static XSM_INLINE int cf_check xsm_alloc_security_domain(struct domain *d)
> +static XSM_INLINE int xsm_alloc_security_domain(struct domain *d)
>   {
>       return 0;
>   }
>   
> -static XSM_INLINE void cf_check xsm_free_security_domain(struct domain *d)
> +static XSM_INLINE void xsm_free_security_domain(struct domain *d)
>   {
>       return;
>   }
>   
>   #ifdef CONFIG_GRANT_TABLE
>   
> -static XSM_INLINE int cf_check xsm_grant_mapref(
> +static XSM_INLINE int xsm_grant_mapref(
>       XSM_DEFAULT_ARG struct domain *d1, struct domain *d2, uint32_t flags)
>   {
>       XSM_ASSERT_ACTION(XSM_HOOK);
>       return xsm_default_action(action, d1, d2);
>   }
>   
> -static XSM_INLINE int cf_check xsm_grant_unmapref(
> +static XSM_INLINE int xsm_grant_unmapref(
>       XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
>   {
>       XSM_ASSERT_ACTION(XSM_HOOK);
>       return xsm_default_action(action, d1, d2);
>   }
>   
> -static XSM_INLINE int cf_check xsm_grant_setup(
> +static XSM_INLINE int xsm_grant_setup(
>       XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
>   {
>       XSM_ASSERT_ACTION(XSM_TARGET);
>       return xsm_default_action(action, d1, d2);
>   }
>   
> -static XSM_INLINE int cf_check xsm_grant_transfer(
> +static XSM_INLINE int xsm_grant_transfer(
>       XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
>   {
>       XSM_ASSERT_ACTION(XSM_HOOK);
>       return xsm_default_action(action, d1, d2);
>   }
>   
> -static XSM_INLINE int cf_check xsm_grant_copy(
> +static XSM_INLINE int xsm_grant_copy(
>       XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
>   {
>       XSM_ASSERT_ACTION(XSM_HOOK);
>       return xsm_default_action(action, d1, d2);
>   }
>   
> -static XSM_INLINE int cf_check xsm_grant_query_size(
> +static XSM_INLINE int xsm_grant_query_size(
>       XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
>   {
>       XSM_ASSERT_ACTION(XSM_TARGET);
> @@ -237,28 +237,28 @@ static XSM_INLINE int cf_check xsm_grant
>   
>   #endif /* CONFIG_GRANT_TABLE */
>   
> -static XSM_INLINE int cf_check xsm_memory_exchange(
> +static XSM_INLINE int xsm_memory_exchange(
>       XSM_DEFAULT_ARG struct domain *d)
>   {
>       XSM_ASSERT_ACTION(XSM_TARGET);
>       return xsm_default_action(action, current->domain, d);
>   }
>   
> -static XSM_INLINE int cf_check xsm_memory_adjust_reservation(
> +static XSM_INLINE int xsm_memory_adjust_reservation(
>       XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
>   {
>       XSM_ASSERT_ACTION(XSM_TARGET);
>       return xsm_default_action(action, d1, d2);
>   }
>   
> -static XSM_INLINE int cf_check xsm_memory_stat_reservation(
> +static XSM_INLINE int xsm_memory_stat_reservation(
>       XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
>   {
>       XSM_ASSERT_ACTION(XSM_TARGET);
>       return xsm_default_action(action, d1, d2);
>   }
>   
> -static XSM_INLINE int cf_check xsm_console_io(
> +static XSM_INLINE int xsm_console_io(
>       XSM_DEFAULT_ARG struct domain *d, int cmd)
>   {
>       XSM_ASSERT_ACTION(XSM_OTHER);
> @@ -272,21 +272,21 @@ static XSM_INLINE int cf_check xsm_conso
>   }
>   
>   #ifdef CONFIG_KEXEC
> -static XSM_INLINE int cf_check xsm_kexec(XSM_DEFAULT_VOID)
> +static XSM_INLINE int xsm_kexec(XSM_DEFAULT_VOID)
>   {
>       XSM_ASSERT_ACTION(XSM_PRIV);
>       return xsm_default_action(action, current->domain, NULL);
>   }
>   #endif
>   
> -static XSM_INLINE int cf_check xsm_schedop_shutdown(
> +static XSM_INLINE int xsm_schedop_shutdown(
>       XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
>   {
>       XSM_ASSERT_ACTION(XSM_DM_PRIV);
>       return xsm_default_action(action, d1, d2);
>   }
>   
> -static XSM_INLINE int cf_check xsm_memory_pin_page(
> +static XSM_INLINE int xsm_memory_pin_page(
>       XSM_DEFAULT_ARG struct domain *d1, struct domain *d2,
>       struct page_info *page)
>   {
> @@ -294,20 +294,20 @@ static XSM_INLINE int cf_check xsm_memor
>       return xsm_default_action(action, d1, d2);
>   }
>   
> -static XSM_INLINE int cf_check xsm_claim_pages(XSM_DEFAULT_ARG struct domain *d)
> +static XSM_INLINE int xsm_claim_pages(XSM_DEFAULT_ARG struct domain *d)
>   {
>       XSM_ASSERT_ACTION(XSM_PRIV);
>       return xsm_default_action(action, current->domain, d);
>   }
>   
> -static XSM_INLINE int cf_check xsm_evtchn_unbound(
> +static XSM_INLINE int xsm_evtchn_unbound(
>       XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn, domid_t id2)
>   {
>       XSM_ASSERT_ACTION(XSM_TARGET);
>       return xsm_default_action(action, current->domain, d);
>   }
>   
> -static XSM_INLINE int cf_check xsm_evtchn_interdomain(
> +static XSM_INLINE int xsm_evtchn_interdomain(
>       XSM_DEFAULT_ARG struct domain *d1, struct evtchn *chan1, struct domain *d2,
>       struct evtchn *chan2)
>   {
> @@ -315,72 +315,72 @@ static XSM_INLINE int cf_check xsm_evtch
>       return xsm_default_action(action, d1, d2);
>   }
>   
> -static XSM_INLINE void cf_check xsm_evtchn_close_post(struct evtchn *chn)
> +static XSM_INLINE void xsm_evtchn_close_post(struct evtchn *chn)
>   {
>       return;
>   }
>   
> -static XSM_INLINE int cf_check xsm_evtchn_send(
> +static XSM_INLINE int xsm_evtchn_send(
>       XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn)
>   {
>       XSM_ASSERT_ACTION(XSM_HOOK);
>       return xsm_default_action(action, d, NULL);
>   }
>   
> -static XSM_INLINE int cf_check xsm_evtchn_status(
> +static XSM_INLINE int xsm_evtchn_status(
>       XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn)
>   {
>       XSM_ASSERT_ACTION(XSM_TARGET);
>       return xsm_default_action(action, current->domain, d);
>   }
>   
> -static XSM_INLINE int cf_check xsm_evtchn_reset(
> +static XSM_INLINE int xsm_evtchn_reset(
>       XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
>   {
>       XSM_ASSERT_ACTION(XSM_TARGET);
>       return xsm_default_action(action, d1, d2);
>   }
>   
> -static XSM_INLINE int cf_check xsm_alloc_security_evtchns(
> +static XSM_INLINE int xsm_alloc_security_evtchns(
>       struct evtchn chn[], unsigned int nr)
>   {
>       return 0;
>   }
>   
> -static XSM_INLINE void cf_check xsm_free_security_evtchns(
> +static XSM_INLINE void xsm_free_security_evtchns(
>       struct evtchn chn[], unsigned int nr)
>   {
>       return;
>   }
>   
> -static XSM_INLINE char *cf_check xsm_show_security_evtchn(
> +static XSM_INLINE char *xsm_show_security_evtchn(
>       struct domain *d, const struct evtchn *chn)
>   {
>       return NULL;
>   }
>   
> -static XSM_INLINE int cf_check xsm_init_hardware_domain(
> +static XSM_INLINE int xsm_init_hardware_domain(
>       XSM_DEFAULT_ARG struct domain *d)
>   {
>       XSM_ASSERT_ACTION(XSM_HOOK);
>       return xsm_default_action(action, current->domain, d);
>   }
>   
> -static XSM_INLINE int cf_check xsm_get_pod_target(
> +static XSM_INLINE int xsm_get_pod_target(
>       XSM_DEFAULT_ARG struct domain *d)
>   {
>       XSM_ASSERT_ACTION(XSM_PRIV);
>       return xsm_default_action(action, current->domain, d);
>   }
>   
> -static XSM_INLINE int cf_check xsm_set_pod_target(
> +static XSM_INLINE int xsm_set_pod_target(
>       XSM_DEFAULT_ARG struct domain *d)
>   {
>       XSM_ASSERT_ACTION(XSM_PRIV);
>       return xsm_default_action(action, current->domain, d);
>   }
>   
> -static XSM_INLINE int cf_check xsm_get_vnumainfo(
> +static XSM_INLINE int xsm_get_vnumainfo(
>       XSM_DEFAULT_ARG struct domain *d)
>   {
>       XSM_ASSERT_ACTION(XSM_TARGET);
> @@ -388,7 +388,7 @@ static XSM_INLINE int cf_check xsm_get_v
>   }
>   
>   #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
> -static XSM_INLINE int cf_check xsm_get_device_group(
> +static XSM_INLINE int xsm_get_device_group(
>       XSM_DEFAULT_ARG uint32_t machine_bdf)
>   {
>       XSM_ASSERT_ACTION(XSM_PRIV);
> @@ -398,14 +398,14 @@ static XSM_INLINE int cf_check xsm_get_d
>   
>   #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
>   
> -static XSM_INLINE int cf_check xsm_resource_plug_pci(
> +static XSM_INLINE int xsm_resource_plug_pci(
>       XSM_DEFAULT_ARG uint32_t machine_bdf)
>   {
>       XSM_ASSERT_ACTION(XSM_PRIV);
>       return xsm_default_action(action, current->domain, NULL);
>   }
>   
> -static XSM_INLINE int cf_check xsm_resource_unplug_pci(
> +static XSM_INLINE int xsm_resource_unplug_pci(
>       XSM_DEFAULT_ARG uint32_t machine_bdf)
>   {
>       XSM_ASSERT_ACTION(XSM_PRIV);
> @@ -416,14 +416,14 @@ static XSM_INLINE int cf_check xsm_resou
>   
>   #ifdef CONFIG_HAS_PCI
>   
> -static XSM_INLINE int cf_check xsm_resource_setup_pci(
> +static XSM_INLINE int xsm_resource_setup_pci(
>       XSM_DEFAULT_ARG uint32_t machine_bdf)
>   {
>       XSM_ASSERT_ACTION(XSM_PRIV);
>       return xsm_default_action(action, current->domain, NULL);
>   }
>   
> -static XSM_INLINE int cf_check xsm_resource_setup_gsi(XSM_DEFAULT_ARG int gsi)
> +static XSM_INLINE int xsm_resource_setup_gsi(XSM_DEFAULT_ARG int gsi)
>   {
>       XSM_ASSERT_ACTION(XSM_PRIV);
>       return xsm_default_action(action, current->domain, NULL);
> @@ -431,47 +431,47 @@ static XSM_INLINE int cf_check xsm_resou
>   
>   #endif /* CONFIG_HAS_PCI */
>   
> -static XSM_INLINE int cf_check xsm_resource_setup_misc(XSM_DEFAULT_VOID)
> +static XSM_INLINE int xsm_resource_setup_misc(XSM_DEFAULT_VOID)
>   {
>       XSM_ASSERT_ACTION(XSM_PRIV);
>       return xsm_default_action(action, current->domain, NULL);
>   }
>   
>   #ifdef CONFIG_HYPFS
> -static XSM_INLINE int cf_check xsm_hypfs_op(XSM_DEFAULT_VOID)
> +static XSM_INLINE int xsm_hypfs_op(XSM_DEFAULT_VOID)
>   {
>       XSM_ASSERT_ACTION(XSM_PRIV);
>       return xsm_default_action(action, current->domain, NULL);
>   }
>   #endif
>   
> -static XSM_INLINE long cf_check xsm_do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
> +static XSM_INLINE long xsm_do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
>   {
>       return -ENOSYS;
>   }
>   
>   #ifdef CONFIG_COMPAT
> -static XSM_INLINE int cf_check xsm_do_compat_op(XEN_GUEST_HANDLE_PARAM(void) op)
> +static XSM_INLINE int xsm_do_compat_op(XEN_GUEST_HANDLE_PARAM(void) op)
>   {
>       return -ENOSYS;
>   }
>   #endif
>   
> -static XSM_INLINE char *cf_check xsm_show_irq_sid(int irq)
> +static XSM_INLINE char *xsm_show_irq_sid(int irq)
>   {
>       return NULL;
>   }
>   
>   #ifdef CONFIG_HAS_PIRQ
>   
> -static XSM_INLINE int cf_check xsm_map_domain_pirq(
> +static XSM_INLINE int xsm_map_domain_pirq(
>       XSM_DEFAULT_ARG struct domain *d)
>   {
>       XSM_ASSERT_ACTION(XSM_DM_PRIV);
>       return xsm_default_action(action, current->domain, d);
>   }
>   
> -static XSM_INLINE int cf_check xsm_unmap_domain_pirq(
> +static XSM_INLINE int xsm_unmap_domain_pirq(
>       XSM_DEFAULT_ARG struct domain *d)
>   {
>       XSM_ASSERT_ACTION(XSM_DM_PRIV);
> @@ -480,49 +480,49 @@ static XSM_INLINE int cf_check xsm_unmap
>   
>   #endif /* CONFIG_HAS_PIRQ */
>   
> -static XSM_INLINE int cf_check xsm_map_domain_irq(
> +static XSM_INLINE int xsm_map_domain_irq(
>       XSM_DEFAULT_ARG struct domain *d, int irq, const void *data)
>   {
>       XSM_ASSERT_ACTION(XSM_HOOK);
>       return xsm_default_action(action, current->domain, d);
>   }
>   
> -static XSM_INLINE int cf_check xsm_bind_pt_irq(
> +static XSM_INLINE int xsm_bind_pt_irq(
>       XSM_DEFAULT_ARG struct domain *d, struct xen_domctl_bind_pt_irq *bind)
>   {
>       XSM_ASSERT_ACTION(XSM_DM_PRIV);
>       return xsm_default_action(action, current->domain, d);
>   }
>   
> -static XSM_INLINE int cf_check xsm_unbind_pt_irq(
> +static XSM_INLINE int xsm_unbind_pt_irq(
>       XSM_DEFAULT_ARG struct domain *d, struct xen_domctl_bind_pt_irq *bind)
>   {
>       XSM_ASSERT_ACTION(XSM_DM_PRIV);
>       return xsm_default_action(action, current->domain, d);
>   }
>   
> -static XSM_INLINE int cf_check xsm_unmap_domain_irq(
> +static XSM_INLINE int xsm_unmap_domain_irq(
>       XSM_DEFAULT_ARG struct domain *d, int irq, const void *data)
>   {
>       XSM_ASSERT_ACTION(XSM_HOOK);
>       return xsm_default_action(action, current->domain, d);
>   }
>   
> -static XSM_INLINE int cf_check xsm_irq_permission(
> +static XSM_INLINE int xsm_irq_permission(
>       XSM_DEFAULT_ARG struct domain *d, int pirq, uint8_t allow)
>   {
>       XSM_ASSERT_ACTION(XSM_PRIV);
>       return xsm_default_action(action, current->domain, d);
>   }
>   
> -static XSM_INLINE int cf_check xsm_iomem_permission(
> +static XSM_INLINE int xsm_iomem_permission(
>       XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
>   {
>       XSM_ASSERT_ACTION(XSM_PRIV);
>       return xsm_default_action(action, current->domain, d);
>   }
>   
> -static XSM_INLINE int cf_check xsm_iomem_mapping(
> +static XSM_INLINE int xsm_iomem_mapping(
>       XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
>   {
>       XSM_ASSERT_ACTION(XSM_DM_PRIV);
> @@ -530,7 +530,7 @@ static XSM_INLINE int cf_check xsm_iomem
>   }
>   
>   #ifdef CONFIG_HAS_VPCI
> -static XSM_INLINE int cf_check xsm_iomem_mapping_vpci(
> +static XSM_INLINE int xsm_iomem_mapping_vpci(
>       XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
>   {
>       XSM_ASSERT_ACTION(XSM_HOOK);
> @@ -539,7 +539,7 @@ static XSM_INLINE int cf_check xsm_iomem
>   #endif
>   
>   #ifdef CONFIG_HAS_PCI
> -static XSM_INLINE int cf_check xsm_pci_config_permission(
> +static XSM_INLINE int xsm_pci_config_permission(
>       XSM_DEFAULT_ARG struct domain *d, uint32_t machine_bdf, uint16_t start,
>       uint16_t end, uint8_t access)
>   {
> @@ -548,21 +548,21 @@ static XSM_INLINE int cf_check xsm_pci_c
>   }
>   #endif /* CONFIG_HAS_PCI */
>   
> -static XSM_INLINE int cf_check xsm_add_to_physmap(
> +static XSM_INLINE int xsm_add_to_physmap(
>       XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
>   {
>       XSM_ASSERT_ACTION(XSM_TARGET);
>       return xsm_default_action(action, d1, d2);
>   }
>   
> -static XSM_INLINE int cf_check xsm_remove_from_physmap(
> +static XSM_INLINE int xsm_remove_from_physmap(
>       XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
>   {
>       XSM_ASSERT_ACTION(XSM_TARGET);
>       return xsm_default_action(action, d1, d2);
>   }
>   
> -static XSM_INLINE int cf_check xsm_map_gmfn_foreign(
> +static XSM_INLINE int xsm_map_gmfn_foreign(
>       XSM_DEFAULT_ARG struct domain *d, struct domain *t)
>   {
>       XSM_ASSERT_ACTION(XSM_TARGET);
> @@ -571,14 +571,14 @@ static XSM_INLINE int cf_check xsm_map_g
>   
>   #ifdef CONFIG_HVM
>   
> -static XSM_INLINE int cf_check xsm_hvm_param(
> +static XSM_INLINE int xsm_hvm_param(
>       XSM_DEFAULT_ARG struct domain *d, unsigned long op)
>   {
>       XSM_ASSERT_ACTION(XSM_TARGET);
>       return xsm_default_action(action, current->domain, d);
>   }
>   
> -static XSM_INLINE int cf_check xsm_hvm_param_altp2mhvm(
> +static XSM_INLINE int xsm_hvm_param_altp2mhvm(
>       XSM_DEFAULT_ARG struct domain *d)
>   {
>       XSM_ASSERT_ACTION(XSM_PRIV);
> @@ -588,7 +588,7 @@ static XSM_INLINE int cf_check xsm_hvm_p
>   #endif /* CONFIG_HVM */
>   
>   #ifdef CONFIG_ALTP2M
> -static XSM_INLINE int cf_check xsm_hvm_altp2mhvm_op(
> +static XSM_INLINE int xsm_hvm_altp2mhvm_op(
>       XSM_DEFAULT_ARG struct domain *d, uint64_t mode, uint32_t op)
>   {
>       XSM_ASSERT_ACTION(XSM_OTHER);
> @@ -610,7 +610,7 @@ static XSM_INLINE int cf_check xsm_hvm_a
>   #endif /* CONFIG_ALTP2M */
>   
>   #ifdef CONFIG_VM_EVENT
> -static XSM_INLINE int cf_check xsm_mem_access(XSM_DEFAULT_ARG struct domain *d)
> +static XSM_INLINE int xsm_mem_access(XSM_DEFAULT_ARG struct domain *d)
>   {
>       XSM_ASSERT_ACTION(XSM_DM_PRIV);
>       return xsm_default_action(action, current->domain, d);
> @@ -618,7 +618,7 @@ static XSM_INLINE int cf_check xsm_mem_a
>   #endif
>   
>   #ifdef CONFIG_MEM_PAGING
> -static XSM_INLINE int cf_check xsm_mem_paging(XSM_DEFAULT_ARG struct domain *d)
> +static XSM_INLINE int xsm_mem_paging(XSM_DEFAULT_ARG struct domain *d)
>   {
>       XSM_ASSERT_ACTION(XSM_DM_PRIV);
>       return xsm_default_action(action, current->domain, d);
> @@ -626,14 +626,14 @@ static XSM_INLINE int cf_check xsm_mem_p
>   #endif
>   
>   #ifdef CONFIG_MEM_SHARING
> -static XSM_INLINE int cf_check xsm_mem_sharing(XSM_DEFAULT_ARG struct domain *d)
> +static XSM_INLINE int xsm_mem_sharing(XSM_DEFAULT_ARG struct domain *d)
>   {
>       XSM_ASSERT_ACTION(XSM_DM_PRIV);
>       return xsm_default_action(action, current->domain, d);
>   }
>   #endif
>   
> -static XSM_INLINE int cf_check xsm_platform_op(XSM_DEFAULT_ARG uint32_t op)
> +static XSM_INLINE int xsm_platform_op(XSM_DEFAULT_ARG uint32_t op)
>   {
>       XSM_ASSERT_ACTION(XSM_PRIV);
>       return xsm_default_action(action, current->domain, NULL);
> @@ -641,20 +641,20 @@ static XSM_INLINE int cf_check xsm_platf
>   
>   #ifdef CONFIG_X86
>   
> -static XSM_INLINE int cf_check xsm_mem_sharing_op(
> +static XSM_INLINE int xsm_mem_sharing_op(
>       XSM_DEFAULT_ARG struct domain *d, struct domain *cd, int op)
>   {
>       XSM_ASSERT_ACTION(XSM_DM_PRIV);
>       return xsm_default_action(action, current->domain, cd);
>   }
>   
> -static XSM_INLINE int cf_check xsm_machine_memory_map(XSM_DEFAULT_VOID)
> +static XSM_INLINE int xsm_machine_memory_map(XSM_DEFAULT_VOID)
>   {
>       XSM_ASSERT_ACTION(XSM_PRIV);
>       return xsm_default_action(action, current->domain, NULL);
>   }
>   
> -static XSM_INLINE int cf_check xsm_domain_memory_map(
> +static XSM_INLINE int xsm_domain_memory_map(
>       XSM_DEFAULT_ARG struct domain *d)
>   {
>       XSM_ASSERT_ACTION(XSM_TARGET);
> @@ -663,20 +663,20 @@ static XSM_INLINE int cf_check xsm_domai
>   
>   #ifdef CONFIG_PV
>   
> -static XSM_INLINE int cf_check xsm_apic(
> +static XSM_INLINE int xsm_apic(
>       XSM_DEFAULT_ARG struct domain *d, int cmd)
>   {
>       XSM_ASSERT_ACTION(XSM_PRIV);
>       return xsm_default_action(action, d, NULL);
>   }
>   
> -static XSM_INLINE int cf_check xsm_do_mca(XSM_DEFAULT_VOID)
> +static XSM_INLINE int xsm_do_mca(XSM_DEFAULT_VOID)
>   {
>       XSM_ASSERT_ACTION(XSM_PRIV);
>       return xsm_default_action(action, current->domain, NULL);
>   }
>   
> -static XSM_INLINE int cf_check xsm_mmu_update(
> +static XSM_INLINE int xsm_mmu_update(
>       XSM_DEFAULT_ARG struct domain *d, struct domain *t, struct domain *f,
>       uint32_t flags)
>   {
> @@ -689,14 +689,14 @@ static XSM_INLINE int cf_check xsm_mmu_u
>       return rc;
>   }
>   
> -static XSM_INLINE int cf_check xsm_mmuext_op(
> +static XSM_INLINE int xsm_mmuext_op(
>       XSM_DEFAULT_ARG struct domain *d, struct domain *f)
>   {
>       XSM_ASSERT_ACTION(XSM_TARGET);
>       return xsm_default_action(action, d, f);
>   }
>   
> -static XSM_INLINE int cf_check xsm_update_va_mapping(
> +static XSM_INLINE int xsm_update_va_mapping(
>       XSM_DEFAULT_ARG struct domain *d, struct domain *f, l1_pgentry_t pte)
>   {
>       XSM_ASSERT_ACTION(XSM_TARGET);
> @@ -706,7 +706,7 @@ static XSM_INLINE int cf_check xsm_updat
>   #endif /* CONFIG_PV */
>   
>   #if defined(CONFIG_PV) || defined(CONFIG_SHADOW_PAGING)
> -static XSM_INLINE int cf_check xsm_priv_mapping(
> +static XSM_INLINE int xsm_priv_mapping(
>       XSM_DEFAULT_ARG struct domain *d, struct domain *t)
>   {
>       XSM_ASSERT_ACTION(XSM_TARGET);
> @@ -714,21 +714,21 @@ static XSM_INLINE int cf_check xsm_priv_
>   }
>   #endif
>   
> -static XSM_INLINE int cf_check xsm_ioport_permission(
> +static XSM_INLINE int xsm_ioport_permission(
>       XSM_DEFAULT_ARG struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
>   {
>       XSM_ASSERT_ACTION(XSM_PRIV);
>       return xsm_default_action(action, current->domain, d);
>   }
>   
> -static XSM_INLINE int cf_check xsm_ioport_mapping(
> +static XSM_INLINE int xsm_ioport_mapping(
>       XSM_DEFAULT_ARG struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
>   {
>       XSM_ASSERT_ACTION(XSM_DM_PRIV);
>       return xsm_default_action(action, current->domain, d);
>   }
>   
> -static XSM_INLINE int cf_check xsm_pmu_op(
> +static XSM_INLINE int xsm_pmu_op(
>       XSM_DEFAULT_ARG struct domain *d, unsigned int op)
>   {
>       XSM_ASSERT_ACTION(XSM_OTHER);
> @@ -747,7 +747,7 @@ static XSM_INLINE int cf_check xsm_pmu_o
>   #endif /* CONFIG_X86 */
>   
>   #ifdef CONFIG_IOREQ_SERVER
> -static XSM_INLINE int cf_check xsm_dm_op(XSM_DEFAULT_ARG struct domain *d)
> +static XSM_INLINE int xsm_dm_op(XSM_DEFAULT_ARG struct domain *d)
>   {
>       XSM_ASSERT_ACTION(XSM_DM_PRIV);
>       return xsm_default_action(action, current->domain, d);
> @@ -755,24 +755,24 @@ static XSM_INLINE int cf_check xsm_dm_op
>   #endif
>   
>   #ifdef CONFIG_ARGO
> -static XSM_INLINE int cf_check xsm_argo_enable(const struct domain *d)
> +static XSM_INLINE int xsm_argo_enable(const struct domain *d)
>   {
>       return 0;
>   }
>   
> -static XSM_INLINE int cf_check xsm_argo_register_single_source(
> +static XSM_INLINE int xsm_argo_register_single_source(
>       const struct domain *d, const struct domain *t)
>   {
>       return 0;
>   }
>   
> -static XSM_INLINE int cf_check xsm_argo_register_any_source(
> +static XSM_INLINE int xsm_argo_register_any_source(
>       const struct domain *d)
>   {
>       return 0;
>   }
>   
> -static XSM_INLINE int cf_check xsm_argo_send(
> +static XSM_INLINE int xsm_argo_send(
>       const struct domain *d, const struct domain *t)
>   {
>       return 0;
> @@ -780,7 +780,7 @@ static XSM_INLINE int cf_check xsm_argo_
>   
>   #endif /* CONFIG_ARGO */
>   
> -static XSM_INLINE int cf_check xsm_get_domain_state(
> +static XSM_INLINE int xsm_get_domain_state(
>       XSM_DEFAULT_ARG struct domain *d)
>   {
>       XSM_ASSERT_ACTION(XSM_XS_PRIV);
> @@ -788,7 +788,7 @@ static XSM_INLINE int cf_check xsm_get_d
>   }
>   
>   #include <public/version.h>
> -static XSM_INLINE int cf_check xsm_xen_version(XSM_DEFAULT_ARG uint32_t op)
> +static XSM_INLINE int xsm_xen_version(XSM_DEFAULT_ARG uint32_t op)
>   {
>       XSM_ASSERT_ACTION(XSM_OTHER);
>       switch ( op )
> @@ -815,7 +815,7 @@ static XSM_INLINE int cf_check xsm_xen_v
>       }
>   }
>   
> -static XSM_INLINE int cf_check xsm_domain_resource_map(
> +static XSM_INLINE int xsm_domain_resource_map(
>       XSM_DEFAULT_ARG struct domain *d)
>   {
>       XSM_ASSERT_ACTION(XSM_DM_PRIV);
> 

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

