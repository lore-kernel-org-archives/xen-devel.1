Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44F8C54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 14:21:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374374.1621531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woigo-0002Qm-2x; Tue, 28 Jul 2026 14:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374374.1621531; Tue, 28 Jul 2026 14:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woigo-0002QK-07; Tue, 28 Jul 2026 14:21:50 +0000
Received: by outflank-mailman (input) for mailman id 1374374;
 Tue, 28 Jul 2026 14:21:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woigm-0002P6-Tg
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 14:21:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woigm-004wxv-AA
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 16:21:48 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68baf8-bab6-0a2a0a5309dd-0a2a45029302-24
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 16:21:48 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68bafb-6ca4-0a2a45020019-d1558032f181-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 16:21:47 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-49548aebcd8so29200925e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 07:21:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957bfd1a60sm303699545e9.2.2026.07.28.07.21.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 07:21:46 -0700 (PDT)
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
        d=suse.com; s=google; t=1785248507; x=1785853307; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HR0du3EiXgBA3rCKAKjjBRbHCVyWjla1ikrTdisIkS0=;
        b=VHQI0kDr/crno7tTBYcG70oEP8dGoq5/1NAbaNx159eRupoToGkJItn7BwMxmhDItq
         uFLxsQsd45RjxGj16HjYVWmV+K9aCn55wZ5ivRciWaSI3SCjETuNbLPC90lV9iyNUy+8
         Ac6J/qmTM90Y6Ee6ws+fn+fWOc6RaeHLQ/5esOngODESDY4LG+4CWk9gFaK49agiCW7w
         EspnMLKMKskAebCtuE66/Gf+hLSlgAbHLuMF/EiZldbcL9CO+cKG++WZnoBNIBNh8H4y
         QfvmsivwUHPLqCrOET3Y+A9/cjPWv9emT/2p2298LNWqo7BBjvg/KhkwXhbcuxpkxHkd
         BCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785248507; x=1785853307;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HR0du3EiXgBA3rCKAKjjBRbHCVyWjla1ikrTdisIkS0=;
        b=bGOTuyAV+znArdFhVFn/IZ6UJrOgg8al+3cRGmGT+5nhu8rYWSxNM4nebCFYjTZbh6
         Lsc+YsCTHt7A2894xIAJdiOTP1ZJku+xluuVAybCwIVvIT67fn8M6t6VFLQUM3f52Y3j
         ay8nkEH6I+2wUG4plLFf7QIv3wAmuVs0UKl0JJy2HMsOlbpENBHBTL2O1/mVnOEmhqRN
         ysX9erhtUn8e5OlVEeJegXbJyEcMCey66AME8RkD+sQ/eP/xGFOkm1ofYKGKDd0ESl2b
         sRwL5uDm9Ex79oyt52l7aexRMa3RwPDRl6h/2gJVj7rl0ZBuYvcsaj3bup+ZOtUukJMq
         Icog==
X-Gm-Message-State: AOJu0YwXpngP1ikogK8BoGdHor4Gx7cLL+QPwzkzob4cTXi5NKwOw7As
	IHhz8nwb0Mh1uA68oRE4mB9oARf+m76wNJvOOCHVUFWOJhI/7SRtmYsFkw7E8MFEpP92GclYT3m
	Oo53iqQ==
X-Gm-Gg: AR+sD10tZ+rSkZnkFhqsMItP2ueEqRqdh7O6gJjJiAleDe7lTK6A66Ubrh/CEAum6V+
	f/+D8GV+RVFU3m04yNq3/ukyOBpMtJKj2Bb8GzLg+/Lt/yn/7RZ3OqbcvalNFGWCVsY4GlWeR/N
	X2FwMpwz+yFaMR8RYdz2TFcOImPcITt8wB00TuJQPdAhAN09Vb220+FsRvfTNZ8DhzdlQjFGkLC
	JmxOsBqFTr5Y+FmpacFLacylybwAAGpyy4vSZ1XiAjW9jgxB0zgZOq9MHbNi2fWdAHU+r91fWk+
	mpKpjSftseTRnUiBizBmXTJNjBWpAtkZYMZHhUBmojX4LcaQDgqnaBxoQ3rn8wZT+g3MaxPGpe+
	vRBcDKr9s5F3lN7RMtDzDVrlYtQEKxUGenJX0BZBolCRQ9ESnTUHOvpyEF3WgA/IZhph06+WMTv
	Tdv10AvK2S8T4Fz3ufeQR9uRe4R//S/tV3FGMqBUFeDqYdh5JocBsJ0XNVo7k2wD90ONI0T22uC
	wcW
