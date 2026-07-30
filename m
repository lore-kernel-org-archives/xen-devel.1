Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92BC0C55164
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 15:06:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1377984.1623661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpSKF-00084h-Ie; Thu, 30 Jul 2026 15:05:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1377984.1623661; Thu, 30 Jul 2026 15:05:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpSKF-00084a-FR; Thu, 30 Jul 2026 15:05:35 +0000
Received: by outflank-mailman (input) for mailman id 1377984;
 Thu, 30 Jul 2026 15:05:34 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wpSKD-00084U-TP
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 15:05:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpSKD-009RYc-A2
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 17:05:33 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a6b682c-5cb7-0a2a0a5109dd-0a2a4505be3a-44
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 17:05:32 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a6b683a-4cb1-0a2a45050019-888fbc33528c-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 17:05:32 +0200
Received: by mx.zohomail.com with SMTPS id 1785423924180976.2813780164784;
 Thu, 30 Jul 2026 08:05:24 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1785423928; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DJuGEcIYauTPAoWiE4JFvdAh6w8eYTcjzpuoIsjWZ0qPX8fA4PzzJu+M8dkqOk0QAbk+GCFV35l9OP8hll8M7+s+sBB0x1ZLTE4+c6QgWgfXPv9ozd8rJBzWl3ESU0/nZZaqImq17ZiCdOQf0DLV8iIsUrO2zt64kwJ9YacFXXQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785423928; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=nsyyHMTbFfYhBdAWGvcx+uZU8yQVcmEFptEqyh2cX7w=; 
	b=LCFxoFGEnmvEZdStdiDt4PY0wYnpmCR9fzyOtCGJCsD7E5on9fh4duGcEA6lNcxSNTjt/ElyNJTVnLrojwfnPjYjo78WT4AaHLZKzkpnTqMOCJ/InUR+S+c09CVKFf8PxZLVzNrxjfRJr8X2b+76BgLF81LmIi9Jvf+V8ZQzuJA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785423928;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=nsyyHMTbFfYhBdAWGvcx+uZU8yQVcmEFptEqyh2cX7w=;
	b=pLgD4c1QaQMIj2kLp6CYlzpXbn+WwkeH5XIasQuxci5rNOPYqDg7m2MQtyAXIeoa
	Ib0FYg8pQaYn8AuJ87uWsM8E2PXQxjqN3x65KfRQdgCQN8BohT+wMV+pQzjkbyRH0bK
	ceDsghz0h/LqeE2a5FN2y802uUkACruvRUg+1DVI=
Message-ID: <62738b20-ef4b-47ac-832c-5c5fe353e56f@apertussolutions.com>
Date: Thu, 30 Jul 2026 11:05:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/24] XSM: reduce redundancy in hook machinery
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <7487f138-e5e9-41d6-9291-f5eef42d09a1@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <7487f138-e5e9-41d6-9291-f5eef42d09a1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-c201ff/1785423932-724B42A1-4B2EE419/0/0
X-purgate-type: clean
X-purgate-size: 18412

