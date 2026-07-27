Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF1AC531D0
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 10:20:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371519.1619009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woIRT-0007lE-HQ; Mon, 27 Jul 2026 10:20:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371519.1619009; Mon, 27 Jul 2026 10:20:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woIRT-0007l7-Ed; Mon, 27 Jul 2026 10:20:15 +0000
Received: by outflank-mailman (input) for mailman id 1371519;
 Mon, 27 Jul 2026 10:20:13 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woIRR-0007kp-9Q
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 10:20:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woIRQ-000sPx-Az
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 12:20:12 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6730d3-bab6-0a2a0a5309dd-0a2a450c9838-24
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 12:20:12 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6730dc-f479-0a2a450c0019-d155dd36e01d-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 12:20:12 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-47f3b39f2a1so2094476f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 03:20:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85b9a596sm46797487f8f.4.2026.07.27.03.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2026 03:20:11 -0700 (PDT)
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
        d=suse.com; s=google; t=1785147612; x=1785752412; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FN7W45SrJHwi206FXCh2uedKhx/KQMiLh+IoEidA5MA=;
        b=JvlO8rTgRDXpiZ06aJC3RGCQagDpqY9Yi5jzd8WnIQ7o+GnRz9R2zccPU7/me9ABhO
         dl1GhLsrJT2tpOjoeBij3wLrF+hjYsCVd8OQq6tG0vqRI3+ovr7nfQumQBYm2tXWhVuD
         wWoni2lkCOqKgU/7pvWCMjzXxFUX18QqPPaxxx8ZZ5ZEM9hVoZu9mlWnesKfD1ngJQX7
         3ccHf12IxnL3rIr97dAE/O/zhW1Mnl1iQGpF5A4ZnLmEE5g2qhh+ZGNmfuiENbeZIIGr
         Ty7Pc5J6qozY0mIIJ44HPFkp6I5tulf4IGnOHnonYrz4jijfe37Ku/wbk92J1M7hft0U
         9u9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785147612; x=1785752412;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FN7W45SrJHwi206FXCh2uedKhx/KQMiLh+IoEidA5MA=;
        b=fxabuECFmBUP13/ffo1ptt+WXj58OFammGRAGGoXQR5CEmpGEaryUuUdGIJ1yK4Ee5
         HSsY+4SjhHajuqEiNkN7lW2UZgzDINHGALHz0khFwx0mten0jXJ8z1E4gxuL02PfiSLI
         YmvyI/VSORpVbzjJTDdtzGENS9AZ4osyEyORf7w50pGf1MvvsqC2jtFJHQHaUMa6/vYY
         JbuFgR0J9iqT88crHBUONL/RH4OcO0wLqxXEabY2BRgZqmj4Aj0EFi5To9oyPhFp9P/2
         sHqgHq0Zt1h/bhdhQyU/37WXMfdVml8K5RSDiGkqbkb7mgXkVEYY5zZ3FK1Grj+vZt9d
         A2nA==
X-Gm-Message-State: AOJu0YwFMe89Eto2Pg1O92t4DmXW+i43SOsWgHGt337oEKi3Nh+ScfMN
	uTqBVnVP6lPlw4Nv6FYc8z072gBfZ7F8yYTYWE6X6QS65syAHp0/zDxRqT/LAxMG6qIpCc7aPmc
	83nGG6Q==
X-Gm-Gg: AR+sD13NvrmX62KnsTmzYnxTWNOTwnq1btqACwApfV3NnUcYER6QYvu5eDnaxK9W7zy
	tHuW/dUzq6GqCLiruLeeHuqvJIOEWA2ZJ0vvrXy+N8Wy9Xdq+CReLDBJ2GqG1SYW5zy9cQlgi42
	BB/hFJ3uHTYAj4TGL8EousR/UJ80FIJzR1qmO5UVjxuFAbRkPK10z9SXR4dkhbd9aduQCnUA8yN
	r0wtL233f7sKUAT+vyTtHMsV4QHJLuhJMvfvkpyxgnPqViFwwA80z79t265AtcoIasS2OilzMeX
	76Iw46o+QrMJeasGlAx18aP325apILEQbv2lVeyWXDZAtV0Aa3UWADewNcHyf5xOSAg9BgspNan
	YXtGjYoz2GfdyFxOPm35B4pkMHLFp3EWYtia2FcJyu6urbBZNFBgHKjRNnAoqC0TZxzkNGszLK3
	bnBvlYWnf/qhGhD6MhtTY2aWk7kGtonPm+Rsc2I9ruJjfIRs1uWvtN81NlX+uDiGnH2g==
