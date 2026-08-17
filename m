Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87515C5DF70
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 08:56:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392712.1631700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvt9D-0005jc-HY; Mon, 17 Aug 2026 08:56:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392712.1631700; Mon, 17 Aug 2026 08:56:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvt9D-0005jV-Ei; Mon, 17 Aug 2026 08:56:47 +0000
Received: by outflank-mailman (input) for mailman id 1392712;
 Mon, 17 Aug 2026 08:56:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wvt9C-0005jN-76
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 08:56:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvt9B-00BBIF-Je
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 10:56:45 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82ccbc-8faa-0a2a0a5109dd-0a2a450a85b6-38
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:56:45 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82cccd-f2d2-0a2a450a0019-d155dd31e152-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:56:45 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-47de0093c42so2795532f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 01:56:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5b7cd38sm2374589f8f.32.2026.08.17.01.56.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 01:56:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1786957005; x=1787561805; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uyRZNfEKi5kGEi7GsXb+f9FRAExy/jFd4bMa55xJlqk=;
        b=QnaCWDSZ0PrHXpkeNFzz5fBrP/IHB7LHsQO8cEPSLrr8PDAeOi6/HEae4d8Lpp+rkt
         cYqPv5oPcee3Ccvm5VLvQpJb/laqQQM5wyRe6nlwPesu+ss8o82K3OMl998X3kqiZnuq
         kz6BhFJabH0UIspXvoJMnaaXPG0Annan5puj1jDs/g+LwHmYx0+RMWPbHf6bqeD9qsJJ
         jKtU82A0+NtEDnAda/mRXdtxFUTJbITUo87luoGXdz0037NKFy+J4Iv4BgmOJkl1oc7k
         SnOwelZiGfbErZ/2goxKZ/998S25+ZgHtg2KzOO1tmLQXZ1HGrEwmNH4BbytzgZDSXx/
         LygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786957005; x=1787561805;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uyRZNfEKi5kGEi7GsXb+f9FRAExy/jFd4bMa55xJlqk=;
        b=TjRkYeGU1pgCvDgLNS0BJ3ysi+UaJZGz3QnJai4zbPkWogE6q82paHtvVCxINNhmaM
         h0iN5rpNm9yCZmsrik8Qiycu3j+5OdiPnCXWQyamb6FuZeYNJmfkAbop6qdE6c31Q397
         CAvlp+KaoA4PhJ1gTL57YOsbOMCbO5JYGLprbiYKSh0JjqtOoF302Np4wewrU/eFHUt0
         17eJLik07raWw1Ms4W3Br2U6NmaeEC+/diJG4Ig4ytMUhKQnL11cH1DgtiY/OGVYZcpU
         YmPZESkuKsOTPjVf81ZLy9aPGH0gygBWzQGclk6+SY0vGtnqjz9hfQNpV/KRLkwakS+m
         Z1CQ==
X-Gm-Message-State: AOJu0YwTTWxSyYqYFux4/jyE4MTIktFxpS94KoPE7i+chrjyvtwBVIvX
	Rli5bqet9OCOrnwmOfyov4MrRBLOnKax0ntHEE+zQZO/3d2z4quhgz7zz0mOeU7KpqzZRrgft5u
	KXibaeg==
X-Gm-Gg: AR+sD10xkEAtbvzb6GYWd3r4TbF4cG8eZcU4IlPJLWOXs7d79AwqI1hmGWRCXJKc/h4
	3Jkr16dtJJV6WuLtMOB8hNrSM6Kg+ccWLFbeSap+6dKhMsuwWZ7e7MEZO4VAtEvQe0yNHHMi7pn
	1GlSmj5Edxa1dohMBF4glw7NZw7HzPmemBvCFtdFnWYWohFsIznhI2yQz6Zw4BFFmuF1qMt2jp7
	bMzRlU8eICvOm/TgY+4w1qGmjauW1rZD4JhpjfFQ0LvF45KUf6YotPyObM7MNFnxd3jWkLO76Gz
	3jaYKzBiXmByQavac7r//48zGD/xoFYcY4eC3irQEZmOyU3dwwhWuWOGodn/HXyFzCN86T20DYp
	XmyX3azKtnBr9hHfPlyoQ6Ff3KeRHs60HdQJhJNt8D1dvflL4rGsmwHwQSZ3dl1auyeBp6JcfmD
	gGuaJcgJBXa7mU3cgs7TjnQZxHQvrGmRFiOtYf+9lqxpcN124usXSsar1zryL++AH5FXVU8PvWh
	Jhv5fSqqJUvBu+V5zpqjKlICV4y6q8LZ/RHOFZVJNZ8/X/PLCYLUA==
