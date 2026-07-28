Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BC4C53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 14:23:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374405.1621567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woiiJ-0004Sy-7s; Tue, 28 Jul 2026 14:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374405.1621567; Tue, 28 Jul 2026 14:23:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woiiJ-0004Sr-4x; Tue, 28 Jul 2026 14:23:23 +0000
Received: by outflank-mailman (input) for mailman id 1374405;
 Tue, 28 Jul 2026 14:23:21 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woiiH-0004SU-Ih
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 14:23:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woiiG-007NWv-Vj
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 16:23:20 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68bb4c-e002-0a2a0a5209dd-0a2a4504d6e4-36
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 16:23:20 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68bb58-b57f-0a2a45040019-d155802eecfd-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 16:23:20 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4954dff6536so27607815e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 07:23:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957f9ae5c3sm429559225e9.3.2026.07.28.07.23.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 07:23:19 -0700 (PDT)
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
        d=suse.com; s=google; t=1785248600; x=1785853400; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w1o+lRjL5Bu7MJj4eoJSBjI4Yb8dSfa5/A/XYawdiOo=;
        b=JwW2JhE10m8PYeo+htnT6JIt8x135vxDxvQ4aMp0GfcK3iXsKGCEgILrgXO/GbEu8e
         13O3BJkuVtCUHHV4LyBKu2ClN0ixVOytNtSEmYj84rglo0wG6xqETEzeGJyYi/XvT176
         QmFlUh15r4WDKHpFxw2yu7t3BhUnMORtkWi2toKOpfkEYBkzYTdVkCZjGtd92yezaS7d
         4+zthzFi0WOL1m2XJR8y8VQtQ0ZwvwcyHP7RxEtxNZXF9Rzeam4XyJ5eCwudG0ZmryfN
         hSETK2mqIj04WN48XzFUEzb1aCdZ8ckTSyw7Pp/d+F7y7aXNCnihkuwYx1GGpvq2q5x0
         5f+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785248600; x=1785853400;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w1o+lRjL5Bu7MJj4eoJSBjI4Yb8dSfa5/A/XYawdiOo=;
        b=RJNOW2TTmW4Ba4FUrs7n7nLu3nwIMwltO9NuJxgAlw5yY/tQ11iZ3GUPvOHuVH7/93
         TO3/CyWB9gtx5FWk3Cq3gfZDwwBPrfyAX9VgQmDzWc2sNSpGqzisvlg4UNnwtI0D9zc2
         qlHohE3thWZ0SlfUCR3+TzcO6MBDoId4s4ym/tHQLJR19qxT1kwyl81zCjqPwhqLPwiU
         RBwC+9msoigi4gO/9VbmuFuTkDbxO6QkKS/8FQgkFyREJkOKg8NRHhXM/eXDHevg+wDM
         usXU42xu5XEgEshdJIIr4VN04S/jL1/pxEPb+O466PqaSyMmuU8CnwByjd4S5U/+HCux
         kuCg==
X-Gm-Message-State: AOJu0YyLn+t+eaf1GCFysH+m3q4hD1QiTNOIgWJGpoCXq9BbNMJD+fqa
	qHf9eYu9rvQH7s+Tnj2mwWmtgGRTypXTjrHlaqw1BMcuzXNzrW+Uy/CYQO7y5VRVmqK3sbCjSS+
	Nf99Tqw==