X-Received: by 2002:a05:600c:3144:b0:496:b39f:1a03 with SMTP id 5b1f17b1804b1-496c64261fdmr29994245e9.5.1785248507153;
        Tue, 28 Jul 2026 07:21:47 -0700 (PDT)
Message-ID: <da34daa4-0ac6-411f-835e-641c616d25db@suse.com>
Date: Tue, 28 Jul 2026 16:21:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v15 04/10] x86/shadow: reduce amount of work to do by
 shadow_unhook_mappings()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>
References: <68c16600-a4bf-4060-a1fc-56c4ae655b03@suse.com>
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
In-Reply-To: <68c16600-a4bf-4060-a1fc-56c4ae655b03@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1785248508-F2AB52AC-C9910AD6/0/0
X-purgate-type: clean
X-purgate-size: 10127

When preemption is enabled for uses of shadow_blow_tables(), the
granularity of preemption checks in both of the present two passes can
be pretty coarse, as deep table hierarchies may need processing. Reduce
shadow page table depth up front by introducing a third (earlier) pass
processing first L2, then L3 tables by doing hash lookups instead of
tree traversal.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The way need for preemption is being checked for is crude, but the least
intrusive variant I could think of while still respecting hash_foreach()
not permitting further traversal after a removal from the hash.

I've deliberately chosen 0 as the "wildcard", as using INVALID_MFN looks
somewhat more fragile/risky to me. Of course we might consider
introducing WILDCARD_MFN, which then could be non-zero but still
distinct from INVALID_MFN.

I've further deliberately made hash_foreach() return "int", not "bool",
since at least transiently I was also playing with returning -ERESTART
from some of the callback functions.

We could avoid the hash walk for guests which never entered 64-bit mode.
That would require tracking the maximum shadow paging level that was
ever used (perhaps since the last [completed] shadow_blow_tables()) by a
domain. (This would similarly apply to future 5-level support, where we
could avoid the SHF_L4_ANY walk for guests never having entered 5-level
mode.)

The same may want (need) adding to _shadow_prealloc() and perhaps
elsewhere. However, for zapping entries from alive domains hash lookup
pulling most recently used entries to the front means most recently used
entries would then also be zapped first, which isn't very nice.
---
v14: Exclude 32-bit L2 types. Re-base.
v13: New.

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -268,6 +268,32 @@ sh_validate_guest_entry(struct vcpu *v,
     return result;
 }
 
+typedef int (*hash_callback_t)(struct domain *d, mfn_t smfn, mfn_t other_mfn);
+
+#define HASH_CALLBACKS_CHECK(mask) \
+    BUILD_BUG_ON((mask) > (1U << ARRAY_SIZE(callbacks)) - 1)
+
+static int hash_foreach(struct domain *d,
+                        unsigned int callback_mask,
+                        const hash_callback_t callbacks[],
+                        mfn_t callback_mfn);
+
+/*
+ * Dispatch table for getting per-type functions: each level must
+ * be called with the function to remove a lower-level shadow.
+ */
+static const hash_callback_t remove_callbacks[SH_type_unused] = {
+#ifdef CONFIG_HVM
+    [SH_type_l2_32_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 2),
+    [SH_type_l2_pae_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 3),
+#endif
+    [SH_type_l2_64_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 4),
+#ifdef CONFIG_PV32
+    [SH_type_l2h_64_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 4),
+#endif
+    [SH_type_l3_64_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l2_shadow, 4),
+    [SH_type_l4_64_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l3_shadow, 4),
+};
 
 /**************************************************************************/
 /* Memory management for shadow pages. */
