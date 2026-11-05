Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180C8606D815
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 13:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AVvMdPBb
Received: from list by lists.xenproject.org with outflank-mailman.1474649.1681650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOxaq-0005CL-FI; Thu, 05 Nov 2026 13:33:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474649.1681650; Thu, 05 Nov 2026 13:33:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOxaq-0005CD-Bw; Thu, 05 Nov 2026 13:33:28 +0000
Received: by outflank-mailman (input) for mailman id 1474649;
 Thu, 05 Nov 2026 13:33:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOxao-0005Am-64
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 13:33:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOxan-00ESLJ-JE
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 14:33:25 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec85a3-e002-0a2a0a5209dd-0a2a450b9b9c-12
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 14:33:25 +0100
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec85a5-b7e8-0a2a450b0019-d155dd2cb555-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 14:33:25 +0100
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-49231763f81so97060f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 05:33:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b433ebd278sm117146845e9.3.2026.11.05.05.33.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 05:33:24 -0800 (PST)
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
        d=suse.com; s=google; t=1793885605; x=1794490405; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sX6VGdCa/sWhS6op5NPZP97VCREu6kSDPuran2qHXj0=;
        b=AVvMdPBbQpZ9lyX7ZTfF8M7U4KwVGURlYyE8XWkdmlwkIFFdBIs/GHxtrQqk+caJSD
         yZfskhJHEwPuVTQmwOf4kXFtu3+3vtGWh5IlN98OvTsBq0nnFolU73L81GyutGEdliwt
         qUyqdIdKkT/Bj5MLoT0twU85eXoGkwSZhEANLJjzFbkyHJPzATCVvigovbVOjW77/cjS
         TK6gZuFOK/IzoKrZ3v4ZxHY1h1wIBFWHkds92oBBwp+Kg/d1eIjV8zmS+vSR7Ki/4mTJ
         jZw824zLeI0l5lKsoKKzn2pjMD0OfCvK5FNWdWjvoLqUAu6T1WCiy+jZdrs3QFBcKGLP
         Oi5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885605; x=1794490405;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sX6VGdCa/sWhS6op5NPZP97VCREu6kSDPuran2qHXj0=;
        b=1vQMPKSOefk+6mH+Y9rB7lyJCt3z9E8CQMelwRotLMmrK46YoO/RpxK5LHfFntczeh
         +VJdrK2HQmQPb5YG/4/VmShoU/bZ8C55mWHBXqT3UpT2j2WEynewAFgOc5AowOqrYVqs
         Rl50bDD4Gwq73NEhwDeRBgaWVhr1wuzusJs1HYxm5nEdSK9GCNQnHaw3QmWRTFY5ptvZ
         lt5/4j5iCJxH78RV/46nvoRcMtF/pN+FaEcjfm0LYSqoeKS6fpu9cnYKAj/SvI9dbO+1
         UMRIyRH6XPkaY4GPLN5hc9jB5QwZ9lH5GT9qIwaPEZ83ndFAhvoPlpvhM88tzC10PcNN
         uLqA==
X-Gm-Message-State: APuU4Z83DBGQl2AXRSYbqAbpYeyjtROXlbURMSPROUdPF9FC1Zh928TQ
	42sHOwvezbtgf3/ZzkN/7oGzXa5nM8eKbWm8YQ5mNq3+E4cLKfYD98pyCZ9xIJvkEaHyCwM8Uhb
	qMroFxg==
X-Gm-Gg: AYBFou1NPWLmaqoJpj7Z5EIK5ZVu76joZrTu4F1L36sWCoe1+p8wMaTjfREObURwRRi
	PgHM7QHkZvrUkF1vXxj2nFwXF703qH83i/yiVCFjeMz4BQE2wF6pCnxmR+EP75E5W87cLrpNQGH
	IQdRaGK85Fv4ev4PwRiThdGx4ikHxeUbpbNDmiOKygOxexBMZnw1c6bnTPsjnjPVtHnFF7BDmco
	G5Xcj4FAOpfK6849a1oc5g/HQdhM+ipOocd6E+939FtMmBoz7zR+TrMsCLXp7Yf0GOPwdNjo0Nn
	dDyiPusykTOL8wJ4pOG7xdf2tbpFlBOomfI71dbnVq7vCxYtvXmEyT920yj1FdJaYW/QWzn6X2Y
	RAZxw8Q29zGGe/8YqMn7wr8d1N+Pg2vQTYct4PB1i9Jcy9CPu4sIMHGGDVE62PzKuKUKDw0KOjb
	AE4OrMcObJVt7/CpkjqgKhmc/eZ8RxGQoqr1djOGtUh7P92yztWsksN68FlIzH98C4KUyUCip/p
	kfsWt8XsxQbHQKyAEwz8DMOlGGblr4YpuA/9lZzwOwDVkYw7P2KY3xGYTOALiiIymrKp7sJnY/Y
	Wl6I9THIMA+rpXtPfvwPOKBMVrGo2cryda1iTVedmvU9l9dZTJESXYeH7Gea2xNRHlk7Y7y+ELq
	OItqLy3QpoLHBpIq5v9fw7+0EcvgXy3iQU2OP5w==
