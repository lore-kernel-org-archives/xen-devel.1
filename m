Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495ED606A326
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 13:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FooMUcOb
Received: from list by lists.xenproject.org with outflank-mailman.1474740.1681740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOxeY-00028I-2b; Thu, 05 Nov 2026 13:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474740.1681740; Thu, 05 Nov 2026 13:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOxeX-00028A-V7; Thu, 05 Nov 2026 13:37:17 +0000
Received: by outflank-mailman (input) for mailman id 1474740;
 Thu, 05 Nov 2026 13:37:16 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOxeW-00026V-F8
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 13:37:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOxeV-0033DJ-Rt
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 14:37:15 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec8683-2eae-0a2a0a5409dd-0a2a4509bd2a-36
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 14:37:15 +0100
Received: from [209.85.208.44] (helo=mail-ed1-f44.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec868b-be1a-0a2a45090019-d155d02cb147-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 14:37:15 +0100
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-6b1aa2848d2so2996564a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 05:37:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d0e4422d1sm175562066b.39.2026.11.05.05.37.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 05:37:14 -0800 (PST)
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
        d=suse.com; s=google; t=1793885835; x=1794490635; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=imShRlEMCMBWZ/mu1fyOE5mw0Ai2dYu4aKRjt4i+5QA=;
        b=FooMUcObf5qvF2Wn72ZyvLboeGYuDHmAlfnaOTEgegrH1wGdPE/FTzZG9VVVymxZyR
         AJbKVKUz5fiMBgF/G9sweiijuAAzwan77AvEZVz9sB1UpGFuZbBH1HeRyBEa9q5x7cXL
         OnGqcsR2jL8wIdnyYXDQCC8eIvVBu91A6vutBDS8rQUMCgN85qm6JZAmPSCcsSQrZn3O
         vyGG7iIby8kVcRHRSyIkElLWOAtzDIFvHHR9bwIWBH/RwFFwuAfVhkb6VhL3ec2Yqjzx
         2HK3nIIalukZc/AZBoSPHpH3RcCeL5Gl/Bm7C6s3hgLluySeqr4rR38Judh24xLQYmQQ
         oY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885835; x=1794490635;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=imShRlEMCMBWZ/mu1fyOE5mw0Ai2dYu4aKRjt4i+5QA=;
        b=pGx1Vu4FFcHHXwnLKTCNUIpQVNo/BhMCH5RMoarvvqTXD1ksCTr7RPIuMmFn8PZnuK
         DsbwOHrouiu7jG/bjGDvQHkgjPM5v3tvdXUKgvfXdbYQagDfWJ3UnDCnDRdqSL05dtgt
         PTt6pOudC7EuUoJERls04VFxX7/ywUMjU4CvuG1pltBycAJgUeX7vDvYZmaIwclmGsPB
         N/mKRban+t0pao5zE72+d/BmrshZIbUp4XgEhM+CizrjvE6IVFVVBDZte5fXExc+Feix
         KkXk99jKNk05bhPbyIET3TDZoBEQPZHFUPM9M/Dd68LuXdZvDKoK2muwgzMsTlElDoH+
         +VGw==
X-Gm-Message-State: APuU4Z9+SJDpqGxPBwGIJPRFHD6AEKc+vkeLzk2b63nJxeJ5rRmN/iZu
	Wg3MKc8iQczlsN4zD/0YxFXA0+0Makq5vOKcuo5GARwVDP1u6YP1cE0RZ/UHP21QxlCDqh5+pd5
	19K++8g==
X-Gm-Gg: AYBFou38+qcX0rW1OZ1K1X/uMwpG0eNjRQXhnOY6cjj0KmT3tZxPY4lRpmCcXVa9xCS
	6DgLd6Z8J0EkL0RjYGkki+p/7mKgnaxCqzlk5x2LfCDL0O4EllD/ycvgpmcjRt695GMIpKFV3nE
	utJryYSb4s3Drmc1qa3LetPztIw6uEWn32KG2buBLw5d/xqhwa+40P50OuBdp7vPFq8rL+6AYeQ
	TDIIj0muXqUJdVNRXJWteiLkGzdwp23IG9O38KEEdCDAsvgmWmP9nPP0eMFnA07psA0W9cUoIod
	knaIvxeAqIXv+KjgDDcKMtzChmJk8AFzUcAm/FJRDwxEK7aVCNBqsgYDvfVuuWfmIBSy4NCQLPx
	kis+yzaan6T+95mXMsy4jGyrqs2w+BDJ5l+HDMYzjZ415tOC5m1MSHDlgUW3V9vjABBpZMIstpz
	OrsW1ES7eAf2EfamTBCGUw5YWKWKBNwhg7TMcJfjNh+t8PhUJBSrQeMseLuIkrXk5swHFZusr3H
	ne2VjfPV27s5m3aEpEj0Eyi+x9Gbw00LZfVmo+EH9hcf03QhCqGrtV/eJMAkWD0T3JCutWTjM30
	JBjZS6l3Rmvy4ogMDmp25J2Whj5HA+A/pSxfabLpyl8lcr/Ep6SyKOaTs5wVtPU+M675rfEo10R
	dYuP+wXyHnZwIVrAn
X-Received: by 2002:a17:906:9f92:b0:c41:5970:2360 with SMTP id a640c23a62f3a-c4ca7ad1d1fmr1645182966b.41.1793885835031;
        Thu, 05 Nov 2026 05:37:15 -0800 (PST)
Message-ID: <f6c1ee65-08a6-43fd-903e-67b02948773b@suse.com>
Date: Thu, 5 Nov 2026 14:37:14 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 13/14] x86/PVH: simplify writing of Dom0's RSDP
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
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1793885835-BFED6034-63BEEFB0/10/78276251493
X-purgate-type: spam
X-purgate-size: 2871
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Now that we establish where the RSDP is to live before actually loading
the kernel (and writing start-info there) we can simply hand the pointer
there, eliminating the need for the (fragile) separate write to the field
out of pvh_setup_acpi().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger@xenproject.org>
---
Alternatively we could move start_info to the top-level function, have
pvh_load_kernel() and pvh_setup_acpi() fill what need filling, and do
the write from the top-level function. Yet it looks to me as if this was
more churn for little extra gain.
---
v2: Re-base over changes earlier in the series.

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -943,7 +943,8 @@ static int __init pvh_load_kernel(
     struct elf_binary *elf,
     struct hvm_modlist_entry *mod,
     paddr_t *start_info_addr,
-    struct rangeset *ram)
+    struct rangeset *ram,
+    paddr_t rsdp)
 {
     struct domain *d = bd->d;
     struct boot_module *initrd = bd->initrd;
@@ -1083,6 +1084,7 @@ static int __init pvh_load_kernel(
 
     start_info.magic = XEN_HVM_START_MAGIC_VALUE;
     start_info.flags = SIF_PRIVILEGED | SIF_INITDOMAIN;
+    start_info.rsdp_paddr = rsdp;
     rc = hvm_copy_to_guest_phys(last_addr, &start_info, sizeof(start_info), v);
     if ( rc )
     {
@@ -1563,10 +1565,7 @@ static int __init pvh_place_acpi(
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
@@ -1618,18 +1617,6 @@ static int __init pvh_setup_acpi(
         return rc;
     }
 
-    /* Copy RSDP address to start_info. */
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
 
@@ -1767,7 +1754,7 @@ int __init dom0_construct_pvh(const stru
 
     xvfree(orig_e820);
 
-    rc = pvh_load_kernel(bd, &elf, &initrd, &start_info, ram);
+    rc = pvh_load_kernel(bd, &elf, &initrd, &start_info, ram, acpi.rsdp);
     if ( rc )
     {
         printk("Failed to load Dom0 kernel\n");
@@ -1783,7 +1770,7 @@ int __init dom0_construct_pvh(const stru
         return rc;
     }
 
-    rc = pvh_setup_acpi(d, &acpi, start_info);
+    rc = pvh_setup_acpi(d, &acpi);
     if ( rc )
     {
         printk("Failed to setup Dom0 ACPI tables: %d\n", rc);


