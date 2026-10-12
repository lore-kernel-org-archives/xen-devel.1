Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69503CA9EC5
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 08:22:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445925.1661803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBID-0001Cy-E8; Mon, 12 Oct 2026 08:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445925.1661803; Mon, 12 Oct 2026 08:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBID-0001Cr-Av; Mon, 12 Oct 2026 08:21:57 +0000
Received: by outflank-mailman (input) for mailman id 1445925;
 Mon, 12 Oct 2026 08:21:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGBIC-0001BS-65
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 08:21:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGBIB-00B8gn-In
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 10:21:55 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc989c-bab6-0a2a0a5309dd-0a2a4504af40-20
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:21:55 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc98a3-b57f-0a2a45040019-d155dd2ac597-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:21:55 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-48b042c0728so264404f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 01:21:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9ab981asm18612998f8f.30.2026.10.12.01.21.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 01:21:54 -0700 (PDT)
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
        d=suse.com; s=google; t=1791793315; x=1792398115; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jW8u2BaMdN617mSpoQPZYCC4FPlFgwFVGfByY61ToiY=;
        b=NqiUHkKuQh/iVYCQ4kakFXUxmOUj/uT+GdVbIj7zixmTmzdZZvpgYPNqYRMEZ8REwz
         7QxU50czEO/SmLWiaDTkfJFObosNE0ce5oLNlmb1h0fWvdnBUT2kDHj6yFhVYWwn5CqZ
         x1stdj2VeeIF25EH0f7luahvpvFqWC7BAVx3YXJ2SY+P2eoIOtgsQVkTwLLPd5ehhru8
         PtdlV+yWfseIFFii+ayF84HAR48vsWgcvikS62+akHJ/afX1YmtrVoyZIkqJporuns0v
         ztZ/cFoYMDeJfQywbQMbhJbEBTF7oLj1yZPRsCxzqKrFppJpbwjqEX7QxvxnYr+7clPN
         DgVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791793315; x=1792398115;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jW8u2BaMdN617mSpoQPZYCC4FPlFgwFVGfByY61ToiY=;
        b=ygcyypx64REWbE096u/IV6pl7ye9z3Ntyj6cX2yAGr5iAHIIkgw+4xUKs0IkFmAi1A
         KBkq4rIg6CBKCFHFSOqJhp3jOtUY2Jmkyd7subrfU9/wtpYbBcRwe/i0/gX32RotUAYR
         gsdZVrQ0Y6RhRYw7n92X+J4Ts6OH90FevvbX78gjvst8lzDfU9ZrNUAArIFdR69AadIx
         Hti9Br1c+QE/WFjf9pTbH8qVl0AQn47No68bKsq5u1OMe+zHFFBP+TXTYkwTgumCbPYA
         XYMywQmI61/ueZa5k/wZlw0pkbv+VR9hfXpEu0f7gukFoRBfw0DWY4X54S02mYQ9uYhn
         lcqg==
X-Gm-Message-State: AFq9FYLDeOHNziiuNyNxk7wzWb27dnoLCfsE7pfLxmObJeBbCKKdxpBl
	zUS2fIFTb7nWA6hvuILM2NqFwd/LPDiTQ8/ktOwLLc/p2yb1XbC4E7nm7tj4whZZLuLnLutQ4ZM
	htehScw==
X-Gm-Gg: AYBFou39ivYtZVxKKKXXPjS/BnDPMtuPzBcCvWlB9lBjBc3zVOuLjbZLdDTYYelKXVR
	OWdk4BipFvHImPl3F2lQRGj+Ex0q2rRF0flbjRYEi6BNeinwAoOWdwctrKCgTytFzlq75dDRd0j
	zhFXh9E7ZQDesE/RhFKVnJkdLYBaQ/TvlaZvBgJZUXilrmTKIy2sf5+a/om5y6a5JSXocH+XNvX
	5LqRedPG85Rs/0lF8Qra84jPcO7zCZqULncSsvj2JotgPPRO8vGPfL8PZvT3qNHcS6LdrGMXtYh
	ORGpvh4R/CkvEzlQAD8wIOsoVw44ClkbFahVFIJr6AzmTPv12iFZ3Y7TT6HvyEf8jB3cP/qrChs
	YrUcLwacq6rovnwkgO3vBC/qojqT/iHgPsoP50TUEUa1kJrxL/bQZM5FmdewZ5G5y+8HTk5UUq1
	X8/Ro7jAF0711LZC1KflDK4uJY+lNIYeZUem0Ns2IfXfppqmgN8cnbfwuVnn8TpiaDMBTKqGhlE
	Tfb4WMDpE04peqdZMflFbPs4Hk8leegz/HK1CeTr061MNVx7yj5HlfWEkFDkmc=
X-Received: by 2002:a05:6000:2610:b0:48b:60a:760c with SMTP id ffacd0b85a97d-48dbacdbca4mr15772871f8f.31.1791793314718;
        Mon, 12 Oct 2026 01:21:54 -0700 (PDT)
Message-ID: <575ec1bc-764c-4016-a584-a79e57817d9a@suse.com>
Date: Mon, 12 Oct 2026 10:21:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 06/15] x86/PVH: keep a copy of Dom0's initial E820 map
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
X-purgate-ID: tlsNG-ebf023/1791793315-C0CDFB50-C602F82D/10/78276251493
X-purgate-type: spam
X-purgate-size: 3511

pvh_populate_p2m() needs to populate RAM according to the initial map
established, prior to any stealing by pvh_steal_ram(). Subsequently the
invocations of those functions will (need to) move ahead of
pvh_populate_p2m(), so what to act on is no longer Dom0's memory map at
the time of invocation.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

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
@@ -1389,6 +1395,15 @@ int __init dom0_construct_pvh(const stru
 
     iommu_hwdom_init(d);
 
+    nr_orig_e820 = d->arch.nr_e820;
+    orig_e820 = xvmalloc_array(struct e820entry, nr_orig_e820);
+    if ( !orig_e820 )
+    {
+        printk("No memory for copy of E820 map (%u entries)\n", nr_orig_e820);
+        return -ENOMEM;
+    }
+    memcpy(orig_e820, d->arch.e820, nr_orig_e820 * sizeof(*orig_e820));
+
     rc = pvh_place_kernel(bd, &elf, &entry);
     if ( rc )
     {
@@ -1396,13 +1411,15 @@ int __init dom0_construct_pvh(const stru
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


