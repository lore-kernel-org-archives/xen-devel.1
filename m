Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA92C53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 13:53:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374286.1621325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woiF5-0000cb-95; Tue, 28 Jul 2026 13:53:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374286.1621325; Tue, 28 Jul 2026 13:53:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woiF5-0000cU-5b; Tue, 28 Jul 2026 13:53:11 +0000
Received: by outflank-mailman (input) for mailman id 1374286;
 Tue, 28 Jul 2026 13:53:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woiF3-0000c9-55
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:53:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woiF2-007Hx9-Hd
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:53:08 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68b42c-e002-0a2a0a5209dd-0a2a4507ca76-44
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:53:08 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68b444-b4ea-0a2a45070019-d1558031e50c-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:53:08 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4957eefd361so28699575e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:53:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496c44af22dsm72996535e9.1.2026.07.28.06.53.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 06:53:07 -0700 (PDT)
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
        d=suse.com; s=google; t=1785246788; x=1785851588; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7d/y3edQde9sNrzZI5Z21bvZ8131PvVZbw6OvYDGVRE=;
        b=cDshc/xJSTuTNxVGEDcXM4biXCyaLPgU/Miq20ufvXLtc5bOedHP0Dte1BOxKiufkk
         +fWo05ySE9+A2X3QGi7J/XREl0qQifvN2HyVnzhVyXc3zoMmDk1KQ+poqtleDzwcn/Rz
         ISuToUvDZxoRolRIOKJguxdQ/JykDVmdwEgdAobjUB6rHxfyURP2uGkAXRrJZIDdsG/j
         V/a7egxxEjMVAbazFYIKTxQcc9TFOAvHhMbDqNEpX+cjLkxwfw0rrxGC+wNwJNP+g0En
         PSWrPPVklGl/et+6vIlOta+5wsSJPA66YmLfLNUX1zrE3NgiXq9brrx3SQgH/nyTtZfl
         u3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785246788; x=1785851588;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7d/y3edQde9sNrzZI5Z21bvZ8131PvVZbw6OvYDGVRE=;
        b=XvpIM/EI9kWN7pOBUjef9h51kL/Vy2rrXfQ66IpvpJlRS5xcBUToZ1MLcdjutJyynN
         bOJYCRKs1TuSVpAaGA0L0sIPf203N+UhtvggAv+3DAqghByEh1f2yqIoB9ZLVrHtv4ck
         PK0dK6DMgsf21QuF9Pk5X6hrmReu4djH3ph5TMqwA1eHIwC6bfmCsUqVtgKjNt4luKUO
         35KslNTqbUb7veOT4L2Au9Wh8OYZoX57MLKj2x4PZxP6k38LGVX/Q63dJja96fObAuff
         osLC/hias6EfL2Jaua4/1+XWMOqYKYcBk3Pn8vQO30pCERoXJ10BTVk+hrMh4UgGAVJ3
         3W6w==
X-Gm-Message-State: AOJu0YxLNfKZmCz1fGNMXHE0jVVQmitv5rGsI8MwXXFbetBIb44c6XCa
	Tu9rNDxbVgrpj55XVFiAnxs841CxioEfNkDp8+z97xvR8/x5hYJ9qidZajEtr9yt0araq8fwr2K
	uJFnUBQ==
X-Gm-Gg: AR+sD1098aK5qdSEFjvOViJ+MdquQ9Jmqg+duk0fen38oucdUuA23IK5BLMmCq/9Yvj
	YsT5M8SSjYOWEuLKDSEvN41wdFmZXvPW9PJ+wtjfz5JDPAdtpdkPbEEDYeNo0A4reSxEgMHpDvu
	j9cSf7Z6ryFpHBnOVJkgg7qILynGdMow1gqiG4Wx7Ho//K00/K9FMOLKRUKH2ht6Wm8ZXwXroXX
	C+NcN4gP4F4/wfduVi/Z2pbIuBDoh96Ysik4H+e5/O7vDC4s+qxdxww8WZEYp2gbkrx2Y4VBhUB
	ZIgvYmj3qAsqpjhPxsBaxMEtB7nctJdxWrtssPnEBlgmMwTnjsktBZSh4CS/Y1iI+vpMI2t3IrS
	j3carly9v1Mn+Z45lPRmcz9d8tu1HwlZCwcQ1/i8eWM4XcHr21tZEBm4o1N8WVqw+gH11DTJqQj
	z5EhCGxuYEROw73lVum+tbfF6QqI9m09hX9k4Tusbm8gdMDz053YoJRwtpuedlcNqAYg==
