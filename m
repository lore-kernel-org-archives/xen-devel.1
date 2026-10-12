Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB884CA9ED2
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 08:27:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445978.1661883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBN5-0005hi-UW; Mon, 12 Oct 2026 08:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445978.1661883; Mon, 12 Oct 2026 08:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBN5-0005hb-Rv; Mon, 12 Oct 2026 08:26:59 +0000
Received: by outflank-mailman (input) for mailman id 1445978;
 Mon, 12 Oct 2026 08:26:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGBN5-0005gJ-47
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 08:26:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGBN4-00B9lk-Gr
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 10:26:58 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc99cb-2eae-0a2a0a5409dd-0a2a4502a292-18
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:26:58 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc99d2-6ca4-0a2a45020019-d155802fd4ab-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:26:58 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4a02667ccebso10434985e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 01:26:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9acc936sm18062413f8f.44.2026.10.12.01.26.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 01:26:57 -0700 (PDT)
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
        d=suse.com; s=google; t=1791793618; x=1792398418; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QQBVOxw25q4egEqsMoJm6AFAF/6zt2nS86ied2+T6eQ=;
        b=AFLLHhCX1Op1dAcSlnYJhgKmdfTDNau4dcRMBIF84+1OG58x7u+vDvkHq/JAmbZbuc
         IT1TNE+zTTyvynCG1iFlFr9QNMz8CMd27Y8jffgfOgP1SsbNc6OV3QQv48gpWN9eALxF
         MExq7HNqYlDl1XoomYXrQFOSKLTXRj4hqMoSkVuMI7I7ywv9Xu8RyCfiPxwfeEwjK/yP
         eVITTkxvbpKicGE9fD40vxGf7LjyFspblp+2Rq7mm+AweI0+4fZG6/SzXjIo5XNF9PyD
         Vhiqq4qi1KCDCHhMMV7FH7bfC/pis8yMo2TjE4Eb+5OEqc4eHhz4XREMTxNW12v3uMb+
         G5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791793618; x=1792398418;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QQBVOxw25q4egEqsMoJm6AFAF/6zt2nS86ied2+T6eQ=;
        b=1ghn6CGrtOnLbOdCxpS/SpgmI9gpnB91KhXaiR6XIA96GoSYbUKb9oCnN6n7LTcRsp
         8XjN7OVQQd302X+5KhY20L8luUcsBtau1kz84qoqZMD49IDTpZJQM0NAfZsNRjJaFTwT
         wUCe6LOT7SRBVfpfKw6ksYd/3IaCBKDXG8Zo0dEHrEInGe4cmwhGUgQxQpti4GIaDkIH
         Zv/Wimh0BLUqNJ6Q9+cx6cS+X3fBD8UNZGL5AIrt03MZC3xiFTHb9FrQ93BJbe6zvuHH
         JXuQCDS++2e/nXYmsuKKlRbjQouaWT2xydLuAc1UkzHijGe5EBArV0oIIGaJJT56AlSz
         jXzA==
X-Gm-Message-State: AFq9FYKyFqrXSmI3rEjpGIOu+y7u6A1ziqtCW8OuT7beQscs1AF4BQTD
	Mkbbr5h7unEe+x7kkxEiTdnnHKueJMbc8Mp9DL/mMPcrTV42gI7eFcmsojwqb5h9SMq5rA3CW+i
	QLYKyDQ==
X-Gm-Gg: AYBFou31MWfy110gjLPm4XLEdSLByL6/y9tCwDWme54OvlyZ3wuwGf6+mQ5M4Q1zLtO
	tEJ+XGIo85GQkO0g3zZvlXHoQjQtkHxHDXH4895TSX/1cGiiIcKrjUD+KRpYZx3ocm7bTvwN5Xf
	QvKFhbBRxzEgP+uk3zCHUs8lwVcm1s74pKhnNkSyqcLGfJ85OAk/BvAPdG1AFOHRZ/tq0AurP0G
	TMcBOZN3qPf8HDwLtlUo1gpnnEtTesndg14/+J2N59eGOw7KpKj1TeA1fD6sAiZaNC8YA1ZK6Gs
	Fjll+0/h/8fdA8iclqm7PWPzsGBpRdvme80hIitz8Qr8mJiUM280LdCqOYzx7WW62WbWcco+7ZQ
	I1wwcUsSH9AeFos+A80wgKyDFea/G/kErFcX5B8HgHizz0lfK5EPjvAf9roib/+3UP0YIgQvKZY
	r46k4CSA1W4t6hd/Rx/0YPlBcnrzGc9cPIzqJEr2+DQKVqQrW0wiurB/uRYfI7MMoUahYVDJXIF
	okxcXWwYpZ631PSKtf7FG9vd3Fj62wHSMQc2zKbAwLyr1Ui6Lvm0GcHsIfqPA==
