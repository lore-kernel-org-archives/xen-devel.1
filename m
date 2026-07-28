Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1D2C54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 13:22:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374150.1621119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohlf-0004An-2V; Tue, 28 Jul 2026 13:22:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374150.1621119; Tue, 28 Jul 2026 13:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohle-0004Af-UJ; Tue, 28 Jul 2026 13:22:46 +0000
Received: by outflank-mailman (input) for mailman id 1374150;
 Tue, 28 Jul 2026 13:22:46 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wohld-0004AV-Rr
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:22:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wohld-004dx0-8p
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:22:45 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68ad24-bab6-0a2a0a5309dd-0a2a4503bc34-6
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:22:45 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68ad25-fae8-0a2a45030019-d155802ec9cf-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:22:45 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-493b966dd74so24103115e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:22:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496c45cb67esm82409305e9.8.2026.07.28.06.22.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 06:22:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1785244965; x=1785849765; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OH3UAuRhXGzvJgR+A7mAaphd4Y33/NLRNKKXxQdQ/ok=;
        b=QYa5n6YhASWl0zwXLc+mfzaRNNS+Ta//XVzUXJZQu9G5ilkThr4ZIqzC6Aqh1Swgql
         BYiBqEXnokOlGOwBPwCCwjJvIxsjoGERsylVBptMLZQwFExkZ9QRpP+yV45vd1jiRCQ3
         Tl1Ua1EC5GBajfDkSQoumUtqPdOnvYOdHTXvfGYtr+S9wXQB83U5dR982kaVm69f8ajZ
         p/8bTlq0CAH5dw3WjtCoYO2PUmqLDvctni9W6Baymfbde3K5y9UIKeCexfNHNutE0DBc
         rxB3nky7sH9W+UtQAZizTDPFjqvDyeLkOs7O8l48ZBGcI6JJ6nyhIAQgEVSmhMRPqeH3
         NLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785244965; x=1785849765;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OH3UAuRhXGzvJgR+A7mAaphd4Y33/NLRNKKXxQdQ/ok=;
        b=PsqoQ8aUaM3qyfunONUz5c7884wy9BowUYmULhQ97ry37s+kTYDZW4VCUC06qvCInZ
         sr8Mq5g6pHO2ziI4qCgEgunhHNUj0MXfKGv8wDG0Gh3HbtJtRqqVquc2mfWTSFo6tMQw
         pzQvxDVkmF/yOPrTzWq1FXgAJz4kMjwmDxkSIOAB6u94t4PvcN+G5kXI2IyJZ2lmyywz
         Q/wNJheJ0doeNshz0IToKQ6Q+VEpi3H4wP6NsxACgRvHw2qJMnznhzh9kIQlOEGtLTFV
         EWimXjzksMIJlAotdnz7aKT338IvlJ8vLk4quFIZB4G8U76JRyKK2NuU/ShmsV7fyBYO
         S1Hg==
X-Gm-Message-State: AOJu0YweVlGXSgvnzuuugYcmFMUdMv8jkDI0S8ZWT81MGaAHZ7sS3Y/m
	46jr2RuotormhpalLCIqH1WlxEOVXd4ikjY//UFQB2YykStr7p/RjVcb6dcwSTnQ7+g3Jm1H20n
	SMlhSuQ==
X-Gm-Gg: AR+sD134y7bWXw1eAx2XXeg106ChU/ZSAD6C8EQaF1mRo+qkmvzwwXA4h945Allo3yp
	bVw53sXIulT3pZf+RulcNB0VbSmMU5Y6VbTd5HbKtLdyUXX3emQWrTDjNXgzMzNP3S891ulU+c7
	u7kVyOx9eILE2pe2uHttep4xJbJ3eYHcWw3QXKdEJ7nV9Uy2JoCsJiC74lk+75GzphF2G6vQdv2
	tXhthfUwvcv/atgF8/DkePOj8sJ57eeoc2VA7qXEqKBcFRMkthG3zevqNW/QFD2qCY7whc/lek+
	ExXSdTOfS5j93IWoNdVS5t8wR63EltJdfX/qHJDPKW/FkQQbg4i6PecUj1sIDMblBF23skr0J9I
	0W3y06bIsduAayLHjmyvokeYk5WGTAnKI7r3axhKuWDMFsNv9F9PU3mRh+lL/6H9KWjnRqJPvdB
	0Ext7filpCII2ev4xO2yXMjVDnDdxbxMX30hIYMyelhwBB66aPww5540OHZhCWz6NsapoLcKrMQ
	rJx
X-Received: by 2002:a05:600c:1d19:b0:493:aa0a:45ad with SMTP id 5b1f17b1804b1-496c641518dmr30726955e9.2.1785244964461;
        Tue, 28 Jul 2026 06:22:44 -0700 (PDT)
Message-ID: <2c108d3c-eef1-4d4b-9874-b0721fd7560f@suse.com>
Date: Tue, 28 Jul 2026 15:22:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 18/24] XSM: make XSM hooks well-formed ones
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
X-purgate-ID: tlsNG-33051d/1785244965-770F64E9-21C563A3/0/0
X-purgate-type: clean
X-purgate-size: 4877

For whatever reason they didn't have an xsm_default_t first argument (to
cope with XSM=n mode), making it impossible to (easily) cover them in
xsm/hooks.h.