X-Received: by 2002:a05:600c:3b1e:b0:493:bd2a:93bb with SMTP id 5b1f17b1804b1-496c653d055mr27394725e9.3.1785246787872;
        Tue, 28 Jul 2026 06:53:07 -0700 (PDT)
Message-ID: <436c0688-8b9a-4e56-9d4c-c81dcfbea56e@suse.com>
Date: Tue, 28 Jul 2026 15:53:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 7/7] gnttab: unreachable code when GNTTAB_MAX_VERSION < 2
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <38850629-8bfa-4737-99ff-0fd3f489e56e@suse.com>
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
In-Reply-To: <38850629-8bfa-4737-99ff-0fd3f489e56e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1785246788-A5AC0AE4-4BE619D7/0/0
X-purgate-type: clean
X-purgate-size: 17849

I'm surprised Eclair doesn't spot the large chunks of unreachable code on
Arm, i.e. violations of Misra C:2012 rule 2.1.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This pretty certainly isn't dealing with everything. For example, with
another helper the gt_version field could likely also become conditional.
With some more effort the nr_status_frames field similarly could become
conditional.

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -72,8 +72,10 @@ struct grant_table {
     /* Number of grant status frames shared with guest (for version 2) */
     unsigned int          nr_status_frames;
 
+#if GNTTAB_MAX_VERSION >= 2
     /* Number of version 2 operations in progress. */
     atomic_t              nr_v2_ops;
+#endif /* GNTTAB_MAX_VERSION >= 2 */
 
     /*
      * Number of available maptrack entries.  For cleanup purposes it is
@@ -182,12 +184,10 @@ static int cf_check parse_gnttab_max_map
                               opt_max_maptrack_frames_val);
 }
 
-#ifndef GNTTAB_MAX_VERSION
-#define GNTTAB_MAX_VERSION 2
-#endif
-
+#if GNTTAB_MAX_VERSION >= 2
 unsigned int __read_mostly opt_gnttab_max_version = GNTTAB_MAX_VERSION;
 static bool __read_mostly opt_transitive_grants = true;
+#endif
 #ifdef CONFIG_PV
 static bool __ro_after_init opt_grant_transfer = true;
 #else
@@ -196,17 +196,24 @@ static bool __ro_after_init opt_grant_tr
 
 static int __init cf_check parse_gnttab(const char *s)
 {
-    const char *ss, *e;
-    int val, rc = 0;
+    const char *ss;
+    int rc = 0;
 
     do {
+        int val;
+
         ss = strchr(s, ',');
         if ( !ss )
             ss = strchr(s, '\0');
 
-        if ( !strncmp(s, "max-ver:", 8) ||
-             !strncmp(s, "max_ver:", 8) ) /* Alias for original XSA-226 patch */
+        if ( false )
+            (void)val; /* Nothing. */
+#ifndef opt_gnttab_max_version
+        else if ( !strncmp(s, "max-ver:", 8) ||
+                  /* Alias for original XSA-226 patch */
+                  !strncmp(s, "max_ver:", 8) )
         {
+            const char *e;
             long ver = simple_strtol(s + 8, &e, 10);
 
             if ( e == ss && ver >= 1 && ver <= 2 )
@@ -216,6 +223,7 @@ static int __init cf_check parse_gnttab(
         }
         else if ( (val = parse_boolean("transitive", s, ss)) >= 0 )
             opt_transitive_grants = val;
+#endif
 #ifndef opt_grant_transfer
         else if ( (val = parse_boolean("transfer", s, ss)) >= 0 )
             opt_grant_transfer = val;
@@ -330,10 +338,12 @@ shared_entry_header(struct grant_table *
         block_speculation();
         return (grant_entry_header_t*)&shared_entry_v1(t, ref);
 
+#if GNTTAB_MAX_VERSION >= 2
     case 2:
         /* Returned values should be independent of speculative execution */
         block_speculation();
         return &shared_entry_v2(t, ref).hdr;
+#endif
     }
 
     ASSERT_UNREACHABLE();
@@ -378,6 +388,9 @@ struct active_grant_entry {
 })
 
     domid_t       domid;  /* Domain being granted access.             */
+
+#if GNTTAB_MAX_VERSION >= 2
+
     domid_t       src_domid; /* Original domain granting access.      */
     unsigned int  start:15; /* For sub-page grants, the start offset
                                in the page.                           */
@@ -385,6 +398,9 @@ struct active_grant_entry {
     unsigned int  length:16; /* For sub-page grants, the length of the
                                 grant.                                */
     grant_ref_t   trans_gref;
+
+#endif /* GNTTAB_MAX_VERSION < 2 */
+
     mfn_t         mfn;    /* Machine frame being granted.             */
 #ifndef NDEBUG
     gfn_t         gfn;    /* Guest's idea of the frame being granted. */
@@ -405,6 +421,15 @@ static inline void act_set_gfn(struct ac
 #endif
 }
 
+static bool act_is_sub_page(const struct active_grant_entry *act)
+{
+#if GNTTAB_MAX_VERSION >= 2
+    return act->is_sub_page;
+#else
+    return false;
+#endif
+}
+
 static DEFINE_PERCPU_RWLOCK_GLOBAL(grant_rwlock);
 
 static always_inline void grant_read_lock(struct grant_table *gt)
@@ -724,6 +749,7 @@ static unsigned int nr_grant_entries(str
         block_speculation();
         return f2e(nr_grant_frames(gt), 1);
 
+#if GNTTAB_MAX_VERSION >= 2
     case 2:
         BUILD_BUG_ON(f2e(INITIAL_NR_GRANT_FRAMES, 2) <
                      GNTTAB_NR_RESERVED_ENTRIES);
@@ -731,6 +757,7 @@ static unsigned int nr_grant_entries(str
         /* Make sure we return a value independently of speculative execution */
         block_speculation();
         return f2e(nr_grant_frames(gt), 2);
+#endif /* GNTTAB_MAX_VERSION >= 2 */
 #undef f2e
     }
 
@@ -919,7 +946,7 @@ static int _set_status(const grant_entry
                        domid_t ldomid)
 {
 
-    if ( evaluate_nospec(rgt_version == 1) )
+    if ( GNTTAB_MAX_VERSION < 2 || evaluate_nospec(rgt_version == 1) )
         return _set_status_v1(shah, rd, act, readonly, mapflag, ldomid);
     else
         return _set_status_v2(shah, status, rd, act, readonly, mapflag, ldomid);
@@ -1089,17 +1116,18 @@ map_grant_ref(
     if ( act->pin &&
          ((act->domid != ld->domain_id) ||
           (act->pin & GNTPIN_incr2oflow_mask(pin_incr)) ||
-          (act->is_sub_page)) )
+          act_is_sub_page(act)) )
     {
         gdprintk(XENLOG_WARNING,
                  "Bad domain (%d != %d), or risk of counter overflow %08x, or subpage %d\n",
-                 act->domid, ld->domain_id, act->pin, act->is_sub_page);
+                 act->domid, ld->domain_id, act->pin, act_is_sub_page(act));
         rc = GNTST_general_error;
         goto act_release_out;
     }
 
     /* Make sure we do not access memory speculatively */
-    status = evaluate_nospec(rgt->gt_version == 1) ? &shah->flags
+    status = GNTTAB_MAX_VERSION < 2 ||
+             evaluate_nospec(rgt->gt_version == 1) ? &shah->flags
                                                    : &status_entry(rgt, ref);
 
     if ( !act->pin ||
@@ -1113,9 +1141,10 @@ map_grant_ref(
 
         if ( !act->pin )
         {
-            unsigned long gfn = evaluate_nospec(rgt->gt_version == 1) ?
-                                shared_entry_v1(rgt, ref).frame :
-                                shared_entry_v2(rgt, ref).full_page.frame;
+            unsigned long gfn = GNTTAB_MAX_VERSION < 2 ||
+                                evaluate_nospec(rgt->gt_version == 1)
+                                ? shared_entry_v1(rgt, ref).frame
+                                : shared_entry_v2(rgt, ref).full_page.frame;
 
             rc = get_paged_frame(gfn, &mfn, &pg,
                                  op->flags & GNTMAP_readonly, rd);
@@ -1124,11 +1153,13 @@ map_grant_ref(
             act_set_gfn(act, _gfn(gfn));
             act->domid = ld->domain_id;
             act->mfn = mfn;
+#if GNTTAB_MAX_VERSION >= 2
             act->start = 0;
             act->length = PAGE_SIZE;
             act->is_sub_page = false;
             act->src_domid = rd->domain_id;
             act->trans_gref = ref;
+#endif /* GNTTAB_MAX_VERSION >= 2 */
         }
     }
 
@@ -1350,7 +1381,8 @@ map_grant_ref(
 
     grant_read_lock(rgt);
 
-    if ( unlikely(evaluate_nospec((rgt->gt_version == 1) !=
+    if ( GNTTAB_MAX_VERSION >= 2 &&
+         unlikely(evaluate_nospec((rgt->gt_version == 1) !=
                                   (status == &shah->flags))) )
     {
         /*
@@ -1625,7 +1657,7 @@ unmap_common_complete(struct gnttab_unma
 
     act = active_entry_acquire(rgt, op->ref);
 
-    if ( evaluate_nospec(rgt->gt_version == 1) )
+    if ( GNTTAB_MAX_VERSION < 2 || evaluate_nospec(rgt->gt_version == 1) )
         status = &shared_entry_v1(rgt, op->ref).flags;
     else if ( evaluate_nospec(op->ref < nr_grant_entries(rgt)) )
         status = &status_entry(rgt, op->ref);
@@ -1947,7 +1979,7 @@ gnttab_grow_table(struct domain *d, unsi
     }
 
     /* Status pages - version 2 */
-    if ( evaluate_nospec(gt->gt_version > 1) )
+    if ( GNTTAB_MAX_VERSION >= 2 && evaluate_nospec(gt->gt_version > 1) )
     {
         if ( gnttab_populate_status_frames(d, gt, req_nr_frames) )
             goto shared_alloc_failed;
@@ -2122,7 +2154,7 @@ gnttab_setup_table(
     }
 
     if ( (op.nr_frames > nr_grant_frames(gt) ||
-          ((gt->gt_version > 1) &&
+          ((GNTTAB_MAX_VERSION >= 2) && (gt->gt_version > 1) &&
            (grant_to_status_frames(op.nr_frames) > nr_status_frames(gt)))) &&
          gnttab_grow_table(d, op.nr_frames) )
     {
@@ -2472,7 +2504,8 @@ gnttab_transfer(
         grant_read_lock(e->grant_table);
         act = active_entry_acquire(e->grant_table, gop.ref);
 
-        if ( unlikely(evaluate_nospec(e->grant_table->gt_version != ver)) )
+        if ( GNTTAB_MAX_VERSION >= 2 &&
+             unlikely(evaluate_nospec(e->grant_table->gt_version != ver)) )
         {
             rc = -EILSEQ;
             goto release;
@@ -2538,12 +2571,13 @@ release_grant_for_copy(
     act = active_entry_acquire(rgt, gref);
     mfn = act->mfn;
 
-    if ( evaluate_nospec(rgt->gt_version == 1) )
+    if ( GNTTAB_MAX_VERSION < 2 || evaluate_nospec(rgt->gt_version == 1) )
     {
         status = &shared_entry_v1(rgt, gref).flags;
         td = rd;
         trans_gref = gref;
     }
+#if GNTTAB_MAX_VERSION >= 2
     else
     {
         if ( evaluate_nospec(gref < nr_grant_entries(rgt)) )
@@ -2552,6 +2586,7 @@ release_grant_for_copy(
              ? rd : knownalive_domain_from_domid(act->src_domid);
         trans_gref = act->trans_gref;
     }
+#endif /* GNTTAB_MAX_VERSION >= 2 */
 
     if ( readonly )
     {
@@ -2566,13 +2601,15 @@ release_grant_for_copy(
 
     reduce_status_for_pin(rd, act, status, readonly);
 
+#if GNTTAB_MAX_VERSION >= 2
     if ( !act->pin && act->is_sub_page )
         atomic_dec(&rgt->nr_v2_ops);
+#endif
 
     active_entry_release(act);
     grant_read_unlock(rgt);
 
-    if ( td != rd )
+    if ( GNTTAB_MAX_VERSION >= 2 && td != rd )
     {
         /*
          * Recursive call, but it is bounded (acquire permits only a single
@@ -2593,8 +2630,11 @@ release_grant_for_copy(
 static int
 acquire_grant_for_copy(
     struct domain *rd, grant_ref_t gref, domid_t ldom, bool readonly,
-    mfn_t *mfn, struct page_info **page, uint16_t *page_off,
-    uint16_t *length, bool allow_transitive)
+    mfn_t *mfn, struct page_info **page
+#if GNTTAB_MAX_VERSION >= 2
+    , uint16_t *page_off, uint16_t *length, bool allow_transitive
+#endif
+    )
 {
     struct grant_table *rgt = rd->grant_table;
     grant_entry_v2_t *sha2;
@@ -2637,7 +2677,7 @@ acquire_grant_for_copy(
         goto unlock_out;
     }
 
-    if ( evaluate_nospec(rgt->gt_version == 1) )
+    if ( GNTTAB_MAX_VERSION < 2 || evaluate_nospec(rgt->gt_version == 1) )
     {
         sha2 = NULL;
         status = &shah->flags;
@@ -2652,6 +2692,7 @@ acquire_grant_for_copy(
     barrier();
 
     old_pin = act->pin;
+#if GNTTAB_MAX_VERSION >= 2
     if ( sha2 && (shflags & GTF_type_mask) == GTF_transitive )
     {
         domid_t trans_domid;
@@ -2786,8 +2827,10 @@ acquire_grant_for_copy(
         else
             atomic_dec(&rgt->nr_v2_ops);
     }
-    else if ( !old_pin ||
-              (!readonly && !(old_pin & (GNTPIN_devw_mask|GNTPIN_hstw_mask))) )
+    else
+#endif /* GNTTAB_MAX_VERSION >= 2 */
+    if ( !old_pin ||
+         (!readonly && !(old_pin & (GNTPIN_devw_mask|GNTPIN_hstw_mask))) )
     {
         unsigned long gfn;
 
@@ -2828,23 +2871,29 @@ acquire_grant_for_copy(
         if ( !act->pin )
         {
             act->domid = ldom;
+            act->mfn = grant_mfn;
+
+#if GNTTAB_MAX_VERSION >= 2
             act->is_sub_page = is_sub_page;
             act->start = trans_page_off;
             act->length = trans_length;
             act->src_domid = rd->domain_id;
             act->trans_gref = gref;
-            act->mfn = grant_mfn;
 
             if ( is_sub_page )
                 atomic_inc(&rgt->nr_v2_ops);
+#endif /* GNTTAB_MAX_VERSION >= 2 */
         }
         else if ( !mfn_eq(act->mfn, grant_mfn) ||
+#if GNTTAB_MAX_VERSION >= 2
                   act->src_domid != rd->domain_id ||
                   act->trans_gref != gref ||
                   (act->is_sub_page &&
                    (!is_sub_page ||
                     act->start != trans_page_off ||
-                    act->length != trans_length)) )
+                    act->length != trans_length)) ||
+#endif /* GNTTAB_MAX_VERSION >= 2 */
+                  false )
         {
             put_page(*page);
             *page = NULL;
@@ -2881,8 +2930,10 @@ acquire_grant_for_copy(
 
     act->pin += pin_incr;
 
+#if GNTTAB_MAX_VERSION >= 2
     *page_off = act->start;
     *length = act->length;
+#endif
     *mfn = act->mfn;
 
     active_entry_release(act);
@@ -3014,13 +3065,20 @@ static int gnttab_copy_claim_buf(const s
         rc = acquire_grant_for_copy(buf->domain, ptr->u.ref,
                                     current->domain->domain_id,
                                     buf->read_only,
-                                    &buf->mfn, &buf->page,
-                                    &buf->ptr.offset, &buf->len,
-                                    opt_transitive_grants);
+                                    &buf->mfn, &buf->page
+#if GNTTAB_MAX_VERSION >= 2
+                                    , &buf->ptr.offset, &buf->len,
+                                    opt_transitive_grants
+#endif
+                                    );
         if ( rc != GNTST_okay )
             goto out;
         buf->ptr.u.ref = ptr->u.ref;
         buf->have_grant = 1;
+#if GNTTAB_MAX_VERSION < 2
+        buf->ptr.offset = 0;
+        buf->len = PAGE_SIZE;
+#endif
     }
     else
     {
@@ -3241,6 +3299,12 @@ gnttab_set_version(XEN_GUEST_HANDLE_PARA
     if ( gt->gt_version == op.version )
         goto out_unlock;
 
+    if ( GNTTAB_MAX_VERSION < 2 )
+    {
+        res = -EOPNOTSUPP;
+        goto out_unlock;
+    }
+
     /*
      * Make sure that the grant table isn't currently in use when we
      * change the version number, except for the first 8 entries which
@@ -3270,6 +3334,7 @@ gnttab_set_version(XEN_GUEST_HANDLE_PARA
         break;
 
     case 2:
+#if GNTTAB_MAX_VERSION >= 2
         if ( atomic_read(&gt->nr_v2_ops) )
         {
             gdprintk(XENLOG_WARNING,
@@ -3278,6 +3343,7 @@ gnttab_set_version(XEN_GUEST_HANDLE_PARA
             res = -EAGAIN;
             goto out_unlock;
         }
+#endif /* GNTTAB_MAX_VERSION >= 2 */
 
         for ( i = 0; i < GNTTAB_NR_RESERVED_ENTRIES; i++ )
         {
@@ -3527,7 +3593,7 @@ swap_grant_ref(grant_ref_t ref_a, grant_
         goto out;
     }
 
-    if ( evaluate_nospec(gt->gt_version == 1) )
+    if ( GNTTAB_MAX_VERSION < 2 || evaluate_nospec(gt->gt_version == 1) )
     {
         grant_entry_v1_t shared;
 
@@ -3945,7 +4011,7 @@ int gnttab_release_mappings(struct domai
 
         act = active_entry_acquire(rgt, ref);
         sha = shared_entry_header(rgt, ref);
-        if ( rgt->gt_version == 1 )
+        if ( GNTTAB_MAX_VERSION < 2 || rgt->gt_version == 1 )
             status = &sha->flags;
         else
             status = &status_entry(rgt, ref);
@@ -4120,7 +4186,7 @@ int mem_sharing_gref_to_gfn(struct grant
         rc = -EINVAL;
     else if ( ref >= nr_grant_entries(gt) )
         rc = -ENOENT;
-    else if ( evaluate_nospec(gt->gt_version == 1) )
+    else if ( GNTTAB_MAX_VERSION < 2 || evaluate_nospec(gt->gt_version == 1) )
     {
         const grant_entry_v1_t *sha1 = &shared_entry_v1(gt, ref);
 
@@ -4144,7 +4210,7 @@ int mem_sharing_gref_to_gfn(struct grant
         rc = -ENXIO;
     else if ( !rc && status )
     {
-        if ( evaluate_nospec(gt->gt_version == 1) )
+        if ( GNTTAB_MAX_VERSION < 2 || evaluate_nospec(gt->gt_version == 1) )
             *status = flags;
         else
             *status = status_entry(gt, ref);
@@ -4275,7 +4341,7 @@ int gnttab_acquire_resource(
         break;
 
     case XENMEM_resource_grant_table_id_status:
-        if ( gt->gt_version != 2 )
+        if ( GNTTAB_MAX_VERSION < 2 || gt->gt_version != 2 )
             break;
 
         /* Check that void ** is a suitable representation for gt->status. */
@@ -4327,7 +4393,8 @@ int gnttab_map_frame_begin(
 
     grant_write_lock(gt);
 
-    if ( evaluate_nospec(gt->gt_version == 2) && (idx & XENMAPIDX_grant_table_status) )
+    if ( GNTTAB_MAX_VERSION >= 2 && evaluate_nospec(gt->gt_version == 2) &&
+         (idx & XENMAPIDX_grant_table_status) )
     {
         idx &= ~XENMAPIDX_grant_table_status;
         rc = gnttab_get_status_frame_mfn(d, idx, mfn);
@@ -4395,7 +4462,7 @@ static void gnttab_usage_print(struct do
 
         sha = shared_entry_header(gt, ref);
 
-        if ( gt->gt_version == 1 )
+        if ( GNTTAB_MAX_VERSION < 2 || gt->gt_version == 1 )
         {
             status = sha->flags;
             frame = shared_entry_v1(gt, ref).frame;
--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -39,7 +39,16 @@ void gnttab_seed_entry(const struct doma
 
 #ifdef CONFIG_GRANT_TABLE
 
+#ifndef GNTTAB_MAX_VERSION
+#define GNTTAB_MAX_VERSION 2
+#endif
+
+#if GNTTAB_MAX_VERSION >= 2
 extern unsigned int opt_gnttab_max_version;
+#else
+# define opt_gnttab_max_version GNTTAB_MAX_VERSION
+#endif
+
 extern unsigned int opt_max_grant_frames;
 
 /* Create/destroy per-domain grant table context. */


