Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1581C61DBD
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 07:01:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401607.1637151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzqb1-0002iP-MU; Fri, 28 Aug 2026 07:01:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401607.1637151; Fri, 28 Aug 2026 07:01:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzqb1-0002iI-Ic; Fri, 28 Aug 2026 07:01:51 +0000
Received: by outflank-mailman (input) for mailman id 1401607;
 Fri, 28 Aug 2026 07:01:51 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wzqb1-0002hv-23
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 07:01:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzqb0-00BS6p-Eq
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 09:01:50 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a91324f-e002-0a2a0a5209dd-0a2a4504a508-40
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 09:01:50 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a91325e-b57f-0a2a45040019-d155dd2bb479-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 09:01:50 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-482c58a8683so494707f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 00:01:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbb27936sm1770875f8f.28.2026.08.28.00.01.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2026 00:01:49 -0700 (PDT)
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
        d=suse.com; s=google; t=1787900510; x=1788505310; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PK9zMBufoVGWq6x8z32e+ws1C3h4VMgJkNucIWcX4mE=;
        b=FjJle4PiBWVqSV0EfiSFSwxt9px+/XgF6MhLqMF1/v3AaJZf0qbzJsGBw0FeBNJOLH
         7PyB4ZhprIlO8lHtjS7QervrjvK6xkeuC/RTqdN/N7N2JzAvcpFwSFbDyRo05ItY7303
         sGVlIhq2Hv35BPZM9sp4noJeVFwusZe4FNDkgqSDo7rYDfyVb6vNx+pkHU9DSSwW6wB3
         RbzSumN4mh7LiVtNY5sXb6P2FhyqlHNP7FhfVWRy3LBNv6FM9M7ChFiP5nhY4Uc5Em4+
         nikBvAeQIkq51GIq/y6908k/doo21NAiqg8U8v0bngJ7B8k9HTD+8arXjEvnf/4wKAPh
         FFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787900510; x=1788505310;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PK9zMBufoVGWq6x8z32e+ws1C3h4VMgJkNucIWcX4mE=;
        b=N3lEeQPXczeMAG1pTJjEpPBBh0nlbsEFYF8gzDEqHO6zzDa3hu3Pv6Cl0MpFnyvIlz
         v5FDpuA2UQQcaQGgzr0h+rr96ApjfU1tubza+2ICjvdVcpZL4XokRb3D5hbpoBZLHzM3
         3axR4Eha8ZMZ1qQoZCHR+bKlKkrTjFM3LQ4u6t94vTwqDOjLu1IzzrJuWQhykPtkQ05g
         d9+45NYWrfN6zyfAkoPVtaw8h60to1hVMm6pttBxeLOlgtzGgqF+au8P9SL11kDPTAB2
         aD818ZhhJE0LTbRbZlPIWb+mbFhXOLgROX1TuRL2t7dK1K6rn7NtWDhR/RAxoANN6EUB
         1IGg==
X-Gm-Message-State: AFuF++lEcSQ4wz36ar9Uc6bzbboqbxrX/Whtb24BShM5I/gopXcIylDG
	dfAGQgaGpRcHJD0iyvhxQbvx8eKpHePaU8KbB6EEs4jhnoThcpO9xn5xciFFbdEK0GdQ9EgoJBk
	FbOu/cA==
X-Gm-Gg: AR+sD108FDDm1h41feWvyHZ9giD0qjG7PrO/aq1DOBGXq4vJO/0ozjidQRZ65orh5T5
	HWwPnJMQAd+wjhZyJPO8Ptek9UVCrPQvSN4tJJpl35FJEQHExugk18rKlqJO1eEyHuDyhp2Xjef
	ZH6DX22q6rhVq4pgiJceiAGIH0XSco4LiNTvB2ApADYBfcvufantlXdh78gOADR5WJIEfuIyYi7
	9BRYsHkOphjUHlL+oewcHUAIKBx3qACc4ZbR3DgTceSZfKp5noM6ssatO0RzeqPhZda2ddrUFsW
	HZnSknvBtG4IOfFemTy9zolyCuEbpqX+2Xoq9J8LBE0vQSznWier4xOn5Bnx0kUPJ+643e2JB10
	Cus/gcpgt/KzYacN6ap3fOVYqabDsFbopUVdQuf418Z/EhCOM7YUHvndtPQ4xMWK62OdB5+MLfT
	B3kmxgoGMnVI1G1+aiNOgc3+7ksHq7pyaP6F8D+/VQjqW5SJw/c/e20etIslg7qzA/e6ZNDW+86
	WRwgzppBvh3JkYkew8tP/vArFWFGIxk0lTa2E43i+q8aEIpd+4nrVl6ajWJIwc=
