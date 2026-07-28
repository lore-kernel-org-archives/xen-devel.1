Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2911C54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 13:23:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374157.1621127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohmO-0004ee-8J; Tue, 28 Jul 2026 13:23:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374157.1621127; Tue, 28 Jul 2026 13:23:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohmO-0004eX-5c; Tue, 28 Jul 2026 13:23:32 +0000
Received: by outflank-mailman (input) for mailman id 1374157;
 Tue, 28 Jul 2026 13:23:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wohmM-0004eL-Rq
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:23:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wohmM-004meQ-8J
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:23:30 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68ad48-bab6-0a2a0a5309dd-0a2a4506bea2-30
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:23:30 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68ad52-195a-0a2a45060019-d1558036cc2c-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:23:30 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4955aa106b1so36863885e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:23:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496c45de1a3sm88411125e9.11.2026.07.28.06.23.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 06:23:28 -0700 (PDT)
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
        d=suse.com; s=google; t=1785245010; x=1785849810; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uWalkTy0K6dBubCLA5u6FxobY3yZutCgqd3ZaxzhGJc=;
        b=HUnYihVJ3A3HADe6SfY1OVrqXKv614wkHx/eweK0BPyDiafhXhFvbKrdPytMcZELb2
         cwS5tiA9CW3LldU8Wa2tyRW1B3jzxAb5Yw+GqQEiFByjvNsASGcXHXCdjRbn0r8kQuQD
         4W+RfY2l0W5arYCwAOreggVs06Odj7Zp8SkACjwg0QC1v5soSvVwecZykCPDVVBDlRmI
         9X5T7WeK0ipt9utPb/F64Ac/V+1Vf36apu+voUKchyQMGwl61GPFc21f8crZLz0gSAYa
         kakk41zMhldps5WGmW1i3KvVphx1R4sgAXtBAr1LGKDfK3zAqVbH4PO/7TB00QKLb1DK
         kBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785245010; x=1785849810;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uWalkTy0K6dBubCLA5u6FxobY3yZutCgqd3ZaxzhGJc=;
        b=GCdb5Bck4t94wvcHV9L4kto6+fIZWLsmWiDeIy87PLXzFj5oRCEUqA43cIiVL74f0u
         r1UVSGULETjS5+6mmu/5ZObT0yVgbWB312bPiRSoL3jC7NF6MWgQS2a8n0EdJffXCZlB
         7xZiM+fM7fxL/90uQ3fK8K4nhoOPdbS54TChBfCKXFU1aaGIO4pbK4NaVOXkDFTy6a4r
         2XGhwyBiWeRruLa/RvytOB6Il/ASbmCBQZGjRQmhhCCpNxAWHvJmxY3hxWpHjihWJLSx
         qtDrnXvN80pwocgj1C9uKHpC/tCe4dMHDdCMQAqa2SAtj6iW8pc8CaoSEOfGythPp651
         SMyw==
X-Gm-Message-State: AOJu0YxonsjZq1hTFksMPGqJqSA1usW/Vo/7pH5kaaQEF/37XVPxxowt
	VOlJ87ayVE3hRtdpbuR7UjNLRI7eCAn+2deY8HVII4Xf3EjVdfv+Yqdyg8yEGMioiQocHSwkADK
	46xyhmg==
X-Gm-Gg: AR+sD13TSqs0LooMXLAdUAAwQj8pkEGZvEOjaE2gglSgVRk8cuVGh8VV1QAGhJFrkAC
	NfJ0UTAkUrru+yWH7yWclONjGiaq6CqQhvpCOqNxeZ4xxWwGJ5DiiOHKj51vo/D2HN1o8FNP7v/
	tnB9NOu/z7jGl65DXcJco/bxzdxUJPyCCgcbD/Iugz3WCLG7CMBlEhTmYSGLgI9N/tEAR7kRJGt
	BLkfKuDmtfk0Hfk0LlpoMsFLzlIbPbT3zvNw7aoNm3evTL1PruhRBq4N/pyELd+IyjG/v/0jLm+
	BnFJcD3leR46tfY9aScHS3bQv4rTK+kt3os62gEpcefDlWwgofimhBftZH5NEkc2Lu48QC6Tb7d
	aIcjRTtq+6954285I5yjUPM1UA00cZyZf57WLAsBnpHGpdrT+j9FmFDJ3JRoZ5pgbb33ultG3TN
	ORpyf/Kk3HIsHKf/1SSyojydbLsz0ZS7afgsvMnmHglQzpM7oajKAxN88WXnQEgUBatw==
X-Received: by 2002:a05:600c:5298:b0:495:4df2:b8c1 with SMTP id 5b1f17b1804b1-496c659dd06mr25253695e9.35.1785245009342;
        Tue, 28 Jul 2026 06:23:29 -0700 (PDT)
