Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F9EC5DF6D
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 11:46:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395235.1633722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwek4-0006sq-40; Wed, 19 Aug 2026 11:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395235.1633722; Wed, 19 Aug 2026 11:46:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwek4-0006sj-1F; Wed, 19 Aug 2026 11:46:00 +0000
Received: by outflank-mailman (input) for mailman id 1395235;
 Wed, 19 Aug 2026 11:45:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwek2-0006oh-J7
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 11:45:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwek1-009yRN-Vq
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 13:45:57 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a859767-8faa-0a2a0a5109dd-0a2a45089208-24
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 13:45:57 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a859775-f659-0a2a45080019-d1558030b414-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 13:45:57 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4998590d392so8628595e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 04:45:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14c33b3sm4839260f8f.27.2026.08.19.04.45.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 04:45:57 -0700 (PDT)
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
        d=suse.com; s=google; t=1787139957; x=1787744757; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D6LUuo5zHGa6LkJrIlKdcQpNkQpydOsK91r6s2OSYDA=;
        b=XImVF8rAkJMrXqQFY6SS011LItDlYlps2+B5ZOb7ru0eHaoyNdDf9/JZTsTzxnpVME
         OqH8pCOA6L/W+Nri4NlwukLDhnb9+DVI7oAH9o/yWdaga3dYTofDSK+2K9BGPbJ6MFWB
         hQQIMRO1lk0Ja246BY4gIBtIkDtsaVCnbZrZlXOZDQuBM7LWMtd8Hlqje83mvXg1Io26
         esXKhHUaLdGtJ+USrsp+632Aj1kLPrfYxV+WOqX8s1bZmGJ46lkQDHhH3PYDOVDbe2bx
         XCeEcpeiP2o2M8T0DWRhbvlDrKszbhXxXh9Il8HaEB/CzKp2qrsCQem5DeOP6qf5aFr1
         FR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787139957; x=1787744757;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D6LUuo5zHGa6LkJrIlKdcQpNkQpydOsK91r6s2OSYDA=;
        b=iXNH3cw0cIU9qBVk6wLcjyZTywrGbFhVi5G3FjN305MCktTTl0sHTXmusml2bt58Wc
         5OhYJND7BBGvoQWKUhQulnJ2lS3FJZBrmY7F911IGn86CI30/D7ZU7qWfuhkZS4ANTEx
         mA3AneoP2tJkBzssXd3oDCvVZh8zg4ysxkVRXyRK1XGGIuj+b5lKp6ue0UJbU+pbgBl/
         wdZPVcF1VfVq68wvipHvnNXaja+E/aCU4goNx5YLli9a632KrZ8aj4TfQKMjqsb+y5tJ
         Hit6QxqQON8QnX7/tx8RcEyyC6X0lBwulwMz7MlqoZAFqv92VgSGVJHCDSjBsKn+iTyN
         kOeQ==
X-Gm-Message-State: AOJu0YzUasfXbJKZU8490FLIQc1fIHI0fi3K3czWFJ9EJkRxT7msxytl
	Cz++9DEAYVD+jbmr0uCQpFjCgiNTkbB1vJ2FOf+7sBDuJYyaYDi/3CGCBIO7K+n0smOGtAgK9Ol
	Hprk5oA==
X-Gm-Gg: AR+sD10+R7TMcVznXu1Wfoozb7gpIdFHUbjoaUrAmCN836IbvBN8upErn8NqgAn3vbv
	+HXdV9jAW0w4zd1vlqQT6wRre199YiQF6osfyi1xJCNoGHbDiOb10m9q6kv8hvJmAGHwLMjJ3aO
	VljsAGSEJnfVmdLqk2Cb3rel/8m4hB3uxGkhIUJI3lX/LndHfomJkxm2ywcxXCyAcD21T4P8IlD
	xR/uTS+M2xl69JZ5TeLnZW2sWxpgy+NyUt/7GZkUNTOEYBUd6kzIWVGNkjMcC9HRsL+VzJAOYSK
	IQfFJeM/hT86G9bObTrDDU9m+nnOQPgP0u4X+JPUceeAbIeQDw4DaenByeL6b8ejjziUDfYrb9D
	qJBe+3jzHpvQip+BZDIO1ymlM1a73CGm1VCLMb98+oUvUrlN78s2ViMJtxT5FTnWox2C+aoo/Xl
	uARrfQdYjvaGuxzXRcfldzdw2SA1e9ClJchwbDfNsAmhrpx+S+9Xei3rH9vO11QX8wXJJuDYkmA
	+iDNmHMTBDE7jrygnuvvMG1OliVFHSNCKLmMN+Z2qHc2e/Xb+cE
