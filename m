Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BCB606D827
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 12:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CY5Hqd31
Received: from list by lists.xenproject.org with outflank-mailman.1469706.1678460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xODxJ-0005Jw-TQ; Tue, 03 Nov 2026 12:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469706.1678460; Tue, 03 Nov 2026 12:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xODxJ-0005Jp-QS; Tue, 03 Nov 2026 12:49:37 +0000
Received: by outflank-mailman (input) for mailman id 1469706;
 Tue, 03 Nov 2026 12:49:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xODxI-0005Jd-5J
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 12:49:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xODxH-003Sqn-IC
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 13:49:35 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9d85e-8faa-0a2a0a5109dd-0a2a450a9e12-6
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 13:49:35 +0100
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9d85f-f2d2-0a2a450a0019-d155dd31b8e9-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 13:49:35 +0100
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-48c4be28b82so4325835f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 04:49:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b8c6e9sm24849397f8f.43.2026.11.03.04.49.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2026 04:49:34 -0800 (PST)
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
        d=suse.com; s=google; t=1793710175; x=1794314975; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ea76sT97/Jj9c4zXiDZbZrXgPF1Fz7XWAOxDEa7crk0=;
        b=CY5Hqd31kd2ldkbgyajiLYKeGFt+zXYA1sYZrcUW0FxjHC5G65TDHLw9+I8/y5WgLC
         cB2/ISybdGZXKJdYHPYqA/Z4yDWODOlQ6rschOWz0I3V51pm+QT7q6MOla9J1L7+a8kl
         pxC+UGZYOmxH5ZLRcYWZl/yLGOQ3tQVuQs5ZYwTEDdYvWzIuZNR6PYZWuIem9rZTPtLw
         QhF/1RBEenMj/xgIJtHkGhxbmDFVhDH4YlOQ5+nVUKDGGd7Uoc/j5CY1MNtZ64gvB+FB
         X6weA7dj6OpnvcwjM+HJlb/A2kZrpxpN3ntsQQNxNu36SSWsl3rQosrd7OGwzEewC6np
         rZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793710175; x=1794314975;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ea76sT97/Jj9c4zXiDZbZrXgPF1Fz7XWAOxDEa7crk0=;
        b=0JEUL+Fg5zCcasUEo7LySBC0P5w8HJDe8WknLOamN/mtFzRrqbeKUrgr2jreAtCwCq
         9ICngOYUIrI9v9JQQYce3HrS3WXpKopE1/VmyZoxiOVIIUlmnrEYygPgCt+/WywQUTKO
         ui/2iFfNUIM2c+a47TnmWXx4DGZ/glRVCNJvcUqYiYvjhJRQcC2p45Br/K2fnKjQ8Eqo
         X9J8j5VmLGF1BCX2BWI7PiOBwWou8Y7oSlUlnnqf99SiGKvQprTzpEWBnGVR5Z1zVdeT
         JPSzLnvQvXDWC7jp6rSKimhfCJVtWS71X/igVwJc9nQa6Nrl1PXmtpvrdYwOhB8yLmvq
         L2MA==
X-Gm-Message-State: APuU4Z+XQMpNZSDgQxCABXRbydbJttxdiYqvGyn2YAmkl5rmnQMGtFUT
	czpZ0usKU12qJhza9g87+GBpIFl9qCmDY5iJ60FOYlwZCBxgFmZFJjkadCgpyQloyBwtavmasVc
	5cAcbMA==
X-Gm-Gg: AYBFou2rLpogW0JwIo6rsg1g4Oq+zEyQ+SOKyh/BMd2uKNcReIHq4P0mj6xq/osTeH3
	YnLuLEPFLHbv6h9d6gT47zsaiEKHUDkQ3Y8F2fXJbRhKdKrZY9AurXtbTqC7pL2/5WLzkpCoNqx
	LrGlsFoyKMSrqPbCg4FY8+vioIA63yM9Hd0oocvTViB0AV05IgKecR1fzQr897xfJIzkxD81tBS
	4U+EiupEp7UUWGMd5vVTB8gTjUXVJ6jv2biod24MYckTVhDGNNG/M1E2TOR/weSSGwcAR/CnNHm
	3xFdjBzrJqT0CsXotygZfWphLAYWfzINCWZiS6ys7VY2EcIyAbR9PZ8Mz505wRh5fpnLQtSlbxw
	khk7GRrY2/lE+o7ihOW3WHByMLyQJt+8qIctdiisjwI7m0NoTUmWsdfb1isc3NN9GlLKNVGdHYe
	8apCXNvYB7c9Hr7fNJLy6uEf34Y1mUfy4BMx1/moyNsTc6T5WxkI4bFi1oEOhdkm0B3tdtqCNZ6
	ZVa/hqIDfUIxaVPL3QlW+53L7UyTetTga0TXAB2Nq2eC41RDUcWWooGVcuhcBR8nL2k0jF6VUhm
	vJiHBZUz9h8lak2+AZCmRjM8Y8Rtq6Kf2B0Aw0IT8RfnZCVoE0OMRM5apaHOU8do7MGmpehndTa
	pok7IKtxJKiMy8p/zDFvZGVe997/5FA6X7q1Leg==