On 7/28/26 9:13 AM, Jan Beulich wrote:
> Hook definition (in struct xsm_ops), wrappers, dummy_ops, and flask_ops
> need keeping in sync (including any involved #ifdef-ary), i.e. require
> consistent adjustments in multiple places when a change is necessary.
> Reduce this by introducing a multi-use helper header file. (However,
> hooks not taking xsm_default_t as first argument in the wrappers aren't
> covered.)

I have never really been a fan of the duplication, which is fragile.

> As there's some re-arrangement of field order in struct xsm_ops anyway,
> also group together everything depending on SYSCTL=y. Similarly move
> .mem_sharing_op() into the MEM_SHARING conditional.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> RFC: In principle dummy.h could also be covered, by further specifying
>       both the expected xsm_default_t value and the actual operation as
>       further arguments to XSM_HOOK(). I'm worried that this may end up a
>       little unwieldy in hooks.h, though.
> 
> Hooks not taking xsm_default_t as first argument could of course be
> adjusted to take one, at which point they could be covered here as well.
> Question is why there is this difference in the first place.

I have a theory but I am not confident to write it down. I can see if I 
can confirm with DDG if you really care that much to know the why. 
Personally having a consistent hook interface convention would provide a 
simpler pattern for people to follow if they are having to introdcue a 
new hook.

> .{alloc,free}_security_evtchns() and their dummy wrappers use struct
> evtchn[] notation, while xsm_{alloc,free}_security_evtchns() use struct
> evtchn *. Is there a reason for this inconsistency?

Person had one habit that was counter to Xen preference and missed one? 
I have no justification for it. IMHO the interfaces should be kept 
consistent to enable better grep-ability.

> 
> --- /dev/null
> +++ b/xen/include/xsm/hooks.h
> @@ -0,0 +1,137 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +/* This file is intended to be included multiple times. */
> +
> +#ifndef XSM_HOOK
> +
> +#include <xen/macros.h>
> +
> +#define XSM_HOOK__(rtype, name, nargs, types...) \
> +    XSM_HOOK ## nargs(rtype, name, ## types)
> +
> +#define XSM_HOOK_(rtype, name, nargs, types...) \
> +    XSM_HOOK__(rtype, name, nargs, ## types)
> +
> +#define XSM_HOOK(rtype, name, types...) \
> +    XSM_HOOK_(rtype, name, count_args(types), ## types)
> +
> +#endif /* XSM_HOOK */
> +
> +XSM_HOOK(int, domain_create, struct domain *, uint32_t)
> +XSM_HOOK(int, getdomaininfo, struct domain *)
> +XSM_HOOK(int, get_domain_state, struct domain *)
> +
> +#ifdef CONFIG_SYSCTL
> +XSM_HOOK(int, sysctl, const struct xen_sysctl *)
> +#endif
> +
> +XSM_HOOK(int, set_target, struct domain *, struct domain *)
> +XSM_HOOK(int, domctl, struct domain *, struct xen_domctl *)
> +
> +XSM_HOOK(int, evtchn_unbound, struct domain *, struct evtchn *, domid_t)
> +XSM_HOOK(int, evtchn_interdomain, struct domain *, struct evtchn *,
> +                                  struct domain *, struct evtchn *)
> +XSM_HOOK(int, evtchn_send, struct domain *, struct evtchn *)
> +XSM_HOOK(int, evtchn_status, struct domain *, struct evtchn *)
> +XSM_HOOK(int, evtchn_reset, struct domain *, struct domain *)
> +
> +XSM_HOOK(int, grant_mapref, struct domain *, struct domain *, uint32_t)
> +XSM_HOOK(int, grant_unmapref, struct domain *, struct domain *)
> +XSM_HOOK(int, grant_setup, struct domain *, struct domain *)
> +XSM_HOOK(int, grant_transfer, struct domain *, struct domain *)
> +XSM_HOOK(int, grant_copy, struct domain *, struct domain *)
> +XSM_HOOK(int, grant_query_size, struct domain *, struct domain *)
> +
> +XSM_HOOK(int, init_hardware_domain, struct domain *)
> +
> +XSM_HOOK(int, get_pod_target, struct domain *)
> +XSM_HOOK(int, set_pod_target, struct domain *)
> +
> +XSM_HOOK(int, memory_exchange, struct domain *)
> +XSM_HOOK(int, memory_adjust_reservation, struct domain *, struct domain *)
> +XSM_HOOK(int, memory_stat_reservation, struct domain *, struct domain *)
> +XSM_HOOK(int, memory_pin_page, struct domain *, struct domain *,
> +                               struct page_info *)
> +XSM_HOOK(int, add_to_physmap, struct domain *, struct domain *)
> +XSM_HOOK(int, remove_from_physmap, struct domain *, struct domain *)
> +XSM_HOOK(int, map_gmfn_foreign, struct domain *, struct domain *)
> +XSM_HOOK(int, claim_pages, struct domain *)
> +
> +XSM_HOOK(int, console_io, struct domain *, int)
> +
> +XSM_HOOK(int, kexec)
> +
> +XSM_HOOK(int, schedop_shutdown, struct domain *, struct domain *)
> +
> +XSM_HOOK(int, map_domain_pirq, struct domain *)
> +XSM_HOOK(int, map_domain_irq, struct domain *, int, const void *)
> +XSM_HOOK(int, unmap_domain_pirq, struct domain *)
> +XSM_HOOK(int, unmap_domain_irq, struct domain *, int, const void *)
> +XSM_HOOK(int, bind_pt_irq, struct domain *, struct xen_domctl_bind_pt_irq *)
> +XSM_HOOK(int, unbind_pt_irq, struct domain *, struct xen_domctl_bind_pt_irq *)
> +
> +XSM_HOOK(int, irq_permission, struct domain *, int, uint8_t)
> +XSM_HOOK(int, iomem_permission, struct domain *, uint64_t, uint64_t, uint8_t)
> +XSM_HOOK(int, pci_config_permission, struct domain *, uint32_t, uint16_t,
> +                                     uint16_t, uint8_t)
> +
> +XSM_HOOK(int, iomem_mapping, struct domain *, uint64_t, uint64_t, uint8_t)
> +XSM_HOOK(int, iomem_mapping_vpci, struct domain *, uint64_t, uint64_t, uint8_t)
> +
> +#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
> +XSM_HOOK(int, get_device_group, uint32_t)
> +#endif
> +
> +XSM_HOOK(int, resource_plug_pci, uint32_t)
> +XSM_HOOK(int, resource_unplug_pci, uint32_t)
> +XSM_HOOK(int, resource_setup_pci, uint32_t)
> +XSM_HOOK(int, resource_setup_gsi, int)
> +XSM_HOOK(int, resource_setup_misc)
> +
> +XSM_HOOK(int, hypfs_op)
> +
> +XSM_HOOK(int, hvm_param, struct domain *, unsigned long)
> +XSM_HOOK(int, hvm_param_altp2mhvm, struct domain *)
> +XSM_HOOK(int, hvm_altp2mhvm_op, struct domain *, uint64_t, uint32_t)
> +XSM_HOOK(int, get_vnumainfo, struct domain *)
> +
> +#ifdef CONFIG_VM_EVENT
> +XSM_HOOK(int, mem_access, struct domain *)
> +#endif
> +
> +#ifdef CONFIG_MEM_PAGING
> +XSM_HOOK(int, mem_paging, struct domain *)
> +#endif
> +
> +#ifdef CONFIG_MEM_SHARING
> +XSM_HOOK(int, mem_sharing, struct domain *)
> +XSM_HOOK(int, mem_sharing_op, struct domain *, struct domain *, int)
> +#endif
> +
> +XSM_HOOK(int, platform_op, uint32_t)
> +
> +#ifdef CONFIG_X86
> +XSM_HOOK(int, do_mca)
> +XSM_HOOK(int, apic, struct domain *, int)
> +XSM_HOOK(int, machine_memory_map)
> +XSM_HOOK(int, domain_memory_map, struct domain *)
> +XSM_HOOK(int, mmu_update, struct domain *, struct domain *, struct domain *,
> +                          uint32_t)
> +XSM_HOOK(int, mmuext_op, struct domain *, struct domain *)
> +XSM_HOOK(int, update_va_mapping, struct domain *, struct domain *, l1_pgentry_t)
> +XSM_HOOK(int, priv_mapping, struct domain *, struct domain *)
> +XSM_HOOK(int, ioport_permission, struct domain *, uint32_t, uint32_t, uint8_t)
> +XSM_HOOK(int, ioport_mapping, struct domain *, uint32_t, uint32_t, uint8_t)
> +XSM_HOOK(int, pmu_op, struct domain *, unsigned int)
> +#endif /* CONFIG_X86 */
> +
> +XSM_HOOK(int, dm_op, struct domain *)
> +XSM_HOOK(int, xen_version, uint32_t)
> +XSM_HOOK(int, domain_resource_map, struct domain *)
> +
> +#undef XSM_HOOK0
> +#undef XSM_HOOK1
> +#undef XSM_HOOK2
> +#undef XSM_HOOK3
> +#undef XSM_HOOK4
> +#undef XSM_HOOK5
> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -41,6 +41,13 @@ enum xsm_default {
>   };
>   typedef enum xsm_default xsm_default_t;
>   
> +#ifdef CONFIG_X86
> +#define XSM_MMU_UPDATE_READ      1
> +#define XSM_MMU_UPDATE_WRITE     2
> +#define XSM_MMU_NORMAL_UPDATE    4
> +#define XSM_MMU_MACHPHYS_UPDATE  8
> +#endif /* CONFIG_X86 */
> +
>   /*
>    * !!! WARNING !!!
>    *
> @@ -54,131 +61,36 @@ struct xsm_ops {
>       int (*set_system_active)(void);
>       void (*security_domaininfo)(struct domain *d,
>                                   struct xen_domctl_getdomaininfo *info);
> -    int (*domain_create)(struct domain *d, uint32_t ssidref);
> -    int (*getdomaininfo)(struct domain *d);
> -    int (*set_target)(struct domain *d, struct domain *e);
> -    int (*domctl)(struct domain *d, struct xen_domctl *op);
> -#ifdef CONFIG_SYSCTL
> -    int (*sysctl)(const struct xen_sysctl *op);
> -#endif
>   
> -    int (*evtchn_unbound)(struct domain *d, struct evtchn *chn, domid_t id2);
> -    int (*evtchn_interdomain)(struct domain *d1, struct evtchn *chn1,
> -                              struct domain *d2, struct evtchn *chn2);
> +#define XSM_HOOK0(rtype, name) rtype (*name)(void);
> +#define XSM_HOOK1(rtype, name, type1) \
> +    rtype (*name)(type1 arg1);
> +#define XSM_HOOK2(rtype, name, type1, type2) \
> +    rtype (*name)(type1 arg1, type2 arg2);
> +#define XSM_HOOK3(rtype, name, type1, type2, type3) \
> +    rtype (*name)(type1 arg1, type2 arg2, type3 arg3);
> +#define XSM_HOOK4(rtype, name, type1, type2, type3, type4) \
> +    rtype (*name)(type1 arg1, type2 arg2, type3 arg3, type4 arg4);
> +#define XSM_HOOK5(rtype, name, type1, type2, type3, type4, type5) \
> +    rtype (*name)(type1 arg1, type2 arg2, type3 arg3, type4 arg4, type5 arg5);
> +
> +#include "hooks.h"
> +
>       void (*evtchn_close_post)(struct evtchn *chn);
> -    int (*evtchn_send)(struct domain *d, struct evtchn *chn);
> -    int (*evtchn_status)(struct domain *d, struct evtchn *chn);
> -    int (*evtchn_reset)(struct domain *d1, struct domain *d2);
> -
> -    int (*grant_mapref)(struct domain *d1, struct domain *d2, uint32_t flags);
> -    int (*grant_unmapref)(struct domain *d1, struct domain *d2);
> -    int (*grant_setup)(struct domain *d1, struct domain *d2);
> -    int (*grant_transfer)(struct domain *d1, struct domain *d2);
> -    int (*grant_copy)(struct domain *d1, struct domain *d2);
> -    int (*grant_query_size)(struct domain *d1, struct domain *d2);
>   
>       int (*alloc_security_domain)(struct domain *d);
>       void (*free_security_domain)(struct domain *d);
>       int (*alloc_security_evtchns)(struct evtchn chn[], unsigned int nr);
>       void (*free_security_evtchns)(struct evtchn chn[], unsigned int nr);
>       char *(*show_security_evtchn)(struct domain *d, const struct evtchn *chn);
> -    int (*init_hardware_domain)(struct domain *d);
> -
> -    int (*get_pod_target)(struct domain *d);
> -    int (*set_pod_target)(struct domain *d);
> -    int (*memory_exchange)(struct domain *d);
> -    int (*memory_adjust_reservation)(struct domain *d1, struct domain *d2);
> -    int (*memory_stat_reservation)(struct domain *d1, struct domain *d2);
> -    int (*memory_pin_page)(struct domain *d1, struct domain *d2,
> -                           struct page_info *page);
> -    int (*add_to_physmap)(struct domain *d1, struct domain *d2);
> -    int (*remove_from_physmap)(struct domain *d1, struct domain *d2);
> -    int (*map_gmfn_foreign)(struct domain *d, struct domain *t);
> -    int (*claim_pages)(struct domain *d);
> -
> -    int (*console_io)(struct domain *d, int cmd);
> -
> -    int (*kexec)(void);
> -    int (*schedop_shutdown)(struct domain *d1, struct domain *d2);
>   
>       char *(*show_irq_sid)(int irq);
> -    int (*map_domain_pirq)(struct domain *d);
> -    int (*map_domain_irq)(struct domain *d, int irq, const void *data);
> -    int (*unmap_domain_pirq)(struct domain *d);
> -    int (*unmap_domain_irq)(struct domain *d, int irq, const void *data);
> -    int (*bind_pt_irq)(struct domain *d, struct xen_domctl_bind_pt_irq *bind);
> -    int (*unbind_pt_irq)(struct domain *d, struct xen_domctl_bind_pt_irq *bind);
> -    int (*irq_permission)(struct domain *d, int pirq, uint8_t allow);
> -    int (*iomem_permission)(struct domain *d, uint64_t s, uint64_t e,
> -                            uint8_t allow);
> -    int (*iomem_mapping)(struct domain *d, uint64_t s, uint64_t e,
> -                         uint8_t allow);
> -    int (*iomem_mapping_vpci)(struct domain *d, uint64_t s, uint64_t e,
> -                              uint8_t allow);
> -    int (*pci_config_permission)(struct domain *d, uint32_t machine_bdf,
> -                                 uint16_t start, uint16_t end, uint8_t access);
> -
> -#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
> -    int (*get_device_group)(uint32_t machine_bdf);
> -#endif
> -
> -    int (*resource_plug_pci)(uint32_t machine_bdf);
> -    int (*resource_unplug_pci)(uint32_t machine_bdf);
> -    int (*resource_setup_pci)(uint32_t machine_bdf);
> -    int (*resource_setup_gsi)(int gsi);
> -    int (*resource_setup_misc)(void);
> -
> -    int (*hypfs_op)(void);
>   
>       long (*do_xsm_op)(XEN_GUEST_HANDLE_PARAM(void) op);
>   #ifdef CONFIG_COMPAT
>       int (*do_compat_op)(XEN_GUEST_HANDLE_PARAM(void) op);
>   #endif
>   
> -    int (*hvm_param)(struct domain *d, unsigned long op);
> -    int (*hvm_param_altp2mhvm)(struct domain *d);
> -    int (*hvm_altp2mhvm_op)(struct domain *d, uint64_t mode, uint32_t op);
> -    int (*get_vnumainfo)(struct domain *d);
> -
> -#ifdef CONFIG_VM_EVENT
> -    int (*mem_access)(struct domain *d);
> -#endif
> -
> -#ifdef CONFIG_MEM_PAGING
> -    int (*mem_paging)(struct domain *d);
> -#endif
> -
> -#ifdef CONFIG_MEM_SHARING
> -    int (*mem_sharing)(struct domain *d);
> -#endif
> -
> -    int (*platform_op)(uint32_t cmd);
> -
> -#ifdef CONFIG_X86
> -    int (*do_mca)(void);
> -    int (*mem_sharing_op)(struct domain *d, struct domain *cd, int op);
> -    int (*apic)(struct domain *d, int cmd);
> -    int (*machine_memory_map)(void);
> -    int (*domain_memory_map)(struct domain *d);
> -#define XSM_MMU_UPDATE_READ      1
> -#define XSM_MMU_UPDATE_WRITE     2
> -#define XSM_MMU_NORMAL_UPDATE    4
> -#define XSM_MMU_MACHPHYS_UPDATE  8
> -    int (*mmu_update)(struct domain *d, struct domain *t,
> -                      struct domain *f, uint32_t flags);
> -    int (*mmuext_op)(struct domain *d, struct domain *f);
> -    int (*update_va_mapping)(struct domain *d, struct domain *f,
> -                             l1_pgentry_t pte);
> -    int (*priv_mapping)(struct domain *d, struct domain *t);
> -    int (*ioport_permission)(struct domain *d, uint32_t s, uint32_t e,
> -                             uint8_t allow);
> -    int (*ioport_mapping)(struct domain *d, uint32_t s, uint32_t e,
> -                          uint8_t allow);
> -    int (*pmu_op)(struct domain *d, unsigned int op);
> -#endif
> -    int (*dm_op)(struct domain *d);
> -    int (*xen_version)(uint32_t cmd);
> -    int (*domain_resource_map)(struct domain *d);
>   #ifdef CONFIG_ARGO
>       int (*argo_enable)(const struct domain *d);
>       int (*argo_register_single_source)(const struct domain *d,
> @@ -186,7 +98,6 @@ struct xsm_ops {
>       int (*argo_register_any_source)(const struct domain *d);
>       int (*argo_send)(const struct domain *d, const struct domain *t);
>   #endif
> -    int (*get_domain_state)(struct domain *d);
>   };
>   
>   #ifdef CONFIG_XSM
> @@ -206,113 +117,57 @@ static inline void xsm_security_domainin
>       alternative_vcall(xsm_ops.security_domaininfo, d, info);
>   }
>   
> -static inline int xsm_domain_create(
> -    xsm_default_t def, struct domain *d, uint32_t ssidref)
> -{
> -    return alternative_call(xsm_ops.domain_create, d, ssidref);
> -}
> +#define XSM_ALT_void alternative_vcall
> +#define XSM_ALT_int  return alternative_call
>   
> -static inline int xsm_getdomaininfo(xsm_default_t def, struct domain *d)
> -{
> -    return alternative_call(xsm_ops.getdomaininfo, d);
> +#define XSM_HOOK0(rtype, name) \
> +static inline rtype xsm_ ## name(xsm_default_t def) \
> +{ \
> +    XSM_ALT_ ## rtype(xsm_ops.name); \
>   }
>   
> -static inline int xsm_get_domain_state(xsm_default_t def, struct domain *d)
> -{
> -    return alternative_call(xsm_ops.get_domain_state, d);
> +#define XSM_HOOK1(rtype, name, type1) \
> +static inline rtype xsm_ ## name(xsm_default_t def, type1 arg1) \
> +{ \
> +    XSM_ALT_ ## rtype(xsm_ops.name, arg1); \
>   }
>   
> -static inline int xsm_set_target(
> -    xsm_default_t def, struct domain *d, struct domain *e)
> -{
> -    return alternative_call(xsm_ops.set_target, d, e);
> +#define XSM_HOOK2(rtype, name, type1, type2) \
> +static inline rtype xsm_ ## name( \
> +    xsm_default_t def, type1 arg1, type2 arg2) \
> +{ \
> +    XSM_ALT_ ## rtype(xsm_ops.name, arg1, arg2); \
>   }
>   
> -static inline int xsm_domctl(xsm_default_t def, struct domain *d,
> -                             struct xen_domctl *op)
> -{
> -    return alternative_call(xsm_ops.domctl, d, op);
> +#define XSM_HOOK3(rtype, name, type1, type2, type3) \
> +static inline rtype xsm_ ## name( \
> +    xsm_default_t def, type1 arg1, type2 arg2, type3 arg3) \
> +{ \
> +    XSM_ALT_ ## rtype(xsm_ops.name, arg1, arg2, arg3); \
>   }
>   
> -#ifdef CONFIG_SYSCTL
> -static inline int xsm_sysctl(xsm_default_t def, const struct xen_sysctl *op)
> -{
> -    return alternative_call(xsm_ops.sysctl, op);
> +#define XSM_HOOK4(rtype, name, type1, type2, type3, type4) \
> +static inline rtype xsm_ ## name( \
> +    xsm_default_t def, type1 arg1, type2 arg2, type3 arg3, type4 arg4) \
> +{ \
> +    XSM_ALT_ ## rtype(xsm_ops.name, arg1, arg2, arg3, arg4); \
>   }
> -#endif
>   
> -static inline int xsm_evtchn_unbound(
> -    xsm_default_t def, struct domain *d1, struct evtchn *chn, domid_t id2)
> -{
> -    return alternative_call(xsm_ops.evtchn_unbound, d1, chn, id2);
> +#define XSM_HOOK5(rtype, name, type1, type2, type3, type4, type5) \
> +static inline rtype xsm_ ## name( \
> +    xsm_default_t def, type1 arg1, type2 arg2, type3 arg3, type4 arg4, \
> +    type4 arg5) \

Looks like you have copy/paste typo?

I would just note there is quite a bit of churn in this patch, most of 
it is mechanical, but makes it easy for these to slip through.

After fixing this typo,

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

