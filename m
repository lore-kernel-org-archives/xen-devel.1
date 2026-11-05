Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E384606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 13:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OM4t+89R
Received: from list by lists.xenproject.org with outflank-mailman.1474707.1681704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOxdA-0008O8-3o; Thu, 05 Nov 2026 13:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474707.1681704; Thu, 05 Nov 2026 13:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOxdA-0008O1-0q; Thu, 05 Nov 2026 13:35:52 +0000
Received: by outflank-mailman (input) for mailman id 1474707;
 Thu, 05 Nov 2026 13:35:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOxd9-0008Np-DH
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 13:35:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOxd3-00Ak0m-Ph
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 14:35:45 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec8627-2eae-0a2a0a5409dd-0a2a4509c210-22
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 14:35:45 +0100
Received: from [209.85.208.41] (helo=mail-ed1-f41.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec8631-be1a-0a2a45090019-d155d029f134-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 14:35:45 +0100
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-6b570ff3dfdso1362468a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 05:35:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b55ac5aec7sm1818296a12.20.2026.11.05.05.35.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 05:35:44 -0800 (PST)
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
        d=suse.com; s=google; t=1793885745; x=1794490545; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Les9WkE9lOfW3mflu8VwX8atN7kQJgnKhFYC3t+evzA=;
        b=OM4t+89RFlU9gUCGDuVXykKkTknSM8lB2hAnI5RS+Hn+BF9OtVHAvooaS2c6CxeA0u
         mgwJP51EhCzXBLjgGCa8CQmejZJ2/q7boyL0LgNnCbJUWoQq869f8dd2sdwyADVkprEx
         PaqpSSKFiq/B+xB4jXGV7waJzM99TK57Z4ILU/enKVbO+rrJI6nA9SziKfaQSKGSNn3b
         1UpLBzBAcRR7Gn6tnYGy9PDqmFTNS+WNzqiaj+7VYCBi8WJJFS9PW8ouoYNOKWTC7eGH
         djo3AmmL8ZKUS9FfI4XjXDpw3VAEyJaHPOLVtP+AmSYAXiaaSTNpkLRHJluJOwBLO/WQ
         w09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885745; x=1794490545;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Les9WkE9lOfW3mflu8VwX8atN7kQJgnKhFYC3t+evzA=;
        b=Pk1pC0WuAdfoT0h+nhCqL7dzmbCS5jqbzgDCUP4XMjfEEHrGCa3RTnr3wVqcT+XIzn
         SKd05OIjQ5Es6sLPgBHWbXZWnIWOVoFO25k7D+KXZz8z7UMdz2ta2MXb0LaCysbsw4PM
         uVXD68El24z4nLXQOgyVBeLJoSZxcDLFZVSYMr85fRpnTQJmi3nmtbd55v0d6eEk93gE
         xof/PoQczLEEAl99MpmeAU34bpXmnKRzRguwOtV3gHiazOnHjJWt4dyD6fzTXi2Oz8jU
         y1Y5GUUlIJZnrSMditoDnHdskKeV17jrDXiaOc3TfUqwDLeg8vks3gP7b2/ilp+4eoMI
         GI5g==
X-Gm-Message-State: APuU4Z/upeZ4R4F69nRsekIMIJKeWdvNjhABvQVx2XLFX5cm6x2gPcsl
	V51FKEvHdCrcvrca3CL6wh5WM9jPFIvPDNw0Eu5n8/OrJB765r0EgFCKy7+IpvI49zEI9DTfSSc
	Ahhn+2A==
X-Gm-Gg: AYBFou2/85QMToh4V6kbTDzlYHSILmBNrm+c1muqpsVzNu4k97qWPaHfAOSUOIUG5qN
	IKRlRou96bAKZGmpHm6DRbRLG7PbXWjGGTPWddlbpBlxaBz46hWGpRWLaZ4nXNybxvWe64hLMv+
	wQpZelPQufEOW9CtErjJL1Ypl5PKzRRDhvD4C+LjRsavUp60pFsPhdH4U1T39PaleCqpUZ/jaNC
	PIyCrFh6iruw0+5ORYz8+momjcegOnL21iE1rK1ePh8nTwCi67UO3jQvRTpfFrPHcvQpzekJZPh
	EzYGETApURBmGhJzMx1uRehnsXtmZL+Vjy1tRT4kbX/QTlkxXSt7QQkjPEfBBozxpI0EHrrO9bi
	nHwgDKThtchMnQx8EB35kK6lU4nt+ERqUtM1CPmH/L5R7lLJyZejSiu0Y85SH1G7kgSDC5+UjgI
	43qnEcApCtYsdk5w1VlsRjG2xoWARa934MQEyyBIhaZkKComNvh0b/nYBNSO+rm+5A6igjBi/px
	AUNoM8iuxHMp8vcGXJ93y0IiDk2OGajfXqLNMc0kcY8ShWVptWSVpTXDUl41WQqvqsnbjegzlqO
	JmL5Pj6FfX1CViCdENTpF9tPHzyKSA8j3CYU3QM/EfPagq4tuCwooahjadwj8PorKcEaIC3/1bh
	3WHBq9b1+yJRK4vo=
X-Received: by 2002:a17:907:84b:b0:c49:8f1e:af0a with SMTP id a640c23a62f3a-c4ca795e453mr1630598666b.7.1793885744727;
        Thu, 05 Nov 2026 05:35:44 -0800 (PST)
Message-ID: <4a678bd3-e70b-4194-b4ce-645328d61bd3@suse.com>
Date: Thu, 5 Nov 2026 14:35:43 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 09/14] x86/PVH: track Dom0 available RAM in a rangeset
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
X-purgate-ID: tlsNG-bad1c0/1793885745-BCECE034-2AEE01BF/10/78276251493
X-purgate-type: spam
X-purgate-size: 17504
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Convert pvh_steal_ram() to work from a rangeset, and replace find_memory()
entirely. By tracking the kernel range right from the creation of that
rangeset we also avoid inadvertently stealing from the kernel range.

