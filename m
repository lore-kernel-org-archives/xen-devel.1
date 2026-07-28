Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EC1C53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 13:22:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374141.1621108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohky-0003ds-Ke; Tue, 28 Jul 2026 13:22:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374141.1621108; Tue, 28 Jul 2026 13:22:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohky-0003dl-Ht; Tue, 28 Jul 2026 13:22:04 +0000
Received: by outflank-mailman (input) for mailman id 1374141;
 Tue, 28 Jul 2026 13:22:03 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wohkx-0003df-Jw
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:22:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wohkx-00EqnP-0c
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:22:03 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68acfa-5cb7-0a2a0a5109dd-0a2a4507c6ba-2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:22:02 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68acf9-b4ea-0a2a45070019-d155802ed879-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:22:01 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-496b7622a83so20085585e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:22:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496c46160dfsm73379215e9.10.2026.07.28.06.22.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 06:22:01 -0700 (PDT)
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
        d=suse.com; s=google; t=1785244921; x=1785849721; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sNb6MGDbLdhr/i+rLQSnZDarDQNYYzkY9sEEN53Af6U=;
        b=cPizdE7vC5cI7j99kTq0FjhU8Q2j3/hbkEND6JoOVBETgcEE7j4q6DnuyA3fVOyf94
         ms4b1QXxgS0iwmTMvykbICiak/tAvttDrBKzEPIEtLpZlQPF0k9xQG0HIcH2qLs1/uYd
         VVWlyyoZ/MtK1xtcF0ulJMlwk8PBz3yYgLhG9QXYr/wi2NiEGfmaI7/qGtlA7KGXHDV0
         Az3Xed8Jh7Qh9T+Jw8BFcUURJrfjXZnmo4Vg/ZWUadRr0/GNsUCpBibqaroJalluvwhH
         hYHQj+Uh9XmVD/fyEOAwm8C4Irhc2cInV3oHoZRfoWAxCEvTM53BUSYgE659iFn3RdXB
         Y1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785244921; x=1785849721;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sNb6MGDbLdhr/i+rLQSnZDarDQNYYzkY9sEEN53Af6U=;
        b=tXxiVcMpLnL34ZT+3VyvBC1NxG4Y5ok3GY8P/yAL1b9XGQwuVch3u3nIxcR69pSgC3
         lILUC3LyOfUQ7x7wT44loqV83wXYrMaIz3vwpIQ2y4z9SJ2KDvA/rgZ/jemdXpPFjzdr
         ul2vkq6zcpjMitpb/rjTjG07LuQjXgn6IfJ1C2VgY9yMpz7TXzmCOSENA5vsZe9tFz96
         y3XbizLDrMmT4TLJl1kmcFqEgPM14mc5Izap68jQuG3LRs8YPh1gO1qOAPLkKacZQ4NK
         UgNyrrsmNAQH4pJee8WIpGKOG6jU5tJWwbhzChecah/4HYMpvbIbQpQiKneLYm5ZTT+I
         MVAQ==
X-Gm-Message-State: AOJu0YyNLPi3NSOf/Dv+ElJXm98yJCBhQA4st+sJ4YceDcQa4bafkM22
	OMcicF1xwTJGbFAzBI0Fe3Fdg2LF209IgqUQuzklUUg1ToNlok5SiwbJJCbPwc4tqnL4DoRj1Oc
	hTQtAIw==
X-Gm-Gg: AR+sD10quUmtGlKaj9em4gkF8MqqE6KzgXUSIeoq+dWghK7PT+eJel7y91ehkkKaYTl
	1xUf2fW1XSbGnGJTx/LgHUzQHtDyAY2bYSEEFIHI1I68wagh1IaGFYCJOw/HmsL5iHP57U8WJdi
	IKYUtt1n3SV/AxtTnK7dH9Fba08gmV0iLdBSknFPH1CN7uga/ddhw059W99cnblQjIsi4INe5IY
	QCqmoO9vvIZDd2SF4SLPCX5vYMCnLHXP1f/rU/IBzf+oA0Dfpa1i7ee5gxEPZ2J7lbjBThEL+SM
	pJNwBxaMfN5VP8qogmekdVrscBcY7v+KesRp60fz50++eIMRS1a5sCPTNFpd5/TGwU6fHbk5C8+
	RCGEZCd8SG7rqMnUBeCHYU0TqdZhPNyzwEMmQyJTTHLSDl2FS5Z6Q4zbjSyoLMp0XAXC8tJwt1i
	69bzk7h7/gIG3AYyS8k/sx/hclFoyD6KMdLkNXsuLnzYXT6daG8Ha955l7f7D0ys8CWg==
