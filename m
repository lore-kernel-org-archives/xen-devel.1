Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D30C5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 08:58:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392726.1631718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvtAT-0006z3-4D; Mon, 17 Aug 2026 08:58:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392726.1631718; Mon, 17 Aug 2026 08:58:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvtAT-0006yw-1Q; Mon, 17 Aug 2026 08:58:05 +0000
Received: by outflank-mailman (input) for mailman id 1392726;
 Mon, 17 Aug 2026 08:58:03 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wvtAR-0006xn-Ol
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 08:58:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvtAR-009RUc-5R
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 10:58:03 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82cd1b-2eae-0a2a0a5409dd-0a2a450baa0e-0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:58:03 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82cd1a-b7e8-0a2a450b0019-d155dd2ae830-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:58:02 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-47f6609c657so1474512f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 01:58:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5a31396sm2279394f8f.2.2026.08.17.01.58.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 01:58:02 -0700 (PDT)
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
        d=suse.com; s=google; t=1786957082; x=1787561882; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8QVewtRw+TwFKfjqe5upIsoN/acNO1D5x9ht9JMPqQM=;
        b=EPu+UbRKbFFBoDP2pn29coHY9xhdEERQ3jCxcAru/9iN+sQusNc4vAn5hnalitVMI0
         JuRTcdqHqf6sK/hKqJ0KEJV5MV1XxSST3UwLOfsJ7QjatahiC5fcj0KQ79/TFcAqliwj
         CF5deqzKxRb57cQ4XFtvB5iyn7giOXpSPX5jQspwyDaI/vlcXYN1UgQxvemcvEePP02i
         PS6yUb1cY9UMNUTs8LHnQO8cBzrDVBLdPQHlFUT5W+Fgpa6Ldx9FvM29RX4JoOt6mKzh
         cdDSBthLJ80oAxPok3srArHX911JRyPwMMGmrQo8PhikH8mwE7g+YovS5JV5rdZkcOZJ
         AwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786957082; x=1787561882;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8QVewtRw+TwFKfjqe5upIsoN/acNO1D5x9ht9JMPqQM=;
        b=hWdbVfdW7ReBDJqJf9ncNwi7n7egR9XY8GwW9y8gXBjX3chdkrijlwE3LsYeVZVXvj
         FZSIXI9K4mFkcwAdCPbRFs4u/uO37HDtD3SFmOx8Wj/X8ZIrYyuwuyUYz8ZibyPOSelH
         k0RTsBEaaLVpJvNFuCwDo+y1aI5QxSWP2lxAGFf4PlnEWj+tuAqzlBpeh4ZnRoj9sKlP
         Ljj0/3Jg68b/5uaQA2kQS4UENyInjeKyAi4WWWHSQNX6ZJo8WGeTr9LBsESKzUQPAnaN
         mUKFza/7IjeZU0NtmopDlIoCKUxLZQ3q1FcXRM53LBqubocjCwaw5a8ghTX6PM0iiDZU
         fl8A==
X-Gm-Message-State: AOJu0YyWGECmjmRigHK6ytFqhU8ZEKlG7LQ/Wc7/IDWW3TLIy7VV+5AW
	+R3C263GhEpcMwR6gS4u8Z3aX2bbHjEKWjXgfe7BBLCZ6Ao/iHtcP7Ov3DEW+ISPhxhYMiUVrNc
	HHGHykA==
X-Gm-Gg: AR+sD10SmzfaX+8DV2IoQaEHbHx/QSw+9rPfyR0xuyFYZ5GS5SeIgC4pwTeZDRAC3P1
	pYtFMOdX/wUrjs4Vd9yvT8v5wsN+AK+PrmWqYW5chZ/+WqB+WihZXOHY2lPmsmzcp8kVWiVnN8J
	ItuvZblqtD7vSMhVSkSnscBL62bfG2af3sqYj5TRg76F6JACo21HmcG+adnKveApak/NNKxK3Nb
	aMwvDh4pa36OW3vQCVCUeuzY3XC2GASsQc918iU3ffcvTTDCGP4xPlirXmijYIsjM2HhmUTrchF
	chUQJVa+mU3pjjDFIgDpjA+3HA63qrffZ6m6Rl2SO6WfR8EuGcDDh08WhDyObzr2Fi/uruWTSiQ
	Q9eWBEc3dEWlkv0HdPwoWOKxxMKjIF4sRQx7CG5tiJBjZdAD3fliEoBCduE1cBcN8gEROY8kRxh
	ynIJrzhNPq1lifcRv89rhjqkjGeinkIs6vJm0tRRfb5Eu8KI4epEY15xUFip8uUO8A6mQai7lN+
	ChV2IfR8hMjq9sPygmqY9Lg397ccWnI6sDzL09tjZ5H9IglvD6E
X-Received: by 2002:a05:6000:240c:b0:47f:e9fd:80d8 with SMTP id ffacd0b85a97d-481607947e2mr34071751f8f.21.1786957082432;
        Mon, 17 Aug 2026 01:58:02 -0700 (PDT)
Message-ID: <aac7d8fa-ef0d-4146-883f-deb9ec04a519@suse.com>
Date: Mon, 17 Aug 2026 10:58:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 13/14] XSM: convert remaining miscellaneous hooks
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
X-purgate-ID: tlsNG-42698a/1786957082-A8ECE9EA-746152B0/0/0
X-purgate-type: clean
X-purgate-size: 5160

Make the ones left also follow the standard scheme, i.e. taking
xsm_default_t as first argument at call sites. This way they can be
covered by the recently introduced hook machinery.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Interestingly .show_irq_sid() is unused on Arm. Oddly there's no use of
register_keyhandler() there at all. (IOW I think it would be wrong to make
the hook x86-only.)
---
v2: New.

