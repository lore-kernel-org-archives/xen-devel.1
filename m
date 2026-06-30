Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADC4C43458
	for <xen-devel@archiver.kernel.org>; Tue, 30 Jun 2026 14:06:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1349001.1606793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weZ6X-00068f-Mw; Tue, 30 Jun 2026 14:06:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349001.1606793; Tue, 30 Jun 2026 14:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weZ6X-00068Y-JM; Tue, 30 Jun 2026 14:06:25 +0000
Received: by outflank-mailman (input) for mailman id 1349001;
 Tue, 30 Jun 2026 14:06:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weZ6V-00064h-Qb
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 14:06:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weZ6V-001DFv-6x
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 16:06:23 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43cd56-2eae-0a2a0a5409dd-0a2a4502b914-18
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 16:06:23 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43cd5e-5a27-0a2a45020019-d1558031e9ad-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 16:06:23 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-493ba729dbdso4037665e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 07:06:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47563d195b3sm8581655f8f.8.2026.06.30.07.06.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 07:06:22 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782828382; x=1783433182; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Yi1J6oBQQCDF544YYXBhrqWzrznLLlVPi+0upj+pGUE=;
        b=Dvd3rSRHyLiDHGHVr3xqezpDx2wF5qbLH5pWmA30t64udIPYdOZ55hPgkK4CtRSvpB
         8K0+jC10tmqWJfKNvgCwc9JxYzO/0CpMZ48tB2ukEkrWw3pbmVh6WrPsh18We3W3OOzA
         XgplcLJuM7EsVpy3d6rHoaJgTMjZtv9omB7DHWUe9ye6Tlb6pVPCeQf0WaOlx4o0Sds8
         hLxcN+BYK7+zUbZcl+CeV7j4HFzrCO5NCFynl5N+V0f6DZ5KfjjZoDqj4sxapuUjizUx
         mjS1lfVceWt9USXbBmAfiQsUXVqtROg9irfuxdp7fzk7Q4ijwzH1i2Z5LdHMeZV37dlQ
         Cl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782828382; x=1783433182;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yi1J6oBQQCDF544YYXBhrqWzrznLLlVPi+0upj+pGUE=;
        b=RnbeYbBRqwvV9ymKSvPd/LEvBRFsXyr7NhPDF1pIQqgossAwu2LRWkzKsiUdRFfhfS
         xWkAMimUSgPVF+7yrUNNxzls6ubtKTS07mZ+aEbr/XCmjaQhbCNHqSZ/shgjO5qg3xOE
         WDZECWZ84nhz8FGXaKxoxHK51KnC6GlNCcbdaFB8jN2XwX8d4Au6an7mcQs7SkRLu7zS
         OQArLjsGDcXJ+8Vdk1pvmuOwQrs0sBHTRS1cDbRZih+SHlLCUQKcfkn0hiDTBpKKb6vP
         mo1CKzX3izC/WjhW54CO5BQWfv+TxdOkg+Bh8+DICftMV56vE48Zb1KHhj/0QXmWjmCg
         ZBRw==
X-Gm-Message-State: AOJu0Yz2qW4mrMPQb8eyBVcDcDj5RLHWOOhkz/JWyBIUisxCariKVKo9
	RQMdBFQSL0d+1xW0MvuoAhMJUCMgmUloQZvQYAR4oEg6/Iwz3u05eR+3k7TWDCKUXro+ISHrmhK
	7fk0bCg==
X-Gm-Gg: AfdE7ckOY7YxtSBbth5RJTpDNDdCPKR5hDvvpX97SERU7/sfuHrPlL7Rd6PQQTH04iC
	ZnNvBeOmuy8OTmRHi32uWAc8Wv4VDogtVY/lWzIGB+rb0eNzL7sPBKVFSdnUhQ3M/pCxSnA+qWr
	57kqM7VFAvVzsJwGf3UwZMUkdv2jqjcKl5cSV6L0OgylImzOkWoWncBFgIvVkBCtAxL6xYawuE+
	HDVrkDj8bwMwbdsCxsirLkfmTgra6Aw2wJ1UhT/ZkHmIL/U0vhHgolQzWCoWreFYEoB0t4RKdUd
	IhGKo8hDyCQi4p2eo6BJFnJydvgc2a0PSGsZ4VOFWvkQ9NhX7JpMvZKhiSkoakg5Rp8STTU0yOQ
	A2ckrK8M289c/AQFzby82hvPhn1HqzGp7svt8j97Dlu2wLKr8M905Rdy8k1LDkQw+q8K44GG1oc
	gTEEu0iBnpjN3YmJL0dvgnHxY+l1X5AEdOo6DQO9LX7x1g/UgbdOGgoVRTc+GpvSl0LAroEre2P
	Qi9
X-Received: by 2002:a05:600c:8411:b0:493:a893:1200 with SMTP id 5b1f17b1804b1-493b82815d4mr49963145e9.5.1782828382542;
        Tue, 30 Jun 2026 07:06:22 -0700 (PDT)
