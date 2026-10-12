Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E0FCA9EC5
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 08:23:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445939.1661821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBJW-0002Cc-Ta; Mon, 12 Oct 2026 08:23:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445939.1661821; Mon, 12 Oct 2026 08:23:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBJW-0002CV-Qp; Mon, 12 Oct 2026 08:23:18 +0000
Received: by outflank-mailman (input) for mailman id 1445939;
 Mon, 12 Oct 2026 08:23:17 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGBJV-0002CA-BF
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 08:23:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGBJU-008eBq-KM
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 10:23:16 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc98ef-2eae-0a2a0a5409dd-0a2a450ad9a4-22
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:23:16 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc98f4-f2d2-0a2a450a0019-d1558029a5ae-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:23:16 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a166199820so9628575e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 01:23:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf135fasm239176775e9.5.2026.10.12.01.23.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 01:23:15 -0700 (PDT)
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
        d=suse.com; s=google; t=1791793396; x=1792398196; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wrGgJRxfvckrAU7r760vA2zhmoEopAmIopsny2HpFJ0=;
        b=H0VYnK9hVu8PHONmHF8TVXLzb6GZOAa0ogxcaOSWmzn5fcvXvWkJlGI5feRg3jhiE4
         PnSCDDWT/MF/GRz6LXx0CynRwtKmA/nH+r/oMRazp4Jto3LzDreax929u0a/06jiJ/qE
         8sBn0aqisS2NhZOEuXRUu243iuwDt1MdbCC1GpuGd7kqyttXVBNGwUNAJ5oPz7D11VJS
         17CVkj8Fi/S+OyHr6ITtS/T8002pzsnnhOmpCLoJC87H+v9XBlfpzuISahR+ZbbmnCFc
         RWP0p3kNCHeysoJHGLSGjE8OYvgeam2Fw12dcdlDipLZBF33KkjH5HqCBOw2r6ABjbxs
         XNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791793396; x=1792398196;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wrGgJRxfvckrAU7r760vA2zhmoEopAmIopsny2HpFJ0=;
        b=PPEy7HWRK9h/UrAbUdRmJdhuRFEigPFrDFZEfZEPOlbpH693Nkywub0HW6SsU6kRYY
         BdA5cd1MkqI8UoikNMKcw7445tHsN68ooKnOUimeAThEtxjqS2XV30bxN1AMO/gUNqPC
         YqieGiWxlSaNb0bfK0i07LC6amQuDjpWB7Uu6IEqVS4S5ap4TOA+zuerdllkZQHQSYQM
         dicRUOHcU2I4gSUKx267sU0KbnJ8KJj124yeWiPXg18ft92TW6vSOs5evSycWJEXMPAH
         5nIaOVkrtJ7g7I9D9zCEl8uILBE20Iz+MseCmnBDmV6b877qYYNbjyKf0Ow7cqlRSCbn
         qllg==
X-Gm-Message-State: AFq9FYLftqyEzq9kxet/OZQ/Zb+oYu/GafV2Z0P6eCu+N15olgBzmHB+
	6NxWmWnJ3l2yMG9Lk8vZZz+AYlA3DYB1SAThmUpcp9ArbW+JRKyV7O1+F8XbvRLaLS06nhcyDQE
	fk1QLyQ==
X-Gm-Gg: AYBFou0yR0unxg7LhDDf5iOVUopywMDnv2DvIFldAozquq1hgxO0IHAVuR7Q1zQ+y9C
	IDgOizOSWja6X8xf383qJrjFinKxr3ihgP61hVyVrmrIJiwVRaJqV/pufTYaNthLfEI1+B3df9K
	dXge0nA9spgCYiKckPvPkXEF4Yh88mDXQPhGkJpvxuuiv578yg9cYJkrX2yEFfNXSx+B1Uqfrjv
	1oDnnJxacSCx8bhGk4M+OS7u/DxLuRbYn2T3v8K0pajfA3suRbesDQYMxdH01i9LrW+kGi8FE37
	0jo+q7R6nWvjlB8hOV2fOOoLY2TNdFWqv8cqEnCtftju6l0sdHzEfIneJwF5av34GaPMYBlPgu2
	y3+iie8V9udQZEzqIZijvOJmaxd+muf2pbZw+fImprkfQ393ARQ4EROMxW+zToZzET+pqUuT1Xd
	PuWR3buFc9QoerQMicvEtGkcrexVKpvVWzOSqTxMZizbEJ1F1hlvaKreRKuo5mVOP/iajhQNvJg
	8XqY+5jWUcopzNBKSVWwl8lDuiEmSrgdV58kqj8V2MnGZ4oJapqrZ99apahEvpNzGPvOnQv7Zc=
X-Received: by 2002:a05:600c:a011:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4a18e447d8bmr157832805e9.2.1791793395599;
        Mon, 12 Oct 2026 01:23:15 -0700 (PDT)
Message-ID: <d0f1a88b-66a0-4bf9-9dd2-ea0cc48bc3ae@suse.com>
Date: Mon, 12 Oct 2026 10:23:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 08/15] x86/PVH: split pvh_setup_acpi()
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
X-purgate-ID: tlsNG-4011c0/1791793396-508CDCFC-0C559DAB/10/78276251493
X-purgate-type: spam
X-purgate-size: 10375

All E820 manipulations want to happen before the initrd is placed, or else
pvh_steal_ram() may steal from the tail part of it. As a second step,
split placing ACPI data from actually populating it. To reuse size
calculations and limit churn, convert pvh_setup_acpi_{madt,xsdt}() to
two-pass functions: The 1st pass merely reserves space, while the 2nd pass
actually populates information.

