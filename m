Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBFE606A32D
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 12:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eqjsBA9+
Received: from list by lists.xenproject.org with outflank-mailman.1469732.1678488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOE0b-0007rz-Rf; Tue, 03 Nov 2026 12:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469732.1678488; Tue, 03 Nov 2026 12:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOE0b-0007ro-OH; Tue, 03 Nov 2026 12:53:01 +0000
Received: by outflank-mailman (input) for mailman id 1469732;
 Tue, 03 Nov 2026 12:53:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOE0Z-0007r1-Ua
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 12:53:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOE0Z-007Ext-BD
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 13:52:59 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9d921-e002-0a2a0a5209dd-0a2a45089714-26
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 13:52:59 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9d92a-f659-0a2a45080019-d155802bac23-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 13:52:59 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a59100fa83so37194215e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 04:52:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b2a9faff90sm63361015e9.5.2026.11.03.04.52.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2026 04:52:58 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793710378; x=1794315178; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8VuaqkQPqBjqBACTzffN206lpD6yNEaHP3dOmoVJUos=;
        b=eqjsBA9+ZGoniSw0Y+GYl1UdyRpxwaRkM8LXXPSHIxCLaItg0WBywVJgZXeiluWkCc
         wn6nfQVtnMuTpQC1Td1GuEPIeEmFez4FtHbfJUcH2aEU7kga9yDkISSCK0iqDOVdnpDW
         1nrOIUjd70oZAgJwt3WCxNGXg2XinBeBuonHu67YrnUpOU/FOcKY1bZAhI1pGlwe6yx8
         uAnSNQop/38vqBze+x7VR4mnRgimN3a1fWCEquh4Sin8qnvdDqEf8Xa0YLqfvvSoYSk+
         svq7xSEEa4VMeVmRd3rt2bYrkuU0jNWx0qfdBBpZDjVsGnF3bmArqAbZCSB83JaqgB0e
         RPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793710378; x=1794315178;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8VuaqkQPqBjqBACTzffN206lpD6yNEaHP3dOmoVJUos=;
        b=d3Y1+ZC7F3qbFzD0N0JXPSKwUPQvzOiQlWIx32MeUYwGq2H5y1eWd7IgVnJiwvo+DG
         /AtVlrxxm6Fjdv6bo5/T79TAW6yeGrkYuh2gxqC2HYjcJQOea5uKr5RmZcq4vpCkv+8r
         apNEegEgCbhNgzeQilzyyk+Pfgay3HviT65xlrJ+Qmh5PPx+8tR4y2eCW1En8g9q+ehc
         eqCHy6/8QXMYcCYEfNRUYhRM7HNPNj3H+em+gSTll8VrQUoTbRL6PN6WCHZMtEaEqSck
         6O6I3LidC2hD0UPdxu3bTGKoNwfpPXhBYEKKK7LdlMXhVKD8IVycSJXpOhrRzQOqPEQa
         BwIQ==
X-Gm-Message-State: APuU4Z8b4Nnt1hKunctu7QuBNj47eBWmU+tiaKD119jmy4zkE1nJe0aT
	iopprefSeKFQB+Rhv3EdlIWrgZb/0nkgnaLf/kHGsZyyHsCo6KTih7brbwSWEcMEwZm8yVpzhMK
	x9OJxMQ==
X-Gm-Gg: AYBFou0RhcDQPAqW7MM+BKTO7TxBhQHiZQEJY/bVtQqCKKlrDyyBX5bzDEzHcrZzhUq
	Hr79KHj7zx2Y63WaLC3gzexhveke+yG4ECJIugln7PLWTD4E6nVKs+Fk1E057TK58rOw8C/iFP7
	3UZU+m3UMO5+thK1s3YaqZ7wWUF1a1hEIVojFPtzAW32baHKMvJ/zl3Da9g4UvsT9wX+KLstIsC
	0ipCG2d3mw1024upKAAVh3Ycpj3DfHxlmwmc0mvZvoDSGVnNsdV9eiAIamXNVtwLGRnyv0AvETp
	ffCsX8xogWcsa2OORZWATR9KkfKephtvfdOgY4Vt2YqOkByLfqgZPXdiCCoPvwVsZYyrDvWAZYF
	aGLobzXnhBh9HpkZCm6Af+Z/VETvGxPxcZubIAdg7KTOmph/wWBxElygQaSoUyFEVbQpbWsoFb/
	M94xXepw0maA74wueV1t43xhLcUu6lNl5WlK7V7oAeIP+C8UJMrFeNDXYOTcIsOeQ+kNlq9ghC+
	/dus4yf7/rOiXC1mpoHAnB4wdSpp0xAkX5fvLxbYrpG+XGyl+XcRzMVC/XmQqAYo7rX/O0q7o8R
	nf3N/hJZ0BqzDwF4PFNEQiE7URZK/MgERRPill/vaRcvIRW/7An+Rbgc6LoZVVf3STzqW2fFwit
	tNeeV7Mj3c2bEp8aQ
