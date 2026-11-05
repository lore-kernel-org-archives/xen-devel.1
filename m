Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09F2606A330
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 13:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XLHxxp6l
Received: from list by lists.xenproject.org with outflank-mailman.1474673.1681668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOxbY-0006Cj-U8; Thu, 05 Nov 2026 13:34:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474673.1681668; Thu, 05 Nov 2026 13:34:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOxbY-0006Cc-Qg; Thu, 05 Nov 2026 13:34:12 +0000
Received: by outflank-mailman (input) for mailman id 1474673;
 Thu, 05 Nov 2026 13:34:12 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOxbY-0006B7-4x
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 13:34:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOxbX-00E4XL-He
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 14:34:11 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec85c8-e002-0a2a0a5209dd-0a2a450ac31c-28
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 14:34:11 +0100
Received: from [209.85.218.50] (helo=mail-ej1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec85d3-f2d2-0a2a450a0019-d155da32d411-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 14:34:11 +0100
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-c4322d310e7so31676366b.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 05:34:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d0e444950sm179757666b.40.2026.11.05.05.34.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 05:34:10 -0800 (PST)
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
        d=suse.com; s=google; t=1793885651; x=1794490451; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XhVMm7OWGM53YPwY0RwS/WYkkxI/DMxC9jQTrfPSs7E=;
        b=XLHxxp6lGywZ/iIxyVAZz1qpI7EGK4unqTcEWb2c0ROFupX5o45ZcMqKQrqAvYSP6r
         ANuwqJT9h3wL/9S/94qKJrRW4t9opXkOExujmiljMWyscjvJnWwwNLot2P8PJse0iloR
         XMGjYeoTlPq7bMxVNAWiCVoFJt3hQqsFQL0av/ENcFZAeE0dtulKHyrSGm28EocxZvW6
         zsbsJT5yEQVDMwyEtZq9Q/eYt/0muLgUmFlsotmbEjRtg7MI3RKS7TpNPTJTioiyHTsI
         OrB/3vxMLoknpl2rmEIs9/SbaTBJ2n5pUFsRQZ0k+Gq5MVTZdyA86VmAHK/nTiHUvw8R
         rxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885651; x=1794490451;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XhVMm7OWGM53YPwY0RwS/WYkkxI/DMxC9jQTrfPSs7E=;
        b=DBzyWtkaauCGefvMVyl+tUYs9namnkKSWOknSdHSiFjpnI1Rh4kGslP81EDHEQ+J5s
         zSmYGRx+NSBf2VX75jjb/u5Bm06jeLiQePAqqIGXW2D0MBoT8Kt34sWSNYFSH7S4FnDt
         3YanjVT9HyQgDhxhpmr0R0PFidlxq5EmaiHg7VbmVZwoiWeOXCehFaOvklorNZ/t6z7s
         sX6dE7ZEsDBQrj6tPzYWnBtBwnkadR6XuQA2e9rjC+HftQJ0Xv2dFBk65Sy/uybIgGep
         SGf+EsBCGY+RyhzicO6vkqififvNDnA+zMV61lA9x3C9aetw4nG+UF97VZDhCzXLtXFd
         IenA==
X-Gm-Message-State: APuU4Z+fFKkcqYNekiXxK2l57RLzNQY/256JXJr0iRHYJvEzY6dzepS2
	Lmox0i2xrxLgQqZKO6po+18RFaFY8Qk+V6mCg1n5PTBTp7uKeHDIOtsmclV7CczPSf1P75bNkv3
	+hFAK6A==
X-Gm-Gg: AYBFou0cAB+QIURXtT8aAh9nSr6O/vUjP6EXZ6sTyvZ56kX1RwxVWhg08WOd+dEkXWr
	Yu0sObMA7qJdMg0+q4owyDHm6FfhrhSAmY0+z5wjqA1rEhRT37F9cUCKyrItrRCX4ItqGHg7pzP
	jNtYbMEcF93EqQ9vC1i088YBMGveNMxQOIMi3YlCsdfbeqkgxS8Mx42xSwgStmqCuAGcGGC74WS
	kLWYedwYx/OiJrTTIKUVgHmxa/+vaoxazCPY584lQOBfg5oWSnfPqD/C4uOyTGTQA/GuYUOKmrG
	bDumNwLJwo9vPMYhsLcYL520RuLjdfOcUgOgNGbFxi3Upv/MsNnKWnBuoMESUutWHZuougpGBW6
	eQfXNZoPmXJWeVX9i7epQ8rzKRt0ZIQWESRmgWaTCDjeN4AFDK5Qiqu/GKZIxplgxlfl/1iGTvQ
	9l2z7nY6XKqgjsB65MGPZTxa83alFB4YLKsFjRRDDYbs4ZNcQkfqqHbiG7Kkhb42mjhVwjC5/dM
	khKO8slEn3aMWxw6zKXoiv0Ht7SRSMhJkQFZq9PI0ynSrxARTxuQgApZDoGHXVF3+KgqUC9Zt4r
	Ftln0ONVLNfniYazaPlDNNks2QGoGtS6ELjuVeMJam4k910yl2Ilq6c4DQGZAxjVF2QY5XnsVBU
	V05UIXWp5DIMSWgQz
X-Received: by 2002:a17:907:9612:b0:c3f:8c92:3b51 with SMTP id a640c23a62f3a-c4ca793c5f9mr1753027866b.4.1793885650906;
        Thu, 05 Nov 2026 05:34:10 -0800 (PST)
Message-ID: <15a24084-6fd8-4e87-96da-d7059fe43946@suse.com>
Date: Thu, 5 Nov 2026 14:34:09 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 05/14] x86/PVH: keep a copy of Dom0's initial E820 map
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
X-purgate-ID: tlsNG-4011c0/1793885651-52CDBCFC-88047AFE/10/78276251493
X-purgate-type: spam
X-purgate-size: 3767
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

