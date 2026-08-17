Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B04C5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 08:58:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392733.1631728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvtBB-0007gq-D1; Mon, 17 Aug 2026 08:58:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392733.1631728; Mon, 17 Aug 2026 08:58:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvtBB-0007gj-9U; Mon, 17 Aug 2026 08:58:49 +0000
Received: by outflank-mailman (input) for mailman id 1392733;
 Mon, 17 Aug 2026 08:58:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wvtB9-0007gT-Vn
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 08:58:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvtB8-005H11-Jl
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 10:58:46 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82cd38-8faa-0a2a0a5109dd-0a2a4509baf2-32
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:58:46 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82cd46-be1a-0a2a45090019-d155dd2eb887-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:58:46 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-47362928f65so3040073f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 01:58:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4999d11f073sm28466565e9.15.2026.08.17.01.58.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 01:58:45 -0700 (PDT)
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
        d=suse.com; s=google; t=1786957126; x=1787561926; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JTfzh5nMGjglXFSQtaFq+GPWNKgrY8T3kAqW5LSmjgc=;
        b=cgTUpKGY5VsugGAI0/KhXS+MYDhS3vL+p82T7JjpaUifAttT7566OfO8qkG6IQzOL3
         Y8TZXRVZxYlN8+FYh2s4IoKBZfBwdnpg2S9l3xxkk8hgMKaGUfYLg45Js2KJHLVZ2+V7
         upp/VLkU1gjq7oJJt9riTI+RMCSKbWsMsTcr8h1duU3vbtecOYEsFnM4O5vUUBnON8Sr
         ScWypRu9zkaVl6RyMCrJDXP9WnZPcV7a3w+ZrvqYktfN9t443M+5U2h0U2z8Z2+pl3zc
         QonP3/pTmBwmLgzAmW1X+CBVxbIsidTeCptk8hZoRSBS3YovcY/k67ePniNHvVFd+5ig
         UJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786957126; x=1787561926;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JTfzh5nMGjglXFSQtaFq+GPWNKgrY8T3kAqW5LSmjgc=;
        b=UQy0Vbzgtyy10xhWxak45rrLZQJ4JD4vN64Hs44i6BoZuxi6d2UYitjIKF3ZLhrrtD
         LbEUVAE8PxSRE+Gwj02lCJ8xMvBvuvo2MEe4bzg8ZxWuHxebpsWu7lh28B+cZ29LXTPW
         +7EXIey5pJVlTgMu71Iu5cUxKqR5IenJ3MpNkVESHNVZ1x6l9Mc9clD1n15Rf4Io5pVH
         +9NY4Opi22zC17r6DlP+EjTV05V6VqdEIy6B+g4yQw+dJpJsAqcxRzR0FTv8jvL9GZwe
         NEnOaAxAo1jhqn+RCZUa+kaG2C4u4wrt2dRJ2BnOoUH70p6SO4FkqVJjDoj/814X/5gq
         y2pA==
X-Gm-Message-State: AOJu0Yxr/P/cbAsVomNKzPdL4GKKxjePChedHtC8q36Ty/no8aCPYx7F
	3Fp0rTfnGZc6f2+Qy/q8Kv0Ot98/1XIOJAL+LDu149NjSHY7hpXRMO8IDTD0YQ0BntvAlcdz47c
	nC956yQ==
X-Gm-Gg: AR+sD12ZTIq4dlEFOmbqG1NCISa0NI5ISajzaxl59jnk1Mf0EfOE78Vlc6E5dpHMSaj
	2OzsdAiwPp9hycKRNXOJWD43z+82owUEAZlRHvQJz3h1BAEBK5sjbLQ1t7/sNPY498V+PGWNns+
	BnOn/nVJv1CkY19i3E6ActiEqXvBqH4/v5uo8aoUz9IPbgEKhx8JhQ7RjoYqBeidmnD8+4eNt7j
	ikWpyZvA+B7JhyowntHw2kHEijqK4gk3KJ7ANt4B+0GAdh3tK/LXUtw0codBWAVoDUJw4jCD1hP
	tnEoJwhEtRwAoSt2CXFNl895yvveUaU+OOnANViNBpmnYZs8FxixVSamO3A8FKiXVO4pDrj8zvC
	7mwyNwAYKpnH/AFs1RjUYy8h6jGd1M7CsMgxsIW7DAYBrmD0t0BVC5Lze0HDUR8XCW4pdmc/1+H
	cj6+TzztS8SJtMKOlkfxBoqXNxrZBNLszIdhd9wasxrDIbL+3H8RTH2bSM7OVw7JekMuaS9RT+z
	lFRVmfDRSjxaYd3K7by8qYmAhn+iPwMkps+PMlCltns2u5tNvTbzQ==