X-Received: by 2002:a05:600c:37c6:b0:499:9eb7:4558 with SMTP id 5b1f17b1804b1-499aa1e43b7mr77400005e9.10.1787139957333;
        Wed, 19 Aug 2026 04:45:57 -0700 (PDT)
Message-ID: <cb8d9a90-64ce-4e86-a188-36a32fe02970@suse.com>
Date: Wed, 19 Aug 2026 13:45:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 2/2] x86/time: avoid early uses of NOW() to return zero
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>
References: <ec25e838-6bf6-496c-abbe-0fd71e2fb0d9@suse.com>
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
In-Reply-To: <ec25e838-6bf6-496c-abbe-0fd71e2fb0d9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1787139957-D614687B-ED93BEB1/0/0
X-purgate-type: clean
X-purgate-size: 6163

Waiting loops like the one in flush_command_buffer() will degenerate to
infinite ones when used early enough for NOW() to still return constant
zero. Make sure the returned value at least monotonically increases. When
available, use nominal frequency values as initial approximation.

Do this only in get_s_time(), as producing a sane value in
get_s_time_fixed() for non-zero inputs won't be reasonably possible.
Put an assertion there.

Reported-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: While generally the mentioned waiting loops will take longer to time
     out, on a very fast CPU tight loops may time out too early.

With "x86/time: set AP's TSC scale estimate earlier" the counter update
may not need to be atomic anymore, as then only the BSP can reasonably hit
that path.

I don't think Fixes: tags should be put here. If we did, we'd have to
enumerate all introductions of early uses of NOW() (or get_s_time()), with
the exception of those dealing with getting back 0 (which I expect is only
printk_start_of_line()). Will want backporting nevertheless (unless deemed
too risky).
---
v5: Move addition to early_cpu_init() down. Adjust commentary there.
v3: Use "high" / "max" freq if "nominal" isn't available. Set NOW_good.
v2: Add assertion to get_s_time_fixed(). Use nominal frequencies for very
    early setting, if available.

--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -19,6 +19,7 @@
 #include <asm/random.h>
 #include <asm/setup.h>
 #include <asm/shstk.h>
+#include <asm/time.h>
 #include <asm/xstate.h>
 
 #include <public/sysctl.h>
