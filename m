Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FA8606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 13:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=f5h2bqE2
Received: from list by lists.xenproject.org with outflank-mailman.1474693.1681687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOxcR-0007NN-IL; Thu, 05 Nov 2026 13:35:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474693.1681687; Thu, 05 Nov 2026 13:35:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOxcR-0007NG-DJ; Thu, 05 Nov 2026 13:35:07 +0000
Received: by outflank-mailman (input) for mailman id 1474693;
 Thu, 05 Nov 2026 13:35:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOxcP-0007Mt-IV
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 13:35:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOxcO-009qSu-RY
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 14:35:04 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec85ef-2eae-0a2a0a5409dd-0a2a4503d530-30
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 14:35:04 +0100
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec8608-fae8-0a2a45030019-d155802ab8d2-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 14:35:04 +0100
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4a5177d78c7so17301245e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 05:35:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b56ba6bc36sm73994885e9.0.2026.11.05.05.35.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 05:35:03 -0800 (PST)
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
        d=suse.com; s=google; t=1793885704; x=1794490504; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XpCmbNgO/MZ7F5Rzx8w1sv0eb+AM+ypq+lRrGobD9wM=;
        b=f5h2bqE2GFGqvN18qz0RCZRFN2aE8A9icyUOEGCzKPba0ikEBu5vDJtsJRnelJkA1Y
         001SnKFpUpFCnA87e2eQsIguOE77OTHLSCUYesaQFTQcTH+sudrqrDbXNYh7kPYPIvDe
         Jmyp+D4tuJ5AJi8QJHbu05ClnBnonb52wnfaZnHrrJ2oKiTpeCDLmW74Ory/5bysCBs1
         BMhUhB9hGDTioI5IXCGonySmwR0qy7aUVQe/0RMus+xP5sZ4050WOH1C0KBD79U3n/Am
         pAA1GtCPtIjP77O39tyQXZwP0zb9975I24JABfse9lF3ostA8MgnzzJ7hfw7m3iSgNLi
         rVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885704; x=1794490504;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XpCmbNgO/MZ7F5Rzx8w1sv0eb+AM+ypq+lRrGobD9wM=;
        b=HUm49OXwgXximWl+fcuOi6IJZRmTwKvGlWOVyP8gEHUKo7o2Ec0BM5GEas9Wc8BHoo
         BcFglaJfpxgUfOmgPrrQRkH018ZhnqdVxYgGFJwTh6y/DcfRnL3qAZdpxxgVS98PGtPa
         dKeM02ncG3INPt2WbveSBTC+1YxgqP/XtYNMFhHaoM3HQxrLpkz3d0oSbzvjS6w05C6h
         y3+6CcwS1EalZxPfkP70ApMlAQjJh9kZycI5jjn2F5oIobaLY4taoOS4XnYwHfvyzIUT
         ejamEW0ZMoNmArdg3xLBnRk1xPgdv1IeM4vyHcK1h5/e16sZsl/QVORWyhFDNWPiiYNC
         TOXA==
X-Gm-Message-State: APuU4Z9K5YNYsOsFgFmBY9NPuk3bQhkQBAd9MvU/VskS/zIIm+ZG3Pm+
	k8CJ8P/UZeeTlNpZOumTya+J5ueci48hRfo+LlGbT4nNpYf42b5WWdLJDgH47wQ94k46+Fo3te/
	4WNSajQ==
X-Gm-Gg: AYBFou0QHlRgA3xlSJ/KAVmNg53/cfeZ4Hq99/pwXuQv6R+dV6Q/JXw36Jze+/l3UVa
	ReGsbVnqPFZGz6CrWCwYaa2V/119DLskkCssSEkMcxSrrro/cBVO9QjsWmZY7Eld6HeIHD4xL6d
	PCQ5e2j+02ihPKH4onrn7QQXOIVEW/s83ehj8WC6CCakpmv5sDRBk23pbV32ZqJVlwRsmu5jFm1
	7ZJlEjHrccrFkmWiCXrtR5v5AFUITTRRYNloYUQv2QraD8uVluwdYFxDz97hofnaw8fK7E8SqxR
	cIIz+4yLRNSQ2AxIXVVqsXhqSnb2EKkzCTjYfXYBZWWCh4JYGx8ZogtQRSzDLDmdWyqKS1t1p39
	Lv+PcI+IXdAbF8up25TMAQJmZUVS/s2yB4V2OtHgNf9PByLMdXwrCbh5LYNkREYlGYQnohHP78l
	N77gA4XLXJ7DHOmkw7A8feCMqPkj2V/C9xtix1BVT9zpsGiF1tZgI5AdFfRfVCvXxN6qGIexNjh
	MIxxdI3EnhtkC7umXllO/ZPU7AgMX1qpsdwcfjxR5qyLA2e5LSE0tIdqWeAdGYDiVOQHOyS/GPq
	EImzKAYhgtmUhkVhARTwVQxPGmbj4v3y04khNwlyRCH5bN/au9EbOawBfxgbQQ0V/6LkOcIqPHk
	nmcQhoJQpWLQsWSzd
