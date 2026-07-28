Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E653C53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 14:25:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374421.1621585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woiji-0005Zt-Tk; Tue, 28 Jul 2026 14:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374421.1621585; Tue, 28 Jul 2026 14:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woiji-0005Zl-PW; Tue, 28 Jul 2026 14:24:50 +0000
Received: by outflank-mailman (input) for mailman id 1374421;
 Tue, 28 Jul 2026 14:24:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woijh-0005YJ-IM
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 14:24:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woijg-00Ee9J-VP
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 16:24:48 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68bb93-bab6-0a2a0a5309dd-0a2a4505ca28-42
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 16:24:48 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68bbb0-4cb1-0a2a45050019-d1558033ecff-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 16:24:48 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4954dff6536so27618075e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 07:24:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85b9a64dsm64542593f8f.1.2026.07.28.07.24.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 07:24:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1785248688; x=1785853488; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MDGxnQq9Xo0BHzcriwVqTJe+L979oWo8O6l6vHLNF/M=;
        b=APhgNz0mnimzYWh1zBtPx6kIMPnOSrOM7oyVI1PHBzBx2AO6eZmoOPb4dwbIkxggqs
         kji3ljPbWK4Wu4k7wyG2txzjTvyriGbfJJiGOnTwVlVunQRfzxlEIfiZzk6WXk6OdpQi
         kcBSvXMPW7W2BXqxeatcXxHKhdZcMzn50Q3gvWvDMajMjZKImiOOWwiBoAejtXKEC791
         SIc8Z7MFoc7s+vg1Xy3SgHmj0W5VcWYlqtDT4SFe9rwJ0XnUJmwDludWW4O8i37v1ORC
         PalkQQujxF/4XKXb4OfVzQrbEBantkACRIIE8G6rho2CFy2ihG2sqxpqGBYF7xdHaHN4
         t4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785248688; x=1785853488;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MDGxnQq9Xo0BHzcriwVqTJe+L979oWo8O6l6vHLNF/M=;
        b=Kn9soMkf58G8p9XuLkU0XBDS767nJP86xNZwOxp4irYxGPzgxg7vye7wlSaR9M0Skx
         GNEcckszghr3TUaXSv35QumJiEvggyAlffbcZRzi8xqyk7HGcoZAWzSLY3OaUkRPh4Ym
         JKPJ/YcIWvV/IXGcdWpXtkuWbtLDlC8pWglSwqIootwkwkqQQOHpRNYtZs/3FggYq2PZ
         DiHYfUrbJNF+8+s5cwOERYUkCeGkB6u6xnCp71EIwC2NYXZqjrnvv5OizATCPzkL8m1g
         q+rVe9u0M0azWmOnnch+b32Q5aCLSEKuRnxw5zVwokuACIb2g1PvgvYOIw5Hnsfz1Xl4
         vdTg==
X-Gm-Message-State: AOJu0YxByfv42nUqmZ0d/oW1zOUYCj04iIp+5tf4SwijdDrbeLGQPmEO
	rqFqH6WgXuUqYOTYy1/cfrnHlzt5DoFbdcmWnh1i0tFb6vvFzYIiPDo4VSIBS6wM6d5p+HT1D6C
	m6NoFOg==
X-Gm-Gg: AR+sD12FZXOheL5m1M/nwrG9LSAciN2NWUiO1jIHuHY9OvXtk8dymO2rYF3nmBZX04T
	CsXeWho5S2dqjaXXvXkhvQ5iWfZYTpAknT0AL8ZngI86d5U3fCM8ejK9X2RLtfeq9KiiSDfIRyt
	mIFoyEyuycR14UT5MgxFKz82EPQBW3/2oqgV/lXZL+heAQ+4t7j4aE8J11LMVSlxfH/c4s+i13u
	JPbwfWC67qyWe+5XZ7xqdfJLprSlhD+b9f7OGEgBdE2JcFObFjnhoToxUGuPFESYdoGNO68QNta
	YmVf7G13XaaTogpPPdyQmjdgeBCB82VIN2mdwXxufJlgeegVFWcqhd3Dj1voH7pekJrlFgkLjKs
	qrAK+qO1yMUSMCa/qVnTvIisGE1LjEgCD+WBiFrIPhic1DzzjbD3UVi3I+6d6n+S/fW/VFHXDTS
	pFIuU9sQ96jRJLbyq5Vq+hoYLpgMBFSopfr7k3AxdUlyUmf+IVyh7xdAQM39XOYXFEyQ==
