Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D8EC54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 14:20:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374353.1621504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woifZ-0000qL-A0; Tue, 28 Jul 2026 14:20:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374353.1621504; Tue, 28 Jul 2026 14:20:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woifZ-0000qE-7D; Tue, 28 Jul 2026 14:20:33 +0000
Received: by outflank-mailman (input) for mailman id 1374353;
 Tue, 28 Jul 2026 14:20:32 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woifY-0000oK-9I
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 14:20:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woifX-00HNLM-LE
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 16:20:31 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68baa1-2eae-0a2a0a5409dd-0a2a450ba534-38
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 16:20:31 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68baaf-b7e8-0a2a450b0019-d155dd35b4af-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 16:20:31 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-47f81a3ccf9so2477125f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 07:20:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85c63678sm55327159f8f.29.2026.07.28.07.20.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 07:20:30 -0700 (PDT)
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
        d=suse.com; s=google; t=1785248431; x=1785853231; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3K1J9tuZW+tws4Xjl6Dh8DcJ/c/koNpFTzCSwtVmdwo=;
        b=eqUjGelfrWah4/b2cFwGSGNKZoX6DJjPp2506KFasGwJObiv3dr59ULpK42qCRY6td
         LjgdXFLqLzj84yqOWIXpQTsgSUI1noYYJgEAOhZ/bUSueB1FSlWjmHidTU4Vwym8397+
         Zj6ZHyAhzHKewnAW90oBU+oXyzo/cqMvpdywhNheZN488nyprOL4NVy8Q/nol2Fs6mL1
         Is2ke36pZjdj/ZYy2cOoyt2h/03M8XtoExynnTfVQHKqYFXDK2X63VF0MUdkO/HZ7FGJ
         nZE6dulCDpvmMK40eNYW6bnIhb0xh1wChL1E01Ry3ruacI+mJpYorq+GmNefRJ9QVRMP
         c/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785248431; x=1785853231;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3K1J9tuZW+tws4Xjl6Dh8DcJ/c/koNpFTzCSwtVmdwo=;
        b=eMYKrMaAj8PmN8AOaY1oej/mtjjg2d2HUmFx7zx347vcHsR6kdDnFnvTQWZgGaoorG
         q7H29qqGKzGKCsN1oISApXkJVWXHtm41bhFlq4H1AgjDMdhgKLGqmVaOejXD8iDEESrg
         onfDb9vqHlxba7/vyhYhnGIgl7bUlhLHba5ESJo92jPEK/QaUAHf1ErwkZu9kry1R11R
         ekW4nv8r6a1L+xmCeB7vmonHa4jMulc4hlHzsPMWLQIn6S9gwcp/e3fZ5n6dwhMlN4Hi
         jsbeMPRoIVBeJnXAn3mOe01XQ/vGmWZJUXJSXJuzWaB2YT5BXEgfVZfEfh1kH3NeKLAJ
         SJ/A==
X-Gm-Message-State: AOJu0Yw8fS6WFY4d4blt0jhIXwfQmbnyHoumxqzBfBRmQiqUG9RoF21E
	chAMIBC1vjWnzAVM1uX3DkFWXrlQC4DO/exkDTa/jlCLNeTYB9Y+GnnvQgzGCAsktRgUv8w3doK
	Nhsh9Zg==
X-Gm-Gg: AR+sD111UsVt74Z6Hwh5JL2yAy7hZHiLAeM8jWt8U822uWIrU/D2dmH5uL4og1obUYI
	sYHZtKOEYN9emEhC2JvU2pnYm0xJvCky9XOYblj3m6tZWDMsb/ToZUv2kJrp31vC5zF/aT+Yja/
	S/ZA2i2mB7iibOldlQp1SkSN5IB7Ee5QDoAbzWnOaqtB/fdcvdTQBnDhhEzcdQ3W1eSiI+7MoUZ
	Z+MShNQto7urgyJRxdbkNETtKHwviFIabuV/oFkKNIoAaqtqdGSaxevVXIXZG4HjG5QggDp8aGy
	OREmaeB3LBsbwezxLAzhkvBCLBZMSS68ll405ariteSo3HdAyJQubxv2ssjy+1wMJgiriuHRGb6
	4lCiFZChPpIYWm7WlNYaNmLhtaCC/QU8PorQ+aAxrVWWDdrogFaFWMS5dy7flBdN7ZGREGEbXfz
	D72MIoITQPYCxHjUN8FAWNjkw9zQfqXswf6oYDKALEe22MJStY32ZCpVZSBlRRR/JD2vu6suh0m
	Qqd