X-Received: by 2002:a05:600c:3585:b0:499:9eb7:4558 with SMTP id 5b1f17b1804b1-4999eb7462amr4762655e9.10.1786957126079;
        Mon, 17 Aug 2026 01:58:46 -0700 (PDT)
Message-ID: <0511f8a7-7790-44c3-addd-67a969f4f5c1@suse.com>
Date: Mon, 17 Aug 2026 10:58:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH RFC v2 14/14] XSM: avoid fragile assumptions in
 xsm_fixup_ops()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
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
X-purgate-ID: tlsNG-bad1c0/1786957126-BD8C1034-97BB62B4/0/0
X-purgate-type: clean
X-purgate-size: 3645

Using the recently introduced hook machinery, the assumptions made can be
avoided, at the expense of a significant code size increase.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: Of course the significantly increased code size isn't nice. Yet then
     it's all .init.text bloat only.

RFC: The asm() is somewhat like RELOC_HIDE(), with an offset of 0. It
     didn't feel quite right to use that macro here, though.

The generated code I've looked at (both for x86 and Arm64) it is clear
that a similar weakness in codegen exists for the recurring accesses to
_{s,e}text[] by is_kernel_text(): A register variable each would shrink
code size significantly, yet that doesn't appear to happen at -O1. Yet
open-coding isn't an option, imo.
---
v2: New.

--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -51,15 +51,6 @@ typedef enum xsm_default xsm_default_t;
 #define XSM_MMU_MACHPHYS_UPDATE  8
 #endif /* CONFIG_X86 */
 
-/*
- * !!! WARNING !!!
- *
- * For simplicity, xsm_fixup_ops() expects that this structure is made
- * exclusively of function pointers to non-init functions.  Think carefully
- * before deviating from the pattern.
- *
- * !!! WARNING !!!
- */
 struct xsm_ops {
 
 #define XSM_HOOK0(rtype, name) rtype (*name)(void);
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -28,29 +28,35 @@ static const struct xsm_ops __initconst_
 
 void __init xsm_fixup_ops(struct xsm_ops *ops)
 {
+    const struct xsm_ops *dops = &dummy_ops;
+
     /*
-     * We make some simplifying assumptions about struct xsm_ops; that it is
-     * made exclusively of function pointers to non-init text.
-     *
-     * This allows us to walk over struct xsm_ops as if it were an array of
-     * unsigned longs.
+     * To limit the size of generated code (by avoiding the compiler using
+     * dummy_ops directly for every access), hide the relationship between
+     * dops and dummy_ops.
      */
-    unsigned long *dst = _p(ops);
-    const unsigned long *src = _p(&dummy_ops);
+    asm ( "" : "+r" (dops) );
 
-    for ( ; dst < (unsigned long *)(ops + 1); src++, dst++ )
-    {
-        /*
-         * If you encounter this BUG(), then you've most likely added a new
-         * XSM hook but failed to provide the default implementation in
-         * dummy_ops.
-         *
-         * If not, then perhaps a function pointer to an init function, or
-         * something which isn't a function pointer at all.
-         */
-        BUG_ON(!is_kernel_text(*src));
+    /*
+     * If you encounter the BUG() below, then you've most likely added a
+     * new XSM hook but failed to provide the default implementation in
+     * dummy_ops.
+     *
+     * If not, then perhaps a function pointer to an init function, or
+     * (less likely) something which isn't a function pointer at all.
+     */
+#define XSM_HOOK0(rtype, name)                    \
+    do {                                          \
+        typeof(xsm_ ## name) *dummy = dops->name; \
+        BUG_ON(!is_kernel_text(dummy));           \
+        if ( !ops->name )                         \
+            ops->name = dummy;                    \
+    } while ( false );
+#define XSM_HOOK1(rtype, name, ...) XSM_HOOK0(rtype, name)
+#define XSM_HOOK2(rtype, name, ...) XSM_HOOK0(rtype, name)
+#define XSM_HOOK3(rtype, name, ...) XSM_HOOK0(rtype, name)
+#define XSM_HOOK4(rtype, name, ...) XSM_HOOK0(rtype, name)
+#define XSM_HOOK5(rtype, name, ...) XSM_HOOK0(rtype, name)
 
-        if ( !*dst )
-            *dst = *src;
-    }
+#include <xsm/hooks.h>
 }


