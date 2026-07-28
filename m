Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E46C54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 13:13:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374014.1620964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohcm-0002Bp-6m; Tue, 28 Jul 2026 13:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374014.1620964; Tue, 28 Jul 2026 13:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohcm-0002Bi-3r; Tue, 28 Jul 2026 13:13:36 +0000
Received: by outflank-mailman (input) for mailman id 1374014;
 Tue, 28 Jul 2026 13:13:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wohck-0002BE-Jx
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:13:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wohcj-00Ep6Q-PT
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:13:33 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68aafc-5cb7-0a2a0a5109dd-0a2a4505dc4e-6
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:13:33 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68aafd-4cb1-0a2a45050019-d1558032ad93-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:13:33 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-49558ce01afso28925495e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:13:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496c45cb67esm81802585e9.8.2026.07.28.06.13.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 06:13:32 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785244413; x=1785849213; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SIGERphO0i/Nuw5bD0UnfYw1h2gUHzMmDOC+u1oYUA0=;
        b=B8+JMz+ffa+F0ytF3NZXOCPOKJIw5rvINwxTuH897ZoXEwSkFrgr2ZKUZ/de1s5J/y
         YnPik7CSStKurEGHAx/49XMCykMsbgb6Z0/CMa3PZZDPb32yc8NeHZHNdBKMVEROVIBC
         5/WSGwZiHHmcKDD9Mng4ePmUaTpiFrIJD5C0iDnx5tJaguEnid3FPpsU/4XyfYlVJda4
         e3GVpS0a4MUwZHgfsBrN58WRib9nk5ksFNbtFdP07WR8d4ERoYpAi8FRJCg3vZ1ReSbZ
         DgZJLEkX3GCvLXUd1ANaqulySrUvsL3zKAHAEi7k1Vjzx8OH16P58SP0SpCQHy8T/9wu
         3k+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785244413; x=1785849213;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SIGERphO0i/Nuw5bD0UnfYw1h2gUHzMmDOC+u1oYUA0=;
        b=kVNDYuIlquFl3K0Z9vfkxrVtzGZZdtIc24C/gos1fPsO70u2+CI5GfQi/48NUQq5h+
         WKpr3BI+woVk9yO0WRTHc8P6c/dBAQ0bZwCtuqiHf87+066shF+armcetyrc7dBjl5XE
         Eza1JBuxgI5Yja1G2HxVGoCJ930XoiKh68bVa4VtMXzilvoOrWcfQRRKbkrVs2VhvAJy
         Ub1ehoZd4PXd0fY1YFwexymax1gM6ZdeUez/k9M7ocoetCfAZnp1xQ7nb8DWI2XXUlvn
         SfuD8+FusqRVNgLh+izHxJ57h/7txgL4bp8ePwAz5nM0+m0vN6sUb5z91gvNkEZI/W6u
         dEdg==
X-Gm-Message-State: AOJu0YzpyBcgPndTXDsqyHXQSQ3Hrswd04KLNbrKmvRPYIzLVSxxgcp5
	7f4FCQDmegVRYr676brAJt4deH/sCmwz/ThIVLfAvf2fE2iJICSQgB9NWiscwaqKqFTghOGm+z+
	GqmhqRQ==
X-Gm-Gg: AR+sD10D47FiyJ97l8IPPmW3fqXVEIZLDSyC/QsSRniRmDlga7Ni9pSuPch92yDke8b
	qvEHorXD2gW5Sw38WQlUJ+fDv7itrABHpI39r/mqRz7i8idOqa4c5mPqfWJB2FSUHR96Z3PzO5L
	0Pg7VTX7ikzLxinNsA2QPAAkz9usfEG++tr3I+vTym+MER2gLGiHgG0leORVVQo/nfxg+RrFaTc
	2KKaOckeU9j0+7q9lKeyLaOtHCL8j0MGSdbjn9y0TXraz1BupFI16n+8qKAKPsKZHkxZz+U2f73
	RnW662zw/+fphKh6QtMyFh2JFq1/6MeOtalq7wlTm1kYS+csH7ZXKZMHebKGJxrfeRVb2uCRjBl
	nY3/v3STT5SaDS85KiDuaLDjM+1kiutAzWDDsMqu6szQu1SSxtc5U0YhdGckPy9JcC9HX+kmX8y
	HySGGmKwbfIeZIgDCRphcG/kGNV3beywVyi3SZyZSOVicRlpBTbc/UzdCwPtTfvwKCueXtvH0sa
	pxz
X-Received: by 2002:a05:600c:8010:b0:495:3f5e:e7a with SMTP id 5b1f17b1804b1-496c6588a7cmr26586475e9.34.1785244412852;
        Tue, 28 Jul 2026 06:13:32 -0700 (PDT)
Message-ID: <7487f138-e5e9-41d6-9291-f5eef42d09a1@suse.com>
Date: Tue, 28 Jul 2026 15:13:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 01/24] XSM: reduce redundancy in hook machinery
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Daniel Smith <dpsmith@apertussolutions.com>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1785244413-71AAF2A1-7654CA52/0/0
X-purgate-type: clean
X-purgate-size: 40839

