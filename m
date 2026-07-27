Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A8AC53219
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 10:19:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371512.1619000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woIQa-0006Hl-8w; Mon, 27 Jul 2026 10:19:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371512.1619000; Mon, 27 Jul 2026 10:19:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woIQa-0006He-67; Mon, 27 Jul 2026 10:19:20 +0000
Received: by outflank-mailman (input) for mailman id 1371512;
 Mon, 27 Jul 2026 10:19:18 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woIQY-0006HO-IS
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 10:19:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woIQX-003Lf7-Ux
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 12:19:17 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a67309f-e002-0a2a0a5209dd-0a2a4502be9e-20
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 12:19:17 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6730a5-6ca4-0a2a45020019-d155802df099-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 12:19:17 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4953e04ef16so28290035e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 03:19:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496b4ee4504sm212578435e9.6.2026.07.27.03.19.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2026 03:19:17 -0700 (PDT)
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
        d=suse.com; s=google; t=1785147557; x=1785752357; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QQeKvAlM6SQzoqidXEVQvyJcj1pj7jbbJp3aYbBoUHY=;
        b=UQ/qK6fBxR40AuYVyHOrfsOiaj9RllNi6bem55H5IX5yyiWqO/bRYRUr36+zhssnvX
         zMiuz8IMRq9CQdOJJzip5fOhfXPHaFu9+pOLa+jyAiIw5W1Fet15MhXwuoZvSxo0yue4
         L2VkjLTv7WBbXNtFVfAWCNThD8tAcCJOv2NNJonGBzr0iqJIKgO0ob+98J4JCCdcepn5
         fvYj4nyGr4Mvqz8OtvAPb2v/AekxNvcG9qA0hL6GpRUnegVOoMZCXBRlUSsqVmVn7pHo
         7vJEm7OYj5QW60ojh7FHu9HZ/Lul9flmgFrnGmL3QoK8y3VH6c5g3USSjV1tF912Pk3e
         MBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785147557; x=1785752357;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QQeKvAlM6SQzoqidXEVQvyJcj1pj7jbbJp3aYbBoUHY=;
        b=C8J57QmBvXrrQV6cJ9am0Z+LMRe2Kprjc2Xji78e75fjviGdb/I6aM0AGauK4V7x/+
         N+etuMu2lVSmaYJ3pLRhzd03nQe5L3YrDkk49PyfzHbbAMUBm0/zBoPQBVxDp9DPAhDo
         oz9Lr2EUel1QUphFm9Kdnllw0/8vvej3t3OV2jiPqBAOxwzuLHVDLsvUFFkYxS/8p1Ta
         l6OVk5HSLf+f1TODyYg7vkbHgrFGqreQwFvfg0Jt1PtmIqRTap3YL5Gbxv1CMkvK4tyy
         WiREL1CBY3aIolIcMD2eRFDr9Zod9JDBJXgWTfBKlYotzkIDY6/g867I6a/dWb4f8seV
         mS5Q==
X-Gm-Message-State: AOJu0YxzFLGrxirsXs/apdagv/nClS6HDSF9w2g3uMwbpw7jWbxkOjIe
	CptqKLGD4i/imkDaVe7b5XKSOkqIH4iI6vRjaNncwCW0abgcGgYLsKvUQFOY/T7SaXmlGuDYhMw
	35BZzuQ==
X-Gm-Gg: AR+sD116Q1CICWs03T/nx3jjiOS1kyQubXbWAdGVlHByjf3c/0bEBlwW9JvRtMXYurR
	twohnGYID5MAXECrMUAjYJPhj9ae0HYQNhyl+6MFV17AeR1Wkb0OLV9fnBmWGAL2N+/+e2aheai
	vjMQJm/+eAS8+WSm4aEWhgkV8k2GZKh9aDeq1gXSSyswmmD89w7ZJ89AO0ETDaQ17zKqMebHrLa
	DkSXgOT/V2khtCcdU47zxOeAF0oOYxm0lw0Xgf3FiHwGCPm7z/RpchHVaUAUghUK6eCAWN9AqR3
	dt80CQ5GwQSI9oMxzupMkRaDlTfXz3d84bEXFdPZfMJK3oSAUDIPJO8xEzfV38naRcJPxqFx1aO
	7u1Fxp1SVpz6mVzyCMC0OPipkYVhxtpHrjaovN8D3N1clnAh6tAx/QINnqOFEpyd3bFk5movTxa
	2uStXRVQmy+HN3GgU3QKBrnlt4raIuwqyBAP7yzSmw3BH95JOI/6I1pq0OeyIJ2vusonOmluB0N
	TTx