While altering the copying of the RSDP pointer into Dom0's start-info, add
a BUILD_BUG_ON() making sure field sizes actually match up.

Fixes: 1d74282c455f ("x86: setup PVHv2 Dom0 ACPI tables")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -920,8 +920,9 @@ static int __init pvh_setup_acpi_madt(st
     int rc;
 
     /* Count number of interrupt overrides in the MADT. */
-    acpi_table_parse_madt(ACPI_MADT_TYPE_INTERRUPT_OVERRIDE,
-                          acpi_count_intr_ovr, UINT_MAX);
+    if ( !*addr )
+        acpi_table_parse_madt(ACPI_MADT_TYPE_INTERRUPT_OVERRIDE,
+                              acpi_count_intr_ovr, UINT_MAX);
 
     /* Calculate the size of the crafted MADT. */
     size = sizeof(*madt);
@@ -929,6 +930,22 @@ static int __init pvh_setup_acpi_madt(st
     size += sizeof(*intsrcovr) * acpi_intr_overrides;
     size += sizeof(*x2apic) * d->max_vcpus;
 
+    if ( !*addr )
+    {
+        /* Reserve space to place the new MADT in guest memory space. */
+        if ( pvh_steal_ram(d, size, 0, GB(4), addr) )
+        {
+            printk("Unable to steal guest RAM for MADT\n");
+            return -ENOMEM;
+        }
+
+        /* Mark this region as E820_ACPI. */
+        if ( pvh_add_mem_range(d, *addr, *addr + size, E820_ACPI) )
+            printk("Unable to add MADT region to memory map\n");
+
+        return 0;
+    }
+
     madt = xzalloc_bytes(size);
     if ( !madt )
     {
@@ -991,17 +1008,6 @@ static int __init pvh_setup_acpi_madt(st
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
@@ -1116,6 +1122,22 @@ static int __init pvh_setup_acpi_xsdt(st
      */
     size += num_tables * sizeof(xsdt->table_offset_entry[0]);
 
+    if ( !*addr )
+    {
+        /* Reserve space to place the new XSDT in guest memory space. */
+        if ( pvh_steal_ram(d, size, 0, GB(4), addr) )
+        {
+            printk("Unable to find guest RAM for XSDT\n");
+            return -ENOMEM;
+        }
+
+        /* Mark this region as E820_ACPI. */
+        if ( pvh_add_mem_range(d, *addr, *addr + size, E820_ACPI) )
+            printk("Unable to add XSDT region to memory map\n");
+
+        return 0;
+    }
+
     xsdt = xzalloc_bytes(size);
     if ( !xsdt )
     {
@@ -1179,17 +1201,6 @@ static int __init pvh_setup_acpi_xsdt(st
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
@@ -1205,18 +1216,18 @@ static int __init pvh_setup_acpi_xsdt(st
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
@@ -1239,6 +1250,8 @@ static int __init pvh_setup_acpi(struct
     /* Identity map ACPI e820 regions. */
     for ( i = 0; i < d->arch.nr_e820; i++ )
     {
+        unsigned long pfn, nr_pages;
+
         if ( d->arch.e820[i].type != E820_ACPI &&
              d->arch.e820[i].type != E820_NVS )
             continue;
@@ -1267,32 +1280,49 @@ static int __init pvh_setup_acpi(struct
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
+        printk("Unable to allocate guest RAM for RSDP\n");
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
+        printk("Unable to add RSDP region to memory map\n");
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
@@ -1302,19 +1332,27 @@ static int __init pvh_setup_acpi(struct
      * the native RSDT, and should not be used for the Dom0 kernel's boot
      * purposes (we keep it visible for post boot access).
      */
-    if ( pvh_steal_ram(d, sizeof(rsdp), 0, GB(4), &rsdp_paddr) )
+    native_rsdp = acpi_os_map_memory(acpi_os_get_root_pointer(), sizeof(rsdp));
+    if ( !native_rsdp )
     {
-        printk("Unable to allocate guest RAM for RSDP\n");
+        printk("Failed to map native RSDP\n");
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
@@ -1322,9 +1360,11 @@ static int __init pvh_setup_acpi(struct
     }
 
     /* Copy RSDP address to start_info. */
+    BUILD_BUG_ON(sizeof(info->rsdp) !=
+                 sizeof_field(struct hvm_start_info, rsdp_paddr));
     rc = hvm_copy_to_guest_phys(start_info +
                                 offsetof(struct hvm_start_info, rsdp_paddr),
-                                &rsdp_paddr,
+                                &info->rsdp,
                                 sizeof_field(struct hvm_start_info, rsdp_paddr),
                                 d->vcpu[0]);
     if ( rc )
@@ -1361,6 +1401,7 @@ int __init dom0_construct_pvh(const stru
     struct elf_binary elf;
     struct e820entry *orig_e820;
     unsigned int nr_orig_e820;
+    struct acpi_info acpi = {};
     int rc;
 
     printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", d->domain_id);
@@ -1414,6 +1455,13 @@ int __init dom0_construct_pvh(const stru
         return rc;
     }
 
+    rc = pvh_place_acpi(d, &acpi);
+    if ( rc )
+    {
+        printk("Failed to place Dom0 ACPI tables: %d\n", rc);
+        return rc;
+    }
+
     rc = pvh_populate_p2m(d, orig_e820, nr_orig_e820);
     if ( rc )
     {
@@ -1437,7 +1485,7 @@ int __init dom0_construct_pvh(const stru
         return rc;
     }
 
-    rc = pvh_setup_acpi(d, start_info);
+    rc = pvh_setup_acpi(d, &acpi, start_info);
     if ( rc )
     {
         printk("Failed to setup Dom0 ACPI tables: %d\n", rc);


