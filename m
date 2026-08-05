Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA44C55822
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 09:25:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383163.1626423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrXrs-0007Mi-Ji; Wed, 05 Aug 2026 09:24:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383163.1626423; Wed, 05 Aug 2026 09:24:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrXrs-0007Ma-Gd; Wed, 05 Aug 2026 09:24:56 +0000
Received: by outflank-mailman (input) for mailman id 1383163;
 Wed, 05 Aug 2026 09:24:55 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrXrq-0007Kl-Um
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 09:24:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrXrq-006ZxT-BP
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 11:24:54 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a73015e-2eae-0a2a0a5409dd-0a2a450ca81c-14
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 11:24:54 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a730166-f479-0a2a450c0019-d155dd35a468-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 11:24:54 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-47fde295992so609364f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 02:24:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47febfda0bfsm7238538f8f.5.2026.08.05.02.24.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 02:24:53 -0700 (PDT)
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
        d=suse.com; s=google; t=1785921894; x=1786526694; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0P8KtrMj33FZR9rXeuoR9W9HprP82JFkO8XpOVKL9W4=;
        b=WPTDfsHNT8Z/EIrSOINwOfKJpAGhXfcA0SpipIh8GZfrLtsW/etJkbFroeZJ8dBDvW
         h/Vj2fztfzLh5RXJOg0MwsR+OGNp2EwwWrAWOZvpUPNGGYMQws2yRfnA48I7eHtb8NmJ
         8IKiZboOeVqKIUNq0K9WqCcfTN+ExCvwjkp5qfg/ZzPlrj5l/LayeeG/llHg6uo/ibH8
         Tw0EY3r/wTea3Hyxf9zb498JktsDFq17f2InIPpCU32AhcDoGUJUCjueZf6ziCPq5bHH
         JJNsDlXH7PAvi5r5nNAau+eu28qkRzLPx58a9UhZN4DYvgjAEykx6+/YBDQQWE1D46M2
         BO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785921894; x=1786526694;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0P8KtrMj33FZR9rXeuoR9W9HprP82JFkO8XpOVKL9W4=;
        b=MfyVl3XqwW4Q3mjlkWd0OCcL328Owe8ziRlhx14eTe/18kC8YQL8N9cJyB849k0VLz
         RF4qzBTmh3LU7bsS1Qo1klyvCUAlPbnXX5QR1THyg83IFukXiXlk/vTCyUKdOfqBFz7c
         qfdOZs//ECBUKmsZ6s9d+F7ZxeAuly6U5Qa2bMpMFYSYgdmGa2LzPwtyr4aNzXxdbIKQ
         zhphKMxq9jxvZxylDQwUd4BpqrMeHgLt0wRo+B2CY//i7Rc7kMndt/6zNguvBpDSXTz4
         iJu6MTyA9LEup1uV7uzD28BgEuCbvY14ZqcM/2gU9INkw3N9leqG5pfJ6sC9CSQ89P7g
         f1kQ==
X-Gm-Message-State: AOJu0Yw2o3zguHjSGs9XvlrTFq21LRczrE64u8x4UklDSSg+vVKTO8LQ
	tgE/UHtcdPwTfB6dumXUklLq3YjUIMxKd6R6DKDBHRVhvh8jWNb6rO5ex7w7/z2ui4FupVDD7sF
	PO/nlOA==
X-Gm-Gg: AR+sD11+z7NlHEjhl3rIYHAZd9Xbv/i2Z+xNnw6cwUhEd3JZCX7znl6Mn/EVz3MuUDm
	9IvocjZo9DeS5c4D9WlssYUDaFVhwDm3hmrB3OVoSd25mkMbH6mqoLsvl7omOeGYfCYGRxNl26f
	JK3zl+yrhTQl0yMi4amjSYGuUQdyqOR7t09LS1mHnWM3EYAmCMey+lk9mXK8LhON4Hof0OeM8+r
	gbGmXaQhns829JGLhj5yeiTicikf3Y45lGQLeHqgo2dlSONOeQEcCOJ4CfBmf+gA5cRrL9Y1Qxb
	1OESrqMohTikynF2Jr0Ql1uHnbKOyEGB5PgGxL9gFv/oFOydniId40HQmcezsy54yvBco2KnGuG
	quKcIMPUT4u0C+IooT1vTSNRSbcWc0LOnfmLNWK0Cjn+mlMeaviE8Iw8Ftk+ZGqKEMtRJkKe2xg
	YYRXjKRMNR1EHJfV8oP+Ks+b8fCOvVuPcyKcB5njM1ADIsmlgGPjY9Tt1D9pJd+7aAntjkpYeei
	1JigzF/0m7UbXNQzFWUVH8AobWMvwGN+o3Z/Zsb4toOWqNu9rSA
X-Received: by 2002:a05:6000:480f:b0:47f:8554:a341 with SMTP id ffacd0b85a97d-47fe81d131emr23983559f8f.13.1785921893765;
        Wed, 05 Aug 2026 02:24:53 -0700 (PDT)
Message-ID: <2ccead84-eaa4-428a-8684-da26874c05e9@suse.com>
Date: Wed, 5 Aug 2026 11:24:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v10 6/6] VMX: support MSR-IMM
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <81a2c636-5a74-41c3-81a2-3f49ed717744@suse.com>
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
In-Reply-To: <81a2c636-5a74-41c3-81a2-3f49ed717744@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1785921894-00ACCA5B-A4C27296/0/0
X-purgate-type: clean
X-purgate-size: 4687

