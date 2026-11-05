Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D78606D81A
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 13:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KjopbVO2
Received: from list by lists.xenproject.org with outflank-mailman.1474667.1681658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOxbG-0005mc-MY; Thu, 05 Nov 2026 13:33:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474667.1681658; Thu, 05 Nov 2026 13:33:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOxbG-0005mR-Jc; Thu, 05 Nov 2026 13:33:54 +0000
Received: by outflank-mailman (input) for mailman id 1474667;
 Thu, 05 Nov 2026 13:33:54 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOxbG-0005l0-6q
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 13:33:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOxbF-00E4OU-Ji
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 14:33:53 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec85ba-e002-0a2a0a5209dd-0a2a4506c6a8-14
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 14:33:53 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec85c1-195a-0a2a45060019-d1558032cd70-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 14:33:53 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a20bdaf39cso19875185e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 05:33:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b41297c0d3sm111256165e9.1.2026.11.05.05.33.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 05:33:50 -0800 (PST)
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
        d=suse.com; s=google; t=1793885633; x=1794490433; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T7Nq9uZ3jEvxZNv9g78qXVfRY8rIVXwVbnY0N5ssSvg=;
        b=KjopbVO2dmmgoq+rMUUiLOS3+WYm/BeHzNZw2fzNNbI7W/eIWi0lPJtC2Cwt/Xi+NH
         A6lGtqXUPYIdDGSF3Wm0xeYxp/V5Dme91dFmHeB/J05MfFf5T5/U5X5DeKesvPIg0N4S
         hRIZPLN8cAh5OfxV+CwNZhnO6nXowjHtFrPLBamIHbcXLLjpHpXtVNxK6t6yyfboc5Iq
         cdrthcBLy9R0Ya2ZYbhn0dJoIOEVCk7FqjZ0khX6CovNV6ixT7cQJMGdYblPoqpsN7xg
         aE2sfLCsxbSvGJAfgTY2WYKK71T1gkSg21udMQMPOOyPkbFGfXHMECrx7uuJGz7Cjryo
         NhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885633; x=1794490433;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T7Nq9uZ3jEvxZNv9g78qXVfRY8rIVXwVbnY0N5ssSvg=;
        b=VuAIs+tUDFwgy54YJpC6+9ZQJjSqHvi4m+61acNCRkjtqPNNznoMKR+RCmZdxT/Zls
         EKLEezEsNtNkbQObGeIC52YEQahrniDTXWoaEZ/H7QXk5eqTpkWd4Y85wRHLW/4/zDSy
         qkH2RzsY4NKIhhEuooWmWunVbbrWS2IEJlfq2zbPV5XVbxf8FK3x6ht2FpvvyYNeuP5p
         p8LL2qnG/UPFe3Oj8q8IlbacaPwBK1pcUgoUWb5hBEyC9i74jZQSxmIMVwkDfGhLA9aZ
         4wAOwvcQ6WpZ2Jli1V7ynwZdJ7BAiDunRxI/HtXNwOWCreitEH8xu3JQEvJeYPOS0GtD
         agqg==
X-Gm-Message-State: APuU4Z+ifjTNyw0OOJWnc0s572nljVGSfQAlt2pG1ftSRJnniBhJXJ8l
	y+bOMZJ2DEJX0qog57HV/Iu/txM2q7l6tVtNK2oi4jj+3shBY8QIUbyqptfne7l61q7t4GgO1yK
	obRzZ5g==
X-Gm-Gg: AYBFou3Io5Q4XSo3lkqLVo+61HeHrk2+5CWYvzmEfbpnBUe7ongh4CMz/DP43CWVNfZ
	+I+Zi2jpuuIQQiNLb7JjIy446vUEetz/TADlK0vJr6PB6m0l1e62Ob/5nk/329GmC46HLVf7OKN
	PgWzDo7WneRrmFF39YxXmbKuLo0bhcMplsK4a788v5504OdfAGT6sjaffPN1ETzHSPA2N0nLkzH
	45rE1ky0jPB1ewDRWbUvulyhijVohMs25SM4XCNmNCVky/rdFmZe9/vpSDf/csGATR6A3/oanKr
	Db3QkdOswFL97UJcR/hlzBhDrwnewyyDR5NX+uZdMoD/LAAp93E5SNxXayW6GxV6A6KUZzCb9YH
	AkqaKdD6kc/kD2vIJIoJyiEP8rGV/Ik1As8v2qJRbkDChPuMpA5iX7lD3/+Jpo2sw7fgEU8B1fG
	sjsnWYme1IGSwiQvVxjaJBNw3AjR3DDMD+e7AV30EpIiVBdutLXPf2yx7ZgqWIxnC91KiqqSBrx
	RpDkkDVzfmHt2u1nZ7Rs0jhJUbjDoOs7BCCQZmbgogG9dvXfEHW2uT59gdOGg4WLsZXOPcnD23y
	EVZpGOi4xkmxG3vnIwSK8zBvKv/rhdv/Eaci+MaSCKhhCxIFqvyqrOIrDLtGN1JeX0ME6e1bYL+
	qDkd9iEZQYV4lNM/u
X-Received: by 2002:a05:600c:a00a:b0:4a2:190f:cf6a with SMTP id 5b1f17b1804b1-4ac19802310mr424240255e9.35.1793885632776;
        Thu, 05 Nov 2026 05:33:52 -0800 (PST)
Message-ID: <839f9e5b-43ba-4cf2-9176-ce5ea51f9149@suse.com>
Date: Thu, 5 Nov 2026 14:33:50 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 04/14] x86/PVH: split pvh_load_kernel()
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
X-purgate-ID: tlsNG-16d1c6/1793885633-F74C977B-2C878843/10/78276251493
X-purgate-type: spam
X-purgate-size: 6931
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

All E820 manipulations want to happen before the initrd is placed. As a
first step, split placing the kernel from actually loading it. Then
placement of other data (ACPI, VMX) can be inserted between kernel
placement and P2M population (followed by the loading of the kernel).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Teddy Astie <teddy.astie@vates.tech>
---
If need be, moving the "elf" local variable to dom0_construct_pvh() could
of course further be split off. Just that this by itself doesn't make much
sense.
---
v2: Also log domain in new printk().

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
+        printk("%pd: failed to place kernel\n", d);
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