Hook definition (in struct xsm_ops), wrappers, dummy_ops, and flask_ops
need keeping in sync (including any involved #ifdef-ary), i.e. require
consistent adjustments in multiple places when a change is necessary.
Reduce this by introducing a multi-use helper header file. (However,
hooks not taking xsm_default_t as first argument in the wrappers aren't
covered.)

As there's some re-arrangement of field order in struct xsm_ops anyway,
also group together everything depending on SYSCTL=y. Similarly move
.mem_sharing_op() into the MEM_SHARING conditional.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: In principle dummy.h could also be covered, by further specifying
     both the expected xsm_default_t value and the actual operation as
     further arguments to XSM_HOOK(). I'm worried that this may end up a
     little unwieldy in hooks.h, though.

Hooks not taking xsm_default_t as first argument could of course be
adjusted to take one, at which point they could be covered here as well.
Question is why there is this difference in the first place.

.{alloc,free}_security_evtchns() and their dummy wrappers use struct
evtchn[] notation, while xsm_{alloc,free}_security_evtchns() use struct
evtchn *. Is there a reason for this inconsistency?

--- /dev/null
+++ b/xen/include/xsm/hooks.h
@@ -0,0 +1,137 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+/* This file is intended to be included multiple times. */
+
+#ifndef XSM_HOOK
+
+#include <xen/macros.h>
+
+#define XSM_HOOK__(rtype, name, nargs, types...) \
+    XSM_HOOK ## nargs(rtype, name, ## types)
+
+#define XSM_HOOK_(rtype, name, nargs, types...) \
+    XSM_HOOK__(rtype, name, nargs, ## types)
+
+#define XSM_HOOK(rtype, name, types...) \
+    XSM_HOOK_(rtype, name, count_args(types), ## types)
+
+#endif /* XSM_HOOK */
+
+XSM_HOOK(int, domain_create, struct domain *, uint32_t)
+XSM_HOOK(int, getdomaininfo, struct domain *)
+XSM_HOOK(int, get_domain_state, struct domain *)
+
+#ifdef CONFIG_SYSCTL
+XSM_HOOK(int, sysctl, const struct xen_sysctl *)
+#endif
+
+XSM_HOOK(int, set_target, struct domain *, struct domain *)
+XSM_HOOK(int, domctl, struct domain *, struct xen_domctl *)
+
+XSM_HOOK(int, evtchn_unbound, struct domain *, struct evtchn *, domid_t)
+XSM_HOOK(int, evtchn_interdomain, struct domain *, struct evtchn *,
+                                  struct domain *, struct evtchn *)
+XSM_HOOK(int, evtchn_send, struct domain *, struct evtchn *)
+XSM_HOOK(int, evtchn_status, struct domain *, struct evtchn *)
+XSM_HOOK(int, evtchn_reset, struct domain *, struct domain *)
+
+XSM_HOOK(int, grant_mapref, struct domain *, struct domain *, uint32_t)
+XSM_HOOK(int, grant_unmapref, struct domain *, struct domain *)
+XSM_HOOK(int, grant_setup, struct domain *, struct domain *)
+XSM_HOOK(int, grant_transfer, struct domain *, struct domain *)
+XSM_HOOK(int, grant_copy, struct domain *, struct domain *)
+XSM_HOOK(int, grant_query_size, struct domain *, struct domain *)
+
+XSM_HOOK(int, init_hardware_domain, struct domain *)
+
+XSM_HOOK(int, get_pod_target, struct domain *)
+XSM_HOOK(int, set_pod_target, struct domain *)
+
+XSM_HOOK(int, memory_exchange, struct domain *)
+XSM_HOOK(int, memory_adjust_reservation, struct domain *, struct domain *)
+XSM_HOOK(int, memory_stat_reservation, struct domain *, struct domain *)
+XSM_HOOK(int, memory_pin_page, struct domain *, struct domain *,
+                               struct page_info *)
+XSM_HOOK(int, add_to_physmap, struct domain *, struct domain *)
+XSM_HOOK(int, remove_from_physmap, struct domain *, struct domain *)
+XSM_HOOK(int, map_gmfn_foreign, struct domain *, struct domain *)
+XSM_HOOK(int, claim_pages, struct domain *)
+
+XSM_HOOK(int, console_io, struct domain *, int)
+
+XSM_HOOK(int, kexec)
+
+XSM_HOOK(int, schedop_shutdown, struct domain *, struct domain *)
+
+XSM_HOOK(int, map_domain_pirq, struct domain *)
+XSM_HOOK(int, map_domain_irq, struct domain *, int, const void *)
+XSM_HOOK(int, unmap_domain_pirq, struct domain *)
+XSM_HOOK(int, unmap_domain_irq, struct domain *, int, const void *)
+XSM_HOOK(int, bind_pt_irq, struct domain *, struct xen_domctl_bind_pt_irq *)
+XSM_HOOK(int, unbind_pt_irq, struct domain *, struct xen_domctl_bind_pt_irq *)
+
+XSM_HOOK(int, irq_permission, struct domain *, int, uint8_t)
+XSM_HOOK(int, iomem_permission, struct domain *, uint64_t, uint64_t, uint8_t)
+XSM_HOOK(int, pci_config_permission, struct domain *, uint32_t, uint16_t,
+                                     uint16_t, uint8_t)
+
+XSM_HOOK(int, iomem_mapping, struct domain *, uint64_t, uint64_t, uint8_t)
+XSM_HOOK(int, iomem_mapping_vpci, struct domain *, uint64_t, uint64_t, uint8_t)
+
+#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
+XSM_HOOK(int, get_device_group, uint32_t)
+#endif
+
+XSM_HOOK(int, resource_plug_pci, uint32_t)
+XSM_HOOK(int, resource_unplug_pci, uint32_t)
+XSM_HOOK(int, resource_setup_pci, uint32_t)
+XSM_HOOK(int, resource_setup_gsi, int)
+XSM_HOOK(int, resource_setup_misc)
+
+XSM_HOOK(int, hypfs_op)
+
+XSM_HOOK(int, hvm_param, struct domain *, unsigned long)
+XSM_HOOK(int, hvm_param_altp2mhvm, struct domain *)
+XSM_HOOK(int, hvm_altp2mhvm_op, struct domain *, uint64_t, uint32_t)
+XSM_HOOK(int, get_vnumainfo, struct domain *)
+
+#ifdef CONFIG_VM_EVENT
+XSM_HOOK(int, mem_access, struct domain *)
+#endif
+
+#ifdef CONFIG_MEM_PAGING
+XSM_HOOK(int, mem_paging, struct domain *)
+#endif
+
+#ifdef CONFIG_MEM_SHARING
+XSM_HOOK(int, mem_sharing, struct domain *)
+XSM_HOOK(int, mem_sharing_op, struct domain *, struct domain *, int)
+#endif
+
+XSM_HOOK(int, platform_op, uint32_t)
+
+#ifdef CONFIG_X86
+XSM_HOOK(int, do_mca)
+XSM_HOOK(int, apic, struct domain *, int)
+XSM_HOOK(int, machine_memory_map)
+XSM_HOOK(int, domain_memory_map, struct domain *)
+XSM_HOOK(int, mmu_update, struct domain *, struct domain *, struct domain *,
+                          uint32_t)
+XSM_HOOK(int, mmuext_op, struct domain *, struct domain *)
+XSM_HOOK(int, update_va_mapping, struct domain *, struct domain *, l1_pgentry_t)
+XSM_HOOK(int, priv_mapping, struct domain *, struct domain *)
+XSM_HOOK(int, ioport_permission, struct domain *, uint32_t, uint32_t, uint8_t)
+XSM_HOOK(int, ioport_mapping, struct domain *, uint32_t, uint32_t, uint8_t)
+XSM_HOOK(int, pmu_op, struct domain *, unsigned int)
+#endif /* CONFIG_X86 */
+
+XSM_HOOK(int, dm_op, struct domain *)
+XSM_HOOK(int, xen_version, uint32_t)
+XSM_HOOK(int, domain_resource_map, struct domain *)
+
+#undef XSM_HOOK0
+#undef XSM_HOOK1
+#undef XSM_HOOK2
+#undef XSM_HOOK3
+#undef XSM_HOOK4
+#undef XSM_HOOK5
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -41,6 +41,13 @@ enum xsm_default {
 };
 typedef enum xsm_default xsm_default_t;
 
+#ifdef CONFIG_X86
+#define XSM_MMU_UPDATE_READ      1
+#define XSM_MMU_UPDATE_WRITE     2
+#define XSM_MMU_NORMAL_UPDATE    4
+#define XSM_MMU_MACHPHYS_UPDATE  8
+#endif /* CONFIG_X86 */
+
 /*
  * !!! WARNING !!!
  *
@@ -54,131 +61,36 @@ struct xsm_ops {
     int (*set_system_active)(void);
     void (*security_domaininfo)(struct domain *d,
                                 struct xen_domctl_getdomaininfo *info);
-    int (*domain_create)(struct domain *d, uint32_t ssidref);
-    int (*getdomaininfo)(struct domain *d);
-    int (*set_target)(struct domain *d, struct domain *e);
-    int (*domctl)(struct domain *d, struct xen_domctl *op);
-#ifdef CONFIG_SYSCTL
-    int (*sysctl)(const struct xen_sysctl *op);
-#endif
 
-    int (*evtchn_unbound)(struct domain *d, struct evtchn *chn, domid_t id2);
-    int (*evtchn_interdomain)(struct domain *d1, struct evtchn *chn1,
-                              struct domain *d2, struct evtchn *chn2);
+#define XSM_HOOK0(rtype, name) rtype (*name)(void);
+#define XSM_HOOK1(rtype, name, type1) \
+    rtype (*name)(type1 arg1);
+#define XSM_HOOK2(rtype, name, type1, type2) \
+    rtype (*name)(type1 arg1, type2 arg2);
+#define XSM_HOOK3(rtype, name, type1, type2, type3) \
+    rtype (*name)(type1 arg1, type2 arg2, type3 arg3);
+#define XSM_HOOK4(rtype, name, type1, type2, type3, type4) \
+    rtype (*name)(type1 arg1, type2 arg2, type3 arg3, type4 arg4);
+#define XSM_HOOK5(rtype, name, type1, type2, type3, type4, type5) \
+    rtype (*name)(type1 arg1, type2 arg2, type3 arg3, type4 arg4, type5 arg5);
+
+#include "hooks.h"
+
     void (*evtchn_close_post)(struct evtchn *chn);
-    int (*evtchn_send)(struct domain *d, struct evtchn *chn);
-    int (*evtchn_status)(struct domain *d, struct evtchn *chn);
-    int (*evtchn_reset)(struct domain *d1, struct domain *d2);
-
-    int (*grant_mapref)(struct domain *d1, struct domain *d2, uint32_t flags);
-    int (*grant_unmapref)(struct domain *d1, struct domain *d2);
-    int (*grant_setup)(struct domain *d1, struct domain *d2);
-    int (*grant_transfer)(struct domain *d1, struct domain *d2);
-    int (*grant_copy)(struct domain *d1, struct domain *d2);
-    int (*grant_query_size)(struct domain *d1, struct domain *d2);
 
     int (*alloc_security_domain)(struct domain *d);
     void (*free_security_domain)(struct domain *d);
     int (*alloc_security_evtchns)(struct evtchn chn[], unsigned int nr);
     void (*free_security_evtchns)(struct evtchn chn[], unsigned int nr);
     char *(*show_security_evtchn)(struct domain *d, const struct evtchn *chn);
-    int (*init_hardware_domain)(struct domain *d);
-
-    int (*get_pod_target)(struct domain *d);
-    int (*set_pod_target)(struct domain *d);
-    int (*memory_exchange)(struct domain *d);
-    int (*memory_adjust_reservation)(struct domain *d1, struct domain *d2);
-    int (*memory_stat_reservation)(struct domain *d1, struct domain *d2);
-    int (*memory_pin_page)(struct domain *d1, struct domain *d2,
-                           struct page_info *page);
-    int (*add_to_physmap)(struct domain *d1, struct domain *d2);
-    int (*remove_from_physmap)(struct domain *d1, struct domain *d2);
-    int (*map_gmfn_foreign)(struct domain *d, struct domain *t);
-    int (*claim_pages)(struct domain *d);
-
-    int (*console_io)(struct domain *d, int cmd);
-
-    int (*kexec)(void);
-    int (*schedop_shutdown)(struct domain *d1, struct domain *d2);
 
     char *(*show_irq_sid)(int irq);
-    int (*map_domain_pirq)(struct domain *d);
-    int (*map_domain_irq)(struct domain *d, int irq, const void *data);
-    int (*unmap_domain_pirq)(struct domain *d);
-    int (*unmap_domain_irq)(struct domain *d, int irq, const void *data);
-    int (*bind_pt_irq)(struct domain *d, struct xen_domctl_bind_pt_irq *bind);
-    int (*unbind_pt_irq)(struct domain *d, struct xen_domctl_bind_pt_irq *bind);
-    int (*irq_permission)(struct domain *d, int pirq, uint8_t allow);
-    int (*iomem_permission)(struct domain *d, uint64_t s, uint64_t e,
-                            uint8_t allow);
-    int (*iomem_mapping)(struct domain *d, uint64_t s, uint64_t e,
-                         uint8_t allow);
-    int (*iomem_mapping_vpci)(struct domain *d, uint64_t s, uint64_t e,
-                              uint8_t allow);
-    int (*pci_config_permission)(struct domain *d, uint32_t machine_bdf,
-                                 uint16_t start, uint16_t end, uint8_t access);
-
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
-    int (*get_device_group)(uint32_t machine_bdf);
-#endif
-
-    int (*resource_plug_pci)(uint32_t machine_bdf);
-    int (*resource_unplug_pci)(uint32_t machine_bdf);
-    int (*resource_setup_pci)(uint32_t machine_bdf);
-    int (*resource_setup_gsi)(int gsi);
-    int (*resource_setup_misc)(void);
-
-    int (*hypfs_op)(void);
 
     long (*do_xsm_op)(XEN_GUEST_HANDLE_PARAM(void) op);
 #ifdef CONFIG_COMPAT
     int (*do_compat_op)(XEN_GUEST_HANDLE_PARAM(void) op);
 #endif
 
-    int (*hvm_param)(struct domain *d, unsigned long op);
-    int (*hvm_param_altp2mhvm)(struct domain *d);
-    int (*hvm_altp2mhvm_op)(struct domain *d, uint64_t mode, uint32_t op);
-    int (*get_vnumainfo)(struct domain *d);
-
-#ifdef CONFIG_VM_EVENT
-    int (*mem_access)(struct domain *d);
-#endif
-
-#ifdef CONFIG_MEM_PAGING
-    int (*mem_paging)(struct domain *d);
-#endif
-
-#ifdef CONFIG_MEM_SHARING
-    int (*mem_sharing)(struct domain *d);
-#endif
-
-    int (*platform_op)(uint32_t cmd);
-
-#ifdef CONFIG_X86
-    int (*do_mca)(void);
-    int (*mem_sharing_op)(struct domain *d, struct domain *cd, int op);
-    int (*apic)(struct domain *d, int cmd);
-    int (*machine_memory_map)(void);
-    int (*domain_memory_map)(struct domain *d);
-#define XSM_MMU_UPDATE_READ      1
-#define XSM_MMU_UPDATE_WRITE     2
-#define XSM_MMU_NORMAL_UPDATE    4
-#define XSM_MMU_MACHPHYS_UPDATE  8
-    int (*mmu_update)(struct domain *d, struct domain *t,
-                      struct domain *f, uint32_t flags);
-    int (*mmuext_op)(struct domain *d, struct domain *f);
-    int (*update_va_mapping)(struct domain *d, struct domain *f,
-                             l1_pgentry_t pte);
-    int (*priv_mapping)(struct domain *d, struct domain *t);
-    int (*ioport_permission)(struct domain *d, uint32_t s, uint32_t e,
-                             uint8_t allow);
-    int (*ioport_mapping)(struct domain *d, uint32_t s, uint32_t e,
-                          uint8_t allow);
-    int (*pmu_op)(struct domain *d, unsigned int op);
-#endif
-    int (*dm_op)(struct domain *d);
-    int (*xen_version)(uint32_t cmd);
-    int (*domain_resource_map)(struct domain *d);
 #ifdef CONFIG_ARGO
     int (*argo_enable)(const struct domain *d);
     int (*argo_register_single_source)(const struct domain *d,
@@ -186,7 +98,6 @@ struct xsm_ops {
     int (*argo_register_any_source)(const struct domain *d);
     int (*argo_send)(const struct domain *d, const struct domain *t);
 #endif
-    int (*get_domain_state)(struct domain *d);
 };
 
 #ifdef CONFIG_XSM
@@ -206,113 +117,57 @@ static inline void xsm_security_domainin
     alternative_vcall(xsm_ops.security_domaininfo, d, info);
 }
 
-static inline int xsm_domain_create(
-    xsm_default_t def, struct domain *d, uint32_t ssidref)
-{
-    return alternative_call(xsm_ops.domain_create, d, ssidref);
-}
+#define XSM_ALT_void alternative_vcall
+#define XSM_ALT_int  return alternative_call
 
-static inline int xsm_getdomaininfo(xsm_default_t def, struct domain *d)
-{
-    return alternative_call(xsm_ops.getdomaininfo, d);
+#define XSM_HOOK0(rtype, name) \
+static inline rtype xsm_ ## name(xsm_default_t def) \
+{ \
+    XSM_ALT_ ## rtype(xsm_ops.name); \
 }
 
-static inline int xsm_get_domain_state(xsm_default_t def, struct domain *d)
-{
-    return alternative_call(xsm_ops.get_domain_state, d);
+#define XSM_HOOK1(rtype, name, type1) \
+static inline rtype xsm_ ## name(xsm_default_t def, type1 arg1) \
+{ \
+    XSM_ALT_ ## rtype(xsm_ops.name, arg1); \
 }
 
-static inline int xsm_set_target(
-    xsm_default_t def, struct domain *d, struct domain *e)
-{
-    return alternative_call(xsm_ops.set_target, d, e);
+#define XSM_HOOK2(rtype, name, type1, type2) \
+static inline rtype xsm_ ## name( \
+    xsm_default_t def, type1 arg1, type2 arg2) \
+{ \
+    XSM_ALT_ ## rtype(xsm_ops.name, arg1, arg2); \
 }
 
-static inline int xsm_domctl(xsm_default_t def, struct domain *d,
-                             struct xen_domctl *op)
-{
-    return alternative_call(xsm_ops.domctl, d, op);
+#define XSM_HOOK3(rtype, name, type1, type2, type3) \
+static inline rtype xsm_ ## name( \
+    xsm_default_t def, type1 arg1, type2 arg2, type3 arg3) \
+{ \
+    XSM_ALT_ ## rtype(xsm_ops.name, arg1, arg2, arg3); \
 }
 
-#ifdef CONFIG_SYSCTL
-static inline int xsm_sysctl(xsm_default_t def, const struct xen_sysctl *op)
-{
-    return alternative_call(xsm_ops.sysctl, op);
+#define XSM_HOOK4(rtype, name, type1, type2, type3, type4) \
+static inline rtype xsm_ ## name( \
+    xsm_default_t def, type1 arg1, type2 arg2, type3 arg3, type4 arg4) \
+{ \
+    XSM_ALT_ ## rtype(xsm_ops.name, arg1, arg2, arg3, arg4); \
 }
-#endif
 
-static inline int xsm_evtchn_unbound(
-    xsm_default_t def, struct domain *d1, struct evtchn *chn, domid_t id2)
-{
-    return alternative_call(xsm_ops.evtchn_unbound, d1, chn, id2);
+#define XSM_HOOK5(rtype, name, type1, type2, type3, type4, type5) \
+static inline rtype xsm_ ## name( \
+    xsm_default_t def, type1 arg1, type2 arg2, type3 arg3, type4 arg4, \
+    type4 arg5) \
+{ \
+    XSM_ALT_ ## rtype(xsm_ops.name, arg1, arg2, arg3, arg4, arg5); \
 }
 
-static inline int xsm_evtchn_interdomain(
-    xsm_default_t def, struct domain *d1, struct evtchn *chan1,
-    struct domain *d2, struct evtchn *chan2)
-{
-    return alternative_call(xsm_ops.evtchn_interdomain, d1, chan1, d2, chan2);
-}
+#include "hooks.h"
 
 static inline void xsm_evtchn_close_post(struct evtchn *chn)
 {
     alternative_vcall(xsm_ops.evtchn_close_post, chn);
 }
 
-static inline int xsm_evtchn_send(
-    xsm_default_t def, struct domain *d, struct evtchn *chn)
-{
-    return alternative_call(xsm_ops.evtchn_send, d, chn);
-}
-
-static inline int xsm_evtchn_status(
-    xsm_default_t def, struct domain *d, struct evtchn *chn)
-{
-    return alternative_call(xsm_ops.evtchn_status, d, chn);
-}
-
-static inline int xsm_evtchn_reset(
-    xsm_default_t def, struct domain *d1, struct domain *d2)
-{
-    return alternative_call(xsm_ops.evtchn_reset, d1, d2);
-}
-
-static inline int xsm_grant_mapref(
-    xsm_default_t def, struct domain *d1, struct domain *d2, uint32_t flags)
-{
-    return alternative_call(xsm_ops.grant_mapref, d1, d2, flags);
-}
-
-static inline int xsm_grant_unmapref(
-    xsm_default_t def, struct domain *d1, struct domain *d2)
-{
-    return alternative_call(xsm_ops.grant_unmapref, d1, d2);
-}
-
-static inline int xsm_grant_setup(
-    xsm_default_t def, struct domain *d1, struct domain *d2)
-{
-    return alternative_call(xsm_ops.grant_setup, d1, d2);
-}
-
-static inline int xsm_grant_transfer(
-    xsm_default_t def, struct domain *d1, struct domain *d2)
-{
-    return alternative_call(xsm_ops.grant_transfer, d1, d2);
-}
-
-static inline int xsm_grant_copy(
-    xsm_default_t def, struct domain *d1, struct domain *d2)
-{
-    return alternative_call(xsm_ops.grant_copy, d1, d2);
-}
-
-static inline int xsm_grant_query_size(
-    xsm_default_t def, struct domain *d1, struct domain *d2)
-{
-    return alternative_call(xsm_ops.grant_query_size, d1, d2);
-}
-
 static inline int xsm_alloc_security_domain(struct domain *d)
 {
     return alternative_call(xsm_ops.alloc_security_domain, d);
@@ -341,193 +196,11 @@ static inline char *xsm_show_security_ev
     return alternative_call(xsm_ops.show_security_evtchn, d, chn);
 }
 
-static inline int xsm_init_hardware_domain(xsm_default_t def, struct domain *d)
-{
-    return alternative_call(xsm_ops.init_hardware_domain, d);
-}
-
-static inline int xsm_get_pod_target(xsm_default_t def, struct domain *d)
-{
-    return alternative_call(xsm_ops.get_pod_target, d);
-}
-
-static inline int xsm_set_pod_target(xsm_default_t def, struct domain *d)
-{
-    return alternative_call(xsm_ops.set_pod_target, d);
-}
-
-static inline int xsm_memory_exchange(xsm_default_t def, struct domain *d)
-{
-    return alternative_call(xsm_ops.memory_exchange, d);
-}
-
-static inline int xsm_memory_adjust_reservation(
-    xsm_default_t def, struct domain *d1, struct domain *d2)
-{
-    return alternative_call(xsm_ops.memory_adjust_reservation, d1, d2);
-}
-
-static inline int xsm_memory_stat_reservation(
-    xsm_default_t def, struct domain *d1, struct domain *d2)
-{
-    return alternative_call(xsm_ops.memory_stat_reservation, d1, d2);
-}
-
-static inline int xsm_memory_pin_page(
-    xsm_default_t def, struct domain *d1, struct domain *d2,
-    struct page_info *page)
-{
-    return alternative_call(xsm_ops.memory_pin_page, d1, d2, page);
-}
-
-static inline int xsm_add_to_physmap(
-    xsm_default_t def, struct domain *d1, struct domain *d2)
-{
-    return alternative_call(xsm_ops.add_to_physmap, d1, d2);
-}
-
-static inline int xsm_remove_from_physmap(
-    xsm_default_t def, struct domain *d1, struct domain *d2)
-{
-    return alternative_call(xsm_ops.remove_from_physmap, d1, d2);
-}
-
-static inline int xsm_map_gmfn_foreign(
-    xsm_default_t def, struct domain *d, struct domain *t)
-{
-    return alternative_call(xsm_ops.map_gmfn_foreign, d, t);
-}
-
-static inline int xsm_claim_pages(xsm_default_t def, struct domain *d)
-{
-    return alternative_call(xsm_ops.claim_pages, d);
-}
-
-static inline int xsm_console_io(xsm_default_t def, struct domain *d, int cmd)
-{
-    return alternative_call(xsm_ops.console_io, d, cmd);
-}
-
-static inline int xsm_kexec(xsm_default_t def)
-{
-    return alternative_call(xsm_ops.kexec);
-}
-
-static inline int xsm_schedop_shutdown(
-    xsm_default_t def, struct domain *d1, struct domain *d2)
-{
-    return alternative_call(xsm_ops.schedop_shutdown, d1, d2);
-}
-
 static inline char *xsm_show_irq_sid(int irq)
 {
     return alternative_call(xsm_ops.show_irq_sid, irq);
 }
 
-static inline int xsm_map_domain_pirq(xsm_default_t def, struct domain *d)
-{
-    return alternative_call(xsm_ops.map_domain_pirq, d);
-}
-
-static inline int xsm_map_domain_irq(
-    xsm_default_t def, struct domain *d, int irq, void *data)
-{
-    return alternative_call(xsm_ops.map_domain_irq, d, irq, data);
-}
-
-static inline int xsm_unmap_domain_pirq(xsm_default_t def, struct domain *d)
-{
-    return alternative_call(xsm_ops.unmap_domain_pirq, d);
-}
-
-static inline int xsm_unmap_domain_irq(
-    xsm_default_t def, struct domain *d, int irq, void *data)
-{
-    return alternative_call(xsm_ops.unmap_domain_irq, d, irq, data);
-}
-
-static inline int xsm_bind_pt_irq(
-    xsm_default_t def, struct domain *d, struct xen_domctl_bind_pt_irq *bind)
-{
-    return alternative_call(xsm_ops.bind_pt_irq, d, bind);
-}
-
-static inline int xsm_unbind_pt_irq(
-    xsm_default_t def, struct domain *d, struct xen_domctl_bind_pt_irq *bind)
-{
-    return alternative_call(xsm_ops.unbind_pt_irq, d, bind);
-}
-
-static inline int xsm_irq_permission(
-    xsm_default_t def, struct domain *d, int pirq, uint8_t allow)
-{
-    return alternative_call(xsm_ops.irq_permission, d, pirq, allow);
-}
-
-static inline int xsm_iomem_permission(
-    xsm_default_t def, struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
-{
-    return alternative_call(xsm_ops.iomem_permission, d, s, e, allow);
-}
-
-static inline int xsm_iomem_mapping(
-    xsm_default_t def, struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
-{
-    return alternative_call(xsm_ops.iomem_mapping, d, s, e, allow);
-}
-
-static inline int xsm_iomem_mapping_vpci(
-    xsm_default_t def, struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
-{
-    return alternative_call(xsm_ops.iomem_mapping_vpci, d, s, e, allow);
-}
-
-static inline int xsm_pci_config_permission(
-    xsm_default_t def, struct domain *d, uint32_t machine_bdf, uint16_t start,
-    uint16_t end, uint8_t access)
-{
-    return alternative_call(xsm_ops.pci_config_permission, d, machine_bdf, start, end, access);
-}
-
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
-static inline int xsm_get_device_group(xsm_default_t def, uint32_t machine_bdf)
-{
-    return alternative_call(xsm_ops.get_device_group, machine_bdf);
-}
-#endif /* HAS_PASSTHROUGH && HAS_PCI) */
-
-static inline int xsm_resource_plug_pci(xsm_default_t def, uint32_t machine_bdf)
-{
-    return alternative_call(xsm_ops.resource_plug_pci, machine_bdf);
-}
-
-static inline int xsm_resource_unplug_pci(
-    xsm_default_t def, uint32_t machine_bdf)
-{
-    return alternative_call(xsm_ops.resource_unplug_pci, machine_bdf);
-}
-
-static inline int xsm_resource_setup_pci(
-    xsm_default_t def, uint32_t machine_bdf)
-{
-    return alternative_call(xsm_ops.resource_setup_pci, machine_bdf);
-}
-
-static inline int xsm_resource_setup_gsi(xsm_default_t def, int gsi)
-{
-    return alternative_call(xsm_ops.resource_setup_gsi, gsi);
-}
-
-static inline int xsm_resource_setup_misc(xsm_default_t def)
-{
-    return alternative_call(xsm_ops.resource_setup_misc);
-}
-
-static inline int xsm_hypfs_op(xsm_default_t def)
-{
-    return alternative_call(xsm_ops.hypfs_op);
-}
-
 static inline long xsm_do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
 {
     return alternative_call(xsm_ops.do_xsm_op, op);
@@ -540,141 +213,6 @@ static inline int xsm_do_compat_op(XEN_G
 }
 #endif
 
-static inline int xsm_hvm_param(
-    xsm_default_t def, struct domain *d, unsigned long op)
-{
-    return alternative_call(xsm_ops.hvm_param, d, op);
-}
-
-static inline int xsm_hvm_param_altp2mhvm(xsm_default_t def, struct domain *d)
-{
-    return alternative_call(xsm_ops.hvm_param_altp2mhvm, d);
-}
-
-static inline int xsm_hvm_altp2mhvm_op(
-    xsm_default_t def, struct domain *d, uint64_t mode, uint32_t op)
-{
-    return alternative_call(xsm_ops.hvm_altp2mhvm_op, d, mode, op);
-}
-
-static inline int xsm_get_vnumainfo(xsm_default_t def, struct domain *d)
-{
-    return alternative_call(xsm_ops.get_vnumainfo, d);
-}
-
-#ifdef CONFIG_VM_EVENT
-static inline int xsm_mem_access(xsm_default_t def, struct domain *d)
-{
-    return alternative_call(xsm_ops.mem_access, d);
-}
-#endif
-
-#ifdef CONFIG_MEM_PAGING
-static inline int xsm_mem_paging(xsm_default_t def, struct domain *d)
-{
-    return alternative_call(xsm_ops.mem_paging, d);
-}
-#endif
-
-#ifdef CONFIG_MEM_SHARING
-static inline int xsm_mem_sharing(xsm_default_t def, struct domain *d)
-{
-    return alternative_call(xsm_ops.mem_sharing, d);
-}
-#endif
-
-static inline int xsm_platform_op(xsm_default_t def, uint32_t op)
-{
-    return alternative_call(xsm_ops.platform_op, op);
-}
-
-#ifdef CONFIG_X86
-static inline int xsm_do_mca(xsm_default_t def)
-{
-    return alternative_call(xsm_ops.do_mca);
-}
-
-static inline int xsm_mem_sharing_op(
-    xsm_default_t def, struct domain *d, struct domain *cd, int op)
-{
-    return alternative_call(xsm_ops.mem_sharing_op, d, cd, op);
-}
-
-static inline int xsm_apic(xsm_default_t def, struct domain *d, int cmd)
-{
-    return alternative_call(xsm_ops.apic, d, cmd);
-}
-
-static inline int xsm_machine_memory_map(xsm_default_t def)
-{
-    return alternative_call(xsm_ops.machine_memory_map);
-}
-
-static inline int xsm_domain_memory_map(xsm_default_t def, struct domain *d)
-{
-    return alternative_call(xsm_ops.domain_memory_map, d);
-}
-
-static inline int xsm_mmu_update(
-    xsm_default_t def, struct domain *d, struct domain *t, struct domain *f,
-    uint32_t flags)
-{
-    return alternative_call(xsm_ops.mmu_update, d, t, f, flags);
-}
-
-static inline int xsm_mmuext_op(
-    xsm_default_t def, struct domain *d, struct domain *f)
-{
-    return alternative_call(xsm_ops.mmuext_op, d, f);
-}
-
-static inline int xsm_update_va_mapping(
-    xsm_default_t def, struct domain *d, struct domain *f, l1_pgentry_t pte)
-{
-    return alternative_call(xsm_ops.update_va_mapping, d, f, pte);
-}
-
-static inline int xsm_priv_mapping(
-    xsm_default_t def, struct domain *d, struct domain *t)
-{
-    return alternative_call(xsm_ops.priv_mapping, d, t);
-}
-
-static inline int xsm_ioport_permission(
-    xsm_default_t def, struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
-{
-    return alternative_call(xsm_ops.ioport_permission, d, s, e, allow);
-}
-
-static inline int xsm_ioport_mapping(
-    xsm_default_t def, struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
-{
-    return alternative_call(xsm_ops.ioport_mapping, d, s, e, allow);
-}
-
-static inline int xsm_pmu_op(
-    xsm_default_t def, struct domain *d, unsigned int op)
-{
-    return alternative_call(xsm_ops.pmu_op, d, op);
-}
-
-#endif /* CONFIG_X86 */
-
-static inline int xsm_dm_op(xsm_default_t def, struct domain *d)
-{
-    return alternative_call(xsm_ops.dm_op, d);
-}
-
-static inline int xsm_xen_version(xsm_default_t def, uint32_t op)
-{
-    return alternative_call(xsm_ops.xen_version, op);
-}
-
-static inline int xsm_domain_resource_map(xsm_default_t def, struct domain *d)
-{
-    return alternative_call(xsm_ops.domain_resource_map, d);
-}
-
 #ifdef CONFIG_ARGO
 static inline int xsm_argo_enable(const struct domain *d)
 {
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -16,124 +16,37 @@
 static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .set_system_active             = xsm_set_system_active,
     .security_domaininfo           = xsm_security_domaininfo,
-    .domain_create                 = xsm_domain_create,
-    .getdomaininfo                 = xsm_getdomaininfo,
-    .set_target                    = xsm_set_target,
-    .domctl                        = xsm_domctl,
-#ifdef CONFIG_SYSCTL
-    .sysctl                        = xsm_sysctl,
-#endif
 
-    .evtchn_unbound                = xsm_evtchn_unbound,
-    .evtchn_interdomain            = xsm_evtchn_interdomain,
+#define XSM_HOOK0(rtype, name) .name = xsm_ ## name,
+#define XSM_HOOK1(rtype, name, ...) XSM_HOOK0(rtype, name)
+#define XSM_HOOK2(rtype, name, ...) XSM_HOOK0(rtype, name)
+#define XSM_HOOK3(rtype, name, ...) XSM_HOOK0(rtype, name)
+#define XSM_HOOK4(rtype, name, ...) XSM_HOOK0(rtype, name)
+#define XSM_HOOK5(rtype, name, ...) XSM_HOOK0(rtype, name)
+
+#include <xsm/hooks.h>
+
     .evtchn_close_post             = xsm_evtchn_close_post,
-    .evtchn_send                   = xsm_evtchn_send,
-    .evtchn_status                 = xsm_evtchn_status,
-    .evtchn_reset                  = xsm_evtchn_reset,
-
-    .grant_mapref                  = xsm_grant_mapref,
-    .grant_unmapref                = xsm_grant_unmapref,
-    .grant_setup                   = xsm_grant_setup,
-    .grant_transfer                = xsm_grant_transfer,
-    .grant_copy                    = xsm_grant_copy,
-    .grant_query_size              = xsm_grant_query_size,
 
     .alloc_security_domain         = xsm_alloc_security_domain,
     .free_security_domain          = xsm_free_security_domain,
     .alloc_security_evtchns        = xsm_alloc_security_evtchns,
     .free_security_evtchns         = xsm_free_security_evtchns,
     .show_security_evtchn          = xsm_show_security_evtchn,
-    .init_hardware_domain          = xsm_init_hardware_domain,
-
-    .get_pod_target                = xsm_get_pod_target,
-    .set_pod_target                = xsm_set_pod_target,
-
-    .memory_exchange               = xsm_memory_exchange,
-    .memory_adjust_reservation     = xsm_memory_adjust_reservation,
-    .memory_stat_reservation       = xsm_memory_stat_reservation,
-    .memory_pin_page               = xsm_memory_pin_page,
-    .claim_pages                   = xsm_claim_pages,
-
-    .console_io                    = xsm_console_io,
-
-    .kexec                         = xsm_kexec,
-    .schedop_shutdown              = xsm_schedop_shutdown,
 
     .show_irq_sid                  = xsm_show_irq_sid,
-    .map_domain_pirq               = xsm_map_domain_pirq,
-    .map_domain_irq                = xsm_map_domain_irq,
-    .unmap_domain_pirq             = xsm_unmap_domain_pirq,
-    .unmap_domain_irq              = xsm_unmap_domain_irq,
-    .bind_pt_irq                   = xsm_bind_pt_irq,
-    .unbind_pt_irq                 = xsm_unbind_pt_irq,
-    .irq_permission                = xsm_irq_permission,
-    .iomem_permission              = xsm_iomem_permission,
-    .iomem_mapping                 = xsm_iomem_mapping,
-    .iomem_mapping_vpci            = xsm_iomem_mapping_vpci,
-    .pci_config_permission         = xsm_pci_config_permission,
-    .get_vnumainfo                 = xsm_get_vnumainfo,
-
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
-    .get_device_group              = xsm_get_device_group,
-#endif
-
-    .resource_plug_pci             = xsm_resource_plug_pci,
-    .resource_unplug_pci           = xsm_resource_unplug_pci,
-    .resource_setup_pci            = xsm_resource_setup_pci,
-    .resource_setup_gsi            = xsm_resource_setup_gsi,
-    .resource_setup_misc           = xsm_resource_setup_misc,
-
-    .hypfs_op                      = xsm_hypfs_op,
-    .hvm_param                     = xsm_hvm_param,
-    .hvm_param_altp2mhvm           = xsm_hvm_param_altp2mhvm,
-    .hvm_altp2mhvm_op              = xsm_hvm_altp2mhvm_op,
 
     .do_xsm_op                     = xsm_do_xsm_op,
 #ifdef CONFIG_COMPAT
     .do_compat_op                  = xsm_do_compat_op,
 #endif
 
-    .add_to_physmap                = xsm_add_to_physmap,
-    .remove_from_physmap           = xsm_remove_from_physmap,
-    .map_gmfn_foreign              = xsm_map_gmfn_foreign,
-
-#ifdef CONFIG_VM_EVENT
-    .mem_access                    = xsm_mem_access,
-#endif
-
-#ifdef CONFIG_MEM_PAGING
-    .mem_paging                    = xsm_mem_paging,
-#endif
-
-#ifdef CONFIG_MEM_SHARING
-    .mem_sharing                   = xsm_mem_sharing,
-#endif
-
-    .platform_op                   = xsm_platform_op,
-#ifdef CONFIG_X86
-    .do_mca                        = xsm_do_mca,
-    .mem_sharing_op                = xsm_mem_sharing_op,
-    .apic                          = xsm_apic,
-    .machine_memory_map            = xsm_machine_memory_map,
-    .domain_memory_map             = xsm_domain_memory_map,
-    .mmu_update                    = xsm_mmu_update,
-    .mmuext_op                     = xsm_mmuext_op,
-    .update_va_mapping             = xsm_update_va_mapping,
-    .priv_mapping                  = xsm_priv_mapping,
-    .ioport_permission             = xsm_ioport_permission,
-    .ioport_mapping                = xsm_ioport_mapping,
-    .pmu_op                        = xsm_pmu_op,
-#endif
-    .dm_op                         = xsm_dm_op,
-    .xen_version                   = xsm_xen_version,
-    .domain_resource_map           = xsm_domain_resource_map,
 #ifdef CONFIG_ARGO
     .argo_enable                   = xsm_argo_enable,
     .argo_register_single_source   = xsm_argo_register_single_source,
     .argo_register_any_source      = xsm_argo_register_any_source,
     .argo_send                     = xsm_argo_send,
 #endif
-    .get_domain_state              = xsm_get_domain_state,
 };
 
 void __init xsm_fixup_ops(struct xsm_ops *ops)
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1215,6 +1215,7 @@ static int cf_check flask_iomem_mapping(
 {
     return flask_iomem_permission(d, start, end, access);
 }
+#define flask_iomem_mapping_vpci flask_iomem_mapping
 
 static int cf_check flask_pci_config_permission(
     struct domain *d, uint32_t machine_bdf, uint16_t start, uint16_t end,
@@ -1713,6 +1714,7 @@ static int cf_check flask_ioport_mapping
     return flask_ioport_permission(d, start, end, access);
 }
 
+#ifdef CONFIG_MEM_SHARING
 static int cf_check flask_mem_sharing_op(
     struct domain *d, struct domain *cd, int op)
 {
@@ -1721,6 +1723,7 @@ static int cf_check flask_mem_sharing_op
         return rc;
     return domain_has_perm(d, cd, SECCLASS_HVM, HVM__SHARE_MEM);
 }
+#endif
 
 static int cf_check flask_apic(struct domain *d, int cmd)
 {
@@ -1911,125 +1914,38 @@ static int cf_check flask_get_domain_sta
 static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .set_system_active = flask_set_system_active,
     .security_domaininfo = flask_security_domaininfo,
-    .domain_create = flask_domain_create,
-    .getdomaininfo = flask_getdomaininfo,
-    .set_target = flask_set_target,
-    .domctl = flask_domctl,
-#ifdef CONFIG_SYSCTL
-    .sysctl = flask_sysctl,
-#endif
 
-    .evtchn_unbound = flask_evtchn_unbound,
-    .evtchn_interdomain = flask_evtchn_interdomain,
+#define XSM_HOOK0(rtype, name) .name = flask_ ## name,
+#define XSM_HOOK1(rtype, name, ...) XSM_HOOK0(rtype, name)
+#define XSM_HOOK2(rtype, name, ...) XSM_HOOK0(rtype, name)
+#define XSM_HOOK3(rtype, name, ...) XSM_HOOK0(rtype, name)
+#define XSM_HOOK4(rtype, name, ...) XSM_HOOK0(rtype, name)
+#define XSM_HOOK5(rtype, name, ...) XSM_HOOK0(rtype, name)
+
+#include <xsm/hooks.h>
+
     .evtchn_close_post = flask_evtchn_close_post,
-    .evtchn_send = flask_evtchn_send,
-    .evtchn_status = flask_evtchn_status,
-    .evtchn_reset = flask_evtchn_reset,
-
-    .grant_mapref = flask_grant_mapref,
-    .grant_unmapref = flask_grant_unmapref,
-    .grant_setup = flask_grant_setup,
-    .grant_transfer = flask_grant_transfer,
-    .grant_copy = flask_grant_copy,
-    .grant_query_size = flask_grant_query_size,
 
     .alloc_security_domain = flask_domain_alloc_security,
     .free_security_domain = flask_domain_free_security,
     .alloc_security_evtchns = flask_alloc_security_evtchns,
     .free_security_evtchns = flask_free_security_evtchns,
     .show_security_evtchn = flask_show_security_evtchn,
-    .init_hardware_domain = flask_init_hardware_domain,
-
-    .get_pod_target = flask_get_pod_target,
-    .set_pod_target = flask_set_pod_target,
-    .memory_exchange = flask_memory_exchange,
-    .memory_adjust_reservation = flask_memory_adjust_reservation,
-    .memory_stat_reservation = flask_memory_stat_reservation,
-    .memory_pin_page = flask_memory_pin_page,
-    .claim_pages = flask_claim_pages,
-
-    .console_io = flask_console_io,
-
-    .kexec = flask_kexec,
-    .schedop_shutdown = flask_schedop_shutdown,
 
     .show_irq_sid = flask_show_irq_sid,
 
-    .map_domain_pirq = flask_map_domain_pirq,
-    .map_domain_irq = flask_map_domain_irq,
-    .unmap_domain_pirq = flask_unmap_domain_pirq,
-    .unmap_domain_irq = flask_unmap_domain_irq,
-    .bind_pt_irq = flask_bind_pt_irq,
-    .unbind_pt_irq = flask_unbind_pt_irq,
-    .irq_permission = flask_irq_permission,
-    .iomem_permission = flask_iomem_permission,
-    .iomem_mapping = flask_iomem_mapping,
-    .iomem_mapping_vpci = flask_iomem_mapping,
-    .pci_config_permission = flask_pci_config_permission,
-
-    .resource_plug_pci = flask_resource_plug_pci,
-    .resource_unplug_pci = flask_resource_unplug_pci,
-    .resource_setup_pci = flask_resource_setup_pci,
-    .resource_setup_gsi = flask_resource_setup_gsi,
-    .resource_setup_misc = flask_resource_setup_misc,
-
-    .hypfs_op = flask_hypfs_op,
-    .hvm_param = flask_hvm_param,
-    .hvm_param_altp2mhvm = flask_hvm_param_altp2mhvm,
-    .hvm_altp2mhvm_op = flask_hvm_altp2mhvm_op,
-
     .do_xsm_op = do_flask_op,
-    .get_vnumainfo = flask_get_vnumainfo,
-
-#ifdef CONFIG_VM_EVENT
-    .mem_access = flask_mem_access,
-#endif
-
-#ifdef CONFIG_MEM_PAGING
-    .mem_paging = flask_mem_paging,
-#endif
-
-#ifdef CONFIG_MEM_SHARING
-    .mem_sharing = flask_mem_sharing,
-#endif
 
 #ifdef CONFIG_COMPAT
     .do_compat_op = compat_flask_op,
 #endif
 
-    .add_to_physmap = flask_add_to_physmap,
-    .remove_from_physmap = flask_remove_from_physmap,
-    .map_gmfn_foreign = flask_map_gmfn_foreign,
-
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
-    .get_device_group = flask_get_device_group,
-#endif
-
-    .platform_op = flask_platform_op,
-#ifdef CONFIG_X86
-    .do_mca = flask_do_mca,
-    .mem_sharing_op = flask_mem_sharing_op,
-    .apic = flask_apic,
-    .machine_memory_map = flask_machine_memory_map,
-    .domain_memory_map = flask_domain_memory_map,
-    .mmu_update = flask_mmu_update,
-    .mmuext_op = flask_mmuext_op,
-    .update_va_mapping = flask_update_va_mapping,
-    .priv_mapping = flask_priv_mapping,
-    .ioport_permission = flask_ioport_permission,
-    .ioport_mapping = flask_ioport_mapping,
-    .pmu_op = flask_pmu_op,
-#endif
-    .dm_op = flask_dm_op,
-    .xen_version = flask_xen_version,
-    .domain_resource_map = flask_domain_resource_map,
 #ifdef CONFIG_ARGO
     .argo_enable = flask_argo_enable,
     .argo_register_single_source = flask_argo_register_single_source,
     .argo_register_any_source = flask_argo_register_any_source,
     .argo_send = flask_argo_send,
 #endif
-    .get_domain_state = flask_get_domain_state,
 };
 
 const struct xsm_ops *__init flask_init(