X-Received: by 2002:a05:600c:4ece:b0:4a2:40:8d2c with SMTP id 5b1f17b1804b1-4ac17b2c396mr285826445e9.26.1793710378476;
        Tue, 03 Nov 2026 04:52:58 -0800 (PST)
Message-ID: <4da146da-26ee-4ecd-a747-130ed0783324@suse.com>
Date: Tue, 3 Nov 2026 13:52:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/cpuidle: allocate processor_powers[] dynamically
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1793710379-D477387B-A1513A6A/10/78276251493
X-purgate-type: spam
X-purgate-size: 3185
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

There's no need to have a NR_CPUS-dimensioned static array there.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Some of the new conditionals checking processor_powers may arguably want
to check (really: might better have been put there long ago) xen_cpuidle
instead. Thoughts?

--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -44,6 +44,7 @@
 #include <xen/smp.h>
 #include <xen/softirq.h>
 #include <xen/trace.h>
+#include <xen/xvmalloc.h>
 
 #include <asm/apic.h>
 #include <asm/cpuidle.h>
@@ -149,7 +150,7 @@ custom_param("max_cstate", parse_cstate)
 static bool __read_mostly local_apic_timer_c2_ok;
 boolean_param("lapic_timer_c2_ok", local_apic_timer_c2_ok);
 
-struct acpi_processor_power *__read_mostly processor_powers[NR_CPUS];
+struct acpi_processor_power **__read_mostly processor_powers;
 
 /*
  * This field starts out as zero, and can be set to -1 just to signal it has
@@ -447,7 +448,9 @@ static void cf_check dump_cx(unsigned ch
 
 static int __init cf_check cpu_idle_key_init(void)
 {
-    register_keyhandler('c', dump_cx, "dump ACPI Cx structures", 1);
+    if ( processor_powers )
+        register_keyhandler('c', dump_cx, "dump ACPI Cx structures", 1);
+
     return 0;
 }
 __initcall(cpu_idle_key_init);
@@ -1339,6 +1342,9 @@ long set_cx_pminfo(uint32_t acpi_id, str
     if ( vendor_override > 0 )
         return 0;
 
+    if ( !processor_powers )
+        return -ENOMEM;
+
     print_cx_pminfo(acpi_id, power);
 
     cpu_id = get_cpu_id(acpi_id);
@@ -1512,12 +1518,14 @@ static void amd_cpuidle_init(struct acpi
 #ifdef CONFIG_PM_STATS
 uint32_t pmstat_get_cx_nr(unsigned int cpu)
 {
-    return processor_powers[cpu] ? processor_powers[cpu]->count : 0;
+    return processor_powers && processor_powers[cpu]
+           ? processor_powers[cpu]->count : 0;
 }
 
 int pmstat_get_cx_stat(unsigned int cpu, struct pm_cx_stat *stat)
 {
-    struct acpi_processor_power *power = processor_powers[cpu];
+    struct acpi_processor_power *power = processor_powers
+                                         ? processor_powers[cpu] : NULL;
     uint64_t idle_usage = 0, idle_res = 0;
     uint64_t last_state_update_tick, current_stime, current_tick;
     uint64_t usage[ACPI_PROCESSOR_MAX_POWER] = { 0 };
@@ -1694,6 +1702,15 @@ static int __init cf_check cpuidle_presm
     if ( !xen_cpuidle )
         return 0;
 
+    processor_powers = xvzalloc_array(struct acpi_processor_power *,
+                                      nr_cpu_ids);
+    if ( !processor_powers )
+    {
+        printk("CPUIDLE: disabled - not enough memory\n");
+        xen_cpuidle = 0;
+        return -ENOMEM;
+    }
+
     mwait_idle_init(&cpu_nfb);
     cpu_nfb.notifier_call(&cpu_nfb, CPU_UP_PREPARE, cpu);
     cpu_nfb.notifier_call(&cpu_nfb, CPU_ONLINE, cpu);
--- a/xen/arch/x86/include/asm/cpuidle.h
+++ b/xen/arch/x86/include/asm/cpuidle.h
@@ -5,7 +5,7 @@
 #include <xen/notifier.h>
 #include <xen/sched.h>
 
-extern struct acpi_processor_power *processor_powers[];
+extern struct acpi_processor_power **processor_powers;
 
 extern void (*pm_idle_save)(void);
 

