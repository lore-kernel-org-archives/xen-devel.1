Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8654FC5DF70
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 08:55:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392704.1631692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvt84-0005CE-An; Mon, 17 Aug 2026 08:55:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392704.1631692; Mon, 17 Aug 2026 08:55:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvt84-0005Bz-5W; Mon, 17 Aug 2026 08:55:36 +0000
Received: by outflank-mailman (input) for mailman id 1392704;
 Mon, 17 Aug 2026 08:55:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wvt82-0005BI-LR
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 08:55:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvt82-009Qt6-26
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 10:55:34 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82cc84-bab6-0a2a0a5309dd-0a2a4501b900-4
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:55:33 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82cc85-5984-0a2a45010019-d155802aa5b2-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:55:33 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-495437bb891so28949605e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 01:55:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4999d0876b8sm32206315e9.8.2026.08.17.01.55.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 01:55:32 -0700 (PDT)
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
        d=suse.com; s=google; t=1786956933; x=1787561733; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XcRV9DpoQXKVy9yGwvj7aXR3BN5ZksQ4Op6sLkbWN6Y=;
        b=adaeBuAON58+6L7oGF3FxHS7yAzsylsI6RkjtoBAn9j73oRnQBHYjpKk6K3Jshmavq
         8j+u6Y3bhX7skZ03uyV1HPuKH+kEfWn8f8Q9kueIsQZWAsji/ac2nFEkSYVE+IiYlwzp
         hAJCVdOhR1/c0QHl3x6BJ1ntThD6aVf/L1qlQp5FTNzl6fNcSiapoS8x6It6vx4rY85+
         tAhEojX7W9nQLsEEp1ckL0yTEIdJKpxV3kygcplE5PMeSA0PSu+Xn0RzRrgHAauS3G35
         6GBq73O+05a8SrMGEefXcP+X4+LMqqO/AtfePeRebU9TKPZskLB8cjm1TmaoMLutigkX
         QhZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786956933; x=1787561733;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XcRV9DpoQXKVy9yGwvj7aXR3BN5ZksQ4Op6sLkbWN6Y=;
        b=sInItS6bJaHP1R2u8fpxlLHuBrKnEq3bWvn8M7iiXP3owmV/DbRq5fwX5Y6gx59bDa
         DIFEsj7ly9ymUJTdAecHO+/1eRG+DJeEO2mzua20/PajZ0/yqARvrS26OqbGIfsA8r0R
         vI9AVmF2ddnIdNHhu5ZFE8UWbD7tmvOCiphIW36wGg9Fg0FY+wGluiE7omfmpd0SD4er
         e3NSk97cshpqRdjKeHmBbvdPan0U1xHdey9UO7MlR6YM7e9xon1gZoUrxxivb+6nwz0n
         dxuCLIhIh3AJ2jxKsgNivgjiIlw75TX/xtIqwRrCuY5NYCXGBJgf+7iUQLHROARV7hzL
         KWDA==
X-Gm-Message-State: AOJu0Yykxd5NAIHNSa0dkTinZFsM8H2IZj1ReVjZqmISd6KbqhK3TL8O
	MAP9/hHu9nYvcZwa7TwqsUhCuDmqcweLsD5/vWk0ZOUKQDapiBBhZLEWmVao1bLrByCMhhl+gM1
	gcKw0YA==
X-Gm-Gg: AR+sD13vL0e46h7cd9kLbZe13bDefVCKvNYw6IUmpVKt7oZUcmW1F0oxIn3lmx155nU
	K0ZimYA7zrQ+2N8JKBHpGWh7hf3CR0g05Ep1la8QJKUGHwc6VdFMk5lrZmZSO+mLihN3vjqb6m2
	AId2+ktQbfcp3nuvy6Yh9vrj9g3g0c7gYYChW2+23A6MrsIY+V8Gu66i8lMEIZm3+JDMyzuVdqJ
	/0tsgMvUra2THQ0m4Yh1apfBG9kqlcdl1G6IAdqUwcGoaae5GTHsBY6pCgm4wnIl4rMNYzXx2Y0
	t47Blq4TIclH8AJv3XX0cIFbRjVr6B//AYY2oVlE6Pnsu9SvRGx+of41yfna+D3V4zZ+F4yARo3
	0/PH4fxAKOO31Jk1HKI+TO2rmTR0+CPWtllZ6Fp7m0UqO0LBSzcHEz/N44ymostRY1KvcQryFXU
	/zdboMwne3rUzg+pCZlSbbMap02y6sMljjLMOjfCO1m27UJN0qBbwgWPVSv+ZQJlayZFTHEU5ai
	c7yEu0e3nbZJxRUIYgjz4AD/PPtjHMJG2mn9GUIT5dQWj5TsM9CmI0u/C/E2b0=