X-Received: by 2002:a05:6000:3110:b0:46e:6201:3ebc with SMTP id ffacd0b85a97d-47fb1f18031mr3328707f8f.41.1785248430582;
        Tue, 28 Jul 2026 07:20:30 -0700 (PDT)
Message-ID: <5fe59b1f-70d9-46e7-b7f8-c5e8321d451a@suse.com>
Date: Tue, 28 Jul 2026 16:20:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v15 01/10] x86/shadow: add preemption support to
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
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1785248431-182F49EA-C54BFBF1/0/0
X-purgate-type: clean
X-purgate-size: 7208

From: Roger Pau Monné <roger.pau@citrix.com>

The use of shadow_blow_tables() in the domain teardown path (added for
XSA-410) actually requires preemption support itself for security
reasons, specially as the pages freed by shadow_blow_tables() are not
returned to the shadow page pool, but instead freed to the hypervisor.

Note that we require flushing the TLB when a need for preemption arises
on the 2nd pass, or else we risk returning to guest context with stale
TLB entries. (There's no similar need on the 1st pass, as per
_shadow_prealloc().) While preemption will be enabled only when tearing
down domains (and hence flushing has become meaningless by that point),
keep the function structured to no bypass the flush, just in case.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Tim Deegan <tim@xen.org>
---
Changes since v12:
 - Re-base.

Changes since v11:
 - Re-base in particular past the XSA-410 series.

Changes since v9:
 - Extend a comment. Commit message adjustments.

Changes since v8:
 - Use difference, not sum, of total and free pages to determine whether
   progress was made.
 - Check for preemption on every iteration of the 2nd pass, as long as
   some progress was made.
 - Don't "goto out" on the 1st pass, to skip the TLB flush.

Changes since v6:
 - Rearrange order of preemption condition checks.
 - Only avoid shadow_blow_tables() when the domain is dead (ie: all
   vCPUs are stopped).

Changes since v5:
 - Add comment, remove no functional change.
 - Do not check for preemption on every loop.

