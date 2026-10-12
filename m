Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E23CCA9EC5
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 08:25:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445960.1661857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBLq-00046R-5f; Mon, 12 Oct 2026 08:25:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445960.1661857; Mon, 12 Oct 2026 08:25:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBLq-00046I-26; Mon, 12 Oct 2026 08:25:42 +0000
Received: by outflank-mailman (input) for mailman id 1445960;
 Mon, 12 Oct 2026 08:25:41 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGBLp-000463-5q
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 08:25:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGBLo-005Nw8-Ik
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 10:25:40 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc9982-8faa-0a2a0a5109dd-0a2a4505d08c-14
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:25:40 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc9984-4cb1-0a2a45050019-d1558035cd23-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:25:40 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a022fee0caso13416615e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 01:25:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf2caf4sm299209375e9.10.2026.10.12.01.25.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 01:25:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1791793540; x=1792398340; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nPflYh9iV2cqTwtU0Ycr8SkIvuVGwONc8rRZZ7gFcoo=;
        b=aagVS14P1v3Hc2rxFb0qERnxKHZQtTtzDjyCMfqSd9inlQQswgfHRlQ8jlSofMTmvn
         evCyLSN5apamWDMD+wV5h0V0wnL9whEI1dexq0QowttFZefZiJHQZ03w/UmIuYahSehr
         e4feCf694tQOHWo9UVA/FOUmgL+8w7wQe06AICkUrj4iKIWzicDU5UmKNfSnSfGkFE3V
         42owcxHrxxqZ5+FPWq2fihm9OtmjSttgtE+lg9pSLKpPsmRr+YO+vmsF0G/zIgR6q2SV
         w61CZRh4YwgCQx+BEXVXIpj7zzdCd6xopFJ0+ccj2e2B3HEuIN6UDnhFqoRgzeUU9DXe
         2dCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791793540; x=1792398340;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nPflYh9iV2cqTwtU0Ycr8SkIvuVGwONc8rRZZ7gFcoo=;
        b=l0co/xxlPd4hIHGlXHPRcAt4hadai1UXfNXEJqqqbtEDPTOwZViFLNVH+m29GWTlos
         9rZ+/5BSfc/uilWxdqI1Jb7mTZcJU+HgZYwRs+wbP6Wq5pgpFAsbhDnAXgsYoboLsOTC
         X1KzMFXhJG6IW2qJmgE0oUQW7siMOKVy/6Imuf0dK1awy03MLYdCBgwZxFcveXaKbuRI
         o40ogT1zGmNdZwzMMa0tk5/VDjGH9SRsPLJ10a3y6SXRJBxL8xfv1FXuMBZGZA51QLcs
         12VRnmPv0zdF+F4zRaUtCZhh9Fw/s56JLOHFSNO14v+tktDy02mBn0lUC6ll3bLdKkYK
         tyIQ==
X-Gm-Message-State: AFq9FYKzIsnumIWuth1b8n0963P1DY+emCYGIn1IOZj/A/L7HLdFrFmD
	1LG7dIj3k3YfrmetaesjpWomy8yHdjhipyvgSYoC91eKsUIimfHzfGhEoJRxMMjZuPA+FNzhd1o
	TI6t7HQ==
X-Gm-Gg: AYBFou2Yul8iZjTpPP6rvasbjpWB6IRCiM4gm9uIa0snd0Y4aE3vPuUckDRbZp0i8bt
	wuhI7YE1ZQdQz5+5ythsH9dFJ2XOXj7s7mJgerekNYWnIJXy3Jx+d1Wkhou0+lOUganO96MAOdR
	DIp4/xJDtB2fFPCA/PL5jXaas+xjxm76wFDPyWE88r4agfNp6HuZHCEG/S2SFUom/ZcMTER3BE1
	yf0bRIulKkfWj0GfgoTDVi3612+1/Eor9CxxWDhOpElnM0NL4UEf61kPu6NyZAQ8nqbFwx2BnDN
	xSgTmK6hqnA+MV05THZw8UfPlu8fT5rNWlCppGLCHBKnSBJiEj/9K5eaiWUgiQK3M6w5qf7BYKE
	/yxgSxLmAEglDpDavthyDqENx+/JrXTXv6VK8mDK3boi13d8ii0t0Z7lQtMbGq2KKK0SWe6w8TO
	UYQJrRnZW5+qc80s8lxoRZFffWkP0VgX4yZE3QLDRY/F8Hac6n5iJR4lOiDkwA7+JdcPJJfzvE9
	AD2NtGvS0yf1fP3XuaJBylhBg+M7/fOqk5eo3qdFe1oCdAuwj/p8VB5T6nGaAQNj2QpTJp6
