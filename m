Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414F4C53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 14:22:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374381.1621539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woihD-0002xw-DO; Tue, 28 Jul 2026 14:22:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374381.1621539; Tue, 28 Jul 2026 14:22:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woihD-0002xn-Ad; Tue, 28 Jul 2026 14:22:15 +0000
Received: by outflank-mailman (input) for mailman id 1374381;
 Tue, 28 Jul 2026 14:22:14 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woihC-0002xG-Fr
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 14:22:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woihB-00HOAI-T1
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 16:22:13 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68bafb-5cb7-0a2a0a5109dd-0a2a450bc7ee-44
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 16:22:13 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68bb15-b7e8-0a2a450b0019-d155dd2eb983-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 16:22:13 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-47f84023916so3909473f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 07:22:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85c6f076sm59359286f8f.34.2026.07.28.07.22.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 07:22:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1785248533; x=1785853333; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YAcoPIBVIk35F4UuhNNjahrwo2SklVXZ2m2wuexNepE=;
        b=NQT3b/l1U/0AHnFoVyVGdUrKKFGRn8j6g5egzmJbO4CCblTXk6M4llqgKZrtjbPtIg
         uyRnzuNLtjmp7VQYlfi0C0a8w8UQtrAhVlefLM3UizzB8Ue3lGMFifoLK4fhkCl1czDI
         1JJHcyVbuwSzwsoPzkCAehhBKDkK+2tPHd74cjZOKGNF5kMhd3p+nAtS+u8et5A9om/x
         0lGCXfP5E1LJyfHZZi5TCpCBS4/h62be4ICpHwxi5sZvIXDk76x+esTd8WEPfA3BlXK5
         7crs2NTr2ZBtZZwFeJ/rhPYRB0e/5L4E9T9LOCVTRz7Wc2Dxl8BU35IrghmONgCQr1r5
         OHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785248533; x=1785853333;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YAcoPIBVIk35F4UuhNNjahrwo2SklVXZ2m2wuexNepE=;
        b=NO8wQ4YtuZT7DSe/R+npHfP87Q8zGu/gculo4nluzaNUuN0vLLW7QADQ/tAL1L95SD
         cfwkHbzuC81j3WVSZG9IC7CK9j+xLdK3p0+4MTqnHnbXRTacuBt54Wk+w0xrhIT0V8jD
         7xh57B9PEw/L1wPybsKFw/6nSgNqbYpm2aUWTJpHEOmLFjO6HOaPj/TGUelp1ILi6Sp+
         5JdH1L3cy2EFOd2hgzswZGHNiaGNQWINATqnBM+3EPIBNR9P910lPciQMkIiR5ut1T7Q
         BsAv6x0aiDCGpfTwRLG0k4crfCD2BjOg9dJsiw1ZA7W+miyKZVWCea0amg+KbV/v89kO
         XN8A==
X-Gm-Message-State: AOJu0YwTxgKYLiWaOcCk7fD2JiCf9TvGE6GZMauRthQWQ4kY3kJARUpW
	gtZH1+9cxRl+4Qi4Ze7IK0s88mf7oAZec+axdpIaX4GIoeceJ2QKPAkm5XHxtv31zySA8O+ETrC
	ifwHGOQ==
X-Gm-Gg: AR+sD12nmcPFH2Nwq84+IJ3jR+z0ggNs8K1Bw6Tpl1wHzUYZxdG+06hrGRaHIzSdVUg
	Hb8UQ0KmA+SNAdxUFEpaDPYz39S9VyGYN9oodKAf88kMc0fS6KrC+H6HDugs3Z/KNfleWxFzSck
	q0U29Sgpt2GgUvOIG4JQNc7t8dVZzt2GWlRUse3Oqp/sFO7x3QXoqyVFLfAMrnQmQQpOo6qxGhL
	XzQvsQ0nSkCO/gi2uNq528SKkzkgddLInwYu83ugb4GqT9uEIOerO+AfjPIuBUkgxSLkFdT95+d
	/GComwCnD9ue1mzsWlOyXi3/efwTmfyQjpQZgvtoUPLazpLUzMgGeBZYvzXHpqcX77QDpQmzERc
	SfknWokGuTKerg43ST/3gUJzRGUqt85H9PchsKu6+MCak8ypmA49K4gvPdTafOnXeALBVkmS5wX
	Q/LxdbB+UJsP3Qq7sVg5ASeudtGZepr5xs3ubQHyrxSx0yqkLtmaqLTQgHqRnqDUtbkjFKf+X+g
	CHp
