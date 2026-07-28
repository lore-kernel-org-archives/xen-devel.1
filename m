Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2295C54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 14:23:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374396.1621558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woihx-0003xk-0D; Tue, 28 Jul 2026 14:23:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374396.1621558; Tue, 28 Jul 2026 14:23:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woihw-0003xa-TD; Tue, 28 Jul 2026 14:23:00 +0000
Received: by outflank-mailman (input) for mailman id 1374396;
 Tue, 28 Jul 2026 14:22:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woihv-0003vs-1N
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 14:22:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woihu-004xX0-E4
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 16:22:58 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68bb33-2eae-0a2a0a5409dd-0a2a4502ac72-34
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 16:22:58 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68bb42-6ca4-0a2a45020019-d1558036c5e5-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 16:22:58 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4954c0833b4so29224255e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 07:22:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496c45cb67esm86210395e9.8.2026.07.28.07.22.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 07:22:57 -0700 (PDT)
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
        d=suse.com; s=google; t=1785248578; x=1785853378; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g3jdcGX3ZHkyd51//1sqLgUrNqK78wVltQSxO9SrAuc=;
        b=Y9RlXmUOcWtX+GwCgMBsFEzimD6JRZTYK2LYylH3qwhfThBD//MjWLF5Ba0hZ3yKfa
         x6XJ8apVIATXZ6EswDohIYzTXZU/EOg6I2+QNxCvbokA9h9dpmR7vysJ7YpaE2k9FsJb
         0hxYc7gIdB5eUYAUNE3pEqVyT4sAFKv/yt4kXZht1QSud1C20LD2T8W6cGRGkyJF70rb
         macKyD9jlj8V37eyJXwUnoPB4ukmoRvN25yQB+fX3xNn1DUq2/7tTlg+4p+a2d+04LBC
         +dEwhiN6JgLWCJnLvMLFPrkBVrEkoMVTXPAOYMiNav3ZNqDCc6cyWAnAgCmanVXcwX1p
         OVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785248578; x=1785853378;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g3jdcGX3ZHkyd51//1sqLgUrNqK78wVltQSxO9SrAuc=;
        b=hjZ2e9pJa35shCImeyh517OQi4OVNWeglr4zBQlxv5o0B4RUvtRWC/ANLKMZPZOrF2
         vV28S7wCPKw375NJGTxdP1oVZlZWiu34p5/ckHVEuS/OVOfFrYN2mSBIdh4DnIgQSnIu
         CxTI5zUmgvF/YXV6TEtutif/FUYhKd9lCvjMVRbb+rk6NOJ1Z9WrBaKEfaZoyo2INZJH
         hx+ZBjG0cvJ2dwQgBUAGSmoheA9VT6cYF2p1kgKuhIbhy/kkmLkA09r6f02fK8JrgcuK
         VmU1ZTSCGQFonBN3Z5ad2NpT+WGFGUwgJgwQ1GRkM+NWojNVC8fPJnPy6rZGcq+QFLHr
         6fIw==
X-Gm-Message-State: AOJu0YwRmH4vOMipMzX7qEjh0vE/4SF6f9nGsKtp7PrcPJzS+dqzpUHD
	eU0bCtjmw8oTOMW8GZB1lpv0TlT5SbtcEJI13G/dAVavdcQiRn17YPhTVtGE0ddufzt7j9S6aS7
	l4nINPQ==
X-Gm-Gg: AR+sD13yBajch73kdiVRIQhcaFWCgSUNXLtU6hjeItOaM648ur7iBQ2BKsNvk94tYe6
	fuuj3VbtSg/wd3+vhUZOdWZ3m7RvRIDMncSfcnSrwhP7Psu+FWxdHLTqprXE95G718IxfU4T2P5
	D1nr/ZqiQjYVZQOLr630pSs4Las0Gw5YmoHsCHWc674r6DaGj2CSIZSHjDpeJ2dXNTsGxGXDZaC
	kjZ6iYQ9tWXwb2GtqETUYITsmSIbQJTX5vCFQAfR6j1XZ6WM5s3Zbq1cc5xaWlMFY38Xi+fK8ml
	V/ex10uqyaMwDp2YNABLuWOMfgoyjUI3Y5JB5xFrqRd+KtUM4e0bVMis3dEOx+iIAIqrdoazQk+
	ponDgblXH7KeujOy+wRHBqoNkOsLcDncPLPVBiK0V3Ep2SG8fbqtJyW3KbFFv4j0NAVz3qbQmvl
	7qrkCoG+ScrYrlXhCWtOVJcE9ndhBhwtCd+8ttjlemS38/98PWH0p8KHieRcdTGJ3bjw==
