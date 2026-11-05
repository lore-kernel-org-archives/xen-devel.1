Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D452606A326
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 13:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PZehcl6L
Received: from list by lists.xenproject.org with outflank-mailman.1474713.1681713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOxdO-0000Ph-AQ; Thu, 05 Nov 2026 13:36:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474713.1681713; Thu, 05 Nov 2026 13:36:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOxdO-0000Pa-7R; Thu, 05 Nov 2026 13:36:06 +0000
Received: by outflank-mailman (input) for mailman id 1474713;
 Thu, 05 Nov 2026 13:36:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOxdN-0000Ou-8x
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 13:36:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOxdM-00Ak7z-Le
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 14:36:04 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec8630-2eae-0a2a0a5409dd-0a2a45088e0a-42
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 14:36:04 +0100
Received: from [209.85.218.45] (helo=mail-ej1-f45.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec8644-f659-0a2a45080019-d155da2dd4bc-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 14:36:04 +0100
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-c4322d310e7so32200166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 05:36:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d0e4668afsm172795166b.51.2026.11.05.05.36.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 05:36:03 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793885764; x=1794490564; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Xqd7lQJf6HxSa5w7PCo/dVug3ab9DqyZkj44HJO+byE=;
        b=PZehcl6LqNrWcNaAcUWURluYaEBu/6sv3BEFWpjoedJzij+eH+9A73nJqGRu2KwJgi
         jW9wo7O3ZkB2X1OvTGLyTZUqd71HgRySzWOkDhkPrJCIFixHyThKcJpw9HcNDCVBeBQa
         M5B5iTiP+n+9TtwDTukBVbAxVQNbGAJEuQRXPDpe/+CoxtihOxm0SL+PLs9+g7hTY8cb
         wBTNDGOXnmEzm30E+b7BDtn9AKI96ZnOVwgcIJvEAxKrQXFDdmolYWaO/IExiiK5bQiq
         lhYykBuFBP/FfjHsWURglLk/ugCbtghiywgfN/lLWF0Nk8aIJ+5z51UH/x6WHbwhW5pE
         P7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885764; x=1794490564;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Xqd7lQJf6HxSa5w7PCo/dVug3ab9DqyZkj44HJO+byE=;
        b=Umiutjnf5TWpu2iv80TFBHUuxOPXQGNK6CojWfKqkaz1mjUrYawyrKyCtCXS84A4ib
         ANZhpiqOhB3Wtittb/w9TWIsGPSCSfty2dYCD67FUVe9G81mrNhf7iHjFfa+iP7i4TTz
         QXCkDdFq7+CA7Xu4CKxCIo2TSyV+BV4eX+4fVwaEEo7dNYM+kgCVJEY8LYhSReuHzpt9
         1r0kMCwklGQ5jXu57LfhcG3xSf3r0+lsjTa+Rx9XD5pAQgN6ycEnkBwIJqUdBgOcoQbX
         8jUxiJ5rTv2o469ACsP4PJJ/jZkJ/fyD9qdGCfKa9I8HY7YFtJn+4djkZxfQ/E92prjG
         0V5g==
X-Gm-Message-State: APuU4Z/Obu6iVzFNeoTGA9Gp2ftFoK0AFXBBcxUqR+LrMdzL19Zp7B06
	a+LUuZK7gJL6wstzodXyrGSMmnhMmbSjLpDYAFlISK3CV8FD48WNll44bFPV56V9A++mIavZEai
	6FtvthQ==
X-Gm-Gg: AYBFou0cnUkP22Axt1AXsh7U0o3biR/2kTWfCZVNQdOetZg8NMLEIwDX9kGiYJjaUdo
	F0aUWPer6mhjpyxVYEPiNkOJXQ9K8Yhi2d7lOt1D6HZBlOMUEN9VQW1O8ILJmCZOm4NM5RdLZzv
	+pCOV9tnSqHPZLiYDy5hGt9JkwYTH/jGYXdY47HneZsgoojOrOcv7TYYezHLelWxbi7z/wDCaGy
	udm1cMoitGeWnnxzwDbOMDzvGkUOaoENtet5O5zEYVnouSEg9tzCZHp3P55GhU3sWicxsz5d/7c
	pHjRP3cocSV4DfNWn6FySfG3/+tb22OutMvdq0zWBITS+BiIevj0R5ApAmse1N8TwdY9njs1iLI
	t7TXBahd9U4TrCQCQyoNuWaI9YQkmdTyl0lGcklUiduwPkmd0+UJsqNQIT/lqim5yLunhZzZ4Ns
	t8Ot7Vt4rCnhwvqvdnPaQYLyLfejMLm1iLcDs3SBcwwira1lx55z77G4iYjvnkaNdTOjDd6YaIa
	vVlQ4L6tlHw+udGc0ZyuCaFgVzEYQRiN1Eypkpef2g0sxihf6nOZNpXuhgaQz2VCCGw00zL7jW8
	Lng0H5gEke8dwnTxX7M+wUf9m2LL4FcG0KukFvBMlIoe+zMsdlr2zSrjptewjSy1JXI1Gh7G9rg
	8QHOdh+WHzWI49uUp
X-Received: by 2002:a17:907:84b:b0:c46:6a50:40c2 with SMTP id a640c23a62f3a-c4ca7acc58fmr1606505166b.39.1793885764041;
        Thu, 05 Nov 2026 05:36:04 -0800 (PST)
Message-ID: <fb392a52-3c9e-4fab-ab05-4c57a62f39c9@suse.com>
Date: Thu, 5 Nov 2026 14:36:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 10/14] x86/PVH: try to map initrd directly into Dom0
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <a1f88104-14ae-400c-b950-163d5a7e552b@suse.com>
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
In-Reply-To: <a1f88104-14ae-400c-b950-163d5a7e552b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1793885764-D554C87B-F29BFDCD/10/78276251493
X-purgate-type: spam
X-purgate-size: 12187
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Our present handling of initrd is problematic in particular when the
initrd is huge, and when at the same time "dom0_mem=" isn't in use to
significantly shrink Dom0's memory (from the default). In that case,
insufficient memory may exist for pvh_populate_p2m() to succeed (because
initrd memory can be freed only after copying).