X-Received: by 2002:a05:600c:354a:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4a18e3ef23cmr156159795e9.0.1791793539659;
        Mon, 12 Oct 2026 01:25:39 -0700 (PDT)
Message-ID: <032c1cb0-55b8-489d-bcf4-4d4c14a590ae@suse.com>
Date: Mon, 12 Oct 2026 10:25:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 12/15] x86/PVH: heed the kernel in pvh_steal_ram()
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
X-purgate-ID: tlsNG-c201ff/1791793540-F58AE2A1-475A7483/10/78276251493
X-purgate-type: spam
X-purgate-size: 5992

While the function working downwards will typically result in no conflict
with the kernel range, there's no guarantee of that.

Fixes: 1d74282c455f ("x86: setup PVHv2 Dom0 ACPI tables")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -186,8 +186,12 @@ static int __init pvh_populate_memory_ra
 /* Steal RAM from the end of a memory region. */
 static int __init pvh_steal_ram(struct domain *d, unsigned long size,
                                 unsigned long align, paddr_t limit,
+                                const struct elf_binary *elf,
                                 paddr_t *addr)
 {
+    paddr_t kernel_start = (paddr_t)elf->dest_base & PAGE_MASK;
+    paddr_t kernel_end = ROUNDUP((paddr_t)elf->dest_base + elf->dest_size,
+                                 PAGE_SIZE);
     unsigned int i = d->arch.nr_e820;
 
     /*
@@ -203,6 +207,11 @@ static int __init pvh_steal_ram(struct d
             continue;
 
         *addr = (entry->addr + entry->size - size) & ~(align - 1);
+
+        /* Avoid kernel range, if this is the region it lives in. */
+        if ( *addr < kernel_end && *addr + size > kernel_start )
+            *addr = (kernel_start - size) & ~(align - 1);
+
         if ( *addr < entry->addr ||
              /* Don't steal from the low 1MB due to the copying done there. */
              *addr < MB(1) )
@@ -275,6 +284,7 @@ struct vmx_info {
 
 static int __init pvh_place_vmx_realmode_helpers(
     struct domain *d,
+    const struct elf_binary *elf,
     struct vmx_info *info)
 {
     paddr_t gaddr;
@@ -285,7 +295,7 @@ static int __init pvh_place_vmx_realmode
      * structure (which accounts for the first 104b) doesn't cross a page
      * boundary.
      */
-    if ( !pvh_steal_ram(d, HVM_VM86_TSS_SIZE, 128, GB(4), &gaddr) )
+    if ( !pvh_steal_ram(d, HVM_VM86_TSS_SIZE, 128, GB(4), elf, &gaddr) )
     {
         d->arch.hvm.params[HVM_PARAM_VM86_TSS_SIZED] =
             VM86_TSS_UPDATED | ((uint64_t)HVM_VM86_TSS_SIZE << 32) | gaddr;
@@ -300,7 +310,7 @@ static int __init pvh_place_vmx_realmode
         printk("Unable to allocate VM86 TSS area\n");
 
     /* Steal some more RAM for the identity page tables. */
-    if ( pvh_steal_ram(d, PAGE_SIZE, PAGE_SIZE, GB(4), &gaddr) )
+    if ( pvh_steal_ram(d, PAGE_SIZE, PAGE_SIZE, GB(4), elf, &gaddr) )
     {
         printk("Unable to find memory to stash the identity page tables\n");
         return -ENOMEM;
@@ -1157,7 +1167,10 @@ static int __init cf_check acpi_set_intr
     return 0;
 }
 
-static int __init pvh_setup_acpi_madt(struct domain *d, paddr_t *addr)
+static int __init pvh_setup_acpi_madt(
+    struct domain *d,
+    const struct elf_binary *elf,
+    paddr_t *addr)
 {
     struct acpi_table_madt *madt;
     struct acpi_table_header *table;
@@ -1182,7 +1195,7 @@ static int __init pvh_setup_acpi_madt(st
     if ( !*addr )
     {
         /* Reserve space to place the new MADT in guest memory space. */
-        if ( pvh_steal_ram(d, size, 0, GB(4), addr) )
+        if ( pvh_steal_ram(d, size, 0, GB(4), elf, addr) )
         {
             printk("Unable to steal guest RAM for MADT\n");
             return -ENOMEM;
@@ -1337,8 +1350,11 @@ static bool __init pvh_acpi_xsdt_table_a
             strncmp(sig, ACPI_SIG_FACS, ACPI_NAME_SIZE));
 }
 
-static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
-                                      paddr_t *addr)
+static int __init pvh_setup_acpi_xsdt(
+    struct domain *d,
+    paddr_t madt_addr,
+    const struct elf_binary *elf,
+    paddr_t *addr)
 {
     struct acpi_table_xsdt *xsdt;
     struct acpi_table_header *table;
@@ -1374,7 +1390,7 @@ static int __init pvh_setup_acpi_xsdt(st
     if ( !*addr )
     {
         /* Reserve space to place the new XSDT in guest memory space. */
-        if ( pvh_steal_ram(d, size, 0, GB(4), addr) )
+        if ( pvh_steal_ram(d, size, 0, GB(4), elf, addr) )
         {
             printk("Unable to find guest RAM for XSDT\n");
             return -ENOMEM;
@@ -1473,6 +1489,7 @@ struct acpi_info {
 
 static int __init pvh_place_acpi(
     struct domain *d,
+    const struct elf_binary *elf,
     struct acpi_info *info)
 {
     unsigned int i;
@@ -1529,15 +1546,15 @@ static int __init pvh_place_acpi(
         }
     }
 
-    rc = pvh_setup_acpi_madt(d, &info->madt);
+    rc = pvh_setup_acpi_madt(d, elf, &info->madt);
     if ( rc )
         return rc;
 
-    rc = pvh_setup_acpi_xsdt(d, info->madt, &info->xsdt);
+    rc = pvh_setup_acpi_xsdt(d, info->madt, elf, &info->xsdt);
     if ( rc )
         return rc;
 
-    if ( pvh_steal_ram(d, sizeof(struct acpi_table_rsdp), 0, GB(4),
+    if ( pvh_steal_ram(d, sizeof(struct acpi_table_rsdp), 0, GB(4), elf,
                        &info->rsdp) )
     {
         printk("Unable to allocate guest RAM for RSDP\n");
@@ -1565,11 +1582,11 @@ static int __init pvh_setup_acpi(
         .length = sizeof(rsdp),
     };
 
-    rc = pvh_setup_acpi_madt(d, &info->madt);
+    rc = pvh_setup_acpi_madt(d, NULL, &info->madt);
     if ( rc )
         return rc;
 
-    rc = pvh_setup_acpi_xsdt(d, info->madt, &info->xsdt);
+    rc = pvh_setup_acpi_xsdt(d, info->madt, NULL, &info->xsdt);
     if ( rc )
         return rc;
 
@@ -1707,7 +1724,7 @@ int __init dom0_construct_pvh(const stru
         return rc;
     }
 
-    rc = pvh_place_acpi(d, &acpi);
+    rc = pvh_place_acpi(d, &elf, &acpi);
     if ( rc )
     {
         printk("Failed to place Dom0 ACPI tables: %d\n", rc);
@@ -1725,7 +1742,7 @@ int __init dom0_construct_pvh(const stru
           */
          !vmx_unrestricted_guest(d->vcpu[0]) )
     {
-        rc = pvh_place_vmx_realmode_helpers(d, &vmx);
+        rc = pvh_place_vmx_realmode_helpers(d, &elf, &vmx);
         if ( rc )
             return rc;
     }


