Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861B0C531D0
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 10:29:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371573.1619073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woIaX-0003B5-R6; Mon, 27 Jul 2026 10:29:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371573.1619073; Mon, 27 Jul 2026 10:29:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woIaX-0003Ay-OA; Mon, 27 Jul 2026 10:29:37 +0000
Received: by outflank-mailman (input) for mailman id 1371573;
 Mon, 27 Jul 2026 10:29:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woIaW-0003As-Vl
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 10:29:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woIaW-0016nf-Bk
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 12:29:36 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6732f7-e002-0a2a0a5209dd-0a2a450bbaa6-48
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 12:29:36 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a673310-b7e8-0a2a450b0019-d1558033c002-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 12:29:36 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-49555a0e68bso12542915e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 03:29:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496b4f30126sm211724845e9.13.2026.07.27.03.29.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2026 03:29:35 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Content-Language:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785148176; x=1785752976; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vXZrrvznAleh7c2VaqwSltJKFwyZgtr0U+NrASsBteY=;
        b=IqzcAGw0LeJtXAqPmsv2SPULBlXyD26G0ZRgf50xMYyZjyI7ehvbHf+IDgqJPdQOfG
         ybmNmmOvhUg+JblYJGET2NLQF6hcc4tcjfxXvlluA/zBIxROET03FFesiOZeq2nEqzs6
         AVs0nqhLOmGsrbTrFdk7Q3gnI2Igumg/bzMK8kpNq9HH6ySllJ8stbbcsLf9ouRC4t5H
         UN7iLBimqiHpEdHZxMo+1l9aWU+BKjk+9hSUD1X3oHEXMPV+ZPewgqNgxKkcW2WNfjuN
         k1pDzRqqCZkjtsAYVdPRawFN+Y4tfDo8BxXzicM/IcbZPzMbXjDw01n/+Eld8Wz7BypU
         Ftwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785148176; x=1785752976;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vXZrrvznAleh7c2VaqwSltJKFwyZgtr0U+NrASsBteY=;
        b=tAZ/oTicNnZ2jgr1pWNB0WJJ99H9KOx65EPBMASNjF22NTlYHr/MnK8u2d2bCh1C3P
         cNooTeshLvey2eHYbSz+l4KHS7k/OBKgbHCWS6G5ybu61hk06tLlHfQGtBUrgHIWG5Yf
         qNcmZUf92uB6eCgaLNkJGGmTOr+YYGX3hG/x7iIIJI3AQ+PqObOzhEo1iSsnweasYJMT
         NIiSQK4wyKMaShV7vqdU2meoomIXowVG/qFL0iK6vo9da+gkqF11oLl+04/vIGSsSl4N
         h3kFEbqIvO1TmGPPE0u6Mhzx+DWD6A5EjoA5a6aHNSkU3mI7o6xPqCAFC5BE7rJiZiyu
         Mf2w==
X-Gm-Message-State: AOJu0YxSltBa5XDu9ciVcivONqlG9h+yof1XB0IjQl+IPhby3x3wUI6o
	ZxHsJS9aDUmVcd8KXQtThPPrijXbiAcSX2dDPumQzIXeCksyUUwV9orl+xSoRw38nZpM1KM80NK
	ccybWZQ==
X-Gm-Gg: AR+sD10pap7u8VgGaViB9h/Sc/NCGRWwQhPHzEKFOBCnhie1iTpzJPKLQEApCbtfb6X
	gDsLGb6Je6y6cCoIHafkKHc7dZBZyFHi4DlHMCQSKMYRRrDYzxVBt4BGIzIbK94onPHNPFqeov6
	zOOdsfAq0AFfLR4ZcuzkPJODM/zudlsXxSbdwBSKBiTwx/v3uHYtOFghtySn5Se+eYRy9f/AcM3
	hlWbT8PUs98lfmfFbHx/KW1CE5OVdJCtuZY10b+7H8f1pwAp0l9a/MbkDxaENpfNXVgbCKBj/Ef
	GgIEm0RiggF3H94prasIKmK0SbOeluc1essL/EkiIJ7PTlnAK5dTVb4RtZn8yQQPIwuinVKF2yw
	fmpvEigIS0+sDckpui8Is6QwjUt9uOAW7BHHnAFmUGEhEdCWfKi+XzDxhLG7Zq5GSrh/fRxwrIN
	maRtBWTIa24NDVZQVdH2LH+Cwe6xBGGOjc4C8hnOLPrzKvUylBrzzUbTyEz8E/ghLpwQ==
X-Received: by 2002:a05:600c:35d6:b0:496:bbce:fd with SMTP id 5b1f17b1804b1-496bc0500bemr71406525e9.6.1785148175775;
        Mon, 27 Jul 2026 03:29:35 -0700 (PDT)
Message-ID: <e4ec42aa-91c8-4102-84f9-844cecbe2eb0@suse.com>
Date: Mon, 27 Jul 2026 12:29:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/PV: avoid HVM-copying alternatives in PV-only code
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1785148176-1B2DC9EA-EFA468EA/0/0
X-purgate-type: clean
X-purgate-size: 5001

x86/PV: avoid HVM-copying alternatives in PV-only code

raw_copy_*_guest*() expanding to both a HVM and a PV alternative leaves a
lot of unreachable code, violating Misra C:2012 rule 2.1 (without Eclair
being able to spot this). Introduce a mechanism to avoid that in handling
of PV-only hypercalls (i.e. ones which only PV domains can issue and which
only act on PV domains [or which are not domain related]).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
In my default test build this reduces overall code size by almost 2k, and
that's with PV_SHIM=n.