Changes since v4:
 - New in this version.

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -454,12 +454,23 @@ bool shadow_prealloc(struct domain *d, u
 
 /* Deliberately free all the memory we can: this will tear down all of
  * this domain's shadows */
-void shadow_blow_tables(struct domain *d)
+void shadow_blow_tables(struct domain *d, bool *preempted)
 {
     struct page_info *sp, *t;
     struct vcpu *v;
     mfn_t smfn;
     int i;
+    unsigned int done = 0;
+
+    /*
+     * When the domain is dying a call to shadow_blow_tables() will be
+     * performed from the teardown path with preemption support, ignore any
+     * other calls as we want to do the final teardown with preemption support.
+     * Teardown of shadow related data can only be avoided when all domain
+     * vCPUs are stopped.
+     */
+    if ( unlikely(d->is_dying) && !preempted )
+        return;
 
     /* Nothing to do when there are no vcpus yet. */
     if ( !d->vcpu[0] )
@@ -470,17 +481,46 @@ void shadow_blow_tables(struct domain *d
     {
         smfn = page_to_mfn(sp);
         sh_unpin(d, smfn);
+        if ( preempted && !(++done & 0xff) && general_preempt_check() )
+        {
+            *preempted = true;
+            return;
+        }
     }
 
     /* Second pass: unhook entries of in-use shadows */
     for_each_vcpu(d, v)
         for ( i = 0; i < ARRAY_SIZE(v->arch.paging.shadow.shadow_table); i++ )
             if ( !pagetable_is_null(v->arch.paging.shadow.shadow_table[i]) )
+            {
+                unsigned int num = d->arch.paging.total_pages -
+                                   d->arch.paging.free_pages;
+
                 shadow_unhook_mappings(
                     d,
                     pagetable_get_mfn(v->arch.paging.shadow.shadow_table[i]),
                     0);
 
+                /*
+                 * Make sure we are making progress before yielding: if domain
+                 * is dying progress will be seen by total_pages decreasing, if
+                 * not dying free_pages will increase.  In any case the gap
+                 * between both will shrink.
+                 *
+                 * Note that with the paging lock held the values used in the
+                 * calculation are safe from being altered by other hypercalls.
+                 */
+                if ( preempted &&
+                     (num != d->arch.paging.total_pages -
+                             d->arch.paging.free_pages) &&
+                     general_preempt_check() )
+                {
+                    *preempted = true;
+                    goto out;
+                }
+            }
+
+ out:
     /* Make sure everyone sees the unshadowings */
     guest_flush_tlb_mask(d, d->dirty_cpumask);
 }
@@ -490,7 +530,7 @@ void shadow_blow_tables_per_domain(struc
     if ( shadow_mode_enabled(d) && domain_vcpu(d, 0) )
     {
         paging_lock(d);
-        shadow_blow_tables(d);
+        shadow_blow_tables(d, NULL);
         paging_unlock(d);
     }
 }
@@ -2254,7 +2294,9 @@ void shadow_teardown(struct domain *d, b
      * in-use pages, as _shadow_prealloc() will no longer try to reclaim pages
      * because the domain is dying.
      */
-    shadow_blow_tables(d);
+    shadow_blow_tables(d, preempted);
+    if ( preempted && *preempted )
+        goto out;
 
 #if (SHADOW_OPTIMIZATIONS & (SHOPT_VIRTUAL_TLB|SHOPT_OUT_OF_SYNC))
     /* Free the virtual-TLB array attached to each vcpu */
@@ -2492,7 +2534,7 @@ static int cf_check sh_enable_log_dirty(
         /* This domain already has some shadows: need to clear them out
          * of the way to make sure that all references to guest memory are
          * properly write-protected */
-        shadow_blow_tables(d);
+        shadow_blow_tables(d, NULL);
     }
 
 #if (SHADOW_OPTIMIZATIONS & SHOPT_LINUX_L3_TOPLEVEL)
@@ -2530,7 +2572,7 @@ static void cf_check sh_clean_dirty_bitm
     /* Need to revoke write access to the domain's pages again.
      * In future, we'll have a less heavy-handed approach to this,
      * but for now, we just unshadow everything except Xen. */
-    shadow_blow_tables(d);
+    shadow_blow_tables(d, NULL);
     paging_unlock(d);
 }
 
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -979,7 +979,7 @@ sh_write_p2m_entry_post(struct p2m_domai
        again), so it doesn't matter too much. */
     if ( d->arch.paging.shadow.has_fast_mmio_entries )
     {
-        shadow_blow_tables(d);
+        shadow_blow_tables(d, NULL);
         d->arch.paging.shadow.has_fast_mmio_entries = false;
     }
 }
@@ -1049,7 +1049,7 @@ int shadow_track_dirty_vram(struct domai
          * Throw away all the shadows rather than walking through them
          * up to nr times getting rid of mappings of each pfn.
          */
-        shadow_blow_tables(d);
+        shadow_blow_tables(d, NULL);
 
         gdprintk(XENLOG_INFO, "tracking VRAM %lx - %lx\n", begin_pfn, end_pfn);
 
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -471,7 +471,7 @@ mfn_t oos_snapshot_lookup(struct domain
 #endif /* (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC) */
 
 /* Deliberately free all the memory we can: tear down all of d's shadows. */
-void shadow_blow_tables(struct domain *d);
+void shadow_blow_tables(struct domain *d, bool *preempted);
 
 /*
  * Remove all mappings of a guest frame from the shadow tables.