X-Received: by 2002:a05:6000:22c3:b0:47f:9567:e63b with SMTP id ffacd0b85a97d-47fb1f26115mr3657417f8f.55.1785248533183;
        Tue, 28 Jul 2026 07:22:13 -0700 (PDT)
Message-ID: <274756a3-83da-4594-8909-25a3a9eb94d2@suse.com>
Date: Tue, 28 Jul 2026 16:22:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v15 05/10] x86/shadow: make clean-dirty-bitmap post-processing
 preemptable
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
X-purgate-ID: tlsNG-42698a/1785248533-A86CA9EA-898524F5/0/0
X-purgate-type: clean
X-purgate-size: 6534

What this currently amounts to is blowing the domain's tables. To make
that call preemptable and to record state in a race-free manner, it
needs to be moved inside the paging-locked region. Since the
corresponding HAP function wants to acquire the P2M lock, the hook
invocation itself cannot be moved. Call the shadow function directly,
and prevent the hook from being invoked in that case.

To prevent "extra" accounting from being done more than once in
paging_log_dirty_op(), the mapping of the top level table also becomes
conditional (upon the subsequent loop doing nothing anyway).

Further note that this now also avoids sh{,adow}_clean_dirty_bitmap()
needlessly being called when no paging mode was enabled at all for the
domain. (The function continues to be called even when log-dirty mode
isn't enabled.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The hook functions were/are slightly mis-named, as they don't clean
anything. However, to keep names similar (and hence possible to grep
for) the new directly called function is still named in the same manner.

Of course we could purge the hook altogether, calling the HAP function
directly as well. If so, question would be whether to do so right here
or in a public follow-up (perhaps the latter).

In the course of doing this work I've noticed that libxenguest uses
XEN_DOMCTL_SHADOW_OP_CLEAN even on the last iteration. Wouldn't it
suffice to invoke the non-cleaning (peek) operation there instead,
reducing the overhead of shadow's post-processing?
---
v15: Fix !SHADOW_PAGING build.
v14: New.

--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -234,7 +234,7 @@ struct paging_domain {
         union {
             struct {
                 unsigned long done:PADDR_BITS - PAGE_SHIFT;
-                unsigned long i4:PAGETABLE_ORDER;
+                unsigned long i4:PAGETABLE_ORDER + 1;
                 unsigned long i3:PAGETABLE_ORDER;
             } log_dirty;
         };
--- a/xen/arch/x86/include/asm/shadow.h
+++ b/xen/arch/x86/include/asm/shadow.h
@@ -56,6 +56,9 @@ int shadow_domain_init(struct domain *d)
  * paging_vcpu_init() in paging.c */
 void shadow_vcpu_init(struct vcpu *v);
 
+/* Post-processing necessary after the log-dirty bitmap was cleaned. */
+bool shadow_clean_dirty_bitmap(struct domain *d);
+
 #ifdef CONFIG_SHADOW_PAGING
 
 /* Enable an arbitrary shadow mode.  Call once at domain creation. */
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -473,8 +473,9 @@ static int paging_log_dirty_op(struct do
         goto out;
     }
 
-    l4 = paging_map_log_dirty_bitmap(d);
     i4 = d->arch.paging.preempt.log_dirty.i4;
+    if ( i4 < LOGDIRTY_NODE_ENTRIES )
+        l4 = paging_map_log_dirty_bitmap(d);
     i3 = d->arch.paging.preempt.log_dirty.i3;
     pages = d->arch.paging.preempt.log_dirty.done;
 
@@ -542,6 +543,19 @@ static int paging_log_dirty_op(struct do
     if ( l4 )
         unmap_domain_page(l4);
 
+    /*
+     * In the shadow case post-processing may take long and hence needs to be
+     * preemptable. Since continuation state is protected by the paging lock,
+     * we need to call its function (and record state) before dropping that
+     * lock. The hook invocation further down therefore will be skipped.
+     */
+    if ( !rv && clean && paging_mode_shadow(d) &&
+         !shadow_clean_dirty_bitmap(d) )
+    {
+        d->arch.paging.preempt.log_dirty.i4 = LOGDIRTY_NODE_ENTRIES;
+        rv = -ERESTART;
+    }
+
     if ( !rv )
     {
         d->arch.paging.preempt.dom = NULL;
@@ -569,10 +583,12 @@ static int paging_log_dirty_op(struct do
 
     if ( pages < sc->pages )
         sc->pages = pages;
-    if ( clean )
+    if ( clean && paging_mode_hap(d) )
     {
-        /* We need to further call clean_dirty_bitmap() functions of specific
-         * paging modes (shadow or hap).  Safe because the domain is paused. */
+        /*
+         * We need to further call HAP's clean_dirty_bitmap() function (shadow
+         * was dealt with above).  Safe because the domain is paused.
+         */
         d->arch.paging.log_dirty.ops->clean(d);
     }
     domain_unpause(d);
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -71,7 +71,6 @@ DEFINE_PER_CPU(uint32_t,trace_shadow_pat
 
 static int cf_check sh_enable_log_dirty(struct domain *d);
 static int cf_check sh_disable_log_dirty(struct domain *d);
-static void cf_check sh_clean_dirty_bitmap(struct domain *d);
 
 static void cf_check shadow_update_paging_modes(struct vcpu *v);
 
@@ -82,7 +81,7 @@ int shadow_domain_init(struct domain *d)
     static const struct log_dirty_ops sh_ops = {
         .enable  = sh_enable_log_dirty,
         .disable = sh_disable_log_dirty,
-        .clean   = sh_clean_dirty_bitmap,
+        .clean   = ZERO_BLOCK_PTR,
     };
 
     INIT_PAGE_LIST_HEAD(&d->arch.paging.shadow.pinned_shadows);
@@ -2606,14 +2605,18 @@ static int cf_check sh_disable_log_dirty
 /* This function is called when we CLEAN log dirty bitmap. See
  * paging_log_dirty_op() for details.
  */
-static void cf_check sh_clean_dirty_bitmap(struct domain *d)
+bool shadow_clean_dirty_bitmap(struct domain *d)
 {
-    paging_lock(d);
+    bool preempted = false;
+
+    ASSERT(paging_locked_by_me(d));
+
     /* Need to revoke write access to the domain's pages again.
      * In future, we'll have a less heavy-handed approach to this,
      * but for now, we just unshadow everything except Xen. */
-    shadow_blow_tables(d, NULL);
-    paging_unlock(d);
+    shadow_blow_tables(d, &preempted);
+
+    return !preempted;
 }
 
 /**************************************************************************/
--- a/xen/arch/x86/mm/shadow/none.c
+++ b/xen/arch/x86/mm/shadow/none.c
@@ -7,11 +7,6 @@ static int cf_check _toggle_log_dirty(st
     return -EOPNOTSUPP;
 }
 
-static void cf_check _clean_dirty_bitmap(struct domain *d)
-{
-    ASSERT(is_pv_domain(d));
-}
-
 static void cf_check _update_paging_modes(struct vcpu *v)
 {
     ASSERT_UNREACHABLE();
@@ -23,7 +18,7 @@ int shadow_domain_init(struct domain *d)
     static const struct log_dirty_ops sh_none_ops = {
         .enable  = _toggle_log_dirty,
         .disable = _toggle_log_dirty,
-        .clean   = _clean_dirty_bitmap,
+        .clean   = ZERO_BLOCK_PTR,
     };
 
     paging_log_dirty_init(d, &sh_none_ops);


