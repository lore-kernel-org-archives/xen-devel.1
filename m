Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8FCC5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 08:57:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392717.1631708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvt9h-0006Bg-P2; Mon, 17 Aug 2026 08:57:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392717.1631708; Mon, 17 Aug 2026 08:57:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvt9h-0006BZ-LZ; Mon, 17 Aug 2026 08:57:17 +0000
Received: by outflank-mailman (input) for mailman id 1392717;
 Mon, 17 Aug 2026 08:57:16 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wvt9g-0006BP-F0
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 08:57:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvt9f-005GNP-Rx
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 10:57:15 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82cce5-8faa-0a2a0a5109dd-0a2a450b8f80-24
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:57:15 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82cceb-b7e8-0a2a450b0019-d155802fa4c7-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:57:15 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4994c49f588so27566865e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 01:57:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4999d0fb872sm34010115e9.9.2026.08.17.01.57.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 01:57:14 -0700 (PDT)
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
        d=suse.com; s=google; t=1786957035; x=1787561835; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o8SOdb+AsZMjG0+VwY3YOWVBWdSQ5EYwU96aNxkx4tc=;
        b=AnQxLYS6hTUir/nPEnrqBvrblfqVkMZgcSl8h41ugMg/mXZRwbyEO9gtQoXSTWbbLx
         eJZUC8+ecMlgVhpQfRSMh6Fnrt3euv0LbStNDPqnrDbxvHiponymJR9rkr8h1x5L48WN
         CXzSoL8i0RCFYNcUFHY/WwUe7sHoR3Gq+MCZl42BWCL+WoW9l+MjlaVlN6SjFk74cQzu
         bd44/WD6WdeQbbiMR5OUgsPHh5hkSKOYzTUpqbNaP61BO34sP0I5/S3ew95wfnywVzSI
         psnrWZYGc6dv6cy9gXjqVMlkPjgkA/etLpLQjzE1P6L6bYHrcKUuirJbkyoQEjkYTzjh
         ng2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786957035; x=1787561835;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o8SOdb+AsZMjG0+VwY3YOWVBWdSQ5EYwU96aNxkx4tc=;
        b=Ke1298nwxwO/RtWvWkGGGvdViY0ShrMHx/+1t+Vwgu4ctjH7/wPFIG1kuONhqpU0i3
         6vgn9yAeUIO8NN6TJqDU3FBlY4s9JPJ3nipP0Xhzfi9QpTiLprlDW5XjXnLKoBhAS5+3
         DmdCgKQryUJ0UO7ybUPq3/lL3wZ60sz0BIrdymtTMV7CGNQtB5AOdxObSzArh4/TMEkr
         jQNN5Kgcz1cvCY0OO0yHXQ6vnoWoqdr+7FqR7zIpCC+60DD+g1ifEsTSKmMkH5X56Oz5
         SpLCU20gwZ+HIYTuZsstiM1J0Obnj3/dUFVAJJ3Y+LI5fDf1v9gqUZpoOA1HI6pjuQF2
         LxgA==
X-Gm-Message-State: AOJu0YzrgyKF9iPZbYqvfLkvqy9FQj7fmOQC58LCxnS6jsVCajGrkuHU
	fSM8g5b+01wbCi4RwryvEcxmFIkvzhNEofzudK2dctj1cAzIUryU4ZdrJQ7j8Bg+lkBYLtr10Cz
	AJagZog==
X-Gm-Gg: AR+sD103jpAJ8WuHUVEb0DAUZjmvaIv4XaMN5niA2f1BjWXF8au/XN78v9sCIM8IMXQ
	JeN6Svq8bxzT9xk1m2chymCVH0kQWriMgzJit6iJREhMbGF4w+htiwrL/S2YYJZ1hZyR5Q7EaZY
	scP0Erahhp4sXnHkq1uTi1n5+sGmqpbMXemCJXEOajzVnWni8p1GuYE/UYa5r8PvasTRO+4nZLb
	kKyLKIThhiDPRdnfx366n0x3urk/mCXkhblFAf5U8947Cn1KK3Q32tQOrF9JCqjADrw6LVbCdfQ
	u12gILfo5UwcmFPlSADrMa9zzZ/CRnyOni037tJch/UGyk508nlFaQ5uvbJnzIIdh77LeZESbui
	dj75ceWn1+bGe/dSmlmc++iq8hjeZDV2Gp/aD380fLf19wEV74iWJ9HxrjSeM58u5CpxtaYdS4o
	yWtTVsV1cG0EoFtvE1lEOUq54v9TBkHD1lp78F2EfWMzU6KZ9AVmnPYHrQ7+j3hqeJcJgOYR6dS
	qwZSKOMyU+JSjjJXuxW95Nv9b5yhJhWQI3i3rOvB0YQB7YhPXk8
