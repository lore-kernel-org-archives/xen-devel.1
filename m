Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C875CC6B1A
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 13:02:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448994.1664950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGych-0007K6-FE; Wed, 14 Oct 2026 13:02:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448994.1664950; Wed, 14 Oct 2026 13:02:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGych-0007Jz-CU; Wed, 14 Oct 2026 13:02:23 +0000
Received: by outflank-mailman (input) for mailman id 1448994;
 Wed, 14 Oct 2026 13:02:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGycf-0007Jl-Vy
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 13:02:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGycf-00CF8l-Ch
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 15:02:21 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acf7d56-2eae-0a2a0a5409dd-0a2a4506b48e-24
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 15:02:21 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acf7d5d-195a-0a2a45060019-d155dd35dce0-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 15:02:21 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-48c5358fc28so375890f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 06:02:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0bc506asm12256603f8f.47.2026.10.14.06.02.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2026 06:02:19 -0700 (PDT)
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
        d=suse.com; s=google; t=1791982941; x=1792587741; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FEcDM12NwGn05VrFecyuXD7d11qyEb4DovUBu5I+7Oc=;
        b=Fu5u6XbSZPaQ91xW9brl8jvOVH4D3Fb/bs9H75S5sMrllTEVFlb/4iD+EtoR9ldwKl
         TflzftS0Md//clnVCav/Vo5B0qiqwj26sz1kMxm13+ME51t8Z8ilnq6HaQuCG4J9zCqx
         0dKC3nWNQ2CI4vHiOV6o71bF3ktUyeg0A4T4Zbsc1ImO27eCYzLoq7MzYUG8w5817M0q
         scMeqra1idTO8ynRnb0ovMFWkRqskqfgSRWRwvdWCJIqBm2L127TGGtfaCYlYTGFulif
         34Wb39et8lTGuAB3RBHhiMPBxgDOmpWDsVdSGoPoMNCtXE/xfyLHh7syLzH+ba9lx4kZ
         eYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982941; x=1792587741;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FEcDM12NwGn05VrFecyuXD7d11qyEb4DovUBu5I+7Oc=;
        b=vGkZ0b74L+gPO6GLHCDqJ9OuYd7qFrTUQ+dkponul9UROxyVJhp6+gnGRjaEP/nv4k
         1iZT9tdOz5khFibMnF6BNePkckMiJO8QIIOpO+6NtF1OpU1IKTGTtkXNJdPDlmkMakFZ
         0Pz9sgABcxpagNmcm2Wo7+SSmcKSJMWZXT8jlLbfQ18hMRe/wy7mWxXJJwIK5O21uMxw
         jHSMvtULlVDR9yMX69Ny5ShpHVCfPHbviQ7zVOLXJJtyXVlAVHXVvZw7JXt/9veW5jCk
         MtmM2Rq3RqZ+voIVFSjUdUd3iTRiQqopvZX5DluSpdUy1LGmfdHTgrt/ZY+Z2IvvCoN4
         q0jQ==
X-Gm-Message-State: AFq9FYIm8TrS28i6j7ZHL/6rbHGAvCoBf71kyrGYcJ2+Kq+OKfYPuDd/
	TKnFS7kQzDromL7pQ5SKvvgV/mkMyh8lDCaV/DVJ3qrhBJ1OO97M9qBHn7xmvVSJVrEJZertZjG
	aDhcSzg==
X-Gm-Gg: AYBFou1zEV4HnFpd/bQcuOSMOPpir1TD70tYxPQdocVvLVw/axGrDcAsWsYfqsDfJWW
	E8QlxDX3A4EOII8tphQcplI64JM+4qkhrOovQ0S4u82qBMOTdRgp6bzXeD1eHlj9jl+cYWarFtd
	4qYSnoYEYY3Lezwhnm3Wzmr2nYPIpZqCeVmHMrHvzSYSXK6KMw6NCRBPrUd1Ug/f4lTnbIzEGzA
	ODvW6PdBx1NqB49OGF6Xs3zCtDg4cN08Lde7In5Htsv26dgUIjUMnapZ0f7X2RaRdBtBzHmeddJ
	WeaKhS8SDo4edAB6CwDJIc2WfMHBTOzSZXM7QHiFgBPaisK/ZyqMU5sfJmgOLJAKPY24mZ5kLI0
	zhNuR80zcVrCwcpdF3Tej2MdN6TFz4FOmcO8H2h968yZHs2fE2qs/O4kpsnHn63zr3ovFOk1C61
	9qcAvVF5FVnqYVnn/lWmnCpzqop4MwkmgayOK33X55opGZQiiBujbJfENpeLhT8Ogalkg1Qwr+I
	mEWst+GZiw+8eoU1BiGx0wAcq6d4fyoXoo/QIugDI7FM6aX/49mG3QVUq5rpYF3
X-Received: by 2002:a5d:6f18:0:b0:48d:f14a:9174 with SMTP id ffacd0b85a97d-48df14a925amr288746f8f.13.1791982940714;
        Wed, 14 Oct 2026 06:02:20 -0700 (PDT)
