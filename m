Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFABC53219
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 10:26:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371542.1619036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woIXn-0000th-NC; Mon, 27 Jul 2026 10:26:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371542.1619036; Mon, 27 Jul 2026 10:26:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woIXn-0000ta-KJ; Mon, 27 Jul 2026 10:26:47 +0000
Received: by outflank-mailman (input) for mailman id 1371542;
 Mon, 27 Jul 2026 10:26:46 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woIXl-0000tL-SI
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 10:26:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woIXl-00DYXp-8V
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 12:26:45 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a673253-5cb7-0a2a0a5109dd-0a2a4502c71e-26
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 12:26:45 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a673265-6ca4-0a2a45020019-d155dd33b461-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 12:26:45 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-47f81a3ccf9so1543691f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 03:26:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f9c4fe4c5sm28224132f8f.12.2026.07.27.03.26.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2026 03:26:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1785148004; x=1785752804; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Eq3L92UEoRxPUDevKKidczlzaLrrDa3AHj+IVLVm+uI=;
        b=DaGdObOTAXmM5M+BJUbSGDeIQgCvWBe/d1LjvpdwyQh6GWVdg2qSX0s91djEQmsK9i
         Rxzs459hWzo37t5h7PVDdOB2gKuHsxN9rXOo4W1lfkrjnCj3wvsOu8SVhz74JxcJJK42
         Sdq0iEJV7Qf610f3tj5tq4N2+bZGAB7PKa3Rt07xvFd2+O/AL5n6X2haqFFu6zE8hew9
         Uc8NmFc1k1UVHXJ1zGGZ1OE7QX570x2EW9H838Mm7olv5IboRK66nUKZoxCd0c/cCk8y
         xdCyEIWEvfDQi8D8NbSYA+x0U368Mulj0CycA6GsbYMjPT0MUu5pdpPlp9hzieheMnpq
         mlfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785148004; x=1785752804;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Eq3L92UEoRxPUDevKKidczlzaLrrDa3AHj+IVLVm+uI=;
        b=e7Tjjtgh8HkeIooV7XSp/bpkCPaik2USpkioBNNcVa8mx8GHAOxM6a/R3eaT4D7LOZ
         n7rbDAlHUcFvjsF8+1cxFFN/8aNeOAQnVlrHb4K3pMmY7B6d4tEdn3XIUhSzOgpTfbHV
         Bvcmd+2GM6YbNUmwzinSmSUXHa+zvD+w/IulHaD2QjMcHtZvIwcNkDwiD+BG5jwUCJcn
         MpIChFMhHxSV4gcuqrTMdYxDR1FEftGt6apZprG0ALFLSjq2RzPLED3KDSU9/DoiXIyG
         /nTPwY4rK+i49MGVG4hTRybf48nUamlp/FCRX/zymMj/Wi19b12c+Cox6Hf9RcAprAM0
         oT6A==
X-Gm-Message-State: AOJu0YzVlJU4p1Y92Pol5v4Dgj7rWd4b6e6vuSnk/kSxlLBD3ePqQLjD
	91gh3uZJ6MdOqHLME5J/MXtJG36uM8Sexl9TvS2NjZ26DcKsNhKrzwqhsQ3DfOTXP1aOMU7kDAe
	RfytCjA==
X-Gm-Gg: AR+sD13KsGBKZGcVm4Y009IGmiBKCcp2n5eGb9eilfFdUBAkSXtaNIJZ8pw/N7LDkGT
	z9dkKryVWUL3Qxg532kWa5gKSiJf4m4pLVZmQC8XII7jMY6tWiq9lIpO6xwIDHBkYNuAzgNknyp
	K9p9llciHLWXCDMYGrgocqI0Uj8YFVAaaPrg5Ovtr/8MH8TqiT/MZoP9F2wnTEbeaq9ZUMeT42g
	gzhpEW8mMUqKbfF62eRTCTgytTD6aGIg1bCzq9/MxUcPRy32s80Anht7n9aK7oOT1nj394a4ChU
	JKODGkvPHHeuCW7uXWj8f3ubV6BlSAablfXNOkJRq4XE3pOrIAEO6GXj+erdl7I3ypn5xrIkC5c
	ucKBUwZZYEttPRPdgVZJ8ycx7/0pWT6xa6X3Azk+b8t3W+5IM+cXVoI7C5mk+6yptSSTOVa95Bq
	6GA3jGUvN3pFQoBqiE1rRykeS7r+9Snx36k5Rkc2zyLTiaQC784pG4kJd9SUtxqgOfUg==
