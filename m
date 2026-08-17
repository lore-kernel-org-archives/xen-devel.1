Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7ED8C5DF70
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 09:15:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392753.1631745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvtR4-0003EY-Um; Mon, 17 Aug 2026 09:15:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392753.1631745; Mon, 17 Aug 2026 09:15:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvtR4-0003ER-Rv; Mon, 17 Aug 2026 09:15:14 +0000
Received: by outflank-mailman (input) for mailman id 1392753;
 Mon, 17 Aug 2026 09:15:14 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wvtR4-0003EJ-Aj
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 09:15:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvtR3-007wvY-3J
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 11:15:13 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82d11b-bab6-0a2a0a5309dd-0a2a450581b6-16
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 11:15:13 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82ccab-4cb1-0a2a45050019-d1558029d47f-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:56:12 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-49954b88fffso35273405e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 01:56:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4999d078523sm26288775e9.6.2026.08.17.01.56.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 01:56:10 -0700 (PDT)
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
        d=suse.com; s=google; t=1786956971; x=1787561771; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AEdc8GQ0X7pW91c3IJ6VKmtma1QrK/AiK+09OB1ma3I=;
        b=DoBInu21q/5nILPbRnbDGqbwzxbg5Vsv5E05GQacq+UUcTO1sepRNwOa5HzSht9Nqt
         WOVrNG6Pm3EfssQgremI3YuinivuMxGGtumUe16eKxBRmcQ2PrQLqWOLDZ0s5+nei0ts
         IME+iYmdKV8os1nqVg6in8AdXOqDFxK74fMwImH8QRv+rHnP0spOuP71AGTYg9JYCtPb
         17Ue0yV/GvK5xDQ+dekpdmCZkhrERMpEqt0y4SVsrXPl5NyR9IOaX9DS7fQt2FrgfkEu
         YOHea3H7q6Oq9lPXphFUa0lA1nl9JMghQ7Mn2oNUqtpTCu0SwdiuO9cdQbkNB66xxvbE
         WQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786956971; x=1787561771;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AEdc8GQ0X7pW91c3IJ6VKmtma1QrK/AiK+09OB1ma3I=;
        b=TH1yijPr8KwZb1aW1YeewoOc0b3/0FI2miai4j0FLCX3Rahi4Wy47W5UTwQVgz/tAy
         IwgJ5w0N99Tm5xwnpoTS62yxGHwXv+gCyg9YGZL+b4a4Ha3tT3h4Gvx5VRv30pHjde5x
         SbtyuVXLs/yJWN/h5Up5VAf7AMgmJsYo80NIUtMxwWXsCndtHyk0xRSkQiKigENhQVA7
         EuJqs24xM0Y4RUBOUqToE8n7q/po6k5YWQ5z8XRDkF2aGizik9cizTrTLIMkz3dtIVd2
         C+zBW6/jsSspmB7+yam0VIsI0u9qy4/zN3FM3cUhzneFF0tH1gvwNrXu0ozCEFR3zf5H
         L7ZQ==
X-Gm-Message-State: AOJu0Ywxdajk2TmpH1/7OvSo9Bp2hB0a05kIQ6D6+uCRrn2uyUgavT8O
	JPSnmoXVwIHUySf2JW9ynd8HDLJfqbd/M5NBEOJ9Bw1e/l3us9fq0CESaqMyvrkmOmlNMHRxhvS
	h7wDExg==
X-Gm-Gg: AR+sD13APOL4AYPBDqc9NCjuKwyfxxzevkZUZipzYmir9NjGa1tV4RGYg0KlhkGypVB
	BcHHNoU4lOrCKp3VsuYbejs4Btny9CStm5GqbIMxjbaUzUwYWsPbyM655aQSnZNsbai4C3iAW4Q
	tbjk91SwGbIxfT01wsGJhh9UPwMCgDFo+sgpiQ6n2wTHkGcEmOBaZz5zTwhjNC8SvfDNeEtiKyN
	hhbqz+Szx9kYcKIJNL8fEzFwZhf8tAfK8jEgIxYbBXhc8/pw/QcR1RHQv5TiZQJfbdVkIvhSeTJ
	g6nsTW80Nbo72f3X2cO+XmrjauAfLHVaF498RUj0hCqCu22n+m8R70ElXKMZIZkO08DR63KJ82p
	K0NgZVGJYfwuA2EKxggrt46Rjtc0vQ/8QGpcwG/hLHBP0Yob1MMk2U/TyGSxqR0kSn9BeijxKfp
	giZIWnR2yiG71/VheJO0L5rWLwZpedmSz6aGcn2GiXFE1GdjLATAet1UkMSsnubjbPMMqTU92Zu
	CSSAXpWSyP6Bc9BH/JzpwuwNzGUnYOxcYSMaPriL/+FQLxz5mxL
X-Received: by 2002:a05:600c:3114:b0:495:63e4:7f78 with SMTP id 5b1f17b1804b1-49987971986mr337054185e9.10.1786956971404;
        Mon, 17 Aug 2026 01:56:11 -0700 (PDT)