X-Received: by 2002:a05:600c:6095:b0:495:6022:5a14 with SMTP id 5b1f17b1804b1-496c65802a3mr28931925e9.34.1785248577796;
        Tue, 28 Jul 2026 07:22:57 -0700 (PDT)
Message-ID: <548d021a-7299-4ca4-afae-00fce1c1d549@suse.com>
Date: Tue, 28 Jul 2026 16:22:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v15 07/10] x86/shadow: fold _shadow_prealloc() with
 shadow_blow_tables()
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
X-purgate-ID: tlsNG-720697/1785248578-F0CA22AC-5F56EB08/0/0
X-purgate-type: clean
X-purgate-size: 10900

The two functions are pretty similar, and hence changes commonly need to
occur in both places. Fold the functions by introducing a new shared
helper, which then will be used from the three relevant places. Note
that this way preemptability can then be communicated down from
shadow_set_allocation() right away.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
To have the compiler eliminate the extra conditionals, should we make
sh_blow_tables() always-inline?
---
v14: New.

--- a/xen/arch/x86/include/asm/perfc_defn.h
+++ b/xen/arch/x86/include/asm/perfc_defn.h
@@ -49,7 +49,8 @@ PERFCOUNTER(shadow_alloc_tlbflush, "shad
 /* STATUS counters do not reset when 'P' is hit */
 PERFSTATUS(shadow_alloc_count,         "number of shadow pages in use")
 PERFCOUNTER(shadow_free,           "calls to shadow_free")
-PERFCOUNTER(shadow_prealloc_1,     "shadow recycles old shadows")
+PERFCOUNTER(shadow_prealloc_0,     "shadow recycles old shadows")
+PERFCOUNTER(shadow_prealloc_1,     "shadow recycles pinned shadows")
 PERFCOUNTER(shadow_prealloc_2,     "shadow recycles in-use shadows")
 PERFCOUNTER(shadow_linear_map_failed, "shadow hit read-only linear map")
 PERFCOUNTER(shadow_a_update,       "shadow A bit update")
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -370,79 +370,8 @@ static inline void trace_shadow_prealloc
     }
 }
 