X-Received: by 2002:adf:f3ce:0:b0:47f:8480:4abd with SMTP id ffacd0b85a97d-4816079d16bmr26232842f8f.29.1786957004957;
        Mon, 17 Aug 2026 01:56:44 -0700 (PDT)
Message-ID: <ada7e383-560a-4168-8d39-b6622ab804d7@suse.com>
Date: Mon, 17 Aug 2026 10:56:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 11/14] XSM: convert remaining event channel hooks
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
X-purgate-ID: tlsNG-4011c0/1786957005-52CDBCFC-607E69A7/0/0
X-purgate-type: clean
X-purgate-size: 7123

Make them follow the standard scheme, i.e. taking xsm_default_t as first
argument at call sites. This way they can be covered by the recently
introduced hook machinery.

While there, uniformly convert struct evtchn chn[] notation to pointer
form, as the (nicer) array representation is harder to make usable with
the hooks.h logic.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -159,7 +159,7 @@ static void free_evtchn_bucket(struct do
     if ( !bucket )
         return;
 
-    xsm_free_security_evtchns(bucket, EVTCHNS_PER_BUCKET);
+    xsm_free_security_evtchns(XSM_HOOK, bucket, EVTCHNS_PER_BUCKET);
     xfree(bucket);
 }
 
@@ -172,7 +172,7 @@ static struct evtchn *alloc_evtchn_bucke
     if ( !chn )
         goto err;
 
-    if ( xsm_alloc_security_evtchns(chn, EVTCHNS_PER_BUCKET) )
+    if ( xsm_alloc_security_evtchns(XSM_HOOK, chn, EVTCHNS_PER_BUCKET) )
         goto err;
 
     for ( i = 0; i < EVTCHNS_PER_BUCKET; i++ )
@@ -297,7 +297,7 @@ void evtchn_free(struct domain *d, struc
     chn->notify_vcpu_id = 0;
     chn->xen_consumer   = 0;
 
-    xsm_evtchn_close_post(chn);
+    xsm_evtchn_close_post(XSM_HOOK, chn);
 }
 
 static int evtchn_get_port(struct domain *d, evtchn_port_t port)
@@ -1779,7 +1779,7 @@ static void domain_dump_evtchn_info(stru
             break;
         }
 
-        ssid = xsm_show_security_evtchn(d, chn);
+        ssid = xsm_show_security_evtchn(XSM_HOOK, d, chn);
         if (ssid) {
             printk(" Z=%s\n", ssid);
             xfree(ssid);
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -311,8 +311,10 @@ static XSM_INLINE int xsm_evtchn_interdo
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE void xsm_evtchn_close_post(struct evtchn *chn)
-{}
+static XSM_INLINE void xsm_evtchn_close_post(XSM_DEFAULT_ARG struct evtchn *chn)
+{
+    XSM_ASSERT_ACTION(XSM_HOOK);
+}
 
 static XSM_INLINE int xsm_evtchn_send(
     XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn)
@@ -336,18 +338,22 @@ static XSM_INLINE int xsm_evtchn_reset(
 }
 
 static XSM_INLINE int xsm_alloc_security_evtchns(
-    struct evtchn chn[], unsigned int nr)
+    XSM_DEFAULT_ARG struct evtchn *chn, unsigned int nr)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return 0;
 }
 
 static XSM_INLINE void xsm_free_security_evtchns(
-    struct evtchn chn[], unsigned int nr)
-{}
+    XSM_DEFAULT_ARG struct evtchn *chn, unsigned int nr)
+{
+    XSM_ASSERT_ACTION(XSM_HOOK);
+}
 
 static XSM_INLINE char *xsm_show_security_evtchn(
-    struct domain *d, const struct evtchn *chn)
+    XSM_DEFAULT_ARG struct domain *d, const struct evtchn *chn)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return NULL;
 }
 
