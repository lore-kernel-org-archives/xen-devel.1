Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E509CC6B1A
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 13:01:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448990.1664940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGybp-0006sK-2Q; Wed, 14 Oct 2026 13:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448990.1664940; Wed, 14 Oct 2026 13:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGybo-0006sB-V0; Wed, 14 Oct 2026 13:01:28 +0000
Received: by outflank-mailman (input) for mailman id 1448990;
 Wed, 14 Oct 2026 13:01:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGybn-0006s3-Og
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 13:01:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGybm-00BSwC-Ud
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 15:01:26 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acf7d1d-e002-0a2a0a5209dd-0a2a4501804c-48
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 15:01:26 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acf7d26-5984-0a2a45010019-d155802ce9ec-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 15:01:26 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-49ff680331aso10989195e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 06:01:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0aaa5dbsm12376317f8f.12.2026.10.14.06.01.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2026 06:01:25 -0700 (PDT)
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
        d=suse.com; s=google; t=1791982886; x=1792587686; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ad8BiGbd56/98Ou5diYjrztGQdgtHVrz8EjnYsYECAc=;
        b=OXXriEbW1Pg1AHQXbpo6Wh1zF2b9o1Fn3ivVFn4LM+ldyf55Et20HIJBFcAUS0PUpZ
         fy2qsqd1OjYpuTMR6qmvI3sLnrYEq9uqsLN33/YU+j8dMZBwy42Y2hTmmluxWCPkwkom
         KXcWfqgcwG5aIv71YHVThzCvo+MC6kl2GW/vjW9dEeXHQJY7tywoiablQKISYvOkhhhz
         1py5bQNoUuXx0xaL2ZZ/oWY3vHoyTzuYq7RJRiQF31fYIKOnc0YLX+/cmDWQ77nmOxF8
         98w6abjXVM5A4feRPeGtZxqIloN7fIm6/N4bcQG+5dWU2o79tkZLNP6tjVqsXTFdd11h
         MfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982886; x=1792587686;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ad8BiGbd56/98Ou5diYjrztGQdgtHVrz8EjnYsYECAc=;
        b=r5Z1efruKEOdeR5lG/t7MvWyC7bEJx0tLeq9D54Di9lyqv2kwqSsRWT7RboYHzJ2hb
         /+P2G3IFkp9x18qB+MZT1dsrCCPvAks0bdBQ8dxN3kN5DJ/a8zQ8C9IW1kXbarEJzEMI
         XbcJVBLmmWoxV4Ax/jWaGjYaIYbKKPR3Lde6uG+OTURian5vBgZmofBL8P3Hg6yZaIH+
         2ACV+o49htW83IBk0/KpYItpOP1w2+Yd6GhGgF5us6fLZeiDlPTKxJpRdR6ZSE8eohLO
         XtboyzR0YvilcM33HTAYYEaXK6iIAt1j5RO55gxuqCE2RiBqK2yYQF8OjFhRMeN1fa3h
         EAow==
X-Gm-Message-State: AFq9FYKjuOsXM1RGb2ugdmbqEqAsl94KzPNmxAY0d25vTbRCdRv9YM71
	F+IENXN4gkOEaMg1CadRmq2kqF5qkaeGf3YIRYVB5LucbZM+mXt/QiuEFGBfx/nu+gDBcL+nWZm
	bxVQl5A==
X-Gm-Gg: AYBFou3L54Kw67BsWtheRm0sC8XBUWyM3wGtORtsuRGIzTIgsj8JS1H8AZARfDN4u/v
	RnP3yfNzd/c2IqC4cLtfw0GbuvOICXAYQPOYpAmhHlG5Kio1wbt4hg0wG/1LX8qazo7ISuUGjt6
	sMTZQdaCTednJeiUHqRRxkS6RNNWaifmfyB92LYTMZdgDKgQHiPy+DbrZpYoxcd74yx9uANmqcw
	J4ET2JioeIScZVRrlHBwE1OQXQtnH6LxVyP4Olq4STz9wQKlUEceFai0tLS/1I8f6oTGTgOvG0Y
	BQqN6bgyJajHcYI7lS4521hqtW/3HdBSL/utvON5bTxcpTWePQValRHz2EDPqc9hg5nd4sSiscq
	eQTSDUWOfZT1IOq1XOZ42nXWaDVayKhvs9Ju6QrJ6Pf9vDi450ieR++Yo1kwblLd75Q21MSkoJX
	KkBOKr4LjIu2kA/x1i7NjHjKp2HhK6/YwU+BlNVGSIzjoF+WtsIc96M+fjTnfU4PyXH+ISKupZd
	rC6dPOqTS7FwCs4qOl0CYhQl/Ehg16pV4poSY5u7lOFStZp33jx3xWvaQxwruo=
X-Received: by 2002:a05:600d:17:b0:4a1:9663:7639 with SMTP id 5b1f17b1804b1-4a196637a39mr221905375e9.34.1791982885740;
        Wed, 14 Oct 2026 06:01:25 -0700 (PDT)
Message-ID: <4fc90702-fb9a-4f96-88f0-35bd3b4857f4@suse.com>
Date: Wed, 14 Oct 2026 15:01:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 1/3] common: introduce "brk" allocator
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
References: <8ad3beb3-af5a-477b-af97-614edb22631a@suse.com>
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
In-Reply-To: <8ad3beb3-af5a-477b-af97-614edb22631a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1791982886-BF063757-E4A22E33/10/78276251493
X-purgate-type: spam
X-purgate-size: 8016

... to replace (on x86) ebmalloc(), and then to find further use(s) to
allow recovering memory which is needed very early (and hence needs
setting up statically), but may not fully be used (or not be used at all).

Note that unlike free_ebmalloc_unused_mem(), brk_free_unused() (once
other code is converted) will be able to free part of the BRK space even
in the xen.efi case on x86. That would happen if BRK space extends across
a 2Mb boundary, and actual use stops before that boundary.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Changing setup.c's reserve_e820_ram() uses would be cumbersome when done
right here. That'll be done when ebmalloc() is replaced, and hence
what's there can also simply be replaced.

When linking xen.efi, GNU ld prior to 2.46 produces a base relocation for
the reference to __subsystem__, which is wrong (that's an absolute symbol,
after all). That does no harm for our purposes, though.
---
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
@@ -0,0 +1,23 @@
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
+    asm ( ".weak __subsystem__; mov $__subsystem__, %0" : "=r" (subsys) );
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
@@ -0,0 +1,74 @@
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
+
+    if ( finished )
+        return NULL;
+
+    /* Allocations PAGE_SIZE and up will be page-aligned. */
+    if ( size >= PAGE_SIZE )
+        allocated = ROUNDUP(allocated, PAGE_SIZE);
+
+    ptr = __brk_start + allocated;
+
+    allocated += ROUNDUP(size, sizeof(void *));
+
+    if ( allocated > __bss_end - __brk_start )
+    {
+        printk_once_init(
+            "%pS: over-sized BRK request: %zu bytes\n",
+            __builtin_extract_return_addr(__builtin_return_address(0)),
+            size);
+        return NULL;
+    }
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
+#if __has_include(<asm/brk.h>)
+    start = brk_adjust_start(start);
+#endif
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


