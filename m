Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD13C54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 13:27:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374188.1621164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohq0-0006vw-EN; Tue, 28 Jul 2026 13:27:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374188.1621164; Tue, 28 Jul 2026 13:27:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohq0-0006vp-AM; Tue, 28 Jul 2026 13:27:16 +0000
Received: by outflank-mailman (input) for mailman id 1374188;
 Tue, 28 Jul 2026 13:27:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wohpz-0006vj-03
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:27:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wohpy-00ETnQ-9V
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:27:14 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68ae30-2eae-0a2a0a5409dd-0a2a4508dce4-8
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:27:14 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68adf6-f659-0a2a45080019-d1558030c5ef-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:26:14 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4954c0833b4so28701745e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:26:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496c45c297dsm74981765e9.7.2026.07.28.06.26.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 06:26:13 -0700 (PDT)
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
        d=suse.com; s=google; t=1785245174; x=1785849974; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=A9LQ0YbONOfKcGHn8Pxg/3chj8rv49uQXmbI7DaWPL4=;
        b=ALD7ehf8X2hr6B7NlbpfYaR/uBVVFP3PCxsVwVPDQ7uzE/S1OoBupM8G2MRvHDAb9j
         x1W6Oa6yFHJl5BglrC8o5pqxdAbLr1RHFEYs17mNt/dLP1behYGILbObT5onyhVF3DCE
         nlbCXC0VvU0IdekkfGIwKEKSbgbLGf5s93pLdGkvfqjcRUhYxB6Jd7v45pAT7mLjbYxf
         vO85IFoZ+SsX++G6RRkan3UvwjCutK75Vj8zJDYgJd3bVdAuektCX73cpOgvUx3mA+o9
         T5gnK7DRUmdMt/rZ/QNeyeIXtzOczlkuNBUHKqaUr7vvU8khPCmgcgHbZkcH6ZJPTbh4
         S/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785245174; x=1785849974;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A9LQ0YbONOfKcGHn8Pxg/3chj8rv49uQXmbI7DaWPL4=;
        b=SLSptZWxY2di8EcpoK5vpcaex1DlJiVnyN2yco3Q2IrRYJ4MwynVxH34+PjQs0mveT
         s9MksIcfZhHeKqt316MIIHwHwix9eg0P7tsnWHAItJch9O+Xe8DWY7s2p6zjKWhhJRn/
         fu/xqCog4iRxTK91MJ1/8+aIZaCeOTpMy5+IxcWNoanhibL2xjc0fezLlL3f4NBV3dXy
         5kSVQ9oS/Xpu5KQZx2M8lcfp94n0hHMn+oRLrtBm0RYyuR8Ma6ZE/62HtTPkzq/KYIsI
         ELzQL+MrfFN0lrcyMSr5f+qpW5gzlBdkOLmHzN+BreVKOwPZ/KrYNsMY7LO4gl93IUV/
         dzVA==
X-Gm-Message-State: AOJu0YzURQaJkSNKPTzHUIH5OpiY64oi8AT6dYP0L5Pyb7aWPybFqjX1
	P1uaq0ucL1qauDblJmAeHAbJt8MJWvzLUduEMvOl3CVx+VnXcATr/Nx2XeQIh8xwLsxVJeic8Zm
	Qj6EWEg==
X-Gm-Gg: AR+sD10SaFB+3RVCVnte/naHeQCDVRpq33o0Eitm/l5epxJaSlSTqGH5Puu3xuNhOxK
	VHnfQixDIC87dyQWRckc8i/rN4bKUuWEbepZA2yASWisBZJKaGwn9Tv5yG4gBTUn0ngdLtYULHo
	C6hmWXJ8V9bi9pY233xee/I567ZIpjwPg2p930Y2sUI75HK4KpTz+b6Ym6bnnhFXUuLkqNLPvhr
	pvzA+ced1yOqF7tvm31JIg4FrlADC6AcKQ9NN+JyBkCjSVz7DWG1SrbCRomMtKMsBwrEfac66ox
	UO8tZIYRw3IFw66KajdwfzavvHSVSGhbEEGaPrAhqsUv05O8hh/pwqrxVGogCI9lmeU02E8wSyM
	Mq47/LD0ldmlTDYlzzFvoLIGhG9cdn3wBhcnLW+tR25xWh5JP/4TtUsyZe+3riuk2Sr1I7RSe6m
	wMC/9OC8dHXmFHdX/Bf9+T3FBVRjfJ8ceOqiLrMLtRF2RoWmQMo3+O43k89HDngDCEtQ==
X-Received: by 2002:a05:600c:630d:b0:495:6134:6d61 with SMTP id 5b1f17b1804b1-496c6568d4bmr30173215e9.19.1785245173544;
        Tue, 28 Jul 2026 06:26:13 -0700 (PDT)
Message-ID: <e2e0a2d4-0b18-400a-a5aa-4507c1e8a7b2@suse.com>
Date: Tue, 28 Jul 2026 15:26:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 23/24] XSM: fold xsm_{,un}map_domain_irq() hooks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
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
X-purgate-ID: tlsNG-c1860d/1785245174-D694287B-30B7C026/0/0
X-purgate-type: clean
X-purgate-size: 5016

