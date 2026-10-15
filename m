Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C74CC6B34
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 09:10:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450084.1665597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHHTL-00086r-N2; Thu, 15 Oct 2026 09:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450084.1665597; Thu, 15 Oct 2026 09:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHHTL-00086k-Jw; Thu, 15 Oct 2026 09:09:59 +0000
Received: by outflank-mailman (input) for mailman id 1450084;
 Thu, 15 Oct 2026 09:09:57 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHHTJ-00086Z-LS
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 09:09:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHHTJ-006f9K-2B
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 11:09:57 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad0985e-bab6-0a2a0a5309dd-0a2a450ab7d4-16
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 11:09:56 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad09864-f2d2-0a2a450a0019-d155802ce43a-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 11:09:56 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4a17baef589so16282335e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 02:09:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0bc50e0sm23382287f8f.49.2026.10.15.02.09.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2026 02:09:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1792055396; x=1792660196; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FfAytH9CoSsG/4JADULfMO0l9a68bQmjhOGtCcq3NAA=;
        b=Qhazoehu8wvdjyV5UZzIK/akNa2WTK7B4puZhUEbYlJqYZ1WUt8YUeiVRYxcjfeQkI
         FdyAJbGGUUCetuFUYWfJ8gXf9Rjha0R+o5jonpI3FKpCOUlzCAQOLv5yxUhgTgRz3ZLs
         yeGwwg//T0hY8Q4Rrdh9xXwrg6kMJB4PSxvgH6qaWZsJL9kZohJjrWZciKZt9uyPJryF
         wNFV0hZdq2f/JKHHMtsq42EftVceekRKWfHZqOkNhlK4x4kjxwjqVYv5eZ+GWvK0L+ur
         4YbRfRrWJbBDpuuhmAsbAUbiWCv1Ungmogdxiz9pgd6xCOLF9u+JHEaeaWhger/uzmm6
         2szQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055396; x=1792660196;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FfAytH9CoSsG/4JADULfMO0l9a68bQmjhOGtCcq3NAA=;
        b=ytFHv8V3fvTcX2UlFk1jw5ZnCWP5oRLwDfw44ueh1+WNTwN8lI3Pq1mGJwbZGOyK9r
         k2C0J88LaiFRWY7luFe1Bp5nNRmdQzS6fJBow2kmwT2JCXGO9ZBpE/qWm77ZiHvnbsNh
         6k6MqxLnluYoak/bWH5Eran5jlhmkPB0Z3kbn2j1fzuYdcv+wnRTr8VXlWXxJrTlGPM0
         Leve0ngVDvsctaz+ByvNg1X0qHlU3et0Yxa2TYSDqn9vzxrpGfa2dgO+aTQtqPJUlWvt
         mSGuUg0Ot0YNmeu7WWVBz1CL5YX3fsdeo5bkcBWRXNUzcgcx+gXdyslRFqg53SiFJHaB
         GcdA==
X-Gm-Message-State: AFq9FYLljtyYKbGvwK9eXYSQljaOK8xMjFnp2ndWcA14dMAj3pnx+cRY
	Arqgqtpw8ABjMofXUCjKG6vP/cPxqgTciQh43SUA0IcRIkSikfLdLt205JIdPf8sbsn0yoJTITr
	C0LC5Xw==
X-Gm-Gg: AYBFou2ynX9E8FOECapOKcuGmUp+Dm1vhyAoTMHEtMQfZFxCJV3s52FjoPKotHgEU8F
	6dUIW+gJAccKsCYSF95YPalcQ7j5srecWhz5qRC0a5o7X6CWocN27ylgZvGHcrZr3c12riTgfwC
	1M9HA24os9KT4hauOI87YuERTyKNdisILS9QRwJ3e+iwYQGQyGFa3EDweiafrsuJZ/Bey/BfCQ2
	mKaKjeakE1d5NvFDMCQ9IDAfldIyiclH45DQaAi4Ghr3/SGNe94hH8pZL/IJVRBtPyN98gNOab9
	niCpi5x/DILebyHGIJuNsY9J3m26sC8UkXseH+qXD6Em8tq2rVDTFZNRFnbwjGumdR+fUdyKULE
	fG+3QZ8y0qxwzU2wnUXFrCZyihtZTYLKnuJiSaAP5tdQChiIuP02kZ5nwqLPjgYtbRXciD+IK28
	8VyqDfewX95dvAgNCx1caLGh1aF5myE1tZnBxlcjvND4kDz/UwTgU7xDfD0Xa1ki7unCOnOQqgz
	Vn6g6PuBRd/xGGWJs+BrfVMhiMu9apdTTGoemzzoad5nPNxadrFUwyMmFUVYA==