X-Received: by 2002:a05:600c:3b14:b0:492:3e69:a86f with SMTP id 5b1f17b1804b1-496c6426375mr29663455e9.1.1785248688238;
        Tue, 28 Jul 2026 07:24:48 -0700 (PDT)
Message-ID: <c8e80bd0-cb7e-4885-82eb-6e747467da73@suse.com>
Date: Tue, 28 Jul 2026 16:24:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v15 10/10] x86/shadow: limit the number of pages which may be
 in use as shadows
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
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1785248688-F72B32A1-A6C2A9CF/0/0
X-purgate-type: clean
X-purgate-size: 8663

In order to bound the amount of work a single invocation of
shadow_unhook_mappings() may be doing all in one go, constrain the
number of pages which may be in use as shadows. To achieve that, simply
adjust the "success" exit condition of _shadow_prealloc(), thus forcing
removal of shadows not only when we're short of memory.

Note that, depending on workload, this may have a severe effect on
performance, due to the potentially much larger rate of thrashed
shadows.

In the context of "x86/shadow: account for log-dirty mode when pre-
allocating" it is relevant to note that we will be too strict in
sh_prealloc_okay() when log-dirty mode is enabled: Only part of the
pages considered are actually to become shadows. But I think accepting
this is better than further complicating the logic.

Requested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Tim Deegan <tim@xen.org>
---
What exactly we want the upper bound to be is up for discussion. This
may need to go together with an upper limit on the number of vCPU-s we
deem supportable in a (shadow) guest.

Really 32-bit HVM guests have 3 monitor tables. But I think that not
accounting for that in sh_prealloc_okay() is acceptable. How to
correctly do such accounting there would be unclear anyway, as we mean
to only take domain properties into account, whereas mode dependent
properties are per-vCPU.

Backporting note: The placement of the setting of the new per-domain
                  field relies on d->max_vcpus being set right at domain
                  creation. Hence this will need to move elsewhere for
                  4.11 and older (perhaps into shadow_set_allocation()'s
                  "if ( pages > 0 )" block, conditional upon the value
                  still being zero and max_vcpus already set).

