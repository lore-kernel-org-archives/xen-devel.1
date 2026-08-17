Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1747C5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 08:51:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392645.1631612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvt47-0001aB-0T; Mon, 17 Aug 2026 08:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392645.1631612; Mon, 17 Aug 2026 08:51:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvt46-0001a4-U3; Mon, 17 Aug 2026 08:51:30 +0000
Received: by outflank-mailman (input) for mailman id 1392645;
 Mon, 17 Aug 2026 08:51:29 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wvt45-0001Zu-Hf
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 08:51:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvt44-00GMDv-UI
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 10:51:28 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82cb76-e002-0a2a0a5209dd-0a2a4501d510-46
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:51:28 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82cb90-5984-0a2a45010019-d155dd2ee9ae-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:51:28 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-47f7027ca11so1885740f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 01:51:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49996100073sm153443635e9.3.2026.08.17.01.51.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 01:51:27 -0700 (PDT)
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
        d=suse.com; s=google; t=1786956688; x=1787561488; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0/b/DUjZscGxl9LgcIBjaXV0FG4JzY7JAueSN3/ZjzM=;
        b=VcOU5bV+okLK/R72shYSIdSZOOtRxE3TzDRxZCwcBhuHfPH06TqUgWg6Xz2Q9Kb6K7
         e1oHSL0icWkhbz6MoIAlxyl7OPqNwvLWleVmXO+2xGGuG3J7f5tRM+i3zoqCkolVd4Sz
         RKxTirDrM77+7Lx4ncGKZgUmALO9L15yWtHaRoKqbr90D7D6zBSTiWFoTQJAZAtpR78G
         X72PA+/zWOK0lOM9oA6UCDMaJgYeljUGplpmTKSyTS29twEfrg4JbUtYaaCNxh3JVwGN
         wOQni3HswMYbHgPw5ZgijKRcSG++ycJoYtAsWXlnRrOWhTwU5l0xZGKqfiSGsY6MoFHO
         lE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786956688; x=1787561488;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0/b/DUjZscGxl9LgcIBjaXV0FG4JzY7JAueSN3/ZjzM=;
        b=TivNCezgy9IMi8v4lY3ISDazLjQ2n5JBnOdue27gieswpK+Er1mLpjJJVsXUh10VGV
         QzxMlqWWUAxwfbvtWjM/JDPwzXZ1RFo3MLbFvwfNnDB38zTJvvn1oSZXZ7wrgCyKiWw1
         PBe8DD5Nu5Ph49vOFgaOwyIq4Tq3G4Z3HXnojv0PFdwpXIl3bCx9BLkcYK0yS+a1c+Jh
         c/tAidK8Q+dl/+sI/ev12CbGNUYd2x+lwXRd4gWgWNyQYH8sA/co/j/juXOOlRN4Gc20
         ySfaXa9GfvXr+bbOOL99VfzkuTjCjuihK4AcoWaMBJ3lc2f0Qj0BLvJgSVT1ZjyXSQha
         2Ivg==
X-Gm-Message-State: AOJu0YxlIQ2hWfAObhabgG34CWDxBuDHxXe5b20ILuXqonL+vCRZnJMd
	Phwv5Z0odjnDmsX/T/qu3KaCBDiCpxK8Ja3BnyQ0vRTpS+bgjDLMe4BSE0rCxYzKV2fCx4++bPF
	fSXOSEQ==
X-Gm-Gg: AR+sD10IdGNBONBtU/hcBzwKSckh+jjz/o3pGpeHEXpmRkCpyt+XSNcBagGoZXpGPyR
	zBM3cgG9/ailjQBWkdMYOCpo7T2CSPBpIbyKPcEGf04+YWM5khXucp5hDGd/m8f1scC+SJmTdhd
	7q2/e5nYRJN50eisQPQaFpxOK4/XprOy111MJLi1+Im33dV/Ew5i39f3zPXexHpOCph7NUlSUgm
	JoeTc82EmyQpmWilL444JBX/OGN9vsoLH90uxWd5Fu8O1jLk1RDe0GHFc/8CNv9gq8PpsTiHciB
	6sh4S2S+Skt8OUb0TZzUK8/ynkZ4Vh02HqJlXVqg8ZD7hJf4BI71xzk3jz/dEoem0GfwBtIL/Jb
	8NuKhOnU7/YfP2KmnFi1U+91JDC5E8g5k2x1nHF239y2lFetoonf2CxZipSpfxIxvCtXxGCXRac
	/NLB86Zz5QigBGwnP7VyiKfcpssxd5IqFVylu8+r/kw7FgPvOCLNxLDEnnxDZ5ne9PLpG+T/Lyq
	+jRj7uXoTnH0hgr3tfhR+HMJhTgBc/lMBj4dZZvw8CFz+P6KJSt
X-Received: by 2002:a05:600c:1c21:b0:499:90f3:13b8 with SMTP id 5b1f17b1804b1-49990f315e9mr185511605e9.12.1786956688264;
        Mon, 17 Aug 2026 01:51:28 -0700 (PDT)
Message-ID: <1a4dd743-a64d-4657-b3c2-c9759799a36b@suse.com>
Date: Mon, 17 Aug 2026 10:51:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 02/14] XSM: convert "allow" (Flask: "access") parameters to
 bool
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <ef09b072-c935-459e-bf8b-81c96ff9cc46@suse.com>
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
In-Reply-To: <ef09b072-c935-459e-bf8b-81c96ff9cc46@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1786956688-BCD44757-12059775/0/0
X-purgate-type: clean
X-purgate-size: 9742

These are boolean, so they should always have used bool (originally
bool_t), not uint8_t. Leverage recent changes to arrange for this with
(now) fewer places which need changing (within the XSM machinery itself).
Adjust call sites as well, where the conversion wasn't done so far.

While doing this, rename flask_io{port,mem}_mapping()'s last parameters to
"map".

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Why is it that Arm doesn't use xsm_irq_permission() at all? Same for Arm64
vs xsm_pci_config_permission().
---
v2: Rename flask_io{port,mem}_mapping()'s last parameters to "map".

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
@@ -709,14 +709,14 @@ static XSM_INLINE int xsm_priv_mapping(
 }
 
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
@@ -142,8 +142,8 @@ XSM_HOOK(int, mmuext_op, struct domain *
 XSM_HOOK(int, update_va_mapping, struct domain *, struct domain *, l1_pgentry_t)
 #endif /* CONFIG_PV */
 XSM_HOOK(int, priv_mapping, struct domain *, struct domain *)
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
@@ -1221,16 +1221,17 @@ static int cf_check flask_iomem_permissi
     return security_iterate_iomem_sids(start, end, _iomem_has_perm, &data);
 }
 
-static int cf_check flask_iomem_mapping(struct domain *d, uint64_t start, uint64_t end, uint8_t access)
+static int cf_check flask_iomem_mapping(
+    struct domain *d, uint64_t start, uint64_t end, bool map)
 {
-    return flask_iomem_permission(d, start, end, access);
+    return flask_iomem_permission(d, start, end, map);
 }
 #define flask_iomem_mapping_vpci flask_iomem_mapping
 
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
@@ -1733,9 +1734,9 @@ static int cf_check flask_ioport_permiss
 }
 
 static int cf_check flask_ioport_mapping(
-    struct domain *d, uint32_t start, uint32_t end, uint8_t access)
+    struct domain *d, uint32_t start, uint32_t end, bool map)
 {
-    return flask_ioport_permission(d, start, end, access);
+    return flask_ioport_permission(d, start, end, map);
 }
 
 #ifdef CONFIG_MEM_SHARING