X-Received: by 2002:a05:6000:2904:b0:482:ea9b:962c with SMTP id ffacd0b85a97d-482f79c91e1mr7402311f8f.22.1787900509801;
        Fri, 28 Aug 2026 00:01:49 -0700 (PDT)
Message-ID: <d0f991de-db67-4f49-aef0-25c590b3889e@suse.com>
Date: Fri, 28 Aug 2026 09:01:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 04/12] x86: add noreturn in a few more places
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
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
In-Reply-To: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1787900510-502E4B50-9F64A953/0/0
X-purgate-type: clean
X-purgate-size: 4001

start_secondary(), do_double_fault(), play_dead(), and tboot_s3_error()
never return, so would better be annotated anyway. The do_double_fault()
change needs accompanying by adjustments to entry_from_{pv,xen}(), as
Eclair then deems the "return" there as unreachable.

context_switch() and continue_running() are odd: We can't
(unconditionally) add noreturn to their declarations, as Arm's variants do
return. Put the attribute on x86'es definitions instead (the use of
unreachable() in reset_stack_and_call_ind() allows the compiler to figure
that out itself, but Eclair wants the annotation in addition).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
entry_from_pv() wants the annotation only when PV=n, yet once added gcc
then warns about "return" being used in a "noreturn" function. Is there
any other approach to address this besides adding #ifdef inside the
function (i.e. replacing the !IS_ENABLED(CONFIG_PV) check that's there)?

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2163,7 +2163,7 @@ static void __context_switch(void)
     per_cpu(curr_vcpu, cpu) = n;
 }
 
-void context_switch(struct vcpu *prev, struct vcpu *next)
+void noreturn context_switch(struct vcpu *prev, struct vcpu *next)
 {
     unsigned int cpu = smp_processor_id();
     struct cpu_info *info = get_cpu_info();
@@ -2240,7 +2240,7 @@ void context_switch(struct vcpu *prev, s
     reset_stack_and_call_ind(nextd->arch.ctxt_switch->tail);
 }
 
-void continue_running(struct vcpu *same)
+void noreturn continue_running(struct vcpu *same)
 {
     reset_stack_and_call_ind(same->domain->arch.ctxt_switch->tail);
 }
--- a/xen/arch/x86/include/asm/cpuidle.h
+++ b/xen/arch/x86/include/asm/cpuidle.h
@@ -26,7 +26,7 @@ static inline int mwait_idle_init(struct
 int cpuidle_init_cpu(unsigned int cpu);
 void cf_check default_dead_idle(void);
 void cf_check acpi_dead_idle(void);
-void play_dead(void);
+void noreturn play_dead(void);
 void trace_exit_reason(u32 *irq_traced);
 void update_idle_stats(struct acpi_processor_power *power,
                        struct acpi_processor_cx *cx,
--- a/xen/arch/x86/include/asm/tboot.h
+++ b/xen/arch/x86/include/asm/tboot.h
@@ -126,7 +126,7 @@ int tboot_in_measured_env(void);
 int tboot_protect_mem_regions(void);
 int cf_check tboot_parse_dmar_table(acpi_table_handler dmar_handler);
 int tboot_s3_resume(void);
-void tboot_s3_error(int error);
+void noreturn tboot_s3_error(int error);
 int tboot_wake_ap(int apicid, unsigned long sipi_vec);
 #else
 static inline void tboot_probe(void) {}
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -326,7 +326,7 @@ static void set_cpu_sibling_map(unsigned
     }
 }
 
-void asmlinkage start_secondary(void)
+void asmlinkage noreturn start_secondary(void)
 {
     struct cpu_info *info = get_cpu_info();
     unsigned int cpu = smp_processor_id();
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1080,7 +1080,7 @@ const char *vector_name(unsigned int vec
     return (vec < ARRAY_SIZE(names) && names[vec][0]) ? names[vec] : "???";
 }
 
-void asmlinkage do_double_fault(struct cpu_user_regs *regs)
+void asmlinkage noreturn do_double_fault(struct cpu_user_regs *regs)
 {
     unsigned int cpu;
     struct extra_state state;
@@ -2304,7 +2304,7 @@ void asmlinkage entry_from_pv(struct cpu
     case X86_ET_HW_EXC:
         switch ( vec )
         {
-        case X86_EXC_DF: return do_double_fault(regs);
+        case X86_EXC_DF: do_double_fault(regs); /* noreturn */
         case X86_EXC_MC: return do_machine_check(regs);
         }
         break;
@@ -2615,7 +2615,7 @@ void asmlinkage entry_from_xen(struct cp
     case X86_ET_HW_EXC:
         switch ( regs->fred_ss.vector )
         {
-        case X86_EXC_DF: return do_double_fault(regs);
+        case X86_EXC_DF: do_double_fault(regs); /* noreturn */
         case X86_EXC_MC: return do_machine_check(regs);
         }
         break;