Backporting note: 1d3668664df7 ("x86/shadow: restrict OOS allocation to
                  when it's really needed") is a necessary prereq for
                  the respective part of sh_prealloc_okay().
---
v14: Re-base over XSA-427 and new earlier patches. Restrict allowance
     for monitor tables to HVM. Restrict allowance for OOS to when
     that's actually in use.
v13: Prevent underflow in sh_prealloc_okay(). Re-base.
v12: Re-base past the XSA-410 series.
v11: Account for monitor tables and OOS snapshots in sh_prealloc_okay().
     Calculate the (default) maximum value once during domain
     initialization, into a new per-domain field.
v10: Extend commit message.
v9: New.

--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -108,6 +108,9 @@ void init_hypercall_page(struct domain *
 struct shadow_domain {
 #ifdef CONFIG_SHADOW_PAGING
     unsigned int      opt_flags;    /* runtime tunable optimizations on/off */
+
+    unsigned int      max_pages;    /* limit on the number of shadows in use */
+
     struct page_list_head pinned_shadows;
 
     /* 1-to-1 map for use when HVM vcpus have paging disabled */
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -96,6 +96,32 @@ int shadow_domain_init(struct domain *d)
     d->arch.paging.flush_tlb = shadow_flush_tlb;
 #endif
 
+    /*
+     * Figure out the default for the highest acceptable quantity of shadow
+     * memory. This is because we need to bound the amount of work potentially
+     * in need of doing by a single shadow_unhook_mappings() invocation.
+     */
+    d->arch.paging.shadow.max_pages = 2048;
+    if ( d->max_vcpus > 8 )
+    {
+        /*
+         * This is
+         *
+         *             128 * (max_vcpus + 8)
+         * max_vcpus * ---------------------
+         *                   max_vcpus
+         *
+         * suitably resolved, with the right side of the multiplication
+         * (when expressed as f(x)) satisfying
+         *   f(8) = 256
+         *   lim f(x) = 128
+         *   x->∞
+         * i.e. continuous with the simpler case above and converging to
+         * shadow_min_acceptable_pages() for large values.
+         */
+        d->arch.paging.shadow.max_pages = 128 * (d->max_vcpus + 8);
+    }
+
     return 0;
 }
 
@@ -372,7 +398,7 @@ static inline void trace_shadow_prealloc
 }
 
 static bool sh_blow_tables(struct domain *d, unsigned int goal,
-                           bool *preempted);
+                           unsigned int type, bool *preempted);
 
 /* Make sure there are at least count pages of the order according to
  * type available in the shadow page pool.
@@ -396,7 +422,7 @@ bool shadow_prealloc(struct domain *d, u
          ((SHF_L1_ANY | SHF_FL1_ANY) & (1u << type)) )
         count += paging_logdirty_levels();
 
-    ret = sh_blow_tables(d, count, NULL);
+    ret = sh_blow_tables(d, count, type, NULL);
     if ( !ret && (!d->is_shutting_down || d->shutdown_code != SHUTDOWN_crash) )
         /*
          * Failing to allocate memory required for shadow usage can only result in
@@ -408,6 +434,31 @@ bool shadow_prealloc(struct domain *d, u
 }
 
 /*
+ * Check that
+ * - there are enough free pages,
+ * - there aren't too many pages in use as shadows already when about to make
+ *   a (set of) new shadow page(s).
+ */
+static bool sh_prealloc_okay(const struct domain *d, unsigned int goal,
+                             unsigned int type)
+{
+    if ( d->arch.paging.free_pages < goal )
+        return false;
+
+    if ( type < SH_type_min_shadow || type > SH_type_max_shadow )
+        return true;
+
+    return d->arch.paging.total_pages -
+           (d->arch.paging.free_pages - goal) <=
+           d->arch.paging.shadow.max_pages +
+#if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
+           (d->options & XEN_DOMCTL_CDF_oos_off ? 0 : SHADOW_OOS_PAGES) +
+#endif
+           /* Allow for one monitor table per HVM vCPU. */
+           paging_mode_external(d) * d->max_vcpus;
+}
+
+/*
  * When @goal is zero: Deliberately free all the memory we can: This will
  * tear down all of this domain's shadows.
  *
@@ -415,7 +466,7 @@ bool shadow_prealloc(struct domain *d, u
  * available in the shadow page pool.
  */
 static bool sh_blow_tables(struct domain *d, unsigned int goal,
-                           bool *preempted)
+                           unsigned int type, bool *preempted)
 {
     struct page_info *sp, *t;
     struct vcpu *v;
@@ -423,7 +474,7 @@ static bool sh_blow_tables(struct domain
     int i;
     unsigned int done = 0;
 
-    if ( goal && d->arch.paging.free_pages >= goal )
+    if ( goal && sh_prealloc_okay(d, goal, type) )
         return true;
 
     /*
@@ -465,7 +516,7 @@ static bool sh_blow_tables(struct domain
             while ( hash_foreach(d, masks[i], callbacks, _mfn(0)) )
             {
                 /* See if that freed up enough space */
-                if ( goal && d->arch.paging.free_pages >= goal )
+                if ( goal && sh_prealloc_okay(d, goal, type) )
                     return true;
 
                 if ( general_preempt_check() )
@@ -491,7 +542,7 @@ static bool sh_blow_tables(struct domain
         sh_unpin(d, smfn);
 
         /* See if that freed up enough space */
-        if ( goal && d->arch.paging.free_pages >= goal )
+        if ( goal && sh_prealloc_okay(d, goal, type) )
             return true;
 
         if ( preempted && !(++done & 0xff) && general_preempt_check() )
@@ -519,7 +570,7 @@ static bool sh_blow_tables(struct domain
                     0);
 
                 /* See if that freed up enough space */
-                if ( goal && d->arch.paging.free_pages >= goal )
+                if ( goal && sh_prealloc_okay(d, goal, type) )
                 {
                     guest_flush_tlb_mask(d, d->dirty_cpumask);
                     return true;
@@ -569,7 +620,7 @@ static bool sh_blow_tables(struct domain
  * this domain's shadows */
 void shadow_blow_tables(struct domain *d, bool *preempted)
 {
-    sh_blow_tables(d, 0, preempted);
+    sh_blow_tables(d, 0, SH_type_none, preempted);
 }
 
 void shadow_blow_tables_per_domain(struct domain *d)
@@ -904,7 +955,7 @@ int shadow_set_allocation(struct domain
         else if ( d->arch.paging.total_pages > pages )
         {
             /* Need to return memory to domheap */
-            if ( !sh_blow_tables(d, 1, preempted) )
+            if ( !sh_blow_tables(d, 1, SH_type_none, preempted) )
                 return preempted && *preempted ? 0 : -ENOMEM;
 
             sp = page_list_remove_head(&d->arch.paging.freelist);