X-Received: by 2002:a05:6000:4903:b0:47f:93d8:f480 with SMTP id ffacd0b85a97d-47f9fea2d13mr9482811f8f.39.1785147611673;
        Mon, 27 Jul 2026 03:20:11 -0700 (PDT)
Message-ID: <98388998-c5c6-4991-8662-2b4bf25188f2@suse.com>
Date: Mon, 27 Jul 2026 12:20:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/3] x86/EFI: replace ebmalloc()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
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
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1785147612-03ED2A5B-FCB42320/0/0
X-purgate-type: clean
X-purgate-size: 11267

Use the new brk_alloc() instead, with ebmalloc() merely being a thin
wrapper.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
I'm not quite certain whether we ought to permit non-page-granular
reservations. The in-memory image being somewhat larger due to possibly
excessive padding isn't really a big problem, I think.
---
v2: Re-base.

--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -263,7 +263,7 @@ quiet_cmd_obj_init_o = INIT_O  $@
 define cmd_obj_init_o
     $(OBJDUMP) -h $< | while read idx name sz rest; do \
         case "$$name" in \
-        .*.local) ;; \
+        .*.local|.bss..brk*) ;; \
         .text|.text.*|.data|.data.*|.bss|.bss.*) \
             test $$(echo $$sz | sed 's,00*,0,') != 0 || continue; \
             echo "Error: size of $<:$$name is 0x$$sz" >&2; \
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -10,6 +10,7 @@
 #include <xen/vga.h>
 
 #include <asm/boot-helpers.h>
+#include <asm/brk.h>
 #include <asm/e820.h>
 #include <asm/edd.h>
 #include <asm/microcode.h>
@@ -119,6 +120,18 @@ static void __init relocate_trampoline(u
     reloc_trampoline64();
 }
 