X-Received: by 2002:a05:600d:117:b0:499:5f80:83ac with SMTP id 5b1f17b1804b1-49987ab4e1bmr230477815e9.7.1786957035231;
        Mon, 17 Aug 2026 01:57:15 -0700 (PDT)
Message-ID: <d8d26338-810c-473d-91c5-0202b6dcac76@suse.com>
Date: Mon, 17 Aug 2026 10:57:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 12/14] XSM: convert remaining domain-related hooks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
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
X-purgate-ID: tlsNG-42698a/1786957035-A8AC89EA-D7B6E5A8/0/0
X-purgate-type: clean
X-purgate-size: 6831

Make them follow the standard scheme, i.e. taking xsm_default_t as first
argument at call sites. This way they can be covered by the recently
introduced hook machinery.

While there,
- rename flask_domain_{alloc,free}_security() to fit the corresponding
  hook names,
- add const to .security_domaininfo()'s first parameter.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -760,7 +760,7 @@ static void _domain_destroy(struct domai
 
     free_cpumask_var(d->dirty_cpumask);
 
-    xsm_free_security_domain(d);
+    xsm_free_security_domain(XSM_HOOK, d);
 
     lock_profile_deregister_struct(LOCKPROF_TYPE_PERDOM, d);
 
@@ -987,7 +987,7 @@ struct domain *domain_create(domid_t dom
         d->max_vcpus = config->max_vcpus;
     }
 
-    if ( (err = xsm_alloc_security_domain(d)) != 0 )
+    if ( (err = xsm_alloc_security_domain(XSM_HOOK, d)) != 0 )
         goto fail;
 
     err = -ENOMEM;
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -91,7 +91,7 @@ void getdomaininfo(struct domain *d, str
         (is_hvm_domain(d)               ? XEN_DOMINF_hvm_guest : 0) |
         d->shutdown_code << XEN_DOMINF_shutdownshift;
 
-    xsm_security_domaininfo(d, info);
+    xsm_security_domaininfo(XSM_HOOK, d, info);
 
     info->tot_pages         = domain_tot_pages(d);
     info->max_pages         = d->max_pages;
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -122,8 +122,11 @@ static XSM_INLINE int xsm_set_system_act
 }
 
 static XSM_INLINE void xsm_security_domaininfo(
-    struct domain *d, struct xen_domctl_getdomaininfo *info)
-{}
+    XSM_DEFAULT_ARG const struct domain *d,
+    struct xen_domctl_getdomaininfo *info)
+{
+    XSM_ASSERT_ACTION(XSM_HOOK);
+}
 
 static XSM_INLINE int xsm_domain_create(
     XSM_DEFAULT_ARG struct domain *d, uint32_t ssidref)
@@ -179,13 +182,18 @@ static XSM_INLINE int xsm_sysctl(
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_alloc_security_domain(struct domain *d)
+static XSM_INLINE int xsm_alloc_security_domain(
+    XSM_DEFAULT_ARG struct domain *d)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return 0;
 }
 
-static XSM_INLINE void xsm_free_security_domain(struct domain *d)
-{}
+static XSM_INLINE void xsm_free_security_domain(
+    XSM_DEFAULT_ARG struct domain *d)
+{
+    XSM_ASSERT_ACTION(XSM_HOOK);
+}
 
 #ifdef CONFIG_GRANT_TABLE
 
--- a/xen/include/xsm/hooks.h
+++ b/xen/include/xsm/hooks.h
@@ -20,6 +20,10 @@
 XSM_HOOK(int, domain_create, struct domain *, uint32_t)
 XSM_HOOK(int, getdomaininfo, struct domain *)
 XSM_HOOK(int, get_domain_state, struct domain *)