X-Received: by 2002:a05:6000:480d:b0:476:681c:4642 with SMTP id ffacd0b85a97d-47f9feabd4dmr9936682f8f.44.1785148004570;
        Mon, 27 Jul 2026 03:26:44 -0700 (PDT)
Message-ID: <26f23087-e864-47de-84b9-0e3dc10dc941@suse.com>
Date: Mon, 27 Jul 2026 12:26:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 1/4] x86: record SSP at non-guest entry points
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <f6dd91c2-f43a-4c9a-89f3-a42c8b954959@suse.com>
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
In-Reply-To: <f6dd91c2-f43a-4c9a-89f3-a42c8b954959@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1785148005-319CB2AC-99764C5A/0/0
X-purgate-type: clean
X-purgate-size: 6127

We will want to use that value for call trace generation, and likely
also to eliminate the somewhat fragile shadow stack searching done in
fixup_exception_return(). For those purposes, guest-only entry points do
not need to record that value.

To keep the saving code simple, record our own SSP that corresponds to
an exception frame, pointing to the top of the shadow stack counterpart
of what the CPU has saved on the regular stack. Consuming code can then
work its way from there.

In SAVE_ALL / RESTORE_ALL simply drop the use of UREGS_r15. We want the
full size in all cases, so what exactly the top-of-stack field is going
to be (whose UREGS_* is 0 anyway) doesn't matter this much there. This
way we don't need to distinguish between XEN_SHSTK=y and XEN_SHSTK=n.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: Re-base.
v3: Put new field at the front of struct cpu_user_regs.
v2: Add comment ahead of SAVE_ALL. Add comma between its parameters.
    Re-base.

--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -89,7 +89,7 @@ __UNLIKELY_END(nsvm_hap)
 
         vmrun
 
-        PUSH_AND_CLEAR_GPRS
+        PUSH_AND_CLEAR_GPRS ssp=0
 
         GET_CURRENT(bx)
 
--- a/xen/arch/x86/hvm/vmx/entry.S
+++ b/xen/arch/x86/hvm/vmx/entry.S
@@ -22,7 +22,7 @@
 #include <asm/page.h>
 
 FUNC(vmx_asm_vmexit_handler)
-        PUSH_AND_CLEAR_GPRS
+        PUSH_AND_CLEAR_GPRS ssp=0
 
         mov  %cr2,%rax
         GET_CURRENT(bx)
@@ -157,7 +157,7 @@ UNLIKELY_END(realmode)
 
 .Lvmx_vmentry_fail:
         sti
-        PUSH_AND_CLEAR_GPRS
+        PUSH_AND_CLEAR_GPRS ssp=0
 
         /*
          * SPEC_CTRL_ENTRY notes
--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -220,9 +220,11 @@ static always_inline void stac(void)
 
 #ifdef __ASSEMBLER__
 /*
- * Push and clear GPRs
+ * Push and clear GPRs.
+ *
+ * Use sites may override ssp to 0. It should never be overridden to 1.
  */
-.macro PUSH_AND_CLEAR_GPRS
+.macro PUSH_AND_CLEAR_GPRS ssp=IS_ENABLED(CONFIG_XEN_SHSTK)
         push  %rdi
         xor   %edi, %edi
         push  %rsi
@@ -233,6 +235,9 @@ static always_inline void stac(void)
         xor   %ecx, %ecx
         push  %rax
         xor   %eax, %eax
+ .if \ssp
+        rdsspq %rcx
+ .endif
         push  %r8
         xor   %r8d, %r8d
         push  %r9
@@ -259,12 +264,18 @@ static always_inline void stac(void)
         xor   %r14d, %r14d
         push  %r15
         xor   %r15d, %r15d
+#ifdef CONFIG_XEN_SHSTK
+        push  %rcx
+#endif
 .endm
 
 /*
  * POP GPRs from a UREGS_* frame on the stack.  Does not modify flags.
  */
 .macro POP_GPRS skip_rax=0
+#ifdef CONFIG_XEN_SHSTK
+        pop   %rcx
+#endif
         pop   %r15
         pop   %r14
         pop   %r13