Message-ID: <51370c2d-89dd-4c82-9cc6-53a560d1c9ac@suse.com>
Date: Mon, 17 Aug 2026 10:56:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 10/14] XSM: fold xsm_{,un}bind_pt_irq() hooks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
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
X-purgate-ID: tlsNG-c201ff/1786956972-714AC2A1-26582E4F/19/8833835083
X-purgate-type: clean
X-purgate-size: 4607

Like other resource management hooks they are mainly different in "add
resource" vs "remove resource". Hence like in other cases a single hook
can easily serve both purposes, with minor tweaking of
flask_bind_pt_irq(). While adjusting that function, also defer the setting
of "dperm", which is only needed in the "map" case.

Rename hook and functions to fit xsm_{io{mem,port},{p,}irq}_mapping().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Fix inverted part of conditional in flask_bind_pt_irq(). Rename hook,
    functions, and new parameter.

--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -104,7 +104,7 @@ long arch_do_domctl(struct xen_domctl *d
         if ( rc )
             return rc;
 
-        rc = xsm_bind_pt_irq(XSM_DM_PRIV, d, bind);
+        rc = xsm_pt_irq_binding(XSM_DM_PRIV, d, bind, true);
         if ( rc )
             return rc;
 
@@ -140,7 +140,7 @@ long arch_do_domctl(struct xen_domctl *d
         if ( irq != virq )
             return -EINVAL;
 
-        rc = xsm_unbind_pt_irq(XSM_DM_PRIV, d, bind);
+        rc = xsm_pt_irq_binding(XSM_DM_PRIV, d, bind, false);
         if ( rc )
             return rc;
 
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -622,7 +622,7 @@ long arch_do_domctl(
         if ( !is_hvm_domain(d) )
             break;
 
-        ret = xsm_bind_pt_irq(XSM_DM_PRIV, d, bind);
+        ret = xsm_pt_irq_binding(XSM_DM_PRIV, d, bind, true);
         if ( ret )
             break;
 
@@ -660,7 +660,7 @@ long arch_do_domctl(
         if ( !is_hvm_domain(d) )
             break;
 
-        ret = xsm_unbind_pt_irq(XSM_DM_PRIV, d, bind);
+        ret = xsm_pt_irq_binding(XSM_DM_PRIV, d, bind, false);
         if ( ret )
             break;
 
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -477,15 +477,9 @@ static XSM_INLINE int xsm_irq_mapping(
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_bind_pt_irq(
-    XSM_DEFAULT_ARG struct domain *d, struct xen_domctl_bind_pt_irq *bind)
-{
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_unbind_pt_irq(
-    XSM_DEFAULT_ARG struct domain *d, struct xen_domctl_bind_pt_irq *bind)
+static XSM_INLINE int xsm_pt_irq_binding(
+    XSM_DEFAULT_ARG struct domain *d, struct xen_domctl_bind_pt_irq *bind,
+    bool map)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
--- a/xen/include/xsm/hooks.h
+++ b/xen/include/xsm/hooks.h
@@ -72,8 +72,8 @@ XSM_HOOK(int, pirq_mapping, struct domai
 #endif
 
 XSM_HOOK(int, irq_mapping, struct domain *, int, const pci_sbdf_t *, bool)
-XSM_HOOK(int, bind_pt_irq, struct domain *, struct xen_domctl_bind_pt_irq *)
-XSM_HOOK(int, unbind_pt_irq, struct domain *, struct xen_domctl_bind_pt_irq *)
+XSM_HOOK(int, pt_irq_binding, struct domain *, struct xen_domctl_bind_pt_irq *,
+                              bool)
 
 XSM_HOOK(int, irq_permission, struct domain *, int, bool)
 XSM_HOOK(int, iomem_permission, struct domain *, uint64_t, uint64_t, bool)
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1089,17 +1089,16 @@ static int cf_check flask_irq_mapping(
     return avc_has_perm(dsid, sid, SECCLASS_RESOURCE, dperm, &ad);
 }
 
-static int cf_check flask_bind_pt_irq(
-    struct domain *d, struct xen_domctl_bind_pt_irq *bind)
+static int cf_check flask_pt_irq_binding(
+    struct domain *d, struct xen_domctl_bind_pt_irq *bind, bool map)
 {
-    uint32_t dsid, rsid;
+    uint32_t dsid, rsid, dperm;
     int rc = -EPERM;
     int irq;
     struct avc_audit_data ad;
-    uint32_t dperm = flask_iommu_resource_use_perm(d);
 
-    rc = current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__ADD);
-    if ( rc )
+    rc = current_has_perm(d, SECCLASS_RESOURCE, resource_to_perm(map));
+    if ( rc || !map )
         return rc;
 
     irq = domain_pirq_to_irq(d, bind->machine_irq);
@@ -1113,13 +1112,9 @@ static int cf_check flask_bind_pt_irq(
         return rc;
 
     dsid = domain_sid(d);
-    return avc_has_perm(dsid, rsid, SECCLASS_RESOURCE, dperm, &ad);
-}
+    dperm = flask_iommu_resource_use_perm(d);
 
-static int cf_check flask_unbind_pt_irq(
-    struct domain *d, struct xen_domctl_bind_pt_irq *bind)
-{
-    return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__REMOVE);
+    return avc_has_perm(dsid, rsid, SECCLASS_RESOURCE, dperm, &ad);
 }
 
 static int cf_check flask_irq_permission(