Message-ID: <dc7d05da-ace4-4dc9-ad55-bdb178dfbee0@suse.com>
Date: Tue, 28 Jul 2026 15:23:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 19/24] XSM: convert "allow" (Flask: "access") parameters to
 bool
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
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
X-purgate-ID: tlsNG-16d1c6/1785245010-F540B77B-F487D2A6/0/0
X-purgate-type: clean
X-purgate-size: 9351

These are boolean, so they should always have used bool (originally
bool_t), not uint8_t. Leverage recent changes to arrange for this with
(now) fewer places which need changing (within the XSM machinery itself).
Adjust call sites as well, where the conversion wasn't done so far.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Why is it that Arm doesn't use xsm_irq_permission() at all? Same for Arm64
vs xsm_pci_config_permission().

--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -235,7 +235,7 @@ long arch_do_domctl(
     {
         unsigned int fp = domctl->u.ioport_permission.first_port;
         unsigned int np = domctl->u.ioport_permission.nr_ports;
-        int allow = domctl->u.ioport_permission.allow_access;
+        bool allow = domctl->u.ioport_permission.allow_access;
 
         ret = -EINVAL;
         if ( (fp + np) <= fp || (fp + np) > MAX_IOPORTS )
@@ -306,7 +306,8 @@ long arch_do_domctl(
             break;
         }
 
-        ret = xsm_irq_permission(XSM_PRIV, d, irq, flags);
+        ret = xsm_irq_permission(XSM_PRIV, d, irq,
+                                 flags & XEN_DOMCTL_GSI_ACTION_MASK);
         if ( ret )
             break;
 
@@ -687,7 +688,7 @@ long arch_do_domctl(
         unsigned int fgp = domctl->u.ioport_mapping.first_gport;
         unsigned int fmp = domctl->u.ioport_mapping.first_mport;
         unsigned int np = domctl->u.ioport_mapping.nr_ports;
-        unsigned int add = domctl->u.ioport_mapping.add_mapping;
+        bool add = domctl->u.ioport_mapping.add_mapping;
         struct hvm_domain *hvm;
         struct g2m_ioport *g2m_ioport;
         int found = 0;
--- a/xen/arch/x86/pci.c
+++ b/xen/arch/x86/pci.c
@@ -78,7 +78,7 @@ int pci_conf_write_intercept(unsigned in
 {
     struct pci_dev *pdev;
     int rc = xsm_pci_config_permission(XSM_HOOK, current->domain, bdf,
-                                       reg, reg + size - 1, 1);
+                                       reg, reg + size - 1, true);
 
     if ( rc < 0 )
         return rc;
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -260,7 +260,7 @@ static bool pci_cfg_ok(struct domain *cu
 
     return !write ?
            xsm_pci_config_permission(XSM_HOOK, currd, machine_bdf,
-                                     start, start + size - 1, 0) == 0 :
+                                     start, start + size - 1, false) == 0 :
            pci_conf_write_intercept(0, machine_bdf, start, size, write) >= 0;
 }
 
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -505,21 +505,21 @@ static XSM_INLINE int xsm_unmap_domain_i
 }
 
 static XSM_INLINE int xsm_irq_permission(
-    XSM_DEFAULT_ARG struct domain *d, int pirq, uint8_t allow)
+    XSM_DEFAULT_ARG struct domain *d, int pirq, bool allow)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
 static XSM_INLINE int xsm_iomem_permission(
-    XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
+    XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, bool allow)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
 static XSM_INLINE int xsm_iomem_mapping(
-    XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
+    XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, bool allow)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
@@ -527,7 +527,7 @@ static XSM_INLINE int xsm_iomem_mapping(
 
 #ifdef CONFIG_HAS_VPCI
 static XSM_INLINE int xsm_iomem_mapping_vpci(
-    XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
+    XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, bool allow)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
@@ -537,7 +537,7 @@ static XSM_INLINE int xsm_iomem_mapping_
 #ifdef CONFIG_HAS_PCI
 static XSM_INLINE int xsm_pci_config_permission(
     XSM_DEFAULT_ARG struct domain *d, uint32_t machine_bdf, uint16_t start,
-    uint16_t end, uint8_t access)
+    uint16_t end, bool access)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
@@ -711,14 +711,14 @@ static XSM_INLINE int xsm_priv_mapping(
 #endif
 
 static XSM_INLINE int xsm_ioport_permission(
-    XSM_DEFAULT_ARG struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
+    XSM_DEFAULT_ARG struct domain *d, uint32_t s, uint32_t e, bool allow)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
 static XSM_INLINE int xsm_ioport_mapping(
-    XSM_DEFAULT_ARG struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
+    XSM_DEFAULT_ARG struct domain *d, uint32_t s, uint32_t e, bool allow)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
--- a/xen/include/xsm/hooks.h
+++ b/xen/include/xsm/hooks.h
@@ -77,12 +77,12 @@ XSM_HOOK(int, unmap_domain_irq, struct d
 XSM_HOOK(int, bind_pt_irq, struct domain *, struct xen_domctl_bind_pt_irq *)
 XSM_HOOK(int, unbind_pt_irq, struct domain *, struct xen_domctl_bind_pt_irq *)
 
-XSM_HOOK(int, irq_permission, struct domain *, int, uint8_t)
-XSM_HOOK(int, iomem_permission, struct domain *, uint64_t, uint64_t, uint8_t)
+XSM_HOOK(int, irq_permission, struct domain *, int, bool)
+XSM_HOOK(int, iomem_permission, struct domain *, uint64_t, uint64_t, bool)
 
-XSM_HOOK(int, iomem_mapping, struct domain *, uint64_t, uint64_t, uint8_t)
+XSM_HOOK(int, iomem_mapping, struct domain *, uint64_t, uint64_t, bool)
 #ifdef CONFIG_HAS_VPCI
-XSM_HOOK(int, iomem_mapping_vpci, struct domain *, uint64_t, uint64_t, uint8_t)
+XSM_HOOK(int, iomem_mapping_vpci, struct domain *, uint64_t, uint64_t, bool)
 #endif
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
@@ -97,7 +97,7 @@ XSM_HOOK(int, resource_setup_misc)
 XSM_HOOK(int, resource_setup_pci, uint32_t)
 XSM_HOOK(int, resource_setup_gsi, int)
 XSM_HOOK(int, pci_config_permission, struct domain *, uint32_t, uint16_t,
-                                     uint16_t, uint8_t)
+                                     uint16_t, bool)
 #endif
 
 #ifdef CONFIG_HYPFS
@@ -144,8 +144,8 @@ XSM_HOOK(int, update_va_mapping, struct
 #if defined(CONFIG_PV) || defined(CONFIG_SHADOW_PAGING)
 XSM_HOOK(int, priv_mapping, struct domain *, struct domain *)
 #endif
-XSM_HOOK(int, ioport_permission, struct domain *, uint32_t, uint32_t, uint8_t)
-XSM_HOOK(int, ioport_mapping, struct domain *, uint32_t, uint32_t, uint8_t)
+XSM_HOOK(int, ioport_permission, struct domain *, uint32_t, uint32_t, bool)
+XSM_HOOK(int, ioport_mapping, struct domain *, uint32_t, uint32_t, bool)
 XSM_HOOK(int, pmu_op, struct domain *, unsigned int)
 #endif /* CONFIG_X86 */
 
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -998,7 +998,7 @@ static int cf_check flask_sysctl(const s
 }
 #endif /* CONFIG_SYSCTL */
 
-static inline uint32_t resource_to_perm(uint8_t access)
+static inline uint32_t resource_to_perm(bool access)
 {
     if ( access )
         return RESOURCE__ADD;
@@ -1166,7 +1166,7 @@ static int cf_check flask_unbind_pt_irq(
 }
 
 static int cf_check flask_irq_permission(
-    struct domain *d, int pirq, uint8_t access)
+    struct domain *d, int pirq, bool access)
 {
     /* the PIRQ number is not useful; real IRQ is checked during mapping */
     return current_has_perm(d, SECCLASS_RESOURCE, resource_to_perm(access));
@@ -1199,7 +1199,7 @@ static int cf_check _iomem_has_perm(
 }
 
 static int cf_check flask_iomem_permission(
-    struct domain *d, uint64_t start, uint64_t end, uint8_t access)
+    struct domain *d, uint64_t start, uint64_t end, bool access)
 {
     struct iomem_has_perm_data data;
     int rc;
@@ -1221,7 +1221,8 @@ static int cf_check flask_iomem_permissi
     return security_iterate_iomem_sids(start, end, _iomem_has_perm, &data);
 }
 
-static int cf_check flask_iomem_mapping(struct domain *d, uint64_t start, uint64_t end, uint8_t access)
+static int cf_check flask_iomem_mapping(
+    struct domain *d, uint64_t start, uint64_t end, bool access)
 {
     return flask_iomem_permission(d, start, end, access);
 }
@@ -1230,7 +1231,7 @@ static int cf_check flask_iomem_mapping(
 #ifdef CONFIG_HAS_PCI
 static int cf_check flask_pci_config_permission(
     struct domain *d, uint32_t machine_bdf, uint16_t start, uint16_t end,
-    uint8_t access)
+    bool access)
 {
     uint32_t dsid, rsid;
     int rc = -EPERM;
@@ -1709,7 +1710,7 @@ static int cf_check _ioport_has_perm(
 }
 
 static int cf_check flask_ioport_permission(
-    struct domain *d, uint32_t start, uint32_t end, uint8_t access)
+    struct domain *d, uint32_t start, uint32_t end, bool access)
 {
     int rc;
     struct ioport_has_perm_data data;
@@ -1733,7 +1734,7 @@ static int cf_check flask_ioport_permiss
 }
 
 static int cf_check flask_ioport_mapping(
-    struct domain *d, uint32_t start, uint32_t end, uint8_t access)
+    struct domain *d, uint32_t start, uint32_t end, bool access)
 {
     return flask_ioport_permission(d, start, end, access);
 }