--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -497,7 +497,7 @@ void asmlinkage __init noreturn start_xe
     /* Hide UART from DOM0 if we're using it */
     serial_endboot();
 
-    if ( (rc = xsm_set_system_active()) != 0 )
+    if ( (rc = xsm_set_system_active(XSM_HOOK)) != 0 )
         panic("xsm: unable to switch to SYSTEM_ACTIVE privilege: %d\n", rc);
 
     system_state = SYS_STATE_active;
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2549,7 +2549,7 @@ static void cf_check dump_irqs(unsigned
         if ( !irq_desc_initialized(desc) || desc->handler == &no_irq_type )
             continue;
 
-        ssid = in_irq() ? NULL : xsm_show_irq_sid(irq);
+        ssid = in_irq() ? NULL : xsm_show_irq_sid(XSM_HOOK, irq);
 
         spin_lock_irqsave(&desc->lock, flags);
 
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -835,7 +835,7 @@ static void noreturn init_done(void)
     unsigned long start, end;
     int err;
 
-    if ( (err = xsm_set_system_active()) != 0 )
+    if ( (err = xsm_set_system_active(XSM_HOOK)) != 0 )
         panic("xsm: unable to switch to SYSTEM_ACTIVE privilege: %d\n", err);
 
     system_state = SYS_STATE_active;
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -104,10 +104,12 @@ static always_inline int xsm_default_act
     }
 }
 
-static XSM_INLINE int xsm_set_system_active(void)
+static XSM_INLINE int xsm_set_system_active(XSM_DEFAULT_VOID)
 {
     struct domain *d = current->domain;
 
+    XSM_ASSERT_ACTION(XSM_HOOK);
+
     ASSERT(d->is_privileged);
 
     if ( d->domain_id != DOMID_IDLE )
@@ -467,8 +469,9 @@ static XSM_INLINE int xsm_do_compat_op(X
 
 #endif /* CONFIG_XSM */
 
-static XSM_INLINE char *xsm_show_irq_sid(int irq)
+static XSM_INLINE char *xsm_show_irq_sid(XSM_DEFAULT_ARG int irq)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return NULL;
 }
 
--- a/xen/include/xsm/hooks.h
+++ b/xen/include/xsm/hooks.h
@@ -17,6 +17,8 @@
 
 #endif /* XSM_HOOK */
 
+XSM_HOOK(int, set_system_active)
+
 XSM_HOOK(int, domain_create, struct domain *, uint32_t)
 XSM_HOOK(int, getdomaininfo, struct domain *)
 XSM_HOOK(int, get_domain_state, struct domain *)
@@ -84,6 +86,8 @@ XSM_HOOK(int, irq_mapping, struct domain
 XSM_HOOK(int, pt_irq_binding, struct domain *, struct xen_domctl_bind_pt_irq *,
                               bool)
 
+XSM_HOOK(pchar_t, show_irq_sid, int)
+
 XSM_HOOK(int, irq_permission, struct domain *, int, bool)
 XSM_HOOK(int, iomem_permission, struct domain *, uint64_t, uint64_t, bool)
 
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -61,7 +61,6 @@ typedef enum xsm_default xsm_default_t;
  * !!! WARNING !!!
  */
 struct xsm_ops {
-    int (*set_system_active)(void);
 
 #define XSM_HOOK0(rtype, name) rtype (*name)(void);
 #define XSM_HOOK1(rtype, name, type1) \
@@ -77,7 +76,6 @@ struct xsm_ops {
 
 #include "hooks.h"
 
-    char *(*show_irq_sid)(int irq);
 };
 
 #ifdef CONFIG_XSM
@@ -86,11 +84,6 @@ extern struct xsm_ops xsm_ops;
 
 #ifndef XSM_NO_WRAPPERS
 
-static inline int xsm_set_system_active(void)
-{
-    return alternative_call(xsm_ops.set_system_active);
-}
-
 #define XSM_ALT_void      alternative_vcall
 #define XSM_ALT_int       return alternative_call
 #define XSM_ALT_pchar_t   return alternative_call
@@ -138,11 +131,6 @@ static inline rtype xsm_ ## name( \
 
 #include "hooks.h"
 
-static inline char *xsm_show_irq_sid(int irq)
-{
-    return alternative_call(xsm_ops.show_irq_sid, irq);
-}
-
 #endif /* XSM_NO_WRAPPERS */
 
 #ifdef CONFIG_MULTIBOOT
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -14,7 +14,6 @@
 #include <xsm/dummy.h>
 
 static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
-    .set_system_active             = xsm_set_system_active,
 
 #define XSM_HOOK0(rtype, name) .name = xsm_ ## name,
 #define XSM_HOOK1(rtype, name, ...) XSM_HOOK0(rtype, name)
@@ -25,7 +24,6 @@ static const struct xsm_ops __initconst_
 
 #include <xsm/hooks.h>
 
-    .show_irq_sid                  = xsm_show_irq_sid,
 };
 
 void __init xsm_fixup_ops(struct xsm_ops *ops)
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1903,7 +1903,6 @@ static int cf_check flask_get_domain_sta
 }
 
 static const struct xsm_ops __initconst_cf_clobber flask_ops = {
-    .set_system_active = flask_set_system_active,
 
 #define XSM_HOOK0(rtype, name) .name = flask_ ## name,
 #define XSM_HOOK1(rtype, name, ...) XSM_HOOK0(rtype, name)
@@ -1914,7 +1913,6 @@ static const struct xsm_ops __initconst_
 
 #include <xsm/hooks.h>
 
-    .show_irq_sid = flask_show_irq_sid,
 };
 
 const struct xsm_ops *__init flask_init(