--- a/xen/include/xsm/hooks.h
+++ b/xen/include/xsm/hooks.h
@@ -34,6 +34,11 @@ XSM_HOOK(int, evtchn_interdomain, struct
 XSM_HOOK(int, evtchn_send, struct domain *, struct evtchn *)
 XSM_HOOK(int, evtchn_status, struct domain *, struct evtchn *)
 XSM_HOOK(int, evtchn_reset, struct domain *, struct domain *)
+XSM_HOOK(void, evtchn_close_post, struct evtchn *)
+XSM_HOOK(int, alloc_security_evtchns, struct evtchn *, unsigned int)
+XSM_HOOK(void, free_security_evtchns, struct evtchn *, unsigned int)
+XSM_HOOK(pchar_t, show_security_evtchn, struct domain *,
+                                        const struct evtchn *)
 
 #ifdef CONFIG_GRANT_TABLE
 XSM_HOOK(int, grant_mapref, struct domain *, struct domain *, uint32_t)
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -21,6 +21,9 @@
 /* policy magic number (defined by XSM_MAGIC) */
 typedef uint32_t xsm_magic_t;
 
+/* Auxiliary type(s) for use in hook definitions. */
+typedef char *pchar_t;
+
 #ifdef CONFIG_XSM_FLASK
 #define XSM_MAGIC 0xf97cff8cU
 #else
@@ -76,13 +79,8 @@ struct xsm_ops {
 
 #include "hooks.h"
 
-    void (*evtchn_close_post)(struct evtchn *chn);
-
     int (*alloc_security_domain)(struct domain *d);
     void (*free_security_domain)(struct domain *d);
-    int (*alloc_security_evtchns)(struct evtchn chn[], unsigned int nr);
-    void (*free_security_evtchns)(struct evtchn chn[], unsigned int nr);
-    char *(*show_security_evtchn)(struct domain *d, const struct evtchn *chn);
 
     char *(*show_irq_sid)(int irq);
 };
@@ -104,8 +102,9 @@ static inline void xsm_security_domainin
     alternative_vcall(xsm_ops.security_domaininfo, d, info);
 }
 
-#define XSM_ALT_void alternative_vcall
-#define XSM_ALT_int  return alternative_call
+#define XSM_ALT_void      alternative_vcall
+#define XSM_ALT_int       return alternative_call
+#define XSM_ALT_pchar_t   return alternative_call
 
 #define XSM_HOOK0(rtype, name) \
 static inline rtype xsm_ ## name(xsm_default_t def) \
@@ -150,11 +149,6 @@ static inline rtype xsm_ ## name( \
 
 #include "hooks.h"
 
-static inline void xsm_evtchn_close_post(struct evtchn *chn)
-{
-    alternative_vcall(xsm_ops.evtchn_close_post, chn);
-}
-
 static inline int xsm_alloc_security_domain(struct domain *d)
 {
     return alternative_call(xsm_ops.alloc_security_domain, d);
@@ -165,24 +159,6 @@ static inline void xsm_free_security_dom
     alternative_vcall(xsm_ops.free_security_domain, d);
 }
 
-static inline int xsm_alloc_security_evtchns(
-    struct evtchn *chn, unsigned int nr)
-{
-    return alternative_call(xsm_ops.alloc_security_evtchns, chn, nr);
-}
-
-static inline void xsm_free_security_evtchns(
-    struct evtchn *chn, unsigned int nr)
-{
-    alternative_vcall(xsm_ops.free_security_evtchns, chn, nr);
-}
-
-static inline char *xsm_show_security_evtchn(
-    struct domain *d, const struct evtchn *chn)
-{
-    return alternative_call(xsm_ops.show_security_evtchn, d, chn);
-}
-
 static inline char *xsm_show_irq_sid(int irq)
 {
     return alternative_call(xsm_ops.show_irq_sid, irq);
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -26,13 +26,8 @@ static const struct xsm_ops __initconst_
 
 #include <xsm/hooks.h>
 
-    .evtchn_close_post             = xsm_evtchn_close_post,
-
     .alloc_security_domain         = xsm_alloc_security_domain,
     .free_security_domain          = xsm_free_security_domain,
-    .alloc_security_evtchns        = xsm_alloc_security_evtchns,
-    .free_security_evtchns         = xsm_free_security_evtchns,
-    .show_security_evtchn          = xsm_show_security_evtchn,
 
     .show_irq_sid                  = xsm_show_irq_sid,
 };
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1915,13 +1915,8 @@ static const struct xsm_ops __initconst_
 
 #include <xsm/hooks.h>
 
-    .evtchn_close_post = flask_evtchn_close_post,
-
     .alloc_security_domain = flask_domain_alloc_security,
     .free_security_domain = flask_domain_free_security,
-    .alloc_security_evtchns = flask_alloc_security_evtchns,
-    .free_security_evtchns = flask_free_security_evtchns,
-    .show_security_evtchn = flask_show_security_evtchn,
 
     .show_irq_sid = flask_show_irq_sid,
 };


