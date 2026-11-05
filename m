Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E477606A329
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 13:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=C5TEFs1G
Received: from list by lists.xenproject.org with outflank-mailman.1474731.1681731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOxe3-0001YA-RL; Thu, 05 Nov 2026 13:36:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474731.1681731; Thu, 05 Nov 2026 13:36:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOxe3-0001Y2-OI; Thu, 05 Nov 2026 13:36:47 +0000
Received: by outflank-mailman (input) for mailman id 1474731;
 Thu, 05 Nov 2026 13:36:46 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOxe1-0001VL-V2
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 13:36:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOxe1-003y6U-Bl
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 14:36:45 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec8661-e002-0a2a0a5209dd-0a2a450394d4-48
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 14:36:45 +0100
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec866c-fae8-0a2a45030019-d155dd36d4c2-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 14:36:44 +0100
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-48e00eee27dso1085478f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 05:36:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b572bba207sm63028385e9.10.2026.11.05.05.36.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 05:36:43 -0800 (PST)
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
        d=suse.com; s=google; t=1793885804; x=1794490604; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FfJeD3ix+Q2sHIalbTxwbncwzv13LvQuwahnvUzAa/k=;
        b=C5TEFs1GLwTS+HFu2Z5eg2A1sNv6PAmYq15EeRY79gk3624nvjg27umuv7Snb1ZWtu
         aLHsKfX0ykZKmN9IICrtdi1k60pmlUX0EjSAwbFiXVp2P+qqY1fioKnDook7O8yPXT/J
         ouqp5QpVXzBXPRal0BBz+ceeeXjdItCFHOWLapqljcRSp/X0800dGf8GyEAEECG19+Bq
         /w3wGhcUvRGtaSrlcCtHD3riKJDawIe6tqQCPkqs1lZmAKxxBQchptY2HkU4xhYKy2xl
         5FNv47PxdJC0dbD65zdbfLDWafz+4Sxcj7oK9XVrvsgPkeIJVcZVK3QaeZRWV9mGuj/a
         Mr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885804; x=1794490604;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FfJeD3ix+Q2sHIalbTxwbncwzv13LvQuwahnvUzAa/k=;
        b=X6Lffo/BZYAhA/TAi/UcB7eiP/rCPUElP5YWjqD/SkBRpap7V+z1EFlYTupW3r7xFG
         1FUfL3LfkKIgKFVyYPiGgYqAcT/qjCcXk4vQOfpKlS/ARe+hJesLDM46cVCG4SiItbQI
         ySOl5hwyOXuIktMReKa5XnON+a5G4dTj7U8QEgbyhyhqqE0uPcHxBjKqK72P0qyVgV5M
         oVUNkVYNLMlVaWg5Hb43+Ql5f4kz1G/oGbRXnDkjA1OhNFdhrPnmY6dqZcjgmLbdLVIV
         cr9DgWaVayV5zjEWMk8XsZb5F9I1U1C8mFGeVX4BTcFILh8cBfzgaL2qNjBokjddxII8
         ODJg==
X-Gm-Message-State: APuU4Z/NyYM6DSo5oHkYi3XvLaWwdtkE4ktAWmTQaLZrZ8mQilK1hYc+
	/d4tXtu5N/IVIkNUxbysyk5Qe40eWQi+mOihYr/rS7IjMbr9MLYYBQ5lpyqCY1dFTzCLrFy/BnG
	PlKwz8g==
X-Gm-Gg: AYBFou0fkZjRjk4rORMP80fE0+4MxiF4+xWplXtQlIzVlWAxV0z30c+8VzCXBOuVEP7
	x5TZ5HbvvHU7yTRA+SmdIUpkVI19Y8zJuSsxq5F65r2QoscVpIU7Cbspr1r2sf79uZsQtWcHYRe
	ErOnoidn+cq7PsmsiQuMTAJcsaxiVQsPzSGq4m66cjLDQtzekJpRNBBf9hc9canx3ATthF/BQKe
	ogseuJ9BC1QEq9rdDG2w8y0L1bDgli248ygsdaIT1Che4Js0Ct1fLTuHtnZ5sxfKtV73kab/4JM
	HgHOYrPzQcsZZM3oSxiogwt+zEvkzcYRoYIya6vj00ZswZDFIc1aBiwAaJzTz6ukEo/8Qii1JqH
	cIqWf62pCxjyt+Z9tKOqU1zfgxB19LPqEtYjK32NHrKW9D4ClpxoTLJfCNpLmuONhEJ/VcqYrYy
	vdF5vkQbZRnzDY5d0HmdE1F+ybuCNuluzH1pjXFSP5LJJHH+lnknZwr7EMXvfm6mjOW1UCCEPbM
	DCFK9uY+j2kFG3FCSXxHRttEIkFOrsEw5YyrxPcUVjxro231nTu3MZfofUmmOR3Rsc+62miZzZ4
	v/W5vJzH8xJ4SwDzo4YiKORGuvR08XMOykokj1/tefMoTXZs6CDVRvZcIGSzT9PEuoNuAkqsmLg
	mVYO0U6kTuRDBtOA=
X-Received: by 2002:a05:600c:1f93:b0:4a5:87b3:ddc1 with SMTP id 5b1f17b1804b1-4ac180f1ec7mr442644015e9.13.1793885804326;
        Thu, 05 Nov 2026 05:36:44 -0800 (PST)
Message-ID: <67c62b56-e18d-464b-b2f0-0b3b4c184594@suse.com>
Date: Thu, 5 Nov 2026 14:36:43 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 12/14] x86/PVH: log Dom0's E820 map earlier
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
X-purgate-ID: tlsNG-33051d/1793885804-6C6DE4E9-A17A8F5A/10/78276251493
X-purgate-type: spam
X-purgate-size: 1900
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Do this as soon as it's final. For debug builds also mark it final, with
assertions put in place to make sure it won't further be altered. (For a
release build such further altering isn't the end of the world normally,
so the situation is left alone there.)

Switch to using %pd while moving the code up.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger@xenproject.rog>
---
v2: Set e820_finalized unconditionally. Re-base over changes earlier in
    the series.

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
 
@@ -248,6 +251,8 @@ static int __init pvh_add_mem_range(stru
     struct e820entry *map;
     unsigned int i;
 
+    ASSERT(!e820_finalized);
+
     for ( i = 0; i < d->arch.nr_e820; i++ )
     {
         uint64_t rs = d->arch.e820[i].addr;
@@ -1744,6 +1749,14 @@ int __init dom0_construct_pvh(const stru
 
     pvh_place_initrd(bd, &elf, ram, &initrd, &blob_start, &blob_end);
 
+    if ( opt_dom0_verbose )
+    {
+        printk("%pd memory map:\n", d);
+        print_e820_memory_map(d->arch.e820, d->arch.nr_e820);
+    }
+
+    e820_finalized = true;
+
     rc = pvh_populate_p2m(d, orig_e820, nr_orig_e820,
                           PFN_DOWN(blob_start), PFN_UP(blob_end));
     if ( rc )
@@ -1781,12 +1794,6 @@ int __init dom0_construct_pvh(const stru
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
 