X-Received: by 2002:a05:6000:41d1:b0:48e:6a23:4a09 with SMTP id ffacd0b85a97d-48e6e50d8cdmr31098567f8f.54.1793710174811;
        Tue, 03 Nov 2026 04:49:34 -0800 (PST)
Message-ID: <43e47410-7d5c-43c1-bff5-8e1ce3746b7d@suse.com>
Date: Tue, 3 Nov 2026 13:49:33 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 1/3] common: introduce "brk" allocator
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
References: <640c0ea5-fbbf-436d-b150-4537cbe98fdf@suse.com>
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
In-Reply-To: <640c0ea5-fbbf-436d-b150-4537cbe98fdf@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1793710175-583CCCFC-D747743A/10/78276251493
X-purgate-type: spam
X-purgate-size: 8465
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

... to replace (on x86) ebmalloc(), and then to find further use(s) to
allow recovering memory which is needed very early (and hence needs
setting up statically), but may not fully be used (or not be used at all).

Note that unlike free_ebmalloc_unused_mem(), brk_free_unused() (once
other code is converted) will be able to free part of the BRK space even
in the xen.efi case on x86. That would happen if BRK space extends across
a 2Mb boundary, and actual use stops before that boundary.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changing setup.c's reserve_e820_ram() uses would be cumbersome when done
right here. That'll be done when ebmalloc() is replaced, and hence
what's there can also simply be replaced.

When linking xen.efi, GNU ld prior to 2.46 produces a base relocation for
the reference to __subsystem__, which is wrong (that's an absolute symbol,
after all). That does no harm for our purposes, though.
---
v4: Use asm-inline in brk_adjust_start(). Introduce stub fallback for
    brk_adjust_start(). Introduce local "alloc" in brk_alloc(). Add
    comment ahead of the use of printk_once_init().
v3: Move to common code and introduce BSS_WITH_BRK. Rename
    brk_get_unused_start() to brk_cease(). Add header guard to brk.h. In
    brk_alloc() don't calculate result too early. Add printk_once_init(),
    for use in brk_alloc(). Move introduction of DEFINE_BRK() here; add
    comment.

--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -15,6 +15,7 @@ config X86
 	select FUNCTION_ALIGNMENT_16B
 	select GENERIC_BUG_FRAME
 	select HAS_ALTERNATIVE
+	select HAS_BRK_ALLOCATOR
 	select HAS_COMPAT
 	select HAS_CPUFREQ
 	select HAS_DIT
--- /dev/null
+++ b/xen/arch/x86/include/asm/brk.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef X86_BRK_H
+#define X86_BRK_H
+
+static inline unsigned long brk_adjust_start(unsigned long start)
+{
+    unsigned int subsys;
+
+    /*
+     * Only xen.efi will have the symbol __subsystem__ available, and it'll
+     * be non-zero (10) there.  In ELF the symbol will be undefined, and
+     * hence zero will be loaded into the register.
+     */
+    asm_inline ( ".weak __subsystem__; mov $__subsystem__, %0"
+                 : "=r" (subsys) );
+
+    /* using_2M_mapping() isn't available here. */
+    if ( IS_ENABLED(CONFIG_XEN_ALIGN_2M) || subsys )
+        start = PAGE_ALIGN_2M(start);
+
+    return start;
+}
+
+#endif /* X86_BRK_H */
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -87,6 +87,7 @@
  * doing the final put_page(), and remove it from the iommu if so.
  */
 
+#include <xen/brk.h>
 #include <xen/domain.h>
 #include <xen/domain_page.h>
 #include <xen/efi.h>
@@ -337,6 +338,8 @@ void __init arch_init_memory(void)
 
     efi_init_memory();
 