@@ -444,6 +445,39 @@ void __init early_cpu_init(bool verbose)
 
 	if (!(c->vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
 		park_offline_cpus = opt_mce;
+
+	/*
+	 * If nominal freq isn't available, use highest, thus causing NOW()
+	 * output to move more slowly.  See preset_tsc_scale().
+	 */
+	if (c->cpuid_level >= 0x15) {
+		cpuid(0x15, &eax, &ebx, &ecx, &edx);
+
+		if (ecx && ebx && eax)
+			preset_tsc_scale(DIV_ROUND_UP(ecx * 1UL * ebx, eax));
+		else if (c->cpuid_level >= 0x16) {
+			/* Assume CPU base freq ≈ TSC freq. */
+			cpuid(0x16, &eax, &ebx, &ecx, &edx);
+			if (eax)
+				preset_tsc_scale(eax * 1000000UL);
+			else if (ebx)
+				preset_tsc_scale(ebx * 1000000UL);
+		}
+	} else if (c->vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) {
+		unsigned int nom_mhz = 0, hi_mhz = 0;
+
+		amd_process_freq(c, NULL, &nom_mhz, &hi_mhz);
+		if (nom_mhz)
+			preset_tsc_scale(nom_mhz * 1000000UL);
+		else if (hi_mhz)
+			preset_tsc_scale(hi_mhz * 1000000UL);
+	} else if (c->vendor & X86_VENDOR_INTEL) {
+		unsigned int hi_mhz = 0;
+
+		intel_process_freq(c, NULL, &hi_mhz);
+		if (hi_mhz)
+			preset_tsc_scale(hi_mhz * 1000000UL);
+	}
 }
 
 void reset_cpuinfo(struct cpuinfo_x86 *c, bool keep_basic)
--- a/xen/arch/x86/include/asm/time.h
+++ b/xen/arch/x86/include/asm/time.h
@@ -23,6 +23,7 @@ mktime (unsigned int year, unsigned int
 int time_suspend(void);
 int time_resume(void);
 
+void preset_tsc_scale(unsigned long freq);
 void init_percpu_time(void);
 void time_latch_stamps(void);
 
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -476,8 +476,8 @@ static int num_cpu_cores(struct cpuinfo_
 		return 1;
 }
 
-static void intel_process_freq(const struct cpuinfo_x86 *c,
-                               unsigned int *min_mhz, unsigned int *max_mhz)
+void intel_process_freq(const struct cpuinfo_x86 *c,
+                        unsigned int *min_mhz, unsigned int *max_mhz)
 {
     uint64_t msrval;
     uint8_t max_ratio, min_ratio;
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -417,6 +417,9 @@ static inline uint8_t get_cpu_family(uin
     return fam;
 }
 
+void intel_process_freq(const struct cpuinfo_x86 *c,
+                        unsigned int *min_mhz, unsigned int *max_mhz);
+
 #ifdef CONFIG_INTEL
 extern int8_t opt_tsx;
 extern bool rtm_disabled;
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1664,6 +1664,9 @@ s_time_t get_s_time_fixed(uint64_t at_ts
     const struct cpu_time *t = &this_cpu(cpu_time);
     uint64_t tsc, delta;
 
+    /* scale_delta() degenerates when the scale wasn't set yet. */
+    ASSERT(t->tsc_scale.mul_frac);
+
     if ( at_tsc )
         tsc = at_tsc;
     else
@@ -1679,6 +1682,20 @@ s_time_t get_s_time_fixed(uint64_t at_ts
 
 s_time_t get_s_time(void)
 {
+    /*
+     * Before the TSC scale is set, avoid returning constant 0 (or whatever
+     * this_cpu(cpu_time).stamp.local_stime is set to).  While the returned
+     * value is in no way representing time, it at least increases
+     * monotonically, thus avoiding e.g. waiting loops to degenerate to
+     * entirely infinite ones.
+     */
+    if ( unlikely(!this_cpu(cpu_time).tsc_scale.mul_frac) )
+    {
+        static s_time_t counter;
+
+        return arch_fetch_and_add(&counter, 1);
+    }
+
     return get_s_time_fixed(0);
 }
 
@@ -2632,6 +2649,22 @@ int __init init_xen_time(void)
     return 0;
 }
 
+/* BSP-only function to pre-set an approximate TSC scale. */
+void __init preset_tsc_scale(unsigned long freq)
+{
+    struct cpu_time *t = &this_cpu(cpu_time);
+
+    /*
+     * The incoming frequency is only approximate (nominal).  Increase it by
+     * 1% to make NOW() output rather a little too slow than too fast, thus
+     * avoiding a possible backwards jump once the final scale is set.
+     */
+    freq += DIV_ROUND_UP(freq, 100);
+
+    set_time_scale(&t->tsc_scale, freq);
+    t->stamp.local_tsc = boot_tsc_stamp;
+    NOW_good = true;
+}
 
 /* Early init function. */
 void __init early_time_init(void)
@@ -2649,6 +2682,9 @@ void __init early_time_init(void)
                    "TSC ADJUST set to %lx on boot CPU - clearing\n", tmp);
             wrmsrl(MSR_IA32_TSC_ADJUST, 0);
             boot_tsc_stamp -= tmp;
+
+            if ( t->stamp.local_tsc )
+                t->stamp.local_tsc -= tmp;
         }
     }
 