X-Received: by 2002:a05:600c:e548:10b0:495:518a:5cbf with SMTP id 5b1f17b1804b1-496c657241bmr18313625e9.32.1785244921399;
        Tue, 28 Jul 2026 06:22:01 -0700 (PDT)
Message-ID: <4bd4e7f7-e005-45b4-a543-98597a9de707@suse.com>
Date: Tue, 28 Jul 2026 15:22:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 17/24] XSM: make Argo hooks well-formed ones
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
 Jason Andryuk <jason.andryuk@amd.com>
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
X-purgate-ID: tlsNG-ef75cf/1785244921-344CBAE4-7ED74FC8/0/0
X-purgate-type: clean
X-purgate-size: 7692

For whatever reason they didn't have an xsm_default_t first argument (to
cope with XSM=n mode), making it impossible to (easily) cover them in
xsm/hooks.h.

To be able to retain the const on their function parameters, adjust
xsm_default_action() accordingly.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -1341,7 +1341,7 @@ fill_ring_data(const struct domain *curr
      * Don't supply information about rings that a guest is not
      * allowed to send to.
      */
-    ret = xsm_argo_send(currd, dst_d);
+    ret = xsm_argo_send(XSM_HOOK, currd, dst_d);
     if ( ret )
         goto out;
 
@@ -1666,8 +1666,9 @@ register_ring(struct domain *currd,
 
     if ( reg.partner_id == XEN_ARGO_DOMID_ANY )
     {
-        ret = opt_argo_mac_permissive ? xsm_argo_register_any_source(currd) :
-                                        -EPERM;
+        ret = opt_argo_mac_permissive
+              ? xsm_argo_register_any_source(XSM_HOOK, currd)
+              : -EPERM;
         if ( ret )
             return ret;
     }
@@ -1680,7 +1681,7 @@ register_ring(struct domain *currd,
             return -ESRCH;
         }
 
-        ret = xsm_argo_register_single_source(currd, dst_d);
+        ret = xsm_argo_register_single_source(XSM_HOOK, currd, dst_d);
         if ( ret )
             goto out;
 
@@ -2002,7 +2003,7 @@ sendv(struct domain *src_d, xen_argo_add
     if ( !dst_d )
         return -ESRCH;
 
-    ret = xsm_argo_send(src_d, dst_d);
+    ret = xsm_argo_send(XSM_HOOK, src_d, dst_d);
     if ( ret )
     {
         gprintk(XENLOG_ERR, "argo: XSM REJECTED %i -> %i\n",
@@ -2100,7 +2101,7 @@ do_argo_op(unsigned int cmd, XEN_GUEST_H
     if ( unlikely(!opt_argo) )
         return -EOPNOTSUPP;
 
-    rc = xsm_argo_enable(currd);
+    rc = xsm_argo_enable(XSM_HOOK, currd);
     if ( rc )
         return rc;
 
@@ -2242,7 +2243,7 @@ compat_argo_op(unsigned int cmd, XEN_GUE
     if ( unlikely(!opt_argo) )
         return -EOPNOTSUPP;
 
-    rc = xsm_argo_enable(currd);
+    rc = xsm_argo_enable(XSM_HOOK, currd);
     if ( rc )
         return rc;
 
@@ -2307,7 +2308,7 @@ argo_init(struct domain *d)
 {
     struct argo_domain *argo;
 
-    if ( !opt_argo || xsm_argo_enable(d) )
+    if ( !opt_argo || xsm_argo_enable(XSM_HOOK, d) )
     {
         argo_dprintk("argo disabled, domid: %u\n", d->domain_id);
         return 0;
@@ -2365,8 +2366,8 @@ argo_soft_reset(struct domain *d)
         wildcard_rings_pending_remove(d);
 
         /*
-         * Since neither opt_argo or xsm_argo_enable(d) can change at runtime,
-         * if d->argo is true then both opt_argo and xsm_argo_enable(d) must be
+         * Since neither opt_argo nor xsm_argo_enable() can change at runtime,
+         * if d->argo is true then both opt_argo and xsm_argo_enable() must be
          * true, and we can assume that init is allowed to proceed again here.
          */
         argo_domain_init(d->argo);
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -76,7 +76,7 @@ void __xsm_action_mismatch_detected(void
 #endif /* CONFIG_XSM */
 
 static always_inline int xsm_default_action(
-    xsm_default_t action, struct domain *src, struct domain *target)
+    xsm_default_t action, const struct domain *src, const struct domain *target)
 {
     switch ( action ) {
     case XSM_HOOK:
@@ -751,27 +751,32 @@ static XSM_INLINE int xsm_dm_op(XSM_DEFA
 #endif
 
 #ifdef CONFIG_ARGO
-static XSM_INLINE int xsm_argo_enable(const struct domain *d)
+
+static XSM_INLINE int xsm_argo_enable(XSM_DEFAULT_ARG const struct domain *d)
 {
-    return 0;
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, current->domain, d);
 }
 
 static XSM_INLINE int xsm_argo_register_single_source(
-    const struct domain *d, const struct domain *t)
+    XSM_DEFAULT_ARG const struct domain *d, const struct domain *t)
 {
-    return 0;
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, d, t);
 }
 
 static XSM_INLINE int xsm_argo_register_any_source(
-    const struct domain *d)
+    XSM_DEFAULT_ARG const struct domain *d)
 {
-    return 0;
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, current->domain, d);
 }
 
 static XSM_INLINE int xsm_argo_send(
-    const struct domain *d, const struct domain *t)
+    XSM_DEFAULT_ARG const struct domain *d, const struct domain *t)
 {
-    return 0;
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, d, t);
 }
 
 #endif /* CONFIG_ARGO */
--- a/xen/include/xsm/hooks.h
+++ b/xen/include/xsm/hooks.h
@@ -156,6 +156,14 @@ XSM_HOOK(int, dm_op, struct domain *)
 XSM_HOOK(int, xen_version, uint32_t)
 XSM_HOOK(int, domain_resource_map, struct domain *)
 
+#ifdef CONFIG_ARGO
+XSM_HOOK(int, argo_enable, const struct domain *)
+XSM_HOOK(int, argo_register_single_source, const struct domain *,
+                                           const struct domain *)
+XSM_HOOK(int, argo_register_any_source, const struct domain *)
+XSM_HOOK(int, argo_send, const struct domain *, const struct domain *)
+#endif
+
 #undef XSM_HOOK0
 #undef XSM_HOOK1
 #undef XSM_HOOK2
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -90,14 +90,6 @@ struct xsm_ops {
 #ifdef CONFIG_COMPAT
     int (*do_compat_op)(XEN_GUEST_HANDLE_PARAM(void) op);
 #endif
-
-#ifdef CONFIG_ARGO
-    int (*argo_enable)(const struct domain *d);
-    int (*argo_register_single_source)(const struct domain *d,
-                                       const struct domain *t);
-    int (*argo_register_any_source)(const struct domain *d);
-    int (*argo_send)(const struct domain *d, const struct domain *t);
-#endif
 };
 
 #ifdef CONFIG_XSM
@@ -213,30 +205,6 @@ static inline int xsm_do_compat_op(XEN_G
 }
 #endif
 
-#ifdef CONFIG_ARGO
-static inline int xsm_argo_enable(const struct domain *d)
-{
-    return alternative_call(xsm_ops.argo_enable, d);
-}
-
-static inline int xsm_argo_register_single_source(
-    const struct domain *d, const struct domain *t)
-{
-    return alternative_call(xsm_ops.argo_register_single_source, d, t);
-}
-
-static inline int xsm_argo_register_any_source(const struct domain *d)
-{
-    return alternative_call(xsm_ops.argo_register_any_source, d);
-}
-
-static inline int xsm_argo_send(const struct domain *d, const struct domain *t)
-{
-    return alternative_call(xsm_ops.argo_send, d, t);
-}
-
-#endif /* CONFIG_ARGO */
-
 #endif /* XSM_NO_WRAPPERS */
 
 #ifdef CONFIG_MULTIBOOT
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -40,13 +40,6 @@ static const struct xsm_ops __initconst_
 #ifdef CONFIG_COMPAT
     .do_compat_op                  = xsm_do_compat_op,
 #endif
-
-#ifdef CONFIG_ARGO
-    .argo_enable                   = xsm_argo_enable,
-    .argo_register_single_source   = xsm_argo_register_single_source,
-    .argo_register_any_source      = xsm_argo_register_any_source,
-    .argo_send                     = xsm_argo_send,
-#endif
 };
 
 void __init xsm_fixup_ops(struct xsm_ops *ops)
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1977,13 +1977,6 @@ static const struct xsm_ops __initconst_
 #ifdef CONFIG_COMPAT
     .do_compat_op = compat_flask_op,
 #endif
-
-#ifdef CONFIG_ARGO
-    .argo_enable = flask_argo_enable,
-    .argo_register_single_source = flask_argo_register_single_source,
-    .argo_register_any_source = flask_argo_register_any_source,
-    .argo_send = flask_argo_send,
-#endif
 };
 
 const struct xsm_ops *__init flask_init(