@@ -476,7 +502,35 @@ void shadow_blow_tables(struct domain *d
     if ( !d->vcpu[0] )
         return;
 
-    /* Pass one: unpin all pinned pages */
+    /* First pass: reduce page table depth */
+    if ( preempted )
+    {
+#define callbacks remove_callbacks
+        static const unsigned int masks[] = {
+            SHF_L2_ANY & ~(SHF_L2_32 | SHF_L2_PAE),
+            SHF_L3_ANY,
+#if CONFIG_PAGING_LEVELS > 4
+            SHF_L4_ANY,
+#endif
+        };
+
+        HASH_CALLBACKS_CHECK(SHF_page_type_mask & ~(SHF_L1_ANY | SHF_FL1_ANY));
+
+        for ( i = 0; i < ARRAY_SIZE(masks); ++i )
+        {
+            while ( hash_foreach(d, masks[i], callbacks, _mfn(0)) )
+            {
+                if ( general_preempt_check() )
+                {
+                    *preempted = true;
+                    return;
+                }
+            }
+        }
+#undef callbacks
+    }
+
+    /* Second pass: unpin all pinned pages */
     foreach_pinned_shadow(d, sp, t)
     {
         smfn = page_to_mfn(sp);
@@ -488,7 +542,7 @@ void shadow_blow_tables(struct domain *d
         }
     }
 
-    /* Second pass: unhook entries of in-use shadows */
+    /* Third pass: unhook entries of in-use shadows */
     for_each_vcpu(d, v)
         for ( i = 0; i < ARRAY_SIZE(v->arch.paging.shadow.shadow_table); i++ )
             if ( !pagetable_is_null(v->arch.paging.shadow.shadow_table[i]) )
@@ -1151,15 +1205,10 @@ bool shadow_hash_delete(struct domain *d
     return true;
 }
 
-typedef int (*hash_callback_t)(struct domain *d, mfn_t smfn, mfn_t other_mfn);
-
-#define HASH_CALLBACKS_CHECK(mask) \
-    BUILD_BUG_ON((mask) > (1U << ARRAY_SIZE(callbacks)) - 1)
-
-static void hash_foreach(struct domain *d,
-                         unsigned int callback_mask,
-                         const hash_callback_t callbacks[],
-                         mfn_t callback_mfn)
+static int hash_foreach(struct domain *d,
+                        unsigned int callback_mask,
+                        const hash_callback_t callbacks[],
+                        mfn_t callback_mfn)
 /* Walk the hash table looking at the types of the entries and
  * calling the appropriate callback function for each entry.
  * The mask determines which shadow types we call back for, and the array
@@ -1176,7 +1225,7 @@ static void hash_foreach(struct domain *
 
     /* Can be called via p2m code &c after shadow teardown. */
     if ( unlikely(!d->arch.paging.shadow.hash_table) )
-        return;
+        return 0;
 
     /* Say we're here, to stop hash-lookups reordering the chains */
     ASSERT(d->arch.paging.shadow.hash_walking == 0);
@@ -1201,6 +1250,8 @@ static void hash_foreach(struct domain *
         if ( done ) break;
     }
     d->arch.paging.shadow.hash_walking = 0;
+
+    return done;
 }
 
 