X-Received: by 2002:a05:600c:818d:b0:4a1:6c79:fd31 with SMTP id 5b1f17b1804b1-4a18e483231mr358300555e9.12.1792055396258;
        Thu, 15 Oct 2026 02:09:56 -0700 (PDT)
Message-ID: <d9543154-2d24-40ee-9ace-f1afbe06fd76@suse.com>
Date: Thu, 15 Oct 2026 11:09:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 1/3] x86: allow Kconfig control over psABI level to use
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>
References: <b6ae837e-293a-4c06-aefa-02a5b9cd2c3f@suse.com>
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
In-Reply-To: <b6ae837e-293a-4c06-aefa-02a5b9cd2c3f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1792055396-5A3DCCFC-D6A4BF8D/10/78276251493
X-purgate-type: spam
X-purgate-size: 10756

Newer hardware offers more efficient and/or flexible and/or capable
instructions, some of which we can make good use of in the hypervisor
as well. Allow a basic way (no alternatives patching) of enabling their
use. Of course this means that hypervisors thus built won't work
anymore on older, less capable hardware.

Since older compilers (apparently gcc10 / clang11 and older) won't
recognize -march=x86-64-v2 etc, also add fallback logic passing
-mpopcnt and alike explicitly.

Note that in efi_arch_cpu() the filling of 7c0 and 7d0 are forward-
looking; we only require 7b0, but we need to use cpuid_count() anyway.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TBD: While the added assembly code goes strictly from the CONFIG_*
     settings, EFI code uses the compiler provided manifest constants
     where available (just like the subsequent "x86: short-circuit
     certain cpu_has_* when x86-64-v{2,3} are in effect"). While I
     generally prefer it that way, this comes with a downside: If we
     ever started to use one of the ISA extensions in assembly code
     (and then keyed to the CONFIG_* settings), things could break. I
     don't view us doing this as very likely though, as then we'd need
     to have two (or more) variants of such assembly code, which we
     would likely want to avoid. (What I'd like to avoid is using the
     compiler manifest constants in assembly code: In principle we ought
     to filter out any -march= when constructing AFLAGS, and perhaps
     at least all -m... and -f... options. Compilers might rightfully
     complain about their use as inapplicable, much like we've seen for
     -Wl,... when no linking is done.)

TBD: While we don't document most "cpuid=no-*" options (and hence imply
     their use to be unsupported), using e.g. "cpuid=no-popcnt" with a
     V2=y hypervisor clearly can't have the intended effect, and hence
     might perhaps better be flagged in some way.

TBD: v2 also includes LAHF/SAHF. Since we don't use floating point and
     hence FPU insns, we ought to be okay not explicitly checking for
     it. But there is a certain amount of risk of the compiler finding
     some "smart" use for one or both of the insns. However, if we were
     to check the feature, we'd need to account for the quirk that
     init_amd() also works around.

Whereas the baseline -> v2 step isn't much of a difference (we'll gain
more there by a subsequent patch), v2 -> v3, while presumably (or shall
I say hopefully) faster, yields an overall growth of .text size by (in
my build) about 2k. The primary reason for this appear to be conversions
of SHL-by-immediate to SHLX.

The VGA output attempt in early (MB/MB2) boot code does not appear to
work (anymore?). The serial output may work, but only if - without any
setup in Xen - both sides agree on the serial settings (baud rate etc).
Hence the feature checks added on the legacy paths are of limited use.
---
v4: Correct __LZCNT__ check in efi_arch_cpu(). Drop CONFIG_UNSATISFIED_*
    part. Simplify logic in arch.mk, now that gcc5 is our baseline. Reduce
    code size in trampoline_setup. Re-base.
v3: Add fallback logic and use logic from new prereq change.
v2: Also cover XSAVE. Add early boot feature checking.

--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -116,6 +116,36 @@ config PV_LINEAR_PT
 
          If unsure, say Y.
 