flask_do_xsm_op() is also changed to return int, as all the function ever
returns is an int. This way no new machinery needs adding to xsm/hooks.h.
Instead one piece of compat machinery can then be dropped from
xsm/flask/flask_op.c.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Instead of XSM_HOOK, using XSM_OTHER may also be a sensible option here.

Question is whether some/all of the other hooks still declared explicitly
in struct xsm_ops should follow suit.

--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -439,7 +439,7 @@ static XSM_INLINE int xsm_hypfs_op(XSM_D
 
 #ifdef CONFIG_XSM
 
-static XSM_INLINE long xsm_do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
+static XSM_INLINE int xsm_do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
 {
     return -ENOSYS;
 }
--- a/xen/include/xsm/hooks.h
+++ b/xen/include/xsm/hooks.h
@@ -156,6 +156,11 @@ XSM_HOOK(int, dm_op, struct domain *)
 XSM_HOOK(int, xen_version, uint32_t)
 XSM_HOOK(int, domain_resource_map, struct domain *)
 
+XSM_HOOK(int, do_xsm_op, XEN_GUEST_HANDLE_PARAM(void))
+#ifdef CONFIG_COMPAT
+XSM_HOOK(int, do_compat_op, XEN_GUEST_HANDLE_PARAM(void))
+#endif
+
 #ifdef CONFIG_ARGO
 XSM_HOOK(int, argo_enable, const struct domain *)
 XSM_HOOK(int, argo_register_single_source, const struct domain *,
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -85,11 +85,6 @@ struct xsm_ops {
     char *(*show_security_evtchn)(struct domain *d, const struct evtchn *chn);
 
     char *(*show_irq_sid)(int irq);
-
-    long (*do_xsm_op)(XEN_GUEST_HANDLE_PARAM(void) op);
-#ifdef CONFIG_COMPAT
-    int (*do_compat_op)(XEN_GUEST_HANDLE_PARAM(void) op);
-#endif
 };
 
 #ifdef CONFIG_XSM
@@ -193,18 +188,6 @@ static inline char *xsm_show_irq_sid(int
     return alternative_call(xsm_ops.show_irq_sid, irq);
 }
 
-static inline long xsm_do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
-{
-    return alternative_call(xsm_ops.do_xsm_op, op);
-}
-
-#ifdef CONFIG_COMPAT
-static inline int xsm_do_compat_op(XEN_GUEST_HANDLE_PARAM(void) op)
-{
-    return alternative_call(xsm_ops.do_compat_op, op);
-}
-#endif
-
 #endif /* XSM_NO_WRAPPERS */
 
 #ifdef CONFIG_MULTIBOOT
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -35,11 +35,6 @@ static const struct xsm_ops __initconst_
     .show_security_evtchn          = xsm_show_security_evtchn,
 
     .show_irq_sid                  = xsm_show_irq_sid,
-
-    .do_xsm_op                     = xsm_do_xsm_op,
-#ifdef CONFIG_COMPAT
-    .do_compat_op                  = xsm_do_compat_op,
-#endif
 };
 
 void __init xsm_fixup_ops(struct xsm_ops *ops)
--- a/xen/xsm/flask/flask_op.c
+++ b/xen/xsm/flask/flask_op.c
@@ -23,7 +23,6 @@
 #include <conditional.h>
 #include "private.h"
 
-#define ret_t long
 #define _copy_to_guest copy_to_guest
 #define _copy_from_guest copy_from_guest
 
@@ -606,7 +605,7 @@ static int flask_relabel_domain(const st
 
 #endif /* !COMPAT */
 
-ret_t cf_check do_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op)
+int cf_check flask_do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op)
 {
     xen_flask_op_t op;
     int rv;
@@ -772,9 +771,7 @@ CHECK_flask_transition;
 #define flask_devicetree_label compat_devicetree_label
 
 #define xen_flask_op_t compat_flask_op_t
-#undef ret_t
-#define ret_t int
-#define do_flask_op compat_flask_op
+#define flask_do_xsm_op flask_do_compat_op
 
 #include "flask_op.c"
 #endif
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1971,12 +1971,6 @@ static const struct xsm_ops __initconst_
     .show_security_evtchn = flask_show_security_evtchn,
 
     .show_irq_sid = flask_show_irq_sid,
-
-    .do_xsm_op = do_flask_op,
-
-#ifdef CONFIG_COMPAT
-    .do_compat_op = compat_flask_op,
-#endif
 };
 
 const struct xsm_ops *__init flask_init(
--- a/xen/xsm/flask/private.h
+++ b/xen/xsm/flask/private.h
@@ -3,7 +3,7 @@
 
 #include <public/xen.h>
 
-long cf_check do_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op);
-int cf_check compat_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op);
+int cf_check flask_do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op);
+int cf_check flask_do_compat_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op);
 
 #endif /* XSM_FLASK_PRIVATE */
--- a/xen/xsm/xsm_core.c
+++ b/xen/xsm/xsm_core.c
@@ -216,12 +216,12 @@ bool __init has_xsm_magic(paddr_t start)
 
 long do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
 {
-    return xsm_do_xsm_op(op);
+    return xsm_do_xsm_op(XSM_HOOK, op);
 }
 
 #ifdef CONFIG_COMPAT
 int compat_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
 {
-    return xsm_do_compat_op(op);
+    return xsm_do_compat_op(XSM_HOOK, op);
 }
 #endif