Shrinking the E820 region stolen from moves into pvh_add_mem_range(). To
retain coverage of tail padding, the real end address now needs
communicating from pvh_steal_ram() to pvh_add_mem_range().

Sadly the find_memory() replacement cannot use an upper limit of 4Gb, as
that would break current Linux: It accesses module table (and memory map,
which for Dom0 we don't set) via a very early direct-map, which has only
the first L3 entry populated.

Fixes: 1d74282c455f ("x86: setup PVHv2 Dom0 ACPI tables")
Suggested-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The Suggested-by: is based on the respective commit's S-o-b. I didn't go
hunt for whether this may have been suggested in review of that patch.

Clearly find_kernel_memory() could also be converted, but is unrelated
here and hence left for a separate change.
---
v2: New.

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -183,41 +183,62 @@ static int __init pvh_populate_memory_ra
     return 0;
 }
 
+struct steal_info {
+    unsigned long size, align;
+    paddr_t addr, end;
+};
+
+static int cf_check __init find_ram(
+    unsigned long s, unsigned long e, void *data)
+{
+    struct steal_info *info = data;
+
+    if ( e + 1 - s >= info->size )
+    {
+        paddr_t addr = (e + 1 - info->size) & ~(info->align - 1);
+
+        if ( addr >= s )
+        {
+            info->addr = addr;
+            info->end = e;
+        }
+    }
+
+    return 0;
+}
+
 /* Steal RAM from the end of a memory region. */