--- a/xen/arch/x86/include/asm/cpu-user-regs.h
+++ b/xen/arch/x86/include/asm/cpu-user-regs.h
@@ -11,6 +11,15 @@
  */
 struct cpu_user_regs
 {
+#ifdef CONFIG_XEN_SHSTK
+    /*
+     * This points _at_ the corresponding shadow stack frame; it is _not_ the
+     * outer context's SSP.  That, if the outer context has CET-SS enabled,
+     * is stored in the top slot of the pointed to shadow stack.
+     */
+    uint64_t entry_ssp;
+#endif
+
     union { uint64_t r15;    uint32_t r15d;   uint16_t r15w;  uint8_t r15b; };
     union { uint64_t r14;    uint32_t r14d;   uint16_t r14w;  uint8_t r14b; };
     union { uint64_t r13;    uint32_t r13d;   uint16_t r13w;  uint8_t r13b; };
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -53,6 +53,9 @@ void __dummy__(void)
     OFFSET(UREGS_eflags, struct cpu_user_regs, rflags);
     OFFSET(UREGS_rsp, struct cpu_user_regs, rsp);
     OFFSET(UREGS_ss, struct cpu_user_regs, ss);
+#ifdef CONFIG_XEN_SHSTK
+    OFFSET(UREGS_entry_ssp, struct cpu_user_regs, entry_ssp);
+#endif
     DEFINE(UREGS_kernel_sizeof, sizeof(struct cpu_user_regs));
     BLANK();
 
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -18,7 +18,7 @@ FUNC(entry_int82)
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $0
         movb  $HYPERCALL_VECTOR, EFRAME_entry_vector(%rsp)
-        PUSH_AND_CLEAR_GPRS
+        PUSH_AND_CLEAR_GPRS ssp=0
 
         GET_STACK_END(14)
 
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -305,7 +305,7 @@ FUNC(lstar_enter)
         pushq $0
         BUILD_BUG_ON(TRAP_syscall & 0xff)
         movb  $TRAP_syscall >> 8, EFRAME_entry_vector + 1(%rsp)
-        PUSH_AND_CLEAR_GPRS
+        PUSH_AND_CLEAR_GPRS ssp=0
 
         GET_STACK_END(14)
 
@@ -345,7 +345,7 @@ FUNC(cstar_enter)
         pushq $0
         BUILD_BUG_ON(TRAP_syscall & 0xff)
         movb  $TRAP_syscall >> 8, EFRAME_entry_vector + 1(%rsp)
-        PUSH_AND_CLEAR_GPRS
+        PUSH_AND_CLEAR_GPRS ssp=0
 
         GET_STACK_END(14)
 
@@ -390,7 +390,7 @@ LABEL(sysenter_eflags_saved, 0)
         pushq $0
         BUILD_BUG_ON(TRAP_syscall & 0xff)
         movb  $TRAP_syscall >> 8, EFRAME_entry_vector + 1(%rsp)
-        PUSH_AND_CLEAR_GPRS
+        PUSH_AND_CLEAR_GPRS ssp=0
 
         GET_STACK_END(14)
 
@@ -447,7 +447,7 @@ FUNC(entry_int80)
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $0
         movb  $0x80, EFRAME_entry_vector(%rsp)
-        PUSH_AND_CLEAR_GPRS
+        PUSH_AND_CLEAR_GPRS ssp=0
 
         GET_STACK_END(14)
 
--- a/xen/arch/x86/x86_64/entry-fred.S
+++ b/xen/arch/x86/x86_64/entry-fred.S
@@ -11,7 +11,7 @@
         /* The Ring3 entry point is required to be 4k aligned. */
 
 FUNC(entry_FRED_R3, 4096)
-        PUSH_AND_CLEAR_GPRS
+        PUSH_AND_CLEAR_GPRS ssp=0
 
         mov     %rsp, %rdi
         call    entry_from_pv
@@ -54,7 +54,7 @@ LABEL(eretu, 0)
 END(eretu_exit_to_guest)
 
 FUNC(eretu_error_dom_crash)
-        PUSH_AND_CLEAR_GPRS
+        PUSH_AND_CLEAR_GPRS ssp=0
         sti
         call    asm_domain_crash_synchronous  /* Does not return */
 END(eretu_error_dom_crash)