+XSM_HOOK(void, security_domaininfo, const struct domain *,
+                                    struct xen_domctl_getdomaininfo *)
+XSM_HOOK(int, alloc_security_domain, struct domain *)
+XSM_HOOK(void, free_security_domain, struct domain *)
 
 #ifdef CONFIG_SYSCTL
 XSM_HOOK(int, sysctl, const struct xen_sysctl *)
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -62,8 +62,6 @@ typedef enum xsm_default xsm_default_t;
  */
 struct xsm_ops {
     int (*set_system_active)(void);
-    void (*security_domaininfo)(struct domain *d,
-                                struct xen_domctl_getdomaininfo *info);
 
 #define XSM_HOOK0(rtype, name) rtype (*name)(void);
 #define XSM_HOOK1(rtype, name, type1) \
@@ -79,9 +77,6 @@ struct xsm_ops {
 
 #include "hooks.h"
 
-    int (*alloc_security_domain)(struct domain *d);
-    void (*free_security_domain)(struct domain *d);
-
     char *(*show_irq_sid)(int irq);
 };
 
@@ -96,12 +91,6 @@ static inline int xsm_set_system_active(
     return alternative_call(xsm_ops.set_system_active);
 }
 
-static inline void xsm_security_domaininfo(
-    struct domain *d, struct xen_domctl_getdomaininfo *info)
-{
-    alternative_vcall(xsm_ops.security_domaininfo, d, info);
-}
-
 #define XSM_ALT_void      alternative_vcall
 #define XSM_ALT_int       return alternative_call
 #define XSM_ALT_pchar_t   return alternative_call
@@ -149,16 +138,6 @@ static inline rtype xsm_ ## name( \
 
 #include "hooks.h"
 
-static inline int xsm_alloc_security_domain(struct domain *d)
-{
-    return alternative_call(xsm_ops.alloc_security_domain, d);
-}
-
-static inline void xsm_free_security_domain(struct domain *d)
-{
-    alternative_vcall(xsm_ops.free_security_domain, d);
-}
-
 static inline char *xsm_show_irq_sid(int irq)
 {
     return alternative_call(xsm_ops.show_irq_sid, irq);
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -15,7 +15,6 @@
 
 static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .set_system_active             = xsm_set_system_active,
-    .security_domaininfo           = xsm_security_domaininfo,
 
 #define XSM_HOOK0(rtype, name) .name = xsm_ ## name,
 #define XSM_HOOK1(rtype, name, ...) XSM_HOOK0(rtype, name)
@@ -26,9 +25,6 @@ static const struct xsm_ops __initconst_
 
 #include <xsm/hooks.h>
 
-    .alloc_security_domain         = xsm_alloc_security_domain,
-    .free_security_domain          = xsm_free_security_domain,
-
     .show_irq_sid                  = xsm_show_irq_sid,
 };
 
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -188,7 +188,7 @@ static int avc_unknown_permission(const
     return rc;
 }
 
-static int cf_check flask_domain_alloc_security(struct domain *d)
+static int cf_check flask_alloc_security_domain(struct domain *d)
 {
     struct domain_security_struct *dsec;
 
@@ -256,7 +256,7 @@ static int cf_check flask_set_system_act
     return 0;
 }
 
-static void cf_check flask_domain_free_security(struct domain *d)
+static void cf_check flask_free_security_domain(struct domain *d)
 {
     struct domain_security_struct *dsec = d->ssid;
 
@@ -549,7 +549,7 @@ static int cf_check flask_schedop_shutdo
 }
 
 static void cf_check flask_security_domaininfo(
-    struct domain *d, struct xen_domctl_getdomaininfo *info)
+    const struct domain *d, struct xen_domctl_getdomaininfo *info)
 {
     info->ssidref = domain_sid(d);
 }
@@ -1904,7 +1904,6 @@ static int cf_check flask_get_domain_sta
 
 static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .set_system_active = flask_set_system_active,
-    .security_domaininfo = flask_security_domaininfo,
 
 #define XSM_HOOK0(rtype, name) .name = flask_ ## name,
 #define XSM_HOOK1(rtype, name, ...) XSM_HOOK0(rtype, name)
@@ -1915,9 +1914,6 @@ static const struct xsm_ops __initconst_
 
 #include <xsm/hooks.h>
 
-    .alloc_security_domain = flask_domain_alloc_security,
-    .free_security_domain = flask_domain_free_security,
-
     .show_irq_sid = flask_show_irq_sid,
 };
 