+    brk_free_unused();
+
 #ifndef NDEBUG
     if ( highmem_start )
     {
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -309,12 +309,7 @@ SECTIONS
   LLVM_COV_RW_DATA
 
   DECL_SECTION(.bss) {
-       __bss_start = .;
-       *(.bss.page_aligned*)
-       PERCPU_BSS
-       *(.bss .bss.*)
-       . = ALIGN(POINTER_ALIGN);
-       __bss_end = .;
+       BSS_WITH_BRK
   } PHDR(text)
   _end = . ;
 
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -118,6 +118,9 @@ config GENERIC_BUG_FRAME
 config HAS_ALTERNATIVE
 	bool
 
+config HAS_BRK_ALLOCATOR
+	bool
+
 config HAS_COMPAT
 	bool
 
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -1,6 +1,7 @@
 obj-$(CONFIG_ARGO) += argo.o
 obj-y += bitmap.o
 obj-bin-$(CONFIG_SELF_TESTS) += bitops.init.o
+obj-bin-$(CONFIG_HAS_BRK_ALLOCATOR) += brk.init.o
 obj-$(CONFIG_GENERIC_BUG_FRAME) += bug.o
 obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
 obj-$(CONFIG_CORE_PARKING) += core_parking.o
--- /dev/null
+++ b/xen/common/brk.c
@@ -0,0 +1,81 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <xen/brk.h>
+#include <xen/efi.h>
+#include <xen/lib.h>
+#include <xen/mm.h>
+#include <xen/page-defs.h>
+
+#if __has_include(<asm/brk.h>)
+# include <asm/brk.h>
+#else
+static inline unsigned long brk_adjust_start(unsigned long start)
+{
+    return start;
+}
+#endif
+
+extern char __brk_start[];
+extern const char __bss_end[];
+
+static unsigned long __initdata allocated;
+static bool __initdata finished;
+
+void *__init brk_alloc(size_t size)
+{
+    void *ptr;
+    unsigned long alloc = allocated;
+
+    if ( finished )
+        return NULL;
+
+    /* Allocations PAGE_SIZE and up will be page-aligned. */
+    if ( size >= PAGE_SIZE )
+        alloc = ROUNDUP(alloc, PAGE_SIZE);
+
+    ptr = __brk_start + alloc;
+
+    alloc += ROUNDUP(size, sizeof(void *));
+
+    if ( alloc > __bss_end - __brk_start )
+    {
+        /* Expected to be fatal to boot, but cannot be panic(). */
+        printk_once_init(
+            "%pS: over-sized BRK request: %zu bytes\n",
+            __builtin_extract_return_addr(__builtin_return_address(0)),
+            size);
+        return NULL;
+    }
+
+    allocated = alloc;
+
+    return ptr;
+}
+
+unsigned long __init brk_cease(void)
+{
+    finished = true;
+
+    allocated = ROUNDUP(allocated, PAGE_SIZE);
+
+    return (unsigned long)__brk_start + allocated;
+}
+
+void __init brk_free_unused(void)
+{
+    unsigned long start = brk_cease(), end = (unsigned long)__bss_end;
+
+    start = brk_adjust_start(start);
+
+    if ( start >= end )
+        return;
+
+    destroy_xen_mappings(start, PAGE_ALIGN_2M(end));
+
+    /*
+     * By reserving needed space early (on x86: in the E820 map), excess space
+     * gets freed way before we make it here.  Don't free the range a 2nd time.
+     */
+
+    printk(XENLOG_INFO "Freed %lukB unused BRK memory\n", (end - start) >> 10);
+}
--- /dev/null
+++ b/xen/include/xen/brk.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Early Boot memory allocator.
+ *
+ * Subsystems which conditionally need memory prior to the boot allocator
+ * (or the main heap) being set up may use DEFINE_BRK() to reserve BSS space
+ * in Xen.
+ *
+ * During boot, brk_alloc() allocates memory from the reserved space.  Such
+ * allocations are good for the lifetime of Xen.  Subsystems MUST NOT
+ * brk_alloc() more memory than they reserved.
+ *
+ * When the main heap is set up, brk allocations become unavailable.  Reserved
+ * but unallocated space is, as far as possible, handed to the main heap, so it
+ * doesn't go to waste.
+ */
+
+#ifndef XEN_BRK_H
+#define XEN_BRK_H
+
+#include <xen/types.h>
+
+#define DEFINE_BRK(var, size) \
+    static char __section(".bss..brk.page_aligned") __aligned(PAGE_SIZE) \
+        __used var ## _brk_[size]
+
+void *brk_alloc(size_t size);
+unsigned long brk_cease(void);
+void brk_free_unused(void);
+
+#endif /* XEN_BRK_H */
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -79,6 +79,16 @@ void vprintk(const char *fmt, va_list ar
     }                                           \
 })
 
+#define printk_once_init(fmt, args...)          \
+({                                              \
+    static bool __initdata once_;               \
+    if ( unlikely(!once_) )                     \
+    {                                           \
+        once_ = true;                           \
+        printk(fmt, ## args);                   \
+    }                                           \
+})
+
 extern void guest_printk(const struct domain *d, const char *fmt, ...)
     __attribute__ ((format (printf, 2, 3)));
 extern void noreturn panic(const char *fmt, ...)
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -221,6 +221,18 @@
        . = ALIGN(SMP_CACHE_BYTES); \
        __per_cpu_data_end = .;     \
 
+#define BSS_WITH_BRK               \
+       __bss_start = .;            \
+       *(.bss.page_aligned*)       \
+       PERCPU_BSS                  \
+       *(.bss .bss.[a-zA-Z0-9_]*)  \
+       . = ALIGN(PAGE_SIZE);       \
+       __brk_start = .;            \
+       *(.bss..brk.page_aligned*)  \
+       *(.bss..brk*)               \
+       . = ALIGN(POINTER_ALIGN);   \
+       __bss_end = .;
+
 #ifdef CONFIG_HAS_VPCI
 #define VPCI_ARRAY               \
        . = ALIGN(POINTER_ALIGN); \