X-Received: by 2002:a05:600c:4f86:b0:4a7:669c:c988 with SMTP id 5b1f17b1804b1-4ac18b7df2cmr444154455e9.23.1793885604650;
        Thu, 05 Nov 2026 05:33:24 -0800 (PST)
Message-ID: <2ad8d4fb-5256-4371-a21f-6b9886f1b3ae@suse.com>
Date: Thu, 5 Nov 2026 14:33:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 03/14] x86/setup: special treatment of initrd for PVH Dom0
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
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1793885605-18ECE9EA-58F97632/10/78276251493
X-purgate-type: spam
X-purgate-size: 7762
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Dealing with large initrd-s is problematic in two ways: We needlessly
copy around a large chunk of data, and our calculation of how much
memory to give Dom0 assumes the space taken by the initrd is actually
available at the time of populating Dom0's P2M.

As a first step, make effort during early boot to try to place the initrd
in a chunk of memory that's a multiple of 1Gb (or, if not available / not
possibly going to fit, in a chunk a multiple of 2Mb in size). This may
(but generally won't) result in more copying, which we simply need to
accept. Record (and use) the extra space allocated in (as) headroom, which
then needs accouting for in pvh_load_kernel().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Not being able to check bm->kind is of course not very nice. The field is
only set quite a bit later, and that setting can - afaict - not be moved
ahead of the call to xsm_multiboot_init().

The bumping of mask to L3's in __start_xen() may transiently breaks
booting of Dom0 with overly much memory assigned to it (with the improved
heuristic it doesn't on my test systems anymore, though). That'll be
resolved when the headroom space is properly dealt with (consumed into
Dom0, or freed). Therefore this patch and everything up to the one adding
the consuming code want committing together, or addition of that
conditional wants delaying until that later change.

Simply using nr_ram_pages()' return value is of course a pretty raw
estimate. We could e.g. also subtract Xen's image size and, perhaps more
relevant, an estimate of frame_table[].
---
v2: Re-instate lost loop continuation condition. Improve and explain
    heuristic for whether to look for a multi-Gb block of memory.

--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -445,6 +445,20 @@ unsigned long __init dom0_compute_nr_pag
     return nr_pages;
 }
 
+/*
+ * A simplistic sibling of dom0_compute_nr_pages(), for obtaining a very early
+ * estimate.
+ */
+unsigned long __init get_dom0_size(unsigned long avail)
+{
+    if ( CONFIG_DOM0_MEM[0] && !dom0_mem_set )
+        parse_dom0_mem(CONFIG_DOM0_MEM);
+
+    return get_memsize(memsize_gt_zero(&dom0_size) ? &dom0_size
+                                                   : &dom0_max_size,
+                       avail);
+}
+
 static void __init process_dom0_ioports_disable(struct domain *dom0)
 {
     unsigned long io_from, io_to;
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -653,7 +653,8 @@ static int __init pvh_load_kernel(
     void *image_base = bootstrap_map_bm(image);
     void *image_start = image_base + image->arch.headroom;
     unsigned long image_len = image->size;
-    unsigned long initrd_len = initrd ? initrd->size : 0;
+    unsigned long initrd_len =
+        initrd ? initrd->size - initrd->arch.headroom : 0;
     size_t cmdline_len = bd->cmdline ? strlen(bd->cmdline) + 1 : 0;
     const char *initrd_cmdline = NULL;
     struct elf_binary elf;
@@ -751,7 +752,8 @@ static int __init pvh_load_kernel(
 
     if ( initrd != NULL )
     {
-        rc = hvm_copy_to_guest_phys(last_addr, __va(initrd->start),
+        rc = hvm_copy_to_guest_phys(last_addr,
+                                    __va(initrd->start + initrd->arch.headroom),
                                     initrd_len, v);
         if ( rc )
         {
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -68,4 +68,6 @@ extern bool opt_dom0_verbose;
 extern bool opt_dom0_cpuid_faulting;
 extern bool opt_dom0_msr_relaxed;
 
+unsigned long get_dom0_size(unsigned long avail);
+
 #endif
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1023,6 +1023,26 @@ static unsigned long __init nr_ram_pages
     return nr_pages;
 }
 
+static __init bool fits_in_low_ram(unsigned long size, unsigned long align)
+{
+    size = ROUNDUP(size, align);
+
+    for ( unsigned int i = 0; i < e820.nr_map; ++i )
+    {
+        unsigned long start = ROUNDUP(e820.map[i].addr, align);
+        unsigned long end = ROUNDDOWN(e820.map[i].addr + e820.map[i].size,
+                                      align);
+
+        if ( e820.map[i].type != E820_RAM || start >= GB(4) )
+            continue;
+
+        if ( end > start && end - start >= size )
+            return true;
+    }
+
+    return false;
+}
+
 /*
  * Calculate the maximum possible size of the dom0 cmdline.  Pieces of the
  * dom0 cmdline optionally come from the bootloader directly, from Xen's
@@ -1613,6 +1633,60 @@ void asmlinkage __init noreturn __start_
             struct boot_module *bm = &bi->mods[j];
             unsigned long size = PAGE_ALIGN(bm->arch.headroom + bm->size);
 
+            /*
+             * For PVH Dom0 try to place the initrd in a full multi-Gb (or
+             * multi-2Mb) chunk, such that assigning the pages directly can
+             * be done while still using superpage mappings.
+             */
+            if ( opt_dom0_pvh && j == 1 /* bm->kind == BOOTMOD_RAMDISK */ )
+            {
+                /*
+                 * As we may come here more than once, and as bm->size includes
+                 * headroom after relocation, unlike above we need to subtract
+                 * headroom here.  (The only module with incoming non-zero
+                 * headroom is the kernel.)
+                 */
+                size = PAGE_ALIGN(bm->size - bm->arch.headroom);
+
+                /*
+                 * Heuristic, in an attempt to predict what will be decided
+                 * when actually loading (mapping) the initrd: There's no point
+                 * trying 1Gb mappings when Dom0 has less than 2Gb.  There's
+                 * also no point trying 1Gb mappings if the initrd fits in low
+                 * memory, but there's no contiguous 1G-aligned range available
+                 * there.
+                 */
+                if ( get_dom0_size(nr_ram_pages()) >= PFN_DOWN(GB(2)) &&
+                     (fits_in_low_ram(size, 1UL << L3_PAGETABLE_SHIFT) ||
+                      !fits_in_low_ram(size, PAGE_SIZE)) )
+                    mask = (1UL << L3_PAGETABLE_SHIFT) - 1;
+
+                for ( ; mask > PAGE_SIZE; mask >>= PAGETABLE_ORDER )
+                {
+                    if ( !(bm->start & mask) && bm->arch.relocated )
+                        break;
+
+                    end = e;
+                    do {
+                        end = consider_modules((s + mask) & ~mask, end & ~mask,
+                                               (size + mask) & ~mask, bi->mods,
+                                               bi->nr_modules + relocated, j);
+                    } while ( (end & mask) && end > s );
+
+                    if ( end <= s )
+                        continue;
+
+                    if ( highmem_start && end > highmem_start )
+                        break;
+
+                    size = (size + mask) & ~mask;
+                    bm->start += bm->arch.headroom;
+                    bm->size  -= bm->arch.headroom;
+                    bm->arch.headroom = size - PAGE_ALIGN(bm->size);
+                    goto move_module;
+                }
+            }
+
             if ( bm->arch.relocated )
                 continue;
 
@@ -1625,6 +1699,7 @@ void asmlinkage __init noreturn __start_
 
             if ( s < end && (bm->arch.headroom || (end - size) > bm->start) )
             {
+            move_module:
                 move_memory(end - size + bm->arch.headroom, bm->start, bm->size);
                 bm->start = (end - size);
                 bm->size += bm->arch.headroom;