X-Received: by 2002:a05:600d:4452:20b0:4a1:90d7:88a8 with SMTP id 5b1f17b1804b1-4a190d7891emr105478065e9.25.1791793617885;
        Mon, 12 Oct 2026 01:26:57 -0700 (PDT)
Message-ID: <bcf7efcc-2648-42e0-ba0b-7f6e32e65f11@suse.com>
Date: Mon, 12 Oct 2026 10:26:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 15/15] x86/PVH: simplify writing of Dom0's RSDP
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
X-purgate-ID: tlsNG-720697/1791793618-307C22AC-EDB727F3/10/78276251493
X-purgate-type: spam
X-purgate-size: 2878

Now that we establish where the RSDP is to live before actually loading
the kernel (and writing start-info there) we can simply hand the pointer
there, eliminating the need for the (fragile) separate write to the field
out of pvh_setup_acpi().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Alternatively we could move start_info to the top-level function, have
pvh_load_kernel() and pvh_setup_acpi() fill what need filling, and do
the write from the top-level function. Yet it looks to me as if this was
more churn for little extra gain.

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -976,7 +976,8 @@ static int __init pvh_load_kernel(
     const struct boot_domain *bd,
     struct elf_binary *elf,
     struct hvm_modlist_entry *mod,
-    paddr_t *start_info_addr)
+    paddr_t *start_info_addr,
+    paddr_t rsdp)
 {
     struct domain *d = bd->d;
     struct boot_module *initrd = bd->initrd;
@@ -1110,6 +1111,7 @@ static int __init pvh_load_kernel(
 
     start_info.magic = XEN_HVM_START_MAGIC_VALUE;
     start_info.flags = SIF_PRIVILEGED | SIF_INITDOMAIN;
+    start_info.rsdp_paddr = rsdp;
     rc = hvm_copy_to_guest_phys(last_addr, &start_info, sizeof(start_info), v);
     if ( rc )
     {
@@ -1587,10 +1589,7 @@ static int __init pvh_place_acpi(
     return 0;
 }
 
-static int __init pvh_setup_acpi(
-    struct domain *d,
-    struct acpi_info *info,
-    paddr_t start_info)
+static int __init pvh_setup_acpi(struct domain *d, struct acpi_info *info)
 {
     int rc;
     struct acpi_table_rsdp *native_rsdp, rsdp = {
@@ -1642,20 +1641,6 @@ static int __init pvh_setup_acpi(
         return rc;
     }
 
-    /* Copy RSDP address to start_info. */
-    BUILD_BUG_ON(sizeof(info->rsdp) !=
-                 sizeof_field(struct hvm_start_info, rsdp_paddr));
-    rc = hvm_copy_to_guest_phys(start_info +
-                                offsetof(struct hvm_start_info, rsdp_paddr),
-                                &info->rsdp,
-                                sizeof_field(struct hvm_start_info, rsdp_paddr),
-                                d->vcpu[0]);
-    if ( rc )
-    {
-        printk("Unable to copy RSDP address to start info\n");
-        return rc;
-    }
-
     return 0;
 }
 
@@ -1783,7 +1768,7 @@ int __init dom0_construct_pvh(const stru
 
     xvfree(orig_e820);
 
-    rc = pvh_load_kernel(bd, &elf, &initrd, &start_info);
+    rc = pvh_load_kernel(bd, &elf, &initrd, &start_info, acpi.rsdp);
     if ( rc )
     {
         printk("Failed to load Dom0 kernel\n");
@@ -1797,7 +1782,7 @@ int __init dom0_construct_pvh(const stru
         return rc;
     }
 
-    rc = pvh_setup_acpi(d, &acpi, start_info);
+    rc = pvh_setup_acpi(d, &acpi);
     if ( rc )
     {
         printk("Failed to setup Dom0 ACPI tables: %d\n", rc);