Message-ID: <80b20aa4-8954-47ed-85f0-3f09d46717cf@suse.com>
Date: Tue, 30 Jun 2026 16:06:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 2/3] x86/Intel: split model-specific freq calculation off
 of intel_log_freq()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <f5040939-b166-4050-9a27-117b772547d4@suse.com>
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
In-Reply-To: <f5040939-b166-4050-9a27-117b772547d4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1782828383-4E7157C5-4ECB21C3/0/0
X-purgate-type: clean
X-purgate-size: 4526

..., for that logic to become reusable. While doing so undo the open-
coding of DIV_ROUND_UP(). Also switch to the new struct cpuinfo_x86 field
names.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
If Misra didn't dislike non-static functions without external callers, the
new function could be put below the old one, thus reducing churn and
improving readability of the diff (really I moved the code for the new
function up, but the diff representation is the other way around).
---
v3: New.

--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -476,51 +476,14 @@ static int num_cpu_cores(struct cpuinfo_
 		return 1;
 }
 
-static void intel_log_freq(const struct cpuinfo_x86 *c)
+static void intel_process_freq(const struct cpuinfo_x86 *c,
+                               unsigned int *min_mhz, unsigned int *max_mhz)
 {
-    unsigned int eax, ebx, ecx, edx, factor;
     uint64_t msrval;
     uint8_t max_ratio, min_ratio;
+    unsigned int factor;
 
-    if ( c->cpuid_level >= 0x15 )
-    {
-        cpuid(0x15, &eax, &ebx, &ecx, &edx);
-        if ( ecx && ebx && eax )
-        {
-            unsigned long long val = ecx;
-
-            val *= ebx;
-            printk("CPU%u: TSC: %u Hz * %u / %u = %Lu Hz\n",
-                   smp_processor_id(), ecx, ebx, eax, val / eax);
-        }
-        else if ( ecx | eax | ebx )
-        {
-            printk("CPU%u: TSC:", smp_processor_id());
-            if ( ecx )
-                printk(" core: %u Hz", ecx);
-            if ( ebx && eax )
-                printk(" ratio: %u / %u", ebx, eax);
-            printk("\n");
-        }
-    }
-
-    if ( c->cpuid_level >= 0x16 )
-    {
-        cpuid(0x16, &eax, &ebx, &ecx, &edx);
-        if ( ecx | eax | ebx )
-        {
-            printk("CPU%u:", smp_processor_id());
-            if ( ecx )
-                printk(" bus: %u MHz", ecx);
-            if ( eax )
-                printk(" base: %u MHz", eax);
-            if ( ebx )
-                printk(" max: %u MHz", ebx);
-            printk("\n");
-        }
-    }
-
-    switch ( c->x86 )
+    switch ( c->family )
     {
         static const unsigned short core_factors[] =
             { 26667, 13333, 20000, 16667, 33333, 10000, 40000 };
@@ -533,7 +496,7 @@ static void intel_log_freq(const struct
         if ( !max_ratio )
             return;
 
-        switch ( c->x86_model )
+        switch ( c->model )
         {
         case 0x0e: /* Core */
         case 0x0f: case 0x16: case 0x17: case 0x1d: /* Core2 */
@@ -578,10 +541,61 @@ static void intel_log_freq(const struct
         return;
     }
 
+    if ( min_mhz )
+        *min_mhz = DIV_ROUND_UP(factor * min_ratio, 100);
+    *max_mhz = DIV_ROUND_UP(factor * max_ratio, 100);
+}
+
+static void intel_log_freq(const struct cpuinfo_x86 *c)
+{
+    unsigned int eax, ebx, ecx, edx, min_mhz = 0, max_mhz = 0;
+
+    if ( c->cpuid_level >= 0x15 )
+    {
+        cpuid(0x15, &eax, &ebx, &ecx, &edx);
+        if ( ecx && ebx && eax )
+        {
+            unsigned long long val = ecx;
+
+            val *= ebx;
+            printk("CPU%u: TSC: %u Hz * %u / %u = %Lu Hz\n",
+                   smp_processor_id(), ecx, ebx, eax, val / eax);
+        }
+        else if ( ecx | eax | ebx )
+        {
+            printk("CPU%u: TSC:", smp_processor_id());
+            if ( ecx )
+                printk(" core: %u Hz", ecx);
+            if ( ebx && eax )
+                printk(" ratio: %u / %u", ebx, eax);
+            printk("\n");
+        }
+    }
+
+    if ( c->cpuid_level >= 0x16 )
+    {
+        cpuid(0x16, &eax, &ebx, &ecx, &edx);
+        if ( ecx | eax | ebx )
+        {
+            printk("CPU%u:", smp_processor_id());
+            if ( ecx )
+                printk(" bus: %u MHz", ecx);
+            if ( eax )
+                printk(" base: %u MHz", eax);
+            if ( ebx )
+                printk(" max: %u MHz", ebx);
+            printk("\n");
+        }
+    }
+
+    intel_process_freq(c, &min_mhz, &max_mhz);
+    if ( !max_mhz )
+        return;
+
     printk("CPU%u: ", smp_processor_id());
-    if ( min_ratio )
-        printk("%u ... ", (factor * min_ratio + 50) / 100);
-    printk("%u MHz\n", (factor * max_ratio + 50) / 100);
+    if ( min_mhz )
+        printk("%u ... ", min_mhz);
+    printk("%u MHz\n", max_mhz);
 }
 
 static void init_intel_perf(struct cpuinfo_x86 *c)