-/* Make sure there are at least count order-sized pages
- * available in the shadow page pool. */
-static bool __must_check _shadow_prealloc(struct domain *d, unsigned int pages)
-{
-    struct vcpu *v;
-    struct page_info *sp, *t;
-    mfn_t smfn;
-    int i;
-
-    if ( d->arch.paging.free_pages >= pages )
-        return true;
-
-    if ( unlikely(d->is_dying) )
-        /* No reclaim when the domain is dying, teardown will take care of it. */
-        return false;
-
-    /* Nothing to reclaim when there are no vcpus yet. */
-    if ( !d->vcpu[0] )
-        return false;
-
-    /* Stage one: walk the list of pinned pages, unpinning them */
-    perfc_incr(shadow_prealloc_1);
-    foreach_pinned_shadow(d, sp, t)
-    {
-        smfn = page_to_mfn(sp);
-
-        /* Unpin this top-level shadow */
-        trace_shadow_prealloc_unpin(d, smfn);
-        sh_unpin(d, smfn);
-
-        /* See if that freed up enough space */
-        if ( d->arch.paging.free_pages >= pages )
-            return true;
-    }
-
-    /* Stage two: all shadow pages are in use in hierarchies that are
-     * loaded in cr3 on some vcpu.  Walk them, unhooking the non-Xen
-     * mappings. */
-    perfc_incr(shadow_prealloc_2);
-
-    for_each_vcpu(d, v)
-        for ( i = 0; i < ARRAY_SIZE(v->arch.paging.shadow.shadow_table); i++ )
-        {
-            if ( !pagetable_is_null(v->arch.paging.shadow.shadow_table[i]) )
-            {
-                TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_PREALLOC_UNHOOK);
-                shadow_unhook_mappings(
-                    d,
-                    pagetable_get_mfn(v->arch.paging.shadow.shadow_table[i]),
-                    0);
-
-                /* See if that freed up enough space */
-                if ( d->arch.paging.free_pages >= pages )
-                {
-                    guest_flush_tlb_mask(d, d->dirty_cpumask);
-                    return true;
-                }
-            }
-        }
-
-    /* Nothing more we can do: all remaining shadows are of pages that
-     * hold Xen mappings for some vcpu.  This can never happen. */
-    printk(XENLOG_ERR "Can't pre-allocate %u shadow pages!\n"
-           "  shadow pages total = %u, free = %u, p2m=%u\n",
-           pages, d->arch.paging.total_pages,
-           d->arch.paging.free_pages, d->arch.paging.p2m_pages);
-
-    ASSERT_UNREACHABLE();
-
-    guest_flush_tlb_mask(d, d->dirty_cpumask);
-
-    return false;
-}
+static bool sh_blow_tables(struct domain *d, unsigned int goal,
+                           bool *preempted);
 
 /* Make sure there are at least count pages of the order according to
  * type available in the shadow page pool.
@@ -466,7 +395,7 @@ bool shadow_prealloc(struct domain *d, u
          ((SHF_L1_ANY | SHF_FL1_ANY) & (1u << type)) )
         count += paging_logdirty_levels();
 
-    ret = _shadow_prealloc(d, count);
+    ret = sh_blow_tables(d, count, NULL);
     if ( !ret && (!d->is_shutting_down || d->shutdown_code != SHUTDOWN_crash) )
         /*
          * Failing to allocate memory required for shadow usage can only result in
@@ -477,9 +406,15 @@ bool shadow_prealloc(struct domain *d, u
     return ret;
 }
 
-/* Deliberately free all the memory we can: this will tear down all of
- * this domain's shadows */
-void shadow_blow_tables(struct domain *d, bool *preempted)
+/*
+ * When @goal is zero: Deliberately free all the memory we can: This will
+ * tear down all of this domain's shadows.
+ *
+ * When @goal is non-zero: Make sure there are at least as many pages
+ * available in the shadow page pool.
+ */
+static bool sh_blow_tables(struct domain *d, unsigned int goal,
+                           bool *preempted)
 {
     struct page_info *sp, *t;
     struct vcpu *v;
@@ -487,19 +422,25 @@ void shadow_blow_tables(struct domain *d
     int i;
     unsigned int done = 0;
 
+    if ( goal && d->arch.paging.free_pages >= goal )
+        return true;
+
     /*
      * When the domain is dying a call to shadow_blow_tables() will be
      * performed from the teardown path with preemption support, ignore any
      * other calls as we want to do the final teardown with preemption support.
      * Teardown of shadow related data can only be avoided when all domain
      * vCPUs are stopped.
+     *
+     * For the pre-allocation case, no reclaim when the domain is dying,
+     * teardown will take care of it.
      */
-    if ( unlikely(d->is_dying) && !preempted )
-        return;
+    if ( unlikely(d->is_dying) && (goal || !preempted) )
+        return false;
 
     /* Nothing to do when there are no vcpus yet. */
     if ( !d->vcpu[0] )
-        return;
+        return false;
 
     /* First pass: reduce page table depth */
     if ( preempted )
@@ -513,16 +454,23 @@ void shadow_blow_tables(struct domain *d
 #endif
         };
 
+        if ( goal )
+            perfc_incr(shadow_prealloc_0);
+
         HASH_CALLBACKS_CHECK(SHF_page_type_mask & ~(SHF_L1_ANY | SHF_FL1_ANY));
 
         for ( i = 0; i < ARRAY_SIZE(masks); ++i )
         {
             while ( hash_foreach(d, masks[i], callbacks, _mfn(0)) )
             {
+                /* See if that freed up enough space */
+                if ( goal && d->arch.paging.free_pages >= goal )
+                    return true;
+
                 if ( general_preempt_check() )
                 {
                     *preempted = true;
-                    return;
+                    return false;
                 }
             }
         }
@@ -530,18 +478,31 @@ void shadow_blow_tables(struct domain *d
     }
 
     /* Second pass: unpin all pinned pages */
+    if ( goal )
+        perfc_incr(shadow_prealloc_1);
     foreach_pinned_shadow(d, sp, t)
     {
         smfn = page_to_mfn(sp);
+
+        /* Unpin this top-level shadow */
+        if ( goal )
+            trace_shadow_prealloc_unpin(d, smfn);
         sh_unpin(d, smfn);
+
+        /* See if that freed up enough space */
+        if ( goal && d->arch.paging.free_pages >= goal )
+            return true;
+
         if ( preempted && !(++done & 0xff) && general_preempt_check() )
         {
             *preempted = true;
-            return;
+            return false;
         }
     }
 
     /* Third pass: unhook entries of in-use shadows */
+    if ( goal )
+        perfc_incr(shadow_prealloc_2);
     for_each_vcpu(d, v)
         for ( i = 0; i < ARRAY_SIZE(v->arch.paging.shadow.shadow_table); i++ )
             if ( !pagetable_is_null(v->arch.paging.shadow.shadow_table[i]) )
@@ -549,11 +510,20 @@ void shadow_blow_tables(struct domain *d
                 unsigned int num = d->arch.paging.total_pages -
                                    d->arch.paging.free_pages;
 
+                if ( goal )
+                    TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_PREALLOC_UNHOOK);
                 shadow_unhook_mappings(
                     d,
                     pagetable_get_mfn(v->arch.paging.shadow.shadow_table[i]),
                     0);
 
+                /* See if that freed up enough space */
+                if ( goal && d->arch.paging.free_pages >= goal )
+                {
+                    guest_flush_tlb_mask(d, d->dirty_cpumask);
+                    return true;
+                }
+
                 /*
                  * Make sure we are making progress before yielding: if domain
                  * is dying progress will be seen by total_pages decreasing, if
@@ -573,9 +543,32 @@ void shadow_blow_tables(struct domain *d
                 }
             }
 
+    if ( goal )
+    {
+        /*
+         * Nothing more we can do: All remaining shadows are of pages that
+         * hold Xen mappings for some vcpu.  This can never happen.
+         */
+        printk(XENLOG_ERR "Can't pre-allocate %u shadow pages!\n"
+               "  shadow pages total = %u, free = %u, p2m=%u\n",
+               goal, d->arch.paging.total_pages,
+               d->arch.paging.free_pages, d->arch.paging.p2m_pages);
+
+        ASSERT_UNREACHABLE();
+    }
+
  out:
     /* Make sure everyone sees the unshadowings */
     guest_flush_tlb_mask(d, d->dirty_cpumask);
+
+    return false;
+}
+
+/* Deliberately free all the memory we can: this will tear down all of
+ * this domain's shadows */
+void shadow_blow_tables(struct domain *d, bool *preempted)
+{
+    sh_blow_tables(d, 0, preempted);
 }
 
 void shadow_blow_tables_per_domain(struct domain *d)
@@ -910,8 +903,8 @@ int shadow_set_allocation(struct domain
         else if ( d->arch.paging.total_pages > pages )
         {
             /* Need to return memory to domheap */
-            if ( !_shadow_prealloc(d, 1) )
-                return -ENOMEM;
+            if ( !sh_blow_tables(d, 1, preempted) )
+                return preempted && *preempted ? 0 : -ENOMEM;
 
             sp = page_list_remove_head(&d->arch.paging.freelist);
             ASSERT(sp);
@@ -2320,7 +2313,7 @@ void shadow_teardown(struct domain *d, b
 
     /*
      * Reclaim all shadow memory so that shadow_set_allocation() doesn't find
-     * in-use pages, as _shadow_prealloc() will no longer try to reclaim pages
+     * in-use pages, as sh_blow_tables() will no longer try to reclaim pages
      * because the domain is dying.
      */
     paging_lock(d);