Message-ID: <fad32299-b01c-402d-b104-41bfb98d59c6@suse.com>
Date: Wed, 14 Oct 2026 15:02:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 2/3] x86/EFI: replace ebmalloc()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
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
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1791982941-FC80577B-2F385E8C/10/78276251493
X-purgate-type: spam
X-purgate-size: 11144

Use the new brk_alloc() instead, with ebmalloc() merely being a thin
wrapper.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
I'm not quite certain whether we ought to permit non-page-granular
reservations. The in-memory image being somewhat larger due to possibly
excessive padding isn't really a big problem, I think.
---
v3: Re-base, in particular over moving of brk.c to common/.
v2: Re-base.

--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -263,7 +263,7 @@ quiet_cmd_obj_init_o = INIT_O  $@
 define cmd_obj_init_o
     $(OBJDUMP) -h $< | while read idx name sz rest; do \
         case "$$name" in \
-        .*.local|.data.rel.ro|.data.rel.ro.*) ;; \
+        .*.local|.data.rel.ro|.data.rel.ro.*|.bss..brk*) ;; \
         .text|.text.*|.data|.data.*|.bss|.bss.*) \
             test $$(echo $$sz | sed 's,00*,0,') != 0 || continue; \
             echo "Error: size of $<:$$name is 0x$$sz" >&2; \
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -7,6 +7,7 @@
 #ifndef X86_EFI_EFI_BOOT_H
 #define X86_EFI_EFI_BOOT_H
 
+#include <xen/brk.h>
 #include <xen/vga.h>
 
 #include <asm/boot-helpers.h>
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
@@ -1,6 +1,7 @@
 #include <xen/acpi.h>
 #include <xen/alternative-call.h>
 #include <xen/bitops.h>
+#include <xen/brk.h>
 #include <xen/console.h>
 #include <xen/cpu.h>
 #include <xen/cpuidle.h>
@@ -164,6 +165,8 @@ cpumask_t __read_mostly cpu_present_map;
 
 unsigned long __read_mostly xen_phys_start;
 
+unsigned long __ro_after_init brk_end;
+
 /* Only used in asm code and within this source file */
 char asmlinkage __section(".init.bss.stack_aligned") __aligned(STACK_SIZE)
     cpu0_stack[STACK_SIZE];
@@ -1152,7 +1155,6 @@ void asmlinkage __init noreturn __start_
     struct boot_info *bi;
     unsigned long raw_max_page;
     int i, j, bytes = 0;
-    unsigned long eb_start, eb_end;
     bool acpi_boot_table_init_done = false, relocated = false;
     bool vm_init_done = false;
     int ret;
@@ -1518,7 +1520,7 @@ void asmlinkage __init noreturn __start_
         /*
          * This needs to remain in sync with remove_xen_ranges() and the
          * respective reserve_e820_ram() invocation below. No need to
-         * query efi_boot_mem_unused() here, though.
+         * query brk_cease() here, though.
          */
         xen->start = virt_to_maddr(_stext);
         xen->size  = __2M_rwdata_end - _stext;
@@ -1662,20 +1664,12 @@ void asmlinkage __init noreturn __start_
     if ( !xen_phys_start )
         panic("Not enough memory to relocate Xen\n");
 
-    /* FIXME: Putting a hole in .bss would shatter the large page mapping. */
-    if ( using_2M_mapping() )
-        efi_boot_mem_unused(NULL, NULL);
-
     /* This needs to remain in sync with remove_xen_ranges(). */
-    if ( efi_boot_mem_unused(&eb_start, &eb_end) )
-    {
-        if ( !reserve_e820_ram(&boot_e820, __pa(_stext), __pa(eb_start)) ||
-             !reserve_e820_ram(&boot_e820, __pa(eb_end), __pa(__2M_rwdata_end)) )
-            panic("Failed to reserve Xen in E820\n");
-    }
-    else
-        if ( !reserve_e820_ram(&boot_e820, __pa(_stext), __pa(__2M_rwdata_end)) )
-            panic("Failed to reserve Xen in E820\n");
+    brk_end = brk_cease();
+    if ( using_2M_mapping() )
+        brk_end = PAGE_ALIGN_2M(brk_end);
+    if ( !reserve_e820_ram(&boot_e820, __pa(_stext), __pa(brk_end)) )
+        panic("Failed to reserve Xen in E820\n");
 
     /* Late kexec reservation (dynamic start address). */
     kexec_reserve_area();
@@ -2272,7 +2266,6 @@ __initcall(init_xen_cap_info);
 
 int __hwdom_init remove_xen_ranges(struct rangeset *r)
 {
-    paddr_t start, end;
     int rc;
 
     /* S3 resume code (and other real mode trampoline code) */
@@ -2294,26 +2287,10 @@ int __hwdom_init remove_xen_ranges(struc
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
@@ -1830,8 +1830,6 @@ void __init efi_init_memory(void)
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