X-Received: by 2002:a05:600c:3b90:b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-49987a4f131mr309975285e9.1.1786956933400;
        Mon, 17 Aug 2026 01:55:33 -0700 (PDT)
Message-ID: <9fa10fe2-8bd6-4652-b3ff-0aa49005e411@suse.com>
Date: Mon, 17 Aug 2026 10:55:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 09/14] XSM: fold xsm_{,un}map_domain_irq() hooks
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
X-purgate-ID: tlsNG-d62444/1786956933-BE465757-1E8E0C3D/0/0
X-purgate-type: clean
X-purgate-size: 5280

Like other resource management hooks they are (now) mainly different in
"add resource" vs "remove resource". Hence like in other cases a single
hook can easily serve both purposes, with minor tweaking of
flask_map_domain_irq(). While adjusting that function, also defer the
setting of local variables only needed in the "map" case.

Rename hook and functions to fit xsm_{io{mem,port},pirq}_mapping().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Fix inverted part of conditional in flask_map_domain_irq(). Rename
    hook, functions, and new parameter.

--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -100,7 +100,7 @@ long arch_do_domctl(struct xen_domctl *d
          * done by the 2 hypercalls for consistency with other
          * architectures.
          */
-        rc = xsm_map_domain_irq(XSM_HOOK, d, irq, NULL);
+        rc = xsm_irq_mapping(XSM_HOOK, d, irq, NULL, true);
         if ( rc )
             return rc;
 
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2214,7 +2214,7 @@ int map_domain_pirq(
         return 0;
     }
 
-    ret = xsm_map_domain_irq(XSM_HOOK, d, irq, msi ? &msi->sbdf : NULL);
+    ret = xsm_irq_mapping(XSM_HOOK, d, irq, msi ? &msi->sbdf : NULL, true);
     if ( ret )
     {
         dprintk(XENLOG_G_ERR, "dom%d: could not permit access to irq %d mapping to pirq %d\n",
@@ -2441,8 +2441,8 @@ int unmap_domain_pirq(struct domain *d,
      * domain.  Skip the XSM check since this is a Xen-initiated action.
      */
     if ( !d->is_dying )
-        ret = xsm_unmap_domain_irq(XSM_HOOK, d, irq,
-                                   msi_desc ? &msi_desc->dev->sbdf : NULL);
+        ret = xsm_irq_mapping(XSM_HOOK, d, irq,
+                              msi_desc ? &msi_desc->dev->sbdf : NULL, false);
 
     if ( ret )
         goto done;
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -469,8 +469,9 @@ static XSM_INLINE int xsm_pirq_mapping(
 
 #endif /* CONFIG_HAS_PIRQ */
 
-static XSM_INLINE int xsm_map_domain_irq(
-    XSM_DEFAULT_ARG struct domain *d, int irq, const pci_sbdf_t *sbdf)
+static XSM_INLINE int xsm_irq_mapping(
+    XSM_DEFAULT_ARG struct domain *d, int irq, const pci_sbdf_t *sbdf,
+    bool map)
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
 XSM_HOOK(int, pirq_mapping, struct domain *, bool)
 #endif
 
-XSM_HOOK(int, map_domain_irq, struct domain *, int, const pci_sbdf_t *)
-XSM_HOOK(int, unmap_domain_irq, struct domain *, int, const pci_sbdf_t *)
+XSM_HOOK(int, irq_mapping, struct domain *, int, const pci_sbdf_t *, bool)
 XSM_HOOK(int, bind_pt_irq, struct domain *, struct xen_domctl_bind_pt_irq *)
 XSM_HOOK(int, unbind_pt_irq, struct domain *, struct xen_domctl_bind_pt_irq *)
 
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1062,13 +1062,12 @@ static uint32_t flask_iommu_resource_use
     return perm;
 }
 
-static int cf_check flask_map_domain_irq(
-    struct domain *d, int irq, const pci_sbdf_t *sbdf)
+static int cf_check flask_irq_mapping(
+    struct domain *d, int irq, const pci_sbdf_t *sbdf, bool map)
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
+                              map ? RESOURCE__ADD_IRQ : RESOURCE__REMOVE_IRQ,
+                              &ad);
+    if ( rc || !map )
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


