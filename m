Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DDB4C5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 08:53:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392668.1631640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvt5g-00032y-S8; Mon, 17 Aug 2026 08:53:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392668.1631640; Mon, 17 Aug 2026 08:53:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvt5g-00032q-OA; Mon, 17 Aug 2026 08:53:08 +0000
Received: by outflank-mailman (input) for mailman id 1392668;
 Mon, 17 Aug 2026 08:53:07 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wvt5f-00032Y-1Q
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 08:53:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvt5e-00D2zY-EY
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 10:53:06 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82cbed-2eae-0a2a0a5409dd-0a2a450bdbc8-28
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:53:06 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82cbf2-b7e8-0a2a450b0019-d155802bac30-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:53:06 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-495590dde14so38912005e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 01:53:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49996183b89sm157259195e9.12.2026.08.17.01.53.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 01:53:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1786956786; x=1787561586; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yG72bC7P9bK/t0BCXT48RBUcpJmBlidVDBFgV61UuIM=;
        b=SA8/kGTH9IlTOzeDdqpJrhKbFKgq5u/9PG9qe2xOLx+CbJeSO2mpVU6pX9eWnN8UAb
         b/6FRvs8woGtHUrzGeuSyscxzbr82ecLhYM2AwPgpJUmf72n2pQY0KmDn4t4IdNiFvcM
         9Hiei/njh6UVNjnKJzGLu4rlaLQWV8Y6jl94odPDiRgbtVsGp9T8pEcFUjfGsOupFCJK
         SDEYOkLMAuEAZXfX2WhtSlyFZV9QhSMY3CSoRhhbakQUgv5DOy4WDV4eZdHDT5ytowJp
         G/mcUBcukc/v29F2uDM55C7ke0IkbdLifBmY3Qnj/OiFzOyibkmXWT8gVt1+KzZm3NvG
         iVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786956786; x=1787561586;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yG72bC7P9bK/t0BCXT48RBUcpJmBlidVDBFgV61UuIM=;
        b=eeOm372wa/2/OdYWzCUk7EsrsWrBQ5PHwshdQbEAoHp6ZZcBxooUwsnOlYc76B3VEQ
         h0uJGP5+Zi5bcK/0iQ6mhKmSZ/9X+xk+mzhH4yYTSplmmy8Auij2qv8JMILvUO+Bgevk
         jZ2nBW1mSdWq3UKh6WVoCD/818RX0VmAYtaW2v/s1HZ6aGgEHZhTMcPZlOHUt4Vgo98h
         Gof1gCbvVUmdht6hGdxDg2O/LzmZQPhRr48FGndVeK5OEtenqZ7639qkJyX59TKZF77i
         q9brxTS/qArY2f3J4vO9tfCD5JJRLpV8VoGkzM9fRplqSg/rqeYTpAr60pD+l3ZRe2/C
         AwpQ==
X-Gm-Message-State: AOJu0YwRcriih+R6oa2gKVmEOoCwcBJIkDUDk34hDY0ieAmklTlOKzv6
	MTAtcwjZyb6MhMLk44EjrPUzvwczWjWgQi+N8XUBXZ3AFYtkFIKMmWUc6UwkJkxYl3giFU26Cak
	rITcfVg==
X-Gm-Gg: AR+sD131ZZx6FCzSmVn/3P5czIjlF3UQslISQlwUITqw3WqUg92YtiusnC22d/508yf
	Iysld0eS7soNcDlhbPJyaXH39gbAWPeRvEFAa6C/VDENa/Qu6DxJj4zcwzrABD7pxG4XvXkfiK0
	orYZBxsqXdshYihRfOHBuYdvrNkwTGweaMet7Zm+/joq+n5VuJutFcedeUS0RhB9BS38UylyRw2
	kt6rtnYhWHxtTJqwhofHObWN4LID2ZyyjDKr/5xY7wfrVa7WocuG9x3sgoSQ6MEp0Zl6XxMoEr1
	DEd5tNZ3OYyx4K+IPtpUysTGrLw/S2NbKbnKG5kTVaZ+KXZ6ChhmtZrBCoG+7sjaDOayi6+H4R/
	lb8C07zF4NrsifPsAz/ytaH+5e2VFjmQQtOm7qYwGZ9Ky1xn/HVLmrmYORmW3VEI8sUUfvW39f6
	xvHRlIyWgHMPou/0QUJi0K+6SoBzo6w+eE7xsjmStriluIhW2L9wSu2+kb3jyGhpWA5paxNMTnn
	QorCn2eNaoGeZ6+lvVqvFHxPSo3Nq9o5ZMlOaUZE2WT6/VXvLj+
X-Received: by 2002:a05:600c:4754:b0:499:7e2b:8e5 with SMTP id 5b1f17b1804b1-4999a2f9ec3mr69341345e9.5.1786956785706;
        Mon, 17 Aug 2026 01:53:05 -0700 (PDT)
Message-ID: <e73894ff-7ef7-4db0-9d91-45870b0d3c83@suse.com>
Date: Mon, 17 Aug 2026 10:53:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 05/14] XSM: make Argo hooks well-formed ones
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
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
X-purgate-ID: tlsNG-42698a/1786956786-A88C99EA-BF76762A/0/0
X-purgate-type: clean
X-purgate-size: 7573

For whatever reason they didn't have an xsm_default_t first argument (to
cope with XSM=n mode), making it impossible to (easily) cover them in
xsm/hooks.h.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
v2: Drop uses of current->domain from dummy handlers. Move const-ification
    in xsm_default_action() to a separate patch. Re-base over re-ordering
    of series.

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
@@ -751,27 +751,32 @@ static XSM_INLINE int xsm_dm_op(XSM_DEFA
 #endif
 
 #ifdef CONFIG_ARGO
-static XSM_INLINE int xsm_argo_enable(const struct domain *d)
+
+static XSM_INLINE int xsm_argo_enable(XSM_DEFAULT_ARG const struct domain *d)
 {
-    return 0;
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, d, NULL);
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
+    return xsm_default_action(action, d, NULL);
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
@@ -161,6 +161,14 @@ XSM_HOOK(int, do_xsm_op, XEN_GUEST_HANDL
 XSM_HOOK(int, do_compat_op, XEN_GUEST_HANDLE_PARAM(void))
 #endif
 
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
@@ -85,14 +85,6 @@ struct xsm_ops {
     char *(*show_security_evtchn)(struct domain *d, const struct evtchn *chn);
 
     char *(*show_irq_sid)(int irq);
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
@@ -196,30 +188,6 @@ static inline char *xsm_show_irq_sid(int
     return alternative_call(xsm_ops.show_irq_sid, irq);
 }
 
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
@@ -35,13 +35,6 @@ static const struct xsm_ops __initconst_
     .show_security_evtchn          = xsm_show_security_evtchn,
 
     .show_irq_sid                  = xsm_show_irq_sid,
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
@@ -1972,13 +1972,6 @@ static const struct xsm_ops __initconst_
     .show_security_evtchn = flask_show_security_evtchn,
 
     .show_irq_sid = flask_show_irq_sid,
-
-#ifdef CONFIG_ARGO
-    .argo_enable = flask_argo_enable,
-    .argo_register_single_source = flask_argo_register_single_source,
-    .argo_register_any_source = flask_argo_register_any_source,
-    .argo_send = flask_argo_send,
-#endif
 };
 
 const struct xsm_ops *__init flask_init(