+DEFINE_BRK(efi, MB(1));
+
+static void *__init ebmalloc(size_t size)
+{
+    void *ptr = brk_alloc(size);
+
+    if ( !ptr )
+        blexit(L"Out of BRK memory\r\n");
+
+    return ptr;
+}
+
 static void __init place_string(u32 *addr, const char *s)
 {
     char *alloc = NULL;
--- a/xen/arch/x86/efi/stub.c
+++ b/xen/arch/x86/efi/stub.c
@@ -41,12 +41,4 @@ void __init noreturn efi_multiboot2(EFI_
 
 void __init efi_init_memory(void) { }
 
-bool efi_boot_mem_unused(unsigned long *start, unsigned long *end)
-{
-    /* FIXME: Simplify once the call here with two NULLs goes away. */
-    if ( start || end )
-        *start = *end = (unsigned long)_end;
-    return false;
-}
-
 void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t l4e) { }
--- a/xen/arch/x86/include/asm/brk.h
+++ b/xen/arch/x86/include/asm/brk.h
@@ -2,6 +2,10 @@
 
 #include <xen/types.h>
 
+#define DEFINE_BRK(var, size) \
+    static char __section(".bss..brk.page_aligned") __aligned(PAGE_SIZE) \
+        __used var ## _brk_[size]
+
 void *brk_alloc(size_t size);
 unsigned long brk_get_unused_start(void);
 void brk_free_unused(void);
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -9,6 +9,8 @@ extern const char __2M_rodata_start[], _
 extern char __2M_init_start[], __2M_init_end[];
 extern char __2M_rwdata_start[], __2M_rwdata_end[];
 
+extern unsigned long brk_end;
+
 extern unsigned long xenheap_initial_phys_start;
 extern uint64_t boot_tsc_stamp;
 
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -31,6 +31,7 @@
 #include <asm/alternative.h>
 #include <asm/apic.h>
 #include <asm/bootinfo.h>
+#include <asm/brk.h>
 #include <asm/bzimage.h>
 #include <asm/cpu-policy.h>
 #include <asm/e820.h>
@@ -164,6 +165,8 @@ cpumask_t __read_mostly cpu_present_map;
 
 unsigned long __read_mostly xen_phys_start;
 
+unsigned long __ro_after_init brk_end;
+
 /* Only used in asm code and within this source file */
 char asmlinkage __section(".init.bss.stack_aligned") __aligned(STACK_SIZE)
     cpu0_stack[STACK_SIZE];
@@ -1141,7 +1144,6 @@ void asmlinkage __init noreturn __start_
     struct boot_info *bi;
     unsigned long nr_pages, raw_max_page;
     int i, j, bytes = 0;
-    unsigned long eb_start, eb_end;
     bool acpi_boot_table_init_done = false, relocated = false;
     bool vm_init_done = false;
     int ret;
@@ -1511,7 +1513,7 @@ void asmlinkage __init noreturn __start_
         /*
          * This needs to remain in sync with remove_xen_ranges() and the
          * respective reserve_e820_ram() invocation below. No need to
-         * query efi_boot_mem_unused() here, though.
+         * query brk_get_unused_start() here, though.
          */
         xen->start = virt_to_maddr(_stext);
         xen->size  = __2M_rwdata_end - _stext;
@@ -1654,18 +1656,11 @@ void asmlinkage __init noreturn __start_
     if ( !xen_phys_start )
         panic("Not enough memory to relocate Xen\n");
 
-    /* FIXME: Putting a hole in .bss would shatter the large page mapping. */
-    if ( using_2M_mapping() )
-        efi_boot_mem_unused(NULL, NULL);
-
     /* This needs to remain in sync with remove_xen_ranges(). */
-    if ( efi_boot_mem_unused(&eb_start, &eb_end) )
-    {
-        reserve_e820_ram(&boot_e820, __pa(_stext), __pa(eb_start));
-        reserve_e820_ram(&boot_e820, __pa(eb_end), __pa(__2M_rwdata_end));
-    }
-    else
-        reserve_e820_ram(&boot_e820, __pa(_stext), __pa(__2M_rwdata_end));
+    brk_end = brk_get_unused_start();
+    if ( using_2M_mapping() )
+        brk_end = PAGE_ALIGN_2M(brk_end);
+    reserve_e820_ram(&boot_e820, __pa(_stext), __pa(brk_end));
 
     /* Late kexec reservation (dynamic start address). */
     kexec_reserve_area();
@@ -2267,7 +2262,6 @@ __initcall(init_xen_cap_info);
 
 int __hwdom_init remove_xen_ranges(struct rangeset *r)
 {
-    paddr_t start, end;
     int rc;
 
     /* S3 resume code (and other real mode trampoline code) */
@@ -2289,26 +2283,10 @@ int __hwdom_init remove_xen_ranges(struc
         return rc;
 
     /* hypervisor .data + .bss */
-    if ( efi_boot_mem_unused(&start, &end) )
-    {
-        ASSERT(__pa(start) >= __pa(&__2M_rwdata_start));
-        rc = rangeset_remove_range(r, PFN_DOWN(__pa(&__2M_rwdata_start)),
-                                   PFN_DOWN(__pa(start) - 1));
-        if ( rc )
-            return rc;
-        ASSERT(__pa(end) <= __pa(&__2M_rwdata_end));
-        rc = rangeset_remove_range(r, PFN_DOWN(__pa(end)),
-                                   PFN_DOWN(__pa(&__2M_rwdata_end) - 1));
-        if ( rc )
-            return rc;
-    }
-    else
-    {
-        rc = rangeset_remove_range(r, PFN_DOWN(__pa(&__2M_rwdata_start)),
-                                   PFN_DOWN(__pa(&__2M_rwdata_end) - 1));
-        if ( rc )
-            return rc;
-    }
+    rc = rangeset_remove_range(r, PFN_DOWN(__pa(&__2M_rwdata_start)),
+                               PFN_DOWN(__pa(brk_end) - 1));
+    if ( rc )
+        return rc;
 
     return 0;
 }
--- a/xen/arch/x86/tboot.c
+++ b/xen/arch/x86/tboot.c
@@ -321,8 +321,6 @@ void tboot_shutdown(uint32_t shutdown_ty
     /* if this is S3 then set regions to MAC */
     if ( shutdown_type == TB_SHUTDOWN_S3 )
     {
-        unsigned long s, e;
-
         /*
          * Xen regions for tboot to MAC. This needs to remain in sync with
          * remove_xen_ranges().
@@ -336,16 +334,8 @@ void tboot_shutdown(uint32_t shutdown_ty
         g_tboot_shared->mac_regions[1].size = __2M_rodata_end - _stext;
         /* hypervisor .data + .bss */
         g_tboot_shared->mac_regions[2].start = (uint64_t)__pa(&__2M_rwdata_start);
-        g_tboot_shared->mac_regions[2].size = __2M_rwdata_end - __2M_rwdata_start;
-        if ( efi_boot_mem_unused(&s, &e) )
-        {
-            g_tboot_shared->mac_regions[2].size =
-                s - (unsigned long)__2M_rwdata_start;
-            g_tboot_shared->mac_regions[3].start = __pa(e);
-            g_tboot_shared->mac_regions[3].size =
-                (unsigned long)__2M_rwdata_end - e;
-            g_tboot_shared->num_mac_regions = 4;
-        }
+        g_tboot_shared->mac_regions[2].size =
+            brk_end - (unsigned long)__2M_rwdata_start;
 
         /*
          * MAC domains and other Xen memory
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1825,8 +1825,6 @@ void __init efi_init_memory(void)
         pte_attr_t prot;
     } *extra, *extra_head = NULL;
 
-    free_ebmalloc_unused_mem();
-
     if ( !efi_enabled(EFI_BOOT) )
         return;
 
--- a/xen/common/efi/ebmalloc.c
+++ /dev/null
@@ -1,74 +0,0 @@
-#include "efi.h"
-#include <xen/init.h>
-#include <xen/mm.h>
-
-#ifdef CONFIG_ARM
-/*
- * TODO: Enable EFI boot allocator on ARM.
- * This code can be common for x86 and ARM.
- * Things TODO on ARM before enabling ebmalloc:
- *   - estimate required EBMALLOC_SIZE value,
- *   - where (in which section) ebmalloc_mem[] should live; if in
- *     .bss.page_aligned, as it is right now, then whole BSS zeroing
- *     have to be disabled in xen/arch/arm/arm64/head.S; though BSS
- *     should be initialized somehow before use of variables living there,
- *   - use ebmalloc() in ARM/common EFI boot code,
- *   - call free_ebmalloc_unused_mem() somewhere in init code.
- */
-#define EBMALLOC_SIZE	MB(0)
-#else
-#define EBMALLOC_SIZE	MB(1)
-#endif
-
-static char __section(".bss.page_aligned") __aligned(PAGE_SIZE)
-    ebmalloc_mem[EBMALLOC_SIZE];
-static unsigned long __read_mostly ebmalloc_allocated;
-
-/* EFI boot allocator. */
-void __init *ebmalloc(size_t size)
-{
-    void *ptr = ebmalloc_mem + ebmalloc_allocated;
-
-    ebmalloc_allocated += ROUNDUP(size, sizeof(void *));
-
-    if ( ebmalloc_allocated > sizeof(ebmalloc_mem) )
-        blexit(L"Out of static memory\r\n");
-
-    return ptr;
-}
-
-bool efi_boot_mem_unused(unsigned long *start, unsigned long *end)
-{
-    /* FIXME: Drop once the call here with two NULLs goes away. */
-    if ( !start && !end )
-    {
-        ebmalloc_allocated = sizeof(ebmalloc_mem);
-        return false;
-    }
-
-    *start = (unsigned long)ebmalloc_mem + PAGE_ALIGN(ebmalloc_allocated);
-    *end = (unsigned long)ebmalloc_mem + sizeof(ebmalloc_mem);
-
-    return *start < *end;
-}
-
-void __init free_ebmalloc_unused_mem(void)
-{
-    unsigned long start, end;
-
-    if ( !efi_boot_mem_unused(&start, &end) )
-        return;
-
-    destroy_xen_mappings(start, end);
-
-#ifdef CONFIG_X86
-    /*
-     * By reserving the space early in the E820 map, it gets freed way before
-     * we make it here. Don't free the range a 2nd time.
-     */
-#else
-    init_xenheap_pages(__pa(start), __pa(end));
-#endif
-
-    printk(XENLOG_INFO "Freed %lukB unused BSS memory\n", (end - start) >> 10);
-}
--- a/xen/common/efi/efi-common.mk
+++ b/xen/common/efi/efi-common.mk
@@ -1,4 +1,4 @@
-EFIOBJ-y := boot.init.o pe.init.o ebmalloc.o runtime.o
+EFIOBJ-y := boot.init.o pe.init.o runtime.o
 EFIOBJ-$(CONFIG_COMPAT) += compat.o
 
 CFLAGS-y += -fshort-wchar
--- a/xen/common/efi/efi.h
+++ b/xen/common/efi/efi.h
@@ -48,10 +48,6 @@ void noreturn blexit(const CHAR16 *str);
 
 const CHAR16 *wmemchr(const CHAR16 *s, CHAR16 c, UINTN n);
 
-/* EFI boot allocator. */
-void *ebmalloc(size_t size);
-void free_ebmalloc_unused_mem(void);
-
 const void *pe_find_section(const void *image, const UINTN image_size,
                             const CHAR16 *section_name, UINTN *size_out);
 
--- a/xen/include/xen/efi.h
+++ b/xen/include/xen/efi.h
@@ -39,7 +39,6 @@ static inline bool efi_enabled(unsigned
 extern bool efi_secure_boot;
 
 void efi_init_memory(void);
-bool efi_boot_mem_unused(unsigned long *start, unsigned long *end);
 unsigned long efi_get_time(void);
 void efi_reset_system(bool warm);
 #ifndef COMPAT


