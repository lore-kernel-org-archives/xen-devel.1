Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1267CA9ED2
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 08:26:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445970.1661874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBMY-00054I-IP; Mon, 12 Oct 2026 08:26:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445970.1661874; Mon, 12 Oct 2026 08:26:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBMY-00054B-FY; Mon, 12 Oct 2026 08:26:26 +0000
Received: by outflank-mailman (input) for mailman id 1445970;
 Mon, 12 Oct 2026 08:26:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGBMW-00051n-Oj
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 08:26:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGBMW-00B9bw-5V
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 10:26:24 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc99af-2eae-0a2a0a5409dd-0a2a4506cd1e-2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:26:24 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc99af-195a-0a2a45060019-d155dd2cd05c-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:26:24 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-48afe0081a6so1083685f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 01:26:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9abce2fsm18374605f8f.33.2026.10.12.01.26.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 01:26:23 -0700 (PDT)
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
        d=suse.com; s=google; t=1791793583; x=1792398383; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3Fk8ubxGACynMKa2lozxkb2C5OaTEVTs40otMwFTXqk=;
        b=aOcG8Aq4+bzIRntKvjo82UdKnLklVy9vTQkYrj0HYIEBB37fQD985JVANwpLyLIn+M
         wu8C++5kCkyB5aQAniE3WHLBmEsJoWD0Eal/oZ1TiQndQNUIF75Y72MTfP38ZXZwIe4p
         FjubqEnvv42bQN6hBZ+POel9DpkEahcrtRzRt1qyvYlwqi1oK0cr1m4r3FhHE/GDos/3
         kWcIhFJ7deGcer810yG1MB6ClkmFqD8IjzwTPlDAeRrH+g2kpvTasJ7zDZJfADMrW91S
         0ZcxG0qIUs5hrptnO/7GfjQsXkUdcIuEVN/o3pwr6iwWrXoSasjrpcbY7tosvGvB/WpG
         MTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791793583; x=1792398383;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3Fk8ubxGACynMKa2lozxkb2C5OaTEVTs40otMwFTXqk=;
        b=xZwiy3KQ1dBlQ7dFlhfdgnPaRyDFoQoQjX3b278cjCk7ybOuGxUDmMPMIMcHDctHDm
         qGiyVjKxdMroVRrwqdaM9ce8dKVLpP3kt4pgqXgc7Th0Eyv45yaH1K28iy1egkEyccuP
         9fOGard7RbL/SogtGIFTfyhrZqkZJBbV3q1M7mU2hAHc3++43lsBYm1DhdtqgcVTeEzu
         /ctg7Il6KlFey5jEM8K2rCJnpU92lckIB3WvBrOs+yd9FqeRxsRyEvcQrl6EorR6+DUk
         tkW0Jbzx3J0GKzJEhaE7UwAEGOEYhcfpGrs7WO8qgOMUcdUKBXGyN8o+zr7kN4/HCFMq
         Bk5g==
X-Gm-Message-State: AFq9FYKNQWfXLZb8mvRxOG8gSWtry21yCzoGo0cjQTRMnMqavoKDbKWk
	YfW7GWBmTUIqRNm7n6PbfrkaOhx48icYJMOktAXA3VQvKOAgw/3dxXbgE+BqilZz1k0dV+Tp3l9
	ftgGcwg==
X-Gm-Gg: AYBFou1GoWN8L9qze9zA/6daT2LLa+DPzKKNtwxh8jrKhB0gXqeTdt2gN9Q4cL60M9T
	phXM/VBHDCykLci3XIyY4xosLDoqSZILjQP5aqujezHCM5paEIvUUxp9Sv82m85UVK044eo1yh1
	U0AY1EnMK4MLN+ScFfmiB9twEHSI8g31KvRtQQs4DHt88c3J/w3Su50d4q+QQUCdcE6spAF0xTZ
	CskG/Xbr5Qa7cfojTNli1MV+ISti6BrQ6NgFYy1KjcZDmdxQzuwsPjA4oVFWwpJAFuyBlWWLAq2
	mfj0ItTa7sea6gdKpgITWyn5cm6XiuRlEHaM6YnsYvnUrDdaD9/W1sUg4an9JtXCR1F8NhZ3zrn
	3vMaGWq4atuV34HBq/NOixP8SIPtF6jFYa17oD7IDbwzYHqhwnA0AKIlpbbxylol4dC9ZRR5pix
	FocYPnytAxhPyAF4mbAWAVbgpJQ9vr9otuR30OXje87KbHngCebUQvipwUHXMiBpeYOJHwW17z2
	L3/D7k47mTI8Hv/x91tUW9CM8oR/qZz4YvmvEwDuInaYGRcuSCX59pwDgV3M6k=
X-Received: by 2002:a05:6000:151:b0:487:21be:dcc6 with SMTP id ffacd0b85a97d-48dbaae53b4mr12788221f8f.21.1791793583338;
        Mon, 12 Oct 2026 01:26:23 -0700 (PDT)
Message-ID: <f5cb5cdc-17b0-4678-aa0b-36a0a8a00cc3@suse.com>
Date: Mon, 12 Oct 2026 10:26:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 14/15] x86/PVH: log Dom0's E820 map earlier
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
X-purgate-ID: tlsNG-16d1c6/1791793584-FCC0777B-F215BB58/10/78276251493
X-purgate-type: spam
X-purgate-size: 2038

Do this as soon as it's final. For debug builds also mark it final, with
assertions put in place to make sure it won't further be altered. (For a
release build such further altering isn't the end of the world normally,
so the situation is left alone there.)

Switch to using %pd while moving the code up.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -46,6 +46,9 @@
  */
 #define HVM_VM86_TSS_SIZE 265
 
+/* Marker set once Dom0's E820 isn't supposed to change anymore */
+static bool __initdata e820_finalized;
+
 static unsigned int __initdata acpi_intr_overrides;
 static struct acpi_madt_interrupt_override __initdata *intsrcovr;
 
@@ -195,6 +198,8 @@ static int __init pvh_steal_ram(struct d
     struct e820entry *good = NULL;
     unsigned int i = d->arch.nr_e820;
 
+    ASSERT(!e820_finalized);
+
     /*
      * Alignment 0 should be set to 1, so it doesn't wrap around in the
      * calculations below.
@@ -241,6 +246,8 @@ static int __init pvh_add_mem_range(stru
     struct e820entry *map;
     unsigned int i;
 
+    ASSERT(!e820_finalized);
+
     for ( i = 0; i < d->arch.nr_e820; i++ )
     {
         uint64_t rs = d->arch.e820[i].addr;
@@ -1759,6 +1766,13 @@ int __init dom0_construct_pvh(const stru
 
     pvh_place_initrd(bd, &elf, &initrd, &blob_start, &blob_end);
 
+    if ( opt_dom0_verbose )
+    {
+        printk("%pd memory map:\n", d);
+        print_e820_memory_map(d->arch.e820, d->arch.nr_e820);
+        e820_finalized = true;
+    }
+
     rc = pvh_populate_p2m(d, orig_e820, nr_orig_e820,
                           PFN_DOWN(blob_start), PFN_UP(blob_end));
     if ( rc )
@@ -1794,12 +1808,6 @@ int __init dom0_construct_pvh(const stru
     if ( rc )
         return rc;
 
-    if ( opt_dom0_verbose )
-    {
-        printk("Dom%u memory map:\n", d->domain_id);
-        print_e820_memory_map(d->arch.e820, d->arch.nr_e820);
-    }
-
     return 0;
 }
 