pvh_populate_p2m() needs to populate RAM according to the initial map
established, prior to any stealing by pvh_steal_ram(). Subsequently the
invocations of those functions will (need to) move ahead of
pvh_populate_p2m() (while accessing those regions needs to stay after
that), so what to act on is no longer Dom0's memory map at the time of
invocation.

Don't bother freeing the allocation on intermediate error paths: We're
going to panic() anyway.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Clarify plans in description. Also log domain in new printk().

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -13,6 +13,7 @@
 #include <xen/multiboot.h>
 #include <xen/pci.h>
 #include <xen/softirq.h>
+#include <xen/xvmalloc.h>
 
 #include <acpi/actables.h>
 
@@ -413,7 +414,10 @@ static void __init pvh_init_p2m(struct d
     } while ( preempted );
 }
 
-static int __init pvh_populate_p2m(struct domain *d)
+static int __init pvh_populate_p2m(
+    struct domain *d,
+    const struct e820entry *e820,
+    unsigned int nr_e820)
 {
     struct vcpu *v = d->vcpu[0];
     unsigned int i;
@@ -421,15 +425,15 @@ static int __init pvh_populate_p2m(struc
 #define MB1_PAGES PFN_DOWN(MB(1))
 
     /* Populate memory map. */
-    for ( i = 0; i < d->arch.nr_e820; i++ )
+    for ( i = 0; i < nr_e820; i++ )
     {
         unsigned long addr, size;
 
-        if ( d->arch.e820[i].type != E820_RAM )
+        if ( e820[i].type != E820_RAM )
             continue;
 
-        addr = PFN_DOWN(d->arch.e820[i].addr);
-        size = PFN_DOWN(d->arch.e820[i].size);
+        addr = PFN_DOWN(e820[i].addr);
+        size = PFN_DOWN(e820[i].size);
 
         rc = pvh_populate_memory_range(d, addr, size);
         if ( rc )
@@ -438,11 +442,11 @@ static int __init pvh_populate_p2m(struc
         if ( addr < MB1_PAGES )
         {
             uint64_t end = min_t(uint64_t, MB(1),
-                                 d->arch.e820[i].addr + d->arch.e820[i].size);
+                                 e820[i].addr + e820[i].size);
             enum hvm_translation_result res =
                  hvm_copy_to_guest_phys(mfn_to_maddr(_mfn(addr)),
                                         mfn_to_virt(addr),
-                                        end - d->arch.e820[i].addr,
+                                        end - e820[i].addr,
                                         v);
 
             if ( res != HVMTRANS_okay )
@@ -1352,6 +1356,8 @@ int __init dom0_construct_pvh(const stru
     paddr_t entry, start_info;
     struct domain *d = bd->d;
     struct elf_binary elf;
+    struct e820entry *orig_e820;
+    unsigned int nr_orig_e820;
     int rc;
 
     printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", d->domain_id);
@@ -1389,6 +1395,16 @@ int __init dom0_construct_pvh(const stru
 
     iommu_hwdom_init(d);
 
+    nr_orig_e820 = d->arch.nr_e820;
+    orig_e820 = xvmalloc_array(struct e820entry, nr_orig_e820);
+    if ( !orig_e820 )
+    {
+        printk("%pd: no memory for copy of E820 map (%u entries)\n",
+               d, nr_orig_e820);
+        return -ENOMEM;
+    }
+    memcpy(orig_e820, d->arch.e820, nr_orig_e820 * sizeof(*orig_e820));
+
     rc = pvh_place_kernel(bd, &elf, &entry);
     if ( rc )
     {
@@ -1396,13 +1412,15 @@ int __init dom0_construct_pvh(const stru
         return rc;
     }
 
-    rc = pvh_populate_p2m(d);
+    rc = pvh_populate_p2m(d, orig_e820, nr_orig_e820);
     if ( rc )
     {
         printk("Failed to setup Dom0 physical memory map\n");
         return rc;
     }
 
+    xvfree(orig_e820);
+
     rc = pvh_load_kernel(bd, &elf, &start_info);
     if ( rc )
     {


