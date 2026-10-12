Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A82CA9EC5
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 08:25:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445955.1661847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBLM-0003d3-PL; Mon, 12 Oct 2026 08:25:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445955.1661847; Mon, 12 Oct 2026 08:25:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBLM-0003cw-MU; Mon, 12 Oct 2026 08:25:12 +0000
Received: by outflank-mailman (input) for mailman id 1445955;
 Mon, 12 Oct 2026 08:25:12 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGBLL-0003ck-TK
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 08:25:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGBLL-00Dncs-8k
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 10:25:11 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc9967-bab6-0a2a0a5309dd-0a2a45049832-0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:25:11 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc9967-b57f-0a2a45040019-d155802da4dc-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:25:11 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a16c1608faso20791475e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 01:25:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf1358asm276719295e9.4.2026.10.12.01.25.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 01:25:10 -0700 (PDT)
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
        d=suse.com; s=google; t=1791793511; x=1792398311; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EL4bFrGDS8fVRKtmEPWhtKmCO7uYd5KlpOWgxi3uTDQ=;
        b=IuGQ4uWM/yhYt1Q0n9v7ZXuyU6H5InPr/Bzo68sDnTxCajgKzrzMi7t25B+soBWuHH
         ZDMqiWKwjrBGgaIMLERtSqFcqTTwFOj10/nSkyPYah9reCCWGc7/OV3eq+CuSapt1Rl0
         LFCJFxtndi5e31NE2q6TyKkwn/5JitJxHfUB7vQIhqu2ZortmHg5ZitbGzeF/0Lck8B/
         lv+rJQv7EBThXKSbCNb04D0h9ZHZBR8i1j/PorLysNNDetvmuR722A7fUVisVq7/vlEs
         s/Ygaml65FlxV93JW+570jGpqqqm6c+ahWCa+pxRz4o5Zc1EtzeRQXfNmeWKdSxbw4v/
         nRZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791793511; x=1792398311;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EL4bFrGDS8fVRKtmEPWhtKmCO7uYd5KlpOWgxi3uTDQ=;
        b=i/UWegh8QWKPp9+zCWtyIxHP6b8BX436bgrutjToGytgjxhdcx4tliCGsUCLeWnH+C
         mmlf6Zgd9gWZxMLzyXlF2EjoOZKVRKVb1oQnJii0aDA5MFAIZwp1aaASCgc7QiWYnBir
         HboiGw1XUuTXvBiVvm72p9AxV1xfOzXTarN3RxCNeFgY+3xpJxb2kkxBf1dI+glEq1l4
         hTA7PwVv7cQyt9567G2MZdGzj4zMh3W58Ur1uqPO02SIjZCC/5M8As5alcFBDn9PGCkf
         uRsYfoC8IzNlULja7cs9Qk5IRfiO0Gv018FlovTcSuJwBMcds8RWZJTec4VIcYYXFwSQ
         wUEw==
X-Gm-Message-State: AFq9FYLJDqBivlt+LfckuxbT6kCv45KuXnZAqctCDWbzu/T+/i9ZZq/B
	SgPx58qmdH6z/XtzB+kYpsjdARmoGCjEmwpNOei1qNTvIw1H07nhoHxNZOf5gRTg7QzQbHPM38w
	bQyybdw==
X-Gm-Gg: AYBFou33xF4WSTkG8s6S+Kw6tcT1JDZK0s4HXhjIkTwJMP40oPwXSW0meb4UV+3B9xf
	yjT5701TRw5HBKzZ+oA9paRl9NSxBSt5yLWrWX0r81apUcbraEh2Sv0qiGrEjPKBmzB/TW3GYa5
	8QLxThmiAdzgwmFi5Wq+TfoV2WluKRJ25ChEtIM2mLwHKDkbTWX7RHtFyMuW2AtxqIcbFbpJSOs
	d5KWieSVgsJ0/IeMOrj6t1V5AmQbpXY4gXm4s9yVMrl3MTxaEFZ0gRJKxQniBdQVFgokUx0pXU4
	z8c1ayKYOa70pkzw/rIhewMpQ1CNONv3HQlO92tp+j4EqHBi0mtS3fvdM99sTNSALTKqwIWfCB7
	/PnnOZKphtBSMuK96y0S9nBj3Ln8R87+B6EwiAa7dMYoGcLwECbnFesSQRQnR8rACXz0JUfOL4w
	0XDG2bGn0LOJ9UhRXwMKhUkJXmuEpsQy8tQl1olyUZeX3wSz9AyEuFmDjssY2mdZdCikQxUq+Kn
	dDhjGdMKCNthNorNWQ+RWT4jCad8MvGcQ5fokQAu48USvKFdU7C2o6hSgZzDbf/