+choice
+	prompt "base psABI level"
+	default X86_64_BASELINE
+	help
+	  The psABI defines 4 levels of ISA extension sets as a coarse granular
+	  way of identifying advanced functionality that would be uniformly
+	  available in respectively newer hardware.  While v4 is not really of
+	  interest for Xen, the others can be selected here, making the
+	  resulting Xen no longer work on older hardware.  This option won't
+	  have any effect if the toolchain doesn't support the distinction.
+
+	  If unsure, stick to the default.
+
+config X86_64_BASELINE
+	bool "baseline"
+
+config X86_64_V2
+	bool "v2"
+	help
+	  This enables POPCNT and CX16, besides other extensions which are of
+	  no interest here.
+
+config X86_64_V3
+	bool "v3"
+	help
+	  This enables BMI, BMI2, LZCNT, MOVBE, and XSAVE, besides other
+	  extensions which are of no interest here.
+
+endchoice
+
 source "arch/x86/hvm/Kconfig"
 
 config XEN_SHSTK
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -34,6 +34,27 @@ CFLAGS += -mno-red-zone -fpic
 # the SSE setup for variadic function calls.
 CFLAGS += -mno-mmx -mno-sse $(call cc-option,$(CC),-mskip-rax-setup)
 
+# Enable the selected baseline ABI, if supported by the compiler.
+x86-64-$(CONFIG_X86_64_BASELINE) :=
+x86-64-$(CONFIG_X86_64_V2) := x86-64-v2
+x86-64-$(CONFIG_X86_64_V3) := x86-64-v3
+
+ifneq ($(x86-64-y),)
+
+CFLAGS-psabi := $(call cc-option,$(CC),-march=$(x86-64-y))
+
+ifneq ($(CFLAGS-psabi),)
+CFLAGS += $(CFLAGS-psabi)
+else
+# Fall back to using the subset of -m... options that are of interest.
+x86-64-v2 := -mpopcnt -mcx16
+x86-64-v3 := $(x86-64-v2) -mbmi -mbmi2 -mlzcnt -mmovbe -mxsave
+CFLAGS-$(CONFIG_X86_64_V2) += $(x86-64-v2)
+CFLAGS-$(CONFIG_X86_64_V3) += $(x86-64-v3)
+endif # CFLAGS-psabi
+
+endif # x86-64-y
+
 ifeq ($(CONFIG_INDIRECT_THUNK),y)
 # Compile with gcc thunk-extern, indirect-branch-register if available.
 CFLAGS-$(CONFIG_CC_IS_GCC) += -mindirect-branch=thunk-extern
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -136,6 +136,12 @@ multiboot2_header:
 #ifdef CONFIG_REQUIRE_NX
 .Lno_nx_msg:   .asciz "ERR: Not an NX-capable CPU!"
 #endif
+#if defined(CONFIG_X86_64_V2) || defined(CONFIG_X86_64_V3)
+.Lno_x86_64_v2_msg: .asciz "ERR: Not an x86-64-v2 capable CPU!"
+#endif
+#ifdef CONFIG_X86_64_V3
+.Lno_x86_64_v3_msg: .asciz "ERR: Not an x86-64-v3 capable CPU!"
+#endif
 
         .section .init.data, "aw", @progbits
         .subsection 1 /* Put data here after the page tables (in x86_64.S). */