Make an attempt to map the blob (including headroom) into Dom0's P2M
instead, thus also saving the copying operation. With __start_xen() having
arranged for a larger than necessary blob, that mapping can typically be
done with superpage mappings.

Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
pvh_steal_ram() can (theoretically) fail just because of
rangeset_remove_range() there failing, in which case we may be in limbo
state. That's hopefully an acceptable risk.
---
v2: Re-base over changes earlier in the series, in particular to use
    pvh_steal_ram() here. Avoid NULL deref when there's no initrd. Also
    log domain in new/moved printk().

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -528,7 +528,9 @@ static void __init pvh_init_p2m(struct d
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
@@ -546,7 +548,12 @@ static int __init pvh_populate_p2m(
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
 
@@ -636,6 +643,43 @@ static struct rangeset *__init make_ram_
     return ram;
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
+            printk("%pd: failed to map initrd: [%#lx,%#lx): %d\n",
+                   d, PFN_DOWN(ga), PFN_DOWN(ga) + (1UL << order), rc);
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
 static bool __init check_load_address(
     const struct domain *d, const struct elf_binary *elf)
 {
@@ -796,9 +840,98 @@ static int __init pvh_place_kernel(
     return 0;
 }
 
+static void __init pvh_place_initrd(
+    const struct boot_domain *bd,
+    const struct elf_binary *elf,
+    struct rangeset *ram,
+    struct hvm_modlist_entry *mod,
+    paddr_t *blob_start,
+    paddr_t *blob_end)
+{
+    struct domain *d = bd->d;
+    struct boot_module *initrd = bd->initrd;
+    struct boot_module try;
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
+    try = *initrd;
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
+        unsigned long size = ROUNDUP(try.size, PAGE_SIZE);
+        paddr_t start;
+
+        if ( IS_ALIGNED(try.start | size, align) &&
+             !pvh_steal_ram(ram, size - try.arch.headroom, align, limit,
+                            blob_start, NULL) )
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
+        printk("%pd: failed to map initrd @ %#lx: %d\n", d, *blob_start, rc);
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
     paddr_t *start_info_addr,
     struct rangeset *ram)
 {
@@ -809,9 +942,8 @@ static int __init pvh_load_kernel(
     size_t cmdline_len = bd->cmdline ? strlen(bd->cmdline) + 1 : 0;
     const char *initrd_cmdline = NULL;
     size_t extra_space;
-    paddr_t last_addr;
+    paddr_t last_addr, initrd_start = 0;
     struct hvm_start_info start_info = { 0 };
-    struct hvm_modlist_entry mod = { 0 };
     struct vcpu *v = d->vcpu[0];
     int rc;
 
@@ -828,15 +960,18 @@ static int __init pvh_load_kernel(
 
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
@@ -848,7 +983,9 @@ static int __init pvh_load_kernel(
             initrd_space += strlen(initrd_cmdline) + 1;
 
         if ( initrd_space )
-            extra_space += ROUNDUP(initrd_space, PAGE_SIZE) + sizeof(mod);
+            extra_space += ROUNDUP(initrd_space, PAGE_SIZE) + sizeof(*mod);
+        else if ( mod->paddr )
+            extra_space += sizeof(*mod);
         else
             initrd = NULL;
     }
@@ -860,14 +997,16 @@ static int __init pvh_load_kernel(
      * live below 1Gb (mapped by the first L3 entry of the direct map).  32-bit
      * Linux may map more, but defaults to mapping only 1Gb.
      */
-    if ( pvh_steal_ram(ram, PAGE_ALIGN(extra_space), PAGE_SIZE, GB(1),
-                       &last_addr, NULL) )
+    rc = pvh_steal_ram(ram, PAGE_ALIGN(extra_space), PAGE_SIZE, GB(1),
+                       &last_addr, NULL);
+    if ( rc )
     {
-        printk("Unable to find a memory region to load initrd and metadata\n");
-        return -ENOMEM;
+        printk("%pd: unable to find a memory region to %s metadata: %d\n",
+               d, mod->paddr ? "put" : "load initrd and", rc);
+        return rc;
     }
 
-    if ( initrd != NULL )
+    if ( initrd && !mod->paddr )
     {
         rc = hvm_copy_to_guest_phys(last_addr,
                                     __va(initrd->start + initrd->arch.headroom),
@@ -878,28 +1017,29 @@ static int __init pvh_load_kernel(
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
+            printk("%pd: unable to copy module command line\n", d);
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
@@ -917,7 +1057,10 @@ static int __init pvh_load_kernel(
 
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
@@ -925,7 +1068,7 @@ static int __init pvh_load_kernel(
         }
         start_info.modlist_paddr = last_addr;
         start_info.nr_modules = 1;
-        last_addr += sizeof(mod);
+        last_addr += sizeof(*mod);
     }
 
     start_info.magic = XEN_HVM_START_MAGIC_VALUE;
@@ -1508,6 +1651,8 @@ int __init dom0_construct_pvh(const stru
     struct rangeset *ram;
     struct acpi_info acpi = {};
     struct vmx_info vmx = {};
+    struct hvm_modlist_entry initrd = {};
+    paddr_t blob_start, blob_end;
     int rc;
 
     printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", d->domain_id);
@@ -1592,7 +1737,10 @@ int __init dom0_construct_pvh(const stru
             return rc;
     }
 
-    rc = pvh_populate_p2m(d, orig_e820, nr_orig_e820);
+    pvh_place_initrd(bd, &elf, ram, &initrd, &blob_start, &blob_end);
+
+    rc = pvh_populate_p2m(d, orig_e820, nr_orig_e820,
+                          PFN_DOWN(blob_start), PFN_UP(blob_end));
     if ( rc )
     {
         printk("Failed to setup Dom0 physical memory map\n");
@@ -1601,7 +1749,7 @@ int __init dom0_construct_pvh(const stru
 
     xvfree(orig_e820);
 
-    rc = pvh_load_kernel(bd, &elf, &start_info, ram);
+    rc = pvh_load_kernel(bd, &elf, &initrd, &start_info, ram);
     if ( rc )
     {
         printk("Failed to load Dom0 kernel\n");


