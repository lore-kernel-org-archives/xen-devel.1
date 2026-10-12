Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5A4CA9EC5
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 08:21:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445918.1661793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBHY-0000fe-29; Mon, 12 Oct 2026 08:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445918.1661793; Mon, 12 Oct 2026 08:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBHX-0000fX-VS; Mon, 12 Oct 2026 08:21:15 +0000
Received: by outflank-mailman (input) for mailman id 1445918;
 Mon, 12 Oct 2026 08:21:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGBHV-0000bZ-Qy
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 08:21:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGBHV-00B8Vx-7o
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 10:21:13 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc986a-bab6-0a2a0a5309dd-0a2a4503cc60-38
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:21:13 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc9879-fae8-0a2a45030019-d155dd35b410-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:21:13 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-48af27fe287so1350592f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 01:21:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9acf12bsm18695082f8f.46.2026.10.12.01.21.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 01:21:11 -0700 (PDT)
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
        d=suse.com; s=google; t=1791793273; x=1792398073; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uTkWmDigDdOyowJ4/rV8AMuW49VhKWzJFUPn6PZy8mI=;
        b=gJHvyo6LYRJ93cUay1J38G96BrjzCMZ6HlDmH8VT6ChbBOuMs+Alq/HiWaucdc+CEt
         zlafGHGqzajjpHAEvSsIBbuyCFw/kyKiFIEfH4tIBfCswkAooQa5zRmaNAFnJhDn+bBK
         NJwMxCgU7aBht+YGt8q5qlWIoo9uO/4VUWE0gS6ux9E1zstoXnGs3YcXHv/s/WJgTqpf
         bBNWFwt/YG7FymIUEwBfZ4wjI8frjwFIxrKR6VckqE02MCCLix8AD3PMorPPU46mJ5Of
         4lhiSqvlKftrA5H3jBNmo6gkxWdFYFRuyIzZ7zcI4WU0ASEAtc7AVsmDzpwmTC/PlC8i
         e7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791793273; x=1792398073;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uTkWmDigDdOyowJ4/rV8AMuW49VhKWzJFUPn6PZy8mI=;
        b=d8Cy/KdJsVcl/eSwEQ30e3wv64LrAcs1o2eLp/+akwtP18T2u5q/bn+QmQIRdyP01v
         GLxyMQg5Exq2F/HQXWOylYbbR+csUPlbugZNHt2xjw/usQVSObw7+2FEufjdTQsMvUlE
         +EVLFVvYBGBr2+Qbyp7W80JKXlYPxUL/iQlp01In1WLtS3FmNGyS9VocmVOgtchsvEmp
         HWdHjBcFOCzbeuz56LgRbYsl6nCHywTs9aIDe++37Z0hKxU5lYDGy7+XRDh1fzmEc2fd
         UDqGELbmwtQ5lYHUlzIknGuOBHYf2Taa+SZTJOrglk/xV9Qv2vk5jB7O9mOtueXENGvS
         /Uxg==
X-Gm-Message-State: AFq9FYJ0BLwO/POeiEm9elwSP2UHjKwOfaSIv+N9EaV+JpSBvECmw00n
	idZRs21vDQf9T3ruK0l1rzPRnayPC30q3OldlFKZlfLCvtkzj7zfm2xesPWv5Dyle1SWFQEFVxC
	UeztRTg==
X-Gm-Gg: AYBFou2o1KUoBtv0YG/MBCu1AJTaCcX/uyhsVIM9DGqjY/Nk5JiZkOzrqAIKG9mMXff
	c3KbU31ZSMswSgBDkecuv4OJa8lj1z/X7MVVzzncaywUNVpSvp7mLaJV9j2ZJ8YTAFpVnHesRRc
	le1akq1h660ErVD/HzrbeszBzf38btlwDPymYJLlg5q7EuiQSaYUHqKgypZ5lRvHQA/t36JkdZm
	AM6XP4pzrXPhLEFjfZ4mnl6y7KttffSicngckjfNjj/hRNVlg2SUEVi8jW/5y/djDGDcrxosv/8
	x9V+8KSY8BnF0NhQ1LhJzrX4qYjqsf2nNVBav7KdtS124AleW6CEe7t9zW6lXW+E40F6WFhjSC0
	FBJAA7RGqB9DaWaTAQ8zAlyiIGxy7+uB8G6D74W5ZV2xemCD4YpMdNhxhYDAu5kf210uK0Iaw+n
	ahKe14X0NZTeSHj7UiFusRDuuAzTluOqv3TIi3Y44fm8lnn8nj+d58V06C9XNJLEtB7RQ6AeB8R
	bjftzIn4dUpS6ttzRObPdU4lFFOFWGKqTcafmSMrfBdmuUZ0jkGJRw983RpsGbQKGeosL6/Tw==