@@ -169,9 +175,20 @@ early_error: /* Here to improve the disa
         jmp     .Lget_vtb
 #ifdef CONFIG_REQUIRE_NX
 .Lno_nx:
+        pop     %ecx
         mov     $sym_offs(.Lno_nx_msg), %ecx
         jmp     .Lget_vtb
 #endif
+#if defined(CONFIG_X86_64_V2) || defined(CONFIG_X86_64_V3)
+.Lno_x86_64_v2:
+        mov     $sym_offs(.Lno_x86_64_v2_msg), %ecx
+        jmp     .Lget_vtb
+#endif
+#ifdef CONFIG_X86_64_V3
+.Lno_x86_64_v3:
+        mov     $sym_offs(.Lno_x86_64_v3_msg), %ecx
+        jmp     .Lget_vtb
+#endif
 .Lmb2_no_bs:
         /*
          * Ditto. Additionally, here there is a chance that Xen was started
@@ -532,6 +549,7 @@ trampoline_setup:
         mov     $1, %eax
         cpuid
         mov     %ecx, CPUINFO_FEATURE_OFFSET(X86_FEATURE_HYPERVISOR) + sym_esi(boot_cpu_data)
+        mov     %ecx, %edi
 
         mov     $0x80000000,%eax
         cpuid
@@ -549,6 +567,9 @@ trampoline_setup:
         bt      $cpufeat_bit(X86_FEATURE_LM),%edx
         jnc     .Lbad_cpu
 
+        /* Preserve %ecx for later use. */
+        push    %ecx
+
         /*
          * Check for NX
          *   - If Xen was compiled requiring it simply assert it's
@@ -599,6 +620,36 @@ trampoline_setup:
 .Lno_nx:
 #endif
 
+        /* Restore CPUID[80000001].ecx output. */
+        pop     %ecx
+
+#if defined(CONFIG_X86_64_V2) || defined(CONFIG_X86_64_V3)
+        mov     %edi, %eax
+        or      $cpufeat_mask(X86_FEATURE_POPCNT) | cpufeat_mask(X86_FEATURE_CX16), %eax
+        cmp     %edi, %eax
+        jne     .Lno_x86_64_v2
+#endif
+
+#ifdef CONFIG_X86_64_V3
+        mov     %edi, %eax
+        or      $cpufeat_mask(X86_FEATURE_MOVBE) | cpufeat_mask(X86_FEATURE_XSAVE), %eax
+        cmp     %edi, %eax
+        jne     .Lno_x86_64_v3
+        bt      $cpufeat_bit(X86_FEATURE_ABM), %ecx
+        jnc     .Lno_x86_64_v3
+        xor     %eax, %eax
+        cpuid
+        cmp     $7, %eax
+        jb      .Lno_x86_64_v3
+        mov     $7, %eax
+        xor     %ecx, %ecx
+        cpuid
+        mov     %ebx, %eax
+        or      $cpufeat_mask(X86_FEATURE_BMI1) | cpufeat_mask(X86_FEATURE_BMI2), %eax
+        cmp     %ebx, %eax
+        jne     .Lno_x86_64_v3
+#endif
+
         /* Stash TSC to calculate a good approximation of time-since-boot */
         rdtsc
         mov     %eax,     sym_esi(boot_tsc_stamp)
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -742,29 +742,53 @@ static void __init efi_arch_handle_modul
 
 static void __init efi_arch_cpu(void)
 {
-    uint32_t eax = cpuid_eax(0x80000000U);
+    uint32_t eax = cpuid_eax(0), dummy;
     uint32_t *caps = boot_cpu_data.x86_capability;
 
     boot_tsc_stamp = rdtsc();
 
-    caps[FEATURESET_1c] = cpuid_ecx(1);
+    if ( eax )
+        caps[FEATURESET_1c] = cpuid_ecx(1);
 
+    if ( eax >= 7 )
+        cpuid_count(7, 0, &dummy,
+                    &caps[FEATURESET_7b0],
+                    &caps[FEATURESET_7c0],
+                    &caps[FEATURESET_7d0]);
+
+    eax = cpuid_eax(0x80000000U);
     if ( (eax >> 16) == 0x8000 && eax > 0x80000000U )
-    {
-        caps[FEATURESET_e1d] = cpuid_edx(0x80000001U);
+        cpuid(0x80000001U, &dummy, &dummy,
+              &caps[FEATURESET_e1c], &caps[FEATURESET_e1d]);
+
+    /*
+     * Checks here purposefully don't use cpu_has_* because they bypass
+     * boot_cpu_data reads if Xen was compiled with respective CONFIG_*.
+     */
+#define CHK(ppsym, feat) do {                                        \
+        if ( IS_ENABLED(ppsym) &&                                    \
+             !boot_cpu_has(X86_FEATURE_ ## feat) )                   \
+            blexit(L"This build of Xen requires " #feat " support"); \
+    } while ( false )
+
+    CHK(CONFIG_REQUIRE_NX, NX);
+
+    /* x86-64-v2 */
+    CHK(__POPCNT__, POPCNT);
+    CHK(CONFIG_X86_64_V2, CX16);
+    CHK(CONFIG_X86_64_V3, CX16);
+
+    /* x86-64-v3 */
+    CHK(__LZCNT__, ABM);
+    CHK(__BMI__, BMI1);
+    CHK(__BMI2__, BMI2);
+    CHK(__MOVBE__, MOVBE);
+    CHK(__XSAVE__, XSAVE);
+
+#undef CHK
 
-        /*
-         * This check purposefully doesn't use cpu_has_nx because
-         * cpu_has_nx bypasses the boot_cpu_data read if Xen was compiled
-         * with CONFIG_REQUIRE_NX
-         */
-        if ( IS_ENABLED(CONFIG_REQUIRE_NX) &&
-             !boot_cpu_has(X86_FEATURE_NX) )
-            blexit(L"This build of Xen requires NX support");
-
-        if ( cpu_has_nx )
-            trampoline_efer |= EFER_NXE;
-    }
+    if ( cpu_has_nx )
+        trampoline_efer |= EFER_NXE;
 }
 
 static void __init efi_arch_blexit(void)