X-Gm-Gg: AR+sD12Gile6slctf56hUyW7xY2xlD6tHDf74ntgvluKxq9nIk1QJQz6eYAj+y1l5fh
	LLfdB97NidASbOpr0Y0EPiY3DvN/5JeuNnxaNl65NjnjRy4UwaUqT4nMZzW6wFn1owr6D1bm9+f
	9TKqBQrFuPwzdKyrd66C8xbpP8cNJHLkvFGBh93eeChM+G01lcgAre+z+GyWLHv1mJO2w3KCMJJ
	vDQ8BQCEfSaofpFeM99CMV2najkhaSrBismv9HqnWLj7aSQMq/wlOVaz9y+Im5YoapzcJ7aQUrQ
	5u/aLK4txDwTbLtYi6bVp4o2jinigTcdKnKcGMfBFHXCpJA4edvNy3oXEBZ0sSveCJa/EJHyk9T
	sbGO+xAbQXwXwTi20OM9+hV76OLlRKdWN1NO2x2ak4xW1W+uA9vLhc+42Q/FHk4nTforg0cxEfi
	y5khLg5OMr3R6rFu51LbIqV0rjvT5mrpg5w1h1DCwg+RbhWAqCheoO/IHi1tSg9j2mqLe1AAtMl
	k6c
X-Received: by 2002:a05:600c:1d1b:b0:493:bb0:3b43 with SMTP id 5b1f17b1804b1-496c6426bc8mr31339625e9.2.1785248600381;
        Tue, 28 Jul 2026 07:23:20 -0700 (PDT)
Message-ID: <0051a0fb-9ca7-4f90-960e-08e0898ea874@suse.com>
Date: Tue, 28 Jul 2026 16:23:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v15 08/10] x86/shadow: make log-dirty mode enable/disable
 properly preemptable
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
X-purgate-ID: tlsNG-ebf023/1785248600-C2AC8B50-467A7E34/0/0
X-purgate-type: clean
X-purgate-size: 6503

Their calls to shadow_set_allocation() are the last missing piece.