X-Received: by 2002:a05:6000:40ce:b0:48d:bb54:77e7 with SMTP id ffacd0b85a97d-48dbb547b24mr16271468f8f.29.1791793272485;
        Mon, 12 Oct 2026 01:21:12 -0700 (PDT)
Message-ID: <3ff41e03-b30b-43c0-9a20-28cdd9ae30d0@suse.com>
Date: Mon, 12 Oct 2026 10:21:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 05/15] x86/PVH: split pvh_load_kernel()
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
X-purgate-ID: tlsNG-33051d/1791793273-766FB4E9-620E0EF0/10/78276251493
X-purgate-type: spam
X-purgate-size: 6834

All E820 manipulations want to happen before the initrd is placed. As a
first step, split placing the kernel from actually loading it. Then
placement of other data (ACPI, VMX) can be inserted between kernel
placement and P2M population (followed by the loading of the kernel).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
If need be, moving the "elf" local variable to dom0_construct_pvh() could
of course further be split off. Just that this by itself doesn't make much
sense.

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -644,26 +644,17 @@ static bool __init check_and_adjust_load
     return true;
 }
 
-static int __init pvh_load_kernel(
-    const struct boot_domain *bd, paddr_t *entry, paddr_t *start_info_addr)
+static int __init pvh_place_kernel(
+    const struct boot_domain *bd,
+    struct elf_binary *elf,
+    paddr_t *entry)
 {
     struct domain *d = bd->d;
     struct boot_module *image = bd->kernel;
-    struct boot_module *initrd = bd->initrd;
     void *image_base = bootstrap_map_bm(image);
     void *image_start = image_base + image->arch.headroom;
     unsigned long image_len = image->size;
-    unsigned long initrd_len =
-        initrd ? initrd->size - initrd->arch.headroom : 0;
-    size_t cmdline_len = bd->cmdline ? strlen(bd->cmdline) + 1 : 0;
-    const char *initrd_cmdline = NULL;
-    struct elf_binary elf;
     struct elf_dom_parms parms;
-    size_t extra_space;
-    paddr_t last_addr;
-    struct hvm_start_info start_info = { 0 };
-    struct hvm_modlist_entry mod = { 0 };
-    struct vcpu *v = d->vcpu[0];
     int rc;
 
     if ( (rc = bzimage_parse(image_base, &image_start, &image_len)) != 0 )
@@ -672,19 +663,19 @@ static int __init pvh_load_kernel(
         return rc;
     }
 
-    if ( (rc = elf_init(&elf, image_start, image_len)) != 0 )
+    if ( (rc = elf_init(elf, image_start, image_len)) != 0 )
     {
         printk("Unable to init ELF\n");
         return rc;
     }
     if ( opt_dom0_verbose )
-        elf_set_verbose(&elf);
-    elf_parse_binary(&elf);
-    if ( (rc = elf_xen_parse(&elf, &parms, true)) != 0 )
+        elf_set_verbose(elf);
+    elf_parse_binary(elf);
+    if ( (rc = elf_xen_parse(elf, &parms, true)) != 0 )
     {
         printk("Unable to parse kernel for ELFNOTES\n");
-        if ( elf_check_broken(&elf) )
-            printk("%pd kernel: broken ELF: %s\n", d, elf_check_broken(&elf));
+        if ( elf_check_broken(elf) )
+            printk("%pd kernel: broken ELF: %s\n", d, elf_check_broken(elf));
         return rc;
     }
 
@@ -697,20 +688,43 @@ static int __init pvh_load_kernel(
     if ( (rc = initdom_check_parms(d, &parms)) != 0 )
         return rc;
 
-    /* Copy the OS image and free temporary buffer. */
-    elf.dest_base = (void *)(parms.virt_kstart - parms.virt_base);
-    elf.dest_size = parms.virt_kend - parms.virt_kstart;
+    elf->dest_base = (void *)(parms.virt_kstart - parms.virt_base);
+    elf->dest_size = parms.virt_kend - parms.virt_kstart;
 
-    if ( !check_and_adjust_load_address(d, &elf, &parms) )
+    if ( !check_and_adjust_load_address(d, elf, &parms) )
         return -ENOSPC;
 
-    elf_set_vcpu(&elf, v);
-    rc = elf_load_binary(&elf);
+    *entry = parms.phys_entry;
+
+    return 0;
+}
+
+static int __init pvh_load_kernel(
+    const struct boot_domain *bd,
+    struct elf_binary *elf,
+    paddr_t *start_info_addr)
+{
+    struct domain *d = bd->d;
+    struct boot_module *initrd = bd->initrd;
+    unsigned long initrd_len =
+        initrd ? initrd->size - initrd->arch.headroom : 0;
+    size_t cmdline_len = bd->cmdline ? strlen(bd->cmdline) + 1 : 0;
+    const char *initrd_cmdline = NULL;
+    size_t extra_space;
+    paddr_t last_addr;
+    struct hvm_start_info start_info = { 0 };
+    struct hvm_modlist_entry mod = { 0 };
+    struct vcpu *v = d->vcpu[0];
+    int rc;
+
+    /* Copy the OS image and free temporary buffer. */
+    elf_set_vcpu(elf, v);
+    rc = elf_load_binary(elf);
     if ( rc < 0 )
     {
         printk("Failed to load kernel: %d\n", rc);
-        if ( elf_check_broken(&elf) )
-            printk("%pd kernel: broken ELF: %s\n", d, elf_check_broken(&elf));
+        if ( elf_check_broken(elf) )
+            printk("%pd kernel: broken ELF: %s\n", d, elf_check_broken(elf));
         return rc;
     }
 
@@ -724,7 +738,7 @@ static int __init pvh_load_kernel(
 
     if ( initrd )
     {
-        size_t initrd_space = elf_round_up(&elf, initrd_len);
+        size_t initrd_space = elf_round_up(elf, initrd_len);
 
         if ( initrd->arch.cmdline_pa )
         {
@@ -741,9 +755,9 @@ static int __init pvh_load_kernel(
             initrd = NULL;
     }
 
-    extra_space += elf_round_up(&elf, cmdline_len);
+    extra_space += elf_round_up(elf, cmdline_len);
 
-    last_addr = find_memory(d, &elf, extra_space);
+    last_addr = find_memory(d, elf, extra_space);
     if ( last_addr == INVALID_PADDR )
     {
         printk("Unable to find a memory region to load initrd and metadata\n");
@@ -763,7 +777,7 @@ static int __init pvh_load_kernel(
 
         mod.paddr = last_addr;
         mod.size = initrd_len;
-        last_addr += elf_round_up(&elf, initrd_len);
+        last_addr += elf_round_up(elf, initrd_len);
         if ( initrd_cmdline )
         {
             size_t len = strlen(initrd_cmdline) + 1;
@@ -796,7 +810,7 @@ static int __init pvh_load_kernel(
      * Round up to 32/64 bits (depending on the guest kernel bitness) so
      * the modlist/start_info is aligned.
      */
-    last_addr += elf_round_up(&elf, cmdline_len);
+    last_addr += elf_round_up(elf, cmdline_len);
 
     if ( initrd != NULL )
     {
@@ -820,7 +834,6 @@ static int __init pvh_load_kernel(
         return rc;
     }
 
-    *entry = parms.phys_entry;
     *start_info_addr = last_addr;
 
     return 0;
@@ -1338,6 +1351,7 @@ int __init dom0_construct_pvh(const stru
 {
     paddr_t entry, start_info;
     struct domain *d = bd->d;
+    struct elf_binary elf;
     int rc;
 
     printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", d->domain_id);
@@ -1375,6 +1389,13 @@ int __init dom0_construct_pvh(const stru
 
     iommu_hwdom_init(d);
 
+    rc = pvh_place_kernel(bd, &elf, &entry);
+    if ( rc )
+    {
+        printk("Failed to place Dom0 kernel\n");
+        return rc;
+    }
+
     rc = pvh_populate_p2m(d);
     if ( rc )
     {
@@ -1382,7 +1403,7 @@ int __init dom0_construct_pvh(const stru
         return rc;
     }
 
-    rc = pvh_load_kernel(bd, &entry, &start_info);
+    rc = pvh_load_kernel(bd, &elf, &start_info);
     if ( rc )
     {
         printk("Failed to load Dom0 kernel\n");