X-Received: by 2002:a05:600c:1553:b0:493:e97c:216e with SMTP id 5b1f17b1804b1-496b5731987mr102856695e9.39.1785147557288;
        Mon, 27 Jul 2026 03:19:17 -0700 (PDT)
Message-ID: <f7e3cd68-f6de-4ada-87d9-1a5dff277b2f@suse.com>
Date: Mon, 27 Jul 2026 12:19:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/3] x86: introduce "brk" allocator
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <31ba7ff2-a42d-44aa-976c-17fbff44a56f@suse.com>
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
In-Reply-To: <31ba7ff2-a42d-44aa-976c-17fbff44a56f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1785147557-F10A02AC-A2151BDC/0/0
X-purgate-type: clean
X-purgate-size: 4281

... to replace ebmalloc(), and then to find further use(s) to allow
recovering memory which is needed very early (and hence needs setting up
statically), but may not fully be used (or not used at all).

Note that unlike free_ebmalloc_unused_mem(), brk_free_unused() (once
other code is converted) will be able to free part of the BRK space even
in the xen.efi case. That would happen if BRK space extends across a 2Mb
boundary, and actual use stops before that boundary.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Changing setup.c's reserve_e820_ram() uses would be cumbersome when done
right here. That'll be done when ebmalloc() is replaced, and hence
what's there can also simply be replaced.

The xen.efi detection may want separating out into a helper.

When linking xen.efi, ld produces a base relocation for the reference to
__subsystem__, which is wrong (that's an absolute symbol, after all).
While that will need fixing there, it does no harm for our purposes.

--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -1,4 +1,5 @@
 obj-bin-y += head.o
+obj-bin-y += brk.init.o
 obj-bin-y += built-in-32.o
 obj-bin-y += $(obj64)
 
--- /dev/null
+++ b/xen/arch/x86/boot/brk.c
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <xen/efi.h>
+#include <xen/lib.h>
+#include <xen/mm.h>
+#include <xen/page-defs.h>
+
+#include <asm/brk.h>
+
+extern char __brk_start[];
+extern const char __bss_end[];
+
+static unsigned long __initdata allocated;
+static bool __initdata finished;
+
+void *__init brk_alloc(size_t size)
+{
+    void *ptr = __brk_start + allocated;
+
+    if ( finished )
+        return NULL;
+
+    /* Allocations PAGE_SIZE and up will be page-aligned. */
+    if ( size >= PAGE_SIZE )
+        allocated = ROUNDUP(allocated, PAGE_SIZE);
+
+    allocated += ROUNDUP(size, sizeof(void *));
+
+    if ( allocated > __bss_end - __brk_start )
+        return NULL;
+
+    return ptr;
+}
+
+unsigned long __init brk_get_unused_start(void)
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
+    unsigned long start = brk_get_unused_start(),
+                  end = (unsigned long)__bss_end;
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
+    if ( start >= end )
+        return;
+
+    destroy_xen_mappings(start, PAGE_ALIGN_2M(end));
+
+    /*
+     * By reserving needed space early in the E820 map, excess space gets freed
+     * way before we make it here. Don't free the range a 2nd time.
+     */
+
+    printk(XENLOG_INFO "Freed %lukB unused BRK memory\n", (end - start) >> 10);
+}
--- /dev/null
+++ b/xen/arch/x86/include/asm/brk.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <xen/types.h>
+
+void *brk_alloc(size_t size);
+unsigned long brk_get_unused_start(void);
+void brk_free_unused(void);
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -321,7 +321,11 @@ SECTIONS
        __bss_start = .;
        *(.bss.page_aligned*)
        PERCPU_BSS
-       *(.bss .bss.*)
+       *(.bss .bss.[a-zA-Z0-9_]*)
+       . = ALIGN(PAGE_SIZE);
+       __brk_start = .;
+       *(.bss..brk.page_aligned*)
+       *(.bss..brk*)
        . = ALIGN(POINTER_ALIGN);
        __bss_end = .;
   } PHDR(text)
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -112,6 +112,7 @@
 #include <xen/vmap.h>
 #include <xen/xmalloc.h>
 
+#include <asm/brk.h>
 #include <asm/e820.h>
 #include <asm/fixmap.h>
 #include <asm/flushtlb.h>
@@ -338,6 +339,8 @@ void __init arch_init_memory(void)
 
     efi_init_memory();
 
+    brk_free_unused();
+
 #ifndef NDEBUG
     if ( highmem_start )
     {