RFC: The HVM-only enabling is just in case; right now it doesn't look as
     if that would actually be usable anywhere.

Overriding is_hvm_vcpu() (and/or is_hvm_domain()) of course has yet better
effects, which pv/shim.c shows particularly well. Yet Misra won't like us
doing so.
---
v2: Rename manifest constants. Also change raw_clear_guest(). Drop kexec
    change.

--- a/xen/arch/x86/compat.c
+++ b/xen/arch/x86/compat.c
@@ -5,6 +5,8 @@
  * hypercall after doing necessary argument munging.
  */
 
+#define GUEST_ACCESS_PV true
+
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
 #include <xen/trace.h>
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -1262,6 +1262,8 @@ static void cf_check __maybe_unused x86_
 
 #ifdef CONFIG_PV /* do_mca() hypercall is PV-only */
 
+#define GUEST_ACCESS_PV true
+
 #if BITS_PER_LONG == 64
 
 /* Two layers of casting to cover Misra C:2012 rule 11.2. */
@@ -1666,6 +1668,8 @@ long do_mca(XEN_GUEST_HANDLE_PARAM(xen_m
     return ret;
 }
 
+#undef GUEST_ACCESS_PV
+
 #endif /* CONFIG_PV */
 
 static int mcinfo_dumped;
--- a/xen/arch/x86/include/asm/guest_access.h
+++ b/xen/arch/x86/include/asm/guest_access.h
@@ -12,25 +12,30 @@
 #include <asm/hvm/support.h>
 #include <asm/hvm/guest_access.h>
 
+#define IS_HVM_ACCESS                           \
+    (IS_ENABLED(GUEST_ACCESS_HVM) ||            \
+     (!IS_ENABLED(GUEST_ACCESS_PV) &&           \
+      is_hvm_vcpu(current)))                    \
+
 /* Raw access functions: no type checking. */
 #define raw_copy_to_guest(dst, src, len)        \
-    (is_hvm_vcpu(current) ?                     \
+    (IS_HVM_ACCESS ?                            \
      copy_to_user_hvm((dst), (src), (len)) :    \
      copy_to_guest_pv(dst, src, len))
 #define raw_copy_from_guest(dst, src, len)      \
-    (is_hvm_vcpu(current) ?                     \
+    (IS_HVM_ACCESS ?                            \
      copy_from_user_hvm((dst), (src), (len)) :  \
      copy_from_guest_pv(dst, src, len))
 #define raw_clear_guest(dst,  len)              \
-    (is_hvm_vcpu(current) ?                     \
+    (IS_HVM_ACCESS ?                            \
      clear_user_hvm((dst), (len)) :             \
      clear_guest_pv(dst, len))
 #define __raw_copy_to_guest(dst, src, len)      \
-    (is_hvm_vcpu(current) ?                     \
+    (IS_HVM_ACCESS ?                            \
      copy_to_user_hvm((dst), (src), (len)) :    \
      __copy_to_guest_pv(dst, src, len))
 #define __raw_copy_from_guest(dst, src, len)    \
-    (is_hvm_vcpu(current) ?                     \
+    (IS_HVM_ACCESS ?                            \
      copy_from_user_hvm((dst), (src), (len)) :  \
      __copy_from_guest_pv(dst, src, len))
 
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -3407,6 +3407,9 @@ int new_guest_cr3(mfn_t mfn)
 #endif
 
 #ifdef CONFIG_PV
+
+#define GUEST_ACCESS_PV true
+
 static int vcpumask_to_pcpumask(
     struct domain *d, XEN_GUEST_HANDLE_PARAM(const_void) bmap, cpumask_t *pmask)
 {
@@ -3447,6 +3450,8 @@ static int vcpumask_to_pcpumask(
     }
 }
 
+#undef GUEST_ACCESS_PV
+
 long do_mmuext_op(
     XEN_GUEST_HANDLE_PARAM(mmuext_op_t) uops,
     unsigned int count,
@@ -3983,6 +3988,8 @@ long do_mmuext_op(
     return rc;
 }
 
+#define GUEST_ACCESS_PV true
+
 long do_mmu_update(
     XEN_GUEST_HANDLE_PARAM(mmu_update_t) ureqs,
     unsigned int count,
@@ -4361,6 +4368,9 @@ long do_mmu_update(
 
     return rc;
 }
+
+#undef GUEST_ACCESS_PV
+
 #endif /* CONFIG_PV */
 
 /*
--- a/xen/arch/x86/pv/callback.c
+++ b/xen/arch/x86/pv/callback.c
@@ -5,6 +5,8 @@
  * hypercall handles and helper functions for guest callback
  */
 
+#define GUEST_ACCESS_PV true
+
 #include <xen/event.h>
 #include <xen/hypercall.h>
 #include <xen/guest_access.h>
--- a/xen/arch/x86/pv/descriptor-tables.c
+++ b/xen/arch/x86/pv/descriptor-tables.c
@@ -8,6 +8,8 @@
  * Copyright (c) 2004 Christian Limpach
  */
 
+#define GUEST_ACCESS_PV true
+
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
 
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -6,6 +6,9 @@
  *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
+
+#define GUEST_ACCESS_PV true
+
 #include <xen/event.h>
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>