Like other resource management hooks they are (now) mainly different in
"add resource" vs "remove resource". Hence like in other cases a single
hook can easily serve both purposes, with minor tweaking of
flask_map_domain_irq(). While adjusting that function, also defer the
setting of local variables only needed in the "map" case.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -100,7 +100,7 @@ long arch_do_domctl(struct xen_domctl *d
          * done by the 2 hypercalls for consistency with other
          * architectures.
          */
-        rc = xsm_map_domain_irq(XSM_HOOK, d, irq, NULL);
+        rc = xsm_map_domain_irq(XSM_HOOK, d, irq, NULL, true);
         if ( rc )
             return rc;
 
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2214,7 +2214,7 @@ int map_domain_pirq(
         return 0;
     }
 
-    ret = xsm_map_domain_irq(XSM_HOOK, d, irq, msi ? &msi->sbdf : NULL);
+    ret = xsm_map_domain_irq(XSM_HOOK, d, irq, msi ? &msi->sbdf : NULL, true);
     if ( ret )
     {
         dprintk(XENLOG_G_ERR, "dom%d: could not permit access to irq %d mapping to pirq %d\n",
@@ -2441,8 +2441,8 @@ int unmap_domain_pirq(struct domain *d,
      * domain.  Skip the XSM check since this is a Xen-initiated action.
      */
     if ( !d->is_dying )
-        ret = xsm_unmap_domain_irq(XSM_HOOK, d, irq,
-                                   msi_desc ? &msi_desc->dev->sbdf : NULL);
+        ret = xsm_map_domain_irq(XSM_HOOK, d, irq,
+                                 msi_desc ? &msi_desc->dev->sbdf : NULL, false);
 
     if ( ret )
         goto done;
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -470,7 +470,8 @@ static XSM_INLINE int xsm_map_domain_pir
 #endif /* CONFIG_HAS_PIRQ */
 
 static XSM_INLINE int xsm_map_domain_irq(
-    XSM_DEFAULT_ARG struct domain *d, int irq, const pci_sbdf_t *sbdf)
+    XSM_DEFAULT_ARG struct domain *d, int irq, const pci_sbdf_t *sbdf,
+    bool allow)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
@@ -490,13 +491,6 @@ static XSM_INLINE int xsm_unbind_pt_irq(
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_unmap_domain_irq(
-    XSM_DEFAULT_ARG struct domain *d, int irq, const pci_sbdf_t *sbdf)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
 static XSM_INLINE int xsm_irq_permission(
     XSM_DEFAULT_ARG struct domain *d, int pirq, bool allow)
 {
--- a/xen/include/xsm/hooks.h
+++ b/xen/include/xsm/hooks.h
@@ -71,8 +71,7 @@ XSM_HOOK(int, schedop_shutdown, struct d
 XSM_HOOK(int, map_domain_pirq, struct domain *, bool)
 #endif
 
-XSM_HOOK(int, map_domain_irq, struct domain *, int, const pci_sbdf_t *)
-XSM_HOOK(int, unmap_domain_irq, struct domain *, int, const pci_sbdf_t *)
+XSM_HOOK(int, map_domain_irq, struct domain *, int, const pci_sbdf_t *, bool)
 XSM_HOOK(int, bind_pt_irq, struct domain *, struct xen_domctl_bind_pt_irq *)
 XSM_HOOK(int, unbind_pt_irq, struct domain *, struct xen_domctl_bind_pt_irq *)
 
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1063,12 +1063,11 @@ static uint32_t flask_iommu_resource_use
 }
 
 static int cf_check flask_map_domain_irq(
-    struct domain *d, int irq, const pci_sbdf_t *sbdf)
+    struct domain *d, int irq, const pci_sbdf_t *sbdf, bool access)
 {
-    uint32_t sid, dsid;
+    uint32_t sid, dsid, dperm;
     int rc = -EPERM;
     struct avc_audit_data ad;
-    uint32_t dperm = flask_iommu_resource_use_perm(d);
 
     if ( irq >= nr_static_irqs && sbdf )
         rc = flask_map_domain_msi(d, irq, *sbdf, &sid, &ad);
@@ -1078,33 +1077,16 @@ static int cf_check flask_map_domain_irq
     if ( rc )
         return rc;
 
-    dsid = domain_sid(d);
-
-    rc = avc_current_has_perm(sid, SECCLASS_RESOURCE, RESOURCE__ADD_IRQ, &ad);
-    if ( rc )
+    rc = avc_current_has_perm(sid, SECCLASS_RESOURCE,
+                              access ? RESOURCE__ADD_IRQ : RESOURCE__REMOVE_IRQ,
+                              &ad);
+    if ( rc || access )
         return rc;
 
-    rc = avc_has_perm(dsid, sid, SECCLASS_RESOURCE, dperm, &ad);
-    return rc;
-}
-
-static int cf_check flask_unmap_domain_irq(
-    struct domain *d, int irq, const pci_sbdf_t *sbdf)
-{
-    uint32_t sid;
-    int rc = -EPERM;
-    struct avc_audit_data ad;
-
-    if ( irq >= nr_static_irqs && sbdf )
-        rc = flask_map_domain_msi(d, irq, *sbdf, &sid, &ad);
-    else
-        rc = get_irq_sid(irq, &sid, &ad);
-
-    if ( rc )
-        return rc;
+    dsid = domain_sid(d);
+    dperm = flask_iommu_resource_use_perm(d);
 
-    rc = avc_current_has_perm(sid, SECCLASS_RESOURCE, RESOURCE__REMOVE_IRQ, &ad);
-    return rc;
+    return avc_has_perm(dsid, sid, SECCLASS_RESOURCE, dperm, &ad);
 }
 
 static int cf_check flask_bind_pt_irq(