Hook up the new VM exit codes and handle guest uses of the insns.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v10: Check feature bit in exit handler.
v9: New.
---
The lack of an enable bit is concerning; at least for the nested case
that's a security issue afaict (when L0 isn't aware of the insns, or more
specifically the exit codes).

--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -834,10 +834,11 @@ static void __init calculate_hvm_max_pol
         __clear_bit(X86_FEATURE_PKS, fs);
 
         /*
-         * Don't expose USER-MSR until it is known how (if at all) it is
-         * virtualized on SVM.
+         * Don't expose USER-MSR and MSR-IMM until it is known how (if at all)
+         * they are virtualized on SVM.
          */
         __clear_bit(X86_FEATURE_USER_MSR, fs);
+        __clear_bit(X86_FEATURE_MSR_IMM, fs);
     }
 
     if ( !cpu_has_vmx_msrlist )
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -453,7 +453,7 @@ void domain_cpu_policy_changed(struct do
     }
 
     /* Nested doesn't have the necessary processing, yet. */
-    if ( nestedhvm_enabled(d) && p->feat.user_msr )
+    if ( nestedhvm_enabled(d) && (p->feat.user_msr || p->feat.msr_imm) )
         return /* -EINVAL */;
 
     for_each_vcpu ( d, v )
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4712,6 +4712,14 @@ void asmlinkage vmx_vmexit_handler(struc
             hvm_inject_hw_exception(X86_EXC_GP, 0);
         break;
 
+    case EXIT_REASON_RDMSR_IMM:
+        /* Check the feature bit in lieu of an enable one. */
+        if ( !currd->arch.cpuid->feat.msr_imm )
+        {
+            hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
+            break;
+        }
+        fallthrough;
     case EXIT_REASON_URDMSR: /* NB: User-MSR bitmap was checked by the CPU. */
     {
         uint64_t msr_content = 0;
@@ -4721,7 +4729,7 @@ void asmlinkage vmx_vmexit_handler(struc
         {
         case X86EMUL_OKAY:
             *decode_gpr(regs, msr_imm_gpr()) = msr_content;
-            update_guest_eip(); /* Safe: URDMSR */
+            update_guest_eip(); /* Safe: URDMSR / RDMSR <imm> */
             break;
 
         case X86EMUL_EXCEPTION:
@@ -4731,6 +4739,14 @@ void asmlinkage vmx_vmexit_handler(struc
         break;
     }
 
+    case EXIT_REASON_WRMSRNS_IMM:
+        /* Check the feature bit in lieu of an enable one. */
+        if ( !currd->arch.cpuid->feat.msr_imm )
+        {
+            hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
+            break;
+        }
+        fallthrough;
     case EXIT_REASON_UWRMSR: /* NB: User-MSR bitmap was checked by the CPU. */
         exit_qualification = vmread(EXIT_QUALIFICATION);
         switch ( hvm_msr_write_intercept(exit_qualification,
@@ -4738,7 +4754,7 @@ void asmlinkage vmx_vmexit_handler(struc
                                          true) )
         {
         case X86EMUL_OKAY:
-            update_guest_eip(); /* Safe: UWRMSR */
+            update_guest_eip(); /* Safe: UWRMSR / WRMSRNS <imm> */
             break;
 
         case X86EMUL_EXCEPTION:
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -205,6 +205,8 @@ static inline void pi_clear_sn(struct pi
 #define EXIT_REASON_WRMSRLIST           79
 #define EXIT_REASON_URDMSR              80
 #define EXIT_REASON_UWRMSR              81
+#define EXIT_REASON_RDMSR_IMM           84
+#define EXIT_REASON_WRMSRNS_IMM         85
 /* Remember to also update VMX_PERF_EXIT_REASON_SIZE! */
 
 /*
--- a/xen/arch/x86/include/asm/perfc_defn.h
+++ b/xen/arch/x86/include/asm/perfc_defn.h
@@ -6,7 +6,7 @@ PERFCOUNTER_ARRAY(exceptions,
 
 #ifdef CONFIG_HVM
 
-#define VMX_PERF_EXIT_REASON_SIZE 82
+#define VMX_PERF_EXIT_REASON_SIZE 86
 #define VMEXIT_NPF_PERFC 166
 #define SVM_PERF_EXIT_REASON_SIZE (VMEXIT_NPF_PERFC + 1)
 PERFCOUNTER_ARRAY(vmexits,              "vmexits",
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -354,7 +354,7 @@ XEN_CPUFEATURE(MCDT_NO,            13*32
 XEN_CPUFEATURE(UC_LOCK_DIS,        13*32+ 6) /*   UC-lock disable */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.ecx, word 14 */
-XEN_CPUFEATURE(MSR_IMM,            14*32+ 5) /*   RDMSR/WRMSRNS with immediate operand */
+XEN_CPUFEATURE(MSR_IMM,            14*32+ 5) /*s  RDMSR/WRMSRNS with immediate operand */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.edx, word 15 */
 XEN_CPUFEATURE(AVX_VNNI_INT8,      15*32+ 4) /*A  AVX-VNNI-INT8 Instructions */


