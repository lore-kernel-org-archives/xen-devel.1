Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5266ECA9EC5
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 08:20:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445912.1661785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBH1-0008V0-Rr; Mon, 12 Oct 2026 08:20:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445912.1661785; Mon, 12 Oct 2026 08:20:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBH1-0008Uq-OV; Mon, 12 Oct 2026 08:20:43 +0000
Received: by outflank-mailman (input) for mailman id 1445912;
 Mon, 12 Oct 2026 08:20:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGBH0-0008Uc-03
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 08:20:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGBGz-004g3v-Ck
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 10:20:41 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc9859-2eae-0a2a0a5409dd-0a2a450bedc8-0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:20:41 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc9859-b7e8-0a2a450b0019-d155dd30b495-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:20:41 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-48af27fe287so1350063f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 01:20:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9ade914sm16905502f8f.54.2026.10.12.01.20.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 01:20:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1791793241; x=1792398041; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X5vwWawFBiTfx1OYyOkPcGB9kPAiPFbLrv4Ssm0jEl8=;
        b=BYpKX9dvvAadksgNtMT3z3XoYXnX6iBK1qJ57UZYkvzUJnkc53RNHWZ1RcbIFJqoXD
         xA96vntFsG4M+/2bi9L0BuXzMXnFgLEQLQbspWcK9q9khNUMtZjd1nTEZPGPACTT4iH7
         rFeG79cIj19GtFlmhMXGKzb0zidBMaIlp3KBXJK5cEGAgix0IgGSI6+tbMlmzj4vCIOA
         t84G7EdNgor9x0LEwngX3UfSvqpdYieUBTY8EIkD2+aN4oRA77wsfqKydBBPz5Lkw2ol
         jkkk/Olnw6FmCq/IO+4Hm9Uk4DBBSOUBjv9Tx70wHRQYofDVKmhnANiypH1cVRx01BX4
         ifbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791793241; x=1792398041;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X5vwWawFBiTfx1OYyOkPcGB9kPAiPFbLrv4Ssm0jEl8=;
        b=S2lur/SJrUlFzhVWIIShoM0HxNwplueSQV6P4FZBTD+tV41R8N+dqd6QtuM7NKtzJc
         7+ypQ5kC0xGes1LjKbdseAcVoAMmo5kJVr3jhp4a6fhItuW22Y8X+VDpYJK/tnb3ZWT6
         sdpfTVEyGaO2SsNuE809xOMZNE9rS0WTO5yECWlU2K7GadzVxcjIyt2fbT8DUAh5CjQL
         XuqxW0ha0XpQkaVHA3o2LrRqZ7RHmuWDz1ONy+gCkU08xlwlSMuheCTmlzUgrvUhu/FO
         OkORU2dFIfwtJi1rFKSXl1sR6pi4SoHLbMy1zdhU0bhu6dWYHjtdlpsLo9MIR4d5LxzJ
         l5xA==
X-Gm-Message-State: AFq9FYL0XYQqJe8/g4Zl4s6EOIb+dopMti7ac8tjNcYzkQX1sT4AV0bN
	bPy1bk+1oBBU/42x6JZsTpzqaiGkxVmza011UGzL0BxTPMm98+P/EY9lHpenvQrSUqih5FBFxCn
	rzotCrw==
X-Gm-Gg: AYBFou3Vs2D/2PMBrsswDNedb+m6fHhRYIEGWJIJWxJCnPGf14u39Riqjk3PhSgn5km
	fVydlcrYYBuTbd0h8wL6j/pKyY37WllNHgTHNJbLMMEJP2SUgSNCZZBXUGJmea2JwvV2rrCOV82
	QnfOPL/xbH4Tm1xqE7JNxyPTOPPczhvQT8+K1g17qCcEHIdEcis6B/5PL0iyiPiJM101hUAnltp
	2F5q8fddOSzF1+z5MBV33zZni4cNvR0bpqFJ7ca84lq0uW4R+daGxFsQELX6x8xrOjwBkp1YiZx
	cggfLVGW6EYAsNUMTQfgltzQMFOcqBw3NIOdEh8UVv+R3D5RRQ/oAvS5kU7KjvKZMbkBYiDSjiS
	dY4SttWBnJ39RrIp5fNMd8viDjbB9rIpG6gwjZYgjEFWEZLZebMT1tbCwmWj0wC1nmLcXXyWVh2
	h00qlxTsyQb0Fc5x/Ze6jyUcVY1slvdgNgU+a5myLdVB/O1JrzSM7ZcZJkx4bTJfs5nMTdjM7Qc
	dO6VrkOFKoa3ovbwXfMMo+1aNqaGeIC0I3zyT+y8BSdyXphMA89mA/cVhaChjY=
X-Received: by 2002:a05:600c:3ba8:b0:4a0:174:579e with SMTP id 5b1f17b1804b1-4a18e4ab221mr186397255e9.28.1791793240572;
        Mon, 12 Oct 2026 01:20:40 -0700 (PDT)
Message-ID: <125982a7-f491-4a10-98e9-d31f9f3b6444@suse.com>
Date: Mon, 12 Oct 2026 10:20:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 04/15] x86/setup: special treatment of initrd for PVH Dom0
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
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
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1791793241-1A6DA9EA-1A5D5F54/10/78276251493
X-purgate-type: spam
X-purgate-size: 5686

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

The bumping of mask to L3's in __start_xen() transiently breaks booting of
Dom0 with overly much memory assigned to it. That'll be resolved when the
headroom space is properly dealt with (consumed into Dom0, or freed).
Therefore this patch and everything up to the one adding the consuming
code want committing together, or addition of that conditional wants
delaying until that later change.

Simply using nr_ram_pages()' return value is of course a pretty raw
estimate. We could e.g. also subtract Xen's image size and, perhaps more
relevant, an estimate of frame_table[].

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
@@ -1608,6 +1608,40 @@ void asmlinkage __init noreturn __start_
             struct boot_module *bm = &bi->mods[j];
             unsigned long size = PAGE_ALIGN(bm->arch.headroom + bm->size);
 
+            /*
+             * For PVH Dom0 try to place the initrd in a full multi-Gb (or
+             * multi-2Mb) chunk, such that assigning the pages directly can
+             * be done while still using superpage mappings.
+             */
+            if ( opt_dom0_pvh && j == 1 /* bm->kind == BOOTMOD_RAMDISK */ )
+            {
+                if ( get_dom0_size(nr_ram_pages()) >= PFN_DOWN(GB(2)) )
+                    mask = (1UL << L3_PAGETABLE_SHIFT) - 1;
+
+                for ( ; mask > PAGE_SIZE; mask >>= PAGETABLE_ORDER )
+                {
+                    if ( !(bm->start & mask) && bm->arch.relocated )
+                        break;
+
+                    size = PAGE_ALIGN(bm->size - bm->arch.headroom);
+                    end = e;
+                    do {
+                        end = consider_modules((s + mask) & ~mask, end & ~mask,
+                                               (size + mask) & ~mask, bi->mods,
+                                               bi->nr_modules + relocated, j);
+                    } while ( (end & mask) && end > s );
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
 
@@ -1620,6 +1654,7 @@ void asmlinkage __init noreturn __start_
 
             if ( s < end && (bm->arch.headroom || (end - size) > bm->start) )
             {
+            move_module:
                 move_memory(end - size + bm->arch.headroom, bm->start, bm->size);
                 bm->start = (end - size);
                 bm->size += bm->arch.headroom;