@@ -1640,21 +1691,6 @@ void sh_remove_shadows(struct domain *d,
     mfn_t smfn;
     unsigned char t;
 
-    /* Dispatch table for getting per-type functions: each level must
-     * be called with the function to remove a lower-level shadow. */
-    static const hash_callback_t callbacks[SH_type_unused] = {
-#ifdef CONFIG_HVM
-        [SH_type_l2_32_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 2),
-        [SH_type_l2_pae_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 3),
-#endif
-        [SH_type_l2_64_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 4),
-#ifdef CONFIG_PV32
-        [SH_type_l2h_64_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 4),
-#endif
-        [SH_type_l3_64_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l2_shadow, 4),
-        [SH_type_l4_64_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l3_shadow, 4),
-    };
-
     /* Another lookup table, for choosing which mask to use */
     static const unsigned int masks[SH_type_unused] = {
 #ifdef CONFIG_HVM
@@ -1689,6 +1725,8 @@ void sh_remove_shadows(struct domain *d,
     /* Search for this shadow in all appropriate shadows */
     perfc_incr(shadow_unshadow);
 
+#define callbacks remove_callbacks
+
     /*
      * Lower-level shadows need to be excised from upper-level shadows. This
      * call to hash_foreach() looks dangerous but is in fact OK: each call
@@ -1736,6 +1774,7 @@ void sh_remove_shadows(struct domain *d,
     DO_UNSHADOW(SH_type_l1_64_shadow);
 
 #undef DO_UNSHADOW
+#undef callbacks
 
     /* If that didn't catch the shadows, something is wrong */
     if ( !fast && all && (pg->count_info & PGC_shadowed_pt) )
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -3644,10 +3644,12 @@ int cf_check sh_remove_l1_shadow(struct
 
     FOREACH_PRESENT_L2E(sl2mfn, sl2e, NULL, done, d,
     {
-        if ( mfn_eq(shadow_l2e_get_mfn(*sl2e), sl1mfn) )
+        mfn_t mfn = shadow_l2e_get_mfn(*sl2e);
+
+        if ( !mfn_x(sl1mfn) || mfn_eq(mfn, sl1mfn) )
         {
             shadow_set_l2e(d, sl2e, shadow_l2e_empty(), sl2mfn);
-            if ( mfn_to_page(sl1mfn)->u.sh.type == 0 )
+            if ( !mfn_to_page(mfn)->u.sh.type )
                 /* This breaks us cleanly out of the FOREACH macro */
                 done = 1;
         }
@@ -3664,10 +3666,12 @@ int cf_check sh_remove_l2_shadow(struct
 
     FOREACH_PRESENT_L3E(sl3mfn, sl3e, NULL, done,
     {
-        if ( mfn_eq(shadow_l3e_get_mfn(*sl3e), sl2mfn) )
+        mfn_t mfn = shadow_l3e_get_mfn(*sl3e);
+
+        if ( !mfn_x(sl2mfn) || mfn_eq(mfn, sl2mfn) )
         {
             shadow_set_l3e(d, sl3e, shadow_l3e_empty(), sl3mfn);
-            if ( mfn_to_page(sl2mfn)->u.sh.type == 0 )
+            if ( !mfn_to_page(mfn)->u.sh.type )
                 /* This breaks us cleanly out of the FOREACH macro */
                 done = 1;
         }
@@ -3683,10 +3687,12 @@ int cf_check sh_remove_l3_shadow(struct
 
     FOREACH_PRESENT_L4E(sl4mfn, sl4e, NULL, done, d,
     {
-        if ( mfn_eq(shadow_l4e_get_mfn(*sl4e), sl3mfn) )
+        mfn_t mfn = shadow_l4e_get_mfn(*sl4e);
+
+        if ( !mfn_x(sl3mfn) || mfn_eq(mfn, sl3mfn) )
         {
             shadow_set_l4e(d, sl4e, shadow_l4e_empty(), sl4mfn);
-            if ( mfn_to_page(sl3mfn)->u.sh.type == 0 )
+            if ( !mfn_to_page(mfn)->u.sh.type )
                 /* This breaks us cleanly out of the FOREACH macro */
                 done = 1;
         }
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -282,6 +282,9 @@ static inline void sh_terminate_list(str
 
 #define SHF_L1_ANY  (SHF_L1_32|SHF_L1_PAE|SHF_L1_64)
 #define SHF_FL1_ANY (SHF_FL1_32|SHF_FL1_PAE|SHF_FL1_64)
+#define SHF_L2_ANY  (SHF_L2_32|SHF_L2_PAE|SHF_L2H_64|SHF_L2_64)
+#define SHF_L3_ANY  SHF_L3_64
+#define SHF_L4_ANY  SHF_L4_64
 
 #if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
 /* Marks a guest L1 page table which is shadowed but not write-protected.