-static int __init pvh_steal_ram(struct domain *d, unsigned long size,
+static int __init pvh_steal_ram(struct rangeset *ram, unsigned long size,
                                 unsigned long align, paddr_t limit,
-                                paddr_t *addr)
+                                paddr_t *addr, paddr_t *end)
 {
-    unsigned int i = d->arch.nr_e820;
-
     /*
      * Alignment 0 should be set to 1, so it doesn't wrap around in the
-     * calculations below.
+     * calculations in find_ram().
      */
-    align = align ? : 1;
-    while ( i-- )
-    {
-        struct e820entry *entry = &d->arch.e820[i];
+    struct steal_info info = {
+        .size = size,
+        .align = align ?: 1,
+        .addr = INVALID_PADDR,
+    };
 
-        if ( entry->type != E820_RAM || entry->addr + entry->size > limit )
-            continue;
+    rangeset_report_ranges(ram, MB(1), limit - 1, find_ram, &info);
 
-        *addr = (entry->addr + entry->size - size) & ~(align - 1);
-        if ( *addr < entry->addr ||
-             /* Don't steal from the low 1MB due to the copying done there. */
-             *addr < MB(1) )
-            continue;
+    if ( info.addr == INVALID_PADDR )
+        return -ENOMEM;
 
-        entry->size = *addr - entry->addr;
-        return 0;
-    }
+    *addr = info.addr;
 
-    return -ENOMEM;
+    if ( end )
+        /* Suitable for passing to pvh_add_mem_range(). */
+        *end = info.end + 1;
+
+    return rangeset_remove_range(ram, info.addr, info.end);
 }
 
 /* NB: memory map must be sorted at all times for this to work correctly. */
 static int __init pvh_add_mem_range(struct domain *d, uint64_t s, uint64_t e,
-                                    unsigned int type)
+                                    unsigned int type, bool replace)
 {
     struct e820entry *map;
     unsigned int i;
@@ -245,12 +266,66 @@ static int __init pvh_add_mem_range(stru
             break;
 
         if ( re > s )
-            return -EEXIST;
+        {
+            if ( !replace || d->arch.e820[i].type != E820_RAM )
+                return -EEXIST;
+
+            /* In the common case we get away without memory allocation. */
+            if ( re == e && rs <= s )
+            {
+                d->arch.e820[i].size -= e - s;
+
+                if ( !d->arch.e820[i].size )
+                {
+                    memmove(d->arch.e820 + i, d->arch.e820 + i + 1,
+                            (d->arch.nr_e820 - i - 1) * sizeof(*d->arch.e820));
+
+                    d->arch.nr_e820--;
+                    i--;
+                }
+            }
+            else
+            {
+                /*
+                 * While pvh_steal_ram() steals from the end of regions, this
+                 * case can still occur because of RAM ranges in use which
+                 * aren't reflected in E820 (first and foremost the kernel).
+                 */
+                map = xzalloc_array(struct e820entry, d->arch.nr_e820 + 1);
+                if ( !map )
+                    goto nomem;
+
+                memcpy(map, d->arch.e820, (i + 1) * sizeof(*map));
+                memcpy(map + i + 1, d->arch.e820 + i,
+                       (d->arch.nr_e820 - i) * sizeof(*map));
+
+                map[i].size = max(rs, s) - rs;
+
+                map[i + 1].addr = min(re, e);
+                map[i + 1].size = re - map[i + 1].addr;
+
+                if ( !map[i].size )
+                    goto insert;
+
+                if ( !map[i + 1].size )
+                {
+                    d->arch.e820[i] = map[i];
+                    xfree(map);
+                }
+                else
+                {
+                    xfree(d->arch.e820);
+                    d->arch.e820 = map;
+                    d->arch.nr_e820++;
+                }
+            }
+        }
     }
 
     map = xzalloc_array(struct e820entry, d->arch.nr_e820 + 1);
     if ( !map )
     {
+    nomem:
         printk(XENLOG_WARNING "E820: out of memory to add region\n");
         return -ENOMEM;
     }
@@ -258,6 +333,8 @@ static int __init pvh_add_mem_range(stru
     memcpy(map, d->arch.e820, i * sizeof(*d->arch.e820));
     memcpy(map + i + 1, d->arch.e820 + i,
            (d->arch.nr_e820 - i) * sizeof(*d->arch.e820));
+
+ insert:
     map[i].addr = s;
     map[i].size = e - s;
     map[i].type = type;
@@ -275,9 +352,10 @@ struct vmx_info {
 
 static int __init pvh_place_vmx_realmode_helpers(
     struct domain *d,
+    struct rangeset *ram,
     struct vmx_info *info)
 {
-    paddr_t gaddr;
+    paddr_t gaddr, gend;
 
     /*
      * Steal some space from the last RAM region below 4GB to store the
@@ -285,28 +363,27 @@ static int __init pvh_place_vmx_realmode
      * structure (which accounts for the first 104b) doesn't cross a page
      * boundary.
      */
-    if ( !pvh_steal_ram(d, HVM_VM86_TSS_SIZE, 128, GB(4), &gaddr) )
+    if ( !pvh_steal_ram(ram, HVM_VM86_TSS_SIZE, 128, GB(4), &gaddr, &gend) )
     {
         d->arch.hvm.params[HVM_PARAM_VM86_TSS_SIZED] =
             VM86_TSS_UPDATED | ((uint64_t)HVM_VM86_TSS_SIZE << 32) | gaddr;
 
         info->tss = gaddr;
 
-        if ( pvh_add_mem_range(d, gaddr, gaddr + HVM_VM86_TSS_SIZE,
-                               E820_RESERVED) )
+        if ( pvh_add_mem_range(d, gaddr, gend, E820_RESERVED, true) )
             printk("Unable to set VM86 TSS as reserved in the memory map\n");
     }
     else
         printk("Unable to allocate VM86 TSS area\n");
 
     /* Steal some more RAM for the identity page tables. */
-    if ( pvh_steal_ram(d, PAGE_SIZE, PAGE_SIZE, GB(4), &gaddr) )
+    if ( pvh_steal_ram(ram, PAGE_SIZE, PAGE_SIZE, GB(4), &gaddr, &gend) )
     {
         printk("Unable to find memory to stash the identity page tables\n");
         return -ENOMEM;
     }
 
-    if ( pvh_add_mem_range(d, gaddr, gaddr + PAGE_SIZE, E820_RESERVED) )
+    if ( pvh_add_mem_range(d, gaddr, gend, E820_RESERVED, true) )
         printk("%pd: Unable to set identity page tables as reserved in the memory map\n",
                d);
 
@@ -519,14 +596,15 @@ static int __init pvh_populate_p2m(
 #undef MB1_PAGES
 }
 
-static paddr_t __init find_memory(
-    const struct domain *d, const struct elf_binary *elf, size_t size)
+static struct rangeset *__init make_ram_rangeset(
+    const struct domain *d, const struct elf_binary *elf)
 {
-    paddr_t kernel_start = (paddr_t)elf->dest_base & PAGE_MASK;
-    paddr_t kernel_end = ROUNDUP((paddr_t)elf->dest_base + elf->dest_size,
-                                 PAGE_SIZE);
+    struct rangeset *ram = rangeset_new(NULL, NULL, 0);
     unsigned int i;
 
+    if ( !ram )
+        return NULL;
+
     /* The memory map is sorted. */
     for ( i = 0; i < d->arch.nr_e820; i++ )
     {
@@ -538,26 +616,24 @@ static paddr_t __init find_memory(
 
         start = MAX(ROUNDUP(d->arch.e820[i].addr, PAGE_SIZE), MB(1));
 
-        /*
-         * NB: Even better would be to use rangesets to determine a suitable
-         * range, in particular in case a kernel requests multiple heavily
-         * discontiguous regions (which right now we fold all into one big
-         * region).
-         */
-        if ( end <= kernel_start || start >= kernel_end )
-        {
-            /* No overlap, just check whether the region is large enough. */
-            if ( end - start >= size )
-                return start;
-        }
-        /* Deal with the kernel already being loaded in the region. */
-        else if ( kernel_start > start && kernel_start - start >= size )
-            return start;
-        else if ( kernel_end < end && end - kernel_end >= size )
-            return kernel_end;
+        if ( start < end &&
+             rangeset_add_range(ram, start, end - 1) != 0 )
+            return NULL;
     }
 
-    return INVALID_PADDR;
+    /*
+     * Remove the kernel range, rounded to page boundaries.
+     *
+     * NB: Even better would be to record space needed by the kernel at its
+     * allocation, in particular in case a kernel requests multiple heavily
+     * discontiguous regions (which right now we fold all into one big one).
+     */
+    if ( rangeset_remove_range(ram, (paddr_t)elf->dest_base & PAGE_MASK,
+                               ROUNDUP((paddr_t)elf->dest_base + elf->dest_size,
+                                       PAGE_SIZE) - 1) != 0 )
+        return NULL;
+
+    return ram;
 }
 
 static bool __init check_load_address(
@@ -723,7 +799,8 @@ static int __init pvh_place_kernel(
 static int __init pvh_load_kernel(
     const struct boot_domain *bd,
     struct elf_binary *elf,
-    paddr_t *start_info_addr)
+    paddr_t *start_info_addr,
+    struct rangeset *ram)
 {
     struct domain *d = bd->d;
     struct boot_module *initrd = bd->initrd;
@@ -778,8 +855,13 @@ static int __init pvh_load_kernel(
 
     extra_space += elf_round_up(elf, cmdline_len);
 
-    last_addr = find_memory(d, elf, extra_space);
-    if ( last_addr == INVALID_PADDR )
+    /*
+     * While not written down anywhere, 64-bit Linux requires at least mod to
+     * live below 1Gb (mapped by the first L3 entry of the direct map).  32-bit
+     * Linux may map more, but defaults to mapping only 1Gb.
+     */
+    if ( pvh_steal_ram(ram, PAGE_ALIGN(extra_space), PAGE_SIZE, GB(1),
+                       &last_addr, NULL) )
     {
         printk("Unable to find a memory region to load initrd and metadata\n");
         return -ENOMEM;
@@ -922,7 +1004,10 @@ static int __init cf_check acpi_set_intr
     return 0;
 }
 
-static int __init pvh_setup_acpi_madt(struct domain *d, paddr_t *addr)
+static int __init pvh_setup_acpi_madt(
+    struct domain *d,
+    struct rangeset *ram,
+    paddr_t *addr)
 {
     struct acpi_table_madt *madt;
     struct acpi_table_header *table;
@@ -946,15 +1031,17 @@ static int __init pvh_setup_acpi_madt(st
 
     if ( !*addr )
     {
+        paddr_t end;
+
         /* Reserve space to place the new MADT in guest memory space. */
-        if ( pvh_steal_ram(d, size, 0, GB(4), addr) )
+        if ( pvh_steal_ram(ram, size, 0, GB(4), addr, &end) )
         {
             printk("%pd: unable to steal guest RAM for MADT\n", d);
             return -ENOMEM;
         }
 
         /* Mark this region as E820_ACPI. */
-        if ( pvh_add_mem_range(d, *addr, *addr + size, E820_ACPI) )
+        if ( pvh_add_mem_range(d, *addr, end, E820_ACPI, true) )
             printk("%pd: unable to add MADT region to memory map\n", d);
 
         return 0;
@@ -1102,8 +1189,11 @@ static bool __init pvh_acpi_xsdt_table_a
             strncmp(sig, ACPI_SIG_FACS, ACPI_NAME_SIZE));
 }
 
-static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
-                                      paddr_t *addr)
+static int __init pvh_setup_acpi_xsdt(
+    struct domain *d,
+    struct rangeset *ram,
+    paddr_t madt_addr,
+    paddr_t *addr)
 {
     struct acpi_table_xsdt *xsdt;
     struct acpi_table_header *table;
@@ -1138,15 +1228,17 @@ static int __init pvh_setup_acpi_xsdt(st
 
     if ( !*addr )
     {
+        paddr_t end;
+
         /* Reserve space to place the new XSDT in guest memory space. */
-        if ( pvh_steal_ram(d, size, 0, GB(4), addr) )
+        if ( pvh_steal_ram(ram, size, 0, GB(4), addr, &end) )
         {
             printk("%pd: unable to find guest RAM for XSDT\n", d);
             return -ENOMEM;
         }
 
         /* Mark this region as E820_ACPI. */
-        if ( pvh_add_mem_range(d, *addr, *addr + size, E820_ACPI) )
+        if ( pvh_add_mem_range(d, *addr, end, E820_ACPI, true) )
             printk("%pd: unable to add XSDT region to memory map\n", d);
 
         return 0;
@@ -1238,9 +1330,11 @@ struct acpi_info {
 
 static int __init pvh_place_acpi(
     struct domain *d,
-    struct acpi_info *info)
+    struct acpi_info *info,
+    struct rangeset *ram)
 {
     unsigned int i;
+    paddr_t end;
     int rc;
 
     /* Scan top-level tables and add their regions to the guest memory map. */
@@ -1258,7 +1352,7 @@ static int __init pvh_place_acpi(
         if ( strncmp(sig, ACPI_SIG_MADT, ACPI_NAME_SIZE)
              ? pvh_acpi_table_allowed(sig, addr, size)
              : !acpi_memory_banned(addr, size) )
-             pvh_add_mem_range(d, addr, addr + size, E820_ACPI);
+             pvh_add_mem_range(d, addr, addr + size, E820_ACPI, false);
     }
 
     /* Identity map ACPI e820 regions. */
@@ -1294,25 +1388,23 @@ static int __init pvh_place_acpi(
         }
     }
 
-    rc = pvh_setup_acpi_madt(d, &info->madt);
+    rc = pvh_setup_acpi_madt(d, ram, &info->madt);
     if ( rc )
         return rc;
 
-    rc = pvh_setup_acpi_xsdt(d, info->madt, &info->xsdt);
+    rc = pvh_setup_acpi_xsdt(d, ram, info->madt, &info->xsdt);
     if ( rc )
         return rc;
 
-    if ( pvh_steal_ram(d, sizeof(struct acpi_table_rsdp), 0, GB(4),
-                       &info->rsdp) )
+    if ( pvh_steal_ram(ram, sizeof(struct acpi_table_rsdp), 0, GB(4),
+                       &info->rsdp, &end) )
     {
         printk("%pd: unable to allocate guest RAM for RSDP\n", d);
         return -ENOMEM;
     }
 
     /* Mark this region as E820_ACPI. */
-    if ( pvh_add_mem_range(d, info->rsdp,
-                           info->rsdp + sizeof(struct acpi_table_rsdp),
-                           E820_ACPI) )
+    if ( pvh_add_mem_range(d, info->rsdp, end, E820_ACPI, true) )
         printk("%pd: unable to add RSDP region to memory map\n", d);
 
     return 0;
@@ -1330,11 +1422,11 @@ static int __init pvh_setup_acpi(
         .length = sizeof(rsdp),
     };
 
-    rc = pvh_setup_acpi_madt(d, &info->madt);
+    rc = pvh_setup_acpi_madt(d, NULL, &info->madt);
     if ( rc )
         return rc;
 
-    rc = pvh_setup_acpi_xsdt(d, info->madt, &info->xsdt);
+    rc = pvh_setup_acpi_xsdt(d, NULL, info->madt, &info->xsdt);
     if ( rc )
         return rc;
 
@@ -1413,6 +1505,7 @@ int __init dom0_construct_pvh(const stru
     struct elf_binary elf;
     struct e820entry *orig_e820;
     unsigned int nr_orig_e820;
+    struct rangeset *ram;
     struct acpi_info acpi = {};
     struct vmx_info vmx = {};
     int rc;
@@ -1469,7 +1562,14 @@ int __init dom0_construct_pvh(const stru
         return rc;
     }
 
-    rc = pvh_place_acpi(d, &acpi);
+    ram = make_ram_rangeset(d, &elf);
+    if ( !ram )
+    {
+        printk("%pd: not enough memory to track RAM\n", d);
+        return -ENOMEM;
+    }
+
+    rc = pvh_place_acpi(d, &acpi, ram);
     if ( rc )
     {
         printk("%pd: failed to place ACPI tables: %d\n", d, rc);
@@ -1487,7 +1587,7 @@ int __init dom0_construct_pvh(const stru
           */
          !vmx_unrestricted_guest(d->vcpu[0]) )
     {
-        rc = pvh_place_vmx_realmode_helpers(d, &vmx);
+        rc = pvh_place_vmx_realmode_helpers(d, ram, &vmx);
         if ( rc )
             return rc;
     }
@@ -1501,13 +1601,15 @@ int __init dom0_construct_pvh(const stru
 
     xvfree(orig_e820);
 
-    rc = pvh_load_kernel(bd, &elf, &start_info);
+    rc = pvh_load_kernel(bd, &elf, &start_info, ram);
     if ( rc )
     {
         printk("Failed to load Dom0 kernel\n");
         return rc;
     }
 
+    rangeset_destroy(ram);
+
     rc = pvh_setup_cpus(d, entry, start_info);
     if ( rc )
     {