X-Received: by 2002:a05:600c:4708:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4a18e4a6ea5mr168845315e9.13.1791793510456;
        Mon, 12 Oct 2026 01:25:10 -0700 (PDT)
Message-ID: <78cd46cc-84ed-46df-96c9-26ce97ed0da0@suse.com>
Date: Mon, 12 Oct 2026 10:25:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 11/15] x86/PVH: try to map initrd directly into Dom0
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
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
In-Reply-To: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1791793511-C0EDEB50-373112A0/10/78276251493
X-purgate-type: spam
X-purgate-size: 14924

Our present handling of initrd is problematic in particular when the
initrd is huge, and when at the same time "dom0_mem=" isn't in use to
significantly shrink Dom0's memory (from the default). In that case,
insufficient memory may exist for pvh_populate_p2m() to succeed (because
initrd memory can be freed only after copying).

Make an attempt to map the blob (including headroom) into Dom0 instead,
thus also saving the copying operation. With __start_xen() having arranged
for a larger than necessary blob, that mapping can typically be done with
superpage mappings.

Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Is there a need to prune (scrub) the headroom space?

Why does find_memory() go upwards, while find_kernel_memory() goes
downwards? And why do we use the lowest part of the region found by
find_memory() rather than the highest part?

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -450,7 +450,9 @@ static void __init pvh_init_p2m(struct d
 static int __init pvh_populate_p2m(
     struct domain *d,
     const struct e820entry *e820,
-    unsigned int nr_e820)
+    unsigned int nr_e820,
+    unsigned long initrd_start,
+    unsigned long initrd_end)
 {
     struct vcpu *v = d->vcpu[0];
     unsigned int i;
@@ -468,7 +470,12 @@ static int __init pvh_populate_p2m(
         addr = PFN_DOWN(e820[i].addr);
         size = PFN_DOWN(e820[i].size);
 
-        rc = pvh_populate_memory_range(d, addr, size);
+        if ( addr + size <= initrd_start || addr >= initrd_end )
+            rc = pvh_populate_memory_range(d, addr, size);
+        else
+            rc = pvh_populate_memory_range(d, addr, initrd_start - addr)
+                 ?: pvh_populate_memory_range(d, initrd_end,
+                                              addr + size - initrd_end);
         if ( rc )
             return rc;
 
@@ -518,6 +525,43 @@ static int __init pvh_populate_p2m(
 #undef MB1_PAGES
 }
 
+static int __init pvh_map_initrd(
+    struct domain *d, const struct boot_module *initrd,
+    paddr_t initrd_start, unsigned int order)
+{
+    for ( paddr_t ga = initrd_start, ma = initrd->start;
+          ga < initrd_start + initrd->size;
+          ga += PAGE_SIZE << order, ma += PAGE_SIZE << order )
+    {
+        int rc = p2m_add_page(d, gaddr_to_gfn(ga), maddr_to_mfn(ma),
+                              order, p2m_ram_rw);
+
+        if ( rc )
+        {
+            printk("Failed to map initrd: [%#lx,%#lx): %d\n",
+                   PFN_DOWN(ga), PFN_DOWN(ga) + (1UL << order), rc);
+
+            /*
+             * Best effort rollback: The range will be replaced anyway by the
+             * subsequent pvh_populate_p2m().
+             */
+            while ( ga > initrd_start )
+            {
+                ga -= PAGE_SIZE << order;
+                ma -= PAGE_SIZE << order;
+                p2m_remove_page(d, gaddr_to_gfn(ga), maddr_to_mfn(ma), order);
+                order_stats[order]--;
+            }
+
+            return rc;
+        }
+
+        order_stats[order]++;
+    }
+
+    return 0;
+}
+
 struct mem_info {
     size_t size;
     paddr_t addr;
@@ -538,7 +582,10 @@ static int cf_check __init _find_memory(
 }
 
 static paddr_t __init find_memory(
-    const struct domain *d, const struct elf_binary *elf, size_t size)
+    const struct domain *d,
+    const struct elf_binary *elf,
+    const struct hvm_modlist_entry *initrd,
+    size_t size)
 {
     struct rangeset *ram = rangeset_new(NULL, NULL, 0);
     struct mem_info info = {
@@ -577,6 +624,13 @@ static paddr_t __init find_memory(
                                        PAGE_SIZE) - 1) != 0 )
         return INVALID_PADDR;
 
+    /* Remove the mapped initrd range (if any), rounded to page boundaries. */
+    if ( initrd->paddr &&
+         rangeset_remove_range(ram, initrd->paddr,
+                               ROUNDUP(initrd->paddr + initrd->size,
+                                       PAGE_SIZE) - 1) != 0 )
+        return INVALID_PADDR;
+
     rangeset_report_ranges(ram, MB(1), -1, _find_memory, &info);
 
     rangeset_destroy(ram);
@@ -689,6 +743,70 @@ static bool __init check_and_adjust_load
     return true;
 }
 
+static paddr_t __init find_initrd_memory(
+    const struct domain *d,
+    const struct elf_binary *elf,
+    const struct boot_module *initrd,
+    size_t align,
+    paddr_t limit)
+{
+    paddr_t kernel_start = (paddr_t)elf->dest_base & PAGE_MASK;
+    paddr_t kernel_end = ROUNDUP((paddr_t)elf->dest_base + elf->dest_size,
+                                 PAGE_SIZE);
+    unsigned long initrd_size = ROUNDUP(initrd->size, PAGE_SIZE);
+    unsigned long initrd_len = initrd_size - initrd->arch.headroom;
+
+    if ( !IS_ALIGNED(initrd->start | initrd_size, align) )
+        return INVALID_PADDR;
+
+    /*
+     * The memory map is sorted.  Search backwards to find the highest
+     * suitable address.
+     */
+    for ( unsigned int i = d->arch.nr_e820; i--; )
+    {
+        paddr_t start = d->arch.e820[i].addr;
+        paddr_t end = start + d->arch.e820[i].size;
+
+        if ( d->arch.e820[i].type != E820_RAM )
+            continue;
+
+        if ( end > limit )
+            continue;
+
+        start = MAX(ROUNDUP(start, align), MB(1));
+        end = ROUNDDOWN(end, align);
+
+        /* Don't use memory below 1MB, as it could overwrite BDA/EBDA/IBFT. */
+        if ( end <= MB(1) )
+            break;
+
+        if ( end <= initrd_size )
+            break;
+
+        if ( end - initrd_size <= start )
+            continue;
+
+        /*
+         * NB: Even better would be to use rangesets to determine a suitable
+         * range, in particular in case a kernel requests multiple heavily
+         * discontiguous regions (which right now we fold all into one big
+         * region).
+         */
+        if ( end <= kernel_start || end - initrd_len >= kernel_end )
+            return end - initrd_size; /* No overlap. */
+
+        /* Deal with the kernel already being loaded in the region. */
+        if ( kernel_end < end && end - kernel_end >= initrd_len )
+            return end - initrd_size;
+        if ( kernel_start > start &&
+             ROUNDDOWN(kernel_start, align) - start >= initrd_size )
+            return ROUNDDOWN(kernel_start, align) - initrd_size;
+    }
+
+    return INVALID_PADDR;
+}
+
 static int __init pvh_place_kernel(
     const struct boot_domain *bd,
     struct elf_binary *elf,
@@ -744,9 +862,93 @@ static int __init pvh_place_kernel(
     return 0;
 }
 
+static void __init pvh_place_initrd(
+    const struct boot_domain *bd,
+    const struct elf_binary *elf,
+    struct hvm_modlist_entry *mod,
+    paddr_t *blob_start,
+    paddr_t *blob_end)
+{
+    struct domain *d = bd->d;
+    struct boot_module *initrd = bd->initrd;
+    struct boot_module try = *initrd;
+    unsigned long initrd_len =
+        initrd ? initrd->size - initrd->arch.headroom : 0;
+    size_t align = 1UL << L3_PAGETABLE_SHIFT;
+    int rc;
+
+    *blob_start = INVALID_PADDR;
+    *blob_end   = 0;
+
+    if ( !initrd_len )
+        return;
+
+    mod->size = initrd_len;
+
+    /*
+     * As we promise to place below 4G whatever fits there, make a first pass
+     * limiting permitted addresses.  If we can't fit it there, fall back to
+     * placing above 4G.
+     */
+    for ( paddr_t limit = GB(4); ; )
+    {
+        paddr_t start;
+
+        *blob_start = find_initrd_memory(d, elf, &try, align, limit);
+        if ( *blob_start != INVALID_PADDR )
+            break;
+
+        if ( align == PAGE_SIZE )
+        {
+            if ( !(limit + 1) )
+                return;
+
+            limit = -1;
+            align = 1UL << L3_PAGETABLE_SHIFT;
+            try = *initrd;
+            continue;
+        }
+
+        align >>= PAGETABLE_ORDER;
+
+        start = ROUNDDOWN(try.start + try.arch.headroom, align);
+        if ( start > try.start )
+        {
+            /* Free (part of) and reduce headroom. */
+            try.arch.headroom -= start - try.start;
+            try.size          -= start - try.start;
+            try.start          = start;
+        }
+    }
+
+    /* Free unused headroom, if any. */
+    if ( try.start > initrd->start )
+    {
+        init_domheap_pages(initrd->start, try.start);
+        *initrd = try;
+    }
+
+    rc = pvh_map_initrd(d, initrd, *blob_start, get_order_from_bytes(align));
+    if ( rc )
+    {
+        printk("Failed to map initrd @ %#lx: %d\n", *blob_start, rc);
+        return;
+    }
+
+    rc = assign_pages(maddr_to_page(initrd->start),
+                      PFN_UP(initrd->size), d, dom0_memflags);
+    if ( rc )
+        panic("%pd: cannot assign initrd RAM: %d\n", d, rc);
+
+    mod->paddr = *blob_start + initrd->arch.headroom;
+    *blob_end  = *blob_start + initrd->size;
+    initrd->arch.released = true;
+}
+
 static int __init pvh_load_kernel(
     const struct boot_domain *bd,
     struct elf_binary *elf,
+    struct hvm_modlist_entry *mod,
     paddr_t *start_info_addr)
 {
     struct domain *d = bd->d;
@@ -756,9 +958,8 @@ static int __init pvh_load_kernel(
     size_t cmdline_len = bd->cmdline ? strlen(bd->cmdline) + 1 : 0;
     const char *initrd_cmdline = NULL;
     size_t extra_space;
-    paddr_t last_addr;
+    paddr_t last_addr, initrd_start = 0;
     struct hvm_start_info start_info = { 0 };
-    struct hvm_modlist_entry mod = { 0 };
     struct vcpu *v = d->vcpu[0];
     int rc;
 
@@ -775,15 +976,18 @@ static int __init pvh_load_kernel(
 
     /*
      * Find a RAM region big enough (and that doesn't overlap with the loaded
-     * kernel) in order to load the initrd and the metadata. Note it could be
-     * split into smaller allocations, done as a single region in order to
-     * simplify it.
+     * kernel) in order to load the initrd (if it wasn't mapped directly above)
+     * and the metadata.  Note it could be split into smaller allocations, done
+     * as a single region in order to simplify it.
      */
     extra_space = sizeof(start_info);
 
     if ( initrd )
     {
-        size_t initrd_space = elf_round_up(elf, initrd_len);
+        size_t initrd_space = 0;
+
+        if ( !mod->paddr )
+            initrd_space = elf_round_up(elf, initrd_len);
 
         if ( initrd->arch.cmdline_pa )
         {
@@ -795,21 +999,24 @@ static int __init pvh_load_kernel(
             initrd_space += strlen(initrd_cmdline) + 1;
 
         if ( initrd_space )
-            extra_space += ROUNDUP(initrd_space, PAGE_SIZE) + sizeof(mod);
+            extra_space += ROUNDUP(initrd_space, PAGE_SIZE) + sizeof(*mod);
+        else if ( mod->paddr )
+            extra_space += sizeof(*mod);
         else
             initrd = NULL;
     }
 
     extra_space += elf_round_up(elf, cmdline_len);
 
-    last_addr = find_memory(d, elf, extra_space);
+    last_addr = find_memory(d, elf, mod, extra_space);
     if ( last_addr == INVALID_PADDR )
     {
-        printk("Unable to find a memory region to load initrd and metadata\n");
+        printk("Unable to find a memory region to %s metadata\n",
+               mod->paddr ? "put" : "load initrd and");
         return -ENOMEM;
     }
 
-    if ( initrd != NULL )
+    if ( initrd && !mod->paddr )
     {
         rc = hvm_copy_to_guest_phys(last_addr,
                                     __va(initrd->start + initrd->arch.headroom),
@@ -820,28 +1027,29 @@ static int __init pvh_load_kernel(
             return rc;
         }
 
-        mod.paddr = last_addr;
-        mod.size = initrd_len;
+        initrd_start = last_addr;
         last_addr += elf_round_up(elf, initrd_len);
-        if ( initrd_cmdline )
-        {
-            size_t len = strlen(initrd_cmdline) + 1;
-
-            rc = hvm_copy_to_guest_phys(last_addr, initrd_cmdline, len, v);
-            if ( rc )
-            {
-                printk("Unable to copy module command line\n");
-                return rc;
-            }
-            mod.cmdline_paddr = last_addr;
-            last_addr += len;
-        }
-        last_addr = ROUNDUP(last_addr, PAGE_SIZE);
     }
 
     /* Free temporary buffers. */
     free_boot_modules();
 
+    if ( initrd_cmdline )
+    {
+        size_t len = strlen(initrd_cmdline) + 1;
+
+        rc = hvm_copy_to_guest_phys(last_addr, initrd_cmdline, len, v);
+        if ( rc )
+        {
+            printk("Unable to copy module command line\n");
+            return rc;
+        }
+        mod->cmdline_paddr = last_addr;
+        last_addr = ROUNDUP(last_addr + len, PAGE_SIZE);
+    }
+    else if ( initrd && !mod->paddr )
+        last_addr = ROUNDUP(last_addr, PAGE_SIZE);
+
     rc = hvm_copy_to_guest_phys(last_addr, bd->cmdline, cmdline_len, v);
     if ( rc )
     {
@@ -859,7 +1067,10 @@ static int __init pvh_load_kernel(
 
     if ( initrd != NULL )
     {
-        rc = hvm_copy_to_guest_phys(last_addr, &mod, sizeof(mod), v);
+        if ( !mod->paddr )
+            mod->paddr = initrd_start;
+
+        rc = hvm_copy_to_guest_phys(last_addr, mod, sizeof(*mod), v);
         if ( rc )
         {
             printk("Unable to copy guest modules\n");
@@ -867,7 +1078,7 @@ static int __init pvh_load_kernel(
         }
         start_info.modlist_paddr = last_addr;
         start_info.nr_modules = 1;
-        last_addr += sizeof(mod);
+        last_addr += sizeof(*mod);
     }
 
     start_info.magic = XEN_HVM_START_MAGIC_VALUE;
@@ -1441,6 +1652,8 @@ int __init dom0_construct_pvh(const stru
     unsigned int nr_orig_e820;
     struct acpi_info acpi = {};
     struct vmx_info vmx = {};
+    struct hvm_modlist_entry initrd = {};
+    paddr_t blob_start, blob_end;
     int rc;
 
     printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", d->domain_id);
@@ -1517,7 +1730,10 @@ int __init dom0_construct_pvh(const stru
             return rc;
     }
 
-    rc = pvh_populate_p2m(d, orig_e820, nr_orig_e820);
+    pvh_place_initrd(bd, &elf, &initrd, &blob_start, &blob_end);
+
+    rc = pvh_populate_p2m(d, orig_e820, nr_orig_e820,
+                          PFN_DOWN(blob_start), PFN_UP(blob_end));
     if ( rc )
     {
         printk("Failed to setup Dom0 physical memory map\n");
@@ -1526,7 +1742,7 @@ int __init dom0_construct_pvh(const stru
 
     xvfree(orig_e820);
 
-    rc = pvh_load_kernel(bd, &elf, &start_info);
+    rc = pvh_load_kernel(bd, &elf, &initrd, &start_info);
     if ( rc )
     {
         printk("Failed to load Dom0 kernel\n");