X-Received: by 2002:a05:600c:468c:b0:4a3:59c9:a750 with SMTP id 5b1f17b1804b1-4ac17d168bcmr429458455e9.9.1793885704152;
        Thu, 05 Nov 2026 05:35:04 -0800 (PST)
Message-ID: <ed85cd48-53de-470e-9a0f-c71d564429e0@suse.com>
Date: Thu, 5 Nov 2026 14:35:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 07/14] x86/PVH: split pvh_setup_acpi()
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
X-purgate-ID: tlsNG-33051d/1793885704-768FA4E9-657B38E2/10/78276251493
X-purgate-type: spam
X-purgate-size: 10309
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

All E820 manipulations want to happen before the initrd is placed, or else
pvh_steal_ram() may steal from the tail part of it. As a second step,
split placing ACPI data from actually populating it. To reuse size
calculations and limit churn, convert pvh_setup_acpi_{madt,xsdt}() to
two-pass functions: The 1st pass merely reserves space, while the 2nd pass
actually populates information.

Fixes: 1d74282c455f ("x86: setup PVHv2 Dom0 ACPI tables")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Also log domain in new/moved/altered printk()s. Don't add
    BUILD_BUG_ON() which is being removed again by a later change.

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -915,8 +915,9 @@ static int __init pvh_setup_acpi_madt(st
     int rc;
 
     /* Count number of interrupt overrides in the MADT. */
-    acpi_table_parse_madt(ACPI_MADT_TYPE_INTERRUPT_OVERRIDE,
-                          acpi_count_intr_ovr, UINT_MAX);
+    if ( !*addr )
+        acpi_table_parse_madt(ACPI_MADT_TYPE_INTERRUPT_OVERRIDE,
+                              acpi_count_intr_ovr, UINT_MAX);
 
     /* Calculate the size of the crafted MADT. */
     size = sizeof(*madt);
@@ -924,6 +925,22 @@ static int __init pvh_setup_acpi_madt(st
     size += sizeof(*intsrcovr) * acpi_intr_overrides;
     size += sizeof(*x2apic) * d->max_vcpus;
 
+    if ( !*addr )
+    {
+        /* Reserve space to place the new MADT in guest memory space. */
+        if ( pvh_steal_ram(d, size, 0, GB(4), addr) )
+        {
+            printk("%pd: unable to steal guest RAM for MADT\n", d);
+            return -ENOMEM;
+        }
+
+        /* Mark this region as E820_ACPI. */
+        if ( pvh_add_mem_range(d, *addr, *addr + size, E820_ACPI) )
+            printk("%pd: unable to add MADT region to memory map\n", d);
+
+        return 0;
+    }
+
     madt = xzalloc_bytes(size);
     if ( !madt )
     {
@@ -986,17 +1003,6 @@ static int __init pvh_setup_acpi_madt(st
     madt->header.checksum -= acpi_tb_checksum(ACPI_CAST_PTR(u8, madt), size);
 
     /* Place the new MADT in guest memory space. */
-    if ( pvh_steal_ram(d, size, 0, GB(4), addr) )
-    {
-        printk("Unable to steal guest RAM for MADT\n");
-        rc = -ENOMEM;
-        goto out;
-    }
-
-    /* Mark this region as E820_ACPI. */
-    if ( pvh_add_mem_range(d, *addr, *addr + size, E820_ACPI) )
-        printk("Unable to add MADT region to memory map\n");
-
     rc = hvm_copy_to_guest_phys(*addr, madt, size, d->vcpu[0]);
     if ( rc )
     {
@@ -1111,6 +1117,22 @@ static int __init pvh_setup_acpi_xsdt(st
      */
     size += num_tables * sizeof(xsdt->table_offset_entry[0]);
 
+    if ( !*addr )
+    {
+        /* Reserve space to place the new XSDT in guest memory space. */
+        if ( pvh_steal_ram(d, size, 0, GB(4), addr) )
+        {
+            printk("%pd: unable to find guest RAM for XSDT\n", d);
+            return -ENOMEM;
+        }
+
+        /* Mark this region as E820_ACPI. */
+        if ( pvh_add_mem_range(d, *addr, *addr + size, E820_ACPI) )
+            printk("%pd: unable to add XSDT region to memory map\n", d);
+
+        return 0;
+    }
+
     xsdt = xzalloc_bytes(size);
     if ( !xsdt )
     {
@@ -1174,17 +1196,6 @@ static int __init pvh_setup_acpi_xsdt(st
     xsdt->header.checksum -= acpi_tb_checksum(ACPI_CAST_PTR(u8, xsdt), size);
 
     /* Place the new XSDT in guest memory space. */
-    if ( pvh_steal_ram(d, size, 0, GB(4), addr) )
-    {
-        printk("Unable to find guest RAM for XSDT\n");
-        rc = -ENOMEM;
-        goto out;
-    }
-
-    /* Mark this region as E820_ACPI. */
-    if ( pvh_add_mem_range(d, *addr, *addr + size, E820_ACPI) )
-        printk("Unable to add XSDT region to memory map\n");
-
     rc = hvm_copy_to_guest_phys(*addr, xsdt, size, d->vcpu[0]);
     if ( rc )
     {
@@ -1200,18 +1211,18 @@ static int __init pvh_setup_acpi_xsdt(st
     return rc;
 }
 
-static int __init pvh_setup_acpi(struct domain *d, paddr_t start_info)
+struct acpi_info {
+    paddr_t madt;
+    paddr_t xsdt;
+    paddr_t rsdp;
+};
+
+static int __init pvh_place_acpi(
+    struct domain *d,
+    struct acpi_info *info)
 {
-    unsigned long pfn, nr_pages;
-    paddr_t madt_paddr, xsdt_paddr, rsdp_paddr;
     unsigned int i;
     int rc;
-    struct acpi_table_rsdp *native_rsdp, rsdp = {
-        .signature = ACPI_SIG_RSDP,
-        .revision = 2,
-        .length = sizeof(rsdp),
-    };
-
 
     /* Scan top-level tables and add their regions to the guest memory map. */
     for( i = 0; i < acpi_gbl_root_table_list.count; i++ )
@@ -1234,6 +1245,8 @@ static int __init pvh_setup_acpi(struct
     /* Identity map ACPI e820 regions. */
     for ( i = 0; i < d->arch.nr_e820; i++ )
     {
+        unsigned long pfn, nr_pages;
+
         if ( d->arch.e820[i].type != E820_ACPI &&
              d->arch.e820[i].type != E820_NVS )
             continue;
@@ -1262,32 +1275,49 @@ static int __init pvh_setup_acpi(struct
         }
     }
 
-    rc = pvh_setup_acpi_madt(d, &madt_paddr);
+    rc = pvh_setup_acpi_madt(d, &info->madt);
     if ( rc )
         return rc;
 
-    rc = pvh_setup_acpi_xsdt(d, madt_paddr, &xsdt_paddr);
+    rc = pvh_setup_acpi_xsdt(d, info->madt, &info->xsdt);
     if ( rc )
         return rc;
 
-    /* Craft a custom RSDP. */
-    native_rsdp = acpi_os_map_memory(acpi_os_get_root_pointer(), sizeof(rsdp));
-    if ( !native_rsdp )
+    if ( pvh_steal_ram(d, sizeof(struct acpi_table_rsdp), 0, GB(4),
+                       &info->rsdp) )
     {
-        printk("Failed to map native RSDP\n");
+        printk("%pd: unable to allocate guest RAM for RSDP\n", d);
         return -ENOMEM;
     }
-    memcpy(rsdp.oem_id, native_rsdp->oem_id, sizeof(rsdp.oem_id));
-    acpi_os_unmap_memory(native_rsdp, sizeof(rsdp));
-    rsdp.xsdt_physical_address = xsdt_paddr;
-    /*
-     * Calling acpi_tb_checksum here is a layering violation, but
-     * introducing a wrapper for such simple usage seems overkill.
-     */
-    rsdp.checksum -= acpi_tb_checksum(ACPI_CAST_PTR(u8, &rsdp),
-                                      ACPI_RSDP_REV0_SIZE);
-    rsdp.extended_checksum -= acpi_tb_checksum(ACPI_CAST_PTR(u8, &rsdp),
-                                               sizeof(rsdp));
+
+    /* Mark this region as E820_ACPI. */
+    if ( pvh_add_mem_range(d, info->rsdp,
+                           info->rsdp + sizeof(struct acpi_table_rsdp),
+                           E820_ACPI) )
+        printk("%pd: unable to add RSDP region to memory map\n", d);
+
+    return 0;
+}
+
+static int __init pvh_setup_acpi(
+    struct domain *d,
+    struct acpi_info *info,
+    paddr_t start_info)
+{
+    int rc;
+    struct acpi_table_rsdp *native_rsdp, rsdp = {
+        .signature = ACPI_SIG_RSDP,
+        .revision = 2,
+        .length = sizeof(rsdp),
+    };
+
+    rc = pvh_setup_acpi_madt(d, &info->madt);
+    if ( rc )
+        return rc;
+
+    rc = pvh_setup_acpi_xsdt(d, info->madt, &info->xsdt);
+    if ( rc )
+        return rc;
 
     /*
      * Place the new RSDP in guest memory space.
@@ -1297,19 +1327,27 @@ static int __init pvh_setup_acpi(struct
      * the native RSDT, and should not be used for the Dom0 kernel's boot
      * purposes (we keep it visible for post boot access).
      */
-    if ( pvh_steal_ram(d, sizeof(rsdp), 0, GB(4), &rsdp_paddr) )
+    native_rsdp = acpi_os_map_memory(acpi_os_get_root_pointer(), sizeof(rsdp));
+    if ( !native_rsdp )
     {
-        printk("Unable to allocate guest RAM for RSDP\n");
+        printk("%pd: failed to map native RSDP\n", d);
         return -ENOMEM;
     }
+    memcpy(rsdp.oem_id, native_rsdp->oem_id, sizeof(rsdp.oem_id));
+    acpi_os_unmap_memory(native_rsdp, sizeof(rsdp));
+    rsdp.xsdt_physical_address = info->xsdt;
 
-    /* Mark this region as E820_ACPI. */
-    if ( pvh_add_mem_range(d, rsdp_paddr, rsdp_paddr + sizeof(rsdp),
-                           E820_ACPI) )
-        printk("Unable to add RSDP region to memory map\n");
+    /*
+     * Calling acpi_tb_checksum here is a layering violation, but
+     * introducing a wrapper for such simple usage seems overkill.
+     */
+    rsdp.checksum -= acpi_tb_checksum(ACPI_CAST_PTR(u8, &rsdp),
+                                      ACPI_RSDP_REV0_SIZE);
+    rsdp.extended_checksum -= acpi_tb_checksum(ACPI_CAST_PTR(u8, &rsdp),
+                                               sizeof(rsdp));
 
     /* Copy RSDP into guest memory. */
-    rc = hvm_copy_to_guest_phys(rsdp_paddr, &rsdp, sizeof(rsdp), d->vcpu[0]);
+    rc = hvm_copy_to_guest_phys(info->rsdp, &rsdp, sizeof(rsdp), d->vcpu[0]);
     if ( rc )
     {
         printk("Unable to copy RSDP into guest memory\n");
@@ -1319,7 +1357,7 @@ static int __init pvh_setup_acpi(struct
     /* Copy RSDP address to start_info. */
     rc = hvm_copy_to_guest_phys(start_info +
                                 offsetof(struct hvm_start_info, rsdp_paddr),
-                                &rsdp_paddr,
+                                &info->rsdp,
                                 sizeof_field(struct hvm_start_info, rsdp_paddr),
                                 d->vcpu[0]);
     if ( rc )
@@ -1356,6 +1394,7 @@ int __init dom0_construct_pvh(const stru
     struct elf_binary elf;
     struct e820entry *orig_e820;
     unsigned int nr_orig_e820;
+    struct acpi_info acpi = {};
     int rc;
 
     printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", d->domain_id);
@@ -1410,6 +1449,13 @@ int __init dom0_construct_pvh(const stru
         return rc;
     }
 
+    rc = pvh_place_acpi(d, &acpi);
+    if ( rc )
+    {
+        printk("%pd: failed to place ACPI tables: %d\n", d, rc);
+        return rc;
+    }
+
     rc = pvh_populate_p2m(d, orig_e820, nr_orig_e820);
     if ( rc )
     {
@@ -1433,7 +1479,7 @@ int __init dom0_construct_pvh(const stru
         return rc;
     }
 
-    rc = pvh_setup_acpi(d, start_info);
+    rc = pvh_setup_acpi(d, &acpi, start_info);
     if ( rc )
     {
         printk("Failed to setup Dom0 ACPI tables: %d\n", rc);