While it may seem a little odd, it actually turns out easier to deal
with the continuation a level up from where the need for it was first
recognized.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I think the point was raised before: It's questionable whether
shadow_one_bit_enable(), upon error, should bring the allocation back
down to zero. This is going to be especially bad for a domain which
previously had shadow enabled already (which could be HVM or L1TF-
affected PV). Even in shadow_one_bit_disable() it's not clear this is
the best possible behavior - the pool may have been set to something
larger than the default by the admin. For now I'm maintaining prior
behavior, but of course things would end up simpler if we could just get
rid of those set-to-zero operations (and then perhaps also on
shadow_enable()'s similar error path); the possible caveat there would
be that overall memory consumption may then appear to grow for people
monitoring a system.

Originally I was considering to further qualify the
d->arch.paging.preempt.drop_allocation checks by passing further down
the "resuming" flag, but for a well-behaved tool stack (which allows one
shadow-op to finish before starting another one) there shouldn't be a
difference. Thoughts?
---
v14: New.

--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -236,6 +236,7 @@ struct paging_domain {
     struct {
         const struct domain *dom;
         unsigned int op;
+        bool drop_allocation:1;
         union {
             struct {
                 unsigned long done:PADDR_BITS - PAGE_SHIFT;
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -215,9 +215,10 @@ static int paging_log_dirty_enable(struc
 
     paging_lock(d);
 
-    if ( d->arch.paging.preempt.dom &&
-         (d->arch.paging.preempt.dom != current->domain ||
-          d->arch.paging.preempt.op != op) )
+    if ( !d->arch.paging.preempt.dom )
+        d->arch.paging.preempt.drop_allocation = false;
+    else if ( d->arch.paging.preempt.dom != current->domain ||
+              d->arch.paging.preempt.op != op )
     {
         paging_unlock(d);
         if ( !resuming )
@@ -259,9 +260,10 @@ static int paging_log_dirty_disable(stru
 
     paging_lock(d);
 
-    if ( d->arch.paging.preempt.dom &&
-         (d->arch.paging.preempt.dom != current->domain ||
-          d->arch.paging.preempt.op != XEN_DOMCTL_SHADOW_OP_OFF) )
+    if ( !d->arch.paging.preempt.dom )
+        d->arch.paging.preempt.drop_allocation = false;
+    else if ( d->arch.paging.preempt.dom != current->domain ||
+              d->arch.paging.preempt.op != XEN_DOMCTL_SHADOW_OP_OFF )
     {
         paging_unlock(d);
         if ( !resuming )
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -2440,12 +2440,22 @@ static int shadow_one_bit_enable(struct
 
     if ( d->arch.paging.total_pages < sh_min_allocation(d) )
     {
+        bool preempted = false;
+
         /* Init the shadow memory allocation if the user hasn't done so */
-        if ( shadow_set_allocation(d, 1, NULL) != 0 )
+        if ( shadow_set_allocation(d, 1,
+                                   mode & PG_log_dirty ? &preempted
+                                                       : NULL) != 0 )
         {
-            shadow_set_allocation(d, 0, NULL);
-            return -ENOMEM;
+            shadow_set_allocation(d, 0,
+                                  mode & PG_log_dirty ? &preempted : NULL);
+            if ( !preempted )
+                return -ENOMEM;
+            d->arch.paging.preempt.drop_allocation = true;
         }
+
+        if ( preempted )
+            return -ERESTART;
     }
 
     /* Allow p2m and log-dirty code to borrow shadow memory */
@@ -2484,6 +2494,8 @@ static int shadow_one_bit_disable(struct
     sh_new_mode(d, mode);
     if ( d->arch.paging.mode == 0 )
     {
+        bool preempted = false;
+
         /* Get this domain off shadows */
         SHADOW_PRINTK("un-shadowing of domain %u starts."
                        "  Shadow pages total = %u, free = %u, p2m=%u\n",
@@ -2511,8 +2523,16 @@ static int shadow_one_bit_disable(struct
         }
 
         /* Pull down the memory allocation */
-        if ( shadow_set_allocation(d, 0, NULL) != 0 )
+        if ( shadow_set_allocation(d, 0,
+                                   mode & PG_log_dirty ? &preempted
+                                                       : NULL) != 0 )
             BUG(); /* In fact, we will have BUG()ed already */
+        if ( preempted )
+        {
+            d->arch.paging.preempt.drop_allocation = true;
+            return -ERESTART;
+        }
+
         shadow_hash_teardown(d);
         SHADOW_PRINTK("un-shadowing of domain %u done."
                        "  Shadow pages total = %u, free = %u, p2m=%u\n",
@@ -2558,14 +2578,20 @@ static int shadow_test_disable(struct do
  */
 static int cf_check sh_enable_log_dirty(struct domain *d)
 {
+    bool preempted = false;
     int ret;
 
     ASSERT(paging_locked_by_me(d));
 
-    if ( shadow_mode_enabled(d) )
+    if ( d->arch.paging.preempt.drop_allocation )
     {
-        bool preempted = false;
+        shadow_set_allocation(d, 0, &preempted);
 
+        return preempted ? -ERESTART : -ENOMEM;
+    }
+
+    if ( shadow_mode_enabled(d) )
+    {
         /*
          * This domain already has some shadows: need to clear them out
          * of the way to make sure that all references to guest memory are
@@ -2598,6 +2624,21 @@ static int cf_check sh_disable_log_dirty
 
     ASSERT(paging_locked_by_me(d));
 
+    if ( d->arch.paging.preempt.drop_allocation )
+    {
+        shadow_set_allocation(d, 0, &preempted);
+
+        if ( preempted )
+            return -ERESTART;
+
+        shadow_hash_teardown(d);
+        SHADOW_PRINTK("un-shadowing of domain %u done."
+                       "  Shadow pages total = %u, free = %u, p2m=%u\n",
+                       d->domain_id, d->arch.paging.total_pages,
+                       d->arch.paging.free_pages, d->arch.paging.p2m_pages);
+        return 0;
+    }
+
     /*
      * Limit the amount of work to do from sh_detach_old_tables() (called from
      * shadow_one_bit_disable() via sh_new_mode() -> sh_update_paging_modes()),


